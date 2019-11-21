import classes.Characters.Frostwyrm;

//	 @author DrunkZombie Not original author, just made changes for Nykke black scales content, so if something got broke bitch at him
//[NYKKE_VERSION] 1 = original (nykke.as), 2 or anything else = new 2.0 version (nykke2.as)
public function HereBeDragonBonus():Boolean
{
	//unless the version toggle is set to 1 set the version to 2 which turns off nykke 1.0 and turns on nykke 2.0.
	if (flags["NYKKE_VERSION_TOGGLE"] == 1) flags["NYKKE_VERSION"] = 1;
	else flags["NYKKE_VERSION"] = 2;
	
	if (flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	//encounter nykke 2.0
	if(nykke2IntroOK() && flags["UVETOCOAST_STEP"] >= 7)
	{
		flags["UVETOCOAST_STEP"] = 0;
		nykke2Intro();
		return true;
	}
	if (nykke2SteeleCanSatisfy() && flags["NYKKE_MET2"] == 1 && flags["NYKKE_VERSION"] != 1)
	{
		addButton(1, "Call Nykke", nykke2CallHer, undefined, "Call Nykke", "Make contact with Nykke.");
	}
	
	if (flags["FROSTWYRMSLAIN"] == 1 || flags["FROSTWYRM_DISABLED"] != undefined) return false;
	
	//Always encounter Frostwyrm first time
	if(flags["MET_FROSTWYRM"] == undefined)
	{
		flags["UVETOCOAST_STEP"] = 0;
		encounterFrostwyrm();
		return true;
	}
	
	IncrementFlag("UVETOCOAST_STEP");

	var choices:Array = new Array();
	//If walked far enough w/o an encounter (temporary values, should be replaced when moved to Glacial Rift)
	if(flags["UVETOCOAST_STEP"] >= 7 && rand(2) == 0) {
		//Reset step counter
		flags["UVETOCOAST_STEP"] = 0;
		
		if(flags["FROSTWYRM_NOT_HOSTILE"] == undefined)
		{
			//Build encounter
			encounterFrostwyrm();
			return true;
		}
	}
	
	if(flags["FROSTWYRM_NOT_HOSTILE"] != undefined)
	{
		output("\n\nThe shore here is where you can summon");
		
		if(flags["FROSTWYRM_NOT_HOSTILE"] < 2)
		{
			output(" the Frostwyrm.");
			if(!pc.hasGenitals()) {
				output(".. that is, if you had the equipment useful for breeding...");
				addDisabledButton(0, "Frostwyrm", "Call The Frostwyrm", "You need genitals to interact with the frostwyrm.");
			}
			else if((!pc.hasVagina() && pc.hasCock() && pc.virility() <= 0) || (!pc.hasCock() && pc.hasVagina() && pc.fertility() <= 0)) {
				output(".. but being that breeding is the objective, maybe you should have more " + ((pc.hasCock() && pc.virility() <= 0) ? "virile" : "fertile") + " genitalia first?");
				addDisabledButton(0, "Frostwyrm", "Call The Frostwyrm", "Your genitalia are not fit for breeding--make sure you are fertile before summoning the dragon!");
			}
			else if(!pc.hasCock() && pc.hasVagina() && pc.hasPregnancyOfTypeOtherThan("FrostwyrmPregnancy")) {
				output(".. though breeding while you are a carrying mother might not be the best idea. Perhaps you should return after you’ve given birth to your current pregnancy first?");
				addDisabledButton(0, "Frostwyrm", "Call The Frostwyrm", "You already have a bun in the oven, so make sure you are clear of your current pregnancies before summoning the dragon!");
			}
			else {
				output(" Are you are fully prepared for the coming breeding session?");
				addButton(0, "Frostwyrm", frostyReadyToBang, undefined, "Call The Frostwyrm", "Make contact with the frostwyrm and get ready for the breeding!");
			}
		}
		else
		{
			output(" [frostwyrm.name].");
			addButton(0, frostwyrm.short, frostwyrmPickMeUpBaby, undefined, "Call [frostwyrm.name]", "Make contact with the frostwyrm.");
		}
	}
	
	if (tryUvetoWeatherEvent(flags["UVETOCOAST_STEP"])) return true;
	if (tryEncounterSavicite(flags["UVETOCOAST_STEP"])) return true;
	if (tryEncounterLucinite(flags["UVETOCOAST_STEP"],true)) return true;
	
	return false;
}

public function frostWyrmHeader():void
{
	showFrostWyrm();
	author("Savin");
}
public function showFrostWyrm():void
{
	showName("\n" + (flags["FROSTWYRM_NOT_HOSTILE"] >= 2 ? frostwyrm.short.toUpperCase() : "FROSTWYRM"));
	showBust("FROSTWYRM");
}
public function frostWyrmlingHeader(nude:Boolean = false):void
{
	if(flags["FROSTWYRM_KIP_COUNT"] == 1 && flags["NYKKE_VERSION"] == 1) { nykkeHeader(nude); return; }
	
	showName("FROST-\nWYRMLINGS");
	if (flags["NYKKE_VERSION"] == 1) showBust(nykkeBustDisplay(nude));
	else showBust(frostwyrmlingBustDisplay(nude));
	if(flags["FROSTWYRM_KIP_COUNT"] >= 2) addBust(frostwyrmlingBustDisplay(nude));
	if(flags["FROSTWYRM_KIP_COUNT"] >= 3) addBust(frostwyrmlingBustDisplay(nude));
	if(flags["FROSTWYRM_KIP_COUNT"] >= 4) addBust(frostwyrmlingBustDisplay(nude));
	author("B");
}
public function frostwyrmlingBustDisplay(nude:Boolean = false):String
{
	return ("FROSTWYRMLING" + (nude ? "_NUDE":""));
}
public function getFrostwyrmlingPregContainer():PregnancyPlaceholder
{
	var ppFrostwyrmling:PregnancyPlaceholder = new PregnancyPlaceholder();
	if (!ppFrostwyrmling.hasCock()) ppFrostwyrmling.createCock();
	ppFrostwyrmling.shiftCock(0, GLOBAL.TYPE_FROSTWYRM);
	ppFrostwyrmling.cocks[0].cLengthRaw = 12;
	ppFrostwyrmling.cocks[0].cThicknessRatioRaw = 2.5;
	ppFrostwyrmling.createPerk("Fixed CumQ", 450000, 0, 0, 0);
	
	//ppFrostwyrmling.impregnationType = "FrostwyrmPregnancy";
	
	return ppFrostwyrmling;
}

//Encounter Text
public function encounterFrostwyrm():void
{
	// Gender-assignment hotfix
	frostwyrm.createStatusEffect("Force It Gender");
	frostwyrm.removeStatusEffect("Force Fem Gender");
	
	clearOutput();
	frostWyrmHeader();
	
	//First time
	if (flags["MET_FROSTWYRM"] == undefined)
	{
		output("As you’re moving across the broad, flat cliffs of the glacial coastlands, your eyes are constantly drawn to the beautiful vista to the east: the calm, icy ocean that stretches out as far as the eye can see. Mist is rolling across the water ");
		if(hours < 6 || hours > 18) output("tonight");
		else output("today");
		output(", billowing up against the frozen cliffs beneath you. It’s eerily beautiful.");
		output("\n\nWhile you’re gazing out across the waters, though, you start to think you can hear something odd over the sound of crashing waves. You squint out across the cliffs, trying to find the source of the noise...");
		output("\n\nThe source finds you, it turns out. A huge, flying shape rockets up from the cliffside just in front of you, soaring into the sky with a bellowing roar that cracks the ice around you. You leap back, desperately scrambling away from the behemoth creature as it tumbles in the air and dives back down. It slams into the icy ground just ahead of you, sending out shockwaves that nearly topple you over."); 
		output("\n\nWhen the dusty snow clears from the air, you can’t help your eyes going wide as you’re able to see the creature. Every fantasy holo you’ve ever seen comes rushing back to you all at once as the towering white-scaled reptile stalks forward, revealing a serpentine body propped up on six muscular legs, and a pair of leathery wings wrapping around it. The creature regards you with four red eyes, set deep behind a lizard-like face full of teeth, each as long and sharp as a broadsword."); 
		output("\n\nThe creature strides forward, growling with bestial menace. Your codex makes an alarmed bleeping noise, alerting you to the presence of a creature called a “Frostwyrm,” to be avoided at all costs."); 
		output("\n\nAll you can do is pull your [pc.mainWeapon] out and prepare to defend yourself from what could only be described as a motherfucking <i>dragon</i>.");
	}
	//Repeat encounter
	else
	{
		output("You hear a familiar, bestial roar overhead. Looking up, you can clearly see the outline of a massive winged creature soaring through the sky, circling you. Oh, shit. You get your [pc.mainWeapon] ready as the draconic frostwyrm does a barrel roll and dives down, slamming into the snow just a short ways ahead of you. It lets out a fearsome battle roar and stalks towards you, a dark shape through the haze of billowing snow.");
	}
	IncrementFlag("MET_FROSTWYRM");
	CodexManager.unlockEntry("Frostwyrm");
	
	clearMenu();
	addButton(0,"Fight",fightFrostwyrm); //Yes, please turn me into a dragon's slave
	addButton(1,"Flee",fleeFrostwyrm,undefined,"Run Away","Sometimes discretion is the better part of valor"); //No, I am sane
}

public function fightFrostwyrm():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Frostwyrm());
	CombatManager.victoryScene(frostwyrmPCVictory);
	CombatManager.lossScene(frostwyrmPCLoss);
	CombatManager.displayLocation("FROSTWYRM");
	CombatManager.beginCombat();
}

public function fleeFrostwyrm():void
{
	clearOutput();
	frostWyrmHeader();
	author("Neoptolemus");
	
	output("You’ve gone toe to toe with some terrifying foes in your time. But there’s no way you’re going to fight <b>that</b>. Instead, adrenaline pumping, you break into a desperate sprint away from the gigantic lizard behind you. When you hazard a glance back over your shoulder the frostwyrm doesn’t seem to have given chase at all, although those four draconic eyes are still fixed on you.");
	output("\n\nWhat feels like an eternity latter, the wyrm beats its wings and takes off again, flying back the way it came. You take a few minutes to recover your breath, by then the beast is completely out of sight.");
	
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function frostwyrmPCVictory():void
{
	clearOutput();
	frostWyrmHeader();
	
	output("With a pathetic groan, the beast finally collapses. It topples onto its side, surrounded by a billow of snow that spews into the air. Its tail thrashes, wings beating weakly as it slips out of consciousness.");
	output("\n\nTentatively, wary of a trap, you approach the defeated creature with weapon at the ready. Waving snow out of your face, you manage to lock gaze with a pair of small black eyes, looking up at you with what you can only imagine is fear. ");
	if (silly) output("It’s afraid!");
	else output("The creature knows it has lost, and is utterly at your mercy.");
	output("\n\nWhat do you do?");
	
	IncrementFlag("FROSTWYRM_VICTORY_COUNT");
	
	processTime(5);
	
	addButton(0,"Kill It",slayFrostwyrm,undefined,"Kill It","This creature will only threaten you again. Kill it now, and save yourself from future battles.");
	addButton(1,"Leave It",leaveFrostwyrm,undefined);
}

public function slayFrostwyrm():void
{
	clearOutput();
	frostWyrmHeader();
	
	pc.createKeyItem("Frostwyrm Scales");
	flags["FROSTWYRMSLAIN"] = 1;
	
	output("You will not be threatened by this creature again. You bring your weapon to bear and finish it quickly. The frostwyrm dies with a pathetic screech, and then falls still and silent.");
	output(" Once it’s gone, you spend a few minutes harvesting some of its scales and leather -- you could probably get something cool made out of it.\n\n");
	
	processTime(15);
	CombatManager.genericVictory();
}

public function leaveFrostwyrm():void
{
	clearOutput();
	frostWyrmHeader();
	
	output("You turn away from the creature and head back into the snow-blasted glacier, leaving it to its fate. A few moments later, you hear a roar behind you and the sound of the great beast taking flight.");
	output("\n\nSomething tells you you’ll see it again, once it’s had time to lick its wounds.\n\n");
	
	processTime(1);
	CombatManager.genericVictory();
}

public function frostwyrmPCLoss():void
{
	if (flags["FROSTWYRM_VICTORY_COUNT"] >= 3 && ((pc.hasCock() && pc.virility() > 0) || (pc.hasVagina() && pc.fertility() > 0)))
	{
		clearOutput();
		frostWyrmHeader();
		author("B");
		
		output("With a final gasp, you crumple to the ground, utterly defeated. Your gaze is cast down to the ice and snow beneath you as you pant");
		if (pc.lust() >= 100) output(" in lust");
		else output("");
		output(", then, as you hear the rumblings of the giant Frostwyrm pace before you, you muster the nerve and the strength to stare it in the eye.");
		output("\n\nThe creature’s scaly skin is pockmarked by scars and nicks in its otherwise smooth frame, evidence of not only your past encounters of it, but your victories. Now that the situation’s been reversed");
		if (flags["FROSTWYRMWARNING"] == 1) output(" a second time")
		output(", you hope beyond hope that the creature is compassionate enough to realize that you’ve spared it every time already, and that it’ll extend the same mercy to you.");
		output("\n\nThe Frostwyrm bends its long neck towards you, its enormous maw open and its hot breath washing over your prone");
		if (pc.HP() == 0) output(" and beaten");
		output(" form. Its four flame-red eyes bore into you, studying you – it paces indecisively before you, wary and cautious, clearly familiar with you and your previous victories. That it hasn’t yet eaten you, you take as a good sign.");
		if (flags["FROSTWYRMWARNING"] == 1) output(" You haven’t forgotten its warning the last time it defeated you.");
		output("\n\nIt leans forward and, with a flair of the nostrils and a huff from its massive lungs, it snorts in your face. You suddenly feel a sensation in the back of your head.");
		if (flags["FROSTWYRMWARNING"] == 1) output(" You brace for the sharp pain that came last time this happened, but this time is different.");
		output(" It’s a light pressure that you can only describe as insistent, but not forceful, urging you to <i>something.</i> The edges of your vision grow clouded, yet you see the Frostwyrm before you with a sudden, sharp clarity, undistracted by the pangs of your most recent loss.");
		output("\n\nA voice pounds between your ears, bestial and guttural, yet soft as a whisper. <i>Why do you haunt me?</i> it asks slowly. <i>Each time we’ve met, we’ve done combat, and every time but now, you’ve bested me. You do not seek the thrill of the kill. You do not hunt for my lair. What is your goal?</i>");
		output("\n\nThe Frostwyrm sits on its haunches, awaiting your reply. You hesitate, wondering if it’s an actual question, and then, honestly, you struggle to think of any single, reasonable answer. What possessed you to explore the frozen, restricting wastes of Uveto and scour its eastern coastline, knowing that a Frostwyrm claimed it as its territory?");
		if (pc.isBimbo()) output(" To be honest, there’s only one reason that immediately pops into your head. You’re... sexually-minded a lot of the time, and, like, there aren’t a lot of creatures that are as big, like, physically, in the universe. Imagine the cheers you’d get if you told everyone that you tamed a Frostwyrm to the point of it allowing you to fuck it!");
		else output(" You answer that you’ve never put much thought into the <i>why</i>, other than because... it exists. The satisfaction of asserting your superiority over a creature as glorious and mythical as a Frostwyrm is one that you’ve never heard another person rightfully boast.");
		output("\n\nThe creature huffs once in frustration, its four eyes narrowing on yours. <i>How cruel,</i> it says. <i>My kind are so few now. You would play with extinguishing a species so that you can crow about it to other " + plural(pc.race()) + ". All I wish is to protect my domain.</i>");
		output("\n\nYou remain silent as the beast criticizes you and your brash way of thinking. <i>That said,</i> it continues, a heavy sigh flaring its nostrils once again, <i>you have proven yourself quite capable. I have existed for many Sky Cycles, and I have battled many peoples and creatures before you. You are the first to not only best me, but to do so consistently. Consider your ‘superiority’ asserted, [pc.race]: you are an exemplary specimen.</i>");
		output("\n\nYour earlier aches from the battle quickly fade at the Frostwyrm’s praise");
		if (pc.lust() >= 100)
		{
			output(" though all it does for your crotch is make you");
			if (pc.hasCock()) output(" harder");
			if (pc.isHerm()) output(" and");
			if (pc.hasVagina()) output(" wetter");
		}
		output(". A <i>dragon</i> is admitting that you’re better than it! If that doesn’t make you eligible, then nothing does.");
		output("\n\n<i>This encounter between us is different,</i> it continues, pressing one of its six enormous feet into the ice before you. The snow and ice crunch and crack beneath its weight, to prove its point. <i>I could crush you now. I could break you and save you for dinner later. I will not do these things.</i>");
		output("\n\nYou gulp audibly as it flexes its massive form and draconian muscles, reminding you exactly where you are.");
		output("\n\n<i>I require something of you, which I claim by right of victory,</i> the Frostwyrm says suddenly. You wonder to yourself what you could possibly offer it. <i>I require your willing ");
		if (pc.isMale()) output("seed ");
		else if (pc.isFemale()) output("womb ");
		else output("body ");
		output("to ensure the future of my species. I have been unable to find a proper mate these many Sky Cycles; a strong, cunning, exemplary,</i> superior <i>[pc.race] such as yourself will do nicely.</i>");
		output("\n\nYour cheeks flush suddenly. The Frostwyrm... wants to <i>fuck</i> you? And make little Frostwyrm half-breeds?");
		if (pc.isBimbo()) output("It all almost sounds too good to be true!");
		output("\n\nYour first impulse isn’t to say no; it’s to ask the creature if it’s even possible. <i>Six tales of my kind mating with others have reached me, and yet more may exist. The resulting kip would inherit the strongest, most definitive traits of us both. In my tireless search for a proper mate, perhaps it was never meant to be one of my own species.</i> You feel a pleasant, tingling sensation down your spine; a pleasurable shock that works to your groin and arouses you");
		if (pc.lust() >= 100) output(" even further");
		output(". <i>And, I am sure, the feat of defeating a creature as glorious and mythical as myself would pale in comparison to breeding with one.</i> The promise of it being a good time is not lost on you.");
		output("\n\nWhat if you refuse? <i>Then I would extend the same mercy as you have to me. This would be the last of our encounters together. I will not risk my health for your selfish satisfaction any longer.</i>");
		output("\n\nThis was definitely not the result you had expected when you lost your battle against the Frostwyrm, but now, you’ve been given a unique opportunity. Do you willingly breed with the Frostwyrm and work with it to ensure the survival of its species? Or do you refuse its invitation and part ways with it forever?");
		
		clearMenu();
		addButton(0,"Accept",frostwyrmEpilogueAccept,undefined,"Accept","Willingly breed with the Frostwyrm and work with it to ensure the survival of its species.");
		addButton(1,"Refuse",frostwyrmEpilogueRefuse,undefined,"Refuse","Refuse its invitation and part ways with it forever.");
	}
	else if (flags["FROSTWYRMWARNING"] == undefined)
	{
		clearOutput();
		frostWyrmHeader();
		
		flags["FROSTWYRMWARNING"] = 1;
		
		output("With a final gasp, you crumple to the ground, utterly defeated. Your life, short that it’s been, flashes before your eyes as the behemoth of frost and scales lumbers toward you, fangs bared and slavering with bestial hunger.");
		output("\n\nYou scramble back, but a single stride of the creature’s six huge legs brings it so close that you can feel its breath hot against your [pc.face]. It growls, regarding you with its four red eyes. Rather than open wide to devour you, though, the creature snorts in your face, and you feel a sudden pressure on the back of your head. Your vision swims as an unwelcome force burrows into your mind.");
		output("\n\nA pounding pain thunders through your mind, feeling like your head is about to be wrent apart. You wrap your hands around your head, a feeble effort to ward off the psychic assault drilling through your consciousness. Your attempts are futile, utterly insufficient in your state of ");
		if (pc.HP() <= 0) output("physical defeat.");
		else output("overwhelming sexual arousal.");
		output(" Your defenses are compromised, and you can feel them slowly peeled apart, stripped layer by layer like an onion until you’re suddenly aware of another presence in your mind, a worming coldness squirming through your brain.");
		output("\n\nA voice pounds between your ears, bestial and guttural, yet soft as a whisper. <i>You did not run</i>, it says, as the frostwyrm snorts a frigid breath across your face. <i>Most run.</i>");
		output("\n\n“W-what?” you groan, not sure if you’re speaking aloud or just thinking back at the voice burrowing in your brain.");
		output("\n\n<i>Are you brave, or foolish, I wonder?</i> the voice says. <i>Your kind come to slay me with their great machines of fire and war... and yet here you stand alone. Ah, a word in your language: hubris.</i>");
		output("\n\nThe creature snorts again and withdraws, rising to its full and terrifying height. With an ear-piercing bellow, the wyrm turns away from you, looking back across the misty sea to the east. <i>Never again come to my domain, creature. Keep your distance from the coastlands. I will not be so forgiving a second time.</i>");
		output("\n\nGlancing at you over its shoulder, the wyrm takes wing and dives beneath the glacial cliff and out of sight.");
		
		processTime(5);
		clearMenu();
		addButton(0,"Next",frostwyrmPClossEpil);
	}
	else
	{
		clearOutput();
		frostWyrmHeader();
	
		output("With a final gasp, you crumple to the ground, utterly defeated. Your life, short that it’s been, flashes before your eyes as the behemoth of frost and scales lumbers toward you, fangs bared and slavering with bestial hunger.");
		output("\n\nYou scramble back, but a single stride of the creature’s six huge legs brings it so close that you can feel its breath hot against your [pc.face]. It growls, regarding you with its four red eyes. Rather than open wide to devour you, though, the creature snorts in your face, and you feel a sudden pressure on the back of your head. Your vision swims as an unwelcome force burrows into your mind.");
		output("\n\nA pounding pain thunders through your mind, feeling like your head is about to be wrent apart. You wrap your hands around your head, a feeble effort to ward off the psychic assault drilling through your consciousness. Your attempts are futile, utterly insufficient in your state of ");
		if (pc.HP() <= 0) output("physical defeat.");
		else output("overwhelming sexual arousal.");
		output(" Your defenses are compromised, and you can feel them slowly peeled apart, stripped layer by layer like an onion until you’re suddenly aware of another presence in your mind, a worming coldness squirming through your brain.");
		output("\n\nA voice pounds between your ears, bestial and guttural, yet soft as a whisper. <i>You did not run</i>, it says, an echo of your prior defeat. <i>I warned you once to never again darken my door. Yet not only do I find you here again, but you lack the sense to flee when confronted.</i>");
		output("\n\nThe frostwyrm looms down on you, billowing icy breath across your face. You shiver, scrabbling back away from it... until one of its huge, bestial claws reaches out and grabs you around the waist, pinning you to the ice.");
		output("\n\nThe beast seems to consider you for a moment, its draconic eyes drilling into you before it exudes a long breath and clutches its claws around you. For a moment, you feel as if you’ll be crushed to pulp, but then find that its claws are wrapping around you, lifting you up off the ground. With a roar, the wyrm takes wing, hefting you up and flying off with you.");
		output("\n\nA scream tears from your throat as you’re whisked away through the freezing wind, over the edge of the glacial rift and out over the vast, icy ocean below. The wyrm roars, a thunderous sound that echoes across the rift for miles around and all but deafens you in the process. You can’t hear, the icy wind is burning you eyes, and you’re completely incapable of movement crushed between the wyrm’s talons.");
		output("\n\nYou try and hold on, futile as that is against the tide of agony that assails you. You last mere moments before consciousness slips away from you.");
		
		processTime(5);
		clearMenu();
		addButton(0,"Next",frostwyrmBadEnd);
	}
}

public function frostwyrmPClossEpil():void
{
	clearOutput();
	frostWyrmHeader();
	
	output("You spend several minutes on your back, reeling from the violent invasion of your psyche. After a while, you roll onto your hands and [pc.knees] and retch across the ice, heaving until your chest burns.");
	output("\n\nIt takes a while to get yourself in any condition to move. Once you’ve caught your breath, you check your gear and stumble off, away from the sheer cliff at the edge of the glacial rift.\n\n");

	processTime(15);
	CombatManager.genericLoss();
}

public function frostwyrmBadEnd():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	
	moveTo("FROSTWYRM LAIR", true);
	removeUvetoCold();
	
	clearOutput();
	frostWyrmHeader();
	
	output("You claw your way back to consciousness, groaning as sensation floods back into you. You’re freezing cold, and everything aches: it takes several seconds to blink the accumulated frost out of your eyes, and you struggle to a sitting position, your back pressing against something cold and slick -- ice?");
	output("\n\nYour eyes finally open, revealing palatial cavern of ice. Dozens of spires surrounding the open chamber, holding the ceiling aloft in all its glittering glory. Light flickers across the ice crystals hanging above you, creating a chandelier-like effect that illuminates the chamber as well as candle-light might, almost blinding to your battered eyes.");
	
	output("\n\nAfter taking a few moments to adjust, you stagger up ");
	if (pc.hasFeet()) output("to your feet");
	else output("to your full height");
	output(", using the ice wall for support.");
	
	output("\n\nIt’s only then that you hear the clinking of metal, and feel a tug against your neck.");
	output("\n\n<i>“Oh, no,”</i> you murmur, running a hand along your neck and finding a leather collar firmly affixed there, pulling against a chain that clinks like glass behind you. The memory of your capture, being beaten and battered by the psychic frostwyrm and dragged off to... what you imagine must be its lair.");
	output("\n\nYou give an experimental tug on the chain binding you to the wall, and manage to give yourself perhaps three feet of give from the wall. Sighing, you try and tug against the chains, and find them as sturdy as steel, with no lock or device in sight. ");
	if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) output("It’s so cold you can’t even work your gooey magic to escape -- you’re too solid in the frigid cold. "); 
	output("You are, for all purposes, trapped in the wyrm’s lair.");
	output("\n\n<i>Ah, you stir,</i> comes the now-familiar voice in your head, softer and sweeter than ever before. What was once an agony assailing your senses now comes as an otherworldly coolness that worms along your spine, twisting and coiling through the avenues of your brain. It’s almost pleasurable, in a way, making you shiver with the alien sensation.");
	output("\n\nYou gaze out across the open chamber, and see the wyrm for the first time since waking: moving with serpentine grace, flowing like liquid across the ice. It approaches you slowly, taking you in with its four crimson eyes.");
	output("\n\n<i>Chains suit you,</i> the voice whispers, in beat with the frostwyrm’s bestial breath. <i>Very well indeed.</i>");
	output("\n\nYou start to protest, to strain against your bonds. Every instinct in your invaded mind screams that you do not belong in chains... until a cool pressure builds in the back of your mind, stirring your thoughts into incoherent mush. It takes what little willpower you have left not to merely go limp, surrendering to the mental miasma. ");
	output("\n\nAfter a few moments, a thought congeals in your mind: a single word forming in a rush of shivering, cool control: <i>“Yes,”</i> you say aloud, running your fingers along the icy chains. The way your collar rubs against your [pc.skinFurScales] sends waves of pleasure through you, almost orgasmic. The wyrm’s maw twists into something like a grin and it nods approvingly.");
	output("\n\nThe frostwyrm slinks right up to you, and draws one of its blade-like talons across your cheek. You whimper, pressing your back against the wall as the wyrm caresses you. Yet you find his touch oddly pleasurable, almost sensual. It breathes a cloud of misty frost across your face, and the chain behind you snaps away from the wall, slipping down your back. Your [pc.legOrLegs] quaver, nearly bucking you onto your hands were it not for the sudden appearance of the wyrm’s claws around your body. Again, you’re overcome with an unbeckoned pleasure hammering through you until you’re limp in the creature’s powerful grasp.");
	output("\n\nThe volition drains out of you in the wyrm’s cold embrace: this time it lays you out across a table of ice at the back its lair, you can’t find the will to move... nor the desire. The cold weight on your mind leaves you placid and mewling when the wyrm releases you, hands brushing languidly across its claws.");
	output("\n\nSome base and primal part of your brain screams that this isn’t right, that you’re being controlled.");
	output("\n\nThe rest of you doesn’t mind at all");
	output("\n\nThe wyrm rises to its full height, its long neck coiling over the altar-like block he’s laid you out on, staring at you for a long moment. For the first time, you realize that you’re naked and bereft of your equipment; your sex is bared for the creature’s inspection, and you become quickly aware that its stare is firmly focused there.");
	
	output("\n\n<i>In truth, I am glad you did not heed my warning,</i> the voice says, and the cool, queer feeling in your mind tingles with sensual suggestion. Unbidden arousal flushes through your body, brought forth by the probing thoughts coursing through your mind. ");
	if (pc.hasCock()) output("You watch your [pc.cock] slowly rise to half-mast, reaching up towards the snowy wyrm. "); 
	else if (pc.hasVagina()) output("You feel your [pc.cunt] wink invitingly at the creature, wide open and beading with lustful juices. ");
	output("The wyrm’s face twists into something like a smile. <i>Good, your body agrees. It has been many years since a proper mate has wandered into my territory. We are so few, now... you will have to do instead. I require someone to ");
	if (pc.hasVagina() || !pc.hasCock()) output("bear my young. I will fill your body with eggs, again and again. You will be mother to my brood."); 
	else output("be father to my brood. You will give life to my eggs, again and again, until my lair sings with life.");
	output(" It will be pleasurable for you, if you let it.</i>");
	
	output("\n\n<i>“I... will,”</i> you answer, ");
	if(pc.legCount > 1) output("and you find your [pc.legs] spreading invitingly, ");
	output("as if begging the wyrm to proceed with its inevitable plans for you.");

	processTime(90);
	pc.removeAll();
	pc.lust(pc.lustMax());
	addButton(0,"Next",frostwyrmBadEndII);
}

public function frostwyrmBadEndII():void
{
	clearOutput();
	frostWyrmHeader();
	
	//vagwielder
	if (pc.hasVagina() && !pc.isBlocked(0))
	{
		output("<i>I am glad</i>, the wyrm coos, taking a single stride forward, wrapping its foremost four legs around the shelf of ice so that it is completely overtop you. You can’t see its face anymore, nor the cavern around you: nothing but the armored underbelly of the great white wyrm. Something long, hard, and unbearably thick presses against your thigh, starting to move towards your [pc.cunt]. Your whole body seizes up as the behemoth wyrm moves himself overtop you, and his equally huge member towards your pussy.");
		
		output("\n\nYou look down the length of your body, and at the tree-trunk of red meat that’s appeared between the frostwyrm’s haunches, angling towards your sex." );
		//Max height or taur
		if ((pc.isTaur() || pc.tallness >= 96)) output(" Even as big as you are, there’s no way you could take something like that!");
		//Really loose?
		else if (pc.biggestVaginalCapacity() >= 2000) output(" You’ve taken some massive dicks before, but even your breath catches when you see what the wyrm’s packing.");
		//Other
		else output(" The wyrm is packing what looks like a tree trunk, aiming for your utterly unprepared sex with obvious intent.");
		output(" You give a panicked whimper, unable to do anything to avoid your fate.");
		
		output("\n\nYou hear the wyrm snort from somewhere overhead. Overtop you, the wyrm snorts. <i>Relax yourself,</i> it commands, and you quickly find your body becoming languid and heavy, hard to move. <i>I would not risk harming you, my mate.</i>")
		output("\n\nYou try to answer, but your voice comes as nothing more than a simpering moan. You reach up and run a hand along the wyrm’s underbelly, a feeble attempt to arrest its progress turning into a lover’s caress. The beast’s psychic dominion over your mind leaves you utterly helpless -- and some primal, animalistic part of your mind screams with pleasure as the titanic crown of its cock teases the lips of your womanhood.");
		output("\n\nWith a vicious growl, the frostwyrm’s hips grind forward, and its cockhead soon comes flush with your [pc.cunt], pulling apart your lips and aligning with the hole beneath them. Relentlessly it pushes forward, forcing the first inches into you. Your body strains against it, belly tentpoling with the massive insertion. You scream -- not with pain, but with pleasure. The sensation is all-consuming, shaking you to your bones: the wyrm’s cock feels <i>amazing</i>, a fist of purest ecstasy pushing inside you.");
		output("\n\nThe wyrm’s insertion stops quickly, bottoming out at the end of your channel: it’s barely crowned you, and there’s no more room for its monstrous erection. You scream again, begging for more: you don’t care if it breaks you, ruins you forever -- you need <i>more</i> of the wyrm’s dick inside you.");
		
		frostwyrm.cockChange();
		pc.cuntChange(0, frostwyrm.cockVolume(0));
		
		output("\n\nInstead of tearing you apart, the frostwyrm begins to move its hindquarters, drawing itself almost out of you, and grinding back in again. It’s not everything you wanted, but the thunderous pleasure that crashes through you erases any sense of deprivation. Conscious thought gives way to cries of animalistic pleasure, followed by orgasm as the wyrm hammers you, filling you utterly and completely. Your head lolls back, insensate as you climax around the beastial member, spraying it with [pc.girlCumNoun]");
		if (pc.hasCock()) output(" and hosing your belly with your own spunk as your [pc.multiCocks] erupt" + (pc.cocks.length == 1 ? "s" : ""));
		output(".");
		
		output("\n\nThe wyrm follows you a mere moment later, bellowing a triumphant roar as its cock swells with impending need. You have but a moment to brace yourself before the flood of cold, sticky wetness floods into your womb, bloating your gut as a monstrous load of wyrm-spunk takes root.");
		output("\n\nAfter a long minute, the frostwyrm withdraws from you with a wet, resounding squelch. The moment it does, you feel like you’re a balloon deflating with gallons of spunk leaking out of your abused hole. The sensation is as frightening as it is amazing.");
		output("\n\n<i>Hmm,</i> the wyrm’s voice coos in your mind, sending shivers of pleasure through you even as the creature’s body moves off of you, and its claws wrap around your limp frame. <i>You will serve. Yes... a fine mother for my brood indeed. Now rest. We must ensure your body plays home to many fine eggs once you recover.</i>");
		output("\n\nYou nod meekly as your captor carries you back to the cavern’s edge, and reattaches your chain to its pedestal. <i>Now rest,</i> it repeats, and you begin to feel your eyes becoming leaden. You drift off to sleep, completely content in the tight hug of your collar around your neck, a constant reminder of your servility.");
		output("\n\nYou can’t wait to be a mother to such magnificent creatures.");
		
		pc.loadInCunt(enemy, 0);
	}
	//cockwielder
	else if (pc.hasCock())
	{
		output("<i>I am glad</i>, the wyrm coos, taking a single stride forward, wrapping its foremost four legs around the shelf of ice so that it is completely covering you. You can’t see its face anymore, nor the cavern around you: nothing but the armored underbelly of the great white wyrm. Its serpentine tail wraps around your [pc.legOrLegs], brushing tenderly against the underside of your [pc.cock]. You’re at full mast instantly, all thoughts of the cavern’s chill forgotten at the smooth caress of your captor.");
		output("\n\n<i>Relax yourself,</i> the voice murmurs as its tail strokes your cock, gently guiding it towards the source of a subtle, wet warmth on its body. It takes you a moment to recognize that you’re being drawn into the creature’s sex, a silken-smooth gash that reaches down to kiss your [pc.cockHead]. The wyrm makes a gravelly growl as you slide into it -- into <i>her</i>? -- and you feel wet warmth wrap around your [pc.cock].");
		output("\n\nThe wyrm makes a shuddering snort, and you hear its voice echo in your mind <i>Good, good. It’s been so long since I felt the touch of a male. So long...</i>");
		output("\n\nIts great body slowly descends on you, swallowing up every inch you have to offer it. The whole of your shaft is quickly consumed by the slavering maw of reptilian sex, wrapped in soft warmth that begins to contract rhythmically. The hole is much too big for you, you know that instantly, but the wyrm still floods your mind with an overwhelming sense of pleasure -- despite the great difference in size, your cock feels like it’s being slid into a vice-like grip, tight as a virgin’s hole.");
		
		pc.cockChange();
		frostwyrm.cuntChange(0, pc.cockVolume(0));
		
		output("\n\nPsychic pleasure overwhelms you, creeping through your body from the cock upwards until you’re arching your back and digging your fingers into the ice.");
		output("\n\n<i>Relax.</i> the voice in your mind commands, and you immediately fall flat on your back. The great beast begins to hump itself forward and back, clenching hard around your [pc.cock], making itself into the perfect living milker to drain the seed from your [pc.balls]. <i>I will drain you dry.</i>");
		output("\n\nThe moment to wyrm utters that into your mind, you feel yourself letting go, surrendering to the alien ecstasy gripping your mind. A rush of pleasure hammers through you, culminating in an orgasmic scream as your [pc.cock] erupts inside the wyrm’s sex. The creature roars triumphantly as you fill its sex with your [pc.cumNoun]. You shoot every drop you’ve got as deep into the wyrm’s belly as you can, basting the sultry walls of its bestial cunt a sticky [pc.cumColor].");
		output("\n\nGasping for breath, you collapse back against the icy altar. Your [pc.cock] slowly wilts, drooping out from inside the wyrm’s warm embrace accompanied by a waterfall of spooge trickling out of its hole.");
		output("\n\n<i>Hmm,</i> the wyrm’s voice coos in your mind, sending shivers of pleasure through you even as the creature’s body moves off of you, and its claws wrap around your limp frame. <i>You will serve. Yes... a fine father for my brood indeed. Now rest. We must make sure your seed takes once you recover.</i>");
		output("\n\nYou nod meekly as your captor carries you back to the cavern’s edge, and reattaches your chain to its pedestal. <i>Now rest,</i> it repeats, and you begin to feel your eyes becoming leaden. You drift off to sleep, completely content in the tight hug of your collar around your neck, a constant reminder of your servility.");
		output("\n\nYou can’t wait to be a father to such magnificent creatures.");
	}
	//neuter - just a rough modification of vag
	else
	{
		
		output("<i>I am glad</i>, the wyrm coos, taking a single stride forward, wrapping its foremost four legs around the shelf of ice so that it is completely overtop you. You can’t see its face anymore, nor the cavern around you: nothing but the armored underbelly of the great white wyrm. Something long, hard, and unbearably thick presses against your thigh, starting to move towards your [pc.asshole]. Your whole body seizes up as the behemoth wyrm moves himself overtop you, and his equally huge member towards your pussy.");
		
		output("\n\nYou look down the length of your body, and at the tree-trunk of red meat that’s appeared between the frostwyrm’s haunches, angling towards your ass. ");
		//Max height or taur
		if ((pc.isTaur() || pc.tallness >= 96)) output("Even as big as you are, there’s no way you could take something like that!");
		//Really loose?
		else if (pc.analCapacity() >= 1500) output("You’ve taken some massive dicks before, but even your breath catches when you see what the wyrm’s packing.");
		//Other
		else output("The wyrm is packing what looks like a tree trunk, aiming for your utterly unprepared ass with obvious intent.");
		output(" You give a panicked whimper, unable to do anything to avoid your fate.");
		
		output("\n\nYou hear the wyrm snort from somewhere overhead.Overtop you, the wyrm snorts. <i>Relax yourself,</i> it commands, and you quickly find your body becoming languid and heavy, hard to move. <i>I would not risk harming you, my mate.</i>")
		output("\n\nYou try to answer, but your voice comes as nothing more than a simpering moan. You reach up and run a hand along the wyrm’s underbelly, a feeble attempt to arrest its progress turning into a lover’s caress. The beast’s psychic dominion over your mind leaves you utterly helpless -- and some primal, animalistic part of your mind screams with pleasure as the titanic crown of its cock teases your rim.");
		output("\n\nWith a vicious growl, the frostwyrm’s hips grind forward, and its cockhead soon comes flush with your [pc.asshole], aligning with the hole beneath them. Relentlessly it pushes forward, forcing the first inches into you. Your body strains against it, belly tentpoling with the massive insertion. You scream -- not with pain, but with pleasure. The sensation is all-consuming, shaking you to your bones: the wyrm’s cock feels <i>amazing</i>, a fist of purest ecstasy pushing inside you.");
		output("\n\nThe wyrm’s insertion stops quickly, bottoming out at the end of your channel: it’s barely crowned you, and there’s no more room for its monstrous erection. You scream again, begging for more: you don’t care if it breaks you, ruins you forever -- you need <i>more</i> of the wyrm’s dick inside you.");
		output("\n\nInstead of tearing you apart, the frostwyrm begins to move its hindquarters, drawing itself almost out of you, and grinding back in again. It’s not everything you wanted, but the thunderous pleasure that crashes through you erases any sense of deprivation. Conscious thought gives way to cries of animalistic pleasure, followed by orgasm as the wyrm hammers you, filling you utterly and completely. Your head lolls back, insensate as you climax around the beastial member.");
		output("\n\nThe wyrm follows you a mere moment later, bellowing a triumphant roar as its cock swells with impending need. You have but a moment to brace yourself before the flood of cold, sticky wetness floods into you, bloating your gut as a monstrous load of wyrm-spunk takes root.");
		output("\n\nAfter a long minute, the frostwyrm withdraws from you with a wet, resounding squelch. The moment it does, you feel like you’re a balloon deflating with gallons of spunk leaking out of your abused hole. The sensation is as frightening as it is amazing.");
		output("\n\n<i>Hmm,</i> the wyrm’s voice coos in your mind, sending shivers of pleasure through you even as the creature’s body moves off of you, and its claws wrap around your limp frame. <i>You will serve. Yes... a fine mother for my brood indeed. Now rest. We must ensure your body plays home to many fine eggs once you recover.</i>");
		output("\n\nYou nod meekly as your captor carries you back to the cavern’s edge, and reattaches your chain to its pedestal. <i>Now rest,</i> it repeats, and you begin to feel your eyes becoming leaden. You drift off to sleep, completely content in the tight hug of your collar around your neck, a constant reminder of your servility.");
		output("\n\nYou can’t wait to be a mother to such magnificent creatures.");
		
		pc.loadInAss(enemy);
	}

	processTime(30);
	pc.orgasm();
	badEnd();
}


/* Frostwyrm Expansion */
// written by B and coded by Quiet Coyote
public function frostwyrmEpilogueRefuse():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	// (scene: Refuse)
	output("You bow your head in respect to the Frostwyrm. You apologize to it and say that you don’t believe breeding with it is something you can accomplish, whether on physical or moral grounds.");
	output("\n\n<i>You have no reservations for raising your weapons to me, [pc.race], but when I ask you to save my species, you cry foul over morals.</i> The Frostwyrm is clearly peeved, for lack of a better word. You feel a tightness in the back of your mind, growing slightly uncomfortable the tighter it becomes, but then it loosens all at once. <i>I will keep to my promise. You are free to wander the coast all you desire. We will never meet again.</i>");
	output("\n\nThe creature flaps its heavy wings, blowing snow and ice crystals in your direction as it takes off. It lifts into the sky, then turns over the Uveto ocean, soaring towards its lair over the horizon. You watch it as it glides over the line where the sky meets the water, and disappears from your sight forever.");
	
	processTime(5);
	
	flags["FROSTWYRM_DISABLED"] = 1;
	
	CombatManager.abortCombat();
	
	// end scene (scene: Refuse); drop the chance of meeting the Frostwyrm on Uveto to 0. Maybe, during generic text while travelling along the coast, include a new flavor line about hearing it’s roar in the distance, but being unable to find it.
}
public function frostwyrmEpilogueAccept():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	if (!pc.hasCock() && pc.hasVagina() && pc.hasPregnancyOfTypeOtherThan("FrostwyrmPregnancy"))
	{
		output("You’re humbled by the Frostwyrm’s offer – not so much for the opportunity to bear its offspring, but that it considers you such a valid option. You tell it that you consider its offer very flattering, and you’d love to help it, but, you rub at your belly as you tell it that you’re currently... occupied. You can’t exactly double-dip.");
		output("\n\n<i>I understand,</i> it replies soothingly. <i>I will not ask more from you than you can provide. Return to this coast when your current child is reared and you’ve recovered, and think of me. I will respond to your summons.</i>");
		output("\n\nYou feel its hold on your mind release, and yet, you feel that its influence is not entirely gone from you. It’s like a sixth sense, something that you intrinsically understand but can’t explain. You know that, should you want to meet the Frostwyrm again, all you need is to follow its instruction: return to this coast, and then call to it with your mind.");
		output("\n\nThe Frostwyrm spreads its heavy wings, flapping them carefully so that the snow does not billow over you as it takes off. It spares you a single look before turning towards the ocean and launching over the ocean, towards wherever its lair might be.");
		output("\n\nThe Frostwyrm was a lot more civil than you expected. You wouldn’t mind meeting with it again....");
		
		flags["FROSTWYRM_NOT_HOSTILE"] = 0;
	}
	else
	{
		output("You stay kneeled in the snow as the weight of the Frostwyrm’s offer hangs on your mind. You’re humbled, not only by the opportunity to save such a magnificent species (and have a ton of fun doing it), but that the creature would consider you such a valid option. It’s right, too: there aren’t a lot of others in the universe that can say they’ve gotten such an invitation.");
		output("\n\nYou tell the Frostwyrm that, after your previous altercations with it, it would be rude to turn down such a generous and enticing offer. A deep rumble resonates from the creature’s throat, sounding almost like a purr, as you acquiesce to it. <i>I’m relieved you think this way,</i> it says.");
		output("\n\nUnexpectedly, it lays flat on its belly, rolling slightly to one side to give you access to its upper back. <i>I could carry you to my lair, but you may find that undignified");
		if (pc.hasWings()) output(". And your small wings will not have the strength to carry you over the ocean");
		output(". I bid that you climb onto me, and I will fly us there.</i>");
		output("\n\nHoly shit, not only are you going to ride it, but you’re going to <i>literally</i> ride a dragon back to its lair. This is definitely a day of firsts for you!");
		if (silly) output(" Who knew that punching a dragon so much would be so beneficial?");
		output("\n\nYou pull yourself to your feet");
		if (pc.HP() == 0) output(", aching and bruised as they are,");
		output(" and clamber onto the Frostwyrm, where its neck meets its back and before its wings. Your straddle its body and lean forward; its smooth, scaly body has nothing for you to grasp, so all you can hope to do is wrap your arms around it tightly.");
		output("\n\nWhen you’re as secure as you can get, the creature’s wings rear up and its body lays low, ready to spring off its legs and flap into the air. <i>Brace yourself,</i> it says, and it thrusts upward, launching itself well over its own body-height into the air, and rising.");
		
		flags["FROSTWYRM_NOT_HOSTILE"] = 1;
		eventQueue.push(frostwyrmTalks);	
	}
	processTime(5);
	
	CombatManager.abortCombat();
}

public function frostwyrmPickMeUpBaby():void
{
	// Gender-assignment hotfix
	frostwyrm.removeStatusEffect("Force It Gender");
	frostwyrm.createStatusEffect("Force Fem Gender");
	
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("You concentrate on your psionic link with the Frostwyrm; you reach out to her, telling her that you’re on the Uveto ocean coastline, and you’d like to see her.");
	output("\n\n<i>At once, my Qal,</i> you hear her familiar voice thrum inside your skull. The flight between the coast and her lair is a fair distance, and you prepare to settle in, pacing and hugging yourself to keep warm, as you wait for her.");
	output("\n\nDespite that, she’s by your side much sooner than you anticipated; she must have been out hunting when you called for her. Within minutes, you see her imposing form in the distance, and you hear her roar vibrate the very air around you. She spots you as soon as you spot her, and she dives, the air splitting around her wings as she comes in for a quick landing.");
	output("\n\nShe rights herself with practiced grace before landing, a pair of feet at a time, coming to a complete stop in front of you. <i>It is good to see you again, my Qal,</i> she says affectionately; she cranes her long neck down to you and nuzzles her nose against your body, her nostrils huffing warm air onto your body.");
	output("\n\nYou don’t waste much time before asking her to take you back to her lair. <i>Of course,</i> she replies gladly, lowering her body to the ice so that you can climb onto her. <i>I look forward to you warming my lair once more.</i>");
	
	// Allow Xmas events once a year
	var currDate:Date = new Date();
	var enableXMas:Boolean = false;
	if (isChristmas()) {
		if (flags["FROSTWYRM_XMAS"] == undefined || (flags["FROSTWYRM_XMAS"] != undefined && flags["FROSTWYRM_XMAS"] < currDate.fullYear))
		enableXMas = true;
	}
	
	processTime(5);
	clearMenu();

	if (flags["NYKKE_MET"] == undefined && nykkeIsMature() && flags["NYKKE_VERSION"] == 1) addButton(0, "Next", nykkeIntro01, undefined);
	else addButton(0, "Next", (enableXMas ? frostwyrmXMas : frostwyrmHomeAtLast), undefined);
}
public function frostyReadyToBang():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("You stand at the edge of the Uveto ocean. You clearly remember the last time you encountered the Frostwyrm, and you remember what it told you to do once you had given birth to your child-at-the-time. ");
	if (pc.hasCock()) output("Ever since you’ve gotten some ‘additions’ since then");
	else output("Ever since your womb became open for business, as it were");
	output(", you’ve been anxious to return to the coast. You haven’t forgotten that the Frostwyrm considers your to be an ‘exemplary, superior’ specimen, and you haven’t forgotten that <i>it</i> chose <i>you.</i> Now, you’re excited, for lack of a better word, at... saving its species.");
	output("\n\nIts instruction was to stand at the coast and ‘think of it,’ so, you do. It communicates via psionics; hopefully, it’ll respond to your summons quickly.");
	output("\n\nTo your surprise, you get a response almost immediately. <i>I will be with you momentarily,</i> the familiar, guttural voice booms between your ears. And, true to its words, its only minutes before you see the Frostwyrm’s giant, draconian form appear over the horizon of the ocean. You watch its form with stunned appreciation as it approaches you, and how, with grace, it takes its spot next to you.");
	output("\n\nYou flinch at first, hesitant around the dragon, and fight the instinct to reach for your weapon, since every time you two met before now, you’ve fought. The Frostwyrm, for its part, is very calm; it bends at the neck towards you, its four, ruby-red eyes staring into yours. <i>I am glad,</i> it says calmly, <i>that you have returned. I have not forgotten about you.</i>");
	output("\n\nYou reply that you certainly couldn’t forget about it. You shuffle a bit before breeching the main topic: you’ve given birth, and, if the Frostwyrm still considers you ‘exemplary,’ you’d like to... take it up on its previous offer.");
	output("\n\nIt huffs a deep breath through its nostrils in response, the heat washing over your body. <i>I have yet to find another of my kind, nor have I met a more ideal one of yours,</i> it responds. Then, it lowers its entire body, its belly pressed to the ice. <i>Climb onto my body, and I will take you to my lair.</i>");
	if (pc.hasWings()) output(" <i>Your wings will not have the strength to carry you across the ocean.</i>");
	output("\n\nYou’re tentative at first, but its body is just as tough as you remember it being from your previous altercations. It’s difficult to get comfortable, sitting where its neck meets its back, but you’ll just have to deal with it. <i>Brace yourself,</i> it says, and it thrusts upward, launching itself well over its own body-height into the air, and rising.");
	
	processTime(5);
	clearMenu();
	addButton(0, "Next", frostwyrmTalks, undefined);
}
public function frostwyrmTalks():void
{
	moveTo("FROSTWYRM LAIR", true);
	removeUvetoCold();
	
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("The air roars around you as you lift higher and higher, the snowy ground shrinking beneath you and the sprawling ocean only growing larger and larger. You can see for miles and miles in every direction, and you’re only going higher.");
	output("\n\n<i>We will reach my lair by the lower-apex of the Red Storm’s descent,</i> the Frostwyrm communicates to you. Your senses are overloaded with the bitter cold biting into you; the air rapidly thinning; the sinking in your gut every time you look at how far the ground is from you (you can’t help it) – but you have enough sense to know you have no idea what it means. <i>Ah.</i> The Frostwyrm hums for a moment, and you feel an alien grip on your mind, prodding at you. <i>In terms you understand, we will reach my lair in about an hour.</i>");
	output("\n\nIt settles into a gentle glide, and the ride is suddenly very smooth. The air is still cold and thin, but your experience after take-off is pleasant: you enjoy a comfortable silence, the Frostwyrm’s wings cutting the air on either side of you, and you no longer feel a lurching in your stomach now that it’s level. You even muster the bravery to sit up, disengaging your arms from the creature’s neck.");
	output("\n\nThe coastline promptly disappears behind you, leaving nothing but engulfing ocean in all directions, marked by the occasional floe in its glassy waters. Isolation creeps on you: the stillness of the ride and the vast nothingness in all directions leaves you mildly unsettled, spoiling the fact that you’re riding a dragon. The view, while grandiose, also leaves something to be desired when there’s only ocean to see.");
	output("\n\nYour thoughts drift to the Frostwyrm you’re riding. It might make a decent companion, and you can think of a number of questions to ask it – is it male, or female? Your codex didn’t specify, and you probably should have asked before you agreed. Does it have a name? Your mind can’t help but rove to what’s going to happen at the conclusion of your flight. How are you even going to... <i>mate</i> with it? Even ignoring the physiological differences, ");
	if (pc.tallness > 84) output("it’s still over twice as tall as you are.");
	else output("it’s pretty damn tall compared to you");
	output("\n\n<i>My kind are not separated into genders,</i> it explains. You jolt in your ‘seat,’ surprised – and then realize that the gripping sensation in the back of your mind had never left you. It hums to itself again, and again, you feel a gentle prodding on your thoughts. <i>I see your kind reproduce similarly to mine. We do not have ‘males’ or ‘females’ – my kind are exclusively what you would call ‘hermaphrodites.’</i>");
	output("\n\nHuh, a species of nothing but hermaphrodites. ");
	if (pc.originalRace == "half-gryvain") output("You can relate: already, you two aren’t so different.");
	else output("You suppose it’s not the most outlandish thing you’ve ever encountered in the universe.");
	output("\n\nYou ask it if it has a preferred pronoun; you’d rather not call the Frostwyrm an ‘it’ the entire time. It combs your mind again for a moment. <i>The pronouns for your females have an eloquent sound to them.</i> Cool, so your Frostwyrm is a she.");
	output("\n\nDoes she have a name? As you ask that, you realize that you’re probably going to grow accustomed to the feel of it filing through your mind to understand what you mean. <i>With others of my kind, we have what you would call ‘honorifics.’ Similar in concept, but different to what you understand. Others of my kind refer to me as-</i>");
	output("\n\nWhat the Frostwyrm says to you, your mind can pronounce, but your mouth cannot; it involves a number of hard consonants and throaty hums and drills, and it maintains for far longer than any conventional name you’ve ever heard. You ask her if she wouldn’t mind a nickname, or a shortened version of her name that you can pronounce.");
	output("\n\nShe probes your mind for the definition of the word ‘nickname.’ <i>If it would reduce the strain on your tongue and language, you may call me what you wish.</i> Well... alright, then.");
	
	processTime(5);
	clearMenu();
	addButton(0,"Name",frostwyrmTalks1,undefined);
}
public function frostwyrmTalks1():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("<b>Enter the Frostwyrm’s nickname:</b>");
	this.displayInput();
	output("\n\n\n");
	
	clearMenu();
	addButton(0, "Next", nameThatFrostwyrm);
}
public function nameThatFrostwyrm():void
{
	if (userInterface.textInput.text.length == 0)
	{
		frostwyrmTalks1();
		output("<b>You must enter a name.</b>");
		return;
	}
	// Illegal characters check. Just in case...
	if (hasIllegalInput(userInterface.textInput.text))
	{
		frostwyrmTalks1();
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if (userInterface.textInput.text.length > 14)
	{
		frostwyrmTalks1();
		output("<b>You must enter a name no more than fourteen characters long.</b>");
		return;
	}
	
	frostwyrm.a = "";
	frostwyrm.capitalA = "";
	frostwyrm.short = userInterface.textInput.text;
	
	frostwyrm.removeStatusEffect("Force It Gender");
	frostwyrm.createStatusEffect("Force Fem Gender");
	
	this.removeInput();
	
	nameThatFrostwyrm1();
}
public function nameThatFrostwyrm1():void
{
	flags["FROSTWYRM_NOT_HOSTILE"] = 2;
	
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("You ask if the name [frostwyrm.name] is fine with her. At first, you feel her hold on your mind begin to comb through you, searching for something, but then she stops. <i>I will trust your designation is meaningful in some way to you. You may call me [frostwyrm.name], and I will know that you are referring to me.</i>");
	output("\n\nThat’s good! You’re getting introductions out of the way. <i>And what may I refer to you by?</i> That she chose to ask you rather than rifle through your mind for the information is a good start to building your relationship. You introduce yourself as [pc.name], and settle on her back, getting cozier up against her.");
	output("\n\n<i>As for your final concern,</i> it notes, not shying away from the topic at all, <i>in truth... the physicality of our mating will take some imagination on our part. We will make it work.</i> You feel her prod at your mind once more, searching for your knowledge on the topic. <i>I understand that your kind are privileged enough to appreciate the pleasures of mating. Not all kinds have this. I can promise an impression unlike you’ve enjoyed yet, [pc.name].</i>");
	output("\n\nThe grip [frostwyrm.name] has on your mind changes and twists, like a set of gentle fingers strumming a fine instrument. You feel her manipulate your body; not your words, thoughts, or actions, but your sensations. Where before you felt a minor cramp from straddling her neck for such a long period of time, you suddenly feel a rush at your [pc.crotch]");
	if(pc.hasGenitals()) {
		output(",");
		if (pc.hasCock()) output(" hardening [pc.eachCock] not to full, hard-as-rock mast, but damn close to it");
		if (pc.isHerm()) output(". Just south, you feel");
		if (pc.hasVagina()) output(" your [pc.vaginas] moistening and clenching, eager for the first willing dick you lay your eyes on");
	}
	output(".");
	output("\n\nWhat the hell was that? Is this a thing [frostwyrm.name] can do whenever she feels like?");
	if (pc.lust() <= 33) output(" You weren’t even close, and now you’re halfway to busting right here and now!");
	else output(" You thought you were past this just a few minutes ago!");
	output(" She doesn’t answer, but underneath you, you feel her lungs heaving in short bursts, crudely mimicking laughter. If this is a power Frostwyrms like herself have....");
	output("\n\nYou brace yourself on her body, excited more than ever to get to work repopulating her species.");
	processTime(65+rand(3));
	pc.lust(50);
	
	processTime(5);
	clearMenu();
	addButton(0, "Next", frostwyrmJesusWeFinallyLanded,undefined);
}
public function frostwyrmJesusWeFinallyLanded():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("Finally, after a punishing hour-long flight, you spot land. It isn’t another continent or beach; instead, it’s an island, several miles in diameter. It’s featureless – as the rest of the frozen wastes of Uveto are – save for a single spire on one edge of the island with a lazy slope leaning towards the island’s center. At the base of the mountain is a massive mouth, leading into a deep, underground cave.");
	output("\n\n<i>Grab tight,</i> [frostwyrm.name] instructs, and you do so as she slowly descends. The drop is much gentler than the rise was, though you come hurtling towards the ground much faster than you appreciated, having grown accustomed to the height. [frostwyrm.name] pulls up just before you land; she flaps her wings several times, adjusting her body to the land, before finally settling down.");
	output("\n\nYou hop off your Frostwyrm, walking the paltry remaining distance to the cave, allowing her to show you the way. <i>Welcome to my lair,</i> she says, peering over her haunch to make sure you’re following. <i>Watch your first step. The incline is quite sharp.</i>");
	output("\n\nShe wasn’t kidding: the cave only goes for a few feet forward before it curves into the island rather than deeper into the mountain, and the first drop is almost ten feet deep. [frostwyrm.name] hops down with practiced grace, twisting her draconian body into her lair, and you follow behind, leaping after her.");
	output("\n\nShe leads you further in wordlessly; the light of Uveto’s star refracts off the icy walls repeatedly, illuminating your path far deeper into the lair than you would have thought it would. After another drop, you’re opened into a massive, underground dome, easily a hundred feet across and forty-or-more feet straight up. The ground is packed very tight, likely from [frostwyrm.name] pacing over it endlessly. Stalactites glimmer around the ceiling of the dome, shooting light every which way and providing a show similar to a chandelier. In the far corner of the dome is an elevated platform of flat ice – likely a bed or resting place for [frostwyrm.name].");
	
	clearMenu();
	addButton(0, "Next", frostwyrmCanWeFuckYet);
}
public function frostwyrmCanWeFuckYet():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("She lets you get acquainted with her lair (not that there’s much to acquaint with – it’s fairly barren) before she twists on the spot, flaunting her right flank to you. Her flame-red eyes narrow as they focus on you and your thoughts, watching you as you trace her body, from her head and neck all the way to her rear haunches. She intentionally spaces her rear two legs apart, giving you a direct line of sight to where her genitals would be.");
	output("\n\n<i>My kind have a sort of ritual we perform with prospective mates,</i> [frostwyrm.name] says. You feel her curious, questing grip on your mind as she studies you and your culture’s approach to mating. <i>Similar to what you call ‘foreplay,’ although... oh, my... certainly, less direct and to-the-point.</i>");
	output("\n\nHer wide maw slips open and her long, fat, draconian tongue slips from her, drawing languidly across her snout. The probing in your mind does not stop. <i>Goodness. I had no idea your kind could be so... inquisitive with each other’s forms.</i> She continues, scouring your memories for information. <i>What is a ‘kink?’</i> she asks, mostly to herself. <i>Oh. Oh. That is a ‘kink.’ Interesting.</i>");
	output("\n\nYou smile at her as you remove your effects, baring yourself to the chill of [frostwyrm.name]’s lair. Despite being in a place as cold as Uveto, the dome’s glassy walls naturally capture heat quite well; you wouldn’t call it warm, but it’s bearable. You bare your naked body to [frostwyrm.name], displaying to her what you both have to work with. The effects of her earlier demonstration are still apparent on you, but you nonetheless ask her if she’s willing to... do it again.");
	output("\n\nIn response, she approaches you and, like she did on the coastline, huffs a warm breath onto your body. The effects are immediate: you feel a sharp sting spread across your body, making your every cell, digit, and limb alight, electrifying you in pleasure. Then, it all surges towards");
	if (pc.hasCock()) output(" [pc.eachCock]; the flagging erection from earlier springs to life, stiff and hard as could be, engorged in rampant blood and excitement");
	if (pc.isHerm()) output(". Then, the surge continues to");
	if (pc.hasVagina()) output(" your [pc.vagina]; you’ve slowly become placid since then, but just like that, you feel like you could shove a fist inside you and it wouldn’t be enough");
	output(". Yet, despite how horny you suddenly are, [frostwyrm.name] has left a subliminal instruction in your mind: if you want to feel more, you need only to touch her. ");
	output("\n\n<i>I have longed for the touch of another,</i> she confides in you, her four red eyes steadfast on yours. You feel her ply gently at your mind as she searches for the right way to describe her thoughts. <i>These manipulations I have on your mind – what you call ‘psionics’ – have no bearing on the self. I’ve suffered listlessly through innumerable heats and ruts, with no other to quench me.</i>");
	output("\n\n[frostwyrm.name] steps towards you, thundering her footsteps, imposing her bulk upon you. <i>I could have killed you,</i> she says, her fiery red eyes locked tightly to yours. You feel your knees buckle and the energy drain from your chest, and yet, her manipulation on your [pc.crotch] does not stop. Nothing would satisfy you right now: not yourself; not some other person or creature; nothing, but [frostwyrm.name]. You realize that her pleasure is yours, and if you want to cum, you’re going to have to do something for her.");
	if (pc.isHerm() && pc.virility() > 0 && pc.fertility() > 0) output("\n\nYou’re aware of at least two thick odors permeating the room, followed by a steady dripping noise. Both the odors are distinct, and they both smell <i>amazing.</i> Equal parts musky, alluring, feminine <i>and</i> masculine. You follow your nose to [frostwyrm.name]’s haunches, where you spy the beginnings of a raging draconian erection; her pussy, while out of sight, is no doubt just as ready. <i>I have introduced you to my lair, [pc.name]. I have shown you mercy and I am housing you from the cold of the environs.</i> She huffs her breath in your face once more, and your body electrifies in pleasure; a mere example of what’s to come. <i>I have seen your mind. I have read what you call a ‘kink.’ I know you desire nothing more than to feel this pleasure. I will grant it to you. We will breed each other, [pc.name]. You will satisfy me, and I will show you pleasure unlike you’ve ever experienced. We will both lay before the next Light’s Rise. Our kips will be exemplary to all other kinds.</i>\n\nSounds like fun to you.");
	else if (pc.hasCock() && pc.virility() > 0) output("\n\nYou’re aware of a heady, musky odor permeating the room suddenly. It’s a powerful, thick aroma that smells very... <i>good.</i> Feminine, alluring, and <i>needy.</i> You follow your nose to [frostwyrm.name]’s haunches, where no doubt it’s coming from.\n\n<i>I have introduced you to my lair, [pc.name]. I have shown you mercy and I am housing you from the cold of the environs.</i> She huffs her breath in your face once more, and your body electrifies in pleasure; a mere example of what’s to come. <i>I have seen your mind. I have read what you call a ‘kink.’ I know you desire nothing more than to feel this pleasure. I will grant it to you, and you will return the favor by seeding me. Breed me [pc.name]. Pleasure me. Our kips will be superior to all other kinds.</i>");
	else if (pc.hasVagina() && pc.fertility() > 0) output("\n\nYou’re aware of a thick odor permeating the room, followed by a steady dripping noise. The odor smells... <i>good.</i> Musky, earthy, and <i>masculine.</i> You follow your nose to [frostwyrm.name]’s haunches, where you spy red, wet beginnings of a rising, draconian erection. It’s already the size of your wrist, and it’s quickly inflating. <i>I have introduced you to my lair, [pc.name]. I have shown you mercy and I am housing you from the cold of the environs.</i> She huffs her breath in your face once more, and your body electrifies in pleasure; a mere example of what’s to come. <i>I have seen your mind. I have read what you call a ‘kink.’ I know you desire nothing more than to feel this pleasure. I will grant it to you, and you will return the favor by taking my seed. I will breed you, [pc.name]. I will pleasure you. Our kips will be superior to all other kinds.</i>\n\nSounds like fun to you.");
	
	clearMenu();
	processTime(5);
	if (pc.hasCock() && pc.virility() > 0) addButton(0, "Next", (flags["FROSTWYRM_GOT_DICKED"] == undefined ? frostwyrmItsAHotdogInAHallway : frostwyrmVaginalRepeat));
	else addButton(0, "Next", (flags["FROSTWYRM_DICKED_YOU"] == undefined ? frostwyrmRidersMustBeOver4FeetToContinue : frostwyrmDickRepeat));
}

public function frostwyrmHomeAtLast():void
{
	moveTo("FROSTWYRM LAIR", true);
	removeUvetoCold();
	
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("You arrive at [frostwyrm.name]’s lair after an uneventful flight about an hour later. You feel [frostwyrm.name]’s psionics pull at your mind slightly, suggesting that she won’t have her Qal wearing clothing in her lair, and that she’d like to see you bared to her. You agree, rather eagerly; the more naked you become, the more pleasure [frostwyrm.name] bestows upon you through her link. You quickly work to remove your effects.");
	
	processTime(60);
	clearMenu();
	
	if (flags["FROSTWYRM_GAVE_BATH"] == undefined && (pc.hasStatusEffect("Cum Soaked") || pc.hasStatusEffect("Pussy Drenched")))
	{
		addButton(0, "Next", frostwyrmSteeleIsADirtyGirl);
		return;
	}
	
	if (flags["FROSTWYRM_EGGS"] != undefined && !pc.hasWombPregnancy())
	{
		if (flags["FROSTWYRM_KIP_COUNT"] == undefined || flags["FROSTWYRM_KIP_COUNT"] < 100) output("\n\nSitting in one corner of the lair is a large, oblong egg, resting on its side against a nearby wall. [frostwyrm.name] has brought in some fluffy snow from outside of the lair to act as something of a nest for the egg while it incubates.");
		else output("\n\nSitting in one corner of the lair is a large, oblong egg, resting on its side in something of a makeshift incubator that your daughters have collectively assembled. The area is plush and secure, away from the bustle of the rest of your clan, and it has two of your daughters attending it at all times, making sure that whatever is occupying it has need for nothing.");
		output(" You’ve lost track of how long it’s been there, but if you believe [frostwyrm.name] on Frostwyrm gestation, it should be anytime within the next four months.");
	}
	
	if (flags["FROSTWYRM_KIP_COUNT"] == undefined)
	{
		output("\n\n[frostwyrm.name] tromps her way deeper into her lair, towards the raised ice platform that is her resting spot. Circling it once, she steps onto it, curling herself into a disk comfortably, her tail hanging lazily off the side and its spade waving towards you, inviting you to join her.");
		output("\n\nYou do so, slipping past her tail and tucking yourself between her front four legs, resting against the barrel of her chest, her heavy heartbeat providing ambience. She sighs contentedly; for her, there’s nothing quite like cuddling up with her Qal in the comfort of her lair.");
		output("\n\nNow that you’re here, what would you like to do with [frostwyrm.name]?");
	}
	else if (flags["FROSTWYRM_KIP_COUNT"] == 1){
		output("\n\nWhen you and [frostwyrm.name] arrive into the lair, your first (and so far only) kip comes bounding up to you both, excitedly chittering, first at her Qim and then at her Qal, welcoming them back. [frostwyrm.name] bends down, nuzzling her kip the same way she did to you, before making her way to the raised ice platform that is her bed towards the rear of the cave. When your kip greets you, she embraces you in a full-body hug and an exaggerated lick across your cheek, knowing that your kind shows affection in a slightly different way.");
		output("\n\n[frostwyrm.name] circles her bedding once, then curls herself into a disk, hanging her tail off the side and waving it lazily at you to come join her. You do so, slipping past her tail and tucking yourself between her front four legs, resting against the barrel of her chest. Your kip eagerly joins you, squirming up next to you and wrapping her own six limbs tightly around your body, purring all the while as she shares her body heat with her Qim and her Qal.");
		output("\n\nNow that you’re here, what would you like to do with [frostwyrm.name]?");
	}
	else if (flags["FROSTWYRM_KIP_COUNT"] < 6){
		output("\n\nWhen you and [frostwyrm.name] arrive into the lair, your kips excitedly run up to meet you both, chittering in their Frostwyrm tongue in greeting. They each nuzzle against their Qim first as you undress, and she responds in kind, brushing her long nose against her children the same way she did to you.");
		output("\n\nWhen they finish with her, they each bound up to you happily, embracing you in a tight hug sequentially, then giving you long, exaggerated licks across your face, knowing that your kind shows affection differently.");
		if (flags["FROSTWYRM_KIP_COUNT"] > 3){
			output(" When both your cheeks are thoroughly occupied by Frostwyrm tongue, your other ");
			if (flags["FROSTWYRM_KIP_COUNT"] > 4) output("kips get ");
			else output("kip gets ");
			output("creative, licking at your [pc.chest] and across your [pc.belly]");
		}
		output("\n\n[frostwyrm.name] makes her way to the elevated, flattened platform of her resting place at the rear of the lair, curling herself into a disk and leaving a spot open for you. You join her, with some difficulty: your kips, all eager to join their Qim and their Qal with some physical bonding, climb over you and beat you to [frostwyrm.name], curling up between her front four legs and resting against the thick of her chest, ears tensed for her heartbeat.");
		output("\n\nOnce you’re finally good and pinned against [frostwyrm.name] with your daughters all wrapping themselves around you, sharing their body heat with you and cleaning you absently with their long, flat tongues, you finally think of what to do with your family now that you’re here.");
	}
	else if (flags["FROSTWYRM_KIP_COUNT"] < 20){
		output("\n\nYou barely have the time to reach for your gear before you and [frostwyrm.name] are assaulted by your growing clutch. They thankfully go for their Qim first, giving you a moment to remove your effects: they nuzzle lovingly against [frostwyrm.name], against her thick legs and against her snout when she greets them individually. Some of the older ones, displaying what they’ve learned from you, hug against her huge body where they can, licking at her scales affectionately.");
		output("\n\nYou have a much more... thorough time of it, when each of your daughters leaves [frostwyrm.name] to properly greet you home. You’re submerged in strong Frostwyrmling flesh as each daughter wraps her four, powerful arms around you, squeezing you against her body and giving you a thick, long lick across your cheek before letting another kip have a turn. Some grow impatient and share the hug with a sibling, with you crushed in between them; your vision is obscured by fleshy pink tongues caressing your cheeks; some of the more experienced and daring kips lick across your [pc.chest] and all the way down to your [pc.belly]");
		output("\n\n[frostwyrm.name] makes her way to her raised, flattened platform, circling it once before stepping onto it and curling herself into a disk. Most of your kips are already up against her, worming their way between her legs to rest against her torso, yet [frostwyrm.name]’s eyes are on yours as her tail beckons you to join her and your kips.");
		output("\n\nTwo of your kips guide you to her, holding your hands as you make your way there, and let you get cozy against [frostwyrm.name] before showing themselves in, cuddling up against you. They each errantly bathe you gently (not that you needed it, after that extensive greeting); there is no silence in the lair as each and every kip purrs loudly, settling themselves against the body heat of their Qim and their Qal.");
		output("\n\nNow that you’re here, is there something <i>else</i> you’d like to do with your family?");
	}
	else if (flags["FROSTWYRM_KIP_COUNT"] < 100){
		output("\n\nYou’re both accosted immediately by your growing clutch. Most of your kips go to their Qim, nuzzling warmly against her body in traditional Frostwyrm greeting. [frostwyrm.name], patient as she is, takes her time to bend down and greet each and every daughter sequentially, although most of her kips aren’t nearly as patient: they hug against her thick legs, greeting her like they’re greeting you, and cleaning the few scales that are within licking distance. Some even climb up onto [frostwyrm.name]’s back and give her some attention between her wings.");
		output("\n\nIn the chaos, the oldest and most devious of your kips make a beeline for you first, rather than [frostwyrm.name]. They work together to greet you traditionally: they wrap their strong arms against you, pulling you tightly to their Amazonian bodies and keeping you against their form for a bit longer than usual. They each lick across your cheek, greeting you as they always had, and giving your dirty [pc.skinFurScales] a bit of a wash while they’re at it.");
		output("\n\nYour moments with your eldest daughters are interrupted by your younger ones, each fiending for their moment with their Qal. You’re surrounded by the thick muscles, each of them giving you platonic hugs against their powerful forms and each of them giving you loving licks across your face and, when that’s too occupied, across your [pc.chest] and [pc.belly].");
		output("\n\nWhen [frostwyrm.name] makes her way to her elevated, flattened resting platform, she’s never given a moment’s peace from her kips, each of them clinging to her and chittering excitedly about their day. [frostwyrm.name] listens carefully to each story, her psionic abilities granting her the strength to listen to each one perfectly, as she circles her bedding and curls herself into a disk on top of it. Her kips all start squirming their way between her legs, seeking out the warmth of their Qim, but all the while, [frostwyrm.name]’s eyes are on you, her tail wagging lazily in your direction for you to join her.");
		output("\n\nYour kips are careful to leave a spot for you in the warmth of her clutches, but they join the cuddle ball regardless by climbing onto their Qim, curling into their own little balls all across her back. Two of your oldest kips lead you by the hand up to [frostwyrm.name], then, when you show yourself into the huddle, they join you, one against your front and one against your back, hugging you closely and continuing their ‘greeting’ from where they left off.");
		output("\n\nNow that you’re here, what is it you’d like to do with your family?");
	}
	else{
		output("\n\nYou’re reintroduced to the thriving ecosystem that is [frostwyrm.name]’s lair. You are immediately greeted by three of your oldest kips, who gently help you out of your gear before going to their usual, familiar greeting routine: they form a triangle around you, hugging you closely, pressing every facet of their tall, muscular bodies against yours, while bathing your face in languid, exaggerated licks.");
		output("\n\n[frostwyrm.name] is greeted by a swarm of her progeny, each of them chittering and clamoring around her and onto her, and [frostwyrm.name] greets each of them in order, patiently listening to each of their stories. That said, for every kip that’s on her, nuzzling her and bathing her, there are five more that seem to ignore her. There are simply too many Frostwyrmlings in the comparatively tiny lair for [frostwyrm.name] to tend to, and every kip that does not receive special attention knows that they’ll have their chance later.");
		output("\n\nThe lair has turned into a very compact, bustling village of sorts: some kips are better at others at certain tasks or skills, and they’ve established an economy involving food, baths, and sex, where one good or service is worth one or more of another. One adventurous kip has pillaged the foreign settlements on Uveto for thick pelts and exotic cloths; another kip, an exceptional hunter, has rows upon rows of caught and dressed fish that she offers in exchange for pleasure. The walls of the lair are dressed with various knick-knacks and baubles, including several banners that the kips have adopted as an emblem for their house.");
		output("\n\nThe elevated, flattened plateau of ice that [frostwyrm.name] uses for her bed has been adorned with colorful carpets and thick pillows – [frostwyrm.name] is too large to properly enjoy them, but the area is appropriately regal and pleasant for a Qim. A number of kips lie on it, keeping it warm, and they leave without a word once [frostwyrm.name] approaches it. She circles it once before easing herself into it, curling herself into a disk.");
		output("\n\nShe’s soon joined by a dozen or more of her young, six of them worming their way between her thick legs and six crawling on top of her, bathing her between her wings and along the crease of her neck. She has eyes only for you, though; her tail wags lazily at you, beckoning you to join her. You’re led by the hand by your two eldest daughters to [frostwyrm.name], and they allow you to cozy up against her before they join you as well.");
		output("\n\n[frostwyrm.name]’s contentedness and pleasure at being with her Qal and her repopulated species resonates through the psionic link between you and each and every one of your daughters. As soon as [frostwyrm.name] begins purring, your daughters all join her, and soon the sounds of the lair are replaced by a harmonious song of purrs and coos. The two daughters cuddled up against you give you another, gentle, platonic lick across the cheek before going back to what they were doing.");
		output("\n\nNow that you’re here, the Qal of the clan, nestled up against your Qim, what would you like to do?");
	}
	
	/*if (flags["FROSTWYRM_EGGS"] != undefined && flags["FROSTWYRM_KIP_COUNT"] == undefined) addButton(0, "Next", frostwyrmSheHatchedWithoutYou, undefined);
	else */
	frostwyrmMainMenu(false);
}

public function frostwyrmMainMenu(bOutput:Boolean = true):void
{
	if(bOutput)
	{
		clearOutput();
		frostWyrmHeader();
		author("B");
		output("Now that you’re here, what would you like to do with [frostwyrm.name]?");
		output("\n\n");
		if(flags["FROSTWYRM_KIP_COUNT"] > 0) output("You have " + (flags["FROSTWYRM_KIP_COUNT"] == 1 ? "a kip" : (num2Text(flags["FROSTWYRM_KIP_COUNT"]) + " kips")) + " you can interact with. ");
		if(flags["FROSTWYRM_YOUNG"] > 0) output("You have " + (flags["FROSTWYRM_YOUNG"] == 1 ? "one young hatchling" : (num2Text(flags["FROSTWYRM_YOUNG"]) + " young hatchlings")) + " you can spend the time to raise to maturity. ");
		if(flags["FROSTWYRM_EGGS"] > 0) output("You have " + (flags["FROSTWYRM_EGGS"] == 1 ? "an egg" : (num2Text(flags["FROSTWYRM_EGGS"]) + " eggs")) + " you can spend time with until " + (flags["FROSTWYRM_EGGS"] == 1 ? "it hatches" : "they hatch") + ". ");
	}
	
	clearMenu();
	addButton(0, "Appearance", frostwyrmAppearance, undefined);
	addButton(1, "Talk", frostwyrmWeGotSomeDialogue, undefined);
	addButton(2, "Sex", frostwyrmIWantToBangTheLizard, undefined);
	addButton(3, "Kips", frostwyrmBunchaKiddoContent, undefined);
	addButton(4, "Bellyrub", whosAGoodFrostwyrm, undefined);
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) addButton(5, "Boop", frostwyrmTouchDaDragon, undefined);
	
	//(9999 == 0) addButton(5, "Extract", frostwyrmQuestSample, undefined);
	
	if(flags["NYKKE_MET"] != undefined && flags["NYKKE_VERSION"] == 1) addButton(6, "Nykke", nykkeMainMenu, true, "Nykke","Spend some time with Nykke in her lair.");
	
	if(flags["FROSTWYRM_YOUNG"] > 0) addButton(7, "Raise", frostwyrmRaiseHatchlings, undefined, (flags["FROSTWYRM_YOUNG"] == 1 ? "Raise Hatchling" : "Raise " + StringUtil.toDisplayCase(num2Text(flags["FROSTWYRM_YOUNG"])) + " Hatchlings"), (flags["FROSTWYRM_YOUNG"] == 1 ? "You currently have one hatchling waiting to bond with you and [frostwyrm.name] before it can mature. Choosing to remain here will have the hatchling bond with you, allowing it to mature!" : "You currently have " + num2Text(flags["FROSTWYRM_EGGS"]) + " hatchlings waiting to bond with you and [frostwyrm.name] before they can mature. Choosing to remain here will have the hatchlings bond with you, allowing them to mature!"));
	
	if(flags["FROSTWYRM_EGGS"] > 0) addButton(8, "Incubate", frostwyrmIncubateEggs, undefined, (flags["FROSTWYRM_EGGS"] == 1 ? "Incubate Egg" : "Incubate " + StringUtil.toDisplayCase(num2Text(flags["FROSTWYRM_EGGS"])) + " Eggs"), (flags["FROSTWYRM_EGGS"] == 1 ? "You currently have one egg waiting to bond with you and [frostwyrm.name] before it can hatch. Choosing to remain here will have the kip in the egg bond with you, allowing it to hatch!" : "You currently have " + num2Text(flags["FROSTWYRM_EGGS"]) + " eggs waiting to bond with you and [frostwyrm.name] before they can hatch. Choosing to remain here will have the kips in the eggs bond with you, allowing them to hatch!"));
	else addDisabledButton(8, "Incubate", "Incubate", "This is for if you have at least one egg waiting to hatch in the lair. You don’t have any eggs waiting – [frostwyrm.name] would be delighted if you offered to fix that.");
	
	if (flags["FROSTWYRM_KIP_COUNT"] >= 100) addButton(10, "Rule Uveto", frostwyrmItsMineAllMine, undefined, "Rule Uveto", "You sit on your icy throne, your Qim behind you and your village of Amazonian Frostwyrm hybrids before you. With just a word, you could control more than an icy dome in the ocean....");
	else addDisabledButton(10, "Rule Uveto", "Rule Uveto", "You being Qal to a Frostwyrm has given you an idea, but you’ll need more kips before you can act on it....");
	
	addButton(14, "Leave", frostwyrmSayonara, undefined);
}
public function frostwyrmAppearance():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("[frostwyrm.name] is monstrously large; as large, if not larger, than your father’s old Casstech at the shoulders. She walks on all-sixes, and is approximately twenty-feet tall from her talons to the horns on her head, not counting the wings. She’s almost twice as long as she is tall, from snout to tip of the tail, although a chunk of that <i>is</i> the tail.");
	output("\n\nShe’s covered in white scales that glisten in the reflective light of the icy lair; each scale is as large, thick, and strong as a metal shield. Her underbelly is markedly softer, covered in yielding, malleable, gray scales, though you doubt any conventional weapon would still do much to them.");
	output("\n\nEach of her six legs are capped with razor-sharp talons that slice through snow and puncture and grip ice without any effort. The end of her tail is covered in blunter spikes, made for bludgeoning rather than piercing. She has not one, but three rows of razor-sharp teeth in her massive maw, each tooth as long as a shortsword. She’s the result of millions of generations of evolution, honed into a perfect, ferocious killing machine – if you weren’t better acquainted with her, you’d know to keep your distance. The fact that she uses her strength and lethality not to harm you, but to love you, makes you feel very lucky, in more than one sense of the word.");
	output("\n\nFocusing on her gentler features, she has four ruby-red eyes, each of them twice as large as your own but comparatively marble-esque in her elongated, lizard-like face. She has two wings sprouting from her back, giving her a combined wingspan of forty feet, powerful enough to provide lift. She has blue marks across the scales of her body, looking almost like tattoos; you’re not certain of the significance, but it may be a visual way to identify one Frostwyrm from another, similar to fingerprints.");
	output("\n\nNestled snugly between her rearmost-two legs is a pair of external testicles, packed into a tough, leathery scrotum. Each oblong nut is so large that you could curl yourself into a ball and fit inside one of them. A bit closer to her belly is her penile vent; when unaroused, it blends and camouflages well amongst the rest of her belly scales, making it hard to spot. When at full arousal, her penis is three feet long and as thick as both of your forearms together, capped with a flat, mostly-featureless head, save from a rim of muscle around its glans, reminding you of a tree trunk. The skin of her cock is so thick that it hides her pulsing veins and the shaft has several nubs and pricks along the underside of its length.");
	output("\n\nBehind her testicles is her draconian vagina: the exposed labia are bluish-pink, and the muscles around them pull and usher deeper into her body, towards her womb. It’s appropriately sized for her form – ");
	if (pc.hasCock()) {
		if (pc.biggestCockLength() < 23) output("you can scarcely believe you can provide any sort of satisfaction to her, but she seems to enjoy you as well as you enjoy her");
		else output("she’s easily capable of taking your own girth into her, and she enjoys it as much as you do");
	}
	else output("if you had a dick, you can’t imagine it being large enough to truly satiate her needs");
	output(". Capping her vagina is a clitoris, blue and beady, about the size of your fist - while large to you, it’s about appropriate for her size.");
	output("\n\nThough it’s usually concealed by her tail, she has a large, blue-ringed anus where her tail meets her spine, right where it belongs.");
	output("\n\n[frostwyrm.name] shuffles her body slightly, gently nudging you closer to her belly and to her rear legs. <i>Your observations are not subtle, [pc.name],</i> she tells you. <i>If you are so inclined to study my body, I can provide you with a closer look.</i>");
	output("\n\nHer penile vent begins to bulge just slightly as her arousal begins to stir. Perhaps she likes it when you ‘study’ her.");
	
	clearMenu();
	processTime(5);
	addButton(0, "Next", frostwyrmMainMenu, undefined);
}
public function frostwyrmWeGotSomeDialogue():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("What do you want to talk with [frostwyrm.name] about?");
	
	clearMenu();
	addButton(0, "Qim&Qal", frostwyrmQimAndQal, undefined);
	addButton(1, "Psionics", frostwyrmPsionicsTalk, undefined);
	addButton(2, "OtherWyrms?", frostwyrmAnybodyOutThere, undefined);
	addButton(4, "Back", frostwyrmMainMenu, undefined);
}
public function frostwyrmQimAndQal():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("You ask [frostwyrm.name] about her language. From the stiff way she uses her words, it seems like she doesn’t speak very often.");
	output("\n\n<i>I do not speak at all,</i> she corrects you. <i>The concept of communicating by vibrating muscles in your mouth is equally alien to me. As is...</i> she hesitates, trying to piece her thoughts together, <i>communicating in your... vernacular. Behind each word in your language is a definition, or an idea; the word ‘idea’ refers to a thought that one kind has before sharing it with another, correct?</i> You respond affirmatively. <i>It is inefficient. To put it in a way you would understand, my kind communicate by sharing these definitions and ideas without putting them to words. Your language is obstinate and ugly.</i>");
	output("\n\nWell, you respond, even though she says that – or thinks that, or... whatever – there are two words she likes to throw around quite often: the words ‘Qim’ and ‘Qal.’ What do they mean?");
	output("\n\n<i>In your understanding, they would be similar to ‘honorifics,’ as I had explained to you before. They refer to the position an individual has within a clutch. The ‘Qim’ is the provider: a clutch’s Qim provides food, shelter, and protection. The ‘Qal’ is, in your word, the teacher: the Qal is the individual that interprets the knowledge of past generations to the kips.</i>");
	if (pc.isBimbo()) output("\n\nThat... like, that doesn’t sound like you. You know lots about some things, ‘specially if they’re fun or sexy, but that’s about it.");
	else output("\n\nYou ask if, in that case, that’s truly a title meant for you, seeing as you aren’t a true, proper Frostwyrm. Wouldn’t she make for a better Qal than you?");
	output(" <i>I disagree. To be, in your language, ‘blunt,’ I am much larger than you, [pc.name]. That you could consistently defeat me in battle, despite the difference in bulk, displays greater knowledge and understanding of the world than I have. Our kips would benefit a great deal from your teachings.</i>");
	output("\n\nYou hadn’t considered that. Are there other titles that an individual could have within a clutch? <i>Other than ‘kip,’ which refers to any spawn, there is one,</i> she answers. <i>The title ‘Qer.’ It is... in your word, it is an ‘insult,’ used to describe an individual that does not provide for their clutch. To be called one is a considerable offense.</i>");
	output("\n\nAt least you know <i>one</i> word not to be whipping around the lair, now. You ask [frostwyrm.name] about her own Qim and Qal, and where they are. <i>They have since joined the Grand Qim, many Sky Cycles ago,</i> she answers forlornly, her neck suddenly slumping downward. Given her words and body language, you don’t need to ask what she means. <i>Each of my kind stay within their inner circle until their Qim and their Qal join the Grand Qim. Then, they leave in search of a mate to begin their own clutch.</i>");
	output("\n\nYou ask if you’re expected to stay with the clutch as the Qal, in that case. <i>Of course.</i> She answers with a condescending lilt, like you had asked her what color the sky was. Then, she relents. <i>I apologize; I must remember that your kind do not share the same traditions as my kind. But yes; our kips will not have need to leave the lair in search of mates, Qals, or Qims, as long as we are with them. We will provide for their every need.</i>");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output("\n\nSounds like fun to you.");
	else output("\n\nSounds... kind of weird to you.");
	
	clearMenu();
	processTime(5);
	addButton(0, "Next", frostwyrmWeGotSomeDialogue, undefined);
}
public function frostwyrmPsionicsTalk():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("You ask [frostwyrm.name] about her psionic powers. They aren’t something that a lot of creatures in the universe are capable of. Is it a skill that can be taught? Is it something that Frostwyrms are just... equipped with?");
	output("\n\nYou feel [frostwyrm.name] probe your mind for a moment, searching for definitions on your words. <i>I find this a curious topic,</i> she answers cryptically. <i>And that you consider it a supernatural power. If my method of communication is so obscure and surreal to you and your kind, you may have difficulty understanding its intricacies.</i> She huffs once, slowly. <i>Even describing them as ‘intricacies’ is unusual to me.</i>");
	output("\n\nIn that case, you tell her to work with one question at a time. Is it something you can learn to do?");
	output("\n\n<i>I am afraid I am not certain,</i> she answers solemnly. <i>My Qal did not teach it to me, nor did the Qal of my Qal teach it to them. And yet,</i> she continues, <i>it is but a function of the mind");
	if (!pc.hasWings()) output(". You are not asking me to teach you to fly, when you have no wings");
	output(". We are equally equipped.</i> She lowers her long neck and nuzzles you gently. <i>Passing you the ability to communicate as I do would be my privilege. I will consider teaching methods later.</i > ");
	output("\n\nYou look forward to it. In the meantime, you ask another question: what are the limits of her psionic abilities? Can she lift blocks of ice with just her mind?");
	output("\n\n<i>That is an absurd idea,</i> she responds, while her lungs heave in short bursts, crudely mimicking laughter. <i>I am merely communicating with you, [pc.name]. I would ask you if you could move a block of ice by shouting at it.</i>");
	output("\n\nWhile that’s fair, you note that she has the ability to make you feel sensations and feelings with her powers, and you certainly can’t do <i>that</i> with some words.");
	output("\n\n<i>Perhaps you are not using the correct words, then,</i> she rebuts. <i>I am only conveying a sensation to you, and your body is responding in kind. This is how my kind communicates. If your language cannot inspire emotions in the same way mine can, then your language and method of communication are inferior.</i>");
	output("\n\nYou tell her that you hadn’t considered that the Frostwyrms were a species of poets. You feel her search your mind for a moment for the definition of the word ‘poet.’");
	output("\n\n<i>To call even your finest, most eloquent speaker, able to convey their ideas and emotions the most concisely and perfectly, on par with the method my kind communicate, is a poor overestimation of your language. Your kind use words to express love; my kind</i> feel <i>it.</i>");
	output("\n\nOn cue, you feel a warmth blossom in your chest and your lungs grow short of air. Your hands begin to tingle; your heart rate increases drastically; and your vision begins to grow clearer as it focuses on [frostwyrm.name]. By all accounts, what you’re feeling right now is love. <i>Your kind use words to express lust; my kind</i> feel <i>it.</i> As the words leave her psionic mouth, your arousal suddenly skyrockets: ");
	if (pc.hasCock()) output(" your [pc.cock] is rock hard and leaking, eager for the first warm, wet hole it finds");
	if (pc.isHerm()) output(", and ");
	if (pc.hasVagina()) output(" your [pc.vagina] is soaked and lubed, signaling for the first nearby pulse to penetrate it and seed it properly");
	if (pc.lust() > 70) output(". Not that any of that wasn’t already true, but you’re feeling it all the harder right now");
	output(".");
	output("\n\n<i>Your kind use words to express sadness.</i> You subconsciously brace for whatever it is that [frostwyrm.name] is about to make you experience; the last two emotions were powerful and raw, and you’re certain that whatever [frostwyrm.name] has in mind for ‘sadness’ is going to be a bad time. Yet, nothing - nothing, except, the sudden flagging in your rampant lust, back to what it was before. <i>I would not subject you to that sort of experience, my Qal, but you now understand the power of proper communication between individuals of my kind.</i>");
	output("\n\nCan she read your mind?");
	output("\n\n<i>... yes,</i> she hesitates, <i>but your thoughts are... difficult to understand. My kind spares only one idea at a time; your kind, or perhaps only</i> you, <i>have so many ideas, all at once, and it is disorienting to follow them all. When you use a word or idea I do not understand, it is a taxing effort to search your mind for its definition. I rather prefer it when your mouth filters your ideas to one at a time.</i>");
	output("\n\nYou have one last question. When you speak, the distance you can be heard is limited to your voice and your lungs. Is there a maximum distance a Frostwyrm can communicate to others?");
	output("\n\n<i>There is no ‘maximum distance,’</i> she answers, <i>but we must be familiar with whom we are communicating. Imagine being in a space occupied by others of your kind. Without a proper link between individuals, your ideas and words would be shared only with yourself, no matter how close in proximity you are to others. For my kind, imagine that space is as large as the world.</i>");
	output("\n\n<i>“Sounds lonely,”</i> you say errantly.");
	output("\n\n<i>It was.</i> [frostwyrm.name] bends at the neck, nuzzling you once again and drawing a long, loving lick across your cheek. <i>No longer.</i>");	
	
	flags["FROSTWYRM_PSIONICS_TALK"] = 1; //used in nykke.as
	
	clearMenu();
	processTime(10);
	addButton(0, "Next", frostwyrmWeGotSomeDialogue, undefined);
}
public function frostwyrmAnybodyOutThere():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("When you and [frostwyrm.name] first met – or, more appropriately, when you first began to understand each other – she told you that she was looking for a mate, and that, in not as many words, you were her second option, her ‘Plan B.’ Does she have any idea where other Frostwyrms might be?");
	output("\n\n<i>Had I, I would not have chosen you as my mate,</i> she answers curtly.");
	output("\n\nYou suppose that’s a fair (if blunt) answer. You ask her if she has any idea where they might be – in response, she takes a deep breath, drawing in a huge lungful of air into her bestial lungs, and then makes the largest sigh you have ever heard another creature make.");
	output("\n\n<i>I do not,</i> she answers sadly. <i>The world is larger than I had anticipated. I have found no evidence of others of my kind nearby.</i> She eyes the walls of her lair with indifference. <i>My choice of nest, in the middle of the ocean, makes journeying and searching rather inconvenient as well.</i>");
	output("\n\nAre Frostwyrms normally such an elusive species? Was she taught to expect to have difficulty finding another of her kind?");
	output("\n\n<i>My kind are few in number, but...,</i> she hesitates, <i>I did not anticipate the difficulty in locating another. It had been many, many Sky Cycles until I encountered you.</i>");
	output("\n\nDoes she have any idea where they <i>could</i> be, or why they might have disappeared?");
	output("\n\n<i>I do not entertain the idea that I am the last of my kind in the world,</i> she answers sternly, telling you with her tone that you shouldn’t imply it either. <i>In truth, I simply do not know. My own Qim and Qal had no difficulties finding each other. It could be any number of realities: perhaps food has grown scarce in the world, or perhaps the arrival of kinds like yours have driven them into hiding.</i>");
	output("\n\nA low, resonating rumble vibrates in her long throat, sounding like a puppy’s whine, but much lower in pitch. <i>It is... disconcerting. I broadened my search every Light’s Rise. I sang different songs to the winds. And every Light’s Fall, I returned to an empty lair. When my Qim and Qal joined the Grand Qim, I believed I was prepared for the realities of my world, but the... the nothingness of the world awaiting me was....</i>");
	output("\n\nShe lays her head on the flat plateau of her bedding, heaving another large sigh. She’s done talking, and you don’t blame her. But you’re not about to sit there while your Qim is in distress over the status of her species.");
	output("\n\nYou pull away from her, exposing yourself to the chill of her lair again, and make your way to her neck. You trail your fingers along her scaly flesh, until they rest against her skull, just beneath her two red eyes. You level yourself by falling to your [pc.knees], and you wrap your arms around her snout, pulling her gently to your [pc.chest].");
	output("\n\nYou tell her that you may not be one of her kind, but if there’s anything your kind is capable of, it’s being a good mate. Both of you are capable of feeling every emotion on the spectrum, and if [frostwyrm.name] needs your help, even if it’s just being an ear to listen or someone warm to cuddle up with during Light’s Fall... that’s just what being a good mate is, whether you’re a Frostwyrm or not. You know you weren’t her first option, but as long as you’re her Qal and she is your Qim, the world doesn’t have to be filled with nothingness.");
	output("\n\nAs the words pour from your mouth, you feel [frostwyrm.name]’s psionic magic work your body over; where before you didn’t really feel anything out of the ordinary, you now feel a fuzzy warmth blossom from your chest, quickly spreading to your digits. Your [pc.skinFurScales] feels hot; you start to feel a little short of breath; and you’re suddenly overcome with the urge to smile. The low whining from before is replaced with a steady, gentle purr, resonating throughout your body.");
	output("\n\n<i>Had I known where others of my kind were, [pc.name], I would not have chosen you as my mate,</i> she begins. <i>I consider myself fortunate that I had not. You are, perhaps, a messenger from the Grand Qim.</i> She nuzzles her draconic snout back against you affectionately. <i>My every need in a mate is met – emotionally, physically, and intellectually. I worry for my kind, but I do not worry for myself.</i>");
	output("\n\nYou rub your own cheek against [frostwyrm.name] as she responds, enjoying the intimacy with her. Her four ruby-red eyes close in contentment as she rests against you. You tell her that you’re an intrepid explorer, with hundreds of thousands of years of technological advancement at your disposal, and she has the strength to search all of Uveto for days at a time – between the two of you, you’re <i>sure</i> you can find other Frostwyrms before long.");
	output("\n\nHer contended purring does not stop. <i>I am no longer in any hurry,</i> she says.");
	
	clearMenu();
	processTime(10);
	addButton(0, "Next", frostwyrmWeGotSomeDialogue, undefined);
}
public function whosAGoodFrostwyrm():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("Your eyes rove over [frostwyrm.name]’s body, particularly the grey scales of her front-side. They’re softer and more flexible than the scales along the rest of her body, and they gently heave with her lungs and they reverberate with her massive, powerful heart. You lay your hand on her belly, and you run your hand across it. The scales bend into their grain smoothly, deceiving you; it almost feels like skin.");
	output("\n\nShe sighs through her nostrils, and her body leans and rocks against you. The movement is so slight and automatic, you aren’t sure if she’s conscious of it. But it does incentivize you to find out.");
	if (flags["FROSTWYRM_BELLY_RUB"] == undefined) output("\n\nYou ask [frostwyrm.name] to roll onto her back, if she can. You request is met with some confusion: [frostwyrm.name] glances towards you, all four red eyes on you inquisitively. <i>I can fulfill this request, my Qal, but... may I ask why?</i> You tell her that you’d like to do something for her, and she needs to be on her back for it. You promise that... she won’t <i>dislike</i> it. <i>As you say, my Qal.</i>");
	else output("\n\nYou ask [frostwyrm.name] to roll onto her back. Through your psionic connection with your mate, the request is met with excitement, even exhilaration; she remembers the last time you asked her to do this and the sort of calming pleasure you had given her when you did. <i>Would that I could return these pleasures, I would bestow them to you from Light’s Rise to its Fall. Thank you for doing this for me, my Qal.</i>");
	output("\n\nYou disengage for her to give her the space she needs. She needs to heave a little bit – it reminds you of a turtle trying to flip over when it’s on its shell – but, after a few heavy rocks back and forth, she’s on her back, her wings folded beneath herself. You ask her if she’s comfortable. <i>I am comfortable enough,</i> she responds. You take that as enough of a permission.");
	output("\n\nWith some effort, you climb onto [frostwyrm.name]’s body, using the pit of her closest leg as a stepping stone to help you up. You remain on your hands and knees, spreading out your weight, and you’re careful with where you put your limbs. You ask her if she’s still comfortable. <i>It is unique, feeling you upon my form like this. It is not uncomfortable.</i>");
	output("\n\nThat said, you get to work: you lay flat on her belly, and you work your limbs in slow, sensual, careful circles, using as much of your own body to cover as much of hers as you can. You feel her muscles bend and move languidly with you, tightening and loosening as you slowly massage her. You also try to not lay on one spot for too long, and after a minute, you crawl forward just a little, towards her ribcage, and starting again.");
	output("\n\n<i>My word,</i> you hear her whisper to herself. You ask her if she’s enjoying it, and if there are any spots she’d like you to get. <i>This is surreal. The Grand Qim would be envious of this attention.</i> She pauses and sighs before answering your second question. <i>Could you... reach toward my left side a bit...?</i>");
	output("\n\nYou do as she asks, your arm reaching toward the same pit of her leg that you used to climb onto her. When your fingers tickle at the thick muscle there, her leg starts to paw at nothing in the air gently, her claws extending to cut at the air before retracting as she pulls back and starts the cycle over. Her body shakes very slightly on her other side, and you look over your shoulder – her rearmost right leg is doing the same thing.");
	output("\n\nHer breathing is long, exaggerated, and steady. Soon, her body starts to vibrate, starting at her chest and going all the way south to her groin and all the way north to her throat; it’s intense on her inhales and comes out as whiny, almost infantile whines and sighs on her exhales. She’s purring, and quite loudly.");
	output("\n\nYou maintain your pattern, with working a certain spot for a few moments before inching your way across her body and starting again, methodically getting different spots on her belly scales. When you do, and [frostwyrm.name] notices that you’re moving, her purring raises another decibel, and a different leg of hers begins to kick. After a while, her body twists slightly, curving her spine laterally until her body takes an S shape. It doesn’t look comfortable to you, but hell, whatever she wants.");
	output("\n\nIt takes you the better part of an hour, to cover [frostwyrm.name]’s gargantuan belly with rubs, but you get it done. You’ve gotten everywhere from her belly, to the pits of her limbs, to her ribcage, and you’ve ended at her lower belly, about arm’s reach from her groin. You don’t proceed any further – not without her permission, anyway.");
	output("\n\nYou climb down from her belly, back towards her side. She rocks from one side to the other again, like she had to get onto her back, until she’s on her side, facing you. You retake your position in the crook of her limbs, nestling and cuddling yourself against her body.");
	output("\n\n<i>The words of your language do not do you or your practices justice, my Qal,</i> she says, her huge head craning towards you and her long, pink tongue sliding out to give you a loving, sensual lick across your body. Her purring has calmed somewhat, but has not stopped. <i>I am privileged to call you my mate.</i>");
	output("\n\nYou adjust yourself against her, getting yourself warm and comfortable against her scaly body once more. The loud-yet-gentle purring relaxes your body and mind as you press an ear against her heart.");
	output("\n\nThrough your psionic connection with [frostwyrm.name], you can tell that she’s hesitant and anxious about something. You reassure her that there is nothing that she could say or do that you, as her Qal, wouldn’t acquiesce; if she has something to say to you, you implore her to say it.");
	output("\n\n<i>Do not,</i> she begins haltingly, unsure of how to word her sentence. <i>Do not vacillate to perform this act a second time. Or... further times.</i>");
	output("\n\nYou tell her that you’ll keep it in mind.");
	
	clearMenu();
	IncrementFlag("FROSTWYRM_BELLY_RUB");
	processTime(60);
	addButton(0, "Next", frostwyrmMainMenu, undefined);
}
public function frostwyrmTouchDaDragon():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");

	output("You find yourself looking up, towards [frostwyrm.name]’s face. It could just be because you’re in her lair, or because you’re lying next to her, or because you’re dependant on her to go back to Irestead if you wanted, but you’ve been thinking about her a bit more often lately.");
	output("\n\nThere’s a lot that’s going into you being exactly where you are right now. You remember starting this whole adventure on Tavros – simultaneously not so long ago, and such a long time ago that you’d hardly recognize who you were if you met yourself on the street – determined to claim your father’s inheritance and take over his multi-trillion-credit company. You had been through jungles; desert wastes; sprawling desert caves; and across a frozen tundra to get to this point.");
	output("\n\nAnd then you met [frostwyrm.name]. Frostwyrms, as you understand it, are an endangered species: once, the apex predator of Uveto, but now they’re so few and far between that [frostwyrm.name], in her desperation for a mate and to have a child, took the chance and chose to mate with you.");
	output("\n\nThere aren’t a lot of people in this universe that can say that a dragon found them exemplary enough to take them as a mate. If you recall correctly, [frostwyrm.name] had said that you weren’t the first, so it’s an exceptionally rare offer. You could have said no, and then went back to the bar in Irestead and fucked the first drunk, willing hole you found – but you accepted. You won’t lie: some part of you agreed so <i>you</i> had that rare privilege of saying that you had sex with a dragon, like it was some kind of badge. But you had stayed for <i>her.</i>");
	output("\n\nMaybe it was a spur of the moment decision: you two had fought a handful of times, and it was only after you had proven yourself the better fighter (except for that one fateful time) that she finally decided that you’d make a good mate. She seemed confident that Frostwyrms were compatible with [pc.race]s, but it was a gamble. Maybe she felt like she <i>had</i> to; after all, she sometimes likes to remind you that you weren’t her first choice.");
	output("\n\nBut here you are. In a Frostwyrm’s lair, in the middle of the ocean, cuddled up next to the Frostwyrm that had taken her chances with you – and with your healthy, beautiful firstborn kip next to you both. You had made it work. Her gamble had paid off. Her line wasn’t going to end with her.");
	output("\n\nFrostwyrms communicate almost purely through emotions, and [frostwyrm.name] communicating in a way you understand is for your benefit, not hers. But that doesn’t mean you can’t feel what she’s feeling. When she’s happy, you can feel her happiness; when she’s content, like she is now, you can feel her ease; when she’s aroused and lustful, well... that certainly helps with skipping the formalities.");
	output("\n\nMost importantly, though, you can feel her affection. Her affection for you and for the clutch you’ve started with her. She had been alone for most of her life, and you gave her the one thing she had been after since she had settled in her lair all those ‘Sky Cycles’ ago. You don’t need to be able to read her mind to know just how much you mean to her: it’s not just the family you’ve started with her, but the companionship and company that she’d been starved of since the beginning. She had never once told you that she loves you – emotions are everything with Frostwyrms, and she might be hesitant to use a word that powerful – but you don’t need her to. You can feel it.");
	output("\n\nYou disengage from [frostwyrm.name]. She looks at you curiously, but doesn’t ask you what you’re doing – not even when you loop to her front and stand before her. She lowers her face, bringing her four deep, ruby-red, intelligent eyes to yours. You can see your reflection in them.");
	output("\n\nA hug would feel too comical for you to take seriously, considering your size differences, and although a kiss is a universal gesture in your culture, it wouldn’t be in hers. Besides, a kiss is too fleeting. You want to express to her how much she means to you, and that you know how much you mean to her, without using words, and without resorting to something as base as mating – while it inarguably brings you two closer (and is certainly the most fun of your options), it doesn’t capture your emotion as well as you feel it could.");
	output("\n\nActing mostly on instinct, you place your palms on either side of [frostwyrm.name]’s jaw, and you close the gap, pressing your [pc.nose] against hers. She sometimes like to nuzzle against you, so, with any luck, she’d understand what it is you hope to convey to her.");
	output("\n\nShe doesn’t say anything. Her eyes close, and a low, throaty rumble comes from her closed mouth and vibrates through the ice you’re standing on. Her body relaxes, languidly spilling into a puddle on her icy platform, and she leans into you, returning the gesture and pressing her nose back against you.");
	output("\n\nYou feel a number of emotions through your psionic link with her. None of them are unusual or unfamiliar – contentment, happiness, affection – but they’re more pronounced now than when they were just moments ago. You know she isn’t poking around in your head, looking for why you’d thought to do this, probably because she knows exactly why.");
	output("\n\nYou drop to your [pc.knees], just to give them a break, since you figure you’re probably going to be there for a while. You both lean into each other, and [frostwyrm.name] tips her nose downward to follow you, keeping your connection from breaking. ");
	if (flags["FROSTWYRM_KIP_COUNT"] == 1) output("Your kip joins her Qim in song, her own throaty purr joining hers and reverberating off the icy walls of the lair.");
	else if (flags["FROSTWYRM_KIP_COUNT"] <= 10) output("Your kips cuddle up and relax against their Qim, their own songs joining with [frostwyrm.name]’s throaty purr, until the only thing you hear, and the only thing you feel, is them.");
	else output("The bustle of the lair stops, and your family all cuddle up with each other, in response to the affection their Qim and their Qal is broadcasting to them all. Their purrs join with [frostwyrm.name]’s, until the lair is a certified orchestra of singing Frostwyrms.");
	output("\n\nAfter a long few moments, you stand, finally breaking the physical connection with [frostwyrm.name]. You don’t leave her unattended for long, though: you stand and make your way back to your sitting place, right between her forelegs, against her beating heart.");
	output("\n\nWhen you show yourself back to your spot, her massive legs close gently around you, holding you closer to her, pressing your ear against her chest. There wasn’t a word between you two, but there was no need: you and [frostwyrm.name] could tell everything the other needed to hear without a sound.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 100) output("\n\nMaybe staying here for good isn’t such a bad idea. What does the company even have that you’d miss?");

	clearMenu();
	processTime(30);
	addButton(0, "Next", frostwyrmMainMenu, undefined);
}
public function frostwyrmIWantToBangTheLizard():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	if (pc.lust() > 50)
	{
		output("You shuffle in your seat, leaning deeper against the soft, pliable scales of [frostwyrm.name]’s underbelly. Her strong-yet-yielding body feels so good against your body; you take a deep breath, filling your nostrils with the earthy, powerful-but-not-overwhelming scent of her draconic body. Y");
		if (pc.hasCock()) output("our [pc.cock] was already rather stiff, itching and impatient for the first warm hole it finds");
		if (pc.isHerm()) output(", and y");
		if (pc.hasVagina()) output("our [pc.vagina] was already wet and slick, hungry for a dick, or a tongue, or some fingers, or anything to satiate it");
		output(". You idly wonder if [frostwyrm.name] is in the mood.");
		output("\n\nIn response to your unspoken desires, [frostwyrm.name] huffs deeply, and she shifts her body, nudging you towards her rear two legs. Her penile vent has bloated obscenely, and the head of her massive, blunt draconic cock has already began to peek. Before your very eyes, it grows longer and fatter, the skin of her vent stretching comfortably to make room for her tree trunk of a dick.");
		output("\n\n<i>You need not ask for the touch of your Qim, [pc.name],</i> she says to you gently, warmly encouraging you to explore her body. Your psionic link with her is feeding your lust into her feelings, and her body is responding to your lust. <i>A proper mate would ensure their other half has want for nothing.</i>");
		output("\n\nShe wants you as badly as you want her. How would you have [frostwyrm.name] this time?")
	}
	else
	{
		output("As you sit and relax against [frostwyrm.name]’s belly, you start to feel a little... anxious. Excitable. You were sitting there, enjoying your time staying with your mate and the atmosphere of the lair, when suddenly, you were in the mood to get worked over. Y");
		if (pc.hasCock()) output("our [pc.cock] is already stirring, filling with blood and raising to about half-chub");
		if (pc.isHerm()) output(", while y");
		if (pc.hasVagina()) output("our [pc.vagina] starts to feel a little ticklish and sensitive, ready to start lubing itself for the first halfway phallic thing nearby to penetrate it");
		output(".");
		output("\n\nYou feel a deep, gentle rumbling in [frostwyrm.name]’s belly, and you feel her shuffle her enormous body slightly, dragging her form across your back and pushing you a little closer to her rear legs. Her penile vent has begun to bloat, though her penis isn’t quite visible yet. That’ll change in a few moments.");
		output("\n\n<i>The Qim desires the touch of the Qal, [pc.name],</i> she tells you. Her psionic link is feeding her lust into you, and your body is responding to her feelings. <i>A proper mate would ensure their other half has want for nothing.</i>");
		output("\n\nYou couldn’t agree more. How would you have [frostwyrm.name] this time?");
	}
	
	clearMenu();
	processTime(1);
	
	if(pc.hasVagina())
	{
		if(pc.fertility() <= 0) addDisabledButton(0, "Get Bred", "Get Bred", "You are infertile and unable to be bred.");
		else if(pc.hasPregnancyOfTypeOtherThan("FrostwyrmPregnancy")) addDisabledButton(0, "Get Bred", "Get Bred", "You are unable to be bred while pregnant with different pregnancy types other than [frostwyrm.name]’s.");
		else addButton(0, "Get Bred", (flags["FROSTWYRM_DICKED_YOU"] == undefined ? frostwyrmRidersMustBeOver4FeetToContinue : frostwyrmDickRepeat));
	}
	else addDisabledButton(0, "Get Bred", "Get Bred", "Requires a vagina.");
	addButton(1, "Up Your Butt", frostwyrmAnalFunTimes, undefined);
	if(pc.hasCock())
	{
		if(pc.virility() <= 0) addDisabledButton(2, "Behind Her", "Behind Her", "You are not virile and unable to breed her.");
		else addButton(2, "Behind Her", (flags["FROSTWYRM_GOT_DICKED"] == undefined ? frostwyrmItsAHotdogInAHallway : frostwyrmVaginalRepeat));
	}
	else addDisabledButton(2, "Behind Her", "Behind Her", "You can’t properly breed your mate if you have nothing to breed her with!");
	if (flags["FROSTWYRM_GAVE_BATH"] != undefined) addButton(3, "Bathe", frostwyrmSteeleIsADirtyGirl, undefined);
	if (flags["FROSTWYRM_GAVE_BATH"] != undefined) addButton(4, "Blow Her", frostwyrmAllowMeToReturnTheFavor, undefined);
	if (flags["FROSTWYRM_GAVE_BATH"] != undefined) addButton(5, "Eat Her", frostwyrmLickTheMagicDragon, undefined);
	addButton(14, "Back", frostwyrmMainMenu, undefined);
}
/*public function frostwyrmQuestSample():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("Just as you begin to settle in, snuggling up against [frostwyrm.name]’s warm body, you remember the device the good Doctor Lessau had given you, along with the mission of extracting some Frostwyrm blood for him to study. You’re excited to pitch the idea to [frostwyrm.name], of her giving you some blood in the name of science – but you hesitate. It would mean wounding her.");
	output("\n\n<i>Your mind is troubled,</i> she notes. <i>You know I do not read your thoughts beyond definitions, for your respect, my Qal. If your Qim can ease your mind, you may ask.</i>");
	output("\n\nYou bite your lip. Well, you figure, what’s the harm in letting her know?");
	output("\n\nYou pull away from her and tell her that you’ll be right back. You head to the affects you had discarded in the corner of the lair, searching through your gear for the device: a long, flat, circular metal disc, with a glassy dome in its center. This is it.");
	output("\n\nReturning to [frostwyrm.name], you show her the device, flipping it over and twisting it between your hands for her inspection. She leans in close, her four eyes scanning it studiously, as you explain that there’s a colony of others of your kind not far from the coast where you and she had met. In that colony is a scientist – a fancy word for a scholar, which itself is a fancy word for someone that is well-learned and is ever in pursuit of knowledge for the benefit of their species – that gave you this device.");
	output("\n\n[frostwyrm.name] listens to your very carefully, her undivided attention on your every word. You tell her that this scientist had told you that he was interested in studying Frostwyrms like herself – the apex predator of the planetoid – and would love nothing more than a sample for him to study.");
	output("\n\n<i>What would you need of your Qim?</i> she asks you");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output(". While your attention is on [frostwyrm.name], you’re acutely aware of the eyes of your offspring on you both, listening just as intently as [frostwyrm.name] is");
	output(". You answer curtly, and preface by saying that she shouldn’t feel pressured to say yes just because you’re her mate. You’d need her blood. Enough of it to fill this device.");
	output("\n\n[frostwyrm.name] remains still; she shows no outward emotion, though her eyes are trained on the metal device in your hands. <i>And you say my sample would further the knowledge of your kind?</i> she asks you, and you reply positively. ");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined)
	{
		output("You both hear the occasional suggestion from your daughter");
		if (flags["FROSTWYRM_KIP_COUNT"] >= 2) output("s");
		if (flags["FROSTWYRM_KIP_COUNT"] == 1) output("she thinks her Qim should offer it. What purpose would their Qal have for lying?");
		else output("they’re unanimous in the opinion that their Qim should offer it. They all trust their Qal whole-heartedly; what purpose would you have for lying?");
	}
	output("\n\nShe lets out a heavy sigh and comes to a silent decision. Still laying on her platform, she extends her right forefront leg forward, and then cranes her long neck down and harshly bites into it, flinching as she does so, her triple-layered teeth skewering her own scales and flesh like wet paper. <i>Quickly,</i> she tells you as she pulls away, her blue-green blood running rivers down her fresh wound.");
	output("\n\nYou waste no time in pressing the disc against her bloody wound, and you flip a switch on its side. The device hums and vibrates, quickly working to suck the fresh blood into the glassy dome on its surface until it’s full to the brim with the bluish-green ichor. With that done, it makes a clicking sound, then a whir, as it sprays a sealing, restorative foam on the wound. When it’s finished, it falls to the ice, clanking loudly – and in the wound’s place is a fresh scale, already regenerated.");
	output("\n\n<i>My sample comes with a condition, [pc.name],</i> she warns you as you pick up the device, weighted heavily with her blood. <i>You must inform me what your ‘scientist’ learns of it. I would be as informed on my own kind as you and yours are.</i>");
	output("\n\nYou tell her that, as soon as the results come in, she’ll be the first to hear about it.");
	
	clearMenu();
	pc.removeKeyItem("Blood Extractor");
	pc.createKeyItem("Vial of Frostwyrm Blood", 0, 0, 0, 0, "");
	addButton(0, "Next", mainGameMenu);
}
*/
// putting each sex scene separately, figure it'd be easier to keep track of variables that way
public function frostwyrmItsAHotdogInAHallway():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	var vIdx:int = -1;
	if(pc.hasVagina() && pc.fertility() > 0 && pc.blockedVaginas() == 0){
		vIdx = pc.findEmptyPregnancySlot(1);
		//if(vIdx < 0) vIdx = rand(pc.totalVaginas());
	}
	
	output("[frostwyrm.name] nudges you with her snout, pushing you towards one end of the lair. <i>Approach my resting groove,</i> she instructs. You turn to see what she’s referring to: the flat, raised bit of ice that you had spied when you first entered the lair. It’s not especially tall, but if you stand on it, it might be the boost you need to ‘reach’ her.");
	output("\n\nYou do as she commands, approaching the ice table. When you get to it, she sticks her long snout between your [pc.legs], helping you vault up onto it – but not without taking a deep sniff through her nose, taking in her mate’s scent for herself. She shudders, and you feel her string at your thoughts, sharing with you the... <i>urgency</i> she suddenly feels. Once you’re on the ice table, she sticks out her tongue, drawing it down your [pc.belly] and across your [pc.cock]");
	if (pc.hasVagina()) output(", then along the gash of your [pc.vagina], getting a taste, shuddering again...");
	output(".");
	output("\n\n<i>I cannot bear this any longer,</i> she says, twisting around in a hurry. She plants her six feet hard into the ice and lifts her tail up and across her back, bearing her glistening, draconic quim to you. <i>You will not hesitate. Breed me <b>now.</b></i>");
	if (pc.tallness < 48) output("You have to stand on your toes for your [pc.cock] to align with her properly, and you don’t feel especially sturdy on the ice, but at least [frostwyrm.name] will be there to catch you.");
	else output("");
	output("\n\n[frostwyrm.name]’s massive frame lends to an equally intimidating, draconic pussy: its slit is the length of your forearm; it’s as wide as your [pc.face]; and you can only imagine how deep it’ll be.");
	if (pc.biggestCockLength() < 23) output(" You find yourself feeling rather self-conscious about your equipment – how would you stack up to another Frostwyrm?");
	else if (pc.isBimbo()) output(" Goody, [frostwyrm.name] is proooooobably going to be thicc enough to, like, take all of you! It gets so hard to bust a good nut with a dick as big as yours!");
	else output(" Finally, you’ve found a warm hole you can comfortably fit inside! If [frostwyrm.name] wants you to fuck her, you are going to <i>rock her world.</i>");
	output("\n\nUnderneath your target is an intimidating set of testicles, each large enough for you to curl up inside if you could. The scales of [frostwyrm.name]’s body end at their root and around each of her sets of genitals, giving way to smooth, leathery skin, taut and tight as could be with a lifetime full of pent-up desire. You can’t see her penis, but you can easily imagine its immensity, for a creature as large as her.");
	output("\n\nYou grip your [pc.cock] by the head and trace along her entrance, tickling yourself along her scales and sampling the heat and moisture of her pussy. You bite your lower lip in pleasure, and you feel the pleasure [frostwyrm.name]’s control on your mind spike, but then she snaps at you. <i>I told you to <b>breed me!</b></i> her voice thunders in your skull. <i>This is <b>not</b> how your kind mate, do not test me!</i> She rears herself back, devouring your cock halfway down the shaft (along with your hand to the wrist).");
	output("\n\nOnce you sink yourself to the [pc.base] inside of her");
	if (pc.balls > 0) output(", your [pc.balls] clapping wetly against her vulva");
	output(", you feel... something different. She’s warm and deceptively tight");
	if(!pc.cockVirgin) output(", just like any other cunt you’ve been inside,");
	else output("...");
	output(" but there’s something else. A fullness in your lower stomach, followed by a warmth blossoming throughout your body");
	if (pc.hasVagina()) output(". It’s moderately similar to whenever you have someone in your [pc.vagina], but different, on a more spiritual level than physical");
	output(". You even feel a sense of <i>rightness:</i> your existence has been missing something, and you’re finally meeting some carnal condition to a satisfactory life. Is this what [frostwyrm.name] is feeling? Gods... how did you live without this?!");
	
	pc.cockChange();
	frostwyrm.cuntChange(0, pc.cockVolume(0));
	
	output("\n\n[frostwyrm.name] freezes up, unaccustomed to the sensation herself. You don’t proceed at first, letting her dictate the pace. She cranes her long neck upward, her tongue slipping out and gliding across her muzzle again. <i>You will breed me,</i> she commands again, far less intense this time. You grab as much of her scaly booty as you can, then pull back. The feeling of fullness leaves you momentarily, and when you thrust forward, it explosively returns, accentuating the tight, slick feel of being inside your Frostwyrm mate.");
	if (pc.cockTotal() > 1) {
		output("\n\nYour [pc.cock 1] flaps in the cold air, stiff but useless. You align it upward; if you’re not going to use it, you’re at least going to keep it warm between your bodies. It shuffles between her scales on every thrust in until it rests against your own [pc.skinFurScales].");
		output("\n\nUnexpectedly, your [pc.cockHead 1] presses tightly against the sphincter of your Frostwyrm mate on the first push. [frostwyrm.name] tenses immediately, whipping her head around to face you. <i>What are you doing?</i> she asks, ceasing her movement and her psionic grip on your mind. Despite the urgency in her actions, she doesn’t sound mad.");
		if (pc.isBimbo()) output(" You, like, got two dicks! One of ‘em was getting cold, so you gave it someplace warm to snuggle up to.");
		else output(" You explain, simply, that you have more than one. You were just resting the other between you.");
		output("\n\nHer eyes narrow on yours – and then, she shuffles backward, slurping your [pc.cock 0] into her and driving your [pc.cock 1] against her anus once again. <i>Use it,</i> she commands you.");
		output("\n\nYou’re taken aback by the command, but, far be it from you for ");
		if (silly) output("looking a gift horse in the mouth – or, in this case, a gift dragon in the ass");
		else output("turning down such a gracious invitation");
		output("\n\nYou fumble with your equipment, lifting your [pc.cock 1] upward slightly, gently pressing it against her draconian star, and then slide it in.");
		output("\n\nAs you do, you feel another, warm bloom inside your body, accompanying the first. You melt onto her as the pleasure spreads, and you thirst for more, but, gracious mate that you are, you wait for [frostwyrm.name]’s go-ahead. She grumbles at first, adjusting her frame slightly to accommodate the new sensation inside her. <i>I... have never considered this as an option. Nor have any of my kind, I believe.</i> She pushes back, sinking more of you into her. <i>Perhaps it is best you are not of my kind, then. Do not hesitate to pleasure <b>all</b> of me next time, [pc.name].</i>");
		output("\n\nYou grip onto her tail tightly and continue to rail against her, stuffing all of you into all of her. If the fullness you feel in your body and soul are what she’s feeling as well, by Gods....");
		flags["FROSTWYRM_ANAL_CATCH"] = 1;
	}
	output("\n\nYou pound into her, thrusting against her body, sawing your [pc.cock] into her body again and again");
	if (pc.hasVagina()) output(". Your [pc.vagina] clenches in dissatisfaction, eager for a taste of what [frostwyrm.name] is having, but you’ll have to make do for now");
	output(". You can hear her purr from across her body, and you can feel the vibration all the way down to your dick. She occasionally flexes her wings and tenses her muscles, squeezing you inside her. Despite your rampant pounding against her, her body is so large and sturdy that she doesn’t move an inch against you.");
	output("\n\n<i>We will be doing this again,</i> she tells you in no uncertain terms. <i>I will have you inside me, as many times as I want and as many times as it takes.</i>")
	if (pc.isBimbo()) output(" Sounds like a fucking awesome time to you! Nobody else gives you the willies - the good willies, though, not the creepy ones - like [frostwyrm.name] does. You’ll fuck her as many times as she wants!");
	else output(" You’re already looking forward to it: breeding with [frostwyrm.name] is such a unique – hell, you’d even call it fulfilling – experience that you couldn’t see yourself saying no.");
	output(" <i>I will never want during a heat again. Our clutch will be grand in scope. Each kip as beautiful as the last.</i>");
	output("\n\nHer massive tail coils downward, draping at first across your shoulder, then around your back, holding you closer to her and pressing your upper body against her rump.");
	if (pc.canLactate()) output(" The pressure against your [pc.chest] causes your [pc.milk] to squirt from you, drenching [frostwyrm.name] from the base of her tail and the rivulets tracing their way down her anus and to the union of your [pc.cock] inside her.");
	output("\n\nYou hear a dreadful scratching noise as her claws flex against the icy floor beneath her. Her breathing quickens, and suddenly, she’s bucking against you forcefully, eager to get you deeper inside her. <i>I... I do not know what is coming over me,</i> she tells you. <i>My loins... I feel as though, I... I....</i> She makes several more attempts to communicate, but she’s thinking so many thoughts and feeling so many feelings that they all jumble into a loud, unclear mess.")
	output("\n\nYour own orgasm was not far off, but the emotional feedback you’re getting from [frostwyrm.name] kicks your sex-drive into overtime. Already, you feel what is no-doubt going to be one of the largest orgasms of your life coming up: your [pc.cock]");
	if (pc.cockTotal() > 1) output(" and your [pc.cock 1] jut");
	else output(" juts");
	output(" upward, bloating in preparation for your [pc.cum]; the warmth in your body grows powerful, yet uncontrolled and erratic; and the feeling of rightness and fulfillment is reaching a crescendo, ready to overflow throughout your being.");
	output("\n\nYou push deeper and harder against her, digging as deep into her gargantuan body as you can");
	if (pc.hasKnot()) output(". Your [pc.knot] balloons obscenely, obstructing your passage into her body even as large as she is, but ultimately, her own size can’t stop you from pushing it in and enveloping you");
	output(", shucking every last part of your [pc.cock]");
	if (pc.cockTotal() > 1) output(" and your [pc.cock 1]");
	output(" inside of herself. Upon hilting her, [frostwyrm.name] cranes her neck upward, and she wails a sound you’ve never heard her make before. Her body convulses, milking you for your every drop.");
	output("\n\nTimed with the contractions in her pussy, her balls tense against your [pc.legs] and quiver. [frostwyrm.name]’s roar is accentuated by the sound of liquid splashing against something and the sound of flesh against ice, and a thick musk soon floods the room. Though untouched and neglected, she must be cumming out her dick - and if her load is anything like the rest of her, she’s probably cumming a small pond.");
	output("\n\nThe sensation within your soul overtakes you, threatening to consume you, and you allow it as your own orgasm bursts forth: your [pc.cock] explodes inside of her, and just as the [pc.cum] hits her walls, you feel so many new emotions and sensations: you feel <i>young,</i> you feel <i>complete</i>");
	if (pc.isBimbo()) output(",</i> and you feel <i>so fucking gooooooood</i>");
	output(". You feel as though your whole life has been leading up to this moment: to mate with [frostwyrm.name] and douse her fertile eggs with your superior seed, just as she wanted of you.");
	if (pc.hasVagina()) output(" Along with the burst from your [pc.cock], your [pc.vagina] spurts and sucks at nothing, spewing its [pc.girlCum] down your [pc.legs] and sopping over the ice as you continue to thrust into your Frostwyrm.");
	output("\n\nYou pump and pump, longer than you ever thought you even <i>could</i> orgasm");
	if (pc.balls > 0) output(". Your [pc.sack] bunches and tightens against your body with each successive load, lightening with each burst and then filling again when both your bodies demand more");
	output(". Your fingers tightly grip her rump, and her tail presses you tighter to it, pressing your [pc.chest] against the base of her tail while you cum inside her. Her cunt tightens around you in waves timed with your every splurt, drinking your gift for herself");
	if (pc.hasKnot()) output(". Your inflated [pc.knot] tugs and pulls against her pussy, spreading her wider, but neither you nor her are ready for you to separate");
	if (pc.cumQ() >= 500) output(". Despite how surely locked you two are, your prodigious load comes bursting from her womb unabated; there is simply too much pussy for your knot to properly seal.");
	if (pc.cockTotal() > 1) {
		output(" Similarly, your [pc.cock 1] erupts in her anus, dousing the fire you’ve alighted in there. Your every explosion in her ass blossoms a similar feeling in your own body, urging you for more, <i>demanding</i> that you satisfy you and your mate’s cravings for you to cum in her draconian ass. Her star flexes against you, eking out your every drop");
		if (pc.hasKnot()) output(", and your [pc.knot 1] dutifully makes sure that nothing gets out.");
	}
	output("\n\nEven when you don’t think you have anything left");
	if (pc.balls > 0) output(" in your [pc.balls]");
	output(" to offer [frostwyrm.name], her orgasm continues regardless, her body rocking and squeezing you, ravenous for your cum. Despite that, you can tell she’s coming down: both because the warmth, the feeling of belonging and accomplishment, is diminishing, and because her thoughts are slowly becoming coherent again. <i>Finally,</i> she says elatedly. <i>I will finally lay for my first time. I no longer must suffer my solitude. I can finally start a clutch... a – a fam–</i>");
	output("\n\nFinally, your [pc.cock] flags; you enjoy the warmth of [frostwyrm.name]’s rear end and the total, righteous sense of fulfillment that covers your body, mind, and soul, but the fact remains that you have so little remaining within you. It was more than just a good nut: you feel as though you’ve really accomplished something. You rest against [frostwyrm.name]’s ass, wrapping your arms around her scaly haunches, to catch your breath.");
	if (pc.isAmazon(false)) {
		output("\n\nYou take a few deeps breaths, filling your lungs with the crisp, cold air of the lair and your nostrils with [frostwyrm.name]’s heady scent emanating from her hind quarters. You’re not the least bit exhausted; you’re just a bit winded, and after a few deep breaths, you ask her if she’s ready for another round.");
		output("\n\nYou feel her probe your mind for a moment. <i>Others of your kind only mate once?</i> she asks you, and you respond that most of them do; you’re a little hardier than others of your kind, and you can go as often as she wants. <i>Splendid. My own kind do not mate only once either. Allow me to reward you for your resilience.</i>");
	}
	else {
		output("\n\nHowever, [frostwyrm.name] has other plans. <i>Why have you stopped?</i> she asks you, turning her head to face you. You respond that... you’re done. ");
		if (pc.isBimbo()) output("Like, it was great and all, but you kinda get sleepy after a good fuck, and the best thing to do once you’re done busting a good nut is to take a nice nap.");
		else output("You gave her all the seed you could, and you’re spent. You don’t have the energy to keep going.");
		output("\n\n<i>‘Done?’</i> she asks, her tone changing drastically. You feel her psionic power comb across your mind, searching for information. <i>You are not deceiving me. Kinds like yours couple only once. This is unacceptable!</i>");
	}
	output("\n\nYou feel her work her magic; the pleasant tingling from before returns to your body, especially everything that is against or inside her. The release you felt in your [pc.cock] spreads to the rest of you, giving you what you can only describe as a full-body orgasm: your nerves dance and your breath leaves your lungs. What follows after is the sense and feeling returning to your dick, slowly urging it back to full-mast.");
	output("\n\n<i>I have suffered an existence without a proper mate and without this... new feeling. We will continue, [pc.name], until I say you may stop. We will <b>ensure</b> I will lay before the next Light’s Rise. I will not host a weak mate.</i>");
	output("\n\nShe flexes her haunches and leans backward, her draconian pussy devouring you once again. Looks like you may not have a choice.");

	processTime(3 * 60);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	knockedUpFrostwyrm();
	IncrementFlag("FROSTWYRM_GOT_DICKED");
	clearMenu();
	if (pc.hasVagina() && pc.fertility() > 0 && (!pc.hasWombPregnancy() || !pc.hasPregnancyOfTypeOtherThan("FrostwyrmPregnancy"))) addButton(0, "Next", frostwyrmWhoPutThisTreeUpMyAss1);
	else addButton(0, "Next", frostwyrmGoodGodImHurt, vIdx);
}
public function frostwyrmVaginalRepeat():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	var vIdx:int = -1;
	if(pc.hasVagina() && pc.fertility() > 0 && pc.blockedVaginas() == 0) {
		vIdx = pc.findEmptyPregnancySlot(1);
		//if(vIdx < 0) vIdx = rand(pc.totalVaginas());
	}
	
	output("Your eyes trail down [frostwyrm.name]’s slender, graceful form: lithe yet powerful; beautiful yet practical. In many ways, an absolute spectacle to behold; one from your own kind may not find a Frostwyrm like [frostwyrm.name] to be conventionally beautiful or their first choice in a mate, but not you.");
	output("\n\nYour eyes play along her thick, powerful, muscled haunches, and you find yourself fantasizing about her: the way her scaly form feels against your hands and body; the radiant heat she gives off in such a comparatively cold climate; the way she purrs and congratulates you when you’re behind those haunches of hers, fucking her with your [pc.cock], giving her the rutting she frequently desires of you.");
	output("\n\nYour thoughts have an effect on [frostwyrm.name], and her tail begins to swish impatiently. A heady, powerful, <i>wonderful</i> musk begins to permeate the room, and its effect on you is quick and hard. <i>Your mate has need of you,</i> she says sultrily, her rear legs flexing and stepping over each other repeatedly, rocking her body for you. <i>She requires her Qal to seed her once more.</i>");
	output("\n\n[frostwyrm.name] nudges you with her snout, pushing you towards one end of the lair. <i>Approach my resting groove,</i> she instructs. You turn to see what she’s referring to: the flat, raised bit of ice that you had spied when you first entered the lair. It’s not especially tall, but if you stand on it, it might be the boost you need to ‘reach’ her.");
	if (flags["FROSTWYRM_KIP_COUNT"] == 1) output(" Your daughter starts murmuring to herself excitedly, eager to learn how the best of the best (or so she’s been taught) really do it. She flaps into position around their Qim’s resting groove, searching for the best viewpoint possible.");
	else if (flags["FROSTWYRM_KIP_COUNT"] >= 2) output(" Your daughters start murmuring to themselves excitedly, eager to learn how the best of the best (or so they’ve been taught) really do it. They flap into position around their Qim’s resting groove, searching for the best viewpoint possible.");
	output("\n\nYou do as she commands, approaching the ice table. When you get to it, she sticks her long snout between your [pc.legs], helping you vault up onto it – but not without taking a deep sniff through her nose, taking in her mate’s scent for herself. She shudders, and you feel her string at your thoughts, sharing with you the... <i>urgency</i> she suddenly feels. Once you’re on the ice table, she sticks out her tongue, drawing it down your [pc.belly] and across your [pc.cock]");
	if (pc.hasVagina()) output(", then along the gash of your [pc.vagina], getting a taste, shuddering again...");
	output(".");
	output("\n\n<i>Your taste remains as exemplary as the rest of you,</i> she says sultrily, taking her time to turn about-face, flexing her long, beastly body. She moves with grace, flicking her tail up and swishing it about, putting on a show for you. When she’s finally settled, she flexes her rear and lifts her tail, revealing to you the entrance you’ve grown well-acquainted with. <i>Take your rightful place behind me, [pc.name]. Satisfy your mate once more. She commands you.</i>");
	if (pc.tallness < 48) output("You have to stand on your toes for your [pc.cock] to align with her properly, and you don’t feel especially sturdy on the ice, but at least [frostwyrm.name] will be there to catch you.");
	output("\n\n[frostwyrm.name]’s massive frame lends to an equally intimidating, draconic pussy: its slit is the length of your forearm; it’s as wide as your [pc.face]; and you can only imagine how deep it’ll be.");
	if (pc.biggestCockLength() < 23) output(" You find yourself feeling rather self-conscious about your equipment – how would you stack up to another Frostwyrm?");
	else if (pc.isBimbo()) output(" Goody, [frostwyrm.name] is proooooobably going to be thicc enough to, like, take all of you! It gets so hard to bust a good nut with a dick as big as yours!");
	else output(" Finally, you’ve found a warm hole you can comfortably fit inside! If [frostwyrm.name] wants you to fuck her, you are going to <i>rock her world.</i>");
	output("\n\nUnderneath your target is an intimidating set of testicles, each large enough for you to curl up inside if you could. The scales of [frostwyrm.name]’s body end at their root and around each of her sets of genitals, giving way to smooth, leathery skin, taut and tight as could be with a lifetime full of pent-up desire. You can’t see her penis, but you can easily imagine its immensity, for a creature as large as her.");
	output("\n\nYou grip onto her flanks – her body doesn’t allow for much of an ass, but considering her frame, it’s still more than you need. You guide yourself to her hot tunnel, sinking into her body halfway down your shaft in a single thrust.");
	output("\n\nAs you both sigh in delight, you wrap both your arms around the base of [frostwyrm.name]’s tail, giving it a lick. <i>I appreciate that your kind are very sensual with your mating,</i> she tells you. You feel a sort of warmth in your chest as she speaks to you, granting you a different, wholesome pleasure. <i>This is not an act my kind practices... we are poorer for it, I think.</i>");
	output("\n\nOnce you sink yourself to the [pc.base] inside of her");
	if (pc.balls > 0) output(", your [pc.balls] clapping wetly against her vulva");
	output(", you feel... something different. She’s warm and deceptively tight");
	if(!pc.cockVirgin) output(", just like any other cunt you’ve been inside,");
	else output("...");
	output(" but there’s something else. A fullness in your lower stomach, followed by a warmth blossoming throughout your body");
	if (pc.hasVagina()) output(". It’s moderately similar to whenever you have someone in your [pc.vagina], but different, on a more spiritual level than physical");
	output(". You even feel a sense of <i>rightness:</i> your existence has been missing something, and you’re finally meeting some carnal condition to a satisfactory life. You keep coming back to [frostwyrm.name] for a lot of reasons, and this is definitely one of them. You share a connection with her that nobody else in the universe can provide.");
	
	pc.cockChange();
	frostwyrm.cuntChange(0, pc.cockVolume(0));
	
	output("\n\n<i>I have been robbed of this for many Sky Cycles,</i> she says, craning her neck around to face you with her two right eyes. <i>I understand that taking your position behind me is a titillating act for you. You will spend much of your time there. I have a lifetime’s worth of breeding to act upon. Our clutch will grow magnificent, beyond compare.</i> You grab as much of her scaly booty as you can, then pull back. The feeling of fullness leaves you momentarily, and when you thrust forward, it explosively returns, accentuating the tight, slick feel of being inside your Frostwyrm mate. <i>And if I do not lay this time... we can always try again.</i>");
	if (pc.cockTotal() > 1) {
		if(flags["FROSTWYRM_ANAL_CATCH"] == undefined) {
			output("\n\nYour [pc.cock 1] flaps in the cold air, stiff but useless. You align it upward; if you’re not going to use it, you’re at least going to keep it warm between your bodies. It shuffles between her scales on every thrust in until it rests against your own [pc.skinFurScales].");
			output("\n\nUnexpectedly, your [pc.cockHead 1] presses tightly against the sphincter of your Frostwyrm mate on the first push. [frostwyrm.name] tenses immediately, whipping her head around to face you. <i>What are you doing?</i> she asks, ceasing her movement and her psionic grip on your mind. Despite the urgency in her actions, she doesn’t sound mad.");
			if (pc.isBimbo()) output(" You, like, got two dicks! One of ‘em was getting cold, so you gave it someplace warm to snuggle up to.");
			else output(" You explain, simply, that you have more than one. You were just resting the other between you.");
			output("\n\nHer eyes narrow on yours – and then, she shuffles backward, slurping your [pc.cock 0] into her and driving your [pc.cock 1] against her anus once again. <i>Use it,</i> she commands you.");
			output("\n\nYou’re taken aback by the command, but, far be it from you for ");
			if (silly) output("looking a gift horse in the mouth – or, in this case, a gift dragon in the ass");
			else output("turning down such a gracious invitation");
			output("\n\nYou fumble with your equipment, lifting your [pc.cock 1] upward slightly, gently pressing it against her draconian star, and then slide it in.");
			output("\n\nAs you do, you feel another, warm bloom inside your body, accompanying the first. You melt onto her as the pleasure spreads, and you thirst for more, but, gracious mate that you are, you wait for [frostwyrm.name]’s go-ahead. She grumbles at first, adjusting her frame slightly to accommodate the new sensation inside her. <i>I... have never considered this as an option. Nor have any of my kind, I believe.</i> She pushes back, sinking more of you into her. <i>Perhaps it is best you are not of my kind, then. Do not hesitate to pleasure <b>all</b> of me next time, [pc.name].</i>");
			output("\n\nYou grip onto her tail tightly and continue to rail against her, stuffing all of you into all of her. If the fullness you feel in your body and soul are what she’s feeling as well, by Gods....");
			flags["FROSTWYRM_ANAL_CATCH"] = 1;
		}
		else {
			output("\n\nOf course, you don’t forget about your [pc.cock 1] and how much [frostwyrm.name] seemed to enjoy you using it on her. You shuffle backward a bit, giving yourself some room to maneuver, and grip your second prick by the shaft to sandwich between your bodies. When you thrust forward, it slides along your Frostwyrm’s body and rests once again at her rear entrance.");
			output("\n\nYou hear what sounds like a hum come from her throat up front. <i>I have not forgotten, [pc.name],</i> she says lowly. <i>We are proper mates, and proper mates tend to each other’s every necessity. I need all of you inside of me. You will satisfy your mate to her every requirement - as I know you would anyway.</i>");
			output("\n\nYou give her tail a long kiss as you thrust inward, and as you do, another full-body warmth bursts through you. You both sigh in delight as you enter her and pleasure every part of her body with every part of yours. <i>I would never have extended this offer to another of my kind, [pc.name].</i> She turns her long neck to you, facing you with two fiery-red eyes. <i>Perhaps we should impart our experiences to them, should we find any. Or at least to our kips. This is an unheard-of avenue of pleasure for my kind.</i>");
			output("\n\nYou say nothing, focusing on being inside her so completely.");
			if (flags["FROSTWYRM_KIP_COUNT"] == 1) output("\n\nYour daughter agrees in earnest, excited for more lessons from her parents, delighted in the possibility of physically sharing in her Qim’s pleasure.");
			else if (flags["FROSTWYRM_KIP_COUNT"] >= 2) output("\n\nYour daughters agree in earnest, excited for more lessons from their parents, delighted in the possibility of physically sharing in their Qim’s pleasure.");
			output(" <i>Do not falter, [pc.name]. Your mate needs your seed.</i>");
		}
	}
	output("\n\nYou pound into her, thrusting against her body, sawing your [pc.cock] into her body again and again");
	if (pc.hasVagina()) output(". Your [pc.vagina] clenches in dissatisfaction, eager for a taste of what [frostwyrm.name] is having, but you’ll have to make do for now");
	output(". You can hear her purr from across her body, and you can feel the vibration all the way down to your dick. She occasionally flexes her wings and tenses her muscles, squeezing you inside her. Despite your rampant pounding against her, her body is so large and sturdy that she doesn’t move an inch against you.");
	output("\n\n<i>Compare me to other mates of your kind,</i> she says. It’s not a demand, but, dick-deep inside her, you acquiesce: panting between breaths, you tell her that everything about her is so different; so <i>intense.</i> ");
	if (pc.isBimbo()) output("Like, you’ve fucked a lot, but, like, this is kinda different. Nobody’s made you feel the fuzzies like [frostwyrm.name] is making you feel the fuzzies right now.");
	else output("You’ve had casual couplings, and you’ve had lovers, but you’ve never connected with them on the same level as her.");
	output(" <i>And none ever will. We exist for each other, [pc.name]. I do not regret choosing you over another of my own.</i>");
	output("\n\nHer massive tail coils downward, draping at first across your shoulder, then around your back, holding you closer to her and pressing your upper body against her rump.");
	if (pc.canLactate()) output(" The pressure against your [pc.chest] causes your [pc.milk] to squirt from you, drenching [frostwyrm.name] from the base of her tail and the rivulets tracing their way down her anus and to the union of your [pc.cock] inside her.");
	output("\n\n<i>My... what you call an ‘orgasm,’ it is... I’m...,</i> she tries to say. <i>This... I cannot believe this feeling exists!</i> The voices in your head become insensate, jumbling her thoughts over each other as she desperately tries to form a single coherent one.")
	output("\n\nYour own orgasm was not far off, but the emotional feedback you’re getting from [frostwyrm.name] kicks your sex-drive into overtime. Already, you feel what is no-doubt going to be one of the largest orgasms of your life coming up: your [pc.cock]");
	if (pc.cockTotal() > 1) output(" and your [pc.cock 1] jut");
	else output(" juts");
	output(" upward, bloating in preparation for your [pc.cum]; the warmth in your body grows powerful, yet uncontrolled and erratic; and the feeling of rightness and fulfillment is reaching a crescendo, ready to overflow throughout your being.");
	output("\n\nYou push deeper and harder against her, digging as deep into her gargantuan body as you can");
	if (pc.hasKnot()) output(". Your [pc.knot] balloons obscenely, obstructing your passage into her body even as large as she is, but ultimately, her own size can’t stop you from pushing it in and enveloping you");
	output(", shucking every last part of your [pc.cock]");
	if (pc.cockTotal() > 1) output(" and your [pc.cock 1]");
	output(" inside of herself. Upon hilting her, [frostwyrm.name] cranes her neck upward, and she sings your favorite song to you, letting you know how much you’ve pleasured her. Her body convulses, milking you for your every drop.");
	output("\n\nTimed with the contractions in her pussy, her balls tense against your [pc.legs] and quiver. [frostwyrm.name]’s roar is accentuated by the sound of liquid splashing against something and the sound of flesh against ice, and a thick musk soon floods the room. Though untouched and neglected, she must be cumming out her dick - and if her load is anything like the rest of her, she’s probably cumming a small pond.");
	output("\n\nThe sensation within your soul overtakes you, threatening to consume you, and you allow it as your own orgasm bursts forth: your [pc.cock] explodes inside of her, and just as the [pc.cum] hits her walls, you feel so many new emotions and sensations: you feel <i>young,</i> you feel <i>complete</i>");
	if (pc.isBimbo()) output(",</i> and you feel <i>so fucking gooooooood</i>");
	output(". You feel as though your whole life has been leading up to this moment: to mate with [frostwyrm.name] and douse her fertile eggs with your superior seed, just as she wanted of you.");
	if (pc.hasVagina()) output(" Along with the burst from your [pc.cock], your [pc.vagina] spurts and sucks at nothing, spewing its [pc.girlCum] down your [pc.legs] and sopping over the ice as you continue to thrust into your Frostwyrm.");
	output("\n\nYou pump and pump, longer than you ever thought you even <i>could</i> orgasm");
	if (pc.balls > 0) output(". Your [pc.sack] bunches and tightens against your body with each successive load, lightening with each burst and then filling again when both your bodies demand more");
	output(". Your fingers tightly grip her rump, and her tail presses you tighter to it, pressing your [pc.chest] against the base of her tail while you cum inside her. Her cunt tightens around you in waves timed with your every splurt, drinking your gift for herself");
	if (pc.hasKnot()) output(". Your inflated [pc.knot] tugs and pulls against her pussy, spreading her wider, but neither you nor her are ready for you to separate");
	if (pc.cumQ() >= 500) output(". Despite how surely locked you two are, your prodigious load comes bursting from her womb unabated; there is simply too much pussy for your knot to properly seal.");
	if (pc.cockTotal() > 1) {
		output(" Similarly, your [pc.cock 1] erupts in her anus, dousing the fire you’ve alighted in there. Your every explosion in her ass blossoms a similar feeling in your own body, urging you for more, <i>demanding</i> that you satisfy you and your mate’s cravings for you to cum in her draconian ass. Her star flexes against you, eking out your every drop");
		if (pc.hasKnot()) output(", and your [pc.knot 1] dutifully makes sure that nothing gets out.");
	}
	output("\n\nYou relax against [frostwyrm.name]’s rump, resting your cheek against the scaly fat (or what little there is) of her haunch. The sense of rightness, of fulfillment and harmony, slowly drain from your body, even as your body has long since been drained of its [pc.cum]. [frostwyrm.name]’s thoughts slowly un-jumble in your mind, until she’s capable of forming a sentence again.");
	output("\n\n<i>You’ve changed my view of my own existence, [pc.name],</i> she tells you.");
	if (!pc.isBimbo()) output(" You wonder if she realizes just how enormous of a compliment that is.");
	else output("\n\n<i>“Thanks!”</i> you reply.");
	output("\n\n<i>I find myself wanting to mate with you, not purely so that I can lay, but for the pleasure and attachment. You are a similar way: you come to me, eager for the pleasures I can impart and excited for the prospect of bringing about my satisfaction. My kind appreciate the pleasures of mating, but... this is unheard of. Another kip would be wonderful, but it is not my goal. It is <b>you</b> I need.</i>");
	output("\n\nFinally, your [pc.cock] flags; you enjoy the warmth of [frostwyrm.name]’s rear end and the total, righteous sense of fulfillment that covers your body, mind, and soul, but the fact remains that you have so little remaining within you. It was more than just a good nut: you feel as though you’ve really accomplished something. You rest against [frostwyrm.name]’s ass, wrapping your arms around her scaly haunches, to catch your breath.");
	output("\n\nYou hear [frostwyrm.name]’s throat rumble from across her body, satisfied with your performance – but the warmth within your body does not recede, and you feel her work her now-familiar powers to return the pleasure to your body, and the strength to [pc.eachCock]. <i>It will take more than once to satisfy any of my kind, [pc.name],</i> she says slyly.");
	output(" [frostwyrm.name] shuffles her body backward, making sure your [pc.cock] does not slip from her form as she prepares for another round or nine. <i>You are a capable [pc.race]. Satisfy your mate. She requires more of you and your touch.</i>");
	
	processTime(3 * 60);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	knockedUpFrostwyrm();
	IncrementFlag("FROSTWYRM_GOT_DICKED");
	clearMenu();
	if (flags["FROSTWYRM_KIP_COUNT"] == undefined)
	{
		if (pc.hasVagina() && pc.fertility() > 0 && (!pc.hasWombPregnancy() || !pc.hasPregnancyOfTypeOtherThan("FrostwyrmPregnancy")) && flags["FROSTWYRM_DICKED_YOU"] == undefined) addButton(0, "Next", frostwyrmWhoPutThisTreeUpMyAss1);
		else addButton(0, "Next", frostwyrmGoodGodImHurt, vIdx);
	}
	else addButton(0, "Next", frostwyrmAftercare, vIdx);
}

public function knockedUpFrostwyrm():Boolean
{
	if (!frostwyrm.isPregnant())
	{
		flags["FROSTWYRM_INCUBATION_TIMER"] = 0;
		pc.clearRut();
		return true;
	}
	return false;
}

public function frostwyrmIncubationDays():int
{
	// (4 * 4 * 7)
	return 112;
}
public function frostwyrmBirth():void
{
	StatTracking.track("pregnancy/frostwyrm eggs sired", 1);
	StatTracking.track("pregnancy/total sired", 1);
	
	IncrementFlag("FROSTWYRM_EGGS");
	
	flags["FROSTWYRM_INCUBATION_TIMER"] = undefined;
}
public function processFrostwyrmPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if (frostwyrm.isPregnant())
	{
		flags["FROSTWYRM_INCUBATION_TIMER"] += totalDays;
		
		if (flags["FROSTWYRM_INCUBATION_TIMER"] >= frostwyrmIncubationDays())
		{
			frostwyrmBirth();
		}
	}
}
/*public function frostwyrmHatchedAnEgg():String
{
	var Text:String = "";
	
	Text += "As you traverse the wilds on to your next destination, you feel a familiar pressure on the back of your head, and your peripheral vision grows blurry. You instinctively know that [frostwyrm.name] is trying to communicate to you.";
	Text += "\n\n<i>My Qal,</i> you hear her voice reverberate in your mind. You answer affirmatively, and tell [frostwyrm.name] that you can hear her. <i>Our " + (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "first" : "youngest") + " kip has hatched from their shell.</i>";
	Text += "\n\nThat’s wonderful! You ask her for more details. Is it healthy? What features has it inherited from its parents? <i>Yes, our kip is beautiful and strong. It bears wings and features similar to me, but its physiology resembles you significantly. I would ask you return to the lair with all haste so that it may acquaint itself with its Qal.</i>";
	Text += "\n\nYou answer that you’ll arrive as soon as you can. And with that, [frostwyrm.name] releases her grip on your mind.";
	
	return doParse(Text);
}
*/

public function frostwyrmWhoPutThisTreeUpMyAss1():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");

	if (pc.isAmazon(false)) {
		output("You continue for what must have been hours. To your own surprise, despite how demanding [frostwyrm.name] is as your mate, your body feels no pain or tension anywhere: not from your [pc.feet], which you’ve been standing on this whole time, to any part of your pelvis, which has been thrusting incessantly for hours on end, and not to [pc.eachCock], despite the rigors you’ve been put through.");
		output("\n\nYou’ve run completely dry of [pc.cum], but that doesn’t bother either of you; you continue to rut against [frostwyrm.name] for the pleasure of it, and [frostwyrm.name] continues to hump back. The poor girl’s been pent up for so long, she probably just wanted a good, long fucking, and you’re more than willing to provide for as long as she likes, even when her womb is as saturated with [pc.race] seed as it could be. You could fuck this dragon for another twelve hours, if she wanted.");
	}
	else {
		output("You continue for what must have been hours. It taxes your body in ways you weren’t expecting: your [pc.feet] are cramped and in throbbing pain from standing for so long; your arms are exhausted from constantly clutching and groping at [frostwyrm.name]’s haunches; your backside is exposed to the chill of her lair while your front is heated from her ravenous, greedy cunt, winking asshole, and flexing testicles, making you dizzy.");
		output("\n\nYou’ve run completely dry of [pc.cum] after the fourth round, yet [frostwyrm.name] wouldn’t let you stop. You think she must’ve known by now, but she wanted to keep going – the poor girl’s been pent up for so long, she probably just wanted a good, long fucking. Surprisingly enough, the one part of you that doesn’t hurt as much as you thought it would is [pc.eachCock]: [frostwyrm.name]’s psionic ability has removed your refractory period, allowing you to go as long as the rest of you can.");
	}
	output("\n\n[frostwyrm.name] shudders through another orgasm, and the same warmth from your first coupling blossoms within you. As it covers you and pleasures you, she suddenly pulls forward, allowing you to withdraw. <i>That is enough.</i> ");
	if (pc.isAmazon(false)) output("Suit herself; if she wants to stop, you won’t ask her to continue.");
	else output("It’s the most beautiful sentence you’ve heard in hours.");
	output("\n\nYou slump to your knees, your face aligned with the sloppy, pleased hole you’ve been acquainting yourself with for the past few hours and the root of the enormous ballsack just underneath it. [frostwyrm.name] steps forward and turns her enormous body to you, spreading her rear legs once more, and her red eyes bore into you. <i>Our mating is not yet truly consummated,</i> she warns slyly, her fat tongue licking across her muzzle. <i>You are capable of laying as well. Splay yourself, [pc.name]. It is time you pleasure the rest of your mate.</i>");
	
	clearMenu();
	addButton(0, "Next", (flags["FROSTWYRM_DICKED_YOU"] == undefined ? frostwyrmRidersMustBeOver4FeetToContinue : frostwyrmDickRepeat));
}
public function frostwyrmRidersMustBeOver4FeetToContinue():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	var vIdx:int = -1;
	if(pc.hasVagina() && pc.fertility() > 0 && pc.blockedVaginas() == 0){
		vIdx = pc.findEmptyPregnancySlot(1);
		//if(vIdx < 0) vIdx = rand(pc.totalVaginas());
	}
	
	output("You look underneath the barrel of her stomach as you travel along her serpentine form. She’s breathing harder, unable to contain her excitement at finally having someone or something touch her masculinity. You spy her draconian dick, its thick, blunted tip pressing crudely against the icy floor of her lair and bloating fatter and longer with her every heartbeat.");
	output("\n\nShe notices you stare, and you feel her pluck at your head gently. You lick your [pc.lips] as you stare at her cock and you find yourself feeling all sorts of thoughts about it: how it would feel <i>against</i> you and <i>inside</i> you. How it could hurt you, and ruin you for anyone else – how nobody else could pleasure you again if you were to take [frostwyrm.name] inside you. [frostwyrm.name]’s testicles, each easily large enough that you could curl into one, bounce in excitement, in time with the thumping and growing of her already massive erection, excited for the opportunity to breed you.");
	output("\n\nYou’re not entirely sure that every one of those thoughts were yours");
	if (pc.isBimbo()) output("– you have so few original ones nowadays,");
	output(" but you nonetheless agree with each of them. <i>Prostrate yourself beneath your mate, [pc.name],</i> [frostwyrm.name] commands, knowing that her authority is absolute within her lair – and that you’d do it regardless. <i>It is time you share your burden. I will <b>swell</b> you with my seed.</i>");
	output("\n\nExcited yourself, you get onto all fours and crawl beneath [frostwyrm.name], face-to-head with her massive cock. It’s easily three feet long with a larger girth than your fist; the skin of her cock is so thick that it hides her pulsing veins and the shaft has several nubs and pricks along the underside of its length. It has a flat, mostly-featureless head, save from a rim of muscle around its glans, reminding you of a tree trunk. A bead of its musky, thick pre beads at the final nub on its very point, slowly drooping down to splash against the icy floor. And it’s getting <i>bigger.</i>");
	output("\n\n[frostwyrm.name] is quite patient for her part, grumbling wordlessly above you as she waits for you to do her work for her. You turn about, facing away from the red behemoth of a dick, then reach back to grasp it. She bucks forward instinctively, and you feel her cock spurt more of her draconic precum across your [pc.ass] and up your back. She grunts wordlessly and paws at the ice as she resets herself, awaiting another opportunity for a shot at you.");
	output("\n\nYou shuffle your [pc.hips] a bit, aligning yourself with [frostwyrm.name]’s incredible tool. When you push it to the left a bit, it finds its mark:");
	if(vIdx >= 0) output(" the beady nub finds your [pc.clit " + vIdx + "], and with it, the rest of");
	output(" your [pc.vagOrAss " + vIdx + "]. You tense at first, unsure if it’ll fit, but you feel [frostwyrm.name] pluck and string at your mind, helping you relax, easing your body for her to play with. Eager and confident, [frostwyrm.name] thrusts forward, burying herself inside you.");
	output("\n\nYour earlier fears and excitements are simultaneously affirmed when you feel that hot, thick log press past your vulva: [frostwyrm.name]’s girth is incredible, especially against your comparatively diminutive body. You feel yourself mold around her member, your [pc.legs] spreading and your [pc.hips] bloating at the intrusion. She feels so <i>tight</i> inside you!");
	output("\n\nYou hear [frostwyrm.name] hold her breath above you as she pushes in deeper. <i>Oh my,</i> she says. Her massive, bestial hips wriggle with pleasure and excitement as she adjusts herself. <i>I had never anticipated such... sensations when coupling with a mate. My own Qal had taught me only that it was pleasurable. Mere descriptions do not do this justice. I... I need more.</i>");
	output("\n\n[frostwyrm.name] flexes her haunches, and then pumps forward, forcing yet more of herself into your [pc.vagOrAss " + vIdx + "]. You shuffle forward on the ice, pushed along by her girth, and when she withdraws, you’re dragged backward slightly. She humps forward, and now, you’re getting fucked up the");
	if(vIdx >= 0) output(" cooch");
	else output(" ass");
	output(" by a Frostwyrm, eager to take her seed for yourself. [frostwyrm.name]’s humps are slow, thorough and methodical, ensuring that you’re full as can be before pulling out to fuck you deep again.");
	output("\n\nYour fingers curl into fists as you try to withstand [frostwyrm.name] pushing herself into you. Her excitement at being inside you is evident: her long, fat dick expands inside you, bloating far larger than your earlier estimate. You couldn’t possibly ballpark it: with how wide you’ve been spread and how much more dick there is to go, it may as well be an actual tree you’re being stuffed with.");
	output("\n\nMore than the cock in your [pc.vagOrAss " + vIdx + "], though, you feel something... else. A sort of excitement rushes through you: it feels electric, energizing you throughout your body, starting at your chest and rushing through your limbs. You feel... intense. Powerful. Young. <i>Alive.</i> The feeling powers your whole body, but especially your [pc.vagOrAss " + vIdx + "]");
	if (pc.hasCock()) output(" and <i>especially</i> your [pc.cock]");
	output(". You imagine this must be how [frostwyrm.name] feels – she’s been lonely and horny for so many years, and finally having someone to mate with is invigorating her.");
	output("\n\n[frostwyrm.name] makes what sounds like a grunt as her mating grows more forceful. She doesn’t move faster, but her hips draw further back and they press forward more insistently, digging into your body for your core. Despite being spread on her body like a living sock, you feel nothing but elation at the treatment, and you beg to her (via her psionics – you can barely breathe, as stuffed as you are, much less speak) for more.");
	output("\n\n<i>I have yet much more to give, [pc.name].</i> She emphasizes her points by thrusting forward, cramming yet more of herself into you somehow. <i>And we will provide each other with as many couplings as we desire. I am abundant with seed, and I will guarantee you lay before the next Light’s Rise. Then we will start again.</i>");
	output("\n\n[frostwyrm.name]’s posture becomes stiffer and upright as she feels herself sink deeper into you. A heavy thumping reverberates behind you with her every push in; after a few more powerful thrusts, you feel hot, smooth, leathery skin bump against your [pc.feet], then drape up your ankles. She’s almost balls-deep inside you; you both come to the same realization at the same time, and you’re flooded with another wave of the same energy from before. She’s forceful and determined, and you’re receptive and greedy – the perfect combination for a pair of mates like yourselves.");
	output("\n\nYou’re too paralyzed to try and get a look behind you, to see how much is inside you or how much is left. All you can do is focus on not blacking out from the intense pleasure: it feels as though every nerve in every cell is stimulated. [frostwyrm.name]’s heavy musk permeates your nose and even your mouth, thick as it is beneath her; your sight is consumed by the heaving, thick, armored underbelly of your Frostwyrm lover and the way her four visible legs repeatedly flex and paw at the ice; you hear her ragged breathing and powerful heartbeat resonate and sync with your own; and, of course, there’s the feeling of having a cock ");
	if (pc.tallness <= 48) output("almost as long");
	else output("half as long");
	output(" as you are tall in your [pc.vagOrAss " + vIdx + "].");
	
	frostwyrm.cockChange();
	if(vIdx >= 0) pc.cuntChange(vIdx, frostwyrm.cockVolume(0));
	else pc.buttChange(frostwyrm.cockVolume(0));
	
	output("\n\nYour mind phases in and out of sensibility as [frostwyrm.name] ruts you. You idly wonder how far across her lair you’ve been pushed. Your [pc.chest] " + (pc.hasBreasts() ? "have" : "has") + " gone numb from the ice beneath you");
	if (pc.isLactating()) output(" and your [pc.milk] drips from your [pc.belly], marking your trail behind you");
	output(", but what difference is there between numbness from the cold and numbness from the pleasure? You rest easy, allowing your Frostwyrm mate to have her way with you, one slow and powerful thrust at a time.");
	output("\n\nAfter what feels like an eternity, you feel a sensation you could hardly believe when it happens: a soft texture and a comparatively intense heat, resting gently against your [pc.ass]. You feel two impossibly large and heavy testicles swish and massage against your outstretched [pc.legs] with [frostwyrm.name]’s motions. And you hear an audible clap every time she thrusts forward. Somehow, someway, [frostwyrm.name] has bottomed out her entire three-foot-maybe-longer dick inside you.");
	output("\n\nShe snorts in satisfaction, resting her haunches for a moment as she adjusts to the feel of herself inside you. Electricity surges through you: [frostwyrm.name] is feeding her emotions through you via her psionics, and you’ve never felt more <i>alive.</i>");
	output("\n\nThe muscles in her legs and along her torso flex tightly as the same aura soaks her body and being. <i>This will not be our only coupling,</i> she tells you as she resumes her thrusting in earnest. <i>I have been without a willing, proper mate to take my willing seed in innumerable rotations of the Orb. You will learn to treasure our every moment together.</i> She thrusts forward once more. <i>If you do not already.</i>");
	output("\n\nWith that said, she picks up her pace, humping against you with far more urgency than her previous, almost nonchalant pace had allowed. You’re dragged across the ice with heavy pushes against your [pc.hips], the thick, fat dragon cock inside you bloating one final time as her gurgling balls ready to shoot their load.");
	output("\n\nThe sound of claws against ice reverberate off the walls of the lair, and [frostwyrm.name] begins to pant. <i>Something is coming over me,</i> she tells you, her ‘voice’ coming out staggered and shaky. <i>I... I do not know what is happening to me. My body moves on its own. Something... something is happening to my–</i>");
	output("\n\nHer haunches press forward once more, burying the entirety of her dick inside you, and she unloads. You hear it before you feel it: her massive balls clench and the hot cum inside begins to rush. Her pole flexes and stretches inside you, accommodating the huge surge of liquid straight to your womb – and then you feel the hot stream unleash within you, coating your innards with her seed.");
	output("\n\nYou’re overloaded with so many sensations at once: [frostwyrm.name]’s cum fills your already-overstuffed body even fuller; the electric, energizing power flowing through your body lifts your spirit to a height you’ve never even imagined; and both of them combined cause you to orgasm explosively. Your [pc.girlcum] sprays up and around [frostwyrm.name]’s tool, soaking and squeezing it, milking it and enticing it for yet more cum.");
	if (pc.isHerm()) {
		output(" Similarly, your [pc.cum] launches from your [pc.cock] unbidden; it paints the ice beneath you, surging as high as your [pc.chest] as you ride out your mate’s orgasm.");
		if (pc.cumQ() >= 1000) output(" Briefly, you wonder who between you has the bigger load. Maybe you could compare someday...");
	}
	output("\n\nAnd yet more cum [frostwyrm.name] provides: with balls like hers, she must have enough in one wave than most have across a month, and she bloats you with all of it. Your already-distended [pc.belly] inflates with her draconic cum, and it doesn’t stop: your every nerve counts every drop of her cum inside you, ushering it all towards your willing womb for the eggs [frostwyrm.name] so badly desires. When your stomach touches down against the icy floor, you hear a wet ‘glorp’ behind you, followed by a rush of liquid heat down your [pc.legs] – all that cum must have backed up so much, you’re getting backwash. And [frostwyrm.name] still isn’t done!");
	output("\n\n[frostwyrm.name] sighs and relaxes her front legs, lowering her body while she unloads inside you. You follow suit, taking a similar position, allowing gravity to do its work in drawing the liquid deeper into your body. The contrasting coolness of the ice beneath you and the body heat above you make you dizzy at first, but the electricity flowing through you, emanating from your [pc.vagOrAss " + vIdx + "], makes you feel like a million credits.");
	output("\n\nYou begin to settle, your [pc.vagOrAss " + vIdx + "] speared open by the Frostwyrm’s gargantuan tool. Your head is swimming; you couldn’t focus on any one thought or feeling if you tried. From [frostwyrm.name]’s lack of movement, she must feel similarly, and is taking to basking in the glow of having plowed her mate so well and thoroughly.");
	output("\n\nYou don’t have a doubt that you’ve been inseminated by [frostwyrm.name], assuming such a thing is possible, as she asserted. Cum continues to seep from the miniscule spaces between her cock and your stuffed gash; your thoughts slowly go from the raw fucking you just got, to what the kid would look like; to whether it would be an egg or a live birth; to what gender they would be. You also wonder how much longer you’re going to be underneath [frostwyrm.name]");
	if (!pc.isAmazon(false)) output("; you’re starting to get a little cramped, and you’d like to get started on recuperating from having such a large insertion inside you.");
	else output(".");
	output("\n\n<i>I do not understand the question,</i> you hear [frostwyrm.name] say. While her log’s stopped its flexing and pumping inside you, it hasn’t gotten soft. <i>You wish to remove yourself from your position beneath me?</i> You confirm that, yes, that is what you were wondering.");
	output("\n\nShe audibly hesitates, trying to piece together her thoughts. ");
	if(pc.isHerm()) output("<i>You already understand how my kind couple, [pc.name]. Now that our positions are reversed, you understood that we would not couple one single time.</i> You respond that your body isn’t built the same as hers, and that you were idly wondering if circumstances would be different, considering the difference in... attributes. <i>They would not,</i> she answers deftly and sternly. <i>We must guarantee that you lay before the next Light’s Rise, and that requires multiple more couplings yet.</i>");
	else output("<i>We have coupled only once, [pc.name]. We have many more yet ahead of us. Is this not how your kinds mate?</i> You answer that, while it would be impressive for a number of reasons, no, your kind usually only go once before stopping. <i>How could this be? How do your kind guarantee a lay after just one coupling?</i> You try to explain that it has nothing to do with pregnancy and that your bodies are designed differently, but [frostwyrm.name] isn’t having it. <i>You are in my lair, [pc.name], and you have submitted to mating as my kind do. We will continue until I am satisfied.</i>");
	if (pc.isAmazon(false)){
		output(" you’re in no rush to remove [frostwyrm.name] from yourself, and in fact you’re more than ready for another round or three - no sense in leaving your incoming pregnancy to chance, after all! - but, if you had to complain about any single thing, it’s that the icy floor of the lair is cold.");
		output("\n\n<i>I am afraid there is little to be done about that, from my position,</i> [frostwyrm.name] tells you, her body shifting and her cock nuzzling against your quim all the tighter. <i>If you would like, I may grant you a moment to achieve a more comfortable position before we resume.</i>");
		output("\n\nYou tell her that you’ll survive - you’re much more interested in getting some more of that Frostwyrm cum in your womb. You have the energy to go as long as she does, and you’re committed to getting yourself a baby in your belly before the night’s over. You shouldn’t waste any more time and get back to it!");
		output("\n\n<i>I am glad your thoughts are similar to mine, my mate,</i> [frostwyrm.name] says, her knees buckling and her hips adjusting, to begin ploughing into your [pc.vagOrAss " + vIdx + "] some more. <i>I will ensure your conception before the next Light’s Rise.</i>");
	}
	output("\n\nWith all that said and done, [frostwyrm.name] flexes her haunches and rolls forward once, driving her girth into you once more, starting up another ride. Your body aches and cramps, desperate for a rest, but the now-familiar electric, empowering feeling begins to course through you once more. At least your aches are the good kind.");
	
	processTime(3 * 60);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if(vIdx >= 0) pc.loadInCunt(frostwyrm,vIdx);
	else pc.loadInAss(frostwyrm);
	IncrementFlag("FROSTWYRM_DICKED_YOU");
	
	clearMenu();
	addButton(0, "Next", frostwyrmGoodGodImHurt, vIdx);
}
public function frostwyrmDickRepeat():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	var vIdx:int = -1;
	if(pc.hasVagina() && pc.blockedVaginas() == 0){
		vIdx = pc.findEmptyPregnancySlot(1);
		//if(vIdx < 0) vIdx = rand(pc.totalVaginas());
	}
	
	output("You study [frostwyrm.name]’s powerful frame: from her stout forelegs, to her imposing wings, to her powerful hind legs. You steal glances between them, peeking at her genital slit housing the incredible, imposing girth within her. Just a little bit further back is a pair of leathery testicles, each one larger than your torso and then some, backed up with enough jizz to flood a small village.");
	output("\n\nA rogue thought flits across your mind – you wouldn’t mind that jizz flooding <i>you</i> again. You wouldn’t mind getting underneath [frostwyrm.name] and presenting yourself to her, like a good, proper mate. You wouldn’t mind feeling every last bit of her massive, draconic cock throb and unload inside you, depositing in one rut what a house full of horny men couldn’t in a week.");
	output("\n\nYour thoughts have an effect on [frostwyrm.name], and the beginnings of her incredible cock begin to slip from her slit. And in a hurry, it begins to slide from her, getting long before it gets fat.");
	output("\n\n[frostwyrm.name] growls to herself as you stare at her bestial form. <i>Your mate has need of you, [pc.name],</i> she says lowly, nudging you with her huge head. <i>She must feel you on her once more. No doubt you yearn to feel the same.</i>");
	output("\n\nYou look underneath the barrel of her stomach as you travel along her serpentine form. She’s rather calm, but you can feel her heartbeat grow stronger throughout her body, sending her blood somewhere <i>special</i> in particular. You spy her draconian dick, its thick, blunted tip pressing crudely against the icy floor of her lair and bloating fatter and longer with her every heartbeat.");
	output("\n\nShe notices you stare, and you feel her pluck at your head gently. You lick your [pc.lips] as you stare at her cock and you find yourself feeling all sorts of thoughts about it: how it would feel <i>against</i> you and <i>inside</i> you. How it could hurt you, and ruin you for anyone else – how nobody else could pleasure you again if you were to take [frostwyrm.name] inside you. [frostwyrm.name]’s testicles, each easily large enough that you could curl into one, bounce in excitement, in time with the thumping and growing of her already massive erection, excited for the opportunity to breed you");
	output("\n\nYou’re not entirely sure that every one of those thoughts were yours");
	if (pc.isBimbo()) output("– you have so few original ones nowadays,");
	output(" but you nonetheless agree with each of them. <i>It is time you tend to your mate once more, [pc.name],</i> [frostwyrm.name] says, awaiting your position beneath her. <i>My body hungers for yours, and I know yours thirsts for mine. I am a proper mate: I will quench you properly.</i>");
	if (pc.hasPregnancyOfType("FrostwyrmPregnancy")) output("The kip inside you requires tending to. Repeated coupling will ensure a healthy shell; a satisfied mate will strengthen its bond with its Qim and Qal.</i> She straightens her spine as she awaits your position. <i>To say nothing of the bonds between two satisfied mates.</i>");
	output("\n\nExcited yourself, you get onto all fours and crawl beneath [frostwyrm.name], face-to-head with her massive cock. It’s easily three feet long with a larger girth than your fist; the skin of her cock is so thick that it hides her pulsing veins and the shaft has several nubs and pricks along the underside of its length. It has a flat, mostly-featureless head, save from a rim of muscle around its glans, reminding you of a tree trunk. A bead of its musky, thick pre beads at the final nub on its very point, slowly drooping down to splash against the icy floor. And it’s getting <i>bigger.</i>");
	output("\n\n[frostwyrm.name] is quite patient for her part, grumbling wordlessly above you as she waits for you to do her work for her. You turn about, facing away from the red behemoth of a dick, then reach back to grasp it. She remains still, knowing from experience that you need a moment to line yourself up to properly take her. Still, the touch of your hand against her dick excites her: her cock flexes, and a long line of precum sprays across your upturned [pc.ass] and across your back.");
	output("\n\nYou shuffle your [pc.hips] a bit, aligning yourself with [frostwyrm.name]’s incredible tool. When you push it to the left a bit, it finds its mark:");
	if(vIdx >= 0) output(" the beady nub finds your [pc.clit " + vIdx + "], and with it, the rest of");
	output(" your [pc.vagOrAss " + vIdx + "]. You tense at first, unsure if it’ll fit, but you feel [frostwyrm.name] pluck and string at your mind, helping you relax, easing your body for her to play with. Eager and confident, [frostwyrm.name] thrusts forward, burying herself inside you.");
	output("\n\nYou rest your cheek against the cold, icy floor as you give yourself what your body wanted: more of [frostwyrm.name]’s incredible cock. The breath leaves your lungs as, with practiced patience, she steps forward and fills the gap of your body with herself. There aren’t a lot of cocks in the universe that can satisfy you the way [frostwyrm.name]’s can anymore; right now, with you here, in her lair, underneath her and [pc.ass] up to accept her, you’re okay with that.");
	output("\n\nYou hear [frostwyrm.name] purr above you: so close to her lungs and so close to the floor, the acoustics are stronger than ever. <i>There are some thoughts of yours that I do not review, for your respect,</i> she tells you as her legs tense. She shuffles her body forward just slightly, readying herself to fuck you properly. <i>I know, however, that you enjoy me. Being beneath me and appreciating my... stature. I know that, despite not being of my kind, you crave that I rut you like one. You need only ask.</i>");
	if (pc.isBimbo()) output("\n\nYou don’t really know how to phrase it... you don’t know a lot of words to begin with, and, like, none of them really explain how badly you need [frostwyrm.name]’s dick inside you. You’re fucking ruined for anyone else, and now, the only way you can get off anymore is if she fucking fucks you. So, pretty please, with a cherry on top – could she please fuck you?");
	else output("\n\nYou do as she says, and, on your hands and knees beneath her immense torso, you beg her to fill you with her incredible cock once more. No other dick in the universe can satisfy you anymore; ever since the first time you two have mated, nobody else could satisfy you the way she does.");
	output(" [frostwyrm.name] hums to herself as she hears your pleas, and shuffles forward. <i>Very well.</i>");
	output("\n\n[frostwyrm.name] flexes her haunches, and then pumps forward, forcing yet more of herself into your [pc.vagOrAss " + vIdx + "]. You shuffle forward on the ice, pushed along by her girth, and when she withdraws, you’re dragged backward slightly. She humps forward, and now, you’re getting fucked up the cooch by a Frostwyrm, eager to take her seed for yourself. [frostwyrm.name]’s humps are slow, thorough and methodical, ensuring that you’re full as can be before pulling out to fuck you deep again.");
	output("\n\nYour fingers curl into fists as you try to withstand [frostwyrm.name] pushing herself into you. Her excitement at being inside you is evident: her long, fat dick expands inside you, bloating far larger than your earlier estimate. You couldn’t possibly ballpark it: with how wide you’ve been spread and how much more dick there is to go, it may as well be an actual tree you’re being stuffed with.");
	output("\n\nMore than the cock in your [pc.vagOrAss " + vIdx + "], though, you feel something... else. A sort of excitement rushes through you: it feels electric, energizing you throughout your body, starting at your chest and rushing through your limbs. You feel... intense. Powerful. Young. <i>Alive.</i> The feeling powers your whole body, but especially your [pc.vagOrAss " + vIdx + "]");
	if (pc.hasCock()) output(" and <i>especially</i> your [pc.cock]");
	output(". You come back to [frostwyrm.name] for a lot of reasons – her mammoth tool certainly being one of them, and this vitalizing feeling coursing through your soul is another.");
	output("\n\n[frostwyrm.name] makes what sounds like a grunt as her mating grows more forceful. She doesn’t move faster, but her hips draw further back and they press forward more insistently, digging into your body for your core. Despite being spread on her body like a living sock, you feel nothing but elation at the treatment, and you beg to her (via her psionics – you can barely breathe, as stuffed as you are, much less speak) for more.");
	output("\n\n<i>I am pleased that you are so receptive to myself and my seed, [pc.name],</i> she says, casually pumping forward to jam even more of herself into your warm, welcoming, and experienced tunnel. <i>You needn’t be hesitant to ask for any part of myself. I have a lifetime’s worth of breeding to accomplish with you. I will provide all the pleasures you desire.</i>");
	output("\n\n[frostwyrm.name]’s posture becomes stiffer and upright as she feels herself sink deeper into you. A heavy thumping reverberates behind you with her every push in; after a few more powerful thrusts, you feel hot, smooth, leathery skin bump against your [pc.feet], then drape up your ankles. She’s almost balls-deep inside you; you both come to the same realization at the same time, and you’re flooded with another wave of the same energy from before. She’s forceful and determined, and you’re receptive and greedy – the perfect combination for a pair of mates like yourselves.");
	output("\n\nYou’re too paralyzed to try and get a look behind you, to see how much is inside you or how much is left. All you can do is focus on not blacking out from the intense pleasure: it feels as though every nerve in every cell is stimulated. [frostwyrm.name]’s heavy musk permeates your nose and even your mouth, thick as it is beneath her; your sight is consumed by the heaving, thick, armored underbelly of your Frostwyrm lover and the way her four visible legs repeatedly flex and paw at the ice; you hear her ragged breathing and powerful heartbeat resonate and sync with your own; and, of course, there’s the feeling of having a cock ");
	if (pc.tallness <= 48) output("almost as long");
	else output("half as long");
	output(" as you are tall in your [pc.vagOrAss " + vIdx + "].");
	
	frostwyrm.cockChange();
	if(vIdx >= 0) pc.cuntChange(vIdx, frostwyrm.cockVolume(0));
	else pc.buttChange(frostwyrm.cockVolume(0));
	
	output("\n\nYour mind phases in and out of sensibility as [frostwyrm.name] ruts you. You idly wonder how far across her lair you’ve been pushed. Your [pc.chest] " + (pc.hasBreasts() ? "have" : "has") + " gone numb from the ice beneath you");
	if (pc.isLactating()) output(" and your [pc.milk] drips from your [pc.belly], marking your trail behind you");
	output(", but what difference is there between numbness from the cold and numbness from the pleasure? You rest easy, allowing your Frostwyrm mate to have her way with you, one slow and powerful thrust at a time.");
	output("\n\nAfter what feels like an eternity, you feel a sensation you could hardly believe when it happens: a soft texture and a comparatively intense heat, resting gently against your [pc.ass]. You feel two impossibly large and heavy testicles swish and massage against your outstretched [pc.legs] with [frostwyrm.name]’s motions. And you hear an audible clap every time she thrusts forward. Somehow, someway, [frostwyrm.name] has bottomed out her entire three-foot-maybe-longer dick inside you.");
	output("\n\nShe snorts in satisfaction, resting her haunches for a moment as she adjusts to the feel of herself inside you. Electricity surges through you: [frostwyrm.name] is feeding her emotions through you via her psionics, and you’ve never felt more <i>alive.</i>");
	output("\n\nShe sighs a long, exaggerated sigh as she enjoys being inside you so totally. <i>I had gone my entire existence without knowing of this... this feeling,</i> she says, roiling her haunches slightly and feeling you shuffle with her, impaled on her as you are. <i>Tell me how it feels for you. Explain to your mate how satisfied she makes you.</i> You try to respond, but your mouth can’t form the words – you feel [frostwyrm.name] rack your mind for your thoughts and emotions for a better answer. <i>Your mind is fractured over nothing but the pleasure your mate has bestowed! Once you’ve recovered, we may go again, as many times as you like.</i>");
	output("\n\nWith that said, she picks up her pace, humping against you with far more urgency than her previous, almost nonchalant pace had allowed. You’re dragged across the ice with heavy pushes against your [pc.hips], the thick, fat dragon cock inside you bloating one final time as her gurgling balls ready to shoot their load.");
	output("\n\n[frostwyrm.name]’s breathing grows staggered and heavy as her pace increases, and her heavy heartbeat picks up intensely. <i>I have come to include this feeling in my fantasies, during my idle times,</i> she says, almost proudly. Her voice is steady and confident, belying the resolve her body is showing. <i>What you call my ‘orgasm’ is fast approaching. You will again feel your body grow gravid with my seed.");
	if (pc.hasPregnancyOfType("FrostwyrmPregnancy")) output(" Our kip will grow strong, gracious, and grateful.");
	else output(" You may lay once more, before another Storm’s Phase.");
	output("</i>");
	output("\n\nHer haunches press forward once more, burying the entirety of her dick inside you, and she unloads. You hear it before you feel it: her massive balls clench and the hot cum inside begins to rush. Her pole flexes and stretches inside you, accommodating the huge surge of liquid straight to your womb – and then you feel the hot stream unleash within you, coating your innards with her seed.");
	output("\n\nYou’re overloaded with so many sensations at once: [frostwyrm.name]’s cum fills your already-overstuffed body even fuller; the electric, energizing power flowing through your body lifts your spirit to a height you’ve never even imagined; and both of them combined cause you to orgasm explosively. Your [pc.girlcum] sprays up and around [frostwyrm.name]’s tool, soaking and squeezing it, milking it and enticing it for yet more cum.");
	if (pc.isHerm()) {
		output(" Similarly, your [pc.cum] launches from your [pc.cock] unbidden; it paints the ice beneath you, surging as high as your [pc.chest] as you ride out your mate’s orgasm.");
		if (pc.cumQ() >= 1000) output(" Briefly, you wonder who between you has the bigger load. Maybe you could compare someday...");
	}
	output("\n\nAnd yet more cum [frostwyrm.name] provides: with balls like hers, she must have enough in one wave than most have across a month, and she bloats you with all of it. Your already-distended [pc.belly] inflates with her draconic cum, and it doesn’t stop: your every nerve counts every drop of her cum inside you, ushering it all towards your willing womb for the eggs [frostwyrm.name] so badly desires. When your stomach touches down against the icy floor, you hear a wet ‘glorp’ behind you, followed by a rush of liquid heat down your [pc.legs] – all that cum must have backed up so much, you’re getting backwash. And [frostwyrm.name] still isn’t done!");
	output("\n\n[frostwyrm.name] sighs and relaxes her front legs, lowering her body while she unloads inside you. You follow suit, taking a similar position, allowing gravity to do its work in drawing the liquid deeper into your body. The contrasting coolness of the ice beneath you and the body heat above you make you dizzy at first, but the electricity flowing through you, emanating from your [pc.vagOrAss " + vIdx + "], makes you feel like a million credits.");
	output("\n\nYou hum to yourself, laying a cheek against the cool ice beneath you, as you settle in. Knowing [frostwyrm.name], she isn’t satisfied with just one round, and she’s going to be after another one or six before she considers this mating a success.");
	output("\n\n<i>You suppose correctly, [pc.name],</i> she purrs, rocking her huge haunches back and forth to prepare her footing for another go. <i>I am glad you’ve taken to appreciating our couplings and my kind’s way of mating. We have many more ahead of us.</i>");
	output("\n\nWith that, she begins pumping into your abused [pc.vagOrAss " + vIdx + "] once more, filling you to the core with herself. The seed already inside you sloshes about, mixing with itself inside you, as [frostwyrm.name] humps against you. You smile to yourself as the electric, energizing feeling returns to you once again....");
	
	processTime(3 * 60);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if(vIdx >= 0) pc.loadInCunt(frostwyrm,vIdx);
	else pc.loadInAss(frostwyrm);
	IncrementFlag("FROSTWYRM_DICKED_YOU");
	
	clearMenu();
	if (flags["FROSTWYRM_KIP_COUNT"] == undefined) addButton(0, "Next", frostwyrmGoodGodImHurt, vIdx);
	else addButton(0, "Next", frostwyrmAftercare, vIdx);
}
public function frostwyrmAnalFunTimes():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("You study [frostwyrm.name]’s powerful frame: from her stout forelegs, to her imposing wings, to her powerful hind legs. You steal glances between them, peeking at her genital slit housing the incredible, imposing girth within her. Just a little bit further back is a pair of leathery testicles, each one larger than your torso and then some, backed up with enough jizz to flood a small village.");
	if (flags["FROSTWYRM_ANAL_PITCH"] == undefined){
		output("\n\nAn impish thought comes to you – what would it be like to try and shove a beast like that into your [pc.asshole]? Surely, it’s beyond the realm of reason, but nonetheless, you entertain the thought of cramming well-over three feet of flesh into your body via your butt. What would it feel like? Could you take it all?");
		if (pc.hasCock()) output(" How could that <i>possibly</i> feel against your prostate?");
	}
	else output("\n\nYou bite your lower [pc.lip] as you recall the last time you managed to get her into your back passage. It was rather trying, but it was so... <i>thrilling.</i> You accomplished something you had no idea was even possible. You remember the electric sensation as she drove into you, pushing you along the ice, impaled by the ass on her cock. And you think to yourself that you’d like to do it again.");
	if (flags["FROSTWYRM_ANAL_PITCH"] == undefined){
		output("\n\n[frostwyrm.name]’s psionic strength combs at your mind, wondering what you’re thinking – and you watch her visibly straighten her body when she finds your thoughts. <i>You would have me...?</i> she asks incredulously, her four eyes scanning yours for weakness. But you can’t hide from your own curiosities, and she picks up on that.");
		if (pc.hasVagina()) output("\n\n<i>Even when you are capable of receiving me naturally?</i>");
		else output("\n\n<i>You would receive me even when you are not naturally assigned to do so?</i>");
		output(" she asks. You answer that you can’t explain the attraction, knowing full-well that it’s not what nature intended, but, yes, it’s something your kind do fairly regularly, and you wouldn’t mind... attempting it with her.");
		output("\n\nHer stare continues on you, before you feel a sort of languidness overtake your body, making you limber and <i>receptive.</i> She must have warmed up to the idea. <i>Very well. As a proper mate, I will indulge your kind’s... eccentricities.</i>");
	}
	else{
		output("\n\nYou feel [frostwyrm.name] comb at your mind, wondering what it is you’re thinking. When she finds the images you’re seeing in your mind’s eye, a soft purr escapes her throat. <i>Your kind’s propensity to defy the natural law is a curious thing, [pc.name],</i> she says.");
		output("\n\nYou say that you can’t help it. <i>You needn’t explain yourself,</i> she says assuredly, then turns her body to one side, exposing her flank to you. <i>Our mating is not what one would describe as truly ‘natural.’ I would have you beneath me once more. I will satisfy your cravings and indulgences once more.</i>");
	}
	output("\n\nYou look underneath the barrel of her stomach as you travel along her serpentine form. She’s rather calm, but you can feel her heartbeat grow stronger throughout her body, sending her blood somewhere <i>special</i> in particular. You spy her draconian dick, its thick, blunted tip pressing crudely against the icy floor of her lair and bloating fatter and longer with her every heartbeat.");
	output("\n\nShe notices you stare, and you feel her pluck at your head gently. You lick your [pc.lips] as you stare at her cock and you find yourself feeling all sorts of thoughts about it: how it would feel <i>against</i> you and <i>inside</i> you. How it could hurt you, and ruin you for anyone else – how nobody else could pleasure you again if you were to take [frostwyrm.name] inside you. [frostwyrm.name]’s testicles, each easily large enough that you could curl into one, bounce in excitement, in time with the thumping and growing of her already massive erection, excited for the opportunity to breed you");
	output("\n\nYou’re not entirely sure that every one of those thoughts were yours");
	if (pc.isBimbo()) output("– you have so few original ones nowadays,");
	output(" but you nonetheless agree with each of them. <i>It is time you tend to your mate once more, [pc.name],</i> [frostwyrm.name] says, awaiting your position beneath her. <i>My body hungers for yours, and I know yours thirsts for mine. I am a proper mate: I will quench you properly.</i>");
	if (pc.hasPregnancyOfType("FrostwyrmPregnancy")) output("The kip inside you requires tending to. Repeated coupling will ensure a healthy shell; a satisfied mate will strengthen its bond with its Qim and Qal.</i> She straightens her spine as she awaits your position. <i>To say nothing of the bonds between two satisfied mates.</i>");
	output("\n\nExcited yourself, you get onto all fours and crawl beneath [frostwyrm.name], face-to-head with her massive cock. It’s easily three feet long with a larger girth than your fist; the skin of her cock is so thick that it hides her pulsing veins and the shaft has several nubs and pricks along the underside of its length. It has a flat, mostly-featureless head, save from a rim of muscle around its glans, reminding you of a tree trunk. A bead of its musky, thick pre beads at the final nub on its very point, slowly drooping down to splash against the icy floor. And it’s getting <i>bigger.</i>");
	output("\n\n[frostwyrm.name] is quite patient for her part, grumbling wordlessly above you as she waits for you to do her work for her. You turn about, facing away from the red behemoth of a dick, then reach back to grasp it. She remains still, knowing from experience that you need a moment to line yourself up to properly take her. Still, the touch of your hand against her dick excites her: her cock flexes, and a long line of precum sprays across your upturned [pc.ass] and across your back.");
	output("\n\nYou shuffle your [pc.hips] a bit, aligning yourself with [frostwyrm.name]’s incredible tool. When you push it to the left a bit, it finds its mark: its tip, with a urethra nearly the size of its target, finds your [pc.asshole]. You tense at first, unsure if it’ll fit, but you feel [frostwyrm.name] pluck and string at your mind, helping you relax, easing your body for her to play with. Eager and confident, [frostwyrm.name] thrusts forward, burying herself inside you.");
	output("\n\nYou rest your cheek against the cold, icy floor as you give yourself what your body wanted: more of [frostwyrm.name]’s incredible cock. The breath leaves your lungs as, with practiced patience, she steps forward and fills the gap of your body with herself. There aren’t a lot of cocks in the universe that can satisfy you the way [frostwyrm.name]’s can anymore; right now, with you here, in her lair, underneath her and [pc.ass] up to accept her, you’re okay with that.");
	output("\n\nWith the help of [frostwyrm.name]’s psionic abilities, you’re able to conform to her size, though it’s nonetheless not without effort. You grunt and bite your bottom lip, almost hard enough to draw blood, as she motions forward ever so slightly; every centimeter feels like a hundred, and you’re eager for every last bit");
	if (pc.hasCock()) output(". In only moments, she’s crushing your prostate, making you harder than you’ve ever been, but you find it difficult to enjoy the pleasure when your senses are too occupied with the insertion in your [pc.ass].");
	output("\n\nYou hear [frostwyrm.name] purr above you: so close to her lungs and so close to the floor, the acoustics are stronger than ever. <i>There are some thoughts of yours that I do not review, for your respect,</i> she tells you as her legs tense. She shuffles her body forward just slightly, readying herself to fuck you properly. <i>I know, however, that you enjoy me. Being beneath me and appreciating my... stature. I know that, despite not being of my kind, you crave that I rut you like one. You need only ask.</i>");
	if (pc.isBimbo()) output("\n\nYou don’t really know how to phrase it... you don’t know a lot of words to begin with, and, like, none of them really explain how badly you need [frostwyrm.name]’s dick inside you. You’re fucking ruined for anyone else, and now, the only way you can get off anymore is if she fucking fucks you. So, pretty please, with a cherry on top – could she please fuck you?");
	else output("\n\nYou do as she says, and, on your hands and knees beneath her immense torso, you beg her to fill you with her incredible cock once more. No other dick in the universe can satisfy you anymore; ever since the first time you two have mated, nobody else could satisfy you the way she does.");
	output(" [frostwyrm.name] hums to herself as she hears your pleas, and shuffles forward. <i>Very well.</i>");
	output("\n\n[frostwyrm.name] flexes her haunches, and then pumps forward, forcing yet more of herself into your [pc.asshole]. You shuffle forward on the ice, pushed along by her girth, and when she withdraws, you’re dragged backward slightly. She humps forward, and now, you’re getting fucked up the ass by a Frostwyrm, eager to take her seed for yourself. [frostwyrm.name]’s humps are slow, thorough and methodical, ensuring that you’re full as can be before pulling out to fuck you deep again.");
	output("\n\nYour fingers curl into fists as you try to withstand [frostwyrm.name] pushing herself into you. Her excitement at being inside you is evident: her long, fat dick expands inside you, bloating far larger than your earlier estimate. You couldn’t possibly ballpark it: with how wide you’ve been spread and how much more dick there is to go, it may as well be an actual tree you’re being stuffed with.");
	output("\n\nMore than the cock in your [pc.ass], though, you feel something... else. A sort of excitement rushes through you: it feels electric, energizing you throughout your body, starting at your chest and rushing through your limbs. You feel... intense. Powerful. Young. <i>Alive.</i> The feeling powers your whole body, but especially your [pc.ass]");
	if (pc.hasCock()) output(" and <i>especially</i> your [pc.cock]");
	output(". You come back to [frostwyrm.name] for a lot of reasons – her mammoth tool certainly being one of them, and this vitalizing feeling coursing through your soul is another.");
	output("\n\n[frostwyrm.name] makes what sounds like a grunt as her mating grows more forceful. She doesn’t move faster, but her hips draw further back and they press forward more insistently, digging into your body for your core. Despite being spread on her body like a living sock, you feel nothing but elation at the treatment, and you beg to her (via her psionics – you can barely breathe, as stuffed as you are, much less speak) for more.");
	output("\n\n<i>I am pleased that you are so receptive to myself and my seed, [pc.name],</i> she says, casually pumping forward to jam even more of herself into your warm, welcoming, and experienced tunnel. <i>You needn’t be hesitant to ask for any part of myself. I have a lifetime’s worth of breeding to accomplish with you. I will provide all the pleasures you desire.</i>");
	output("\n\n[frostwyrm.name]’s posture becomes stiffer and upright as she feels herself sink deeper into you. A heavy thumping reverberates behind you with her every push in; after a few more powerful thrusts, you feel hot, smooth, leathery skin bump against your [pc.feet], then drape up your ankles. She’s almost balls-deep inside you; you both come to the same realization at the same time, and you’re flooded with another wave of the same energy from before. She’s forceful and determined, and you’re receptive and greedy – the perfect combination for a pair of mates like yourselves.");
	output("\n\nYou’re too paralyzed to try and get a look behind you, to see how much is inside you or how much is left. All you can do is focus on not blacking out from the intense pleasure: it feels as though every nerve in every cell is stimulated. [frostwyrm.name]’s heavy musk permeates your nose and even your mouth, thick as it is beneath her; your sight is consumed by the heaving, thick, armored underbelly of your Frostwyrm lover and the way her four visible legs repeatedly flex and paw at the ice; you hear her ragged breathing and powerful heartbeat resonate and sync with your own; and, of course, there’s the feeling of having a cock ");
	if (pc.tallness <= 48) output("almost as long");
	else output("half as long");
	output(" as you are tall in your [pc.asshole].");
	
	frostwyrm.cockChange();
	pc.buttChange(frostwyrm.cockVolume(0));
	
	output("\n\nYour mind phases in and out of sensibility as [frostwyrm.name] ruts you. You idly wonder how far across her lair you’ve been pushed. Your [pc.chest] " + (pc.hasBreasts() ? "have" : "has") + " gone numb from the ice beneath you");
	if (pc.isLactating()) output(" and your [pc.milk] drips from your [pc.belly], marking your trail behind you");
	output(", but what difference is there between numbness from the cold and numbness from the pleasure? You rest easy, allowing your Frostwyrm mate to have her way with you, one slow and powerful thrust at a time.");
	output("\n\nAfter what feels like an eternity, you feel a sensation you could hardly believe when it happens: a soft texture and a comparatively intense heat, resting gently against your [pc.ass]. You feel two impossibly large and heavy testicles swish and massage against your outstretched [pc.legs] with [frostwyrm.name]’s motions. And you hear an audible clap every time she thrusts forward. Somehow, someway, [frostwyrm.name] has bottomed out her entire three-foot-maybe-longer dick inside you.");
	output("\n\nShe snorts in satisfaction, resting her haunches for a moment as she adjusts to the feel of herself inside you. Electricity surges through you: [frostwyrm.name] is feeding her emotions through you via her psionics, and you’ve never felt more <i>alive.</i>");
	output("\n\nShe sighs a long, exaggerated sigh as she enjoys being inside you so totally. <i>I had gone my entire existence without knowing of this... this feeling,</i> she says, roiling her haunches slightly and feeling you shuffle with her, impaled on her as you are. <i>Tell me how it feels for you. Explain to your mate how satisfied she makes you.</i> You try to respond, but your mouth can’t form the words – you feel [frostwyrm.name] rack your mind for your thoughts and emotions for a better answer. <i>Your mind is fractured over nothing but the pleasure your mate has bestowed! Once you’ve recovered, we may go again, as many times as you like.</i>");
	output("\n\nWith that said, she picks up her pace, humping against you with far more urgency than her previous, almost nonchalant pace had allowed. You’re dragged across the ice with heavy pushes against your [pc.hips], the thick, fat dragon cock inside you bloating one final time as her gurgling balls ready to shoot their load.");
	output("\n\n[frostwyrm.name]’s breathing grows staggered and heavy as her pace increases, and her heavy heartbeat picks up intensely. <i>I have come to include this feeling in my fantasies, during my idle times,</i> she says, almost proudly. Her voice is steady and confident, belying the resolve her body is showing. <i>What you call my ‘orgasm’ is fast approaching. You will again feel your body grow gravid with my seed.");
	if (pc.hasPregnancyOfType("FrostwyrmPregnancy")) output(" Our kip will grow strong, gracious, and grateful.");
	else output(" You may lay once more, before another Storm’s Phase.");
	output("</i>");
	output("\n\nHer haunches press forward once more, burying the entirety of her dick inside you, and she unloads. You hear it before you feel it: her massive balls clench and the hot cum inside begins to rush. Her pole flexes and stretches inside you, accommodating the huge surge of liquid straight to your core – and then you feel the hot stream unleash within you, coating your innards with her seed.");
	output("\n\nYou’re overloaded with so many sensations at once: [frostwyrm.name]’s cum fills your already-overstuffed body even fuller; the electric, energizing power flowing through your body lifts your spirit to a height you’ve never even imagined; and both of them combined cause you to orgasm explosively.");
	if (pc.isHerm()) {
		output(" Similarly, your [pc.cum] launches from your [pc.cock] unbidden; it paints the ice beneath you, surging as high as your [pc.chest] as you ride out your mate’s orgasm.");
		if (pc.cumQ() >= 1000) output(" Briefly, you wonder who between you has the bigger load. Maybe you could compare someday...");
	}
	output("\n\nAnd yet more cum [frostwyrm.name] provides: with balls like hers, she must have enough in one wave than most have across a month, and she bloats you with all of it. Your already-distended [pc.belly] inflates with her draconic cum, and it doesn’t stop: your every nerve counts every drop of her cum inside you, ushering it all towards your willing body and stomach, providing you both the thrill you’ve been looking for. When your stomach touches down against the icy floor, you feel a thick heat rise up your chest, then along your throat. You lean your head down, mouth open, and out it pours: [frostwyrm.name]’s cum, having overwhelmed your system, comes unbidden out the other end. You meekly try to swallow it back down, but anything that comes out is just replaced with yet more up your [pc.ass].");
	output("\n\n[frostwyrm.name] sighs and relaxes her front legs, lowering her body while she unloads inside you. You follow suit, taking a similar position, allowing gravity to do its work in drawing the liquid deeper into your body. The contrasting coolness of the ice beneath you and the body heat above you make you dizzy at first, but the electricity flowing through you, emanating from your [pc.ass], makes you feel like a million credits.");
	
	processTime(3 * 60);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.loadInAss(frostwyrm);
	IncrementFlag("FROSTWYRM_ANAL_PITCH");
	
	clearMenu();
	addButton(0, "Next", frostwyrmMainMenu, undefined);
}
public function frostwyrmSteeleIsADirtyGirl():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	if (flags["FROSTWYRM_GAVE_BATH"] == undefined){
		output("You follow [frostwyrm.name]’s unspoken command to strip naked – once you’re in her lair, you follow her rules, and she has decreed that her mate will be naked at all times. You undress and place your effects at a far corner in the lair, where you’re sure it’ll be undisturbed.");
		output("\n\nYou approach the raised icy platform that is [frostwyrm.name]’s bedding, where she has already curled herself into a disk, her tail wagging lazily at you, beckoning you to join her. Once you do, however, you notice that [frostwyrm.name]’s four red eyes are trained on you somewhat intently; she watches your movements as you approach her, and you hesitate in your stride, cautious that you might be committing some faux pas or something by approaching without her explicit permission.");
		output("\n\n<i>You have not bathed in some time,</i> [frostwyrm.name] notes imperiously, her nostrils flaring. <i>Are kinds like yours incapable of proper hygiene?</i>");
		output("\n\nYou’re not certain if it’s an actual question, or if she is being condescending. <i>I meant no offense,</i> she replies earnestly. <i>Some lesser kinds do not practice proper hygiene and do not understand their benefits.</i> You answer that your kind practice and appreciate it – you simply haven’t had the spare time to give yourself a wash lately.");
		output("\n\nAt the admission, [frostwyrm.name] cranes her long neck and gently but insistently pulls you towards her with her lower jaw to your back. <i>I will bathe you,</i> she says, with some finality. <i>A proper mate would not leave their other in need, and a respected Qal must not appear unkempt.</i>");
		output("\n\nYou trip over her legs as she nudges you towards her; she wraps her body loosely around you, keeping you close to her and providing you some privacy to the rest of the lair");
		if (flags["FROSTWYRM_KIP_COUNT"] == undefined) output(", should there have been other, prying eyes to watch");
		else output(", although you’re certain that’s hardly going to stop your daughter");
		if (flags["FROSTWYRM_KIP_COUNT"] >= 2) output("s");
		output(". Your back is against [frostwyrm.name]’s belly; your left and right are enclosed by her large legs; and her massive snout and neck are directly in front of you. You’re enclosed on all sides by [frostwyrm.name]’s body, left totally at her mercy.");
	}
	else{
		output("Your eyes trail all along [frostwyrm.name]’s body as you consider what ‘activity’ you two would like to do. Your mind trails to her long, flat tongue and the dexterity she’s proven she has with it; the way it can coil around your body and reach all those naughty, secret places at your back and between your legs. How it can cover you head-to-toe in a single swipe, getting you nice, clean, and moist....");
		output("\n\n<i>My kind do not typically derive such pleasure from a simple bath, [pc.name],</i> [frostwyrm.name] says, her lungs heaving in a crude mimicry of laughter. <i>Though I understand that ‘bathing’ is an... alternative experience to your kind.</i> You ask her if she wouldn’t mind giving you one. <i>As your Qim, I would be privileged in making certain your needs are met.</i>");
		output("\n\n[frostwyrm.name] curls her body around yours loosely; you rest against her large draconian belly, a pair of thick limbs on both your sides while her massive snout curls around, pointed straight at your body. You’re surrounded on all sides by [frostwyrm.name]’s imposing form, providing you with some privacy from the rest of the lair");
		if (flags["FROSTWYRM_KIP_COUNT"] == undefined) output(", although there isn’t much you need privacy from");
		else output(", although you know for a fact that your daughters are going to be treated to a show regardless.");
	}
	output("\n\n[frostwyrm.name] doesn’t start with any foreplay and she doesn’t hesitate; she presses her long, lizard-like snout against your [pc.chest], and her enormous, pink tongue slithers from her maw and starts rubbing against your bare [pc.skinFurScales]. Her breath washes over you hotly, warming your body, and her flat tongue heats every place she touches all the more, until it’s actually quite toasty, surrounded as you are by her and her body.");
	output("\n\nThe texture of her tongue against you isn’t at all what you expected: it’s smooth, almost glassy, and it isn’t irritating to the skin whenever she makes a broad, body-length swipe against you. Her tongue rubs against the front of your whole body in steady swipes: her tip starts at your [pc.crotch] and the flat of her tongue presses into your [pc.belly], and she slowly draws it up, until her tip is in your bellybutton and that flat of it bathes against your [pc.chest]. Then she leans in, extends her tongue, and starts again.");
	if (pc.isLactating())
	{
		output("\n\nEvery time she presses her tongue against your [pc.chest], the pressure around your nipples causes your [pc.milk] to gush out in long, thin streams, coating her tastebuds in your milky ardor. You can tell she’s at least aware of the taste, from the way she purposely presses against your boobs with every pass, and through your psionic connection, she’s aware of how pleasurable it is to release the pressure you’ve been building up lately.");
		output("\n\nShe probes your mind, searching for an explanation for the liquid gushing from your chest. <i>You use this liquid to nurse your young?</i> she asks curiously. You barely have the cognizance to confirm. <i>Our biologies are quite different, [pc.name]. My kind exude no such liquid from our bodies.</i> Her tongue pulls in and licks at her lips, spreading your flavor along her tongue. <i>Yet, perhaps our kips would enjoy the taste as I do.</i>");
	}	
	output("\n\nShe doesn’t stop there: whenever she dips her tongue down to your [pc.legs], she’s careful to press the rear of her tongue against your face, lathering your cheeks with her saliva and getting it nice and clean as well. She’s dutiful and assiduous in her work, bathing you as she would one of her own kind; she’s casual in her every stroke, yet attentive, treating it as an everyday task, almost like a chore that simply needs doing.");
	output("\n\nYour bodily reaction is quite different, however: the gentle rocking motion, and the smooth texture against your [pc.skinFurScales], and the moist heat against your entire body – not to mention the fact that [frostwyrm.name]’s massive tongue is grinding continuously against your junk – causes your arousal to skyrocket in no time flat: ");
	if (pc.hasCock()) output(" your [pc.cock] is hard as diamonds against her tongue, and every time she gives you another swipe, your dick gets lodged snugly between your body and her tongue, riding against her every tastebud as she goes");
	if (pc.isHerm()) output(". Absentmindedly, she’s also reaching even further than that: ");
	if (pc.hasVagina()) output(" her tongue swipes broadly against your [pc.vagina], stimulating every millimeter of your labia and electrifying your [pc.clit] with her every pass. It’s difficult to tell how much lubricant is her own saliva or your gushing feminine juices, and the texture of her tongue is like jilling yourself with a soft sheet of warm, wet silk");
	output(".");
	if (flags["FROSTWYRM_GAVE_BATH"] == undefined){
		output("\n\nYou rock your [pc.hips] into [frostwyrm.name]’s tongue with her every pass, eking out as much pleasure as you can with each pass. <i>Your kind and your culture are an enigma to me,</i> she says to you, her tongue never stopping its work on you. <i>It is but a bath, [pc.name]. How you derive such pleasure from it is beyond my understanding.</i>");
		output("\n\nIt’s difficult to form a reply: your mind is too busy focusing on the intense pleasure of having her hot, wriggling tongue press itself against every facet of your body to form coherent thoughts. <i>Do not concern yourself,</i> [frostwyrm.name] tells you, sensing your effort to explain yourself. <i>What I must understand is that you find it pleasurable. A Qim would do anything for their Qal.</i>");
	}
	else{
		output("\n\n[frostwyrm.name] huffs through her nostrils as she continues to work you over, knowing what sort of effect her ‘bath’ is having on you. Your [pc.hips] thrust up against her tongue, fucking the long, hot, wriggling pink muscle as it covers you and submerges every facet of your body in her saliva, cleaning you thoroughly.");
		output("\n\n<i>I have been thinking,</i> [frostwyrm.name] says. <i>Perhaps it is my kind that is poorer for not appreciating hygiene the way your kind do. There is no harm in obtaining pleasure from your mate, even from an act as innocuous as a bath.</i> She gives you a long, exaggerated lick across your entire body. <i>Your kind are certainly creative with sharing pleasure.</i>");
	}
	output("\n\nShe withdraws her tongue suddenly and nudges you with her snout, wordlessly directing you to flip over. You do so, exposing your backside to her, and she resumes, again starting at your [pc.legs], her thick tongue worming against your crotch, and making a long, slow drag up your spine.");
	output("\n\nHer tongue molds itself against your [pc.ass], the spongy flesh worming in between your cheeks");
	if(pc.balls > 0 || pc.hasVagina())
	{
		output(" and hitting everything from your");
		if (pc.balls > 0) output(" [pc.balls]");
		if (pc.balls > 0 && pc.hasVagina()) output(", to your");
		if (pc.hasVagina()) output(" [pc.vagina]");
	}
	output(", to your taint, and finally against the rim of your [pc.asshole]. She is gentle, knowing how tender the flesh can be on you, yet insistent, making sure your nerves all light up in just the right ways. You moan and melt against her belly, and if that weren’t enough, the sensations you’re broadcasting over your psionic link to her would surely tell her everything she needs.");
	output("\n\nHer tongue covers you like a wet blanket every time she draws it up from your pelvis to the back of your neck. You continue to hump against her, ass first now; she lifts your [pc.lowerbody] off the ice just slightly with each new lick, taking exaggerated care to get between your [pc.legs].");
	output("\n\nYou’re getting very close to your climax, and [frostwyrm.name] is aware without you saying a word. Her tongue starts dipping lower and deeper with each new pass: the flat of her tongue lays over your backside");
	if (pc.hasTail()) output(", pressing your [pc.tail] against your spine");
	output(", and her tip plays deviously with your [pc.crotch], stimulating your sex before proceeding, keeping up the charade of this still being a simple bath.");
	output("\n\nYou’re sure you’re clean as a whistle by now (at least by Frostwyrm standards), but this has become more than a bath for both of you. You’re on the very edge of your orgasm; [frostwyrm.name]’s pointed tongue makes one final lick, laying itself across your [pc.ass] and up your back while its tip massages and wriggles against your ");
	if (pc.hasCock()) output("[pc.cock]");
	if (pc.isHerm()) output(" and your ");
	if (pc.hasVagina()) output("[pc.vagina]");
	output(", ready to catch your cum at a moment’s notice.");
	output("\n\nYou feel something in your mind: a sort of release, like a latch on a door, unlocking the endorphins that had been building up in your head ever since she started. By [frostwyrm.name]’s bidding, you are now allowed to orgasm, and you do so eagerly, straight onto [frostwyrm.name]’s smooth, wriggling tastebuds.");
	output("\n\nY");
	if (pc.hasCock()){
		output("our [pc.cock] erupts its heavy load, spurting your cum right onto [frostwyrm.name]’s thirsty tongue. Your [pc.hips] jerk and thrust impiously, unable to contain themselves; with every load, you thrust forward involuntarily, painting the topside of her tongue with your seed");
		if (pc.cumQ() > 300){
			output(". Despite how large her tongue is, she couldn’t possibly catch every drop of your incredible load because of your positioning, and more than a little bit of it drools off the side, dripping off the sides of her appendage");
			output(". She bloats and quivers her tongue against your body, massaging your endowments for your every drop to paint her pink tongue white");
		}
	}
	if (pc.isHerm()) output(".\n\nIn time with your erupting cock, y");
	if (pc.hasVagina()) output("our [pc.vagina] explodes its feminine cum all over the flatter part of [frostwyrm.name]’s tongue. [frostwyrm.name] undulates it, flexing and bloating it, gently massaging it against your vulva and a little rougher against your [pc.clit], milking you for your pleasure as much as she can. Your [pc.femcum] coats her tastebuds, caking her smooth tongue in your flavor, and each time she moves it an inch or more, you shiver and gush out just a little bit extra for her.");
	output("\n\nYou slump, your face resting against the warm, heaving scales of [frostwyrm.name]’s belly as you relax against her. She wiggles her tongue slightly, teasing you and being careful not to over-stimulate you. After a few moments, she slowly begins to withdraw, making you jump and ‘eek!’ in pleasure with every smooth inch she tickles you with on the way out. The tip makes one last ride up the crease of your [pc.ass] before [frostwyrm.name] pulls it into her mouth, with a bit of flourish.");
	output("\n\nShe licks at her snout several times, showing to you that she’s appreciating your taste. <i>Exquisite,</i> she remarks, as though she were tasting a wine.");
	output("\n\nYou roll over, sliding onto your rump in contended exhaustion, panting wearily against [frostwyrm.name]. You’re wet, sticky, hot, satisfied, and, above all, absolutely spotless. But [frostwyrm.name] hasn’t pulled away; her snout is still right in front of yours, blocking you from the rest of the lair. <i>I believe I have neglected an area,</i> she tells you sultrily, her tongue slipping out once more. <i>I cannot, in conscience, leave any need of my Qal’s unattended.</i>");
	output("\n\nYou open your mouth to ask what part of you she could have <i>possibly</i> missed – and her enormous tongue darts forward, its tip spearing between your [pc.lips] and diving into your mouth, wriggling between your teeth and slathering your own in her saliva.");
	output("\n\nYou’re taken by surprise at first, but quickly relax as [frostwyrm.name] swabs your cheeks and your teeth with her tongue. You don’t worry about hurting her with your incisors – hers as far sharper than your own, after all. You lay there listlessly as [frostwyrm.name]’s tongue twists, curls, and thrusts in your mouth, her smooth tastebuds massaging against your [pc.lips] with every single motion. You’re forced to breathe through your nose, and every exhale comes out ragged as she fucks your throat with her tongue.");
	output("\n\nThere’s an unmistakable tang on her tip as she explores your maw: you can taste yourself on her tongue, and the flavor is getting spread across the roof of your mouth and into your cheeks the longer [frostwyrm.name] stays in. And you’re okay with that: your eyes start to close, and you errantly start to suck on her tongue like a great, big, squishy dick, sucking out the moisture of her tongue for yourself. Before long, you’re beginning to show signs of arousal again, and you’re about ready for another bath.");
	output("\n\nAs the thought crosses your mind, [frostwyrm.name], almost reluctantly, withdraws her tongue. You gasp for breath, your chest burning for oxygen – you weren’t aware of how starved for it you were until you suddenly had it again. <i>You are clean, my Qal. If we are not careful, we may need to start again.</i>");
	output("\n\nIn between gasps for air, you tell her that, maybe, you wouldn’t mind having another bath so soon. <i>If that is what you desire, my mate, you need only bid it so.</i>");

	processTime(60);
	pc.shower();
	pc.orgasm();
	IncrementFlag("FROSTWYRM_GAVE_BATH");
	clearMenu();
	addButton(0, "Next", frostwyrmMainMenu, undefined);
}
public function frostwyrmAllowMeToReturnTheFavor():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	if (flags["FROSTWYRM_GOT_BLOWN"] == undefined){
		output("You think back to the time [frostwyrm.name] gave you a ‘bath.’ It was quite the adventure! Not only did you come out clean as could be, but you also had a ton of fun doing it. But, you think slyly to yourself, it hardly seems fair that you got all the fun and [frostwyrm.name] had to do all the work and got nothing in return. What sort of mate would you be if you didn’t... take care of your Qim’s needs?");
		output("\n\nYou reach out to [frostwyrm.name] through your link, and once you’ve gotten her attention, you tell her that you really enjoyed the bath she gave you, and that you would like to return the favor. [frostwyrm.name] cranes her long neck towards you in response, her four red eyes studying your curled, prone form relaxing against her body. She huffs once in confusion; she understood your words, but the emotions you’re giving off – lust, clearly – do not coincide with their meaning.");
		output("\n\n<i>It is kind of you to offer, my Qal,</i> she says, <i>but with a form like yours, cleaning a form like mine... it would take you perhaps until the next Light’s Rise to complete your task. I am capable of cleaning myself.</i>");
		output("\n\nThat... that wasn’t quite what you meant. You laugh well-meaningly, and you rephrase yourself to be more literal: you’d like to blow [frostwyrm.name]. Before she has a chance to respond, you rephrase again: you’d like to use your mouth to pleasure [frostwyrm.name] by taking her penis into it.");
		output("\n\nYou feel her comb your mind momentarily, searching for definitions and examples of what precisely you mean. <i>This is an action that your kind performs on others?</i> she asks incredulously. <i>You cannot breed this way, and you would derive no pleasure from it yourself. What is the purpose of this?</i>");
		output("\n\nSince when did you need a reason to want to pleasure your mate? For many, including yourself, the knowledge that you’ve pleasured your other is in itself a pleasure. And sometimes, some people simply enjoy taking it in the mouth – in some cases, even moreso than somewhere else more ‘appropriate.’");
		output("\n\n[frostwyrm.name]’s eyes are trained on you, unsure whether to believe your words, but your emotions and intent are clear to her, and, from the corner of your eye, you can see it’s having a physical effect on her as well, from the way her genital slit is quickly engorging with herself. <i>Very well,</i> she says, her rear two legs spreading slightly. <i>I may not understand the traditions of your kind, [pc.name], but I would trust the intent of my Qal.</i>");
	}
	else{
		output("Your eyes roam up and down [frostwyrm.name]’s body, from her lower jaw, across her underbelly, towards her rear legs. You remember the thrill and the excitement of not only receiving a bath from her, but giving her one yourself – even if you only have the reach to clean one part of her. Something about her enormous form really makes the act of oral, giving or receiving, an entirely different experience. One you’re thirsty, in a word, to have again.");
		output("\n\nYou lean against [frostwyrm.name] and tickle your hand down her belly, towards her rear legs. You ask her if she happens to be in the mood. <i>In the mood for what?</i> she asks innocently. You can’t help but laugh, and rephrase the question: would she like her mate to pleasure her?");
		output("\n\nAt the question, her body relaxes, and the reaction you had hoped for begins between her legs: her penile vent begins to bulge, quickly engorging itself with herself. <i>How would you have your Qim, my Qal?</i> she asks you sultrily, her voice low and trilling. You tell her that you wouldn’t mind giving her one of your kind’s ‘baths’ once more.");
		output("\n\nShe heaves a huge, heavy sigh. <i>In some ways, I envy you and your kind,</i> she says, spreading her rear legs pre-emptively to give you better access. <i>What must it be like to take pleasure in such a submissive position? The sensation must be unlike anything possible from traditional mating.</i> The opening of the vent begins to split, and her heavy musk quickly permeates the lair. <i>Take me if you would have me, my Qal.</i>");
	}
	output("\n\nOn all fours, you make your way to her rear legs, towards the bulge of her penile vent. She’s at what would be a half-chub, if even that, and already her size is intimidating, so close to your face. Bloated and dangling off the other end are her enormous testicles; from this angle, they take up the entirety of your vision, cresting the horizon of [frostwyrm.name]’s bestial crotch. Each heavy, dense ball is full to the brim with hot, churning cum, and your mission is to get every last drop on your face and in your mouth. Your [pc.lips] moisten in excitement.");
	output("\n\nYou place your hands gingerly on either side of the vent, your palms massaging gentle circles into [frostwyrm.name]’s scales while your fingers pull and tickle at the open, coaxing out the massive, pink treasure within. Your lick your lips and lean forward, drawing a long, heavy line across the slit, tasting a myriad of flavors and every single one of them reminding you of [frostwyrm.name]. You dip back in, puckering your lips and pressing them against the scales, lewdly smacking them as you make out with the vent of her crotch.");
	output("\n\nYou thrust your [pc.tongue] into the hole; [frostwyrm.name]’s muscles cling to you, soaking your tastebuds in her essence. Your tongue can’t reach very deep: it bumps against the thick, spongy flesh of [frostwyrm.name]’s engorging cock, and with every heavy heartbeat of hers, it bloats and extends against you, pushing you out of the way. It isn’t long until your kissing lips are themselves pushed back; the stretchy scales of her crotch that you were kissing are replaced with the glans of her dick.");
	output("\n\nWanting to inspect your work, you lean back, getting an eyeful of the dick you’re pleasuring. It isn’t very big, not yet: its circumference is about the size of the rim of a mug, and it’s only getting longer and fatter. A bead of watery, clear precum forms at the tip; before your very eyes, the tool bloats visibly and extends just a little farther upward as the seconds tick by. It’s like you’re watching a tree grow at hundreds of times the normal speed – a tree you’re about to eagerly fellate.");
	output("\n\nNo time to waste: you get back to work, kissing at various parts of [frostwyrm.name]’s penis, your tongue slithering out to cover swaths of skin your [pc.lips] can’t. She’s already too big for you to fit into your mouth, but that only encourages you more, really: you just want to watch her grow and grow. Your hands move towards the root of her penis, pulling at her tool and marveling at how quickly your hands are being pulled away from the scales of her body.");
	output("\n\nThe tang of her musk fills your mouth and your nose; your head is swimming in [frostwyrm.name]’s scent and taste, and it blanks your mind of most thoughts except for the ones focused on getting more. You grip the fat cock, already much bigger than even the most well-endowed of your species, just beneath its flat head, and you rub it over your face, your chin, and your forehead, marking yourself with [frostwyrm.name]’s scent before continuing with your work.");
	if (flags["FROSTWYRM_GOT_BLOWN"] == undefined){
		output("\n\n[frostwyrm.name] churrs in pleasure at your ministrations; you can feel her large belly quiver and tense as your adventurous hands and willing lips find a new spot to pleasure. <i>I,</i> she begins, having difficulty putting words to thoughts in her pleasure. <i>I had no idea pleasure like this could exist. This is an activity that your kind do regularly?</i>");
		output("\n\nYou pull away just long enough to tell her that it is. Some people prefer it this way. <i>I am beginning to understand why.</i> She heaves another long sigh, and as she does, it’s almost as if her cock inflates in time with her breathing. <i>I am unsure yet if I prefer this over the natural method. And this method will surely not result in kips. But the pleasure it is giving me is... nearly surreal.</i>");
	}
	else{
		output("\n\nThe sound of [frostwyrm.name]’s purring is music to your ears as you work her over. Like before, every time your tongue or your hands find a new spot for you to pleasure, her belly quivers in delight. <i>I am curious, [pc.name],</i> she begins out-of-turn. Her words are unsteady as she tries her best to maintain her composure. <i>Have you learned who among your kind was the first to discover this pleasure? How did they come to discover it?</i>");
		output("\n\nYou pull away just long enough to answer her questions. You don’t know who, in the long history of " + plural(pc.race()) + ", was the first to realize that using your mouth to pleasure someone was a good idea, but you tell her that your kind is a very sexual species: if there’s any way to bring pleasure between two mates, you guarantee someone has thought of it.");
		output("\n\nShe hums in thought at your words. <i>Your kind is very... self-educated. I cannot say that I am not envious; I could never have imagined–</i> She stutters as you touch a sensitive nerve cluster just beneath the rim of her glans, and you attack it with your tongue viciously, loving every little squirm and exhalation [frostwyrm.name] makes. She doesn’t attempt to finish her sentence.");
	}
	output("\n\nHer cock has swelled large enough that its girth is as wide as your head: you stare into the spit-shined head of her cock, its width reaching from one ear to the other");
	if (pc.hasVagina()) output(". You aren’t certain how you could have ever fit this behemoth inside of you, but you managed, and you’d do it again, too");
	output(". Your hands couldn’t hope to touch around the body of her spire. And it’s <i>still</i> getting bigger, although not by much anymore.");
	if (pc.biggestTitSize() >= 6){
		output("\n\nPerhaps, if your hands are no longer enough for her, she’d prefer something... softer. You lean back and remove your hands from her dick, putting them against your [pc.chest]; you pull your tits apart, give one of them a lick, and lean forward, wrapping them around [frostwyrm.name]’s dick, just beneath the head.");
		output("\n\n[frostwyrm.name]’s breath comes out in stutters as you fuck your tits against her. The feeling is almost supernatural: it’s such a huge, powerful cock that’s in between your tits, and its warmth is spreading through the fat of your [pc.chest] and into your lungs. Every time you lean forward, its fat, circular head rams you in the chin, and you can’t help but stop for a moment and plant a long, tongue-filled kiss against the sensitive skin, before you lean back and let it recede into the valley of your cleavage before starting again.");
		if(pc.isLactating()) output(" Every time you squeeze at your boobs to regrip her shaft, a little bit more [pc.milk] squirts out and onto her shaft, lubing it a little bit more, making the job a little smoother and slipperier.");
		output("\n\n[frostwyrm.name] cranes her long neck towards you, to see what it is you have done that has caused such a change in sensation. <i>Is this the purpose of the flesh on your chest?</i> she asks you. You laugh and say no – but it feels good anyway, isn’t it? <i>By the Grand Qim, it does!");
		if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output(" I was concerned for their utility on our kips, but now I am all the more covetous!");
		output("</i>");
	}
	else{
		output("\n\nThat gives you an idea: if your hands aren’t enough for the job anymore, you’ll just have to upgrade to your arms. You shuffle forward on your knees, approaching the titanic cock, and you wrap both your arms around it; you hug it closely to your body, resting your cheek against its head and letting its warmth spread throughout your body. Her every heartbeat shakes your entire body, and you feel it all the way down to your [pc.feet].");
		output("\n\nThat gives you an idea: if your hands aren’t enough for the job anymore, you’ll just have to upgrade to your arms. You shuffle forward on your [pc.knees], approaching the titanic cock, and you wrap both your arms around it; you hug it closely to your body, resting your cheek against its head and letting its warmth spread throughout your body. Her every heartbeat shakes your entire body, and you feel it all the way down to your [pc.feet].");
		output("\n\n[frostwyrm.name] takes a deep breath as she feels you tightly squeeze against her. You could hardly believe you’re even doing this: if you had told yourself when you first started your quest to earn your father’s inheritance that it would involve you giving a full-body handjob to a three-foot cock belonging to a literal dragon, and that you’d love every second of it, you’d have either said that you were crazy – or you would have asked when and where you’d get started.");
		output("\n\n[frostwyrm.name] purrs in delight, her body moving in time with yours, thrusting forward involuntarily as you draw your body up and relaxing when you reset your position. You snake your tongue out every time you push upward, drawing a new line of spit up the side of her tower, and lapping at the bead of pre that’s waiting for you when you do.");
		output("\n\n<i>Is this a ritual that your kind perform during mating?</i> she asks you. Her voice is unsteady, her mind too focused on colliding sensations. You respond that your kind can perform an act that is similar, but it only involves your hands – your Qim is rather <i>significant</i> and you had to get a little creative to handle her. <i>I have made the correct choice in Qal; only one as inventive as yourself is worthy of–</i> She shudders when you touch a particularly sensitive spot, and she doesn’t attempt to continue.");
	}
	output("\n\nIt isn’t too much longer until [frostwyrm.name] begins to show the universal signs that she’s on the fringe of an earthshattering orgasm. Her breathing is shallow, yet rushed; the pulse that’s reverberating throughout your entire being is increasing in rate and strength; she begins to grunt and snort, almost animalistic; her testicles bounce and audibly gurgle with their enormous load, being coaxed out with each jerk and lick against her dick; and the watery pre jets from her thick head, spritzing over your head onto the ice below.");
	output("\n\nYou welcome it. You <i>encourage</i> it. You lean back, ");
	if (pc.biggestTitSize() >= 6) output("wrapping your [pc.chest] to just beneath the rim of her cockhead");
	else output("locking your arms around the shaft of her cock, about a quarter way down from her cockhead");
	output(", and you press your [pc.lips] against her urethra. You want every last drop to land in your mouth until you’re positively gravid and you’re blowing cum bubbles for the rest of the day, and when you inevitably lose control, you want the rest to cake your body in a thick layer of her draconic spooge.");
	output("\n\n[frostwyrm.name] hears your every subconscious desire, and, apparently encouraged, stretches her body and awkwardly thrusts her hips into your body, slamming her head against your face. Her massive balls bunch up against her body, and you feel her load travel up her dick, making it even thicker all around as your liquid prize quickly makes its way to you. Her urethra bloats, and you remember to keep your [pc.lips] open and against it.");
	output("\n\nYou... underestimated just how much [frostwyrm.name] could produce, and how intensely it’d be spraying from her. Her first load immediately overfills your mouth; your cheeks balloon obscenely with her white cream and your tongue writhes in the pool of semen now in your mouth. You struggle to swallow it down and you pull away before any more threatens to drown you. But, as soon as you do and you take a breath of air, you’re right back on her, thirsty for another mouthful.");
	output("\n\nThe process repeats several times, of you taking a shot in the mouth, pulling away, swallowing, and returning. Each time you pull back, her cum sprays into the air and cascades back onto you, showering her from scalp to sole in her load. Her cum drips down your arms and onto your fingers, and travels in rivulets down your [pc.thighs]");
	if(pc.hasHair()) output("; it tangles into your hair, moisturizing it");
	output(". It slides down your back and pools in the crease of your [pc.ass], sliding along your [pc.asshole] and towards your ");
	if (pc.hasVagina()) output("[pc.vagina], where it desperately winks and flexes, trying to suck every drop it finds into itself");
	else if (!pc.hasVagina() && pc.balls > 0) output("[pc.balls], shining your sack before dripping to the ice below");
	else output("taint, where it pools and collects for a moment until it falls in drops to the ice below");
	output(".");
	output("\n\nIt’s all so much for your lust-addled mind to take in. The thick mouthfuls of cum; the shower; and the feedback loop from [frostwyrm.name]’s psionics overwhelming your mind all culminate into your own thunderstorm of an orgasm. Y");
	if (pc.hasCock())
	{
		output("our [pc.cock] twitches and erupts, completely hands-free, adding your own juices to the torrent that is [frostwyrm.name]’s load. It mixes and mingles, adding your own musk to the perfume");
		if (pc.cumQ() < 1000) output(", although your entire load could hardly equal one-tenth of a single pulse of the output [frostwyrm.name]’s fire-hydrant of a cock is deluging you in");
		else output("; despite [frostwyrm.name]’s copious load, you’re managing to match her shot-for-shot, until you’re both an absolute mess from each other’s cum");
	}
	if (pc.isHerm()) output(".\n\nNot to be outdone, y");
	if (pc.hasVagina()) output("our [pc.vagina] clenches at nothing, milking a phantom cock for all the semen it wishes was going into it instead of your mouth. Every time a strand of cum graces the lips of your cunt, it burns in pleasure, and you have another, smaller orgasm on the spot. You alternate between jerking [frostwyrm.name] for more of her gift to grace you, and using one hand to frantically jill yourself, spooning up whatever cum you can in one swing and cramming it into your box.");
	output("\n\nLost in the frenzy of [frostwyrm.name]’s erupting volcano of a dick, you quickly lose track of time, and the only two things that finally snap you out of your reverie is the aching fullness of your [pc.belly], and the way [frostwyrm.name]’s load gets smaller and smaller with each pulse, until her last few loads are barely enough to fill your mouth – while miniscule in comparison, it’s still an impressive load compared to someone of your own race.");
	output("\n\n[frostwyrm.name]’s dick begins to lose its rigidity, and you collapse backward, making a loud splash in the lake of draconic cum. You pant for breath while you rub at your full, rotund belly; your eyes are unfocused and dizzy, unable to lock onto any single thing in the lair, even when [frostwyrm.name] begins to shuffle. Before you have the cognizance, you’re face-to-face with her enormous, elongated face.");
	output("\n\nShe stares at you for a moment. A number of whispers fill your head before evaporating all at once – she’s trying to put words to her thoughts, but she’s failing every time. <i>It is nothing short of a miracle that your kind have propagated at all, my Qal,</i> she says sheepishly. <i>It is difficult to believe any two mates would often choose to breed when pleasures like that exist.</i>");
	output("\n\nYou take that as a compliment. You bring a hand up to your [pc.hair], your arm making thick ripples through the veritable sludge of cum, rubbing at your scalp and inadvertently soaking more cum into your [pc.skinFurScales]. You’re positively covered, head to [pc.feet], front to back, inside and out, in Frostwyrm cum. <i>It appears as though you are in need of another bath, my Qal,</i> [frostwyrm.name] notes, her tone devious and suggestive, and another, fresh wave of lust pouring from her and into you through her psionics.");
	output("\n\nYou sigh, the distinctive taste of [frostwyrm.name] on your breath. Perhaps you are.");
	
	
	pc.orgasm();
	pc.applyCumSoaked();
	pc.loadInMouth(frostwyrm);
	processTime(60);
	IncrementFlag("FROSTWYRM_GOT_BLOWN");
	clearMenu();
	addButton(0, "Next", frostwyrmMainMenu, undefined);
}
public function frostwyrmLickTheMagicDragon():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");

	if (flags["FROSTWYRM_EATEN_OUT"] == undefined){
		output("Once more, you think back to when [frostwyrm.name] gave you your bath, and how... thorough she was, reaching to all of your difficult nooks and crannies, and ensuring that no part of you was unclean before the end. Even if it meant you got a little dirtier again halfway through. Before you had met her, you’d have found the idea of being so close to such a large, deadly mouth, with all those teeth, rather uninviting – now, you just wonder if she wouldn’t mind giving you another one, no matter how clean you really are.");
		output("\n\nBut still, that’s not fair of you. Your Qim is going through the effort of giving you such a wonderful bath, and all you want is for her to do all the work, keeping you clean as can be. What sort of mate would you be if you didn’t go through the effort of returning the favor?");
		output("\n\nYour eyes trail down her form, from her neck, to her belly, to her hind legs. Her penile vent sits, half-hidden in the crotch of her rearmost legs, and underneath it, her massive, scaly testicles. They would be easy targets – and, hell, it’s all too tempting to start there – but [frostwyrm.name] would have just as easy a time ‘cleaning’ those on her own. No; she has something <i>else</i> that’s probably in need of some <i>attention.</i>");
		output("\n\nYou disengage from [frostwyrm.name], exposing your [pc.skinFurScales] to the cold air of her lair, and you place your hand on her belly, gently rubbing at her scales. You reach out to [frostwyrm.name] through your link, and you ask her how often she manages to bathe herself.");
		output("\n\n<i>Often enough,</i> she answers, her four ruby-red eyes on you. <i>What do you imply? Am I in need of another?</i>");
		output("\n\nYou ignore the question and walk towards her rear legs, your hand trailing down her massive, soft stomach along the way. You ask her how <i>much</i> of her body she manages to wash: surely, even with her long neck, she can’t reach <i>everywhere.</i>");
		output("\n\n<i>This is true,</i> she answers. You can tell she’s trying to understand what it is you mean to say to her – she’s prodding at your mind, and you’re feeding some rather unmistakable feelings into her, but they aren’t matching the words you’re saying. <i>I cannot wash my backside, nor much of my tail, and I rely on the ocean to cleanse whatever I cannot.</i> Your hand is inches from her penile vent, but she still doesn’t take your action to be sexual in nature. <i>If you mean to offer to wash me, then I would decline; it would take you until the next Light’s Rise, if not longer, with a form as diminutive as yours.</i>");
		output((pc.tallness >= 96 ? "\n\nYou don’t think you’re <i>that</i> short compared to her, but you know she didn’t mean anything by it. " : "\n\n")+"Your wandering hand finds her vent, your palm brushing against the warm, musky opening, and you ask if she washes it regularly. <i>I do,</i> she answers. You continue, your hand traveling down the crease of her massive, draconic testicles, disappearing in their hot cleavage, and you ask if she washes those. <i>I do,</i> she answers again, totally oblivious to what you’re getting at.");
		output("\n\nYou show your way around her flank, towards the underside of her tail. Hidden there, underneath her crunched flanks and squished between her resting balls and her anus, is her feminine treasure: a vagina, with bluish-pink vulva, and capped with a clitoris the size of your fist. Its folds meld together neatly, comfortably at rest with itself.");
		output("\n\nYou trace your hand along one massive lip, as long, from clit to taint, as your torso. [frostwyrm.name] flinches and tenses at your touch, her flank shivering slightly. You ask her if she keeps <i>this</i> clean, too.");
		output("\n\n<i>No. My...,</i> she hesitates – a very rare thing for her. <i>My endowments prevent me from reaching.</i>");
		output("\n\nThat simply won’t do. You tell [frostwyrm.name] to stand and face away from her platform, with her tail raised. You will ensure that your Qim is clean and presentable – it’s only right, as her Qal, that you tend to her every need.");
	}
	else {
		output("You know what? Sometimes, you’re just in the mood to have something in your mouth.");
		output("\n\nYou reach out to [frostwyrm.name] and ask if she remembers when you had offered to clean that one spot of hers that she <i>couldn’t</i> reach. You doubt she could forget – everyone remembers their first time, and Frostwyrms have a good memory.");
		output("\n\n<i>I do,</i> she answers. <i>What of it, my Qal?</i>");
		output("\n\nYou’re <i>positive</i> she knows what you’re going to say next, and she’s trying to string you along. You didn’t teach her that – she’s trying to play coy all on her own. You ask her if she liked it.");
		output("\n\n<i>I did,</i> she answers, her four ruby-red eyes on you. <i>I had never felt... cleaner.</i>");
		output("\n\nYou ask if she’d like you to do it again. She must be in need of another one by now.");
		output("\n\n[frostwyrm.name] hesitates on her answer. <i>Would you like to give me one?</i> she asks instead.");
		output("\n\nIt seems to you like you’re both on the same page! You disengage from [frostwyrm.name] and tell her to assume the position. She has a great, big, draconic pussy that’s in desperate need of some washing!");
	}
	output("\n\n[frostwyrm.name] does as you say: she gets to her six feet and carefully (so she doesn’t step on you) makes her way off it, facing the far wall of the lair. Then, with a flex of her back, her long, heavy tail rises and arcs over her back, her balled tip touching down just between her wings. [frostwyrm.name] is taller than you, but with your raised elevation, "+(pc.tallness >= 84 ? "you’d just need to get on your [pc.knees], and you’d be" : "you’re already")+" eye-level with [frostwyrm.name]’s massive pussy. All you have to do is close the distance....");
	output("\n\n[frostwyrm.name]’s enormous, draconic ass totally encapsulates your view of everything, and then some: if you were to spread your arms wide and dive right in, you wouldn’t reach halfway across either thick flank. You haven’t even started, and her feminine musk is already overpowering: at that moment, the thick, wafting smell of a fertile woman in need of some desperate lip-service rewrites your brain, and all you care about is tasting her.");
	output("\n\nSo you do: you close your eyes and you close the gap, pressing your face directly in between the monumental folds of her cunt. They part easily for you, sinking you into her body with a moistening ‘squelch;’ what oxygen is available inside her tunnel is from the gap between your neck and her pussy, and the smallest of breaths through your mouth are flavored with ripe Frostwyrm pussy, and, through your nose, the tang of a woman in need.");
	output("\n\n[frostwyrm.name]’s haunches reflexively tense: her body understands that she has something in her pussy, and her instinct is to try and get it deeper into herself. You’re pulled at the neck, her pussy sucking you deeper into herself: your skull dips into her folds, nearly down to your ears, but your hands on her ass press against her, and her muscles are taut enough to give something solid enough to push against.");
	output("\n\nOn the one hand, you doubt that she’d be able to take you in past your shoulders – but on the other, some deviant part of your imagination kind of wants her to try.");
	output("\n\nYou twist your head to the right and extend your [pc.tongue], drawing it up and against the velvety muscles just inside her vulva. You lift your entire head as you lick, drawing it further up; you can feel [frostwyrm.name] clench around you, making it harder to move, and you feel her moisten around your head and neck. Your every movement is punctuated by a wet peeling sound as her pussy splits to accommodate yourself.");
	if (flags["FROSTWYRM_EATEN_OUT"] == undefined){
		output("\n\nAside from the physical sensations, you feel the indescribable prodding of [frostwyrm.name]’s psionics at your head. <i>By the Grand Qim, [pc.name], what is it you are doing to me?</i> she asks.");
		output("\n\nYou respond that you’re bathing her. Was that not obvious?");
		output("\n\n<i>It is obvious that you are doing no such thing!</i> Her two rearmost legs stamp impatiently, reverberating your fleshy prison around you, shifting you against her soft cunt. <i>In no world must a bath be so... thorough! And your lust is unmistakable – this is another of your eclectic means of pleasure!</i>");
		output("\n\nYou hesitate on your response, but not your actions: you twist your entire head around, facing to your left. You know she can feel every little motion and every little tickle of your [pc.skinFurScales] against her, teasing her and pleasuring her in a way she could never have conceived before. You take another long, thick taste of her draconic vent, and – judging from the shake of her body, and the building moisture around your head, and the lust she’s feeding into your psyche through your connection – you <i>then</i> you ask her if she finds it pleasurable.");
		output("\n\n<i>It is</i> obvious <i>that I do,</i> she responds, and, with a buck of her hips, rears into you, shunting you deeper into her. <i>I would bid that you continue. As you said: as my Qal, it is only right that you do.</i>");
		}
	else {
		output("\n\nYou can tell that [frostwyrm.name] is enjoying every moment of you and your ‘bathing’ her: the lust she’s feeding into you through your psionic link is enough to get you ");
		if (pc.hasCock()) output("hard as diamonds");
		if (pc.isHerm()) output(", and ");
		if (pc.hasVagina()) output("wet as the ocean");
		output(". You almost wish you had someone ‘bathing’ you right now.");
		output("\n\n<i>You need only ask, my Qal,</i> [frostwyrm.name] says, picking up on your fantasies. <i>Just as your duty is to tend to the every need of your Qim, so too is the duty of your Qim to tend to every need of yours.</i>");
		output("\n\nAs long as [frostwyrm.name] is poking around in your thoughts, you send her a fantasy of you popping back out of her, <i>stinking</i> from head to chest like a horny Frostwyrm. You’d be in <i>desperate need</i> of a bath.");
		output("\n\n<i>And I would see to it that you receive one. From scalp to sole.</i> She impatiently bucks her hips, rearing them into you, shunting you deeper into her. <i>However... you must not leave your duty half-complete, my Qal.</i>");
	}
	output("\n\nYou shift your hands, running them from her flank to her vulva, clasped tightly around your neck. She’s as sensitive as any human’s, from the way her body shivers around you: you weaponize that information by running the flats of your palms along the lips of her quim, squeezing their spongy wet textures between your fingers. You run your hands up and down either one, alternating them, massaging her vulva like each one was a long, thin, wet cock, knowing that she’s going to feel every single motion.");
	output("\n\nAnd you’re right: [frostwyrm.name] takes a long, deep, growling breath, and her haunches can’t help but shift towards you again, trying to suck your whole skull into her like a she would a cock. Your [pc.ears] are pulled into her, and all you hear are the sounds of her body: the throb of her cunt; the squish of your hands against her pussy; the hammering beat of her excited, horny heart; and the pleasured growl in her throat. When she stamps her feet again, it comes to you as a muted, dull thud.");
	output("\n\nIt’s hot in her, and what bits of your face that aren’t buried in some fold and are exposed to the ‘air’ inside her, are singed with moisture. You don’t dare open your eyes – it’d be like opening them underwater, and that’s never comfortable. Your lungs burn, too: the only source of fresh air in her is some wet creases around your neck, and the few times you dare (or care) to stop eating out your draconic lover, the air you breathe is tinged with the taste and the smell of [frostwyrm.name].");
	output("\n\nStill, it’s all worth it: she was mostly dry when you started, and now she’s so wet, you’re having a hard time keeping yourself steady against her. A push too hard and you’ll pop out, but if you’re not careful, you might just slip deeper into her. Down to the neck is a good stopping point, you think.");
	output("\n\nThis is what your life has led to: you, neck-deep, inside a dragon’s vagina, and you deciding to yourself that going as deep as you are is a good stopping point. You’d laugh at the absurdity of it if your mouth wasn’t full of draconic pussy juice.");
	output("\n\nYou realign your hands: your left dips deep southward, tracing along the rim of her pussy, while your right bends and inches up your [pc.chest], angling upward, towards [frostwyrm.name]’s tunnel. Your left hand finds the full, taut sack of [frostwyrm.name]’s bouncing balls; you give them a grope before heading back up, searching for her pearl. Your right, meanwhile, digs into [frostwyrm.name]’s cooch, where her pussy is clamped around you, and starts to push between the seal.");
	output("\n\nBoth hands find purchase at once: your left finds her budding, pulsating clit, unmistakable even if your vision is totally blocked off. It’s huge, round, soaked, and smooth as could be: with every beat of her heart, you feel it lunge and pulse in your grip. You gently fondle it, rubbing it like a crystal ball, lifting it up and pushing it down; [frostwyrm.name]’s haunches unconsciously follow your movements, "+(silly ? "almost like you’re piloting her with a joystick." : "seeking out more of the intense pleasure you’re giving her."));
	output("\n\nYour right, meanwhile, worms its way into her, splitting her wider apart, but also causing her to clench even more tightly onto you. Your arm spreads the gap around you, giving you some more air to breathe, but, more importantly, you reach far deeper into her than you could with just your face: your fingers prod and poke at every muscle they can as you sink deeper into her, which, in turn, makes her shiver and clench and buck even more, feeling something akin to some real penetration since you started"+(silly ? " – you joke to yourself that this probably isn’t where you left your keys, but it doesn’t hurt to look." :""));
	output("\n\nYou can only imagine what it must truly feel like for her: sure, you can feel her lust and her pleasure, but that doesn’t mean "+(pc.hasVagina() ? "you can feel whatever [frostwyrm.name]’s feeling in your own pussy" : "you have a phantom vagina with a face and an arm in it, with a hand polishing your clit")+". Although you can’t feel every minute sensation, what you know for certain is that [frostwyrm.name] is enjoying every little thing you’re doing – and, if you’re right, she’s getting awfully close.");
	output("\n\n<i>I need not read your thoughts to know that cleanliness was never your intent, my Qal,</i> Frosty says, in a chastising, yet playful tone. Her breathing is coming out in quick, dry pants – although, her lungs are so huge that a single pant for her is bigger than a deep sigh for you. Her flanks are shaking in pleasuring, with every little vibration going straight through to you, jostling you inside her vent. <i>Continue, and I would surmise that both of us would be in urgent need of a second bath.</i>");
	output("\n\nYou tell her not to resist or hold back – her pleasure is your duty, and if that means you keep giving her a thorough, in-depth bath until she doesn’t need them anymore, then, as her Qal, that’s what that means. She’d do the same for you.");
	output("\n\nYou can hear the sharp sound of claws raking against ice, even muffled as they are through her spongy walls. Her muscles, and particularly her vulva, grow tense around you, squeezing around your intrusive skull and your right hand, still aimlessly seeking and raking at nothing inside her canal. <i>Indeed I would,</i> she replies – and you get the sudden gut feeling that you should hold your breath.");
	output("\n\nHer shaking gets more intense, and, with a hearty flex of her haunches, you’re trapped in between the squeezing walls of her pussy. Your skull is pinched on both sides by her wet, spongy vulva, and your arm is pressed in a hot, wet vice, from shoulder to fingertip. And then, in a surprising move, [frostwyrm.name] leans forward, her front side dropping and her rear side lifting, taking you with it: your [pc.legOrLegs] lift straight up off the ground, dangling in the air, forcing you to lean them against her bouncing Frostwyrm balls for some stability.");
	output("\n\nYour upper body is facing downward, going with [frostwyrm.name]’s body; with her orgasming pussy keeping you nice and snug inside her, and with gravity fighting to pull you deeper, it’s fair to say you aren’t going anywhere, forced to ride out the whole thing from start to finish.");
	output("\n\n[frostwyrm.name]’s pussy undulates around you, every muscle working to squeeze and suck whatever juices they can from your trapped body. A hot wash of fluids gush against you from inside her: it covers you from your fingers, to your neck, and then washes down your [pc.chest] and your waist before dripping onto the icy floor beneath you. You try and turn your face downward, to keep any of her pussy juice from getting up your nose.");
	output("\n\nA single, low, emanating growl escapes [frostwyrm.name]’s throat all the while, letting you know just how much she’s enjoying every last second of you inside her body. At this red-hot moment, her body is using you as little more than some kind of sex toy: the rhythmic pulsing of her cunt has you slide in and out of her, a few inches in when she clenches in pleasure, and a few inches out when she relaxes. Like all things about [frostwyrm.name], her orgasm is as big as her body, and it lasts for at least a solid minute – perhaps longer. You don’t have a sense of time when all your senses are inundated with orgasming dragon pussy.");
	output("\n\nIt doesn’t take much for you to finish yourself, despite the lack of tactile sensation: with you being shoulder-deep inside [frostwyrm.name], and with her funnelling her lust and her pleasure into your psyche, the slightest touch of her massive nuts against your crotch is enough to set you off.");
	output("\n\nYour ");
	if (pc.hasCock()) output("[pc.cock] has found its way into the huge crease of her testicles, frotting itself in between her gargantuan nuts like a weird, impromptu, reverse titfuck. All it takes is a buck or two, and your [pc.cum] is soaking down the crease, showering her scaly sack with your seed. You can feel her balls pull and tense against herself, giving you more tension to fuck against – she must be cumming out her cock as well");
	if (pc.isHerm()) output(". But, of course, if it’s that good for her, it’s that good for you: your ");
	if (pc.hasVagina()) output("own [pc.vagina], totally ignored, clenches in time with your Qim’s, helplessly squeezing down on nothing and causing a river of your own to flood down your [pc.thighs]. Despite having nothing inside you (as badly as you want there to be), your orgasm is just as powerful as hers: you know exactly how she’s feeling, and you have the equipment to reciprocate in kind. Her every clench of her pussy on you is matched with a clench of yours on nothing, and although you can’t match her output, your orgasm matches her consistency, clench for clench and drop for drop");
	output(".");
	output("\n\nIt takes [frostwyrm.name] minutes before her body has finally exhausted its orgasm. You hadn’t noticed that your lungs were starting to burn until her haunches lower and, with her pussy no longer greedily slurping your body tightly into her, and with you being slick as could be, you slide out of her with relative ease. You fall back onto the icy platform with a wet thud, and you take your first deep breath of real, clean, unfiltered oxygen for the first time since you dove face-first into [frostwyrm.name]’s muff. With your left hand (the cleaner of the two), you wipe the slime from your eyes and slowly blink them open–");
	output("\n\nAnd staring back at you is [frostwyrm.name], her four ruby-red eyes intently on yours. She huffs at you once through her nostrils, her breath warming your wet body against the ice. Her breath heaves from her chest in her usual crude mimicry of laughter. <i>Thanks to you, my Qal, I have never felt more refreshed.</i> She steps over you, as gingerly as before, and circles her platform before coming down to rest, just as she had before. <i>But it seems you are in need of a wash. It is wrong of me, as your mate, to sully you for my benefit.</i>");
	output("\n\nYour world is still reeling a bit from the whole experience. How often does a person get to say that they were shoulder-deep inside a dragon’s climaxing vagina?");
	output("\n\nWith some gentle nudging and guidance from [frostwyrm.name], you’re brought back to your [pc.feet], and then showed back to your usual sitting spot, up against her warm, soft, purring belly. Despite still dripping from your scalp to your waist in pussy juice, [frostwyrm.name] doesn’t shy away from pressing her snout gently against you, to help direct you back to your usual sitting spot with her.");
	output("\n\n<i>Do not hesitate to ask your Qim for a bath of your own once more,</i> she instructs, lovingly nudging you some more, tucking you in against her. <i>I will understand if you require a moment to recollect yourself, first.</i>");
	output("\n\nThe whole ordeal’s taken quite a bit out of you. A nap, followed by a bath, sounds lovely to you.");
	output("\n\n<i>However,</i> she says in a devious, lustful tone, <i>just as you must not hesitate to bid your Qim for a bath... you must be ready to give your Qim another ‘bath’ at her request.</i>");
	output("\n\nIt hasn’t been a <i>minute,</i> and she’s already fantasizing about a second round!");
	output("\n\nStill... you can’t blame her.");

	pc.orgasm();
	pc.applyPussyDrenched();
	pc.girlCumInMouth(frostwyrm);
	processTime(60);
	IncrementFlag("FROSTWYRM_EATEN_OUT");
	clearMenu();
	addButton(0, "Next", frostwyrmMainMenu, undefined);
}
public function frostwyrmGoodGodImHurt(vIdx:int = -1):void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("You hear the pleasured, satisfying purring of your mate from her body; the rumbling in her throat reverberates off the walls and plays you a symphony of just how well you’ve done your job as her mate.");
	if (pc.hasCock() && !pc.hasVagina()) output("\n\n[frostwyrm.name] turns about, approaching the elevated ice shelf you’re standing on, and hoists herself onto it.");
	else output("\n\n[frostwyrm.name] steps away from you, then gently nudges you towards the elevated ice shelf that is her resting place. When you groggily hoist yourself onto it (with [frostwyrm.name]’s help), she joins you, gently stepping around you.");
	output(" <i>I had reservations that, as you are not of my kind, you would not meet my requirements in a mate. I am wrong in few areas, [pc.name], and I was wrong in this one,</i> she says to you, nudging at your [pc.chest] lovingly. The warmth from the orgasm that permeated your body is still there, but changes to something else: something that makes your heart race and your muscles relax");
	if(pc.hasGenitals())
	{
		output(", but does not make");
		if (pc.hasCock()) output(" your [pc.cock] rise");
		if (pc.isHerm()) output(" or");
		if (pc.hasVagina()) output(" your [pc.vagina] wet");
	}
	output(". It’s something more wholesome; something that... reminds you of home.");
	output("\n\n<i>It is time for the final ritual of our coupling,</i> she says as she circles your body, wrapping her elongated, serpentine form around you. When she settles and lays down, she wraps her six legs around you and presses you gently against her belly, sharing her warmth with you. <i>We may rest.</i>");
	output("\n\nYou reach out and grab one of her legs, pulling it closer to you as you nestle against [frostwyrm.name]’s belly, feeling her enormous heart beat around you and her rhythmic breathing soothe you.");
	output("\n\nThe hours of mating with [frostwyrm.name] catch up to you, and you quickly drift to sleep.");
	
	processTime(5);
	clearMenu();
	addButton(0, "Next", frostwyrmShouldIStayOrShouldIGo, vIdx);
}
public function frostwyrmAftercare(vIdx:int = -1):void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	var pcPreg:Boolean = (vIdx >= 0 && pc.pregnancyData[vIdx].pregnancyType == "FrostwyrmPregnancy");
	var fwPreg:Boolean = (frostwyrm.isPregnant());
	
	if(!pcPreg && !fwPreg)
	{
		output("<b>ERROR:</b> No pregnancies detected!");
		clearMenu();
		addButton(0, "Next", frostwyrmSayonara);
	}
	
	var nEggs:int = 0;
	for(var i:int = 0; i < pc.pregnancyData.length; i++)
	{
		if(pc.pregnancyData[i].pregnancyType == "FrostwyrmPregnancy") nEggs += pc.pregnancyData[i].pregnancyQuantity;
	}
	if(fwPreg) nEggs += 2;
	
	output("When you awake, you’re greeted with the familiar surroundings of your gigantic mate clutching you gently against her");
	if (flags["FROSTWYRM_KIP_COUNT"] == 1) output(" and your beautiful daughter wrapping her body against you");
	else output(" and your beautiful daughters wrapping their bodies against you");
	output(". You’re snug and warm and sore in all the right places. You’re a bit thirsty, though.");
	output("\n\n<i>You stir once more,</i> you hear [frostwyrm.name]’s voice project into your mind");
	if (flags["FROSTWYRM_KIP_COUNT"] == 1) output(". Your daughter coos along with her, snuggling in tighter against you and whispering sweet little nothings to you as she wakes up");
	else output(". Your daughters coo along with her, snuggling in tighter against you and whispering sweet little nothings to you as they wake up");
	output(". You smile and wish her a good morning. <i>To you as well, my Qal,</i> she responds. She twists her neck towards you and gives you a long, languid, affectionate lick across your head");
	if (flags["FROSTWYRM_KIP_COUNT"] == 1) output("; your daughter responds in kind, wishing you a good morning and a happy day, licking your body as she does.");
	else output("; your daughters respond in kind, wishing you a good morning and a happy day, each of them licking your body as they do.");
	if (pcPreg)
	{
		output("\n\n<i>I understand your kind cannot sense it,</i> she says, <i>but our coupling has taken. You will lay in short order once again.</i>");
		if (flags["FROSTWYRM_KIP_COUNT"] == 1) output("Your daughter explodes in a flurry of hugs and loud, excited chirps at the news. She is going to have another sister!");
		else output("Your daughters explode in a flurry of hugs and loud, excited chirps at the news. They are going to have another sister!");
	}
	if (fwPreg)
	{
		output("\n\n<i>I understand your kind cannot sense it,</i> she says, <i>but our coupling has taken. I will lay in short order once again.</i>");
		if (flags["FROSTWYRM_KIP_COUNT"] == 1) output("Your daughter explodes in a flurry of hugs and loud, excited chirps at the news. She is going to have another sister!");
		else output("Your daughters explode in a flurry of hugs and loud, excited chirps at the news. They are going to have another sister!");	
	}
	output("\n\n<i>As always, my mate,</i> [frostwyrm.name] says soothingly, nuzzling you with her massive snout, <i>you are welcome to reside with your Qim until the kip is ready.</i>");
	
	processTime(9 * 60);
	
	var variant:int = -1;
	
	clearMenu();
	if(fwPreg)
	{
		if (pc.isHerm())
		{
			variant = 3;
			addButton(0, "Leave", frostwyrmSayonara, undefined, "Leave", "You’ll know exactly when the egg in [frostwyrm.name] pops out of her too, at least.");
			addButton(1, "Wait", frostwyrmIWannaSeeHerGrowUp, nEggs, "Wait", "What better way to ensure a strong familial bond than being with your mate and your kips for every step of the way?");
		}
		else
		{
			variant = 1;
			addButton(0, "Leave", frostwyrmSayonara, undefined, "Leave", "Four months is a lot of time for your species. You’re sure [frostwyrm.name] would understand.");
			addButton(1, "Wait", frostwyrmIWannaSeeHerGrowUp, nEggs, "Wait", "You’re sure [frostwyrm.name] would appreciate her mate being on-hand at all times to help with the laying.");
		}
	}
	else
	{
		variant = 2;
		addButton(0, "Leave", frostwyrmSayonara, undefined, "Leave", "Four months until this thing pops out of you... that’s plenty of time to get to other tasks.");
		if(!pcPreg) addDisabledButton(1, "Wait", "Wait", "There is nothing to wait for...");
		else addButton(1, "Wait", frostwyrmIWannaSeeHerGrowUp, nEggs, "Wait", "In the grand scheme of things, one year of your life to ensure a strong, healthy start to more Frostwyrms seems like nothing.");
	}
	
	flags["FROSTWYRM_HATCH_VARIANT"] = variant;
}
public function frostwyrmShouldIStayOrShouldIGo(vIdx:int = -1):void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	var pcPreg:Boolean = (vIdx >= 0 && pc.pregnancyData[vIdx].pregnancyType == "FrostwyrmPregnancy");
	var fwPreg:Boolean = (frostwyrm.isPregnant());
	
	if(!pcPreg && !fwPreg)
	{
		output("<b>ERROR:</b> No pregnancies detected!");
		clearMenu();
		addButton(0, "Next", frostwyrmSayonara);
	}
	
	var nEggs:int = 0;
	for(var i:int = 0; i < pc.pregnancyData.length; i++)
	{
		if(pc.pregnancyData[i].pregnancyType == "FrostwyrmPregnancy") nEggs += pc.pregnancyData[i].pregnancyQuantity;
	}
	if(fwPreg) nEggs += 2;
	
	output("When you wake up, you’re a bit stiff in the joints and sore and every muscle, but at least you’re warm. You’re still in [frostwyrm.name]’s grasp, still pressed against her belly protectively, her six legs still wrapped around you gently. Her large heart beats very slowly compared to yours, and it happens to sync perfectly with her breathing.");
	output("\n\n<i>You stir,</i> her voice reverberates in your head. You yawn and ask her how long you two have been asleep. <i>I cannot say for certain without the Sky Orb to guide me. I woke shortly before you did.</i>");
	output("\n\nYou lean backward, sinking yourself into the scales of her underbelly. They’re layered and tough, yet flexible enough to gently give when you press. You snuggle yourself into her, searching for more of her body heat in the coolness of her lair – and then you ask what comes next. <i>Our mating concludes when we were done resting,</i> she answers, but that’s not what you meant: ");
	if (pcPreg && fwPreg) output("are you both pregnant?");
	else if (fwPreg) output("is she pregnant?");
	else output("are you pregnant?");
	output(" What should you expect going forward?");
	output("\n\nHer psionic powers comb your mind for a moment, likely trying to learn the definition of ‘pregnant.’ <i>Can you not feel it stir within you?</i> she asks incredulously. <i>Life stirs ");
	if (pcPreg && fwPreg) output("within us both, [pc.name]; as I surmised, we will lay before the next Orb’s Rise.");
	else if (fwPreg) output("within me, [pc.name]; as I surmised, I will lay before the next Orb’s Rise.");
	else output("within you, [pc.name]; as I surmised, you will lay before the next Orb’s Rise.");
	output("The strength of our kip" + (!pc.isHerm() ? " already grows" : "s already grow") + ".</i>");
	output("\n\nYou answer that you can’t tell at all; it must be a Frostwyrm thing, to be able to detect pregnancy so early. What... what does she feel?");
	output("\n\n<i>Should you be referring to the kip");
	if (pcPreg && fwPreg) output("s");
	output(", I cannot explain the emotion ");
	if (pcPreg && fwPreg) output("they feel ");
	else output("she feels ");
	output("adequately enough. It is too soon to put rational words to the sensations: it is a nebulous vacuum of existing and being unaware of it.</i> You feel her body shuffle; her front two legs spread slightly, and she cranes her large neck towards you, drawing a long lick of her massive draconian tongue across your [pc.hair]. <i>Should you be referring to your mate... the most succinct word in your understanding would be ‘content.’ I have coupled, and");
	if (pcPreg && fwPreg) output(" we");
	else if (fwPreg) output(" I");
	else output(" you");
	output(" will lay, and with the most ideal mate I could imagine.</i> She licks you once more, her heavy tongue lingering a bit longer. <i>Thank you.</i>");
	output("\n\n[frostwyrm.name] begins to purr, and you relax against her, letting the vibrations soothe you. You let the moment settle before asking for more information on what you should expect from the pregnancy. <i>There will be approximately two rotations of the Orb between the kip’s conception to when it is laid. Another two will pass before the young kip is strong enough to hatch from its shell; and another two will pass before it is prepared to hunt, mate, and leave the lair. It will be one Sky Cycle until the kip is fully matured.</i>");
	output("\n\nYou ask her if she can translate any of those times to measurements you understand. After she prods at your mind for a moment, she responds: <i>four of what your kind calls a ‘month’ for each of the kip’s growth stage, and one ‘year’ until it is fully mature.</i>");
	output("\n\n<i>There is one matter yet, my mate,</i> [frostwyrm.name] cautions. Your attention is undivided on her. <i>Though our mating has taken, and we shall lay our progeny as I had described, its bearing will not hatch without the knowing watch and attunement of its sires. Both of the kip’s bearers must be present, else they will never hatch.</i>");
	output("\n\nYou ask her how that works. How can the kip tell if the parents are or aren’t there? <i>The ‘skill’ that you refer to as ‘psionics’ are an integral part of a kip’s development, and a strong familial bond is tantamount. A kip bonding with its Qim and Qal whilst in its shell is necessary; else, without the bonds of its sires, it would simply not grow.</i>");
	output("\n\nYou ask if that presents any significant danger to your kids – say, for example, if you needed to leave, and the egg won’t hatch unless you’re there, would they eventually, uh, ‘expire’ in the egg if you took too long? <i>There is a risk of overdue hatching causing our kip’s growth to stunt, though otherwise, there is no risk of it perishing within the shell.</i>");
	output("\n\nOne year until the fruits of your labor pay off, and you and [frostwyrm.name] begin restoring her species to its status off the endangered list – that is, provided you stay here and incubate your egg");
	if(nEggs != 1) output("s");
	output(" with [frostwyrm.name]. Your eyes scan along [frostwyrm.name]’s body, still clutching you gently against her and her purring still as loud as could be.");
	output("\n\nYou could probably just wait the year out here in her lair, if you wanted....");
	
	processTime(9 * 60);
	
	var variant:int = -1;
	
	clearMenu();
	if(fwPreg)
	{
		if (pc.isHerm())
		{
			variant = 3;
			addButton(0, "Leave", frostwyrmSayonara, undefined, "Leave", "You’ll know exactly when the egg in [frostwyrm.name] pops out of her too, at least.");
			addButton(1, "Wait", frostwyrmIWannaSeeHerGrowUp, nEggs, "Wait", "What better way to ensure a strong familial bond than being with your mate and your kips for every step of the way?");
		}
		else
		{
			variant = 1;
			addButton(0, "Leave", frostwyrmSayonara, undefined, "Leave", "Four months is a lot of time for your species. You’re sure [frostwyrm.name] would understand.");
			addButton(1, "Wait", frostwyrmIWannaSeeHerGrowUp, nEggs, "Wait", "You’re sure [frostwyrm.name] would appreciate her mate being on-hand at all times to help with the laying.");
		}
	}
	else
	{
		variant = 2;
		addButton(0, "Leave", frostwyrmSayonara, undefined, "Leave", "Four months until this thing pops out of you... that’s plenty of time to get to other tasks.");
		if(!pcPreg) addDisabledButton(1, "Wait", "Wait", "There is nothing to wait for...");
		else addButton(1, "Wait", frostwyrmIWannaSeeHerGrowUp, nEggs, "Wait", "In the grand scheme of things, one year of your life to ensure a strong, healthy start to more Frostwyrms seems like nothing.");
	}
	
	flags["FROSTWYRM_HATCH_VARIANT"] = variant;
}

public function frostwyrmSayonara(returnLoc:String = ""):void
{
	clearOutput();
	clearMenu();
	
	if(returnLoc == "")
	{
		output("Where would you like to be dropped off at?");
		
		if(flags["PREV_LOCATION"] == undefined) addDisabledButton(0, "Shore", "Previous Location", "Return to the location you were at before arriving to the lair.");
		else addButton(0, "Shore", frostwyrmSayonara, flags["PREV_LOCATION"], "Previous Location", "Return to the location you were at before arriving to the lair.");
		addButton(1, "Irestead", frostwyrmSayonara, "UVI P38", "Irestead", "Return to Irestead.");
		
		return;
	}
	
	frostWyrmHeader();
	author("B");
	
	output("As comfortable as you are, and as much as you’re sure [frostwyrm.name] would rather her mate remain at her side");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 1)
	{
		output(" and your");
		if (flags["FROSTWYRM_KIP_COUNT"] >= 2) output(" daughters have their");
		else output(" daughter has her");
		output(" Qal nearby at all times");
	}
	output(", you have other responsibilities to attend to. You’re afraid you can’t stay here until the new kip is fully mature.");
	output("\n\n");
	if (flags["FROSTWYRM_KIP_COUNT"] == undefined)
	{
		output("<i>I,</i> [frostwyrm.name] says lowly, taken off-guard by your words and at a loss for her own. <i>I am not educated in the necessities of your kind’s needs and cultures, [pc.name]. But I will trust you. You will know when is right to return to your mate.</i> She nudges you gently, her nose against your scalp. <i>Distance will not separate us. Should you need my guidance, focus upon me. I will answer your summons.</i>");
	}
	else
	{
		if (flags["FROSTWYRM_KIP_COUNT"] == 1) output("Your daughter pouts loudly, disappointed at the news, but [frostwyrm.name] hushes her.");
		else output("Your daughters each pout loudly, disappointed at the news, but [frostwyrm.name] hushes them.");
		output(" <i>I understand that you have other necessities in your life as well. Your kind are not as long-lived as mine; you have my blessing to do what you require, when you require it. You will know when to return to your Qim.</i> She nudges gently at your scalp with her nose. <i>Do not forget that distance will not separate us, and if you need of my guidance, I will respond.</i>");
	}
	
	processTime(5);
	
	currentLocation = returnLoc;
	addUvetoCold();
	
	addButton(0,"Next",mainGameMenu,undefined);
}
/*public function pcFrostwyrmPregTime(percentage:Boolean = false):int
{
	// Time in minutes
	if(pc.hasVagina() && pc.hasPregnancyOfType("FrostwyrmPregnancy"))
	{
		var pregTimes:Array = [];
		for (var x:int = 0; x < pc.pregnancyData.length; x++)
		{
			var pData:PregnancyData = pc.pregnancyData[x];
			if(pData.pregnancyType == "FrostwyrmPregnancy" && pData.pregnancyIncubationMulti > 0 && pData.pregnancyIncubation > -1)
			{
				pregTimes.push(pData.pregnancyIncubation);
			}
		}
		if(pregTimes.length > 0)
		{
			var fullTime:Number = (120 * 24 * 60);
			var pregTime:Number = Math.max.apply(null, pregTimes);
			
			if(percentage) return (Math.round(((fullTime - pregTime) / fullTime) * 100) / 100);
			return Math.floor(fullTime - pregTime);
		}
	}
	return -1;
}
*/
public function frostwyrmPregnancyEnds(pregSlot:int, nEggs:int = 0):void
{
	clearOutput();
	showBust("");
	showName("\nBIRTHING!");
	author("B");
	
	var pData:PregnancyData = (pc.pregnancyData[pregSlot] as PregnancyData);
	var x:int = pregSlot;
	if (pregSlot == 3) x == -1;
	var inShip:Boolean = InShipInterior();
	var inPublic:Boolean = (InPublicSpace() || rooms[currentLocation].planet.toLowerCase().indexOf("station") != -1 || rooms[currentLocation].hasFlag(GLOBAL.INDOOR));
	
	output("Just as your thoughts were turning to your rotund and overbearing belly, you feel <i>something</i> in your loins, followed by a rush in your lower stomach. It’s time; the kip’s on its way <i>right now.</i>");
	
	//on ship with auto-medbay (commented until one is available)
	if (inShip && 9999 == 0)
	{
		output("\n\nYou head for the automatic medbay, clutching your trembling stomach. Contractions intensify quickly -- by the time the system finishes its evaluation and moves into action, you’re");
		if (!pc.isNude()) output(" disrobed but");
		output(" no longer able to speak between breaths.");
	}
	//on ship without automatic medbay
	else if (inShip)
	{
		output("\n\nYou reach for the nearest medkit before hurrying to your quarters to set yourself on your bed. You get as comfortable as you can in your hurry,");
		if(!pc.isNude()) output(" struggle to remove your [pc.lowerGarments], then you");
		output(" splay your legs and push.");
	}
	//in public place
	else if(inPublic)
	{
		output("\n\nYou flag down the nearest civilian and tell them the situation, and that you’re in some pretty dire need of medical assistance. You find a safe place to sit down,");
		if (!pc.isNude()) output(" struggle to remove your [pc.lowerGarments], then you");
		output(" splay your legs and push.");
		
	}
	else if(InRoomWithFlag(GLOBAL.OUTDOOR))
	{
		output("\n\nYou’re in a less-than-ideal environment for this to be happening, but you don’t have a lot of time to be complaining. You find a safe place to sit yourself down,");
		if (!pc.isNude()) output(" struggle to remove your [pc.lowerGarments], then you");
		output(" splay your legs and push.");
		
	}
	output("\n\nYou lack a lot of conscious input in the entire procedure; your body knows what it needs to do and you don’t try to hold yourself back just because you’re not in a hospital or a nursery. Although the situation is no less urgent than any other pregnancy, the whole ordeal is otherwise quite smooth and it’s not nearly as painful as you were expecting – mostly because you’re not pushing out a very small Frostwyrm, but because you’re pushing out an egg the size of [pc.aRace] baby.");
	output("\n\nWhen the scenario is over, you aren’t left with a kicking, screaming, breathing bundle of joy, but a very large, sturdy egg. It’s pure white all over, with no distinguishing markings around it. In a way, you’re a bit disappointed – you wanted to know what it looked like, what gender it was, and if it came out healthy. The last concern is answered when you hear the telltale melodic sounds, still in your head: despite being physically separated from you, the kip inside is still psionically bonded with you enough to communicate in its wordless way.");
	output("\n\nYou call for a transit ship to take the egg to Uveto, and program in the coordinates for the shoreline rather than the landing dock. Your thoughts turn to [frostwyrm.name]; you wonder if you should take the egg there yourself, so that you could call for her and have her take the egg from you personally.");
	output("\n\n<i>Distance will not separate us,</i> you hear [frostwyrm.name] say suddenly, startling you. You briefly glance around your surroundings for her, confused. <i>Inform me when to expect our kip, and I will retrieve her upon our shoreline.</i>");
	output("\n\nWhen the transit ship arrives, you load the heavy egg into its crib. It was built for a living creature, but it houses your egg sturdily. When the ship leaves, you reach out to [frostwyrm.name], and inform her that the egg should arrive before the end of the day – or, uh, before Lightfall.");
	output("\n\nWith all of that squared away, you shakily bring yourself to your [pc.feet]. You’re a good amount of weight lighter, but that still knocked all the energy out of you. You should... probably lie down.");
	
	processTime(49);
	
	pc.removeStatusEffect("Frostwyrm Pregnancy Ends");
	
	clearMenu();
	
	addButton(0, "Next", mainGameMenu);
}

public function frostwyrmIWannaSeeHerGrowUp(nEggs:int = 0):void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("You nestle yourself against [frostwyrm.name]’s body, getting warm and comfy against her big body. You tell her that you have nothing major that needs attention within the next year. All you need to do is send a message every now and again to let everyone know you’re not dead, and everything should be smooth.");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined)
	{
		if (flags["FROSTWYRM_KIP_COUNT"] == 1) output("Your daughter coos delightedly; you feel her large arms and deft fingers play and tickle at your body, letting you know how much she appreciates your decision.");
		else output("Your daughters coo delightedly; you feel their large arms and deft fingers play and tickle at your body, letting you know how much they appreciate your decision.")
		output("\n\n<i>I will not feign that I know much about your kind and your culture, [pc.name],</i> she says. She has a noticeable upward lilt in her voice – she’s overjoyed at your decision. <i>But you must not feign that this was not a difficult decision for you. I am grateful you have chosen to be with your mate.</i>");
	}
	output("You get yourself comfortable: it’s going to be a while yet...");
	
	processTime(5);
	clearMenu();
	addButton(0,"4 Months...",frostwyrmDearGodThisIsGonnaBeAWhile,nEggs);
}

public function frostwyrmDearGodThisIsGonnaBeAWhile(nEggs:int = 0):void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("The first four months go by in a flash: you’re [frostwyrm.name]’s extended guest and attentive mate, and she is far more hospitable than you expected a dragon could be. She provided food when you were hungry; she kept you warm at night; and she’s an excellent conversationalist, providing you with entertainment and enlightenment throughout the four months.");
	
	var variant:int = -1;
	
	if (pc.hasPregnancyOfType("FrostwyrmPregnancy") && !frostwyrm.isPregnant())
	{
		output("\n\nThe whole time, your belly was slowly growing more and more gravid; it grew harder to walk with each passing day and the weight on your spine became increasingly unbearable. By the time the fourth month rolled around, you were as large as any nine-month-pregnant woman of your kind.");
		output("\n\nBy the end of month one, you had started to experience mood swings, but they were different from what you had expected from your sexual education classes. You weren’t experiencing joy, or anger, or sadness – not in the traditional sense. What you felt was more primeval, more unfocused. Raw. You had come to understand that they were the emotions your kip was feeling: as it developed inside you, its psionic powers grew, but it was too young yet to understand anything other than pure emotion.");
		output("\n\nHalfway through the third month, you began hearing sounds. They reminded you of baby speech, but since your kip wasn’t talking to you with a mouth or with lungs, the sounds were constant and melodic, transitioning from one sound to another seamlessly, almost like an instrument. Still, they were unnerving at first, and they kept you up at night, so [frostwyrm.name] graciously blocked them from your mind until you asked to hear them again.");
		output("\n\nIn month four, the ‘laying,’ as [frostwyrm.name] constantly referred it, was much easier than you anticipated. The egg inside you had grown to the size of a normal, healthy, [pc.race] child, and the shell’s smooth surface made the whole ordeal go by without complications. You didn’t even feel any pain; [frostwyrm.name] blocked the sensation from your mind as the egg came.");
		output("\n\nWhen all is said and done, you’re in [frostwyrm.name]’s lair, resting against your draconian mate, and now you have a fresh egg to cuddle against.");
		if (flags["FROSTWYRM_KIP_COUNT"] == undefined)
		{
			output("You ask [frostwyrm.name] if you two should think of a name for the kip" + (nEggs == 1 ? "" : "s") + ", but she voices against it; as she told you before, her kind’s traditions don’t include names, only titles. That said, you’ll know to tell each kip apart through your psionic link with each of them.");
		}
		output("The hardest part’s over now, but you don’t have to leave if you don’t want.");
		
		variant = 2;
	}
	else if (pc.hasPregnancyOfType("FrostwyrmPregnancy") && frostwyrm.isPregnant())
	{
		output("\n\nThe whole time, your belly was slowly growing more and more gravid; it grew harder to walk with each passing day and the weight on your spine became increasingly unbearable. By the time the fourth month rolled around, you were as large as any nine-month-pregnant woman of your kind. Meanwhile, [frostwyrm.name]’s outward appearance doesn’t change much during her gestation; her belly grows firmer and her scales grow more resilient, making it less comfy to snuggle against her, but she otherwise does not pack on any noticeable weight and her walking stature does not change.");
		output("\n\nBy the end of month one, you had started to experience mood swings, but they were different from what you had expected from your sexual education classes. You weren’t experiencing joy, or anger, or sadness – not in the traditional sense. What you felt was more primeval, more unfocused. Raw. You had come to understand that they were the emotions your kip was feeling: as it developed inside you, its psionic powers grew, but it was too young yet to understand anything other than pure emotion.");
		output("\n\nHalfway through the third month, you began hearing sounds. They reminded you of baby speech, but since your kip wasn’t talking to you with a mouth or with lungs, the sounds were constant and melodic, transitioning from one sound to another seamlessly, almost like an instrument. Occasionally, the baby-talk would break into stuttered segments; according to [frostwyrm.name], whenever that happened, the kip within you was conversing with the one inside her. Still, they were unnerving at first, and they kept you up at night, so [frostwyrm.name] graciously blocked them from your mind until you asked to hear them again.");
		output("\n\nIn month four, the ‘laying,’ as [frostwyrm.name] constantly referred it, was much easier than you anticipated. The egg inside both of you had grown to the size of a normal, healthy, [pc.race] child, and the shell’s smooth surface made the whole ordeal go by without complications. You didn’t even feel any pain; [frostwyrm.name] blocked the sensation from your mind as the egg came.")
		output("\n\nWhen all is said and done, you’re in [frostwyrm.name]’s lair, resting against your draconian mate, and now you have two fresh eggs to cuddle against. ");
		if (flags["FROSTWYRM_KIP_COUNT"] == undefined)
		{
			output("\n\nYou ask [frostwyrm.name] if you two should think of a name for the kip" + (nEggs == 1 ? "" : "s") + ", but she voices against it; as she told you before, her kind’s traditions don’t include names, only titles. That said, you’ll know to tell each kip apart through your psionic link with each of them.");
		}
		output("\n\nThe hardest part’s over now, but you don’t have to leave if you don’t want.");
		
		variant = 3;
	}
	else if (frostwyrm.isPregnant())
	{
		output("\n\n[frostwyrm.name]’s outward appearance doesn’t change much during her gestation; her belly grows firmer and her scales grow more resilient, making it less comfy to snuggle against her, but she otherwise does not pack on any noticeable weight and her walking stature does not change.");
		output("\n\n[frostwyrm.name] kept you up-to-date on every little change to your kip: when the baby’s psionic powers grew stronger within her womb, she told you about how she felt its emotions, and how its thoughts eventually became melodic sounds that would eventually evolve into the same sort of speech she uses to communicate with you. It was difficult to understand the way she described what the kip was doing, since you didn’t have psionic powers of your own.");
		output("\n\nYou did your part as an attentive and loving mate – which amounted to little more than emotional and sexual support, trapped as you were on the island that housed her lair. Still, by the time the fourth month rolled around, you were there for every little step of [frostwyrm.name] ‘laying,’ as she constantly referred it.");
		output("\n\nThe egg was no larger than an average, healthy [pc.race] newborn baby. Its shell was smooth and sturdy all around; you doubt you’d be able to crack it open even if you wanted to. When all was said and done, you snuggle up against [frostwyrm.name] once more, sharing the space with her freshly-laid egg.");
		if (flags["FROSTWYRM_KIP_COUNT"] == undefined)
		{
			output("\n\nYou ask [frostwyrm.name] if you two should think of a name for the kip" + (nEggs == 1 ? "" : "s") + ", but she voices against it; as she told you before, her kind’s traditions don’t include names, only titles. That said, you’ll know to tell each kip apart through your psionic link with each of them.");
		}
		output("\n\nWhile the most tedious part is over for you both, you don’t have to leave just yet if you don’t want.");
		
		variant = 1;
	}
	flags["FROSTWYRM_HATCH_VARIANT"] = variant;
	
	var totalTime:int = ((frostwyrmIncubationDays() * 24 * 60) + 15);
	
	var baseTime:uint = GetGameTimestamp();
	var ends:uint = baseTime;
	for(var i:int = 0; i < pc.pregnancyData.length ; i++)
	{
		if(pc.pregnancyData[i].pregnancyType != "" && pc.pregnancyData[i].pregnancyType != "EggTrainerFauxPreg")
		{
			var nextDuration:int = PregnancyManager.getRemainingDurationForSlot(pc, i);
			
			if(nextDuration <= totalTime)
			{
				ends = baseTime + nextDuration;
				PregnancyManager.nurseryEndPregnancy(pc, i, ends);
			}
		}
	}
	
	flags["NURSERY_MATERNITY_WAIT_ACTIVE"] = 1;
	processTime(totalTime);
	flags["NURSERY_MATERNITY_WAIT_ACTIVE"] = undefined;
	
	dailyAutoSleep(totalTime);
	
	clearMenu();
	if(flags["FROSTWYRM_EGGS"] == undefined)
	{
		output("\n\n<b>Unfotunately, all that time waiting produced no eggs...</b>");
		addDisabledButton(0, "4 Months...", "Progress 4 Months...", "You cannot do this without eggs!");
	}
	else addButton(0, "4 Months...", frostwyrmHolyCrapYoureStillWaiting);
	addButton(1, "Leave", frostwyrmSayonara, undefined);
}
public function frostwyrmHolyCrapYoureStillWaiting():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	var nEggs:int = (flags["FROSTWYRM_EGGS"] == undefined ? 0 : flags["FROSTWYRM_EGGS"]);
	var variant:int = (flags["FROSTWYRM_HATCH_VARIANT"] == undefined ? -1 : flags["FROSTWYRM_HATCH_VARIANT"]);
	var firstPreg:Boolean = false;
	if (flags["FROSTWYRM_KIP_COUNT"] == undefined || flags["FROSTWYRM_KIP_COUNT"] < 1) firstPreg = true;
	var itsNykke:Boolean = false;
	if (flags["NYKKE_VERSION"] == 1) itsNykke = true;
	
	output("For the most part, the next four months were more of the same: you and [frostwyrm.name] kept each other company within her lair while you patiently waited for your kip" + (nEggs == 1 ? "" : "s") + " to hatch.");
	if (variant == 2 || variant == 3) output(" While you’re glad to finally be done with the extra weight, in some primordial part of your brain, you not only miss the feeling of the pregnancy but you also want to get right back to it. You have a lot of propagating to do for [frostwyrm.name]!")
	output("\n\nBy month five, you notice something rather unusual about the egg" + (nEggs == 1 ? ": it seems" : "s: they seem") + " to be growing. You had to explain to [frostwyrm.name] that every other egg in the universe is hatched when the creature inside it grows too big for it; you’ve never heard of an egg growing <i>with</i> the creature inside it. She assures you that it’s perfectly normal and healthy for her kind, and you’d trust her judgment over your own, so, that’s that.");
	if (variant == 2 || variant == 3) output("\n\nThe sounds you heard from the kip remained, even when the egg was no longer inside you; whenever you asked to hear them, they seemed to get louder and, in a way, articulate: sounds would repeat and the melody would be punctuated by a dip in pitch, similar to how sentences are formed.");
	output("\n\nHalfway through month six");
	if (variant == 2 || variant == 3) output(", you begin to hear odd sounds at all times bellow themselves into your mind; [frostwyrm.name] tells you that it’s your kip, and that it’s finally made a link to its Qal, establishing you as its parent and attempting to communicate with you");
	else output(", you began to understand very basic ‘words’ from the growing kip" + (nEggs == 1 ? "" : "s") + "; one sound would mean ‘Qim,’ and another would mean ‘warm,’ and you’d know the kip would be asking for [frostwyrm.name] to warm it up.");
	if (variant == 1 || variant == 3) output(" Once the kip that grew within [frostwyrm.name] made its psionic connection with you, you were finally included in the conversations between the two siblings.");
	output("\n\nBy the end of month seven, ");
	if (nEggs != 1) output("the kips within were capable of making proper sentences, and by the start of month eight, you were having short conversations together. Their eggs were growing at a rather alarming rate: ")
	else output("the kip within was capable of making proper sentences, and by the start of month eight, you were having short conversations together. The egg was growing at a rather alarming rate: ");
	if (pc.tallness > 84)
	{
		if (nEggs != 1) output("towards the end of month eight, they were about as large as you – and, taking into account the kips within them, they likely weighed significantly more than you do now.");
		else output("towards the end of month eight, it was about as large as you – and, taking into account the kip within them, it likely weighed significantly more than you do now");
	}
	else
	{
		if (nEggs != 1) output("towards the end of month eight, they were already substantially larger and heavier than you");
		else output("towards the end of month eight, it was already substantially larger and heavier than you");
	}
	output(". Thank goodness you didn’t try to give birth to one of these!");
	output("\n\nOne fateful day at the end of month eight, you hear a sharp crackling noise within the lair; you’re startled at first, afraid");
	if (nEggs != 1) output(" one of the eggs had tipped over, but you’re relieved when you realize that it’s finally time! Your kips push their way through the tough interior of the shells, using their powerful wings to puncture it and crack it apart. You and [frostwyrm.name] watch rapturously as your offspring takes their first breath and the solid shells crack to splinters around them.");
	else output(" the egg had tipped over, but you’re relieved when you realize that it’s finally time! Your kip pushes its way through the tough interior of the shell, using its powerful wings to puncture it and crack it apart. You and [frostwyrm.name] watch rapturously as your offspring takes its first breath and the solid shell cracks to splinters around them.");
	output("\n\nYou finally get an answer to the question you had been wondering ever since ");
	
	if (firstPreg)
	{
		if (itsNykke)
		{
			if (nEggs != 1) output("their conception: what would they look like? What you see are seven-foot tall, bipedal dragons; one of them, younger by just a few seconds, has white scales all along its body, with layered, sky-blue, armored scales along its front, from neck to crotch, while its older sibling looks identical... but with pitch-black scales instead. Unlike [frostwyrm.name], they have humanoid faces, with two piercing red eyes. They have massive wings, their bones reaching higher than their head and all the way down to their ankles, and with a wingspan as wide as they are tall. They each have two legs, yet four arms; and, as of yet, they lack any sort of sexual characteristic. Surely those will develop later.");
			else output("its conception: what would it look like? What you see is a seven-foot tall, bipedal dragon; it has pitch-black scales all along its body, taking after [frostwyrm.name], with layered, sky-blue, armored scales along its front, from neck to crotch. Unlike [frostwyrm.name], it has a humanoid face, with two piercing red eyes. It has massive wings, their bones reaching higher than its head and all the way down to its ankles, and with a wingspan as wide as they are tall. It has two legs, yet four arms; and, as of yet, it lacks any sort of sexual characteristic. Surely those will develop later.");
		}
		else
		{
			if (nEggs != 1) output("their conception: what would they look like? What you see are seven-foot tall, bipedal dragons; one of them, younger by just a few seconds, has white scales all along its body, with layered, sky-blue, armored scales along its front, from neck to crotch, while its older sibling looks identical. Unlike [frostwyrm.name], they have humanoid faces, with two piercing red eyes. They have massive wings, their bones reaching higher than their head and all the way down to their ankles, and with a wingspan as wide as they are tall. They each have two legs, yet four arms; and, as of yet, they lack any sort of sexual characteristic. Surely those will develop later.");
			else output("its conception: what would it look like? What you see is a seven-foot tall, bipedal dragon; it has white scales all along its body, taking after [frostwyrm.name], with layered, sky-blue, armored scales along its front, from neck to crotch. Unlike [frostwyrm.name], it has a humanoid face, with two piercing red eyes. It has massive wings, their bones reaching higher than its head and all the way down to its ankles, and with a wingspan as wide as they are tall. It has two legs, yet four arms; and, as of yet, it lacks any sort of sexual characteristic. Surely those will develop later.");
		}
		output("\n\nYou feel something odd project from [frostwyrm.name]’s psyche – what initially feels like confusion and apprehension. But they dissolve in an instant.");
	}
	else
	{
		if (nEggs != 1) output("their conception: what would they look like? What you see are seven-foot tall, bipedal dragons; they have icy-white scales all along their body, taking after [frostwyrm.name], with layered, sky-blue, armored scales along their front, from neck to crotch. Unlike [frostwyrm.name], they have humanoid faces, with two piercing red eyes. They have massive wings, their bones reaching higher than their head and all the way down to their ankles, and with a wingspan as wide as they are tall. They each have two legs, yet four arms; and, as of yet, they lack any sort of sexual characteristic. Surely those will develop later.");
		else output("its conception: what would it look like? What you see is a seven-foot tall, bipedal dragon; it has icy-white scales all along its body, taking after [frostwyrm.name], with layered, sky-blue, armored scales along its front, from neck to crotch. Unlike [frostwyrm.name], it has a humanoid face, with two piercing red eyes. It has massive wings, their bones reaching higher than its head and all the way down to its ankles, and with a wingspan as wide as they are tall. It has two legs, yet four arms; and, as of yet, it lacks any sort of sexual characteristic. Surely those will develop later.");
	}
	if (nEggs != 1) output("\n\nYour kips are exhausted; it took all their strength to break free, and the first thing they want to do is rest. They don’t know how to walk, and when they try, they immediately fall onto their faces. You and [frostwyrm.name] are on them quickly; looks like any other plans you had for the day have been changed.");
	else output("\n\nYour kip is exhausted; it took all its strength to break free, and the first thing it wants to do is rest. It doesn’t know how to walk, and when it tries, it immediately falls onto its face. You and [frostwyrm.name] are on it quickly; looks like any other plans you had for the day have been changed.");
	if (nEggs != 1) output("\n\n[frostwyrm.name] wraps you and your kips into a huddle, sharing her body warmth and allowing them to rest. They clutch and squeeze at various body parts between you both; when one goes for [frostwyrm.name], she introduces herself as their Qim. When one reaches for you, [frostwyrm.name] introduces you as their Qal.");
	else output("\n\n[frostwyrm.name] wraps you and your kip into a huddle, sharing her body warmth and allowing it to rest. It clutches and squeezes at various body parts between you both; when it goes for [frostwyrm.name], she introduces herself as its Qim. When it reaches for you, [frostwyrm.name] introduces you as their Qal.");
	
	if (firstPreg && itsNykke)
	{
		output("\n\nWith the introductions out of the way, you broach the obvious topic hanging in the air between you two: your firstborn kip has black scales, whereas [frostwyrm.name]’s are snow-white. You ask her if this is a common thing, and that its scales will bleach over time.");
		output("\n\n<i>“No,”</i> she answers. You feel a number of conflicting emotions seep through the psionic link between you two – parental love; unconditional affection; and total relief... but, also, hesitation. <i>“I had told you before that our resultant kip would inherit the strongest traits of us both, but... I had never been privy to an abnormality such as this.”</i>");
		output("\n\nShould you two be worried?");
		output("\n\n<i>“Without a form to disappear into the Wet Dust, our kip may have difficulty hunting when it matures. It is without an important element of the hunt to aid it.”</i> While her words are sobering, her parental instincts and emotions do not stop their flood over the link between you. <i>“Our kip is born healthy, my Qal, and, for the moment, that is all I care to know.”</i>");	
	}	
	
	output("\n\nThe most exciting part of rearing your Frostwyrm hybrid children is over with; just another four months until " + (nEggs == 1 ? "its" : "they’re") + " fully mature.");
	//output(" You don’t have to wait around to see it, if you have other things you’d like to do.");
	
	processTime((4 * 4 * 7 * 24 * 60) + rand(1440));
	
	clearMenu();
	addButton(0, "4 Months...", frostwyrmWowThisReallyTakesAWhile, undefined);
	//addButton(1, "Leave", frostwyrmSayonara, undefined);
	
	frostwyrmHatchEggs();
	flags["FROSTWYRM_HATCH_VARIANT"] = undefined;
}
public function frostwyrmWowThisReallyTakesAWhile():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	var nKids:int = (flags["FROSTWYRM_YOUNG"] == undefined ? 1 : flags["FROSTWYRM_YOUNG"]);
	
	output("The final four months of your child-rearing are definitely the most interesting and educational.");
	if (nKids != 1) output(" Your kips have gargantuan and imposing forms, even though they’re so young; they appear as though they should be capable of walking and lifting and hunting right away, but their muscles, while strong enough to carry themselves, are good for only that. They require proper nursing before they’re strong enough and smart enough to fend for themselves.");
	else output(" Your kip has a gargantuan and imposing form, even though it’s so young; it appears as though it should be capable of walking and lifting and hunting right away, but its muscles, while strong enough to carry itself, are good for only that. It requires proper nursing before it’s strong enough and smart enough to fend for itself.");
	output("\n\nLuckily, that doesn’t last long. The ninth month is you, your mate, and your ");
	if (nKids != 1) output("kips bonding with each other and familiarizing yourselves with each other’s forms and titles. They quickly learn that you’re their Qal and to address you as one; likewise, [frostwyrm.name] is their Qim. You, sharing a similar form as your kips, teach them to walk, while [frostwyrm.name] teaches them to fly. You teach them language, and their biology allows them to speak verbally and not purely through psionics, while [frostwyrm.name] teaches them how to hunt and how to use their psionic strength similarly to herself.");
	else output("kip bonding with each other and familiarizing yourselves with each other’s forms and titles. It quickly learns that you’re it’s Qal and to address you as one; likewise, [frostwyrm.name] is it’s Qim. You, sharing a similar form as your kip, teach it to walk, while [frostwyrm.name] teaches it to fly. You teach it language, and its biology allows it to speak verbally and not purely through psionics, while [frostwyrm.name] teaches it how to hunt and how to use its psionic strength similarly to herself.");
	output("\n\nThrough month ten and eleven, your ");
	if (nKids != 1) output("kips spend most of their time with their Qal; [frostwyrm.name] spends much of her time communicating with her offspring, enlightening " + (nKids == 1 ? "it" : "them") + " to the strengths and utilities to the psionic powers unique to their Frostwyrm lineage. Through her, your kip" + (nKids == 1 ? " is" : "s are") + " taught how to act; how to speak; how to address " + (nKids == 1 ? "its" : "their") + " parents; and certain truths of the world. With " + (nKids == 1 ? "its" : "their") + " emotional growth comes a real sense of maturity, and with <i>that,</i> a sense of identity: taking after " + (nKids == 1 ? "its" : "their") + " Qim, " + (nKids == 1 ? "it" : "they") + " almost instinctively choose" + (nKids == 1 ? "s" : "") + " to be referred to by female pronouns.");
	else output("kip spends most of it’s time with it’s Qal; [frostwyrm.name] spends much of her time communicating with her offspring, enlightening it to the strengths and utilities to the psionic powers unique to their Frostwyrm lineage. Through her, your kip is taught how to act; how to speak; how to address its parents; and certain truths of the world. With its emotional growth comes a real sense of maturity, and with <i>that,</i> a sense of identity: taking after its Qim, it almost instinctively chooses to be referred to by female pronouns.");
	output("\n\nYour ");
	if (nKids != 1) output("girls are naturally inquisitive, asking you why you look so different from [frostwyrm.name] and what the differences between you two are. They ask you how you met, which, naturally, was followed-up by asking how you came to be their Qim and Qal, and where they came from.");
	else output("girl is naturally inquisitive, asking you why you look so different from [frostwyrm.name] and what the differences between you two are. She asks you how you met, which, naturally, was followed-up by asking how you came to be its Qim and Qal, and where she came from.");
	output("\n\nYou answer each of ");
	if (nKids != 1) output("their questions dutifully and truthfully, explaining the differences in biology between you and [frostwyrm.name] in the clearest, simplest ways you can. Questions that are answered are beget with more questions, which you encourage.");
	else output("her questions dutifully and truthfully, explaining the differences in biology between you and [frostwyrm.name] in the clearest, simplest ways you can. Questions that are answered are beget with more questions, which you encourage.");
	
	processTime((4 * 4 * 7 * 24 * 60) + rand(1440));
	
	clearMenu();
	addButton(0, "Next", frostwyrmWhatDidYouChoose, nKids);
	
	frostwyrmMatureYoung();
}

public function frostwyrmIncubateEggs():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	var nEggs:int = (flags["FROSTWYRM_EGGS"] == undefined ? 0 : flags["FROSTWYRM_EGGS"]);
	
	output("You spy the egg" + (nEggs == 1 ? "" : "s") + " in the corner of the lair. " + (nEggs == 1 ? "It’s" : "They’re") + " about as large as you last saw them – true to [frostwyrm.name]’s word, without the bond of both their Qim and their Qal, they will never grow or flourish. Frostwyrms and Frostwyrm eggs are hardy enough that the kip inside will never perish, no matter how long you took to bond with it, but still, " + (nEggs == 1 ? "it’ll" : "they’ll") + " never <i>live</i>, either.");
	output("\n\nAccording to [frostwyrm.name], it will take approximately four months for the egg" + (nEggs == 1 ? "" : "s") + " to hatch once " + (nEggs == 1 ? "it bonds" : "they bond") + " with you and her. If you choose to incubate now, <b>you will remain here in the lair for the whole four months.</b>");
	output("\n\nWill you opt to stay and incubate now, or will you save it for later, when you have four months’ worth of free time?");
	
	var variant:int = -1;
	
	clearMenu();
	if(pc.hasPregnancy()) addDisabledButton(0, "4 Months...", "Progress 4 Months...", "You cannot do this while currently pregnant!");
	else addButton(0, "4 Months...", frostwyrmHolyCrapYoureStillWaiting);
	addButton(1, "Never Mind", frostwyrmMainMenu, undefined);
}

public function frostwyrmRaiseHatchlings():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	var nKids:int = (flags["FROSTWYRM_YOUNG"] == undefined ? 0 : flags["FROSTWYRM_YOUNG"]);
	
	output("Are you sure you want to spend the four months with [frostwyrm.name] to raise your hatchling" + (nKids == 1 ? "" : "s") + "?");
	
	clearMenu();
	if(pc.hasPregnancy()) addDisabledButton(0, "4 Months...", "Progress 4 Months...", "You cannot do this while currently pregnant!");
	else addButton(0, "4 Months...", frostwyrmWowThisReallyTakesAWhile, undefined);
	addButton(1, "Never Mind", frostwyrmMainMenu, undefined);
}

// Hatches all incubating eggs.
public function frostwyrmHatchEggs():void
{
	if(flags["FROSTWYRM_EGGS"] == undefined) return;
	if(flags["FROSTWYRM_YOUNG"] == undefined) flags["FROSTWYRM_YOUNG"] = 0;
	flags["FROSTWYRM_YOUNG"] += flags["FROSTWYRM_EGGS"];
	flags["FROSTWYRM_EGGS"] = undefined;
}
// Matures all growing young.
public function frostwyrmMatureYoung():void
{
	if(flags["FROSTWYRM_YOUNG"] == undefined) return;
	if(flags["FROSTWYRM_KIP_COUNT"] == undefined) flags["FROSTWYRM_KIP_COUNT"] = 0;
	flags["FROSTWYRM_KIP_COUNT"] += flags["FROSTWYRM_YOUNG"];
	flags["FROSTWYRM_YOUNG"] = undefined;
	if(flags["NYKKE_BORN"] == undefined) flags["NYKKE_BORN"] = GetGameTimestamp(); //set timestamp for eldest daughter Nykke
}



public function frostwyrmWhatDidYouChoose(nKids:int = 0):void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("As before, the topic eventually comes around to the sexual health, mating habits, and characteristics of your kind and of [frostwyrm.name]’s kind. You’ve rehearsed the topic several times over by now, and you now consider yourself something of an expert on the topic, whether it’s about [pc.race] sexuality or Frostwyrm sexuality. Every question your ");
	if (nKids != 1) output("daughters ask, you reply quickly, simply, and concisely. By the end of the lessons, your daughters repeat everything they’ve been taught back to you, assuring you in their confidence in the subject.");
	else output("daughter ask, you reply quickly, simply, and concisely. By the end of the lessons, your daughter repeats everything she’s been taught back to you, assuring you in her confidence in the subject.");
	
	
	clearMenu();
	addButton(0, "Next", frostwyrmMainMenu, undefined);
}

public function frostwyrmWyrmlingHotfix():void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	clearOutput();
	
	output("How many kips do you remember having?");
	output("\n");
	displayInput();
	output("\n\n\n");
	
	clearMenu();
	addButton(0, "Next", frostwyrmWyrmlingHotfixOK);
}
public function frostwyrmWyrmlingHotfixOK():void
{
	if(isNaN(Number(userInterface.textInput.text))) {
		frostwyrmWyrmlingHotfix();
		output("Choose a quantity that is a positive integer, please.");
		return;
	}
	else if(Number(userInterface.textInput.text) < 1) {
		frostwyrmWyrmlingHotfix();
		output("Choose a quantity that is 1 or more, please.");
		return;
	}
	flags["FROSTWYRM_KIP_COUNT"] = Math.floor(Number(userInterface.textInput.text));
	frostwyrmWyrmlingHotfixGo();
}
public function frostwyrmWyrmlingHotfixGo():void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	
	clearOutput();
	
	output("You now have " + num2Text(flags["FROSTWYRM_KIP_COUNT"]) + " kip" + (flags["FROSTWYRM_KIP_COUNT"] == 1 ? "" : "s") + " residing in [frostwyrm.name]’s lair.");
	
	clearMenu();
	addButton(0, "Next", frostwyrmMainMenu, undefined);
}

public function frostwyrmBunchaKiddoContent():void
{
	clearOutput();
	
	if(flags["FROSTWYRM_KIP_COUNT"] == undefined || flags["FROSTWYRM_KIP_COUNT"] <= 0 || isNaN(flags["FROSTWYRM_KIP_COUNT"]))
	{
		showBust("");
		showName("FROST-\nWYRMLINGS");
		output("You have no fully matured kips to interact with!");
		clearMenu();
		addButton(0, "Next", frostwyrmMainMenu, undefined);
		if(flags["FROSTWYRM_KIP_COUNT"] != undefined && isNaN(flags["FROSTWYRM_KIP_COUNT"]))
		{
			output("\n\nHowever, you are pretty sure you did...");
			addButton(4, "Fix", frostwyrmWyrmlingHotfix, undefined);
		}
		return;
	}
	
	frostWyrmlingHeader();
	
	//permanently disable sex with kips
	if (flags["NYKKE_VERSION"] != 1) flags["FROSTWYRM_INCEST_OPTION"] = 0;
	
	output("You look to your");
	if (flags["FROSTWYRM_KIP_COUNT"] != 1) output(" eldest");
	output(" daughter. She’s curled up against you, her legs entwined around your own [pc.legs] and her arms wrapped around your torso. Her eyes are closed, but you’re aware that she’s wide awake and she’s more than ready and willing to spend some time bonding with her Qal.");
	output("\n\nYou grip onto her shoulder and give her a bit of a nudge. Your intent is clear, especially through your psionic link with your daughter, and she rouses quickly. <i>“Hey, yourself, my Qal,”</i> she says verbally. <i>“What’s up?”</i>");
	
	if (flags["FROSTWYRM_KIP_COUNT"] != 1) output("\n\nYou are speaking to the eldest of your " + num2Text(flags["FROSTWYRM_KIP_COUNT"]) + " Frostwyrm daughters.");
	
	clearMenu();
	addButton(0, "Appearance", frostwyrmlingAppearance, undefined);
	addButton(1, "Talk", frostwyrmlingTalkMenu, undefined);
	if (flags["NYKKE_VERSION"] == 1)
	{
		if (flags["FROSTWYRM_INCEST_OPTION"] != 1) addDisabledButton(2, "Sex", "Sex", "You’ve opted out of participating in ‘inner circle coupling’ with your kips. If you’d like to change your mind, be sure to Talk with your daughter about it.");
		else if (flags["FROSTWYRM_KIP_COUNT"] < 3) addDisabledButton(2, "Sex", "Sex", "If you’re going to be teaching your daughters about proper mating, it’d be better to have more daughters than you do now.");
		else addButton(2, "Sex", frostwyrmlingSexMenu, undefined, "Sex", "Indulge in the common Frostwyrm practice of ‘inner circle coupling.’");
	}

	addButton(14, "Qim", frostwyrmMainMenu, undefined);
}

public function frostwyrmlingAppearance():void
{
	clearOutput();
	frostWyrmlingHeader();
	var itsNykke:Boolean = false;
	if (flags["NYKKE_VERSION"] == 1) itsNykke = true;
	
	output("You get a better look at your eldest Frostwyrmling daughter, cuddling between you and [frostwyrm.name].");
	if (flags["FROSTWYRM_KIP_COUNT"] != 1) output(" You hope this doesn’t make you speciesist, or a bad parent, but you sometimes have difficulty telling your daughters apart, and they all look similar enough to match the same description.");
	output("\n\nYour daughter is <i>extremely</i> tall, standing at about ten feet tall from sole to scalp, not counting her wings. Similar to her Qim, she has six limbs, although they’re shaped quite differently: your daughter walks on two plantigrade feet, and she has four arms, two each sprouting from her left and right shoulders. She has five toes on each foot and five fingers on each hand. Each digit is capped with a razor sharp talon, no less lethal than her Qim’s, although they’re considerably shorter.");
	
	if (itsNykke)
	{
		if (flags["FROSTWYRM_KIP_COUNT"] != 1) output("\n\nEvery one of your kips has covered in white scales that glisten in the reflective light of the icy lair – every one of them, except for your firstborn, which stands apart from the rest by having a body covered in onyx-black scales. Each scale is about the size of a fingernail, and each scale is as hard as metal. Along her front, going from her lower jaw to the inside of her thighs, she has softer, yielding, malleable gray scales, although you doubt many conventional weapons would be able to wound her. She has a pair of pert-and-proud breasts atop her chest, each about the size of an F-cup, capped by a pebbly blue nipple the size of your thumb.");
		else output("\n\nHer body is covered in black scales that glisten in the reflective light of the icy lair; each scale is about the size of a fingernail, and each scale is as hard as metal. Along her front, going from her lower jaw to the inside of her thighs, she has softer, yielding, malleable gray scales, although you doubt many conventional weapons would be able to wound her. She has a pair of pert-and-proud breasts atop her chest, each about the size of an F-cup, capped by a pebbly blue nipple the size of your thumb.");
	}
	else
	{
		if (flags["FROSTWYRM_KIP_COUNT"] != 1) output("\n\nEvery one of your kips has covered in white scales that glisten in the reflective light of the icy lair. Each scale is about the size of a fingernail, and each scale is as hard as metal. Along her front, going from her lower jaw to the inside of her thighs, she has softer, yielding, malleable blue scales, although you doubt many conventional weapons would be able to wound her. She has a pair of pert-and-proud breasts atop her chest, each about the size of an F-cup, capped by a pebbly blue nipple the size of your thumb.");
		else output("\n\nHer body is covered in white scales that glisten in the reflective light of the icy lair; each scale is about the size of a fingernail, and each scale is as hard as metal. Along her front, going from her lower jaw to the inside of her thighs, she has softer, yielding, malleable blue scales, although you doubt many conventional weapons would be able to wound her. She has a pair of pert-and-proud breasts atop her chest, each about the size of an F-cup, capped by a pebbly blue nipple the size of your thumb.");

	}
	output("\n\nShe has a long, thick tail at her coccyx; it’s as thick as her waist at its trunk and it only tapers slightly at the tip, where it’s adorned with blunter spikes, better for bludgeoning than piercing. She has only one set of teeth in her mouth, but like her Qim, they are each sharp enough to rip apart any armor. Your daughter is the perfect hybrid combination of the svelte, flexible, stealthy humanoid form and the power and ferocity of a Frostwyrm; there are few creatures in the universe that would be able to best her in combat, if she gets some appropriate training.");
	output("\n\nFocusing on her gentler features, your");
	if (flags["FROSTWYRM_KIP_COUNT"] != 1) output(" daughters’ eyes have pink sclera, ruby-red irises and jet-black pupils, although your oldest");
	output(" daughter inherited your [baby.eyeColor] eyes, and each time you look into hers, it’s like looking into your own. She has a humanoid face, with gentle, smooth cheeks, more similar to skin rather than scales, and an upturned, button nose and two nostrils.");
	
	if (itsNykke)
	{
		if (flags["FROSTWYRM_KIP_COUNT"] != 1) output(" Your kips all have two thin, sky-blue lips, but y");
		else output("Y");
		output("our firstborn kip’s lips are thin and jet-black, capable of curling into the most precious of smiles. Growing from her forehead are a pair of horns that curve sharply over her skull, but don’t reach very far and are blunt at the tip, useless for attacks. And beneath those, she has thin, shoulder-length hair");
	}
	else
	{
		if (flags["FROSTWYRM_KIP_COUNT"] != 1) output(" Your kips all have two thin, sky-blue lips, including y");
		else output("Y");
		output("our firstborn and it’s capable of curling into the most precious of smiles. Growing from her forehead are a pair of horns that curve sharply over her skull, but don’t reach very far and are blunt at the tip, useless for attacks. And beneath those, she has thin, shoulder-length hair");
	}
	if (flags["FROSTWYRM_KIP_COUNT"] != 1) output(" – each daughter has a different hair color, but your eldest inherited your [baby.hairColor] from birth");
	output(".");
	output("\n\nGrowing from her shoulderblades are two massive wings, with a combined wingspan of twenty feet. When they’re folded behind her, they still reach behind her by about three additional feet, and they have a vertical reach of about eight, extending well past her head. Though they’re large and intimidating, she moves with them comfortably enough, and their thick, leathery musculature easily provides more than enough lift to give her flight.");
	output("\n\nYou’re not fond of focusing on your daughter’s sexual endowments beyond their health. All you really need to know at this point is that she has a perfectly healthy set of both male and female genitalia, and you assume that her anus is at the base of her tail, right where it belongs.");
		
	processTime(5);
	clearMenu();
	addButton(0, "Next", frostwyrmBunchaKiddoContent, undefined);
}
public function frostwyrmlingTalkMenu():void
{
	clearOutput();
	if (flags["NYKKE_VERSION"] == 1) nykkeHeader();
	else frostWyrmlingHeader();
	
	output("What would you like to talk with your daughter about?");
	
	addButton(0, "Biology", frostwyrmWhyDoesMommyLookDifferent, undefined);
	addButton(1, "Technology", frostwyrmShinyShit, undefined);
	if (flags["NYKKE_VERSION"] == 1) addButton(2, "Traditions", frostwyrmBlessedBeOurSmutlords, undefined);
	if (flags["NYKKE_VERSION"] == 1) addButton(3, "Incest", frostwyrmIChangeMyMind, undefined);
	
	addButton(14, "Back", frostwyrmBunchaKiddoContent, undefined);
}
public function frostwyrmWhyDoesMommyLookDifferent():void
{
	clearOutput();
	if (flags["NYKKE_VERSION"] == 1) nykkeHeader();
	else frostWyrmlingHeader();
	
	var itsNykke:Boolean = false;
	if (flags["NYKKE_VERSION"] == 1) itsNykke = true;
	
	var lewdToggle:Boolean = false;
	if (flags["FROSTWYRM_INCEST_OPTION"] == 1) lewdToggle = true;
	
	output("You ask " + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "her") + " if she’s ever really wondered why her Qim and her Qal look so differently. [frostwyrm.name] is very large, and you’re... well, you’re not. [frostwyrm.name] has six limbs, and you only have four. There’s a lot of differences.");
	output("\n\n<i>“I never really even thought about it,”</i> she answers happily. <i>“You are my Qal, and [frostwyrm.name] is my Qim. Qims looking like her and Qals looking like you was just... a truth of the world that I accepted");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 2) output(". Ask any one of us; we’d all tell you the same thing");
	output(". I don’t even see you as different.”</i>");
	output("\n\nYou reply that Qims and Qals can come in any shape or size, but the truth is that you and [frostwyrm.name] aren’t of the same species, and that there are millions of different species in the world. Rather than reply, you feel your kip use her psionics to probe your mind for the definitions of some words. <i>“A million is a lot!”</i> she exclaims. You correct her – there are <i>millions</i>. More than you could rightly count.");
	output("\n\n<i>“So what are the differences between you and the Qim?”</i> she asks, inspired by your line of questioning. <i>“Or between you and me?”</i>");
	output("\n\nYou start with the size, although that’s an obvious one");
	if (!pc.hasWings()) output(". [frostwyrm.name] has wings, which help her get around the planet at a much faster pace, and you don’t have something like that");
	output(". When [frostwyrm.name] walks around, she does so using her six legs, but you and her walk around on two. You only have two arms, while [frostwyrm.name] doesn’t have any, and your kip has four.");
	output("\n\n<i>“Why is that?”</i> she asks, and you answer that you don’t know, but your best guess is because [frostwyrm.name] has six limbs, so some wires got crossed when your kip was born and gave her six limbs as well. <i>“What does that mean, that ‘some wires got crossed?’”</i> You... answer that gene-passing is a complicated subject that you’re no expert on, and she’ll figure it out when she has her own mate.");
	if (itsNykke) output("\n\n<i>“Would it... be able to explain why my body is darker than our Qim’s?”</i> she asks, hopeful for an answer to a question that’s clearly been bugging her for some time. You answer that it likely would, but, again, you can only speculate; you don’t have a lot of answers on the subject.");
	if(lewdToggle && (pc.hasGenitals() || pc.biggestTitSize() > 0)) {
		output("\n\n<i>“So what other differences are there?”</i> she asks. One of her hands reaches for your [pc.crotch], fondling casually, almost innocently in her pursuit of knowledge, at your junk. <i>“");
		if(pc.hasGenitals()) {
			if (pc.isHerm()) output("You have a penis and a vagina, just like the Qim and I do, so that’s not any different");
			else if (pc.hasCock()) output("You have a penis, just like the Qim, but you don’t have a vagina");
			else output("You have a vagina, just like the Qim, but you don’t have a penis");
			output(". ");
		}
		if (pc.biggestTitSize() > 0) {
			output("You have these meaty things on your chest, just like I do");
			if (pc.biggestTitSize() < 6) output(", although they’re smaller than mine");
			else output(", and they’re bigger than mine");
			output(", but the Qim doesn’t have any. ");
		}
		output("Her face is a lot longer than ours, too, and she doesn’t have these puffy things around our mouths.”</i>");
		if (pc.biggestTitSize() > 0 && pc.biggestTitSize() < 6) output("\n\nYou grit your teeth at " + (flags["NYKKE_MET"] == undefined ? "your kip" : "Nykke") + " reminding you that your boobs are smaller than hers, and tell yourself that she meant nothing by it.");
	}
	else output("\n\n<i>“So what other differences are there?”</i> she asks. She caresses her face with one of her hands. <i>“Her face is a lot longer than ours, too, and she doesn’t have these puffy things around our mouths.”</i>");
	output("\n\nYou respond to most of her questions at once by saying that everyone is born a little different: some people have more than others; some are born taller, or with bigger assets. But you remind her that not always is bigger, better, and that she should judge others by their personality and their merits rather than their physical appearance.");
	output("\n\n<i>“And these?”</i> she asks, groping and squeezing at her tits. You tell her that those are called ‘breasts,’ and that their primary function is to nurse young with – but they have lots of other feel-good uses, too. ");
	if(pc.isLactating()) {
		output("\n\n<i>“How do you ‘nurse’ young with these? That doesn’t make any sense to me.”</i>");
		output("\n\nYou reply that she’s asking at a lucky time: you gently grip your boob just beneath the nipple and give it a squeeze. Your [pc.milk] sprays from your [pc.nipple] in thin streams, going every which way.");
		output("\n\n" + (flags["NYKKE_MET"] == undefined ? "Your kip" : "Nykke") + " gasps in surprise at the sight, then a giddy grin crosses her face. This liquid, called ‘milk,’ is what the young of your kind sustain on until they’re older for other, solid foods.");
		if(lewdToggle) output("\n\n<i>“May I have some?”</i> she asks. You reply that she’s... a little above being breastfed at her age, and you lower your [pc.nipple] away from her. She pouts, but respects your decision.");
	}
	output("\n\n<i>“What about these?”</i> she asks, drawing a finger across her lips, continuing your biology lesson. You tell her that those are her lips: without those, she wouldn’t be able to talk, or open her mouth to eat, or kiss.");
	if(lewdToggle) {
		output(" <i>“What is a ‘kiss?’”</i> she asks, and you demonstrate, leaning forward and putting your [pc.lipsChaste] to hers.");
		output("\n\n<i>“That felt really good!”</i> she exclaims. You tell her that that is how others of your kind show affection with others. <i>“Can you do that again?”</i>");
		output("\n\nYou do so, leaning in to give her another quick peck on her lips. She sighs in delight when your [pc.lipsChaste] meet hers once more. <i>“Can you... can we do that again?”</i> she asks, but you stay firm and tell her that that’s enough for now. She pouts, but respects your decision as her Qal.");
	}
		
	processTime(5);
	clearMenu();
	addButton(0, "Next", frostwyrmlingTalkMenu, undefined);
}
public function frostwyrmShinyShit():void
{
	clearOutput();
	if (flags["NYKKE_VERSION"] == 1) nykkeHeader();
	else frostWyrmlingHeader();	
	var itsNykke:Boolean = false;
	if (flags["NYKKE_VERSION"] == 1) itsNykke = true;
	
	output("You ask " + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "your kip") + " if she knows what the word ‘technology’ means. In response, you feel a gentle probing in your mind. <i>“I do now,”</i> she answers, a wry smile on her face. You tell her that that’s cheating – and then she probes your mind once more, probably searching for the word ‘cheat.’ <i>“Sorry. I didn’t know what it meant, and you asked me, so....”</i>");
	output("\n\nThat’s fine, you reply, but you broaden your question. Now that she knows what it means, has she ever had any interaction with it? <i>“Nope! I hardly ever leave the lair without you or the Qim.”</i>");
	output("\n\nYou ask her to bring you your effects, off in the corner of the lair");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 2) output(". She immediately delegates the task to one of her younger sisters so that she can stay cuddled up with her Qal – typical older-sibling attitude");
	output(". Once they’re with you, you rifle through your things, searching for your Codex, and when it’s in hand, you ask your kip to put everything back where it was.");
	output("\n\nIn your hand is a small, square device with a glassy screen and a steel back. On its side is a number of buttons: you press one, and the screen hums to life, displaying your last recorded entry. You explain that, in your hand, you hold a device capable of connecting to an invisible network that spans the world many times over; this network contains the collected knowledge of your species’ entire history. You can also use it to communicate with others connected to the same network.");
	output("\n\n<i>“I don’t believe you,”</i> she says. <i>“How can this little thing have so much knowledge in it?”</i> You demonstrate: you bring up the codex entry for Frostwyrms. " + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "Your kip") + " can’t read its information (you promise yourself that you’ll teach her sometime), but she believes your every word as you read out the entry. You bring up the entry for Uveto, then the entry for other planets and locations you’ve been to.");
	output("\n\nYou close your demonstration by contacting your ship: after a moment, ");
	
	output("your call is automatically answered by your ship, and you’re given a view of the cockpit, but there’s nobody there to answer. You explain that this is your ship, and you use it to travel vast distances at high speeds – almost like a set of wings. " + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "Your kip") + " scrunches her nose as she studies the Codex, and she looks around the metal box, trying to see more into the ship. She presses her nose against the glass, trying to go through it to get into the ship, but she’s stopped by the glass screen.");
	output("\n\nThis is just a minor example of the technology your species is capable of – so minor, in fact, that this is considered fairly mundane and typical of its usual standards. Advancements include travelling at speeds many times faster than any Frostwyrm is capable of; medicine capable of curing any disease; transformatives that can change the physical makeup of any person to turn them into whatever they want; there are almost no limits anymore.");
	output("\n\nYou flip through various channels on your Codex, explaining the different things you find. When you find clothing, you explain their purpose and appeal; when you find weapons, you explain their necessities and their dangers. When you find television programs, you explain they’re use as information relays and entertainment–");
	output("\n\n<i>“Go back to that last one,”</i> she asks you, and you do so. It’s an episode of Steph Irson’s <i>Galactic Huntress.</i> From the looks of it, it’s getting close to the end of the episode, judging from how she’s gotten herself in another gangbang with some planet’s indigenous species. It looks like the Zil from Mhen’ga this time.");
	output("\n\n" + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "Your kip") + " watches, enraptured. She’s totally taken in by the programming going on in front of her. <i>“What’s going on here?”</i> she asks you innocently, and you explain who Steph is and what her goal is – or, rather, what it’s <i>supposed</i> to be, but more often than not, it always devolves into... exactly what’s happening right now. Her audience tends to prefer it this way.");
	output("\n\n" + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "Your kip") + " probes your mind once again. <i>“You mean there are individuals that enjoy watching others mate for their entertainment?”</i> You answer that yes, that’s about the long and short of it. <i>“Wow.”</i>");
	output("\n\nShe sits in almost stunned silence for a moment as she watches Steph get absolutely railed by two male, and one female, Zil.");
	output(" <i>“I wonder if-”</i> she begins, but then stops herself, her eyes flitting towards yours for a split second. <i>“Never mind, it’s not important.”</i>");
	output("\n\nWhen you switch the programming to something else, she pouts, but ultimately respects your decision as her Qal.");	

	processTime(5);
	clearMenu();
	addButton(0, "Next", frostwyrmlingTalkMenu, undefined);
}
public function frostwyrmBlessedBeOurSmutlords():void
{
	clearOutput();
	if (flags["NYKKE_VERSION"] == 1) nykkeHeader();
	else frostWyrmlingHeader();
	var itsNykke:Boolean = false;
	if (flags["NYKKE_VERSION"] == 1) itsNykke = true;
	
	output("You ask " + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "your kip") + " what she thinks of the standards and traditions that are upheld here in [frostwyrm.name]’s lair. <i>“I don’t think I understand the question,”</i> she says, so you elaborate, one step at a time: what does she think about mating with you and [frostwyrm.name]?");
	output("\n\n<i>“It’s the natural way of our kind, of course,”</i> she says matter-of-factly, proud of her learned knowledge of her kind. <i>“We remain with our Qim and Qal to have our every need met until you two are summoned by the Grand Qim. That includes food, shelter, and any needs regarding mating");
	output(".”</i>");
	output("\n\nYou tell her that you and [frostwyrm.name] aren’t exactly of the same race. <i>“Well, I gathered </i>that<i> much, silly,”</i> she laughs, nuzzling your nose with hers. <i>“I think it’s incredible that the Grand Qim managed to put you two together, despite your differences.”</i>");
	output("\n\nWhat you mean is that, where you come from, there is no such thing as ‘inner circle coupling,’ and that children – or, kips – from your kind do not mate with their parents, and leave the home once they reach a certain age.");
	output("\n\n<i>“Why would they want to do </i>any<i> of that?”</i> she asks. You reply that there’s a specific word for ‘inner circle coupling,’ and it’s considered a taboo act. Not everyone appreciates the idea of mating with their parents. <i>“Why wouldn’t they? My Qim is the biggest of her kind, and my Qal is the smartest and the strongest. I can’t </i>imagine<i> mating with anyone else. Isn’t that the same with everyone?”</i>");
	output("\n\nYou appreciate the compliment, but no, not everyone thinks the same way as the Frostwyrms. Everyone has a different approach to mating, but some laws and concerns are universal: society, which is another word to describe the way a civilization thinks and acts, looks down on ‘inner circle coupling’ as a serious crime.");
	output("\n\n<i>“Is it society that’s wrong, then? Who does it hurt to mate with who you want?”</i> You tell her that that’s a very dangerous line of thinking – she can’t just ‘mate with who she wants.’ Her partner needs to be aware and willing to mate with her, and if they aren’t, that’s an even more serious crime. <i>“It sounds to me like your ‘society’ is a boring, hard place to be. There are a lot of rules to keep in mind.”</i> You don’t budge, and you force your kip to promise that she won’t mate with anyone or anything without their consent. <i>“Okay, fine! I promise.”</i>");
	output("\n\nWith that squared away, you relax.");
	output("\n\n<i>“Does this mean you aren’t okay with us celebrating our inner circle coupling with our Qim?”</i> she asks, her eyes wide with concern. <i>“I mean, you’re not from our Qim’s kind, and your kind doesn’t like the idea of a parent mating with their child.”</i>");
	output("\n\nYou tell her that you’ve come to accept that it’s a part of Frostwyrm culture, and you couldn’t ask [frostwyrm.name] to be something she’s not, in her own home, for your sake. You don’t mind if she satiates the sexual needs of your kips, and it’s enough for you to know that she and your kips all respect your decision as their Qal to not participate.");
	output("\n\n<i>“Okay,”</i> she says, snuggling in closer to you and burying her nose into the crease of your neck affectionately. <i>“I hope I’m as understanding as you are with my own mate, my Qal.”</i>");
	output("\n\nAnd, that said, it’s not like [pc.race] societies and cultures are all <i>that</i> different from Frostwyrm ideals. For example, your kind enjoys the concept of mating for life. Although, they don’t call it ‘mating,’ even though that’s what you do; they call it ‘marriage.’");
	output("\n\n<i>“What’s the difference?”</i> she asks, and you tell her that there isn’t really one; it’s just a fancy label that your kind apply to mates to tell others that they aren’t available. <i>“Why would you need a label for that? Shouldn’t their scent markings be enough?”</i> You smile. That’s a kinky thought, but most people try to be as un-smelly as possible.");
	output("\n\n<i>“So marriage just means that you don’t mate with anyone except your mate?”</i> That’s about the short of it, you confirm.");
	output(" <i>“Does that mean we’re married to our Qim?”</i> Well – suddenly, you’ve gotten yourself in a bit of a situation. You want to tell her that, if she’s married to anyone in the lair, it would be you, but you just said that two married people only mate with their mates. So... in a sense, yes, you suppose, [frostwyrm.name] is married to your kip");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 2) output(". To all your kips");
	if (silly) output(". You feel like you’re suddenly starring in a sitcom.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 2) output("\n\nUsing her psionics, " + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "your kip") + " reaches out to the rest of the clutch, exclaiming that, as far as their Qal’s society is concerned, they’re all married to [frostwyrm.name]! The exclamation is met almost entirely with confusion, but when she explains that it’s a good thing, they all cheer in delight. This is her life now, you guess.");
	
	processTime(5);
	clearMenu();
	addButton(0, "Next", frostwyrmlingTalkMenu, undefined);
}

public function frostwyrmItsMineAllMine():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	var itsNykke:Boolean = false;
	if (flags["NYKKE_VERSION"] == 1) itsNykke = true;
	
	output("You’re cuddled warmly against [frostwyrm.name] and " + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "your eldest kip") + " spooning up against you, both of them sharing your body heat, as you stare out to the village of Frostwyrmlings you and [frostwyrm.name] have created. It’s been many years since your firstborn, and not only do you feel as young as ever, and not only do you not intend to stop breeding with your Qim, but you feel as though your adventure as the Qal to your race of hybrids is only beginning.");
	output("\n\nYour Qim loves you with all her heart; you don’t need psionics to know that. And your kips are all highly devoted to you; although they take a rather mercenary position with you during their inner circle couplings, their love and devotion to their Qim and their Qal isn’t something you’d ever question. Your family in the icy lair would do absolutely anything for you, if you’d but ask.");
	output("\n\n[frostwyrm.name] is an enormous, icy dragon, capable of rending buildings and small armies asunder with her bulk. Each of your daughters are highly muscled; tall as a giant; and naturally equipped with scales as tough as shields. If you asked them to, and you were serious about it, you could easily take over Uveto; the only defense the planetoid has is its indigenous peoples and weather stations full of scientists, not fighters. It’d be a fairly simple, and possibly bloodless, operation.");
	output("\n\nYou look out to the village of your daughters, each of them milling about the lair with their own thoughts, concerns, and activities, waiting for you to simply say a word, any word, and they’ll drop everything for you. It’s very tempting. But it would also mean abandoning your by-now years-long adventure to claim your inheritance from your late father and being a full-time Qal to the Frostwyrms.");
	output("\n\nDo you stop your adventuring and claim Uveto as your kingdom?");
	
	clearMenu();
	processTime(1);
	addButton(0, "Yes", frostwyrmItsMineAllMine1, undefined,"Yes","This will be the last decision you’ll ever have to make, if you go this route.");
	addButton(1, "No", frostwyrmNahIChangeMyMind, undefined);
}
public function frostwyrmNahIChangeMyMind():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("You shake your head. As simple as it probably <i>would</i> be, it would nonetheless be a dangerous venture – you’re talking about overthrowing what little government is established on Uveto for yourself, after all. Why ruin the good thing you have going with your family here?");
	output("\n\nYou sigh and relax, leaning against [frostwyrm.name]. It’s just a silly power fantasy. But... you doubt you’ll ever be able to truly shake the idea.");

	clearMenu();
	processTime(1);
	addButton(0, "Next", frostwyrmMainMenu, undefined);
}
public function frostwyrmItsMineAllMine1():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("\n\nIt might just be age creeping up on you, but you feel a sense of belonging that you can’t rightly explain, here in the lair. You’ve been with [frostwyrm.name] for so many years and you’ve had so many kips with her that you can’t shake the feeling that this is... where you belong. Here, as the Qal to your new, invigorated race of Frostwyrm hybrids; where you should stay until you and [frostwyrm.name] are summoned by the Grand Qim and your daughters leave to spread their genes, just as you have, throughout all of Uveto. Possibly further.");
	output("\n\nYou pull yourself away from your eldest daughter (with some effort; she was reluctant to let you go), and you peel from [frostwyrm.name], standing before the lair and on an elevated level of your Frostwyrmling village. The bustle of the clutch slowly begins to fade as the ruby-red eyes of each and every daughter fall to you; through their embedded psionic connection with you, they all feel that you have a serious announcement to make, and you know that, out of respect, they are not reading your mind – when you have something to say, you will say it.");
	output("\n\nThe lair falls entirely silent as they wait, excited for your words. [frostwyrm.name] watches you, her Qal and her mate, intensely, curious for what you intend to say. You have the undivided attention of the lair.");
	output("\n\nYou open your mouth, and you say the words that will change your life, and the course of Uveto, forever....");
	
	clearMenu();
	processTime(1);
	addButton(0, "Next", frostwyrmItsMineAllMine2, undefined);
}
public function frostwyrmItsMineAllMine2():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("\n\nYou didn’t simply leave the lair and start ransacking the planetoid that night; you spent many weeks afterward preparing and planning your methodological strikes at various points along the planet. You’d need to be swift and powerful, and you’d prefer to establish your kingdom with as little bloodshed as possible. The civilized peoples on Uveto aren’t fighters – they’d probably surrender peacefully, and if they don’t, it wouldn’t be difficult to put them on the next shuttle out of orbit.");
	output("\n\nEach and every member of your clutch was on board with the plan. If it meant their Qal would stay with them forever, and if it made their Qal happy, they were all for it, every single one of them. They were giddy and excited, yet attentive and serious when you briefed them on your strategies and plans. They wanted this to succeed as badly as you did, but none as much as [frostwyrm.name]; of everyone in the lair, the idea of retaking her world for her kind, with her Qal at the helm, was like a fantasy come true.");
	output("\n\nThe day you began your strike – the day your Qim lovingly referred to as ‘Light’s Beginning’ – ");
	if (pc.IQ() <= 32) output("was a diplomatic disaster. You wanted no bloodshed, but your coordination was nonexistent; your attack plan, if it could even be called that, was sloppy; and you couldn’t even find the stations you had mapped out to strike in order. Your attack was confused and haphazard, with little communication between you and the kips, and rather than try to subjugate Uveto through a bit of flexing and diplomacy, it ultimately devolved into violence. You aren’t sure who threw the first punch, but, when all was said and done, you sure as hell finished the fight");
	if (pc.IQ() >= 32 && pc.IQ() <= 65) output("was executed with the occasional hiccup, and you can’t say it was completely bloodless. The clutch stayed together, and you took the planetoid one station at a time; some of them fell easily and without resistance, while others were a little more... animated, refusing their subjugation. When a station couldn’t be reasoned with, you had to make some demonstrations and examples. It wasn’t the fault of anyone in your clutch, but you couldn’t help but feel responsible for the few diplomatic losses you had to endure");
	if (pc.IQ() >= 66) output("was executed flawlessly. Your clutch struck with strength and precision, hitting each station in order exactly as you had planned, and you had subjugated them one after the other without so much as a hitch. Like you had surmised, most of the civilized life on the planetoid were humble scientists, and they generally didn’t need convincing. The few that did bent with just a little flex of the power of your Frostwyrms, and when all was said and done, each every station on Uveto was under your control, and not a drop of blood was spilled. You couldn’t have been prouder of your clutch and their discipline");
	if (pc.isBimbo()) output("kinda went out the window as soon as an intrepid few from your clutch had a better idea: rather than flex some muscle or make some threats or try and talk your way into sub... subju... ruling all of Uveto, why not just fuck your way there? It was a simple trade: all those lonely, pent-up and frustrated scientists got all the sex they could have asked for from your Frostwyrmling hunnies, and all they had to do was promise to do what you said. Man or woman, gay or straight, it didn’t matter; each of your daughters had something for anyone. You dunno how long it took, but when all was said and done, there weren’t any more stations to take over. And although not a drop of blood was spilt, the same could not be said for a handful of other bodily fluids");
	output(".");
	output("\n\nOf course, the total annexation of an entire planet did not go unnoticed on the interplanetary scale: there were many factions and businesses that had a vested interest in keeping Uveto the way it was, free of the ‘tyranny’ of an army of Frostwyrms having assumed control. Luckily, orbital strikes were out of the question - civilian casualties would be enormous; trade would halt for decades as rebuilding efforts would take place; and there’s no telling what explosive events like that would do to Uveto’s glacier surface. That was when it was time for a more diplomatic approach.");
	output("\n\nIn truth, while you and your Frostwyrm family commanded the Uvetan surface, you and your ilk had no interest in interfering with the businesses of others. You made no attempt to stop the mining of Uveto’s minerals; you did not interfere in the practices and studies of the scientists and workers living there; and you had no plans or means to continue your conquest beyond Uveto. What you wanted was for your family to have more living space than a small dome in the ocean, and for the opportunity to expand your search for other purebred Frostwyrms.");
	output("\n\nYour position as monarch of Uveto was tenuous, to say the least, with other factions interested in maintaining Uveto’s predetermined order. You suspected for years that non-Uvetans did not respect your title as Uveto’s ruler. But, simultaneously, they did not attempt to overthrow you or usurp you: as long as you made no effort to halt the common trade and business on Uveto - and, as you’re sure it played no small part in maintaining the peace, as long as you kept surrounding yourself with dragons - your position as Uveto’s ruler was not challenged.");
	
	clearMenu();
	processTime(1);
	addButton(0, "Next", frostwyrmItsMineAllMine3, undefined);
}
public function frostwyrmItsMineAllMine3():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("Many years pass....");
	output("\n\nYou spend most of your time on Irestead and establish it as your primary lair – it’s the largest of all the stations and it’s closest to [frostwyrm.name]’s lair in the ocean. You allow a small cadre of scientists to remain and continue their work there");
	if (nykkeFrostwyrmTF()) output(" – including Doctor Lessau, who remained at your Qim’s request. For his outstanding work in biological studies, he was given free access to all the resources available on Uveto and was treated as part of the clutch, just below your firstborn daughter in hierarchy. He and a few other scientists continue their work diligently, with want or need for nothing");
	output(", although most of the population of the station is you, [frostwyrm.name], and your ever-expanding clutch of Frostwyrmlings.");
	output("\n\nYou’ve had dozens upon dozens more of them with [frostwyrm.name] since you’ve successfully commandeered the entire planetoid");
	if (flags["FROSTWYRM_INCEST_OPTION"] == 1){
		output(", and one day, you’re taken off-guard when your eldest daughter – who has made it a point to mate with her Qal and <i>only</i> her Qal – ");
		if (pc.hasCock()) output("finally showed signs of pregnancy");
		if (pc.isHerm()) output(". Not only that, but she ");
		if (pc.hasVagina()) output("surprises you by successfully seeding your ever-willing womb");
		output(". According to [frostwyrm.name], it’s the first time in Frostwyrm history that inner circle breeding had led to a successful laying. And once the news broke out, your legions of daughters were lining up at your lair for a chance to breed with their Qal.");
	}
	else output(", swelling the ranks of your draconian family all the while . Your ranks are too innumerable to count, and you have no eye on your family from your throne on Irestead - whether your kips have found mates of their own and begun their own lineages, who’s to say, but if they have, you have no doubt that by now, your Frostwyrmling hybrids are among the most populated species on Uveto, if they aren’t already the most populated.");
	output("\n\nOnce you had taken complete control of Uveto and the Frostwyrm population began to boom (albeit through hybrids), you quickly found other, surviving individual purebred Frostwyrms – you had found more of [frostwyrm.name]’s kind. [frostwyrm.name] was overjoyed, of course, but she showed no interest in any of her kind, sexually or emotionally. How could she? She had the greatest Qal in history as a mate, and her every emotional and sexual need was fulfilled by her loyal clutch. She was devoted to you and to the clutch, body and soul, until the end of time.");
	output("\n\nToday, you’re sitting on your favorite chair: what was once the Irestead lead director’s chair, which was surprisingly regal and fancy for who everyone was assumed was a mere scientist. You had relocated it to the lower floor of the station, so that you could be closer to [frostwyrm.name] and your numerous, doting daughters at all times. You had the station remodeled slightly to allow for [frostwyrm.name] to comfortably enter and leave the lowest floor, and since then, you’ve rarely left Irestead for anything - save for when you, as Qal of the clutch, want to spend some quality, personal time with your Qim.");
	output("\n\nOne of your kips approaches you, holding out a hologram of the latest in the universe’s news and happenings. It’s important that your kingdom maintains connections to the outside universe, in fact, you’re scheduled to leave for New Texas in a few days to discuss a possible embassy exchange. ");
	output("\n\nThe first thing you flip to is an email you had received from your cousin. Since " + rival.mf ("Jack","Jill") + " had assumed position as CEO of Steele Tech, the company’s slowly begun to tank, and at the rate " + rival.mf ("he","she") + "’s going, " + rival.mf ("he","she") + "’s worried that the company will only last another year or two. Word had reached " + rival.mf ("him","her") + " that you had established a... rather successful government on Uveto, and " + rival.mf ("he","she") + " was wondering if you two could work something out.");
	output("\n\nYou aren’t a cruel cousin; perhaps you’ll answer " + rival.mf ("him","her") + " and invite " + rival.mf ("him","her") + " to join you on Uveto as your left-hand " + rival.mf ("","wo") + "man - or, perhaps, as a member of the clutch, and all the privileges and amenities that includes.");
	output("\n\nThat said, you’ve got a good thing going on here in Uveto, with your loving, draconic mate at your side and surrounded at all times by your hybrid offspring, as the new Grand Qal of Uveto. You couldn’t honestly care less about the company. You’ve created a new legacy for your offspring to follow.");
	
	badEnd("THE END");
}

// Frosty Xmas Xpak
// Writen by B!
// https://docs.google.com/document/d/1YN72OHgu_eSIvU0tZ5ZiqBsrR8McOWtGI7DuWq0p2-Q/edit
// Coded by Stygs
// Jan 2019
public function frostwyrmXMas():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");

	output("You enter [frostwyrm.name]’s lair once more. Used to her unspoken instruction, you begin to strip naked; it’s her lair, and she demands that her Qal be as she is when in her territory at all times. You’ve gotten into the habit of checking your Codex one last time, to see for any last-minute messages or anything, before putting it down and joining your Qim");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output(" and your child");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("ren");
	}
	output(" deeper inside.");
	output("\n\nYour eyes gloss over the solar date – it’s nearly the winter solstice back on Terra. Which means... it’s time for the holidays! You glance at [frostwyrm.name] as she circles her raised platform of ice, and you hesitate. You’d like to introduce the concept to your mate");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output(" and your kip");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("s");
	}
	output(", but you’re not quite certain how to go about it. You doubt Frostwyrms have a similar annual tradition. You doubt Frostwyrms have an ‘annual’ anything.");
	output("\n\n<i>Come to me, my Qal,</i> [frostwyrm.name] implores you, and you’re compelled to respond. You put down your Codex and make your way to ");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output("your oldest daughter; she takes her hand in yours and walks you to ");
	output("[frostwyrm.name], and you nestle yourself in between her front two legs, against her beating heart.");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output(" Your oldest daughter crawls in with you, snuggling herself nice and cozy against both her parents, her six limbs wrapping gently around your body.");
	output("\n\nA low rumbling emanates from her chest, where you’re pressed against, as she enjoys the contentment of being with her Qal in her lair. <i>What troubles you?</i> she asks, shuffling her legs a bit to nudge you closer to her. <i>Speak your mind to me. As ever, your mate is here for you.</i>");
	output("\n\nAt her insistence, you say that it isn’t anything upsetting or concerning. <i>I am relieved to hear that,</i> she says, in an expectant, yet loving, tone – the sort of tone that sounds like she’s enamored with the sound of your voice and just wants to hear more.");
	output("\n\nYou tell her that, at around this time of the Sky Cycle, your kind has a tradition that you all celebrate. What you call it and how you celebrate it are different depending on the individual and their culture, but they all have similar themes: it’s a time that emphasizes togetherness; joy and merriment; and family. It’s a time when families get together and enjoy each other’s company.");
	output("\n\n<i>Is that not what we do all Sky Cycle?</i> she asks, and you respond that it is – but what you two share is, in a word, atypical of your kind. Families in your species don’t always stay together until their parents pass away, and everyone in a ‘clutch’ makes a conscious effort to gather together during this time of the Sky Cycle.");
	output("\n\nYou ask [frostwyrm.name] ");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output("and your daughter");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("s, all huddled around you two");
	}
	output(" if "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "they" : "she") +" would like to try being a part of [pc.aRace] tradition. This sort of event only comes across once every Sky Cycle for your kind, and it’s a very significant part of your culture – it would mean a lot to you if "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "they" : "she") +" said yes.");
	output("\n\nYou hoped that "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "they" : "she") +" would say yes, of course, but the response your "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "clutch" : "mate") +" gave you was a little more enthusiastic than you had expected. <i>You have been a wonderful Qal and an ideal mate to me, [pc.name],</i> [frostwyrm.name] says warmly as her long neck cranes towards you, her huge face nuzzling lovingly against your body. <i>It would be my privilege to participate in your culture.</i> ");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined)
	{
		output(" Like ");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("their Qim, each of your daughters are");
		else output("her Qim, your daughter is");
		output(" overjoyed and excited at the idea of being a part of your traditions; you’ve taught " + (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "them" : "her") + " so much about them, and this is the first time that " + (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "they" : "she") + " can really be a part of the experience.");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output(" They crowd and huddle around you and [frostwyrm.name], eager to learn how to be a part of your life.");
	}
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output("\n\nYour clutch is ready, as ever, our Qal,</i> [frostwyrm.name] says. You feel the eager, excited eyes of your clutch on you, ready for your first instruction.");
	else output("\n\n<i>Your mate is ready, as ever, my Qal,</i> [frostwyrm.name] says, her ruby-red eyes on yours.");
	output(" <i>What would you have us do?</i>");	

	moveTo("FROSTWYRM LAIR");
	removeUvetoCold();
	processTime(60);
	frostwyrmXMasMenu();
}
public function frostwyrmXMasLeaveCave():void
{
	if (currentLocation == "FROSTWYRM LAIR") {
		output("You and your " + (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "clutch" : "mate") +" make your way out of the lair (after you put your effects back on first, of course) and onto the surface of the little island that houses it. ");
		moveTo("FROSTWYRM LAIR OUTSIDE");
		processTime(20);
	}
}
public function frostwyrmXMasMenu():void
{
	clearMenu();
	if (flags["FROSTWYRM_XMAS_SNOWMEN"] == 1) addDisabledButton(0, "Snowmen!", "Snowmen!", "You already did this.");
	else addButton(0,"Snowmen!",frostwyrmXMasSnowmen,undefined,"Snowmen!","There’s nothing quite like the company of a snowman made with someone you love!");
	if (flags["FROSTWYRM_XMAS_SNOWANGELS"] == 1) addDisabledButton(1, "SnowAngels!", "SnowAngels!", "You already did this.");
	else addButton(1,"SnowAngels!",frostwyrmXMasSnowAngels,undefined,"SnowAngels!","The lair’s already got an angel in it, but maybe she’d enjoy making some more in the snow.");
	if (flags["FROSTWYRM_XMAS_GIFTGIVING"] == 1) addDisabledButton(2, "GiftGiving!", "GiftGiving!", "You already did this.");
	else addButton(2,"GiftGiving!",frostwyrmXMasGiftGiving,undefined,"GiftGiving!","[frostwyrm.name] has already given you the greatest gift of them all – but maybe she’ll get creative.");
	if (flags["FROSTWYRM_XMAS_CAROLING"] == 1) addDisabledButton(3, "Caroling!", "Caroling!", "You already did this.");
	else addButton(3,"Caroling!",frostwyrmXMasCaroling,undefined,"Caroling!","Song is one of the languages of the universe. You’re sure [frostwyrm.name] has a wonderful singing voice!");
	if (flags["FROSTWYRM_XMAS_SNOWMEN"] == 1 && flags["FROSTWYRM_XMAS_SNOWANGELS"] == 1 && flags["FROSTWYRM_XMAS_GIFTGIVING"] == 1 && flags["FROSTWYRM_XMAS_CAROLING"] == 1 ) {
		output("\n\nNow that she mentions it, you’ve gone through the whole list. There’s really only one thing left to do.");
		addButton(4,"Decorate!",frostwyrmXMasDecorate,undefined,"Decorate!","It wouldn’t be the holidays without spending time to gussy up the place with a bunch of tacky colors! You may not have a tree or a menorah on hand, but you <i>do</i> have something in mind....");
	}
	else addDisabledButton(4,"Decorate!","Decorate!","You should leave this for later!");
}
public function frostwyrmXMasSnowmen():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");

	output("There’s one thing you and your kind liked to do during times like these. Here on Uveto, snow and ice is everywhere and it’s something that everyone, including its natives like the Frostwyrms, take for granted; but where you come from, snow is something that only happens during very specific times of the Sky Cycle. You and your kind have learned to make the most out of the little window you’re given to do fun stuff with it.");
	output("\n\n");
	frostwyrmXMasLeaveCave();
	output("The surface is covered in snow that go a little ways up your [pc.legs] – there’s easily enough snow here to make a snowman. You bring your hands to the snow and start packing a bit of it into a ball, talking through your actions to your mate");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output(" and your daughter");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("s");
	}
	output(", who "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "watch" : "watches") +" you intently, hanging on your every word so "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "they" : "she") +" can mimic you when you’re done.");
	output("\n\nFirst, you start with a little ball of snow; big enough that you can hold in your hands. Then, when you’ve got a snowball in your hand, you roll it along the ground, so that it collects more snow and it gets larger. You demonstrate, and before your "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "clutch" : "mate") +"’s eyes, the little ball of snow you had started with does indeed grow larger and larger the more it rolls around.");
	output("\n\n<i>I had no idea the Wet Dust could do this,</i> [frostwyrm.name] admits, her nose practically pressed against the snowball as it grows larger and larger. <i>My kind had never interacted with it this way.</i> Inspired, she lays flat on her belly, her front two forelegs extended as she tries to cobble together enough snow to get started.");
	output("\n\nShe has a bit of trouble with it; the claws on her forelegs aren’t nearly flexible enough to meld the snow in the way she wants. With broad strokes, she can bring together high mounds of snow, but she can’t pack it together in order to get her snowman started. She grunts in frustration");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output(", especially as she jealously eyes the large snowballs her kip");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("s");
		output(" had made before her");
	}
	output(", until you");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output("and your daughter");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("s");
	}
	output(" pack a snowball tight enough for her to get started.");
	output("\n\n[frostwyrm.name] ");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output("and your daughter");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("s");
	}
	output(" roll the snow around in delight – this alone is enough to keep "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "them" : "her") +" entertained");
	if (flags["FROSTWYRM_KIP_COUNT"] > 1) output(", and your daughters quickly get themselves carried away, getting into a competition over who can make the larger snowball");
	output(". After "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "their" : "her") +" first snowball is large enough, you tell "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "them" : "her") +" that you need to make two more, and, ideally, you want to build them to be just a little smaller than the ball before it.");
	output("\n\nAs before, you help [frostwyrm.name] with her next two snowballs before you get started, and before long, you each have three snowballs to your name. The next part is a little trickier: you need to stack them, one on top of the other, going from largest to smallest, from the bottom-up.");
	if (silly) output("\n\nYou struggle a little bit to lift your snowballs – you might have made them a little heavier than you thought – but you manage");
	else output("\n\nIt’s a pretty simple task for you");
	output(", and you now have a little snowy statuette to work with. ");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("Your daughters have accomplished their task as well, and they step back, comparing their work to yours to make sure they have it right. ");
		else output("Your daughter has accomplished her task as well, and she steps back, comparing her work to yours to make sure she has it right. ");
	}
	output("[frostwyrm.name]’s snowballs, though, are... to scale. They’re <i>way</i> too massive for you to lift.");
	output("\n\n<i>Give me a moment,</i> [frostwyrm.name] says determinedly, her eyes narrowing as she scrutinizes the puzzle she had made for herself. She opens her massive jaw and considers biting into them, but reconsiders; she wraps her long neck around one to try and lift that way, but she couldn’t get halfway around the ball.");
	output("\n\nAfter a moment, she turns to one side and jams the tip of her wing underneath one heavy orb; with a grunt and a flex of her powerful wing, she manages to lift it up, where it then rolls onto her back, until she gets into position and rolls it back off. The third ball is much harder, since her snowman is so tall, but, with determination and no grace, she manages to make herself a bonafide, if absolutely massive, snowman.");
	output("\n\nYou "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "and your clutch all " : "") +"congratulate [frostwyrm.name] for her effort – it looks amazing! [frostwyrm.name] steps back, eyeing her own work appreciatively: her snowballs are a bit misshapen and crooked, but, from the way her body shuffles protectively around it, she’s quite proud of her work. <i>Indeed, that was exhilarating! I have created a Snowing Man!</i> she says joyfully.");
	output("\n\nBut that’s not all. Here’s the best part: you get to decorate the snowman. You start digging into the snow, looking for the rocky surface of Uveto, and you find it: the island is covered in smooth, black pebbles, frozen together in clumps of three and four, underneath the ice. You break them apart and put two on the topmost snowball – now he has eyes!");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output("\n\nInspired, your "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "daughters follow" : "daughter follows") +" suit, digging into the snow with instinctual finesse until "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "they hit" : "she hits") +" the rocky bottom you sought. "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "They come" : "She comes") +" back up with half a dozen rocks in each hand, and "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "they get" : "she gets") +" to work. ")
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) {
			output("Your daughters have varying ideas when it comes to making snowmen, and they’re careful to try and not mimic each other, since their snowman is personal to them. One daughter gives her snowman a great, big, rocky grin; another leaves the front undressed but decorates the backside in patterns");
			if (flags["FROSTWYRM_KIP_COUNT"] >= 10) {
				output("; one of your lascivious daughters impishly makes two, slightly-smaller snowballs and promptly shoves them onto the middle one, giving her snow‘man’ a rather impressive set of knockers");
				if (silly) output(", complete with innie nipples with some further crafting");
			}
			if (flags["FROSTWYRM_KIP_COUNT"] >= 20) output("; one of your daughters, apparently exceptionally skilled, begins sloughing away snow in wide swaths and reapplying it very specifically, giving it detailed musculature and facial features");
			output(". They begin sharing ideas and adding or changing them just slightly – and they each have the widest of smiles, loving the bonding time they’re sharing with each other.");
		}
		else output("She starts with doing exactly as you had done by putting two rocks where the eyes would be. Then, she puts in several more, in a line going straight down the middle snowball. Then, out of ideas, she drills small holes into the snowman’s body with her claws, digging the stones in deep so that only the tips remain – she gave her snowman scales, like her own body !");
	}
	output("\n\n[frostwyrm.name] concentrates on her snowman, unsure of how to go about personalizing it. She twists her head from side to side, trying to imagine how it would look with any number of changes or accessories. Then, suddenly, she’s struck with inspiration, and disappears into the lair for a moment.");
	output("\n\nWhen she returns, she has two large icicles, pulled from the roof of her lair, in her mouth. She drops one, then carefully aligns the sharp end of the other against the side of her middle snowball, tilted upwards, and drives it in. Satisfied that it’ll remain in place, she picks up the other and does the same thing on the other side.");
	output("\n\n<i>My Snowing Man has been completed,</i> [frostwyrm.name] announces proudly, stepping back and sitting on her haunches to appreciate her work. You take your position beside her to properly enjoy it: massive, craggy, misshapen and crooked, and aside from the icicle arms, it’s completely bare. You tell her that it’s absolutely beautiful.");
	output("\n\nYou feel her probe your mind, likely for the definition of the word ‘beautiful.’ <i>I should hope so, my mate,</i> she says, craning her neck down to nuzzle you. <i>It is modeled after you.</i> You look at her towering behemoth of a snowman again. Frostwyrms don’t have arms.");
	output("\n\nYou wrap one arm around her scaly leg, holding yourself close to her, as you both bask in the glow of a completed creative project; one that you "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "and your clutch " : "") +"completed together. With the constant subzero temperatures of Uveto, your snowmen will survive for as long as the weather is decent. You wonder if you should give your own snowman some wings or something, to return the notion.");
	output("\n\n<i>What other activities does your kind’s tradition include, my Qal?</i> [frostwyrm.name] asks.");

	flags["FROSTWYRM_XMAS_SNOWMEN"] = 1;
	processTime(20);
	frostwyrmXMasMenu();
}
public function frostwyrmXMasSnowAngels():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");

	output("You look up at [frostwyrm.name] as the idea of snow angels crosses your mind. You have no doubt that she’d love to give it a try, if for no other reason than to be a part of your life, but you just can’t wrap your head around how it could possibly look in the snow. There is, of course, only one way to know for sure.");
	output("\n\n");
	frostwyrmXMasLeaveCave();
	output("The snow is so deep that moving your arms and [pc.legs] to push enough snow out of the way to make an angel sounds like it’d be a little trying, but that’ll only make the finished product all the better to see. You tell [frostwyrm.name]");
		if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output(" and your daughter");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("s");
	}
	output(" to watch you and do as you do.");
	output("\n\nWith their eyes on you, you spread your arms and fall backward, your body making a thick ‘floomf’ noise as you immediately sink into the snow. It’s as cold as you expected it to be, so you don’t waste any time and start flapping your arms and "+ (pc.isNaga() ? "thrashing your [pc.legs] rhythmically to mimic the motion and" : "[pc.legs]") +" to push all the snow to either side.");
	output("\n\nIt’s really that simple! When you’re done and you’ve cleared away the snow with your limbs until you’re swiping at nothing, you stand back up to admire your work. [frostwyrm.name]");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output(" and your daughter");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("s");
	}
	output(" gather"+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "" : "s") +" around curiously, wondering just what you’ve done, and you explain that, in cultures like yours, the silhouette that you’ve made in the snow is reminiscent of what you call an ‘angel.’");
	output("\n\n<i>What is that?</i> asks [frostwyrm.name], and you tell her that, well, to make a long story short, an ‘angel’ is someone that represents goodness in the world. They’re generally depicted with wings and they usually wear a long, thin fabric called a ‘robe’ that covers them from the neck down. The divots that you made with your arms look like large, billowy wings"+ (pc.hasWings() ? " (no matter how true to life they might not be)" : "") +", and the kicking with your [pc.legs] made it look like it’s wearing a robe that covers it down to the ankles.");
	output("\n\n");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output("Your "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "daughters see" : "daughter sees") +" the resemblance with some scrutiny; "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "they" : "she") +" can’t quite picture what a ‘robe’ looks like, but "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "they understand" : "she understands") +" the wings well enough. ");
	output("[frostwyrm.name], try as she might, just can’t wrap her head around how the silhouette is supposed to look: the creature you’ve drawn in the snow has no ‘arms’ or even legs, and it has no weight or body to it. Her imagination draws nothing as she tries again and again to see it, from different angles. You offer to make another one. <i>More examples would not assist me, though I appreciate the offer, my Qal,</i> she says, her eyes narrowing on the pit in the snow. <i>I will deduce this with what you’ve provided me now.</i>");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		if (flags["FROSTWYRM_KIP_COUNT"] == 1) output("\n\nYour daughter, meanwhile, has already taken to making herself a small cadre of snow angels: as soon as she’s wrapped her head around the concept, she finds a blank spot in the snow, spreads her arms and wings, and falls backward with a giggle, the snow billowing up and around her when she flops into it. Where she puts her next angel is usually pretty random – with the exception of three in particular, aligned in such a way that their wings overlap just slightly.");
		else output("\n\nYour daughters are quick to follow up on your example once they understand it, and they race each other to see who can make the most angels in the snow as they can. They begin to skimp on the robe and the wings in order to make more of them faster than their " + (flags["FROSTWYRM_KIP_COUNT"] > 2 ? "siblings" : "sibling") +", until they’re doing little more than just flopping into the snow and making Frostwyrmling-shaped pits. For what it’s worth, they’re laughing and enjoying the activity with each other; so, you decide, who are you to say what makes a proper angel? As far as you care, you’re surrounded by them right now.");
	}
	output("\n\nThe moments tick by as [frostwyrm.name] scrutinizes your angel. You’re on the verge of telling her that you can do something else – you’re worried that the snow angel might be souring her mood – when, suddenly, she looks up and scours the island for an untainted bit of snow, large enough for her. When she finds one, she turns to one side, folds her wings against her body, and tips over, rolling across the snow until she’s on her back.");
	output("\n\nHer motions are similar to a... well, to a giant lizard that’s fallen onto its back. [frostwyrm.name] writhes her spine back and forth, twisting her body and flapping her wings in her attempt to mimic your actions earlier. The snow crunches underneath her weight, and the air vibrates every time her bodily thrusting lifts her off the ground. You stay clear of her; her wings and her thrashing tail are larger than she might realize.");
	output("\n\nThe snow sticks to her body in clumps as she moves. To her credit, she’s moving consistently: her movements aren’t random or chaotic, as hard as it might be to believe at first glance. Her wings slice evenly into the thin snow and her legs make consistent swinging motions in front of her, rounding out whatever silhouette she’s making. ");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output("Your "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "daughters take their" : "daughter takes her") +" place beside you, well clear of "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "their" : "her") +" Qim, just as curious as to what she’s doing.");
	output("\n\nAfter an exciting few moments, [frostwyrm.name] stops and rolls back onto her legs, stepping away from her newly-christened snow angel. She lifts her long neck to get a better view of her creation, and when she does, she begins making the contented, rumbling, throaty purr that she did before. <i>My Snowing Angel had come out better than I had imagined,</i> she says to you "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "and her clutch " : "") +"proudly.");
	output("\n\nIt’s difficult to make out any particular shape in the snow from your angle – it just looks like a giant, flattened bit of snow (not that you’d ever say that to her). Still, from what you can tell, some parts of her angel appear rather specific, particularly around the wings and tail.");
	output("\n\n<i>‘Angels’ represent what is good in our world, correct?</i> [frostwyrm.name] asks you, and you confirm. <i>My kind do not have ‘angels,’ but we</i> do <i>have the Grand Qim.</i> [frostwyrm.name] makes a wide circle around her creation, until she gets to the wings. <i>These are the Grand Qim’s wide, spectacular wings; large enough, as the stories go, to blot out the Orb and protect the kips from a raging storm.</i>");
	output("\n\nShe rounds around to the front, where her head was. <i>The Grand Qim’s breath was warm enough to bring an end to the Evercold and foster forth the next generation.</i> She continues on, towards the tail. <i>The Grand Qim’s tail, so say the stories, was large enough to wrap around the world; with a beat of the wings, the Grand Qim could carry the lair, and the world, anywhere.</i>");
	output("\n\nYou ask if that’s what the Grand Qim is doing right now; the head, wings, and tail are detailed enough, but the center of the silhouette is a giant, flat picture. <i>Either that, or the Grand Qim is... particularly fertile and will lay an excessive clutch,</i> [frostwyrm.name] says, her lungs heaving in a crude mimicry of laughter. <i>I would not disbelieve either theory.</i>");
	output("\n\nYou take your position beside [frostwyrm.name], admiring her work in the snow. From the way she was moving about earlier, you hadn’t expected that she had such an artistic interpretation in mind for something as simple as a snow angel.");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output(" Your "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "daughters all admire" : "daughter admires") +" the picture as well, standing clear of the snow angel to take in its imagery without disturbing the effort "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "their" : "her") +" Qim had put into creating it.");
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output(" They chat amongst themselves, admiring some of the finer details and how learned their Qim is about the legends and stories of their kind; you even catch one of them saying how envious they were of [frostwyrm.name]’s artistic skill.");
	}
	output("\n\n<i>What other activities does your kind’s tradition include, my Qal?</i> [frostwyrm.name] asks.");

	flags["FROSTWYRM_XMAS_SNOWANGELS"] = 1;
	processTime(20);
	frostwyrmXMasMenu();
}
public function frostwyrmXMasGiftGiving():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");

	output("One of the ways your kind celebrates togetherness and bonds between friends and family is through gifts. Usually something material, although what’s most important is the thought that goes into the gift, and that could be anything at all. Something that tells the recipient that they’re on the giver’s mind and that they’ve put some thought into their wants and needs.");
	output("\n\n");
	frostwyrmXMasLeaveCave();
	output("Immediately, though, you’re at a loss as to what you give to [frostwyrm.name] – she’s a Frostwyrm. You can think of a few wants and needs that she has, but ");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output("you’ve already given her what she wants. Sure, you two could ‘make’ some more, and you’ll have a ton of fun doing it, but you think ‘more kips’ would be a lazy, uninitiated gift to give her");
	else output("you’re working on one of them right now, and it’s not something that’s going to be ‘done’ in time for the holidays");
	output(". What sort of gifts would Frostwyrms appreciate, and can you even make one from this island? Food, baths, and sex are the obvious choices....");
	output("\n\nWhile you mull the decision over, you fill [frostwyrm.name] on the tradition of gift-giving between individuals during these times, and you explain what usually goes into the thought process of getting a gift for another. <i>This is a simple matter, my mate,</i> she says unsubtly. <i>The greatest gift you could give your Qim is additional kips to further our lineage.</i> You answer that, yes, that was one of the first thoughts you had, but procreation is something that you two do regardless of the time of year. This is an opportunity for you both to show your appreciation in a way you otherwise wouldn’t.");
	output("\n\n[frostwyrm.name] bends her head downward contemplatively. <i>Perhaps you are right. Every moment together with you is itself a gift, my Qal, yet I fear that our moments would lose their luster as they become routine.</i> Her four red eyes lock onto yours attentively. <i>What would you desire of your Qim in this occasion, my Qal?</i>");
	output("\n\nTelling her what you want would ruin the surprise, though – and the message. The point of the gift is that you’re supposed to be paying enough attention to the recipient that they don’t <i>need</i> to tell you what they want, and that you should just <i>know.</i> For that reason, you aren’t going to ask her what she wants, either.");
	output("\n\nHer breath comes out as a low, thoughtful growl. <i>This may prove difficult,</i> she says. That’s the spirit!");
	output("\n\nYou ask [frostwyrm.name] if she wouldn’t mind giving you a lift to Irestead, along the coast where you two usually meet. It’s a long flight, but the time will give you both the opportunity to think on what it is you can get each other. She agrees, and in a moment, you and [frostwyrm.name] take to the sky");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		if (flags["FROSTWYRM_KIP_COUNT"] == 1) output(", your daughter flying alongside you both");
		else {
			output("your daughters taking their place on either side of their Qim in the air");
			if (flags["FROSTWYRM_KIP_COUNT"] > 5) output(", flying in a tight V behind her");
		}
	}
	output(", on your way to Irestead.");
	output("\n\nYou promised to call out to her within, uh... well before Light’s Fall, whether or not your trip is successful. When you hit the mainland, you go your separate ways. The flight lasted an hour, and you still don’t have the first idea what to get her. But, you’ll have an easier time thinking about it when you’re in your own element, or so you tell yourself.");
	output("\n\nThere aren’t a lot of material goods or stores to buy things from in Irestead. It’s a weather station that doubles as a landing point for interplanetary visitors; there are weather-measuring instruments and lots of alcohol, but nothing a Frostwyrm would be interested in. Although, to be fair to yourself, you’re sure [frostwyrm.name]’s never had any alcohol – you don’t know if she wouldn’t like it. And you’re sure an inebriated Frostwyrm would be a sight to see.");
	output("\n\nThat said, Irestead is much more festive than you had expected, coming into it. The local scientists and explorers are taking whatever time they can off their busy schedules to celebrate their own holidays, including putting up decorations. You even catch a whiff of some baked goods coming from their mess hall. It’s as good a place to start, you figure.");
	output("\n\nYou’re greeted with the sight of enough baked cookies and cakes to give everyone on the station at least one of each. You ask the baker, a stout and jolly man, if he could spare enough to feed a Frostwyrm"+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? " and its family" : "" ) +", you were given a fairly curt ‘no’ – the dough is used in too many different pastries to possibly spare that many. But, you’re instead given three large packs of frosting: red, green, and white. There aren’t nearly enough uses for them and they’re going to go bad well before the holidays are over, so you’re welcome to them. It’s, uh, a start, you suppose.");
	output("\n\nYou wander Irestead aimlessly, wracking your mind for something that [frostwyrm.name] would enjoy, and you doubt three big packs of food flavoring is really going to cut it. You glance out the windows to the frozen expanse of Uveto and try to think of something she, as a Frostwyrm, might appreciate, but every time you think of something, you just remind yourself that there’s nothing out there that she can’t just get herself.");
	output("\n\nAs time grows short, you start exploring the more practical shops of Uveto, and you happen to come across a thermal jacket, on the rack for a modest price. It’s lined with fur and it doesn’t look thick enough to provide a lot of protection in the coldest of colds, but it would nonetheless provide <i>something</i>. [frostwyrm.name] doesn’t have any fur at all and she’s out there, bearing Uveto’s climate with just her scales. Maybe she’d appreciate something a little warm?");
	output("\n\nThe jacket was on a holiday sale" + (pc.credits < 264 ? ", thank the Gods" : "" ) +", and you have your gift to [frostwyrm.name]. Naturally, the whole thing isn’t going to fit a Frostwyrm, so you make some modifications – namely, once you’re out of the store and somewhere relatively private, you rip off the sleeves. Now, your gift is ready.");
	output("\n\nThe trek back to the Uveto coast is long and cold, but you’re fuelled by your excitement at meeting [frostwyrm.name] again and giving her the gift you’ve picked out. You call to her and say that you’re ready to return. <i>At once, my Qal,</i> she replies, and in another moment, she’s by your side and you’re on your way back.");
	output("\n\nYou notice that her scales appear slightly different – a little bluer in shade, across most of her body. Normally, she’s rather resilient to the cold, but it appears now that her body’s been slightly frosted over.");
	output("\n\n<i>Were you successful in your search, my mate?</i> [frostwyrm.name] asks you as she flies back. You tell her that you... think you did, but you can’t be certain that she’ll appreciate it. <i>As you taught me, it is not the gift that is essential. It is the intention behind it. I trust that my Qal has only the best of intentions in mind.</i>");
	output("\n\nThe flight back is chilly and long");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output(", made warmer by your clutch keeping you company the entire way");
	output(". The entire flight, you feel what seems to be apprehension from [frostwyrm.name]; if you had to guess, she’s just as concerned and nervous that you’ll enjoy whatever gift she had picked out for you. The suspense is usually one of the harder parts of the holidays.");
	output("\n\nAfter another hour, [frostwyrm.name]’s lair appears on the horizon, and you make a graceful landing back onto the snow of the island. <i>Is this when we present each other our gifts?</i> [frostwyrm.name] asks you, her body shuffling to block you from the entrance of the lair.");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output(" Your "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "daughters move" : "daughter moves") +" with her, attempting to nonchalantly prevent your eyes from peeping at something in the lair’s direction. They aren’t being especially subtle about it, but you play along for now.");
	output("\n\nYou respond affirmatively, and you reach for your gift to her: a torn thermal jacket, and its two sleeves. [frostwyrm.name] studies them curiously: flimsy fabrics that would barely fit around her leg, much less her entire body, but you respond that that’s the idea. Unfortunately, Irestead had lots to offer for kinds and individuals like yours, but not a lot to provide for Frostwyrms, so you had to get a little creative.");
	output("\n\nYou ask [frostwyrm.name] to bend her neck down so that you can get to her horns, and she does so. You explain that you can’t really survive in the cold the same way she can, and that you need help to keep warm in the colder climates. Then, you thought, your Qim probably didn’t enjoy the cold all that much, so maybe – just maybe – she would appreciate trying to keep warm. To that end, you slip the sleeves over her horns, and once those are in place, you wrap the body of the jacket around her foremost left leg and zip it up, giving her a warm, fluffy cufflink.");
	output("\n\n[frostwyrm.name] regards the jacket zipped up against her, studying it with two red eyes, then turning her head to see it with the other two. You realize that it isn’t much, and it’s not going to keep most of her warm.");
	output("\n\n<i>[pc.name],</i> she begins, placing her foot in the snow and watching the jacket protect her from the snow, <i>I... I had never considered that there could be methods to prevent the elements from coating my form. Every journey into the Evercold was a tasking, unforgiving event that no one individual of my kind ever enjoyed.</i> She steps forward, her long tongue snaking out and giving you a warm, loving lick across most of your body. <i>I can only hope my gift to you is half as considerate, my mate and my Qal.</i>");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 10) {
		output("\n\n[frostwyrm.name] looks over her flank, communicating with your daughters to retrieve the gift they had made for their Qal. Eager, they disappear into the lair, and only a moment later, they return with their gift to you: a set of scales, woven to link together, the suit a slightly darker shade of blue than [frostwyrm.name]’s body. It’s about tailored to the size of your torso.");
		output("\n\n<i>We, as your clutch, understand that you have responsibilities to your culture that do not include us. There are times when your kind must summon you away from us, and to the dangers of the world around us.</i> Your oldest daughter lays the small sheet of Frostwyrm scales along both her hands, presenting it to you as a gift. The sheet consists of two layers: the top layer is covered with smaller scales, interlinked with each other inseparably, and the lower layer includes a single, massive scale underneath. <i>Your clutch and I have woven this small protective layer for you, our Qal. ");
		if (pc.hasScales()) output("Though your body has its own protection, it is not of the same temperament as my kind.");
		else output("As your own body is unprotected and exposed, this will provide you with the protection of my kind.");
		output(" Our intent is to protect our Qal, no matter the distance – and to remind you of your clutch, wherever you go.</i>");
	}
	else {
		output("\n\n[frostwyrm.name] turns on the spot, her tail digging through the snow until she feels it clank against something she had hidden in it. Using her claws, she unearths it and presents it to you: one of her scales, a slightly deeper shade of blue than the rest of her. Her one scale is about the size of your torso, and it’s hard as rocks, if not harder.");
		output("\n\n<i>I understand that, as you are not of my kind, you have other responsibilities and demands that your culture makes of you. You cannot spend all your time with your clutch, as much as I desire it so.</i> She nudges her scale to you, pressing it into your hands. <i>This scale of mine has been tempered in the cold, heavy waters beneath the ocean’s surface. It is stronger and more resilient than my natural form. ");
		if (pc.hasScales()) output("You have fine scales of your own, my Qal, but they do not have the same temperament or provide the same defense as my own.");
		else output("You do not possess scales of your own, my Qal; your body is frail and exposed to the world.");
		output(" My intent is to give you a part of myself so that you may protect yourself from the dangers of the world.</i>");
	}
	output("\n\nYou humbly take the " + (flags["FROSTWYRM_KIP_COUNT"] >= 10 ? "suit of scales" : "scale") +" into your arms. It’s lightweight; totally opaque; and you can already tell it’s sturdy as could possibly be. You run your hand along the surface, " + (flags["FROSTWYRM_KIP_COUNT"] >= 10 ? "your fingers tickling along all the interlocking scales, making them each clink against each other" : "running your fingers along the smoothness of [frostwyrm.name]’s scale") +". Your "+ (flags["FROSTWYRM_KIP_COUNT"] >= 10 ? "clutch" : "Qim") +" had done this... for you. To make sure you’d always have something to remind you of "+ (flags["FROSTWYRM_KIP_COUNT"] >= 10 ? "them" : "her") +".");
	output("\n\nYou tell [frostwyrm.name] that it’s easily one of the most thoughtful gifts you had ever received. She’s right: it’s dangerous out there, adventuring in the world. There are a lot of things that could hurt you, and sometimes, you can get a little homesick when you’re away from the lair for too long. With this, you’ll have the power of the Frostwyrms on your side. You won’t have any reason to fear anything with this as your armor.");
	output("\n\n<i>It is a privilege to hear you say those words, my Qal,</i> [frostwyrm.name] says, craning her long neck down to nuzzle against you.");
	output("\n\n<i>What other activities does your kind’s tradition include, my Qal?</i> [frostwyrm.name] asks.");

	processTime(180);
	frostwyrmXMasMenu();

	if (flags["FROSTWYRM_XMAS_GIFTGIVING"] != 1) {
		output("\n\n");
		if (flags["FROSTWYRM_KIP_COUNT"] >= 10) quickLoot(new FrostscaleArmor());
		else quickLoot(new FrostscalePlate());
		eventQueue.push(frostwyrmXMasGiftGiving);
		flags["FROSTWYRM_XMAS_GIFTGIVING"] = 1;
	}
}
public function frostwyrmXMasCaroling():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");

	output("A common but uncommonly-practiced event that goes on during the holiday seasons is caroling – going around your neighborhood and singing to your neighbors in order to spread the cheer. [frostwyrm.name] doesn’t make very many noises at all, but you’re curious if she and her kind knows how to sing, and if she knows any songs.");
	output("\n\n");
	frostwyrmXMasLeaveCave();
	output("You pass the idea onto her, and she hesitates on her response. <i>My kind typically communicate via the mind, but we must know the individual we are communicating with first. And to do this, we must find each other, and this is most easily accomplished by calling to the winds.</i>");

	output("\n\nSo, she knows how to sing? <i>That is not the word that we use to describe it, but, yes. What you call ‘singing’ is similar in concept to how my kind introduce each other.</i> Perfect! You ask her if she’d be willing to share any songs that she know. ");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output("Your "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "daughters agree" : "daughter agrees") +" encouragingly, wanting to hear their Qim teach them how to sing. ")
	output("<i>You may find yourself disappointed, my Qal.</i> You assure her that you would <i>never</i> be disappointed in anything she does or says.");
	output("\n\nInspired by your words, [frostwyrm.name] looks to the horizon. Your island is surrounded on all sides by the vast Uveto ocean; you "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "and your clutch " : "") +"are the only "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "ones " : "one") +" within miles and miles to hear her. <i>As you wish,</i> she says. She paces a bit and shuffles on the spot, unsure and apprehensive – is she nervous about singing in front of you?");
	output("\n\n[frostwyrm.name] takes a deep breath (a much deeper one than you could make!), and from her throat vibrates a constant, baritone hum that reverberates out into the water. Her throat visibly flexes as her voice shifts and makes different notes. It’s a lyric-less song, of course, and it doesn’t follow any sort of pentameter that you’ve ever heard before, but there is nonetheless a certain rhythm to it; the way her highs blend with other highs before sinking to lows and starting again.");
	output("\n\nIt doesn’t sound at all like you had expected a dragon’s song to sound. Worst-case, you had expected something grating and off-key; best-case, you had expected something kind of whiny and shrill. Her ‘voice’ is very deep, matching her size and stature, and it hits just the right resonance to relax your body and tickle you in the chest. Your body leans subconsciously towards [frostwyrm.name] and your ears perk whenever she hits a new high-note. You find yourself... not <i>entranced,</i> per se, but intrigued by [frostwyrm.name] and the song that she’s singing. If you weren’t already deeply acquainted with her, you’d have sought her out with your ears leading the way.");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output("\n\nYour daughters are uniformly still, which is unusual for them, enthralled as they are to their Qim’s song. They take their seats at [frostwyrm.name]’s haunches, their bodies rocking in gentle waves back and forth in time with the rhythms of their Qim’s breathing. Whatever the song is, it may be appealing to their Frostwyrm genetics, enticing them to sit still and listen.");
		else output("\n\nYour daughter is likewise enthralled by [frostwyrm.name]’s song, but doesn’t hesitate to introduce herself into her Qim’s space and sits herself at [frostwyrm.name]’s haunches, her body gently swaying back and forth to the tune of her Qim’s breathing and rhythms. Her eyes close and her body is otherwise still; the song may be reaching to her on some instinctual level, appealing to her Frostwyrm genetics.");
	}
	output("\n\nThe minutes tick by, and eventually, [frostwyrm.name]’s song ends, and your body is gently let off the cloud it’s been put on. You ask [frostwyrm.name] what she had just sang. <i>In terms you understand, it is what your kind would call a ‘lullaby.’ It is a song a Qim or Qal sing to each other, or to their clutch, particularly during times of plenty.</i>");
	output("\n\nYou ask her if the song means anything. <i>I do not understand the question,</i> she says, and you clarify: you ask if there are any definitions to the noises she just made. Songs by your kind usually have words, or ‘lyrics,’ that accompany the music. <i>No, there is no ‘definition’ to what I had just done. My kind communicate via emotion, [pc.name], not by words, and our songs are no different.</i>");
	output("\n\nYou suppose that makes sense. Frostwyrms don’t speak like you do, after all. <i>It is your turn,</i> [frostwyrm.name] says, craning her long neck towards you to playfully nudge you with her nose. <i>I have fulfilled my role in the tradition of your kind. You must now do the same.</i> ");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output("Your "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "daughters leap to their" : "daughter leaps to her") +" feet, eager to hear what song you have to sing. "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "They each begin" : "She begins") +" to badger you, telling you that it wouldn’t be fair to leave it up the Qim to do all the work. ");
	output("Looks like you don’t have much of a say in the matter.");
	output("\n\nYou don’t know a ton of holiday songs off the top of your head, so you default to something you learned back when you were a child. It’s a song about ");
	if (silly) output("borderline unrequited love, sung by a male performer, espousing the virtues of being a good lover and insisting that he’s above the others by pouring out his feelings. To further the point, he makes a bunch of promises about his loyalty and dependability, and halfway through the song he starts singing about how he knows his love feels the same way. You don’t know if you’d call it a festive holiday song, but it was nonetheless fairly popular back in the day.");
	else if (pc.isNice()) output("decorating the halls with a number of shiny baubles and piles of minty plants to spruce up the home; something about putting on happy clothing (you never really understood that part; you just knew the words); and urging others through the lyrics to join in through the song and start again. It’s a staple holiday song, at least.");
	else if (pc.isMischievous()) output("sneaking downstairs during the height of the holiday season, to hopefully get a head-start on opening some presents, before catching your own mother kissing a larger man that you didn’t recognize. The song included something about a white beard, and your mother being unusually hands-y with the whole encounter. It’s... well, it was the first thing that came to mind.");
	else output("one of your older relatives getting really drunk and then getting mauled to death by a reindeer. It’s a pretty sobering song about... a lot of life lessons, really: know what your limit is; don’t forget your medication; don’t try to walk through a blizzard while three sheets to the wind; just to name a few. It’s a pretty festive sounding song, and its rhythm really stuck with you, but you never understood why it was a holiday song.");
	output("\n\nYour song doesn’t have quite the same effect on [frostwyrm.name] as hers did on you");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output(", although your performance inspired your "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "daughters" : "daughter") +" to pick up dance along with you; "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "their" : "her") +" body motion and language matching yours, ");
		if (silly) output("most of "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "their" : "hrt") +" motion in the knees and ankles while "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "their" : "her") +" hands ball into fists, "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "their" : "her") +" shoulders shimmying in time with the lyrics");
		else if (pc.isNice()) output("twirling around you and grabbing "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "each other" : "you") +" by the hands for a spin" + (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "before switching partners" : ""));
		else if (pc.isMischievous()) output("grabbing "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "each other" : "you") +" by the hips and sometimes leaning in to mimic the actions your lyrics described");
		else output("bumping "+ (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "each other" : "you") +" hip-to-hip but otherwise dancing rather off-tune to the song");
	}
	output(". Though [frostwyrm.name]’s body doesn’t have a lot of motion as she listens along, you can tell from the way her eyes watch your every move and her stillness that she’s listening rather intently to the lyrics.");
	output("\n\n<i>This is a traditional song of yours?</i> she asks, and you confirm. <i>I wonder if your songs could truly capture emotion the way my kind can. From the way you move and the way your voice alternates, I can tell that the power of song can be rather... intoxicating for your kind. Perhaps one day I will learn.</i>");
	output("\n\nYou ask her if she thinks your language’s songs have a chance of instilling the same emotions in their audience as hers does. <i>That would be a matter of who is performing, my Qal,</i> she answers simply, her big nose nuzzling up against you once more, making her message as clear as she can without being overt.");
	output("\n\n<i>What other activities does your kind’s tradition include, my Qal?</i> [frostwyrm.name] asks.");

	flags["FROSTWYRM_XMAS_CAROLING"] = 1;
	processTime(20);
	frostwyrmXMasMenu();
}
public function frostwyrmXMasDecorate():void
{
	moveTo("FROSTWYRM LAIR");
	removeUvetoCold();

	clearOutput();
	frostWyrmHeader();
	author("B");

	output("The holidays wouldn’t be complete without one last thing. They’re always accompanied by a ton of decorating, whether it’s the house or some symbol. But you’re at a bit of a loss – you look around the island for a moment and notice how it’s completely, absolutely bare. Aside from the snow, there isn’t so much as an icicle for you to decorate, and even if there was, what would you decorate it with?");
	output("\n\nYou tap your chin in thought as you wonder. Thinking about it logically, you don’t have a lot of tools on hand, and the only things on the island to decorate are–");
	output("\n\nStruck with inspiration, you ask [frostwyrm.name] "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "and your clutch" : "") +"to join you back inside the lair. <i>Are there no more activities in your traditions, [pc.name]?</i> asks [frostwyrm.name]. You tell her that there is exactly one left, and you say that she’s probably going to enjoy it quite a bit, but you’d prefer to be inside to do it. [frostwyrm.name] acquiesces, and you "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "and your clutch " : "") +"make your way back into the lair.");
	output("\n\nYou, of course, strip naked as soon as you’re inside, but you keep your things closer by than usual. Your mate makes her way to the raised platform that is her bedding, and you approach, eying her sultrily. You tell her that there are actually two more activities, but one of them isn’t exactly ‘official.’ It’s to... commiserate your affection with your loved ones. Usually, that only means ‘platonically,’ but definitions can often be a fickle thing.");
	output("\n\n[frostwyrm.name] understands your meaning and lays on her side, her rear two legs spread, giving you unrestricted access to her genitalia. Her heavy testicles rest against the inside of her scaly thigh, one heavy nut spilling over the other. She isn’t currently aroused, but judging from the way her lust is feeding into you, that’s going to change in a hurry.");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output("Your " + (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "daughters" : "daughter") +", understand what’s about to happen between " + (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "their" : "her") +" Qim and " + (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "their" : "her") +" Qal, eagerly " + (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "take their spot around" : "takes her spot beside") +" you, excited for the festivities. Eager hands dip between " + (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "other’s" : "her") +" legs, rousing " + (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "themselves" : "herself") +" to action.");
	}
	output("\n\n<i>I would never dismiss an opportunity to couple with you, my Qal,</i> she says, <i>but if I may ask, is our mating truly a part of your kind’s traditions?</i> Like you said, the holidays are about togetherness and appreciating your time with your loved ones, and how you do that is up to you. But if she’s specifically asking about the fact that you said you had ‘two’ activities to do, that part is a surprise and it’ll come in just a moment.");
	output("\n\nSatisfied and curious, [frostwyrm.name] relaxes, and you place your hands on the soft, grey scales of her underbelly, travelling them southward down her body until they brush against the ridges of her penile vent. It bulges and throbs with her heartbeat excitedly, but it’s not yet open. You get to work on fixing that.");
	output("\n\nYou keep two fingers against her vent, massaging their way into the opening, while your other hand keeps going, tickling along where her perineum would be to her scaly sack. The texture of her scales markedly changes, feeling almost like skin with how fine the scales blend and connect with each other. They’re pulled taut, and your hands rub over them, trailing over the circumference of one massive nut, into the valley between them, and up the other, admiring how delicate the scales feel and how virile her body is.");
	output("\n\nThe hand in her vent has wormed two fingers into her body; your fingers are deluged in some kind of protective slime, and the heat inside her is scalding and tight as a vice, the sensation resembling something quite different from a penile vent. You thrust your fingers into her, pulling at her as you do so to widen the gap and usher out the true prize within. Not that it needs much encouragement: your ministrations against her body have her heart beating faster, and you can feel each pulse reverberate along her loins. It isn’t long until you feel something stiff and hot push back against your fingers.");
	output("\n\nYour eyes scan up her body, along her heaving belly and up her neck. She’s watching you, her four red eyes entranced on what your body is doing to hers. For the benefit of your audience, you withdraw your fingers and bring them to your mouth, sucking the slime off them – a bit tangier and earthier than you’re used to, but if sex and masculinity as concepts had a taste, this would be it. The taste causes your [pc.crotch] to alight, kicking your sex drive into overtime, and you know that the sensation is feeding back into [frostwyrm.name], expediting her own arousal.");
	output("\n\nYou lean in and put your [pc.lips] to her now-flexible vent, driving your [pc.tongue] in and tasting her directly. Your tongue doesn’t go very far before driving headlong into the flat tip of [frostwyrm.name]’s enormous, fat cock; a cock that’s growing all the more fatter and enormous with every pulse, until it pushes back, thrusting your tongue back into your mouth and slowly pushing your [pc.lips] away from [frostwyrm.name]’s crotch.");
	output("\n\nOnce it’s exposed far enough to wrap your hand around, you do so, lightly jerking [frostwyrm.name]’s erection awake. When it’s far enough out to wrap two hands around, you do so, sharing the radiant heat between your palms. ");
	if (pc.biggestTitSize() >= 4) output("When you work it even further out than that, you lean forward, wrapping your [pc.chest] around her length, along its girth into your cleavage and encouraging [frostwyrm.name] to fuck them this way. ")
	output("Your efforts have the effect that you had hoped for: it isn’t much longer until [frostwyrm.name] is at her full, delicious mast, her towering three-foot erection pulsing angrily, her load churning inside her and demanding release into a willing hole.");
	output("\n\n[frostwyrm.name] sighs, long and low, as you work her over, her haunches instinctually bucking against your body. Your oral game changes from light sucking to licking and kissing along the parts you know to be more sensitive than others, particularly around the rim of her glans, but you never forget to make sure that her shaft is well-cared for");
	if (pc.biggestTitSize() < 4) output("; when it grows too boisterous for just your hands, you press your whole body to the shaft, giving it a handjob with your entire self.");
	else output(".");
	output("\n\nThe minutes of delicious foreplay tick on, without much deviancy from your routine, but you and [frostwyrm.name] both are appreciating the time together, to put it mildly.");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		if (flags["FROSTWYRM_KIP_COUNT"] == 1) output(" Your daughter watches on the sidelines, her own turgid erection pointed in your direction. She jerks it lightly, eking out precum to lube her hands with . Her own testicles bounce in time to nothing, ready to jet her semen onto the icy floor of the lair whenever her Qim is ready.");
		else output(" Your daughters stand in an open circle around the spectacle of their Qim and their Qal coupling; their eyes watch you and your every action, and you catch the occasional wish that it was them, and not [frostwyrm.name], that you’re enthusiastically blowing. They don’t touch each other, and instead let their " + (flags["FROSTWYRM_KIP_COUNT"] > 2 ? "siblings" : "sibling") +" give them all the fondles they need. They’re all close, but they restrain themselves, waiting to climax with their Qim.");
	}
	output(" When you feel that [frostwyrm.name] is as erect as she could possibly be, you withdraw, to admire your work.");
	output("\n\n[frostwyrm.name] eyes you curiously, wondering to herself why you have stopped and what you intend to do next. Gleefully, you tell her that <i>this</i> is what you had in mind for the final activity in your kind’s traditions. You return to your affects, which aren’t far from the bedding like they usually are, and you withdraw the three packets of food flavoring that you had obtained in Irestead.");
	output("\n\nYou tell [frostwyrm.name] that one of the true staples of the tradition is decorating. You don’t have enough material to decorate the lair, and you don’t have any symbols or objects to put any tinsel on or anything, but the next best thing is staring at you, throbbing and excited, in the face. Besides, making cute pastries is all a part of the fun. You have all the frosting you need, and you’ll be getting the batter in just a minute.");
	output("\n\nYou have three packets: red, green, and white. How will you apply them to your canvas?");

	processTime(20);
	clearMenu();
	addButton(0,"Green&White",frostwyrmXMasClimax,"green");
	addButton(1,"Red&White",frostwyrmXMasClimax,"red");
}
public function frostwyrmXMasClimax(color:String):void
{
	clearOutput();
	frostWyrmHeader();
	author("B");
	
	output("You reach for the white pack. You already have a couple ideas on how to use it, but you hesitate on the green and red packs. Thinking for a moment, you come to a decision, and reach for the "+ color +" pack.");
	output("\n\nYou look at the pink, pulsing spire of flesh before you and you visualize your creation in your mind. ");
	if (color == "green") output("It’d be mostly green, from root to crown, with the occasional, wavy, horizontal lines of white. You’re hoping to make it look like a tree, and the white lines are accumulated snow on the tree’s layering branches. It wouldn’t end in a point, like the trees do, but hopefully the image would come through easily enough.");
	else output("It’d be diagonal lines of red and white, going all the way down. You’re hoping to make it resemble a candy cane; the only thought you have is how thick you should make the lines. You’re sure whatever decision you make, it’s hardly going to come out with the familiar peppermint flavor of an actual candy cane, but you’re sure it’ll be delicious all the same.");
	output("\n\nYou get to work, opening the packs. You dip your fingers into the "+ color +" back first, and get started.");
	output("\n\nYou start at the base and make ");
	if (color == "green") output("wide swaths of green flavoring all around, front to back, and give the rod a gentle tug as you do so, for fun. [frostwyrm.name]’s haunches thrust forward at your touch, and she shivers, unfamiliar with the sensation of having the material on her sensitive bits. When the white, snowy line is finished, you dip back into the green bag and start again.");
	else output("a wide, diagonal swath of red, going around the circumference of her spire, and taking every opportunity you can to give her a gentle squeeze. [frostwyrm.name]’s haunches thrust forward at your touch, and she shivers, close to her orgasm and unfamiliar with the sensation of having such a material on her sensitive bits.");
	output("\n\nYou take your time. ");
	if (color == "green") output("Your work isn’t exactly meticulous, or a science, but it <i> is </i> taking a little longer than you thought it would.");
	else output("You get four, thick, rotating lines of red on four sides of her big dick, allowing you to finally start it all over with white.");
	output(" [frostwyrm.name] grunts occasionally, and a large bead of her draconic precum bloats her dick and splashes onto the ice, a signal of how close she is. It only inspires you to continue your casual pace; whether [frostwyrm.name] finishes before you do, you’re enjoying your bonding time with your mate.");
	output("\n\nAfter some more time, you finally finish your artistic task. [frostwyrm.name] is almost shaking with pleasure, doing her level best to keep from erupting prematurely, and your ticklish fingers and pleasurable hands aren’t exactly helping. You lean back, to appreciate your work: her cock is ");
	if (color == "green") output("coated in darker lines of green that slowly fade to white, before abruptly turning green again and starting over. It keeps going, all the way to the rim of her tip; it ends perfectly, with her rim lined with white. It’s not exactly a perfect tree, but it’s recognizable enough – and you’re sure it’s about to be the most delicious plant you’ve ever tasted.");
	else output("lined with diagonal alternating lines of red and white, going all the way from base to tip. The lines are crooked; the colors bleed and blend into each other all the way down; some lines are thicker in parts than others; but, nobody would be able to look at it and say that it at least resembles a candy cane. Now, to find out if it tastes as good as one...");
	output("\n\nYou lean back in, one hand carefully palming the sensitive head of [frostwyrm.name]’s dick to keep it steady, and you press your [pc.tongue] against the base, lapping at the flavoring you had just laid down. [frostwyrm.name] bucks forward, practically animalistic, as she feels you on her body; her rod bloats once more, and a particularly heady wad of precum audibly splashes against the ice.");
	output("\n\nYou work your way down, cleaning [frostwyrm.name] of the mess you’ve made of her. The taste of "+ (color == "red" ? "pepper" : "") +"mint thoroughly coats your tongue");
	if (color == "green") output("; it may not be a real tree, but the minty taste reminds you well enough of your nostalgic holiday treats");
	else output("; it may not be a real candy cane, but that peppermint flavor is unmistakable");
	output(". But as nostalgic as the flavor is, you’re about ready to taste something else.");
	output("\n\nIt’s a long journey, and [frostwyrm.name]’s restraint and control is incredible the entire time, but you complete your arduous task of cleaning your Qim, from root to crown. What’s before you is a slightly discolored cock, in desperate need of release, throbbing and quivering in pleasure with a pair of massive, scaly balls, bunching against her body, broiling with draconic semen to dump into the first hole that wants it. You start earnestly jerking [frostwyrm.name]’s monstrous dick, your tongue licking along the blunt head, your hungry mouth ready for her load.");
	output("\n\n[frostwyrm.name] reads your emotions loud and clear; upon your unspoken desire, she relaxes her control on her loins, and almost immediately, her thick load comes barreling up her cock. Her veins pop in concentrated effort and her tool bloats almost obscenely as her cum visibly travels down it; you barely have time to brace when it sprays from her with enough force to push you backward slightly, but notenough to knock you off-balance.");
	output("\n\nYou re-adjust yourself and continue your baptizing, lowering your head and directing [frostwyrm.name]’s cannon of a cock to douse your [pc.hair] and have her seed drip down your back. You lean backward, offering your neck, and it pulses another round against your neck, her cum dribbling down your [pc.chest] and down to your [pc.belly]. Her every wave of cum ripples underneath your hands as it comes to you. Of course, with every other load, you open your mouth, catching a mouthful of her thick cream for you to gargle before swallowing.");
	output("\n\n[frostwyrm.name]’s haunches thrust impiously through the whole thing, her turgid dick bloating and pumping again and again, depositing a large load, even by Frostwyrm standards. By the time her cum comes out as meek dribbles (and even those are rather thick, at least compared to most non - Frostwyrms), [frostwyrm.name] pants in contended exhaustion, her lungs heaving and nostrils flaring. You lean back, your [pc.skinFurScales] absolutely caked in her slimy load; your hands splash onto the icy floor and your [pc.belly] churns uncomfortably, heavy with the load inside it. You bring your fingers to your mouth and give them a suck, and you can just barely make out the residual taste of "+ (color == "red" ? "pepper" : "") +"mint.");

	processTime(20);
	clearMenu();
	addButton(0,"Next",frostwyrmXMasEnding,undefined);
}
public function frostwyrmXMasEnding():void
{
	clearOutput();
	frostWyrmHeader();
	author("B");

	output("Satisfied at a job well done, you curl yourself up against [frostwyrm.name]. You’re a wet, sticky mess"+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? " " : ", and your belly is stuffed – just like a proper holiday dinner !") +" – but you’re content.");
	output("\n\n[frostwyrm.name] shifts her massive body, curling it around you, until you’re surrounded: her massive belly behind you, her giant heart still beating a mile a minute; her legs on either side of you, curling up and against you; and her huge head, directly in front of you. Her cock, now completely spent, slowly begins receding into her body. <i>Is this an activity in your kind’s traditions as well?</i> [frostwyrm.name] asks, somewhat jokingly.");
	output("\n\nYou answer that wrapping yourself in something warm, sharing your body heat with someone, you love, and sitting in front of something warm, is all a part of the season’s activities, if not the holidays. So, yes. <i>Good. I am familiar with this activity.</i>");
	output("\n\nShe begins to purr, her throaty vibrations reverberating through you. You sit in otherwise-silence, basking in the afterglow of a holiday well-celebrated.");
	output("\n\nInspired by that thought, you break the silence to thank [frostwyrm.name]");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) {
		output(" and your " + (flags["FROSTWYRM_KIP_COUNT"] > 1 ? "daughters" : "daughter") +". They didn’t <i>have</i> to do anything, but they went with it, because they");
	}
	else output(". She didn’t <i>have</i> to do anything, but she went with it, because she");
	output(" wanted to be a part of your life and traditions. Today was a very active, special day for you, and you’ll never forget it.");
	output("\n\n");
	if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output("The symphonic purr of your clutch reverberating through the lair rises. ");
	output("Your mate leans forward, her huge face nuzzling warmly against you. <i>You are my mate, [pc.name]. I would fly to the ends of the world and back for you. You need not have gotten me any gifts; being a part of your life, as you are a part of mine, is the greatest gift I could have been bestowed.</i>");
	output("\n\nYou lay one arm across her muzzle and give her a gentle kiss on the tip of her flaring nose. "+ (silly ? "<i>“Same.”</i>" :"You couldn’t have said it better."));

	processTime(5);
	pc.lust(50);
	
	var currDate:Date = new Date();
	flags["FROSTWYRM_XMAS"] = currDate.fullYear;
	flags["FROSTWYRM_XMAS_SNOWMEN"] = 0;
	flags["FROSTWYRM_XMAS_SNOWANGELS"] = 0;
	flags["FROSTWYRM_XMAS_GIFTGIVING"] = 0;
	flags["FROSTWYRM_XMAS_CAROLING"] = 0;
	
	//B! wanted two buttons, so two buttons it is.
	var ttBody:String = "Now that you have shown [frostwyrm.name] "+ (flags["FROSTWYRM_KIP_COUNT"] != undefined ? "and your kips " : "" ) +"your holiday traditions, it is time for you to get back to adventuring."
	clearMenu();
	addButton(0,"Happy",frostwyrmMainMenu,true,"Happy Holidays!",ttBody);
	addButton(1,"Holidays!",frostwyrmMainMenu,true,"Happy Holidays!",ttBody);
}
public function frostwyrmIChangeMyMind():void
{
	clearOutput();
	frostWyrmlingHeader();
	author("B");
	
	var itsNykke:Boolean = false;
	if (flags["NYKKE_VERSION"] == 1) itsNykke = true;
	
	if (flags["FROSTWYRM_INCEST_OPTION"] == undefined) flags["FROSTWYRM_INCEST_OPTION"] = 0;
	
	output("You nudge at " + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "your eldest kip") + ", getting her attention. <i>“Yes, my Qal?”</i> she says attentively, her eyes locking onto yours. You get the feeling that she already knows what you’re going to talk about.");
	if (flags["FROSTWYRM_INCEST_OPTION"] == 1) output("\n\nYou’re currently choosing to participate in the Frostwyrm tradition of ‘inner circle coupling.’ In other words, you’re consciously choosing to have sex with your daughters. Are you going to change your stance on this and opt out?");
	else output("\n\nYou’re currently choosing not to participate in the Frostwyrn tradition of ‘inner circle coupling.’ In other words, you’re consciously choosing to not have sex with your daughters. Are you going to change your stance on this and opt in?");
	
	processTime(2);
	clearMenu();
	addButton(0, "No", frostwyrmIDontChangeMyMind, undefined);
	addButton(1, "Yes", frostwyrmYesIDoChangeMyMind, undefined);
}

public function frostwyrmIDontChangeMyMind():void
{
	clearOutput();
	frostWyrmlingHeader();
	author("B");	
	
	var itsNykke:Boolean = false;
	if (flags["NYKKE_VERSION"] == 1) itsNykke = true;
	
	output("You tell " + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "your eldest kip") + " that it’s nothing, and for her to never mind herself.");
	output("\n\n<i>“Okay, my Qal, if you say so,”</i> she says, lowering her head and resuming her platonic snuggling against you.");
	
	clearMenu();
	addButton(0, "Next", frostwyrmlingTalkMenu, undefined);
}
public function frostwyrmYesIDoChangeMyMind():void
{
	clearOutput();
	frostWyrmlingHeader();
	author("B");
	
	var itsNykke:Boolean = false;
	if (flags["NYKKE_VERSION"] == 1) itsNykke = true;
	
	if (flags["FROSTWYRM_INCEST_OPTION"] == 0)
	{
		output("You tell " + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "your eldest kip") + " that you’ve changed your mind: it feels inappropriate to be surrounded by Frostwyrms, in a Frostwyrm lair, and not be a part of their traditions. You’d like your family to include you in their future ‘inner circle couplings.’");
		output("\n\nHer eyes gleam with joy, and her mouth splits into a wide, excited grin - but, then, the corners crook upward slightly, making her look almost devilish and predatory. <i>“I was hoping you’d change your mind, my Qal,”</i> she says lasciviously, her long, flat tongue snaking out to lick at her chops. <i>“I’ll make sure you won’t regret it.”</i>");
		output("\n\nFrom the way she eyes you like a piece of meat, you’re not sure if you should be worried or aroused.");
	}
	else{
		output("You tell " + (flags["NYKKE_MET"] != undefined && itsNykke ? "Nykke" : "your eldest kip") + " that, as much as you enjoyed participating in the Frostwyrm tradition of ‘inner circle coupling’ up until this point, you think you need a bit of a break from it, and to not include you in the act for the time being.");
		output("\n\n<i>“Aw,”</i> she pouts, her hand snaking its way up your [pc.chest]. <i>“Can I not convince you to stay, my Qal?”</i> You tell her that you’ve made up your mind, and, with some authority, you tell her to respect the decision of her Qal.");
		output("\n\n<i>“Alright, then, if you say so.”</i> Her hand stops its questing up your body, and she resumes her platonic snuggling up against you. <i>“Be sure to let me know if you change your mind, of course.”</i>");
	}
	
	clearMenu();
	if (flags["FROSTWYRM_INCEST_OPTION"] == 0)
	{
		flags["FROSTWYRM_INCEST_OPTION"] = 1;
		addButton(0, "Next", frostwyrmlingTalkMenu, undefined);
	}
	else
	{
		flags["FROSTWYRM_INCEST_OPTION"] = 0;
		addButton(0, "Next", frostwyrmlingTalkMenu, undefined);
	}
}

public function frostwyrmlingSexMenu():void
{
	clearOutput();
	frostWyrmlingHeader();
	author("B");
	
	if (!pc.lust() > 50){
		output("As you sit, your back to [frostwyrm.name]’s belly and with Nykke curled and cuddled up against you, you start to feel a little... randy. Pent - up, even; like you could really go for a good fucking.");
		if(pc.hasGenitals()) {
			output(" Y");
			if (pc.hasCock()) output("our [pc.cock], at first somewhat flaccid and limp, quickly fills with your blood unabated, pointing like a dowsing rod in a desert towards the nearest, warm, wet and willing oasis");
			if (pc.isHerm()) output(". Not only that, y");
			if (pc.hasVagina()) output("our [pc.vagina] soaks itself without any provocation; where you were first dry and un - stimulated, you’re now salivating, like a starving woman shown a prime, juicy hot dog: the longer and fatter, the better");
			output(".");
		}
		output("\n\nYou’re snapped out of your sudden, lust-fueled daydreaming by your daughter’s hand snaking its way down your [pc.belly], her open palm playing with the [pc.skinFurScales] of your abs before dipping and playing with your [pc.crotch], her fingers toying with what she’s found there. <i>“Come on, my Qal,”</i> she husks into your ear, her tongue lapping at the salt on your neck, <i>“have some fun with your kips.”</i>");
		output("\n\nYou’ve already agreed to participate in the Frostwyrm traditions, and you consent. Victoriously, she stands up, grabbing you by the wrist, and hauls you away from [frostwyrm.name], exposing you to the lair and the rest of your clutch. <i>“Our Qal is in the mood for playtime, girls!”</i> she shouts as you land among your kips, their strong hands catching and groping you. <i>“Let’s show our Qal how much [pc.hisHer] kips love [pc.himHer]!”</i>");
	}
	else{
		output("As you sit, your back against the soft, pliable scales of [frostwyrm.name]’s belly scales and the warm body of your daughter curled up against you, you’re reminded of just how in-the-mood you are right now.");
		if(pc.hasGenitals()) {
			output(" Y");
			if (pc.hasCock()) output("our [pc.cock] is hard as a rock and ready to jump into the first mouth, cooch, or ass, that’s made available to you");
			if (pc.isHerm()) output(", while y");
			if (pc.hasVagina()) output("our [pc.vagina] clenches at nothing, imagining it’s casually getting railed by the closest, thick dick or pair of fingers or wriggling tongue it can find");
			output(".");
		}
		output(" You think to yourself that maybe you shouldn’t be having these thoughts so close to your daughter – and now that you’ve thought of your daughter, you’re thinking of doing those things <i>to</i> your daughter.");
		output("\n\nYou’re startled when Nykke grinds her body against you, her huge, F-cup breasts squishing against you, her pebbly-hard nipples pressing against your flesh as she pulls in and lavishes your neck with a long, thick swipe of her tongue. <i>“Our connection may not be as refined as our Qim’s, my Qal,”</i> she whispers, <i>“but with emotions as strong as yours, I can tell that you’re feeling particularly... needy. Just say the word, my Qal, and we can celebrate the union of our clutch with our inner circle coupling.”</i>");
		output("\n\nYour emotions are feeding into Nykke, and they’ll be spilling out into the rest of the clutch unchecked if you don’t do something soon. You’ve already agreed to participate in the tradition of the Frostwyrms - you consent to your kip’s invitation.");
		output("\n\nAs soon as the words leave you, she stands, her hand on your wrist, and with her surprising Frostwyrm strength, she hauls you up and throws you into your awaiting throng of Frostwyrm hybrids below. <i>“You heard [pc.himHer], girls,”</i> your eldest says, sashaying her hips as she walks towards you, her bulging penile vent and massive testicles swaying with her every step. <i>“[pc.HeShe] wants to spend some quality time with us. We’d better not disappoint our Qal.”</i>");
	}	
	
	clearMenu();
	processTime(5);
	if (pc.hasCock()) addButton(0, "Breed Them", frostwyrmlingPitchGangbang, undefined);
	else addDisabledButton(0, "Breed Them", "Breed Them", "You need a penis for this.");
	if (pc.hasVagina()) addButton(1, "Get Bred", frostwyrmlingCatchGangbang, undefined);
	else addDisabledButton(1, "Get Bred", "Get Bred", "You need a vagina for this.");
	addButton(2, "Bath Time", frostwyrmlingBathing, undefined);
	addButton(3, "Blow Them", frostwyrmGiveThemABath, undefined);
	//addButton(14, "Back", frostwyrmBunchaKiddoContent, undefined);
}
public function frostwyrmlingCatchGangbang():void
{
	clearOutput();
	frostWyrmlingHeader();
	author("B");
	
	var vIdx:int = -1;
	if(pc.hasVagina() && pc.blockedVaginas() == 0){
		vIdx = pc.findEmptyPregnancySlot(1);
		if(vIdx < 0) vIdx = rand(pc.totalVaginas());
	}
	
	output("One kip hooks both her arms beneath your armpits, locking you against her, and falls backwards, bringing you both down. You crash to the ice, your fall broken by your huge, muscular offspring, your head landing squarely between her two huge breasts. When she shifts her weight slightly, you feel the bulge of her penile vent and the gentle scraping of her cock’s blunt, flat head, worming its way between your buttcheeks and pressing hotly against your [pc.asshole].");
	output("\n\nJoining you is Nykke, gracefully laying herself atop you, her own mountainous F-cups resting against your [pc.chest]. Her eyes lock onto yours lustfully; she licks her lips before kissing yours, her tongue snaking out and invading your mouth. She hums in delight as she tastes you and your tongue; her hand reaches behind your head to keep you in place until she’s counted each of your teeth several times over.");
	output("\n\nThe kip beneath you frots against you, her dick growing all the while, inflating slowly against your warm body, driving itself deeper and deeper into the cleavage of your ass. You hear footsteps, and you and Nykke are joined by a third; her tall, muscular legs spread apart and her draconian testicles dangling above you, quivering with seed. She palms gently at her own vent, massaging her cock through her scales as it too grows in length, a drip of pearly pre-cum forming at the tip.");
	output("\n\nNykke");
	if (pc.isLactating()) output(" pulls backward, demonstrating her alien biology as her lips go to your [pc.chest], pursing and suckling at your [pc.nipples] to wean out a few mouthfuls of your [pc.milk], all the while her tongue continues to molest yours. After tending to one nipple, she leans to the other, sucking out another few mouthfuls, relieving the tension in your boobs. When she’s finally had her fill, she");
	output(" leans back, her tongue staying in your mouth as she does; it extends comically far from her, the long, pink appendage shaking and shivering in your mouth and in the air. She pulls out just enough so that her tip can draw a long trace along your [pc.lips], then, suddenly, she withdraws it all with a long, exaggerated slurp, taking care to lick her own lips for effect.");
	output("\n\n<i>“By the Grand Qim, is mating with you fun, my Qal,”</i> she huffs. She humps her hips forward, her own pink dick already halfway out and her pouty cunt drooling lanes of slime across your [pc.belly]. <i>“I’m kinda jealous, you know. Who wouldn’t love to be underneath a pile of horny dragons whenever they wanted? Nobody in the world but you can have as much Frostwyrm dick as they want, whenever they want it.”</i> She slides backward a bit, until you feel her testicles");
	if (pc.hasCock()) output(" first hotdog your [pc.cock], and then");
	output(" rest against your hot, needy [pc.vagina]. She knows exactly what your body needs, and, with her dick already massive and ready, she lines up her shot into you, ready to properly seed her Qal. With her psionics, she reaches out to the horde to truly begin the ceremony: <i>Let’s have some fun, girls!</i>");
	output("\n\nSuddenly, your body is invaded by the hot, thick, turgid flesh of your kips: the one beneath you thrusts upward, burying herself to the ever-inflating knot of her dick; the one above you bends at the knees and tucks herself into your warmed-up mouth, thrusting deep enough to nudge at your soft palette; and Nykke thrusts forward, her dick spearing into you, conforming you around herself. You fit her like a glove, like you were biologically designed for her and her alone, and the ride is only going to get better.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 5) output(" Your other kips stand in a circle around you four; many of them play with themselves, while the more charitable of your kips assist the others, giving their siblings handjobs and some of them even getting on their knees to fluff their sisters in preparation for their turn.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 11) output(" Even others, deciding that you’re going to be busy for some time and not wanting to add more to your plate, turn their attention to their Qim, tending to her and prepping her to properly mate her kips as well.");
	output("\n\nThe kip beneath you, drilling your [pc.ass], is far more gentle and methodical than her sisters; she knows how sensitive and tender a good reaming can make anyone, and takes her time, allowing your body to get used to her girth before pushing forward and forcing you to readjust yourself, especially since she’s double-teaming you with her older sister, pushing your body to its limit. Whereas the kip in your mouth is rather <i>enthusiastic:</i> her hands clamp onto either side of your head and fucks your mouth, not cruelly, but without much finesse or direction or thought for your own pleasure. Her dense balls clap you on the forehead every time she pushes in, and her big dick sometimes drives a little too deep, making you gag until her backswing.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 4) output("\n\nGentle hands find yours, holding and squeezing them tenderly and lovingly, before they too are replaced with yet more cockflesh, their slimy textures greasing your fingers and their precum jetting from their tips and up your wrists. You gently close your hands, simulating a pocket for them to fuck, and your kips start thrusting into your palms, taking your unspoken invitation gladly.");
	output("\n\nThe most in-tune with your body, however, is Nykke, currently pounding away at your [pc.vagina]. She occasionally grunts, sometimes coming out as a snort, whenever her thick knot presses against your vulva; she doesn’t try to push in deeper or harder, knowing that you’ll have her when you’re ready. She doesn’t take you too hard or soft; she doesn’t go too fast or slow, even if that means moving off-rhythm with her sister pounding your [pc.ass]. Your every subconscious feeling and desire is met with your loving kip; to show your appreciation, you wrap your [pc.legs] around her waist, locking just above her massive, thick tail, and hold her close.");
	output("\n\n<i>“Yeah, being the Qal of a clutch must be the best,”</i> she says, her voice stuttering with her rocking hips. <i>“It’s just you; the Qim; and all your kips, and every single one of them wants a piece of you all the time. I know I count down the Skylight until I can couple with you again, my Qal.”</i> She then raises her voice: <i>“What do you think, girls? How badly do you want to cum inside your Qal?”</i>");
	output("\n\nNone of them answer verbally: instead, your mind is assaulted with a cacophony of images and emotions, all related to the same thing. Some images have you on your knees, gratefully taking one kip in your mouth. Some images have you bent forward, your [pc.ass] raised, as another kip fucks your ass without a care in the world for your own pleasure. Some images have your hands and wrists bound to the ice, while another kip jerks herself off above you, painting your body with her seed");
	if (silly) output(". Some particularly deviant images involve you and one of your kips, dressed in her Sunday best, sitting somewhere warm and secluded, your hands gently grasped together while you watch a far - off sun sink into the horizon");
	output(". But they each also involve a similar theme: it’s only you and one of them. They all want you to themselves.");
	
	var ppFrostwyrmling:PregnancyPlaceholder = getFrostwyrmlingPregContainer();
	if(vIdx >= 0) pc.cuntChange(vIdx, ppFrostwyrmling.cockVolume(0));
	pc.buttChange(ppFrostwyrmling.cockVolume(0));
	
	output("\n\nBetween the dick in your ass, the cock in your mouth, and the one fucking you properly, claiming your cunt for itself, the sensations build up quickly and your orgasm isn’t far off. But, as it builds, you feel the edge that it needs to cross to give you release back away; no matter how close you get, the tipping point continues to elude you.");
	output("\n\n<i>It wouldn’t be right to cum before your kips, don’t you think, my Qal?</i> you hear Nykke say to your mind. You crane your head just enough to look her in the eye – a bit of a taxing effort, considering the dick in your mouth – and hers are already on yours, narrowed, her lips curling into a sassy smirk. <i>A good Qal would put the needs of the clutch before" + pc.mf ("himself","herself") + ". Don’t you want to be a </i>good<i> [pc.boyGirl] and make sure your kips get what they </i>need<i> before you?</i> ");
	if (pc.hasCock()) output("She gently palms at your [pc.cock], begging for some attention, <i>any</i> attention, but she doesn’t go any further than that. <i>Be a good enough Qal, and we can look into taking care of this juicy thing for you next time.</i>");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 12){
		output("\n\nShe looks upward, towards the icy platform that is [frostwyrm.name]’s resting place. You follow her gaze, between your kip’s legs, and see the inverted image of three of your kips tending to their Qim: one on her hands and knees, beneath [frostwyrm.name]’s belly, and the other two fondling her huge balls and guiding her titanic cock into their willing sister. <i>See? [frostwyrm.name] understands. The needs of her kips are what’s important. She’s going to fuck her kip until she cums, and then another one of us is going to replace her until there’s nobody left for [frostwyrm.name] to breed. Don’t you want to be responsible like her?</i>");
		if (!pc.isBimbo()) output("\n\nYou mentally scold your kip. To her, [frostwyrm.name] is not [frostwyrm.name]; she is the Qim, and she should respect her Qim by referring to her as such.");
		else output("\n\nYou’re all for a good orgy, and this has been some of the most fun and, like, totally exciting... uh, fun, you’ve ever had. She can call you what she likes - sometimes you even like being called a cheap slut or a dirty whore, and the fact that she’s your kip kinda makes it even hotter - but [frostwyrm.name] deserves to be called what she is, and that is her Qim.");
		output("<i>Right,</i> she says, the mirth plain in her mental tone, <i>sorry, my Qal.</i>");
	}
	output("\n\nAlready, the sensation is torturous: to be so close to release and have release elude you constantly. Like water overflowing a dam, the results are going to be monumental once the dam finally breaks: Nykke couldn’t be more lubricated, with the feminine juices you’re coating her blunt dick with , and you’re ready to squirt a fountain as soon as she releases her damnable block on you[if (pc.isHerm()). And, just northward, ");
	if (pc.hasCock()) output("your [pc.cock] stands tall and hard as diamonds, unappreciated and ignored. You’re at the point where the faintest wisp of your kip’s breath on your skin would set you off, if it weren’t for the block she has on your orgasm");
	output(". And she knows it: she’s reading your every thought, emotion, and expression, delighting in the control she has over you while her and her sisters have their way.");
	output("\n\nAs time goes on, your kips grow more and more frantic, allowing their own orgasms to continue unimpeded. The one in your mouth is closest: hot little spurts of precum layer your mouth, and she batters her heavy knot against your [pc.lips] more forcefully than usual. The scales on her balls grow tighter against your forehead, and the testicles themselves begin to flex and pull up against her body. She’s on the verge, and in just another few pumps–");
	output("\n\nHer hands on your head grow tight, and you flinch as her sharp claws drag slightly against your [pc.skinFurScales], but she retains some control. She doesn’t try to knot your mouth, thankfully");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 4) output(" – if your hands weren’t occupied, you’d lock them behind her knot, to give her all the more stimulation");
	output(", as her dick begins to flex and bloat along your tongue. So close to her balls, you hear them gurgle as they unload into your throat, feeding you your impromptu dinner.");
	output("\n\nYour emotions are suddenly flooded with the ease of tension that accompanies an orgasm, and the overstimulation and relief that includes. And when you feel it, you know that the rest of your clutch feels it, too, ushering them all towards their own orgasms.");
	output("\n\nThe kip you’ve been laying on this whole time, using her as a cushion: her breathing speeds up and deepens, her heart rate accelerating wildly, and her hips driving, battering your poor [pc.asshole] with her knot until it finally gives, locking you to each other. She pulls her lips up to your ear, nibbling on it with just her lips, and grunting wantonly, her breath washing down your chest through her nostrils. Your [pc.belly] tightens suddenly as your body is flooded with draconic semen; you feel every pulse radiate up her cock before it warmly explodes inside you, and it continues without any sign of waning for some time.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 5) output("\n\nThe rest of your uninitiated clutch watch on, the emotions washing over them and effecting them visibly; the charitable ones giving handjobs and blowjobs have to stop, knowing that they’re all very vulnerable, and too much stimulation would ruin the opportunity they’ve all been waiting for . Precum flows in long, unattended strands, pooling onto the ice and streaming towards your prone form; a mere teaser of what’s to come");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 11) output(". Making things even harder is that [frostwyrm.name] has no such reservations, and the sensation of her orgasm – followed by the orgasm of the kip she’s breeding – overpower all others, mixing into the whirling stew of lustful emotions and incentivizing everyone within the lair to achieve their own.");
	output("\n\nDespite all that, the one kip that you want to cum the most is the one riding you. Sensing the orgasm of your kips, but unable to reach your own, causes your willpower to bend and fracture; you’re on the verge of tears over how good it <i>does</i> feel, but also, how good it <i>could</i> feel. And Nykke, for her part, is struggling to maintain herself: her own thrusting is growing haphazard and haggard, ready to blow, but she’s holding back.");
	output("\n\n<i>I want you,</i> she states, her [baby.eyeColor] eyes fiercely focused on yours. <i>I want you more than any of my sisters. I want your kips. I want to take you as my mate and breed with you until the Grand Qim calls for us.</i> You figured it’d be difficult to focus on her, considering the emotions raiding your mind and the cum filling your body from both ends, but your focus is unusually undivided on Nykke. <i>Tell me that you want me too. You’d have me as your Qim if you weren’t already taken. Tell me about all the kips we’d have together, and I’ll let you cum.</i>");
	output("\n\nWith your hands figuratively tied, you answer to her demands, and tell her that she’s the strongest, most attractive, and most desirable of all the Frostwyrmlings. You tell her that, in a different world, you’d have submitted to her on a whim, and you’d have enough kips to populate a world. There wouldn’t be a day in your life that you wouldn’t pleasure her and add to your clutch; you’d have her in every hole, every position, every day, to take her every load, and then you’d start again the next day.");
	output("\n\nYou and Nykke orgasm simultaneously as soon as you think the thoughts. With another, herculean push, you’re inexorably tied at the knot with her, and the one place you wanted cum the most is suddenly quenched with a veritable torrent of draconic cum. Her load is second only to [frostwyrm.name]’s");
	if (pc.cumQ() > 1000) output("and your own");
	output(": it floods your tunnel and bloats your womb, seeding your parched eggs with herself, and when you can’t handle any more, it all washes back, squirting from the seal between you and her in long rivulets. Your [pc.vagina] clamps down, desperate to hold in every last drop, and failing as it quivers and spasms in orgasm; your juices squirt out with hers, splashing against her tight stomach and abs, adding to the mess. ");
	if (pc.hasCock()) output("\n\nAnd, to add to the festivities, your [pc.cock] contributes to the growing wet mess that is your cum - bloated body: you’re immediately soaked in yourself from the belly down, your [pc.cum] dripping between your body and you’re kip’s uselessly");
	if (pc.cumQ() > 1000) output(". It pulls and splashes with every thrust your anal - locked kip makes against you, adding wet slaps to the symphony of wet squelches and moist thrusting");
	output(".");
	output("\n\nYou pant through your nose in delighted exhaustion: it was everything you had hoped it would be. You’re full up on delicious, thick cum and you’ve achieved the orgasm you had been hurting after for the past ten minutes. You sigh, the wind bouncing off your kip’s balls and blowing back into your face; she giggles insensately as your breath tickles her.");
	output("\n\nOne by one, your kips withdraw from you");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 4) output("; although half - conscious, you note that the kips you had been giving handjobs to hadn’t added their own ambrosia to the mix, and their cocks are harder than ever, their knots bloating obscenely at their base");
	output(". It takes some time before your eldest kip and the kip beneath you grow soft enough to pull out, and when they do, their loads gush back onto them, coating their own crotches with their spent seed.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 5){
		output("\n\nOf course, now that they’ve all had <i>their</i> turns, they’re practically shoved aside by your other kips, all rowdy and ready for their own turn with their Qal. The one fucking your throat stands up and moves aside, and soon you’re eye-to-‘eye’ with a hard, pulsing, dry dick, pointed right between your [pc.lips], and a pair of heavy, dense balls rest against your forehead. You’re hardly even aware of the kip beneath you gently shuffling out and being replaced, another big dick frotting your cheeks, ready for its turn inside your [pc.ass].");
		output("\n\nYou lick your [pc.lips]. A good Qal wouldn’t leave their clutch wanting, after all....");
	}
	
	processTime(3 * 60);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if(vIdx >= 0) pc.loadInCunt(ppFrostwyrmling, vIdx);
	pc.loadInAss(ppFrostwyrmling);
	pc.loadInMouth(ppFrostwyrmling);
	pc.applyCumSoaked();
	
	clearMenu();
	addButton(0, "Next", frostwyrmGoodGodImHurtAgain, undefined);
}
public function frostwyrmlingPitchGangbang():void
{
	clearOutput();
	frostWyrmlingHeader();
	author("B");
	
	output("At the mercy of your clutch, you feel their hands roam over your body wantonly, grasping and squeezing at various, fleshy parts of you. Their bodies are covered in tough scales, and the softer parts of their bodies, where they have skin, is still much more resilient than your own. The way that your body stretches slightly and the way the fattier parts of you jiggle when grasped or prodded in just the right way is endlessly amusing and, in some ways, seductive to your kips.");
	output("\n\nThey demonstrate just how much your body turns them on by leaning in and kissing at you; their lips pucker and press against your vulnerable flesh, then their long, fat tongues snake out to lick and taste the spot they just pressed at before moving on to a different area. Your body reacts differently to every new location, and the message is conveyed through their psionic link with you.");
	output("\n\nParticularly, when they assault your [pc.nipples] with their questing lips and tongues, the spike in lust sent through their connection doesn’t go unnoticed, and they lather your [pc.chest] with their saliva");
	if (pc.isLactating()) output("; when they taste your [pc.milk], they home onto it like bees to honey, massaging out every last drop of your nectar for their thirsty mouths");
	output(". When they kiss at your neck, your response is to lean into it, and they continue. When they fondle at your [pc.crotch], tugging at your [pc.cock] to its full wakefulness – they continue.");
	output("\n\nYour kips, including Nykke, make their way to their knees, slurping and kissing at your rod, bathing it in a strictly non - platonic way");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 3) output("; at no point are you left alone above the waist, and now that their attention’s been diverted to between your legs, another of your kips lunges forward, burying her tongue in your mouth greedily");
	output(". Your [pc.cock] was already half - mast when you had started, and now that it’s lodged firmly in the maw of Nykke");
	if (pc.balls > 0) output(", while two more kips lovingly suckle at your [pc.balls]");
	else output(", while two more kips lovingly kiss at your thighs and asscheeks");
	output(", it takes little time and effort to get you truly prepared.");
	output("\n\nEach of your kips focus their attention on you and your body, and the myriad of ways that it reacts to being pleasured, but Nykke, with her mouth full of your cock, focuses her [baby.eyeColor] eyes purely on your own. Your mind is inundated with so many kips providing you with so much lust, it’s difficult to focus on any of them, but Nykke, with her psionics being more developed than the rest, stands out like a torch next to a candle. And if her own thoughts and emotions are anything to go by, she’s probably going to fuck you the most today.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 5)
		output("\n\nNo part of your body is left alone: you have more than enough attention at your [pc.crotch], but your clutch sees to it that your [pc.chest] is not left to the cold air of the lair");
		if (pc.hasVagina()) output(", and at least one thoughtful kip of yours shows herself to your rear, tilting her head slightly and slipping her enormous, flat tongue into your [pc.vagina], causing your knees to buckle");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 11) output(". That said, you only have so much ‘surface area’ to cover; seeing that you’re decidedly occupied, some of your kips decide to leave the action, and instead turn to their Qim for their pleasure. After all, [frostwyrm.name] has a perfectly viable pussy of her own to plunder. A Qim’s duty to her clutch is never over");
	output(".");
	output("\n\nAt that, she pulls back, pursing her lips at your [pc.cockHead] and giving it an exaggerated kiss before pulling back with a small ‘pop,’ barely audible compared to the slurping her sisters are making on your [pc.skinFurScales]. <i>“Being the Qal of a clutch must be an amazing position,”</i> she says, one hand gently stroking you to keep you hard and steady. <i>“You have such a large clutch, just </i>waiting<i> for you to say the word, and they’d drop everything and spread their legs for you. A good Qal’s life is full of inner-circle coupling. I can’t wait to be the Qal of my own clutch.”</i>");
	output("\n\nHer eyes stay on yours. <i>Or the Qim,</i> she finishes, licking her lips.");
	output("\n\nTo your surprise, Nykke doesn’t take you first: instead, she reaches to one of her siblings and taps them on the shoulder. When she has her attention, your eldest pulls her closer, until your [pc.cock] is in front of her sister’s nose. Then, they sloppily kiss, your dick in between them; you feel their tongues slide over your sensitive tool before gliding into the mouth of their sibling.");
	output("\n\n<i>“You go first,”</i> Nykke tells her sibling with a wink. Overjoyed, your younger kip kisses your cock again, and shuffles forward, on her hands and knees; she lifts her tail high and arches it over her back, revealing her puckered anus and, just beneath that, the real treasure: her soaking wet cunt, lubricated and ready for you to work it over.");
	output("\n\nOnce your hands rest at the muscled thighs of your kip, you feel a number of emotions come over you, all fed to you from the girl you’re about to mate with. Lust, of course, but there’s also apprehension – she hopes she’s a good fuck, maybe even good enough for her to be your favorite. You feel excitement – you’re her <i>Qal,</i> of all the potential mates! You’re the most perfect, eligible, virile mate she knows, and you’re about to fuck her! And, unexpectedly, you feel jealousy – she wants you to herself, and her sisters are ruining what is supposed to be a perfect moment for her. In fact, when you focus, you feel just a little bit of it from each of them. Not enough to sour the mood, but... enough.");
	output("\n\nBut, you quickly feel another emotion: impatience, and not just from the girl leaning over. Frustrated by your inaction, another of your girls grips you by the [pc.base], rubbing your [pc.cockHead] first against the ring of her sister’s asshole, rimming the sensitive flesh there with your tool, making you and your kip both believe that this act would end a little differently than you imagined – then, the guiding hand shifts, aligning you against her velvety, wet tunnel, and Nykke slaps your ass, causing you to buck forward in surprise, thrusting yourself into her body. Once you’re there, instinct kicks in, and you begin to thrust.");
	output("\n\nYour kip bends forward more, her shoulders against the ice of the lair, and hisses a long ‘yes’ at finally having her Qal inside her. She bucks back with her strong, imposing legs, her massive, muscled ass clapping against your body with each push; ");
	if (pc.biggestCockLength() <= 9) output("although her body conforms perfectly to and around yours, you can’t help but feel a bit inadequate: compared to the dicks your kips openly swing around, and especially to [frostwyrm.name], you’re a bit lacking, and you wonder if your kip can tell the difference");
	if (pc.biggestCockLength() >= 10) output("you and her both grunt in animalistic pleasure whenever you bottom out inside her. She’s tight, wonderfully so, but despite your immensity, at no point does it ever feel uncomfortable, and you don’t sense any discomfort over your psionic link. Her wet, elastic, alien Frostwyrm biology allows her to take any insertion available");
	if (pc.biggestCockLength() >= 30) output(", even one as astronomically large as your own.");
	output("\n\nYou feel the fingers of Nykke lightly pad their way to your front, tickling and massaging at your [pc.belly] as she rounds around you. Her eyes flit to yours, half - lidded in lust; her other hand is between her legs, brushing past her rock - hard dick and busying themselves with her cunt, playing with her nub and slickening them with her juices. Without any provocation, the hand on your belly goes to her sister’s upraised tail, keeping it in place, and she leans in, drawing her long, pink tongue all the way from the meeting of your [pc.cock] and your kip’s quim, up to her sister’s asshole.");
	output("\n\nFrom there, you feel a different sensation entirely: another pair of hands, from your third kip, as she grips onto your [pc.hips] from behind. She leans in, her hot breath pouring down your neck, and you feel her own prick hotdog itself between your [pc.ass]. It’s at full mast, but you have the inclination that it’s only going to get bigger – especially when she thrusts forward, burying herself to her scales of her pelvis, into your [pc.asshole]");
	if (pc.hasVagina()) output(", leaving your poor [pc.vagina] neglected and cold");
	output(".");
	
	pc.cockChange();
	
	output("\n\nAnd that’s the rhythm that you settle into for the moment: you fuck her into the ice while Nykke stimulates you both, and each time you pull back to thrust again, your third kip pushes deeper into you. ");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 4){
		output("\n\nAt some point, a fourth kip joins you three, crawling between your [pc.legs] and shoving her sniffling nose up to your [pc.crotch]; when she finds the base of your dick, she starts servicing you there");
		if (pc.balls > 0) output(", taking your [pc.balls] into her mouth juggling them in there – being extra careful with her jagged teeth, of course");
		output(". It’s difficult for her to stay in place, considering you thrusting forward and her sister bouncing back, but she’s dexterous, and she doesn’t mind at all. Her Qal’s pleasure is important to her, too.");
	}
	output("\n\nYou can tell over your psionic connection that the Frostwyrmling you’re fucking is about to go over; she’s barely cognizant of her surroundings and has immersed herself in the coming avalanche of sensations and emotions that come with every orgasm, and the fact that she’s getting it from her Qal has changed the whole game. The feedback loop caused from your kip’s impending orgasm spurs your own, and the attention you’re getting from your offspring is pushing you towards the edge. With a few more thrusts, your kip breaths sharply, through clenched teeth, and you feel her cum. It’s only right, as the Qal, that you give her the seed that she wants....");
	output("\n\nYet, it doesn’t happen. You can feel it bubbling inside you, just where your [pc.cock] meets your [pc.balls] – but no matter how many times you thrust; no matter how many times your kip cries into the lair in pleasure as her pussy spasms and milks you; no matter how badly you both want it, your orgasm never happens. You pound into her relentlessly, your primal brain hoping that the motion and the likewise-frantic pounding you’re getting against your prostate would somehow dislodge your orgasm, yet, nothing.");
	output("\n\n<i>Listen to her squeal,</i> a voice says in your head. You look down; Nykke stares back at you, with hungry, devious eyes, her tongue still making lazy strokes between your dick up to her sister’s asshole, collecting the strands of pussy juice that cling to your tool on every backswing. <i>By the Grand Qim, she’s cumming up a storm, isn’t she? She can barely contain herself.</i>");
	output("\n\nBeneath her body, you see a pearly white pool beginning to form: you’ve pleasured her feminine half so much that her masculine half is jetting strands of cum completely uninhibited. <i>She’d love nothing more than to bear your kips, our Qal,</i> she continues. <i>We all would. You’re the perfect, most ideal mate in the lair; even more than [frostwyrm.name].</i> She leans in and plants a kiss on your pelvis. <i>But I’m a bad kip, my Qal. I want all your cum for myself. If any of us is going to bear your young, it’s going to be me.</i>");
	output("\n\nApparently agreeing with her older sibling, the kip pounding into your [pc.asshole] thrusts forward a few more times, then unloads; she takes care to not knot you, knowing that you have a busy few hours ahead of you and she doesn’t want to impede you. Still, the feel of her hot, thick cum flooding your bowels and packing up against your prostate is all the more stimulation to spur you forward and achieve your own, long - awaited - at - this - point orgasm. She pulls back, leaving you open and dripping in the cold air, you doubt you’ll remain that way for much longer.");
	output("\n\nShe barely waits for her younger sister to be finished her quivering orgasm before she grabs her by the ass with both hands, spanking each cheek hard, and practically yanking her off your own straining dick. <i>“My turn!”</i> she announces to the room, taking her sister’s place: rather than lay on her front, she lays on her back, spreading her legs and pulling back her balls to reveal her blue-skinned, sodden pussy.");
	output("\n\n<i>I want to look you in the eyes,</i> she says as she crooks her finger to you, Nykke beckoning you to mate with her. <i>Mate with your Qer of a kip, and punish her by giving her all your kips. Satisfy her, and she’ll let you cum.</i> ");
	if (pc.hasVagina()) output("\n\nYou feel her long, thick, serpentine tail bend upwards, the thick of it brushing against your [pc.vagina], neglected and cold. <i>Give me the kips I need, and I’ll see to it that I return the favor next time.");
	if (!pc.isBimbo()) output("\n\nYou’re her parent, and you need to maintain some semblance of control, here. Although you have no intention of denying her, and you fall to your knees to properly position yourself, you chastise her: to her, [frostwyrm.name] is her Qim, and [frostwyrm.name] must be respected and addressed as such.");
	else output("\n\nYou don’t mind the occasional dirty word - hell, sometimes, you kinda like it when people treat you dirty when you’re getting fucked - but you put your foot down as a good parent and tell your kip that [frostwyrm.name] has been nothing less than perfect, and if your kip really needs to feel powerful and sexy by disrespecting one of her parents, it’s going to be you.");
	output("\n\n<i>Of course,</i> she grins, rocking her hips upward, <i>my mistake, my Qal.</i>");
	output("\n\nWith that settled, you don’t have many other options but to give her what she wants: a good, hard dicking from her Qal. You grab her by the undersides of her knees for stability, and you start thrusting as hard as you can, as quickly as you can. You have a primeval need to cum that hasn’t been met, and won’t be met until your kip releases her damned hold on your psyche, and if the only way to get her to release you is to pound her into the ice, then you’re sure as shit going to do it.");
	output("\n\nYour kip arches her back and raises her hips, her breathing coming out in choked laughs of ecstasy as you claim her cunt for yourself. <i>“Yes!”</i> she shouts, letting the whole clutch know just how supremely you’re pleasuring her. <i>“F-fuck me! Fuck your kip!”</i> Her hands pull at her nipples and her gargantuan wings flex; she doesn’t have much more control over her body than you do yours.");
	output("\n\nShe gets everything that she wants: her Qal to breed her, and to look you in the eyes while you do it. You’re flooded with a hurricane of emotions: pure lust, and a bit of sexual aggression, but also adoration and even a bit of reverence: to mate with you is the end-goal of every kip in your clutch, but for Nykke, it’s something more; an emotion that burrows deeper than just attraction and lust, and something more than platonic and even romantic love. When you focus your eyes on hers, the rest of the lair seems to fade away, until it’s only you two.");
	output("\n\n<i>I know you feel it, too,</i> she says to you over your connection. <i>If you weren’t already claimed by the Qim, I’d have you all to myself at the first word.</i> Her thoughts come out shaky and erratic; there’s too many things to focus on, and a steady conversation doesn’t take priority, but she needs to say her words. <i>I’d give you one look, and you’d consent to being my mate. You’d give me more kips than the Qim could ever hope for.</i>");
	output("\n\nYou don’t respond. <i>Can I let you in on a secret?</i> she asks. Her eyes begin to water, not in sadness, but in the raw pleasure and sexual joy she’s experiencing at the moment. <i>I’d do the same for you. Just one word, and I’d be yours forever. We’re made for each other, my Qal. My body feels so... so hot, when it couples with yours. My pussy feels so</i> right <i>when you’re fucking it. There will never be another, more suitable mate for me than you.</i>");
	output("\n\nThe words remind you that, in another world, you might have found this whole act abhorrent and disgusting – she’s your kip, for Gods’ sake. But, and this may just be your lust-addled mind not thinking clearly, but, in <i>this</i> world, having been with [frostwyrm.name] so long and having been immersed in the cultures and standards of her kind, and the way your kip’s words come out so truthful and unabated... you can’t help but think that, maybe, if it meant being the best Qal you could, you’d have to talk with [frostwyrm.name] about taking on a second mate.");
	output("\n\nOf course, your internal thinking comes out loud and clear to Nykke. And at the very idea of you seriously considering taking her as a real, legitimate mate, her need to orgasm suddenly materializes from the ether. <i>Give me your seed, my mate!</i> she demands of you, just in time to coincide with her incoming orgasm. <i>Give me a kip of my own!</i>");
	output("\n\nYou both can’t help but grunt out in carnal bliss as you bring each other to orgasm. Her back arches further; her wet, tight Frostwyrmling cunt grips you as tight as she can, and rhythmic contractions all along your [pc.cock], from your [pc.base] to your [pc.cockhead] suck out all the cum it can from you. And, likewise, her own dick, completely untouched and neglected, pumps her seed into the air; her balls tense and retract slightly as her semen jettisons over her, the white of her cum blending with the white of her scales.");
	output("\n\nYou acquiesce to her demands, and you cum. Y");
	if (pc.balls > 0) output("our [pc.balls] pull up tight against your body, and y");
	output("our [pc.cum] shoots from you, filling your kip’s womb, packing her tight draconic belly with the seed she wanted so badly. ");
	var cumQ:Number = pc.cumQ();
	if (cumQ < 300) output("\n\nYou give her the most you can possibly give her; she milks you until you have nothing left in your body to give. She smiles to herself in delight, knowing that her Qal has given her everything she had asked for , and that it need only be a matter of time until she can have another womb - full of your ambrosia");
	else if (cumQ < 2000) output("\n\nYou pump and you pump; her normally tight, muscular stomach slowly rounds out from your load, and she, like the true champion of the Frostwyrms she has the potential to be, stores your every drop inside her dutifully. She sighs in delight, one hand running over her abs as she feels your warm liquid settle inside her. This will do – for now");
	else output("\n\nAnd give it you do : your capacity exceeds that of any normal individual and rivals that of the Frostwyrms, and you put your kip’s natural elasticity to the test. And yet, her body is up to the challenge: though her belly rounds out and loses its definition as her womb strains to contain your load, she miraculously does not lose any of it. Not so much as a single drop is surrendered from her demanding, ravenous quim, and, judging from the dopey look on her face, she loves every minute sensation of your seed sloshing around inside her");
	output(".");
	output("\n\nYou collapse forward, your head landing in the valley of her enormous F - cup breasts, as you take a moment to recuperate. You feel her hands gently stroke at your head and down your neck as she breathe heavily, your nose filled with the scent of your offspring and the heady musk of sex all around you both");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 11) output(". And, adding to that, you hear [frostwyrm.name] make a few animalistic groans of her own, followed by some squeaks and yelps from one of your kips; you turn your gaze to one side, and you’re greeted with the sight of one of your kips behind [frostwyrm.name], plowing her Qim for all she was worth, and from the way she’s desperately clutching onto [frostwyrm.name]’s wide, sturdy flanks, she’s probably coming to her own ‘conclusion’ right now.");
	output("\n\nYou aren’t given much time to rest: another pair of strong, sturdy hands grab you by the shoulder and yank you backward, dislodging you from Nykke. You’re spun around, and suddenly, a thick tongue is in your mouth, wriggling against yours and pressing against your soft cheeks. A thick, beady cock presses against your [pc.belly] in excitement, but you know that, like your other two kips, this isn’t about her dick");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 5) output(". And, just like you had guessed, yet another of your clutch comes up from behind you, dick in hand, guiding her head in between your cheeks for your welcoming [pc.asshole]");
	output(".");
	output("\n\nLooks like your responsibilities as Qal of the clutch aren’t over just yet....");
	
	processTime(3 * 60);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", frostwyrmGoodGodImHurtAgain, undefined);
}
public function frostwyrmlingBathing():void
{
	clearOutput();
	frostWyrmlingHeader();
	author("B");
	
	output("Your fall is broken by the gentle, yet strong and sturdy, arms of your second-oldest kip, and she eases you to the ground, on your back. She and her sisters all get the same idea at the same time: you look positively <i>filthy</i>. A dirty Qal isn’t a presentable one. You need a bath.");
	output("\n\n<i>“Looks like our Qal needs a good cleaning, don’t you think, girls?”</i> your eldest kip asks, standing above you. The clutch unanimously agrees: you’re incapable of proper hygiene, so it’s up to your loyal, dutiful kips to get the job done for you. From the corner of your eye, you can see your second-oldest kip lick her lips, with an almost predatory exaggeration.");
	output("\n\nYour second-oldest kip falls with you, putting you both in a sitting position, with her behind you. Without any invitation or forewarning, she leans forward and begins licking at your neck and shoulders, tasting the salt on your [pc.skinFurScales] and making sure they’re clean as could be. She needs to start somewhere, after all.");
	output("\n\nHer two siblings, your third- and first-oldest, crawl forward, their hands trailing up your [pc.legs] seductively, and stopping just before your [pc.crotch]; with almost practiced unison, the very tips of their fingers wisp over your pelvis, before landing back on your stomach. <i>“Someone is an awfully dirty [pc.boyGirl], aren’t they?”</i> Nykke asks, her nose against yours while your third-oldest begins working on the other side of your neck. <i>“Let’s get you nice and </i>clean<i>.”</i>");
	output("\n\nWith one kip at your back and two on either side, you’re surrounded by Frostwyrmlings, each of them laying their long, flat, blunt tongues against your body with the intent to clean you, and with absolutely no ulterior motives at all. Not when you feel their tongues lap at your neck; up to your lower jaw; across both your cheeks; and, not-at-all-subtly, against your [pc.lips]. They lap at them, slyly prying them open, and you relent – and as soon as you do, your mouth is full of Frostwyrmling tongue.");
	output("\n\nThe one sitting at your back gingerly takes care of your upper arms and shoulder blades");
	if (pc.hasWings()) output(", where your [pc.wings] root at your back");
	output(". She recognizes that she’s probably not going to have the most enjoyable parts of the bath, but, like a good kip, she doesn’t complain and happily focuses on your cleanliness.");
	output("\n\nThe same could not be said for your other two kips: their hands can’t stay off your body, rubbing and caressing gently at your [pc.belly] in wide, slow circles, making their way up to your [pc.chest]. They’ve both dropped the charade for the moment, and when you kiss one kip for a little too long – lost in sucking on her tongue, focused on the mesmerizing texture and elasticity of the appendage, especially when she drives it deep enough to massage at your soft palette – the other vies for your attention, licking your [pc.lips] and intruding on your time with the other.");
	output("\n\nEventually, they learn to work together, like good sisters should, and you have both of their tongues in your mouth at once. There’s barely enough room in there for them, but that makes it all the hotter: your comparatively diminutive tongue is overwhelmed and dominated by the undulating pair of thicker Frostwyrmling tongues, each dancing with your own and each other, compressing and bloating and sharing each other’s saliva with you and themselves.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 5) output("While your eldest and third - eldest neglect their duties, two more of your kips kneel next to either side of you, grasping onto your hands. They squeeze your hands lovingly, letting you know that they’re there, before lifting them to their mouths and sucking on your fingers, one at a time, washing one rather thoroughly before moving onto the next. Then, they make their way down your wrists, making sure that your arms are as clean as the rest of you is about to be");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 11) output("\n\nStill more of your kips, equally envious of their Qal for all the attention you’re receiving and envious of their sisters that they are the ones bestowing their Qal with attention, turn and make their way to [frostwyrm.name], to ask her for their own ‘baths.’ Your psionic connection is stronger with [frostwyrm.name] than any of the others, and through it, you feel amusement – followed by contentment as she gets to work, slathering the first kip that approached her with her enormous tongue");
	output(".");
	output("\n\nYour two kips assaulting your mouth withdraw – one notably slower than the other – and all three of you gasp for breath. They recover before you do, and they resume their duties with a rabid fervor they didn’t have before: they return to your face, kissing and licking at your cheeks, moistening them again, and they quickly make their way to your collarbone, then to your [pc.chest].");
	output("\n\nNykke constrains herself, washing the meat of your chest as thoroughly as she can, while your third - oldest beelines for your [pc.nipple], lathering it thoroughly and sucking it between her lips, delighting in the electric sensations it gives to you and, therefore, to her. She lifts her cute eyes to yours and smiles as she twists her head, her tongue moving in large circles, wetting your areola and stretching her tongue ");
	if (pc.biggestTitSize() <= 2) output("into the open space between your two nipples");
	else output("as deep into your cleavage as she can; she even wraps her tongue up and around the circumference of your boob, squeezing it with just her tongue");
	output(". Her older sister loses her patience and her resolve, and she takes your other [pc.nipple] into her mouth, too.");
	if (pc.isLactating()) output("\n\nIt doesn’t take much instigating to get your [pc.milk] to flow freely from you and into your thirsty kip’s mouths. They’ve been generally silent the whole time, save for the occasional ascending hum, but once your nourishing milk hits their tastebuds, they each ‘mmm!’ in delight, and their actions turn a little more hungry, a little more <i>rabid.</i> They massaging at the fat of your breasts and their lips squeeze just around the areola, pressing out as much squirting milk as they can, and their throats work eagerly to consume every drop you have to spare.");
	if(pc.hasGenitals()) {
		output("\n\nWhile they both work you over, Nykke’s eyes also lock onto yours, and she narrows hers deviously:");
		if (pc.hasCock()) output(" she shifts her lower body, rotating her hips around, until her body is pointing away from yours. Displaying impressive flexibility, she then lifts her right leg, and brings her foot to your [pc.cock], dexterously and expertly groping and massaging the tight skin of it with the sole of her foot. She tickles and threatens you with the pointed obsidian claws on her toes, but the danger never gets any farther than that, even when her toes splay wide enough to spread over the crown of your cock");
		if (pc.isHerm()) output(". H");
		else output(" h");
		if (pc.hasVagina()) output("er hips shift slightly, hooking her right leg in between your [pc.legs] and crooking her knee against your crotch, pressing her scaly joint up against your [pc.vagina]. She smiles as she grinds it against you, stimulating you; when she rises it a little higher, it bumps up against your [pc.clit], and you jolt in place, the shock electrifying your body. She maintains perfect, rigid control on her body and its motions, and at no point does she apply too little pressure or, heaven forbid, accidentally kneecap you in the cunt; her balance is perfect and pleasurable");
	}
	output(".");
	output("\n\n<i>Look at you, my Qal,</i> she says to you through your psionic connection. You gasp in pleasure: you have ");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 5) output("at least ");
	output("three tongues all cleaning various parts of your body, and now your kip is commanding your body through dexterous, even inspiring, manipulations of her body. <i>Reduced to a quibbling puddle of happy pleasure over a little bath. Are all " + plural(pc.race()) + " this easy to pleasure?</i>");
	output("\n\nYou don’t answer, knowing that she isn’t looking for one. She pinches your [pc.nipple] with her lips and pulls back, stretching your breast as she pulls back, and watches it snap into place when she opens her mouth with a quiet ‘pop.’ <i>But then again, a bath isn’t quite as personal as it is with Frostwyrms, is it?</i> she asks you, her " + (pc.tallness < 60 ? "leg" : "foot") + " continuing their motions. <i>Goodness, my Qal, is this making you feel... comfortable?</i> She resumes her bathing your [pc.chest], swiveling her head to get as much flesh as she can in as few passes. <i>Try and hold on, or else you’ll make a bigger mess for us to clean up. And we wouldn’t want that, would we?</i>");
	output("\n\nThere isn’t much sensory feedback between you and your kips: you’re the one receiving all the pleasure. But your lust is obvious through the simultaneous link you have with each of them, and it’s no secret what they’re accomplishing by ‘bathing’ you. Every little kiss your second - oldest makes on your back, tickling your spine as she runs her flat tongue along it; every little pull the other two make on your chest");
	if(pc.hasGenitals()) {
		output("; you’re");
		if (pc.hasCock()) output(" hard as diamonds");
		if (pc.isHerm()) output(" and you’re");
		if (pc.hasVagina()) output(" wet as could be");
		output(", and you’re all aware of how this bath is going to end");
	}
	output(".");
	output("\n\nTo that end, Nykke pulls away from your [pc.chest], apparently having her fill. Her tongue resumes its journey southward, snaking its way down your [pc.belly] and spending some time at your abdominals there. Her younger sister is a little less eager to leave your nipple, but she does so, wrapping around to get at your kidneys before meeting her older sibling just above your belly button.");
	output("\n\nOn-sync and without any hesitation, they messily kiss in front of you: they press nose-to-nose and they open their mouths, sliding their tongues into each other’s mouths and coiling them into a helix in front of you. They even pull away slightly: their longer tongues give you more of a show, and you see every bud and flex as they twist and suck on each other, treating their long, thick, pink tongues like another, tastier appendage. Then, just as quickly as it started, it ends, and they resume on you, their saliva refreshed.");
	output("\n\nUnexpectedly, your second-oldest kip stands, her hands hooking beneath your armpits to drag you to your feet. She’s done with most of your back, and it’s time she continued... <i>lower.</i> Your oldest and third-oldest agree: it’s time that their attention shifted to get at your lower body. Once you’re on your [pc.feet], your three kips are on their knees, and they resume as dutifully as ever.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 5) output("\n\nThe two kips on your arms do not change their position, and they get to work on your [pc.hips] from either side, their hands gingerly gripping onto your calves to keep you still. ");
	output("\n\nNow unobstructed by the ice, your second - oldest doesn’t waste time or mince actions: her long tongue extends, and she gives you an embellished, fat lick, up your right butt cheek. Her force pushes you forward, and your [pc.hips] are met in front by your other two kips, who both circle around your [pc.crotch]");
	if(pc.hasGenitals()) {
		output(", painting a bullseye with their saliva, with your");
		if (pc.hasCock()) output(" [pc.cock]");
		if (pc.isHerm()) output(" and your");
		if (pc.hasVagina()) output(" [pc.vagina]");
		output(" as the target.");
		output("\n\nAll three of them strike simultaneously:");
		if (pc.hasCock()){
			output(" Nykke your [pc.cock] in one hungry lurch, taking you all the way down to your [pc.base], deepthroating you easily and shamelessly. Your third - oldest, left hungry, wraps her lips around your exposed shaft whenever your oldest pulls back, her thick tongue wrapping literal circles around your tool");
			if (pc.balls > 0) output(", and when your oldest draws back in, she dips lower, lavishing your [pc.sack] with wet love, getting them just as ‘clean’ as your dick");
			if (pc.hasVagina()) output(". And, making sure that there is no part of you left cold and unclean, your second - oldest presses her nose into the crack of your [pc.ass], her long tongue reaching forward and making thick swaths against your [pc.vagina], cleaning it of all those dirty, feminine juices and making sure it’s spick and span");
			else output(". And, as exciting as it is to lick the fat of your ass, your second - oldest kip gets the devious idea to clean something <i>else:</i> with two steady hands pulling your cheeks apart, she dives into you, making long, licking swaths against your [pc.asshole], making sure it’s as clean as you’re sure an asshole can be");
		}
		if (pc.hasVagina()){
			if (!pc.hasCock()) output(" your oldest and your third-oldest press their noses to your pelvis and their cheeks together as they share your honeypot, one thick tongue per vulva. Their tongues pierce into you, digging deep into your body to collect every ‘dirty’ drop of your feminine juices and replacing it with something much more wholesome, you’re sure. They alternate their motions, and sometimes, they both try to spear into your cunt at the same time, treating you to a thick double-penetration from their wiggling tongues. Your second-oldest, knowing that your [pc.vagina] is well looked after, spreads your cheeks apart to graciously make similar, long passes against your [pc.asshole], making sure it’s as clean as you’re sure an asshole can be");
		}
	}
	output(".");
	output("\n\nYour knees buckle and you find it difficult to stand, but your kips collectively steady you, making sure you do not topple. After all, if any part of your freshly-cleaned body hit the ice, they’d need to start again, and that would be <i>terrible.</i> Even still, the way all three of them are going at you, all pretenses dropped and all facades deconstructed, it’s difficult to remain physically sturdy. Your orgasm is approaching in a hurry, and it’s going to be huge.");
	output("\n\n<i>Tut, tut,</i> Nykke says, and, even though you’re ready to blow any second now, there’s something stopping you: the edge that rapidly approached quickly recedes");
	output(", and no matter how deeply Nykke ");
	if(pc.hasGenitals()) {
		if (pc.hasCock()){
			output("deepthroats your [pc.cock] while her younger sister assists");
			if (pc.hasVagina()) output(", and no matter how deeply your second - oldest fucks your [pc.vagina] with her tongue");
			else output(", and no matter how deeply your second - oldest fucks your [pc.ass] with her tongue");
		}
		if (pc.hasVagina()){
			if (!pc.isHerm()) output("fucks your [pc.vagina] in time with her younger sister, and no matter how deeply your second - oldest fucks your [pc.ass] with hers");
		}
		output(", you’re left precariously on the edge, your orgasm just a hair’s - breadth from you but always out of reach");
	}
	output(".");
	output("\n\n<i>About to cum, my Qal, just from a bath?</i> she asks you, her eyes locked onto yours, her ‘service’ uninterrupted. <i>You should learn to have some self-control. Weak willpower isn’t the sign of a proper Qal! What would [frostwyrm.name] say?</i>");
	output("\n\nYou meet your kip’s gaze");
	if (!pc.isBimbo()) output(" and frown. First of all, she is not [frostwyrm.name], not to her; [frostwyrm.name] deserves your kip’s respect, and a respectful kip would refer to her as her Qim. And, second of all, she’d find it <i>exhilarating.</i>");
	else output(" and tut-tut yourself, putting a finger on her adorable little nose. [frostwyrm.name] thought it was yummy! She thought it was really fun that other kinds got off just by having a good, uh, bath. But, more importantly, she should refer to her Qim as her Qim, and not as [frostwyrm.name]. You kinda like it when your kip doesn’t respect you when things get sexy, but [frostwyrm.name] isn’t the same way.");
	output("\n\n<i>Right, sorry,</i> she laughs. <i>But, if the Qim really thought that it was a good thing – if</i> she <i>got to taste all of you, then it’s only fair I get it, too.</i>");
	if(pc.hasGenitals()) {
		output(" She cranes her head forward, ");
		if (pc.hasCock()) output("taking you all the way to your root and staying there");
		if (pc.hasVagina() && !pc.isHerm()) output("shoving her long, fat tongue as deeply into you as she can and twisting it back and forth");
		output(", her [baby.eyeColor] eyes trained on yours. <i>Feed me, my Qal. Give me your juice! Quench my need for you!</i>");
		output("\n\nFar be it from you to deny your kip after she asked so nicely. With her blockade removed, you do as she asks: ");
		if (pc.hasCock()) {
			output("you grip Nykke by the horns on her head and thrust forward – not that you could go any deeper, seeing as she had already taken you as deep as you had – and you gush your load into her throat");
			if (pc.balls > 0) output(", your third - oldest flexing her tongue in time with your [pc.balls] to eke out as much delicious cum for her sister as she can");
			output(". Your seed comes out in waves, ");
			if (pc.cumQ() < 500) output("each wave getting successively weaker but your kips do everything in their power to prolong it as long as they can, to make sure that their oldest sibling is given the treat she had craved. Every time a new blast rockets up from inside you, you pull back and thrust in, coating her throat with yourself, and she loves every little action you make, swallowing easily and demanding more with her tongue");
			else output("though, with your quantity, it’s difficult to tell when one ends and another begins. Her cheeks balloon with yourself, her tongue swimming in the deluge of semen that occupies her mouth, but she takes it all easily. When she hits her alien - infused limit, she swallows, but only enough to allow more in. Not a drop is spilt from her sealed lips, and she demands more, she <i>challenges you</i> for more, with each new shot. It isn’t until you’re finally spent that, with an elongated series of gulps, she swallows your every precious drop");
		}
		if (pc.isHerm()) output("\n\nYour second - oldest, satisfied with her position at your [pc.vagina], lovingly drinks your every feminine drop as it’s gushed and squirted from you; your [pc.femcum] drips down her tongue and into her throat, and she gargles it a bit before swallowing, making less of a show than her older sister but cherishing your every giving just as much");
		if (pc.hasVagina() && !pc.isHerm()) output(" your [pc.vagina] clenches and squirts, your [pc.femcum] spraying all over your kips’ tongues and pooling in the backs of their throats. Your body shakes with your orgasm, and all three of your kips do nothing to make the ride easier: their tongues writhe inside you, pressing at your sensitive walls and making your every destabilizing quiver rockier and longer. You cum and you cum, dousing both your eldest and third - eldest kip: their seal on you isn’t water - tight, and more than a little bit splashes onto their noses, dripping back their raised heads and down their hair");
		output(".");
	}
	output("\n\nAfter a few moments, you’re spent. No matter how much more your kips play with you and urge you, with their actions and with their psyches, to keep you going, you just don’t have anything left in you to offer. Exhausted, you slump backward, back into the arms of your second-oldest, and you lean against her as you take your seat in front of her.");
	output("\n\nNykke wipes her mouth with her arm, smiling like the devious little minx she is. As soon as you crash against your other offspring, she springs her trap. <i>“Look what you’ve done,”</i> she pouts, <i>“you had to go and ruin all that hard work we did to make you clean by getting yourself dirty on the floor.”</i>");
	if (flags["FROSTWYRM_KIP_COUNT"] <= 5)output("\n\nShe crawls towards you, her tongue languidly licking at her lips, moistening them for the next round. <i>“I suppose we’ll just have to start again, won’t we, girls?”</i>");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 6)output("\n\nShe stands, motioning to her myriad of sisters standing in a circle around you; each of them licking their lips, practically salivating, at their opportunity to give you another once-over. <i>“I suppose we’ll just have to make sure our Qal gets clean again, won’t we, girls?”</i>");
	
	processTime(60);
	pc.shower();
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", frostwyrmGoodGodImHurtAgain, undefined);
}
public function frostwyrmGiveThemABath():void
{
	clearOutput();
	frostWyrmlingHeader();
	author("B");
	
	output("You feel the hands of your amorous kips roam your body once you land between them. They grope and squeeze along your arms and biceps; their fingers draw languid lines along your [pc.belly]; they squeeze and press at your [pc.chest]");
	if (pc.biggestTitSize() >= 3) output(", groping at your boobs and copping feels in their large palms");
	output(". They have their way with you, and you – a little disoriented but no less horny – happily let them explore your body and satisfy their curiosity for their Qal.");
	output("\n\nYou’re joined by Nykke, who pushes her way between the crowd, to meet you personally. She gently cups your face, her thumbs caressing the [pc.skinFurScales] there; she smiles lovingly as she appraises you, her eyes forming crescents beneath her rising cheeks. With surprisingly tender movement, she pulls in and presses her mouth to your [pc.lips], giving you a chaste, but no less lewd, kiss.");
	output("\n\n<i>“Has anyone ever told you how perfect you are as our Qal?”</i> she asks you sweetly, licking her lips. You tell her that that’s a lovely compliment. <i>“And you deserve to hear it, every day. We’re all very lucky to have such a wonderful, attractive Qal, aren’t we, girls?”</i>");
	output("\n\nThe groping along your body – the hands beginning to dip lower, forming a rim around your waist and two particularly grabby hands cupping your [pc.ass] – does not stop while each of your kips hums in agreement, showering you with compliments over how well-groomed you keep your [pc.skinFurScales] and how exemplary your form is. To them, you are the perfect, most picturesque mate a Frostwyrm or a Frostwyrmling could ask for. <i>“And you’re all ours,”</i> Nykke whispers to you.");
	output("\n\nYou feel her push at your shoulders, insistently but not forcefully putting you to your knees. When you sink down, you’re level with your kip’s crotches – they’re all at about the same uniform height, and their ‘attributes’ vary only slightly between them. You’re face-to-face with Nykke’s bulging genital slit, and her pink, blunt head is already punching through to the surface. Her musk hits you in a single, powerful wave, and you suddenly find it difficult to focus on anything but her dick, and the way that it seems to crawl itself out of her body, inch by inch.");
	output("\n\nShe grips you by the back of the head, and with a pull and a thrust of her hips, your nose is pressed up against the vent of her crotch, where her cock is pulling out. You gasp in surprise, and your nose is filled with her tang: that raw, primeval, borderline dirty and raunchy musk; that scent that would rewrite any man’s or woman’s priorities and cause their body to react automatically");
	if(pc.hasGenitals()) {
		output(", like it is with you and your ");
		if (pc.hasCock()) output("[pc.cock], going from half - mast to full, and from full to rock-solid");
		if (pc.isHerm()) output(", and your ");
		if (pc.hasVagina()) output("[pc.vagina], at first a bit excited and moist, now practically spread on its own and gushing");
	}
	output(".");
	output("\n\nWith your left hand, you press your kip’s dick gently against your cheek, your breathing full and steady, taking in her scent and loving how her tool feels against your cheek as it elongates and inflates. With your right, you feel along her thigh, unsubtly making your way between her strong legs and fondling her ballsack, hefting her heavy left nut and bouncing it in your palm, your mouth watering for all the tasty cum inside. Your tongue slips out–");
	output("\n\nNykke pulls away suddenly. <i>“I think I’ll be a good big sister and let someone else go first,”</i> she says, grabbing her third-oldest sister from her right and placing her before you. The dick before you has been replaced with one very similar to it, but slightly less erect, and with a slightly different coloration around the vent. You feel giddy excitement course through your psionic link; your third-oldest clearly wasn’t expecting to go first, and yet, here she is.");
	output("\n\nBarely able to contain herself, she grabs your head, both her palms against your ears, and she drives her still-inflating dick into your mouth unceremoniously. No windup or warning; your nose painfully mashes against her pelvis and what little erection she currently has barely makes it to your gums, but when you take another deep breath, she’s big enough to make it past your teeth, and with another, she’s already scraping her blunt head against the roof of your mouth.");
	output("\n\nAs the Qal of the clutch, it’s your job to make sure your kips are provided for in any and every capacity they need. And this one, judging from her excitement and her insensitivity for your comfort, <i>really</i> needs to bust her nuts into your mouth. You accede and hollow your cheeks, sucking on her rod and running your tongue along its thicker underside; your tip plays with the little nubs lined along the shaft, and your spit wets and lubricates it, making her job easier as she pulls back, only to thrust in, deeper this time.");
	output("\n\nHer heavy, low-hanging nuts clap against your [pc.chest] with every push in, and you really feel the weight she has in them: when she pulls back, her balls seem to ‘drag’ a bit before following her body, sloshing visibly and almost audibly with her load. You don’t put your hands on her waist, since she’s got all the stability she needs and all the control she wants, and instead you run your palms along the smooth texture of her nuts, massaging the sensitive orbs and coaxing the load already bubbling inside them.");
	output("\n\nYour kip is having the time of your life, sawing herself in and out of your mouth like a horny piston, delighted at the prospect of not only having her dick sucked, but having it sucked by her Qal, of all the potential mates! You draw your eyes up, along her muscular belly and up to her jiggling, heavy boobs, bouncing in time with her each pump. Her eyes are closed in bliss and she has a huge, open-mouthed grin on her face.");
	output("\n\n<i>“Damn, girl,”</i> Nykke laughs, wrapping her arm around her sister’s shoulders and underneath her folded wings. <i>“You sure are putting a lot of effort into fucking our Qal’s face. Enjoying yourself?”</i>");
	output("\n\nYour kip can barely respond, but she manages, and to you, not to her sister. <i>“I dunno if it’s just because you’re our Qal, but... I can’t help it! It feels so good!”</i> Her knot has inflated to its full fleshy meatball, and it’s battering your [pc.lips] repeatedly, demanding an entry you refuse to give. <i>“By the Grand Qim, does that make me a bad kip? I’m not doing anything in return for my Qal... but I don’t know if I can stop!”</i>");
	output("\n\nHer sister reassures her, giving her a gentle kiss on the cheek. <i>“Look at our Qal,”</i> she says, and her sister obeys, her ruby-red eyes set onto yours. <i>“[pc.HeShe] is a good Qal. [pc.HeShe] is exactly where [pc.heShe] wants to be, and do you know why?”</i> Her younger sister shakes her head. <i>“Because [pc.heShe] is providing for [pc.hisHer] clutch this way. A proper Qal would do anything for their kips, and if that means getting on their knees and having their horny kips fuck their face, then that’s exactly what they’ll do.”</i>");
	output("\n\nNykke’s words seem to have a visible effect on her sister: her cock lurches in your mouth, and a spurt of pre jets from her, caking the back of your tongue and your tastebuds with her tart, smooth flavor. <i>“Is that right, my Qal?”</i> she asks, her eyes wide and hopeful. Your mouth is full of cock, so you don’t try to answer, but you do nod.");
	output("\n\nSquealing in delight, your third-oldest starts fucking your face all the harder. Her dick’s swollen to its full, one-foot-long length, and she tries her best to shove every last bit of it into your mouth, including her knot. You start to gag as its flat, blunted head starts battering your throat. <i>“I love you, my Qal!”</i> she shouts, and she doesn’t care who hears it. <i>“I love you, I love you, I–”</i>");
	output("\n\n<i>“Settle down!”</i> Nykke says good-naturedly. <i>“I said our Qal wants to provide for us; that doesn’t mean you should choke [pc.himHer]! As much as [pc.heShe] may enjoy it, [pc.heShe] still needs to breathe!”</i> Her sister freezes in place, and she notices how your eyes are squinted and watering in effort to contain the force in your mouth. <i>“Why don’t you pull out for now? I have an idea, but I need you to show some restraint.”</i>");
	output("\n\nNykke crooks her finger at your second-oldest, motioning for her to approach and take her sister’s place. As she does, she whispers something to the third-in-line; something you can’t make out and is being blocked through your psionic connection. When she pulls back, your third-oldest smiles widely. <i>“That sounds like fun!”</i> she says. <i>“I’ll do it. It’ll be hard, but I’ll do it, if you think our Qal would like it.”</i>");
	output("\n\n<i>“Please, look at [pc.himHer],”</i> Nykke says. <i>“[pc.HeShe]’d love</i> anything <i>you did for [pc.himHer].”</i>");
	output("\n\nSatisfied by her answer, your third-oldest steps away, and you’re once again staring straight at a hard dragon dick – this one is dry and in need of some attention, from the way it throbs and pulsates in front of you. A sweet drop of her draconic pre drips from her head and slides down the thick underside, leaving a trail of slime for you to wash away with your tongue.");
	output("\n\nYou lean in – and you’re stopped by a pair of hands on your forehead. <i>“Um,”</i> your second-oldest says, looking down at you. She chews her lip in apprehension, nervous at being put on the spot like this. This is her Qal, on your hands and knees, ready and willing to do anything she asked. <i>Anything.</i> And yet, the words fall apart before they make it past your kip’s lips.");
	output("\n\n<i>“Go ahead,”</i> Nykke says lovingly. <i>“[pc.HeShe] won’t say no.”</i>");
	output("\n\nShe plays with her fingers, her eyes shyly averting. Every part of her body that isn’t covered in scales, including her face and most of her chest, turn beet-red. <i>“Well, I, uh,”</i> she says with trembling lips and faltering words. Without another one, she turns around and bends over, lifting her thick tail out of the way, revealing her beading, dripping cunt, her vulva tinged bluish-pink. Feminine lube drips from her, streaming down the crease of her ballsack and collecting at a single point, dangling beneath her body and dripping to the floor. <i>“This, instead... please?”</i>");
	output("\n\nIs that all? You express your willingness by wrapping your arms around the flank of your kip’s ass and leaning in, pressing your hungry mouth against her soaking twat. Your tongue lunges forward, twisting and curling as it spears into her, searching for her every nook and cranny and collecting every precious drop of herself on your tongue. You move and flex your [pc.lips], massaging her vulva and providing as much stimulation there as you can.");
	output("\n\nShe quickly loses balance and falls forward; she catches herself on her hands, and you follow her, leaning forward and pressing your face deeper into the cleft of her draconic ass, your nose poking and teasing at your kip’s nervous asshole. Her massive balls rock and rub against your [pc.chest], upsetting the load inside them and threatening to make her cum bubble up and out of her dick prematurely.");
	output("\n\n<i>“Th-Thank you!”</i> your kip shouts, bucking herself backward, her tail draping down and along your back to keep you in place. Her whole body shakes in pleasure; when she accidentally twists her ass too far in one direction, she coos, loving the way your nose and your [pc.tongue] feel inside her, and she turns the other way. You yourself are lost in your own world of sinful, incestuous pleasure as you voraciously eat out your kip: you readjust your grip on her flank, your hands pressing against her muscled thighs, to keep yourself nice and buried.");
	output("\n\nHer actions and bodily reactions are all the thanks you need: her pussy tightens on your tongue whenever you hit a different spot inside her, and your mouth is awash with her juice. She’s so lubricated that her juices quickly begin dripping down your chin, mixing where your [pc.chest] meets her heavy balls, and you have no intention of stopping yet. You crane your head forward, your [pc.tongue] seeking out your kip’s clit, and you make a long lick, all the way from there to her asshole, giving it a kiss before resuming your mission.");
	output("\n\nNykke watches with amusement at the way her next-oldest sibling rides your face like a mutt in heat. She idly strokes herself, keeping herself nice and hard and ready for when it’s her turn; her ears perk up with every little gasp and moan her younger sister makes whenever you hit something particularly sensitive. <i>“Feels good, doesn’t it?”</i> she asks, just loud enough for you to hear.");
	output("\n\n<i>“Yes!”</i> she shouts, then remembers herself and where she is. <i>“Y-Yes,”</i> she repeats, much quieter.");
	output("\n\n<i>“You should say it louder,”</i> Nykke continues. <i>“This is your </i>Qal<i> we’re talking about. The most virile, the most eligible mate in all the world, and it’s [pc.hisHer] tongue you’re fucking right now. I’m sure [pc.heShe] would love to hear you say how satisfied you are with [pc.himHer].”</i>");
	output("\n\nShe bites her lip again, unsure about being so... vocal. She wouldn’t want to bother anyone by being too loud. <i>“You don’t need to be so timid, sister,”</i> she continues, kissing her younger sister on the lips gently. <i>“Think about where you are. You’re bent over, presenting yourself to the entire lair, and it’s your Qal, </i>the<i> Qal, that’s answered your call. [pc.HeShe] clearly isn’t nervous about it. And if it’ll help, I’ll even ask for [pc.hisHer] opinion for you.”</i>");
	output("\n\nYour second-oldest shakes her head, silently begging for her senior to not do it, but her pleas go ignored. <i>“Hey, my Qal,”</i> Nykke calls to you, <i>“do you enjoy eating out your kip?”</i>");
	output("\n\nYou pull out and say that, yes, you do, and you resume.");
	output("\n\n<i>“Would you like to hear her say it?”</i>");
	output("\n\nYou pull out and say that, yes, you would. Before you resume, you drive your wet, soaked tongue against her pulsing asshole for just a moment, just to tease her, before diving back in.");
	output("\n\nNykke barely has the time to form another sentence before your second-oldest <i>really</i> starts fucking your face while screaming to the lair insensate, inarticulate words. She babbles incoherently, her hips humping your face, her ass and her cunt practically trying to swallow you with her forcefully she’s backing against you. The volume your kip can produce surprises everyone in the lair; you weren’t prepared to have a screamer in the family, but, there she is.");
	output("\n\nThankfully, Nykke defuses the noise in a hurry: she leans in and whispers something to her sibling, which causes her to calm down and slow her humping. <i>“Are you sure?”</i> she asks, and her older sister nods. It takes no short amount of willpower, but your second oldest stops frantically fucking your face and even pulls away. <i>“Okay. If you think our Qal would like it.”</i>");
	output("\n\nYou’re left confused, cold, soaking wet in feminine draconic pussy-juice, and with a sore jaw, kneeling on the ice of the lair. Your eyes find Nykke’s: she narrows them and licks her lips, her [baby.eyeColor] eyes trained on your mouth. She steps forward, her rigid cock in her pumping hand, and she approaches you. <i>My turn,</i> she says to you over your psionic link.");
	output("\n\nAt this point, it’s almost an automatic response when she approaches you: you wrap your arms around her waist, keeping her close, your hands on her toned ass");
	if (pc.biggestTitSize() >= 4) output(". You nestle yourself forward, nestling your kip’s thick dick warmly between your boobs, right where it belongs");
	if (pc.isLactating()) output("; the pressure exuded on your milk - filled tits causes a bit to squirt out, coating your kip’s legs from the knees and lubing up your hands with your nutritious ichor");
	output(". She, using her hands, traces the blunt head of her tool around your [pc.lips], coating them with your pre – as if it were a lipstick, you close them and purse them, making sure that every millimeter is thoroughly colored with her pre-cream.");
	output("\n\n<i>Our session isn’t going to be quite as long, my Qal,</i> she says as she guides herself into your willing maw. She moves with far more expertise and confidence than her sisters: she doesn’t fuck your face so much as she places herself inside it, and she casually pumps against you, at a comfortable pace you can both match. <i>Seeing you go down on your little girls like that – the way you sucked cock like a horny little beast and the way you ate pussy like you were thirsty – it’s all made me... ready.</i>");
	output("\n\nHands reach out to your shoulders; you look to either side, and you see your second- and third-oldest kips, each of them on either side, their rock-hard dicks pointed right at your face. They trail their hands down your arms, and they direct you to their hot cocks; you let go of Nykke’s ass to wrap your fingers around them, and they start to slowly fuck your hands, the blunt heads beading with precum and ready to blow.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 5) output("\n\n<i>“Gather ‘round, girls!”</i> your kip heeds, waving to the group watching you debase yourself for the benefit of your offspring. You don’t have a good view of the circle forming around you, but from both corners of your eyes, you see more huge, pink cocks with massive, bloated knots, each of them paired with hands frantically jerking themselves in your general direction. Things will probably get a little sticky by the end of this.");
	output("\n\n<i>Aren’t you just the perfect Qal in the world,</i> Nykke says, smiling almost proudly down at you. <i>Look at you. On your hands and knees, doing absolutely everything you can to make sure your kips are satisfied. Everything, up to and including getting a couple hot loads all over your face. And you’d love to do everything for your kips, wouldn’t you?</i>");
	output("\n\nYou’ve been neglecting yourself this entire time, but now that you think about it, she’s right: ");
	if (pc.hasCock()) output("your [pc.cock] is hard as could be, and, completely without any sort of outside stimulation, you’re twitching and quaking, ready to blow your load all over your kip’s feet");
	if (pc.isHerm()) output(". And, on top of that, ");
	if (pc.hasVagina()) output("your [pc.vagina] is soaked through, quivering and leaking like a dam about to burst, and all without any sort of stimulation whatsoever");
	output(". You’re not sure what is directly responsible for your condition: the degrading act of being little more than a sex toy for your very own kips, or the constant, unending feedback loop of lust being fed to you via your psionic link with your kips, or whether you actually <i>were</i> getting touched and you were just too focused on your position to notice. Or any combination of the above.");
	output("\n\nThe cock in your mouth begins to bloat, and a spurt of precum hits the back of your throat, a little more forcefully than all the other spurts so far. <i>You’d do this again in a heartbeat, wouldn’t you?</i> she asks you, her own hands on your head once again, trying to keep herself steady. <i>You’d love nothing more than to get on your knees and tend to your kips when they say the word, wouldn’t you?</i> She moans out once, biting her lip as she does so. <i>By the Grand Qim, you’d do it for [frostwyrm.name] too, wouldn’t you? Mmm... the idea of you taking [frostwyrm.name] into your mouth is... fucking </i>hot<i>. She’s so much bigger than all of us!</i>");
	if (!pc.isBimbo()) output("\n\nAs hot as the entire scenario is, and as horny as you are and as willing as you are to go to your mate and blow her too when you’re done, you have the sense to scold your kip. She can call you what she wants, you don’t mind – but [frostwyrm.name] always is and always will be the Qim to her, and she deserves to be addressed as such");
	else output("\n\nWow, yeah, that <i>is</i> a good idea! Once you’re done blowing your baby girl and getting a hot facial from the others, maybe [frostwyrm.name] would like to make a deposit to her personal spunk-bank too! But, first things first: as much fun as everyone’s having, your kip needs to remember to not call [frostwyrm.name] anything except the Qim of the clutch. She deserves that");
	output(". <i>I’m... yeah, I’m sorry, but... you’d do it? You’d go to the Qim and do this to her too?</i>");
	output("\n\nApparently, the idea is too hot for her to handle, and, with a low groan, she blows her load: her dick inflates in your mouth, and suddenly, your mouth is inundated with draconic semen. She can’t help but fuck your face a bit, leaning back and pushing forward haphazardly, scraping her blunt head across the roof of your mouth as hot, white cream balloons your cheeks. You swallow, but it isn’t enough; you barely make any change in the rising level of cum in your mouth. So you swallow again. And again.");
	output("\n\nThe release your first kip feels with her orgasm triggers and encourages the orgasm of each of your other kips’: you feel the load travel up the footlong cocks in both your hands, before spraying out with more velocity than you had expected. Each arc travels above your head at first; you adjust your grip, aiming the one in your left at your face, and the one in your right at your [pc.chest]. The feel of them hitting your [pc.skinFurScales] is hot and sexy; your eyes cross, and you almost forget to swallow again.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 5) output("\n\nThe circle of kips around you join in with their sisters, and suddenly, you’re bathed in flowing ropes of Frostwyrmling cum arcing towards you from all directions. Your [pc.skinFurScales] is painted white in long, gooey lines all along your body; it drips down and soaks into you before, with another grunt from each of your kips, the first line is replaced with a second, and then a third.");
	output("\n\nDrunk on all the cum covering you and the cum you’re actually drinking, you’re brought to a hands - free orgasm. Y");
	if (pc.hasCock()) output("our [pc.cock] swells once, and your load shoots from you, flying a small distance before colliding with Nykke’s ankles, bathing them in pearly cum. You thrust into nothing, and with each impious rock of your hips, you deposit another load at her feet submissively");
	if (pc.cumQ() >= 700) output(", until your kip is standing in a veritable pool of your cum. Some strands reach up her legs as high as her knees");
	if (pc.isHerm()) output(". Not to be outdone, y");
	if (pc.hasVagina()) output("our [pc.vagina] clenches and spasms, wishing that just one of these beautiful, thick cocks was pounding it rather than your mouth and hands. Your [pc.femcum] adds to the growing mess around you, squirting forcefully onto the ice, and each time you take another thick wad in the mouth or across your [pc.hair], you gyrate your [pc.hips] involuntarily, riding out yet another orgasm.");
	output("\n\nAll of them combined make for an impressive load for you to handle: your throat works overtime, pressured to compete with the thick loads being forced into it again and again, and your hands have since disappeared beneath a thick layer of white draconic spooge while you jerk off your kips. Yet, you persevere, and you consider it a victory when your three oldest kips have no more cum to spare, and you haven’t passed out or given up.");
	if (flags["FROSTWYRM_KIP_COUNT"] >= 5){
		output("\n\nOf course, a good Qal’s job is never done. Satiated, Nykke withdraws, her spent cock flopping from your mouth and in front of your nose. You give it a loving lick before she steps away – and she’s replaced by another of her sisters, looking for some relief herself.");
		output("\n\nYou lick your [pc.lips] as she grips it and traces them, just as her oldest sibling had. It wouldn’t be right, as the Qal of the clutch, to leave any of your kips wanting. You open wide....");
	}
	
	var ppFrostwyrmling:PregnancyPlaceholder = getFrostwyrmlingPregContainer();
	pc.orgasm();
	pc.applyCumSoaked();
	pc.loadInMouth(ppFrostwyrmling);
	processTime(60);
	
	clearMenu();
	addButton(0, "Next", frostwyrmGoodGodImHurtAgain, undefined);
}
public function frostwyrmGoodGodImHurtAgain():void
{
	clearOutput();
	frostWyrmlingHeader();
	author("B");
	
	output("Time is difficult to keep track of in the lair, considering you don’t have a clear view of the sun, but you lose track of it much easier than you had anticipated. It could have been hours, for all you know: your kips are insatiable little goblins sometimes, always thinking up some excuse or another to have their Qal pleasure them. Not that you would ever say no to your darling little girls, of course, but even the strongest, most virile of Qals have their limits (you think).");
	output("\n\nYou lay in a large mating ball of satisfied dragons, each of them tending to each other, and especially you, now that the ‘festivities’ are over. Nykke has taken her usual spot, cuddled up against you, her arms and legs wrapped around you possessively; you two share a deep, love-filled kiss, a kiss that usually would not be reserved for a parent and their child, while a number of tongues languidly lick at your [pc.skinFurScales].");
	output("\n\nYou pull away from your kip, just to catch your breath, and you stare into her [baby.eyeColor] eyes lovingly. She returns the expression: her hands caress your cheek, and she leans in, gently nuzzling her nose against you affectionately. You feel another emotion through your psionic link with her – an emotion other than lust, which, it felt like, was the only thing she was feeding you for the past month. An emotion that makes your chest warm and your lips spread into a smile.");
	output("\n\n<i>I love you, my Qal,</i> she says. Inspired by the message, each of your kips parrot it, saying it one after the other, some of them saying it twice. Each of them cuddle up just a little closer to their siblings, and to you, bringing themselves just a little bit closer to their Qal.");
	output("\n\nYou give Nykke another, quick kiss on the nose, and tell her, and each of them, that you love them, too. Then, you lay your head down – it’s time to recuperate.");
	
	processTime(9 * 60);
	clearMenu();
	addButton(0, "Next", frostwyrmBunchaKiddoContent, undefined);
}