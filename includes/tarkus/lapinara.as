import classes.Characters.LapinaraFemale;
import classes.Engine.Combat.DamageTypes.TypeCollection;
//The Lapinara (Junkyard Planet Enemy)
//By Anonymous Drake

//Enemy Lapinara Encounter:
//**All Lapinara have a ⅓ chance of dropping a strange white carrot.

//Finding a Lapinara:
public function encounterALapinara():void
{
	author("Anonymous Drake");
	//[First Encounter]
	if(flags["ENCOUNTERED_PARASITIC_LAPINARA"] == undefined)
	{
		output("\n\nYou tense up nervously at the sound of a rapid pitter-patter of feet from a location that is difficult to discern. It does sound close, however. Are you being followed? You aren’t able to ponder this new development for long. Suddenly, you’re knocked forward as your stalker forcibly piggybacks herself onto you.");
		output("\n\n<i>“Hello, lover,”</i> she coos, sniffing you, feeling you all over. As the strange little alien pokes and prods at your body, your Codex beeps in an urgent message: <i>“Lapinara detected. These rabbit-like aliens enter an aggressive rut-like state when their ovaries have eggs ready. They will then attempt to implant these eggs into a host via an ovipositor. Avoidance is recommended if at all possible.”</i>");
		output("\n\nYou flail about frantically until the creature loses her grip, falling to the ground with a light thud. You’re now able to get a good look at her. She is most definitely a lapinara. She gets up, shaking off dust. Her expression of glee turns into one of mischief and malice.");
		output("\n\n<i>“They’re fun when they play hard to get!”</i>\n\nLooks like this girl isn’t taking no for an answer!");
		CodexManager.unlockEntry("Lapinara");
	}
	//[Subsequent Encounters]
	else
	{
		output("\n\nYou hear a familiar scurrying of feet from somewhere behind you. You immediately turn around, ready to face your assailant. Sure enough, she’s right there, her eyes wide in an expression of surprise.");
		output("\n\n<i>“So it looks like the prey is getting smart? Oh, I do love a challenge!”</i>");
	}
	IncrementFlag("ENCOUNTERED_PARASITIC_LAPINARA");
	
	var lapButt:LapinaraFemale = new LapinaraFemale();
	lapButt.impregnationType = "LapinaraPregnancy";
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(lapButt);
	CombatManager.victoryScene(defeatDatLapinara);
	CombatManager.lossScene(loseToFemaleLapinara);
	CombatManager.displayLocation("LAPINARA (F)");
	
	lapinaraBust();
	
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function lapinaraBust():void
{
	if (enemy != null && enemy is LapinaraFemale)
	{
		showBust(enemy.bustDisplay);
	}
	else
	{
		showBust("LAPINARA");
	}
	showName("LAPINARA\nFEMALE");
}
	
/*Tail Trip:
**She will only attempt this if your shield is down. You really don’t want her to succeed at this attack (or maybe you do?).

Dodge: <i>“The lapinara swings her tail in the direction of your [pc.legs]. Thinking fast, you jump, her tail swishing harmlessly under you.”</i>
Hit: <i>“The lapinara swings her tail in the direction of your [pc.legs], subsequently tripping you. She immediately hops on top of you, pinning you down. Damn, she’s strong for such a little thing! You’ll need to break free of her grasp, and fast!”</i>
Struggle (strength, succeed):  <i>“You pry the lapinara off you you, tossing her backwards and you get back on your feet.”</i>
Struggle (reflex, succeed): <i>“You manage to slip out from under the lapinara, clearly catching her off guard.”</i>
Struggle (first fail, both strength and reflex): <i>“The lapinara strengthens her grasp, pulling a syringe from her belt. She uncaps it, delving the needle into your neck. You scream loudly. The pain is unbearable! As she withdraws you needle, you can already feel the potent drug going to work on your body. You’ll need to break free soon, before this drug overwhelms you!”</i>
Struggle (second fail onwards): <i>“As the powerful drug continues to rack your body, the lapinara laughs in your face as you continue to struggle in her grasp, delivering a swift blow to your jaw.”</i>

Likes and Dislikes:

Big butts: Really likes!
Big Breasts: Kinda likes!
Multiple sex organs or breasts: Kinda likes!
Hypersized attributes: Dislikes a lot! (being so small, they can’t really fit hyper dicks)
Gaping orifices: Kinda likes!
Tail genitalia: Dislikes! (they can’t impregnate cunt tails)
Baldness: Dislikes!
Exotic body shapes: Kinda likes!
*/

public function lapinaraBreederLevel(bWomb:Boolean = true):int
{
	var level:int = eggBreederLevel(bWomb);
	if(flags["LAPITRAIN"] >= 1) level++;
	if(flags["LAPITRAIN"] >= 2) level++;
	if(flags["LAPITRAIN"] >= 3) level++;
	if(flags["LAPITRAIN"] >= 4) level++;
	
	return level;
}
public function totalPregLapinaraEggs():int
{
	var nEggs:int = 0;
	for(var i:int = 0; i < pc.vaginas.length; i++)
	{
		if(InCollection(pc.pregnancyData[i].pregnancyType, ["LapinaraPregnancy"])) nEggs += pc.pregnancyData[i].pregnancyQuantity;
	}
	return nEggs;
}
public function totalLapinaraPregnancies():int
{
	var nLapinara:int = 0;
	for(var i:int = 0; i < pc.vaginas.length; i++)
	{
		if(InCollection(pc.pregnancyData[i].pregnancyType, ["LapinaraPregnancy"])) nLapinara++;
	}
	return nLapinara;
}
public function lapinaraEggStuffCheck(nEggs:int = 2, x:int = -99, bOutput:Boolean = true, bOverride:Boolean = false):void
{
	var bStuffed:Boolean = false;
	var nEggLoss:int = 0;
	if(x == -1 || (x >= 0 && x < pc.pregnancyData.length))
	{
		var idx:int = (x >= 0 ? x : 3);
		if(pc.pregnancyData[idx].pregnancyType == "LapinaraPregnancy")
		{
			var nEggGain:int = nEggs;
			var nEggNew:int = (pc.pregnancyData[idx].pregnancyQuantity + nEggGain);
			var nEggMax:int = (lapinaraBreederLevel(x >= 0 ? true : false) * 2);
			if(!bOverride && nEggNew > nEggMax)
			{
				nEggLoss = (nEggNew - nEggMax);
				if(nEggLoss > nEggs) nEggLoss = nEggs;
				if(nEggLoss < 0) nEggLoss = 0;
				if(nEggLoss > 0)
				{
					nEggGain = Math.max((nEggs - nEggLoss), 0);
					bStuffed = true;
				}
			}
			if(nEggGain > 0)
			{
				addLapinaraEgg(nEggGain, x);
			}
		}
		else if(pc.isPregnant(idx)) bStuffed = true;
	}
	if(bOutput && bStuffed)
	{
		output("\n\nNot too soon after, you feel " + (nEggLoss == 1 ? "an egg" : (nEggLoss == nEggs ? "the eggs" : "eggs")) + " quickly dissolve away... perhaps due to your " + (idx == 3 ? "ass" : "womb") + " already being occupied?");
	}
}

//Sex Scenes:
//Egg Implantation (lapinara wins):
public function loseToFemaleLapinara():void
{
	var lossFunc:Array = [];
	if(!pc.hasVagina() || (pc.hasCock() && rand(pc.totalVaginas()) == 0)) lossFunc.push(loseToLapinaraAndGetEggplantedDudesAndNeuters);
	if(pc.hasVagina()) lossFunc.push(loseToLapinaraAndGetEggplantedChicks);
	lossFunc[rand(lossFunc.length)]();
}

public function loseToLapinaraAndGetEggplantedDudesAndNeuters():void
{
	author("Anonymous Drake");
	lapinaraBust();
	//(Male/Genderless Variant)
	output("Your lapinara assailant grins wickedly as she admires you, her prize. She approaches you, forcibly removing your [pc.gear]. ");
	if(pc.hasCock()) output("The sex-crazed bunny-girl takes a moment to inspect your package");
	else output("The sex-crazed bunny-girl takes a moment to inspect you");
	output(". You see her nodding in silent approval. She then moves a hand down to fondle your ass, licking her lips in anticipation as she gently rubs your rim with her thumb.");
	output("\n\n<i>“You got a nice hole there, tiger,”</i> she comments lustily. <i>“What say we put it to good use, hm?”</i>");
	output("\n\nYou’d try to get away. You’d do <i>something</i> to try and resist, but at this point, you know that it would be hopeless. This crazy bitch will stop at nothing to get what she wants. Absolutely <i>nothing</i>.");
	output("\n\n<i>“");
	if(pc.legCount > 1) output("[pc.Legs] spread");
	else output("Get ready");
	output(", slut!”</i>");

	output("\n\nIs she serious? Orders <i>and</i> insults? Who does she think she is? As if taking you down, forcibly removing your gear, and fucking you in the ass wasn’t enough!");

	output("\n\n<i>“Did you hear me, " + pc.mfn("boy","girl","offworlder") + "? Here it is again: ");
	if(pc.legCount > 1) output("[pc.Legs]. ");
	output("Spread");
	if(pc.legCount < 2) output(" ‘em");
	output(",”</i> she orders once more, waving a syringe in your face.");

	output("\n\nYou really don’t want to experience whatever it is she has in that syringe. It can’t be pleasant. At all. You do as the bunny says, albeit rolling your eyes as you do.");

	//Male:
	if(pc.hasCock()) output("\n\n<i>“That’s a good " + pc.mfn("boy","girl","offworlder") + ",”</i> she coos, giving [pc.oneCock] a rewarding squeeze before grabbing ahold of your [pc.legOrLegs].");
	else output("\n\n<i>“That’s a good " + pc.mfn("boy","girl","offworlder") + ",”</i> she coos, giving your [pc.ass] a playful flick before grabbing ahold of your [pc.legOrLegs].");
	output(" You won’t be moving");
	if(pc.legCount > 1) output(" them");
	output(" anytime soon.");

	output("\n\nStarting off slow, the lapinara gently works her dong over your crack until a dollop of pre forms at the tip. It is then that she presses her wet tip against your hole, her strange pre causing your outer rim to tingle pleasantly. You feel little to no pain when she finally enters you. It’s as if her fluids are working as an anesthetic of sorts.");
	output("\n\nAs she continues to work her way in and out of your [pc.ass], your insides become progressively number until you feel no more than a pleasant warmth and dull throb. You soon feel a slight... stretching sensation. At least you think it’s a stretching, given the numbness of your nethers. You hear the lapinara shakily mumbling something.");
	//Buttchange go!
	pc.buttChange(60,true,true,false);

	output("\n\n<i>“Eggs... Eggs, eggs, EGG eg-EGG!”</i>");

	output("\n\nNo way. This bitch! She’s implanting her eggs in you! Soon enough, you feel a new sensation, a new object in your ass, likely one of her damn eggs. You see the bunny-girl thrashing about madly in a fit of pleasure, and it isn’t long before another one comes in behind its brother. You’re sure that it has to be the last of the eggs, as she’s collapsed over you, panting. Eventually, she pulls out, playfully " + (pc.hasHair() ? "rustling your hair" : "patting your head") + ".");

	output("\n\n<i>“You felt amazing, tiger,”</i> she comments. <i>“We should do that again sometime.”</i>");
	output("\n\nIt’s then that she leaves without another word, rapidly disappearing into the landscape.");
	//No orgasm? +10 lust!
	pc.changeLust(10+rand(3));
	lapinaraEggStuffCheck(2, -1);
	pc.loadInAss(enemy);
	processTime(20+rand(4));
	output("\n\n");
	CombatManager.genericLoss();
}

//(Female/Herm Variant)
public function loseToLapinaraAndGetEggplantedChicks():void
{
	author("Anonymous Drake");
	lapinaraBust();
	// Prioritize empty wombs
	var x:int = pc.findEmptyPregnancySlot(1);
	// If all full, look for wombs that need filling.
	if(x < 0) {
		var lapiWombs:Array = [];
		var nEggMax:int = (lapinaraBreederLevel(true) * 2);
		for(var i:int = 0; i < pc.vaginas.length; i++)
		{
			if(pc.pregnancyData[i].pregnancyType == "LapinaraPregnancy" && pc.pregnancyData[i].pregnancyQuantity < nEggMax) lapiWombs.push(i);
		}
		if(lapiWombs.length > 0) x = lapiWombs[rand(lapiWombs.length)];
	}
	// Otherwise, choose a random womb
	if(x < 0) x = rand(pc.vaginaTotal());
	
	output("\n\nYour lapinara assailant grins wickedly as she admires you, her prize. She approaches you, forcibly removing your [pc.gear]. The sex-crazed bunny-girl takes a moment to inspect your [pc.crotch]. You see her nodding in silent approval. She then moves a hand down to play with [pc.oneVagina], licking her lips in anticipation as she gently");
	if(pc.hasClit()) output(" rubs your [pc.clits] with her thumb, another finger prodding");
	else output(" prods");
	output(" at your entrance.");
	output("\n\n<i>“You got ");
	if(pc.vaginaTotal() == 1) output("a pretty pussy");
	else output("some pretty pussies");
	output(" there, babe,”</i> she comments lustily. <i>“What say we put ");
	if(pc.vaginaTotal() == 1) output("it");
	else output("one");
	output(" to good use, hm?”</i>");

	output("\n\nYou’d try to get away. You’d do <i>something</i> to try and resist, but at this point, you know that it would be hopeless. This crazy bitch will stop at nothing to get what she wants. Absolutely <i>nothing</i>.");
	output("\n\n<i>“Legs spread, slut!”</i>");
	output("\n\nIs she serious? Orders <i>and</i> insults? Who does she think she is? As if beating you up, forcibly removing your gear, and fucking you in the vag wasn’t enough!");

	output("\n\n<i>“Did you hear me, " + pc.mf("boy","girl") + "? Here it is again: ");
	if(pc.legCount > 1) output("[pc.Legs]. ");
	output("Spread");
	if(pc.legCount < 2) output(" ‘em");
	output(",”</i> she orders once more, waving a syringe in your face.");
	output("\n\nYou really don’t want to experience whatever it is she has in that syringe. It can’t be pleasant. At all. You do as the bunny says, albeit rolling your eyes as you do.");
	output("\n\n<i>“That’s a good " + pc.mf("boy","girl") + ",”</i> she coos");
	if(pc.hasClit()) output(", giving your [pc.clits] a rewarding touch");
	output(" before grabbing ahold of your [pc.legOrLegs]. You won’t be moving");
	if(pc.legCount > 1) output(" them");
	output(" anytime soon.");
	output("\n\nStarting off slow, the lapinara gently works her dong over your crack until a dollop of pre forms at the tip. It is then that she presses her wet tip against ");
	if(pc.vaginaTotal() == 1) output("your");
	else output("an");
	output(" entrance, her strange pre causing your outer lips to tingle pleasantly. You feel little to no pain when she finally enters you. It’s as if her fluids are working as an anesthetic of sorts.");

	output("\n\nAs she continues to work her way in and out of your [pc.vagina " + x + "], your insides become progressively number until you feel no more than a pleasant warmth and dull throb. You soon feel a slight... stretching sensation. At least you think it’s a stretching, given the numbness of your nethers. You hear the lapinara shakily mumbling something.");
	//Cuntchange!
	pc.cuntChange(x,60,true,true,false);

	output("\n\n<i>“Eggs... Eggs, eggs, EGG eg-EGG!”</i>");
	output("\n\nNo way. This bitch! She’s implanting her eggs in you! Soon enough, you feel a new sensation, a new object in your vag, likely one of her damn eggs. You see the bunny-girl thrashing about madly in a fit of pleasure, and it isn’t long before another one comes in behind its brother. You’re sure that it has to be the last of the eggs, as she’s collapsed over you, panting. Eventually, she pulls out, playfully " + (pc.hasHair() ? "rustling your hair" : "patting your head") + ".");

	output("\n\n<i>“You felt amazing, Babe. We should do that again sometime.”</i>");

	output("\n\nShe leaves without another word, rapidly disappearing into the landscape.");

	//No cums for pc. +10 lust. Poor PC.
	pc.changeLust(10);
	processTime(20+rand(4));
	lapinaraEggStuffCheck(2, x);
	pc.loadInCunt(enemy,x);
	output("\n\n");
	CombatManager.genericLoss();
}

public function defeatDatLapinara():void
{
	author("Anonymous Drake");
	lapinaraBust();
	//Lapinara Loses By HP:
	if(enemy.HP() < 1)
	{
		output("Your assailant lies wounded on the ground. You’re just about to go on about your way when she calls out to you.");
	}
	//Lapinara Loses By Lust:
	else
	{
		output("Your assailant lies on the ground, masturbating furiously. You roll your eyes at her, and you’re just about to go on about your way when she calls out to you.");
	}
	output("\n\n<i>“Wait!”</i>");
	output("\n\nYou turn to face her, wondering what she could possibly want.");
	output("\n\n<i>“I’m... sorry for being so rough with you, okay? It’s just that my hormones go all crazy when I have eggs ready. I’d still like to fuck, if you feel up to it. I’ll even let you pick how we do it, I promise! Please?”</i>");
	if(pc.lust() >= 33) output("\n\nThat does sound like a tempting offer. What will you do?\n\n");
	else {
		output("\n\nYou aren’t anywhere near horny enough to even consider the offer.\n\n");
		clearMenu();
		addButton(14,"Leave",CombatManager.genericVictory);
		return;
	}
	clearMenu();
	if(pc.hasCock()) 
	{
		addButton(0,"Pitch Anal",targetLapinaraSex,lapinaraButtfuckSelector,"Pitch Anal","Attempt to fuck her butt, or if you’re too big, hotdog her.");
		addButton(1,"Get Blown",targetLapinaraSex,getBlownByLapinara,"Get Blown","Receive a blowjob from the lapinara.");
	}
	else
	{
		addDisabledButton(0,"Pitch Anal","Pitch Anal","This scene requires a groin-based penis to access.");
		addDisabledButton(1,"Get Blown","Get Blown","This scene requires a groin-based penis to access.");
	}
	if(pc.hasVagina()) addButton(2,"Get Licked",getLickedByLapinara,undefined,"Get Licked","Have the lapinara use her mouth on female genitalia.");
	else addDisabledButton(2,"Get Licked","Get Licked","This scene requires a vagina.");
	if(pc.hasCuntTail()) addButton(3,"Tail-Milk",cuntTailFuckLapinaraParasitic,undefined,"Tail-Milk","Use your parasitic cunt tail to suck on her ovipositor.");
	else addDisabledButton(3,"Tail-milk","Tail-milk","This requires a parasitic vagina tail to access.");
	if(!pc.isTaur() && pc.findEmptyPregnancySlot(0) != -1) addButton(4,"Get Stuffed",getStuffedInTheStuffByStuffWithStuffForStuffFREEEEEEDOOOOM,undefined,"Get Stuffed","Lie back and have the lapinara put that handsome ovi-dong to work. You’ll probably get stuffed with more than just an ovipositor though....");
	else if(pc.isTaur()) addDisabledButton(4,"Get Stuffed","Get Stuffed","The poor little rabbit-girl just can’t line things up with your tauric anatomy. Sorry!");
	else addDisabledButton(4,"Get Stuffed","Get Stuffed","It probably isn’t a good idea to do this when you’re already so pregnant.");
	addButton(14,"Leave",CombatManager.genericVictory);
}

//Cunt Tail Fuck (PC Wins):
//**Requires a cunt tail, obviously.
public function cuntTailFuckLapinaraParasitic():void
{
	clearOutput();
	author("Anonymous Drake");
	lapinaraBust();
	output("You bring your fluid-hungry tail pussy to your front, giving the lapinara a good look at it. You tell her that her egg chute is going to be getting a good milking. She rolls her eyes at you, letting out an annoyed sigh.");
	output("\n\n<i>“You won’t be getting any cum out of this thing, you know, and I can’t impregnate tail-cunts!”</i>");
	output("\n\nYou make it perfectly clear that impregnating your tail was never the point. The point is that your tail wants a nice cock to milk, even if it is just a pseudocock, and that’s exactly what your tail is going to do. The lapinara nods in understanding. She did promise to let you choose after all.");
	output("\n\nAll of your partner’s annoyance disappears when you wrap your sopping, muff-capped tail around her eager ovipositor. She shivers blissfully as you work it up and down on her length until it is completely slick with your feminine juices. You move the cunt to her tip as a bead of pre begins to drip from the slit. Your cooter tingles softly as it comes into contact with the fluid. The feeling isn’t entirely unpleasant.");
	output("\n\nIt is then that you finally lower yourself onto her pecker. You’re able to fit over it without much effort, not too unlike a glove. As you pump the phallus, you notice that the inside of your tail is becoming progressively less receptive. Eventually, you’d say that it feels as if you’re fucking nothing at all. It’s a strange feeling, but you like it.");
	output("\n\nYour attention is soon drawn to the base of the lapinara’s dong. It’s expanded to nearly three times its original width! With this new development, you can hear her whining: <i>“E-Egg egg EGG!”</i> Oh boy, here come the eggs. Your numb inner walls barely register the sensation of the first egg inching its way into your tail. By the time the second one comes around, you have to remove yourself from her pulsating egg pistol. The both of them just won’t fit. One egg shoots from her tip, while its twin falls out of your drooling tail-cunt, landing on the ground with a plop. It takes quite some time before the lapinara is able to come back to her senses.");
	output("\n\n<i>“That was greaaattt,”</i> she finally speaks up, her voice quivering slightly. <i>“I’d really love it if we could do that again sometime.”</i>");
	output("\n\nYou might just have to take her up on that offer.\n\n");
	//Another no-cum. +10 lust
	pc.changeLust(+10);
	processTime(20+rand(5));
	//Feed cunt tail mebbe? Nah...
	CombatManager.genericVictory();
}

public function targetLapinaraSex(targetFunc:Function):void
{
	if(pc.cockTotal() == 1) targetFunc(0);
	else
	{
		clearOutput();
		output("Which member will you use?");
		clearMenu();
		for(var x:int = 0; x < pc.cockTotal(); x++)
		{
			output("\n<b>" + (x+1) + ":</b> " + pc.cockNoun2(pc.cocks[x], false, ""));
			addButton(x,StringUtil.upperCase(num2Text((x+1))),targetFunc,x);
		}
	}
}

public function lapinaraButtfuckSelector(cockNum:int = 0):void
{
	if(pc.cocks[cockNum].cLength() > 20) hotdoggingALapinara(cockNum);
	else buttFuckALapinara(cockNum);
}

//Buttfuck (PC Wins):
//**Requires penis.
public function buttFuckALapinara(cockNum:int = 0):void
{
	clearOutput();
	author("Anonymous Drake");
	lapinaraBust();
	var x:int = cockNum;
	if(x < 0) x = pc.smallestCockIndex();
	//(Normal Variant)
	output("You lie down on the ground, pulling the lapinara to your lap. You give her a nice pat on the ass, telling her that you’ll be putting it to good use. She is absolutely beaming at the idea, nodding furiously.");
	output("\n\n<i>“Yesss... Yesyesyes I’d love that very much!”</i>");

	//Cock/Biggest cock is 12 inches and under:
	if(pc.cocks[x].cLength() < 12) output("\n\nYou’re glad that she shares the sentiment, and without further ado, you slowly but surely ease her onto your [pc.cock " + x  + "]. Her eyes roll into the back of her head, and she dreamily pumps her pecker with one hand, holding on to you with the other. She’s nice and tight, surprising for the sex machine that she so obviously is. Her tail whips about excitedly.");
	//(Cock/Biggest cock is between 13 and 20 inches: 
	else
	{
		output("\n\nYou’re glad that she shares the sentiment.");
		output("\n\n<i>“But wait!”</i> she interrupts as you’re about to slip her onto your [pc.cock " + x  + "].");
		output("\n\n<i>“What is it?”</i> you ask.");
		output("\n\n<i>“You’re... a bit larger than what I usually take, to say the least. Could you go easy on me?”</i>");
		output("\n\nYou nod understandably, and without further ado, you slowly but surely ease her onto your [pc.cock " + x  + "], being sure not to force her over the entire length. Her eyes roll into the back of her head, and she dreamily pumps her pecker with one hand, holding on to you with the other. She’s nice and tight, surprising for the sex machine that she so obviously is. Her tail whips about excitedly.");
	}
	pc.cockChange(true,false);
	output("\n\n<i>“Y-you can pick up the pace there, Tiger. PleaaAAssSE!”</i>");

	output("\n\nAmused by your partner’s eagerness, you gladly oblige her, bouncing her up and down on your [pc.cock " + x + "]. She thrashes her head back, squealing to the sky as she further loses herself in the pleasure that you were so kind to give her. It is then that you notice something peculiar about her dick. It’s swollen to nearly three times its original width!");
	output("\n\n<i>“E-EGG eggeggEGG!”</i> she whines lustily, pistoning her hand over her pseudocock at a rate you would have never imagined possible.");
	output("\n\nA mere seconds later, you blow your load into her, and two soft-shelled eggs shoot from her cock in rapid succession with a loud pop, landing on your chest. She starts panting, exhausted and at a loss for breath. You lift her off of you easily, sitting her down at your side.");
	output("\n\n<i>“You’re fucking amazing...”</i> she finally speaks up, a dazed look on her face. <i>“We really need to do that again sometime.”</i>\n\n");
	processTime(20+rand(5));
	enemy.loadInAss(pc);
	pc.orgasm();
	CombatManager.genericVictory();
}

//(Dick Too Big Variant (Hotdogging))
//**Cock/Biggest cock must be more than 20 inches in length.
public function hotdoggingALapinara(cockNum:int = 0):void
{
	clearOutput();
	author("Anonymous Drake");
	lapinaraBust();
	var x:int = cockNum;
	if(x < 0) x = pc.smallestCockIndex();
	output("You lie down on the ground, pulling the lapinara to your lap. You give her a nice pat on the ass, telling her that you’ll be putting it to good use. She is absolutely beaming at the idea, nodding furiously.");
	output("\n\n<i>“Yesss... Yesyesyes I’d love that very much!”</i>");
	output("\n\nYou’re glad that she shares the sentiment.");
	output("\n\n<i>“Whoa there, Tiger!”</i> she interrupts as you’re about to slip her onto your [pc.cock " + x + "].");
	output("\n\n<i>“What is it?”</i> you ask.");
	output("\n\n<i>“There’s no way that I’m going to be able to take a dick that big! You’re huge!”</i>");
	output("\n\nWell that’s certainly a disappointment.");
	output("\n\n<i>“Hey, let me finish! I didn’t say that we weren’t going to fuck. I do still want to fuck. Let go of me, I have an idea.”</i>");
	output("\n\nObediently, you let go of your partner, curious to see just where this is going. With a smug grin on her face, she sandwiches your [pc.cock " + x + "] between her soft, succulent ass cheeks. She wraps her tail around your pecker for support, gripping it with one hand as well. Her free hand goes straight to her own dick.");
	output("\n\n<i>“Ready for a round of hotdogging, big " + pc.mf("boy","girl") + "?”</i>");

	output("\n\nOh, so she wants to go for some hotdogging? Clever girl! You give her the a-okay to continue. Without another word, the lapinara skillfully rubs your length between her spacious rump cheeks. They’re so delightfully soft! Occasionally, she takes the time to give your cock a playful squeeze with her tail and hand as well, stroking herself all the while. It is then that you notice something peculiar about her dick. It’s swollen to nearly three times its original width!");
	output("\n\n<i>“E-EGG eggeggEGG!”</i> she whines lustily, now pistoning her hand over her pseudocock at a rate you would have never imagined possible.");
	output("\n\nA mere seconds later, you lose it, blowing your [pc.cumColor] spooge all over her back. At the same time, two soft-shelled eggs shoot from her cock in rapid succession with a loud pop, landing onto your chest. She slumps over you, exhausted and at a loss for breath.");
	output("\n\n<i>“You’re fucking amazing...”</i> she finally speaks up, a dazed look on her face. <i>“We really need to do that again sometime.”</i>\n\n");
	processTime(20+rand(5));
	pc.orgasm();
	CombatManager.genericVictory();
}

//Get Licked (PC Wins):
public function getLickedByLapinara():void
{
	clearOutput();
	author("Anonymous Drake");
	lapinaraBust();
	//**Requires vagina.
	output("You lie down on the ground, spreading your [pc.legOrLegs] for the lapinara. She grins widely at the sight of your [pc.vaginas], and you swear that you can make out a hint of blush under her fur. You point to ");
	if(pc.totalVaginas() > 1) output("a");
	else output("your");
	output(" exposed puss. She appears to have taken the hint, licking her lips at the suggestion.");

	output("\n\n<i>“You’re just so full of ideas, aren’t you, babe? I like that. I like that very much,”</i> your partner comments, plopping down");
	if(pc.legCount == 1) output(" upon your [pc.leg].");
	else output(" between your [pc.legs].");
	output(" She inspects [pc.oneVagina], smiling all the while. You even catch her biting her lip as she pokes and prods through your folds. <i>“And to top it all off, I’d say that you have just about the cutest pussy I’ve ever seen. Simply adorable!”</i>");

	output("\n\n<i>“Ahem!”</i> you interrupt. Skip the banter, you’re ready to get down to business!");
	output("\n\n<i>“Oh, right. Sorry,”</i> she apologizes.");

	output("\n\nWithout further interruption, the lapinara gets to licking. She starts by gingerly tracing your outer lips with her tongue, pulling them apart to expose your labia, taking a moment to gently nibble on the folds.");
	if(pc.hasClit()) output(" She then moves on to [pc.oneClit], kissing it lovingly before cusping her mouth over it, suckling.");
	output("\n\nYou gasp in surprise as you feel one of your partner’s fingers slipping into your vag, then two, then three... With her free hand, she furiously pumps her pseudocock, eliciting girly moans from deep within her throat. You swear that you can make out words in her muffled moans. Something about eggs, you think.");
	output("\n\nIt isn’t much longer before you reach orgasm, your inner walls reflexively clamping down on the lapinara’s skilled fingers. She releases her mouth from your");
	if(pc.hasClit()) output(" clit");
	else output(" groin");
	output(", wailing to the sky as a strange popping sound originates from under her. A quick glance reveals two soft-shelled eggs on the ground that weren’t there before.");
	output("\n\n<i>“That was fun!”</i> she comments, catching her breath. <i>“Do you think that we could do that again sometime?”</i>");
	output("\n\nYou very well might like to do that again someday.\n\n");
	processTime(20+rand(5));
	pc.orgasm();
	CombatManager.genericVictory();
}

//Get Blown (PC Wins):
//**Requires penis.
public function getBlownByLapinara(cockNum:int = 0):void
{
	var x:int = cockNum;
	if(x < 0) x = pc.biggestCockIndex();
	clearOutput();
	author("Anonymous Drake");
	lapinaraBust();
	//(Dick/Biggest Dick Just Right Size Variant- 12 Inches and Below)
	if(pc.cocks[x].cLength() <= 12)
	{
		output("You lie down on the ground, spreading your [pc.legOrLegs] for the lapinara. She grins from ear to ear at the sight of your [pc.cocks]. Even with the fur covering her body, you swear that you can see her blushing. You point to your [pc.cock " + x + "]. She seems to have taken the hint, licking her lips at the suggestion.");
		output("\n\n<i>“So it would seem that you’re looking for a bit of relief, is that right?”</i> she asks, plopping down");
		if(pc.legCount == 1) output(" upon your [pc.leg].");
		else output(" between your [pc.legs].");
		output("\n\nYou nod in response, confirming her suspicions. The lapinara grabs ahold of your cock, sizing it up.");

		output("\n\n<i>“You’re just the right size for me,”</i> she muses. <i>“Perfect! I should be able to take it just fine!”</i>");
		output("\n\nWithout another word, she cups her mouth over your [pc.cock " + x + "]. You groan softly as her warmth envelops you. She starts off slow, but it isn’t long before she’s completely deepthroating you, her muscles contracting pleasantly around your length, and she still manages to keep a hand on her own dick. She’s a fucking natural!");
		
	}
	//(Dick/Biggest Dick A Little Big Variant- Between 13 and 20 inches)
	else if(pc.cocks[x].cLength() <= 20)
	{
		output("You lie down on the ground, spreading your [pc.legOrLegs] for the lapinara. She grins from ear to ear at the sight of your [pc.cocks]. Even with the fur covering her body, you swear that you can see her blushing. You point to your [pc.cock " + x + "]. She seems to have taken the hint, licking her lips at the suggestion.");
		output("\n\n<i>“So it would seem that you’re looking for a bit of relief, is that right?”</i> she asks, plopping down");
		if(pc.legCount == 1) output(" upon your [pc.leg].");
		else output(" between your [pc.legs].");
		output("\n\nYou nod in response, confirming her suspicions. The lapinara grabs ahold of your cock, sizing it up.");
		output("\n\n<i>“It’s a little bigger than what I’m used to...”</i> she muses. <i>“I’m not sure if I can take the whole thing, but I’ll do my best!”</i>");
		output("\n\nWithout another word, she cups her mouth over your [pc.cock " + x + "]. You groan softly as her warmth envelops you. She starts off slow, but it isn’t long before she’s got half of your length in her mouth, completely deepthroating it, her muscles contracting pleasantly around your length, and she still manages to keep a hand on her own dick. She’s a fucking natural!");
	}
	//(Dick/Biggest Dick Too Big Variant- More than 20 inches long)
	else
	{
		output("You lie down on the ground, spreading your [pc.legOrLegs] for the lapinara. She grins from ear to ear at the sight of your [pc.cocks]. Even with the fur covering her body, you swear that you can see her blushing. You point to your [pc.cock " + x + "]. She seems to have taken the hint, licking her lips at the suggestion.");
		output("\n\n<i>“So it would seem that you’re looking for a bit of relief, is that right?”</i> she asks, plopping down");
		if(pc.legCount == 1) output(" upon your [pc.leg].");
		else output(" between your [pc.legs].");
		output("\n\nYou nod in response, confirming her suspicions. The lapinara grabs ahold of your cock, sizing it up.");
		output("\n\n<i>“Oh my goodness, it’s huge!”</i> she interjects. <i>“I’m not going to be able to take too much of it, but I’ll do my best!”</i>");
		output("\n\nWithout another word, she cups her mouth over your [pc.cock " + x + "]. You groan softly as her warmth envelops you. She starts off slow, and isn’t able to take much more than one fourth of the length, but she makes do with what she has, completely deepthroating it, her muscles contracting pleasantly around your length. She still manages to keep a hand on her own dick. She’s a fucking natural!");
	}
	output("\n\nEventually, you swear that you can make out words in her muffled grunting. Something about eggs? Never mind that. Your thoughts are lost in the amazing orgasm that you’re experiencing. ");
	//Small-Medium Cums: 
	if(pc.cumQ() <= 100) output("She swallows the load easily, and you can even make out a faint smile on her lips as she does.");
	//Large Cums:
	else if(pc.cumQ() < 300) output("She swallows your load with some difficulty, a look of strong concentration on her face the whole time.");
	else output("Try as she may, she is completely unable to take the whole load. Some makes it in, but the rest splatters all over her face.");
	output(" A quick glance reveals what she was whining about earlier: Two soft-shelled eggs on the ground below her that weren’t there before.");

	output("\n\n<i>“Delicious!”</i> she exclaims, finally coming back to her senses. <i>“You need to give me some more of that sometime.”</i>\n\n");
	processTime(20+rand(5));
	pc.orgasm();
	CombatManager.genericVictory();
}

//Primary - Spread Eagle
//Button Text: "Get Stuffed"
//Button Tooltip: "Lie back and have the lapinara put that handsome ovi-dong to work. You’ll probably get stuffed with more than just an ovipositor though...."
//Orifice Priority: A non-pregnant vagina, then non-pregnant anus
//Prerequisites: A non-pregnant orifice that will accommodate the lapinara ovipositor. Can’t be a taur, because the positions and description just wouldn’t work. :(
//Greyed-Out Text: "It probably isn’t a good idea to do this when you’re so pregnant."

public function lapiTrain(arg:int = 0, apply:Boolean = false):Number
{
	if(flags["LAPITRAIN"] == undefined) flags["LAPITRAIN"] = 0;
	if(arg != 0)
	{
		if(!apply) flags["LAPITRAIN"] += arg;
		else flags["LAPITRAIN"] = arg;
	}
	return flags["LAPITRAIN"];
}
public function getStuffedInTheStuffByStuffWithStuffForStuffFREEEEEEDOOOOM():void
{
	clearOutput();
	lapinaraBust();
	author("ThaumX");

	var x:int = pc.findEmptyPregnancySlot(1);
	if(x < 0) {
		if(pc.isPregnant(3)) x = (rand(pc.vaginas.length + 1) - 1);
	}

	output("You gaze at the defeated lapinara, your roving [pc.eyes] eyes pausing to examine the thick ovi-dong between its legs. ");
	//IF flag.LapiTrain ==  0 THEN
	if(lapiTrain() == 0) output("You begin to wonder how it’d feel stuffed inside your orifice, and suddenly you realize that you know exactly what to do with your defeated foe.");
	else output("You remember your last experience with one of those, your mind almost forcing you to relive the sensations. The odd numbness combined with a penetrating warmth, the pleasurable pressure growing to an orgasmic crescendo as your body accepts those precious eggs.... You snap out of your reverie with absolutely no doubt about what you want.");
	output(" The futa lapinara has been watching you warily, unsure of your intentions. ");
	if(!pc.isCrotchExposed()) output("As you strip off your [pc.crotchCovers] however, a");
	else output("A");
	output(" large droplet of pre forms on her increasingly engorged member. It’s obvious that any trace of uncertainty in the horny bunny’s mind has been replaced with the need to penetrate your now-naked body.");

	output("\n\nYou see no reason to make yourself - or the dripping object of your lust - wait any longer. Finding a suitable place on the ground, you plop down on your [pc.butt] and recline comfortably on your back. You spread ");
	if(pc.legCount > 1) output("your [pc.legs] as wide as your [pc.hips] will allow, momentarily obscuring the lapinara");
	else output("yourself as wide as your [pc.hips] will allow");
	output(". Her lustful eyes seem drawn to your orifice, unable to escape the direct object of her need. With a playful smile, you reach down between your legs and rub yourself in invitation. The lapinara doesn’t hesitate, and hops toward you. You are surprised at the sexually-charged bunny’s speed; her body is mere inches from yours by the time your lust-addled mind recognized that she had even started moving.");

	output("\n\nYou hold your breath in anticipation as you feel the warmth radiating from the broad egg-layer about to penetrate you. The bunny girl glances up at your [pc.face], the need etched on her face pleading for your permission. Her will breaks before she can witness your emphatic nod, however, and she lurches forward almost spasmodically. You immediately feel the blunt shaft pressing against your orifice, the bunny’s weight behind it providing an irresistible-yet delectable-force.");
	var looseness:int = -1;
	if(x >= 0) looseness = pc.looseness(x);
	else looseness = pc.ass.looseness();
	var capacity:Number = 0;
	if(x >= 0) capacity = pc.vaginalCapacity(x);
	else capacity = pc.analCapacity();
	if(capacity/3 > enemy.cockVolume(0)) output(" Your [pc.vagOrAss " + x + "] provides almost no resistance to the girthy ovi-dong’s entry, welcoming it deep inside with a rippling wave of pleasure.");
	else output(" The girthy ovi-dong slides slowly but surely into your [pc.vagOrAss " + x + "], sending waves of pleasure through you as deeper and deeper parts of you are stretched wide.");
	if(x >= 0) pc.cuntChange(x,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));

	output("\n\nYou already feel the telltale tingling of anesthetic, the lapinara pre slathered against your insides numbing the delicate tissue. You don’t mourn the lack of sensation, however, as a chemical warmth begins to suffuse you. It radiates out from your core, turning each sensation of pressure from the bunny’s egg-layer into subtle currents of pleasure.");
	output("\n\nJust as you’re starting to really enjoy the pressure from being filled, your futa lover decides it’s time to get started for real. You sigh as she slowly draws her turgid flesh out of you, but your disappointment is short lived. Just as the bunny reaches the cusp of exiting you completely, she uses all her weight and leverage to slam back into you in one savage thrust.");

	if(x >= 0) output("\n\nYou gasp as the weight of the thrust is absorbed by your vulnerable cervix, the force of the impact sending a surge of delight skittering through your nerves. As soon as the piercing ovipositor can go no deeper inside you, it’s being pulled outward for another thrust. The desperate lapinara starts a rapid pace of quickly pulling out only to violently hammer you with another thrust. With each new assault on the entrance of your womb, you feel the beleaguered flesh give way just a little more. As if sensing that her alien pre and forceful battering had nearly opened the way, the rutting bunny changes her pace. Instead of immediately withdrawing for a new strike after bottoming out, she punctuates the staccato rhythm of her thrusts with an additional forceful push toward your womb. It isn’t long before you feel the last shred of resistance shoved aside with a near-orgasmic gush of pleasure. Each thrust now pushes the ovipositor into your womb, where it is now free to release its impending egg payload.");
	else
	{
		output("\n\nYou gasp as the lapinara’s thrust pushes against the curve of your rectum, the weight of the thrust absorbed when she impacts your [pc.butt]. The surging fullness sends pleasure shooting through your whole body. As soon as the first thrust ends, the piercing ovipositor yanks outward. The desperate bunny begins a rapid pace of hard thrusts, ");
		if(pc.hasCock()) output("the movement teasing your prostate into squeezing out dollops of [pc.cumColor] [pc.cumNoun] in rhythm with the thrusts.");
		else output("each one sending a new surge of pleasure into your overloaded nervous system.");
		output(" As the vigorous rutting continues, you feel your rectum slowly being forced into the new shape desired by the bunny’s unyielding member. The pleasure of each thrust continues to build, bringing you near orgasm as you realize that your colon is wide open to the impending payload of eggs.");
	}
	output("\n\nOne look at the face above you tells you that you aren’t the only one about to cum. The cock-toting lapinara has her eyes squeezed tightly shut, her mouth hanging open as she focuses on pounding your orifice. Suddenly her ragged moaning is cut off, her entire body shuddering as she slams into your depths one last time. The shaking bunny manages a simple <i>“<i>Ugg... Cumming!</i>”</i> as a new sensation of rippling pressure teases your senses. The peristaltic motions of the egg-layer sends you over the edge, the girthy organ squeezing rhythmically to force an egg down it’s length. You can’t stop from screaming out in ecstasy when you feel the pressure of the first one stretching you further as the pseudo-knot makes its way toward your ");
	if(x >= 0) output("welcoming womb.");
	else output("waiting colon.");
	if(pc.hasCock()) output(" The intense pressure wrings a new torrent of [pc.cum] out of your already-spurting [pc.cocksLight].");

	output("\n\nThe bunny girl impregnating you forces out a yell, but you are too enraptured by your own pleasure to understand what was said. Your climax reaches new heights as an egg plops free of the ovipositor inside you. Before you can recover, you recognize the familiar pressure of another egg that’s already halfway to its destination. The pleasure from the first egg nestling inside you hasn’t subsided, ");
	// IF LapiTrain < 2 THEN
	if(lapiTrain() < 2) output("and concern briefly penetrates the euphoric haze of your mind. <i>This orgasm won’t stop... I don’t know how much more I can handle... what if I can’t? What if it kills....</i>");
	else output("and an eager greediness penetrates the haze of your euphoria. <i>Come my little egg baby, make me feel even better! I’ll be the best home for....</i>");
	output(" The rampantly-growing pleasure from the second egg leaves you unable to form a coherent thought, replacing everything with nearly unbearable pleasure. Your unfocused [pc.eyes] stare blankly ahead, seeing only radiant white as your senses are overwhelmed by the pleasure of the second egg lodging inside you.");

	output("\n\nThe lapinara’s tense muscles begin to relax, and she slumps against your [pc.chest]");
	if(pc.hasCock()) output(", soaking its fur with the seemingly endless [pc.cumNoun] you sprayed yourself with earlier.");
	else output(" to catch her breath.");
	output("  While the bunny’s body is no longer rigid, the ovi-dong buried inside you shows no sign of following suit. As your orgasm fades and the bunny recovers, the pleasurable sensation of fullness makes it obvious that you have a decision to make. A decision that should be made before your bunny partner makes it for you.");

	processTime(30);
	pc.orgasm();
	pc.orgasm();
	if(x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	//Normal is 2. This scene is 4. Bump from normal to EGGSTRA.

	if(pc.hasCock()) pc.applyCumSoaked();

	// Two Options are possible: Ending 1 or Continuation 1.
	//Ending 1
	//Button Text: “It’s Enough”
	//Button Tooltip: “You’ve spent enough time getting plowed, it’s time to move on.”
	//Orifice Priority: Same orifice as previous
	//Prerequisites: LapiTrain > 0 && Willpower Ratio < 50 || LapiTrain < 1
	// LapiTrain of 1+ means continuation 1 will be available, so there won’t be a “no available choices” situation.
	//Greyed-Out Text: “There’s no way you could willingly leave with this hard meat still stretching you out inside.”
	clearMenu();
	//Fen note: adjusted so if you’re trained, you can only turn it down with good will, contrary to the check as written by the author
	if((lapiTrain() >= 1 && pc.WQ() >= 50) || lapiTrain() < 1) addButton(0,"It’s Enough",voluntaryEggEnding1,x,"It’s Enough","You’ve spent enough time getting plowed, it’s time to move on.");
	else addDisabledButton(0,"It’s Enough","It’s Enough","There’s no way you could willingly leave with this hard meat still stretching you out inside.");
	//LapiTraining > 0 |or| eggTrainerTraining > 0 // |or| pc.libido > 75LapiTraining > 0 |or| eggTrainerTraining > 0 // |or| pc.libido > 75
	//Fen note: this was a mess to me, so I just made it if you’ve done the training or have high libido.
	if(lapiTrain() > 0 || flags["EGG_TRAINING"] != undefined || pc.libido() > 75) addButton(1,"Keep Going",lapinaraBonusInsemination1,x,"Keep Going","You’ve already started, why stop now? Why would you even want to?");
	else addDisabledButton(1,"Keep Going","Keep Going","As enticing as it seems, you’re not sure if your body is ready to handle any more eggs just yet. Maybe once you’ve finished incubating these....");
}

public function voluntaryEggEnding1(x:int):void
{
	clearOutput();
	lapinaraBust();
	author("ThaumX");
	output("Gathering your strength, you push the lapinara away from you. You barely contain a sigh of disappointment as the thick egg-layer is pulled from your depths. You are quickly consoled by the chemical contentment emerging from deep inside you. The futa bunny climbs to her feet, her member jutting out at you and ready to go. You quickly avert your gaze to avoid the temptation, determined not to let yourself change your mind. Instead you see the sad expression of the lapinara, a mixture of disappointment and unfulfilled need written plainly across her face.");
	output("\n\nYou turn away, determined to go, and retrieve your gear. You dress in silence, neither of you speaking. When you’re, finished you glance backward over your shoulder, taking one last look at the resigned bunny before setting off across the sand.");
	addLapinaraEgg(2, x);
	processTime(5);
	// PC has lapinara egg pregnancy, pregnancyQuantity = 4
	//Fen note: should be handled by "loadIn" calls.
	output("\n\n");
	CombatManager.genericVictory();
}

//Optional Continuation 1 - Locked Legs
//Button Text: “Keep Going”
//Button Tooltip: “You’ve already started, why stop now? Why would you even want to?”
//Orifice Priority: Same orifice as used in previous scene.
//Prerequisites: LapiTraining > 0 |or| eggTrainerTraining > 0 // |or| pc.libido > 75 ??
//Greyed-Out Text: “As enticing as it seems, you’re not sure if your body is ready to handle any more eggs just yet. Maybe once you’ve finished incubating these....”
public function lapinaraBonusInsemination1(x:int):void
{
	clearOutput();
	lapinaraBust();
	author("ThaumX");
	output("Sure, it’s a decision, but it’s not like it’s a very hard one. It’s more about staying in charge of this encounter, anyway. Reaching up with both hands, you grope at the bunny’s small breasts, squeezing them before beginning to pinch and play with the firm nipples. You feel a small surge of pressure below, and your [pc.lips] turn upward in a naughty smile. Almost like prey pouncing on its predator, you wrap your [pc.legOrLegs] around the bunny’s soft thighs while your [pc.arms] clasp behind her back to pull her close to you. Once you feel the lapinara’s soft fur pressed against your [pc.skinFurScalesNoun], you lift your head to whisper in her large ear. <i>“Don’t tell me you’re done already....”</i> Almost immediately you feel an answer in the form of increased pressure from the swollen ovi-dong buried inside your [pc.vagOrAss " + x + "].");
	output("\n\nThe futa bunny doesn’t even try to escape your grasp; your head drops back onto the sand as she leverages her hips to start making hard shallow thrusts. Your arousal from the previous orgasm apparently hasn’t faded much; in just a few short thrusts, you’re already racing back towards climax. The lapinara, however, is just getting started. After a short trial of getting used to the motion, she ratchets up her pace until she’s pounding inside of you like a jackhammer. With each thrust the bunny’s body slams against your groin, intensifying your pleasure.");
	// IF Orifice == Ass Then
	if(x < 0) output("\n\nThis intense fucking is completely different from the last time, sending what seems to be a whole new set of pleasure signals to your overloaded brain. Gone is the determined assault slowly reshaping your rectum. It has been replaced by rapid-fire waves of pressure on the flesh that’s already taken on the shape of its invader. The sensation would be more than enough for you to scream yourself hoarse in ecstasy, but the pleasure went past the point of vocalization some time ago. Some detached part of you mind wonders about the eggs already in your colon, but simply acknowledging that they’re probably fine is all your floating segment of consciousness can accomplish.");
	// ELSE pussy
	else
	{
		output("\n\nThis intense fucking is completely different from the last time, sending what seems to be a whole new set of pleasure signals to your overloaded brain. Gone is the determined assault slowly prying open your cervix; it has been replaced by rapid-fire waves of pressure extending deep into the womb that’s already opened itself up to its invader. The sensation would be more than enough for you to scream yourself hoarse in ecstasy, but the pleasure went past the point of vocalization some time ago. As you’re pounded insensate, some detached part of you mind wonders about the eggs already nestled in your womb. Simply acknowledging that they’re probably fine is all your floating segment of consciousness can accomplish.");
	}
	output("\n\nAfter some period of time that could have been seconds or minutes (or maybe even hours), you feel the telltale signs that your bunny lover is about to cum. With the egg-layer buried as deep inside you as it’ll go, you feel the rippling pleasure of the peristaltic waves that will propel another egg inside you. The sensation sets you off, though you can’t tell if it’s a new orgasm or simply an intensification of the one you’ve been having since long before. With your eyes squeezed shut, and a thin stream of drool escaping your [pc.lipsChaste], you recognize the lapinara shouting something like <i>“egg”</i> over and over. That realization is quickly washed away as you feel the pressure of the egg-knot as it stretches its way into you. Moments later, you’re met with a sensation of pure bliss as the new egg joins its siblings inside you. As the pleasure slowly starts to fade you feel an even greater sense of contentment than before.");
	output("\n\nYou’re so distracted by your recovery and the blooming contentment that you’re startled when the lapinara pulls her ovipositor out of your [pc.vagOrAss " + x + "]. She flops backward into the sand next to you, her delicate chest rapidly expanding and contracting as she works to catch her breath. You feel fine yourself. In fact, you feel better than fine. You’re floating on a euphoric high left over from your orgasm, along with a blissed-out happiness that seems to be radiating from the eggs in your ");
	if(x >= 0) output("womb.");
	else output("colon.");
	output(" You can’t help but notice that the bunny’s fat ovi-dong is still firmly engorged, pointed rigidly into the air and glistening from the coating of your mixed juices.");

	// increment orgasm count by 2
	processTime(25);
	pc.orgasm();
	pc.orgasm();
	if(x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	// Choice between Ending 2 or Continuation 2
	clearMenu();
	if((lapiTrain() > 1 && pc.WQ() >= 50) || lapiTrain() <= 1 || !pc.hasVagina()) addButton(14,"Leave",lapinaraEggStuffEnding2,x,"Leave","You’re feeling great already, there’s no need to take advantage of your defeated foe any longer.");
	else addDisabledButton(14,"Leave","Leave","You may think you’re satisfied, but your body has other ideas. It’s like it knows it should get more babies while it can, and you can’t seem to work up the willpower to refuse.");
	if(lapiTrain() > 1 && pc.hasVagina()) addButton(0,"Cowgirl",continueToGetEggStuffedByLapiButtsPart2,x,"Cowgirl","If your bunny lover is out of breath, perhaps it’s time you climbed on top and did some of the work.");
	else addDisabledButton(0,"Cowgirl","Cowgirl","No matter how much your body wants to, you aren’t sure it’s safe to be taking more alien eggs inside you. Maybe after this litter is born you’ll be able to handle a few more... assuming you have the right anatomy.");
}

//Button Text: “Leave”
//Button Tooltip: “You’re feeling great already, there’s no need to take advantage of your defeated foe any longer.”
//Orifice Priority: Same orifice as previous
//Prerequisites: LapiTrain > 1 && Willpower Ratio < 50 && pc.hasVagina = True || LapiTrain > 2 && pc.hasVagina = True
// LapiTrain of 2+ means continuation 2 will be available, so there won’t be a “no available choices” situation. PC vagina argument ensures it won’t be grayed out in case of a lack of vagina.
//Greyed-Out Text: “You may think you’re satisfied, but your body has other ideas. It’s like it knows it should get more babies while it can, and you can’t seem to work up the willpower to refuse.”
public function lapinaraEggStuffEnding2(x:int):void
{
	clearOutput();
	lapinaraBust();
	author("ThaumX");

	output("Still floating from the intensity of what you just experienced, and giddy with the contentment radiating from your new passengers, you stand up. You stumble a bit, and start to pick up your gear. Your fumbling actions resemble those of a patient just waking up from general anesthetic. You don’t care, let alone notice, as you drunkenly pick up your things and once-again equip yourself for the harsh Tarkus desert.");
	output("\n\nBy the time you finish the drawn-out process of getting dressed, you are far more steady on your feet. The harsh environment helped to pull you out of your erotic stupor, and you’re [pc.eyes] are able to take in your surroundings with a much clearer mind. You still feel a blissful sense of contentment, but it isn’t so powerful that it overwhelms your ability to handle yourself out here. Looking over at the parasitic female once more, you’re surprised to find a look of disappointment on her face. It seems she just needed a break, because her thick ovipositor is still so engorged that it looks painful. It’s plain to see her pseudo sack is still tautly full, she still has plenty of eggs where the last three came from.");
	output("\n\nYou catch yourself licking your [pc.lips] at the sight. Whether it’s your subconscious, the eggs, or the chemical cocktail of the girl cum that was just pumped into you, you can tell your body wants more of that lusty bunny. You shake your head to clear your thoughts, forcing yourself to move on. There’s just too much to do, you don’t have time to waste playing around here. You set off, leaving the needy lapinara behind without looking back.");
	if(!pc.isAss()) output(" It feels rude to leave without so much as a word, but you didn’t trust yourself not to cave in to your desires if you had stuck around any longer.");

	output("\n\nAs you walk, you feel the lapinara anesthetic starting to wear off. You almost double over in shocked pleasure when sensation rushes back like a dam breaking. It feels like an army of microscopic vibrators have invaded your groin, sending confused jolts of joy straight to your unprepared brain. You look back reflexively for the lapinara, but she’s out of sight thanks to the undulating landscape of Tarkus’ wreckage-covered dunes. It’s just as well, otherwise you might have started the process all over again. You crouch down and wait for the pleasure to fade, avoiding the urge to masturbate and make things worse. After a few minutes that seem like hours, you’re back to normal and once again making your way across the junk-strewn sand.");

	processTime(10);
	pc.changeLust(15);
	// Apply vaginally/anally filled status as appropriate, 1800ml
	//Fen note: done in prev scene
	// PC has lapinara egg pregnancy, pregnancyQuantity = 6
	addLapinaraEgg(4, x);
	output("\n\n");
	CombatManager.genericVictory();
}

//Optional Continuation 2 - Cowgirl
//Button Text: “Cowgirl”
//Button Tooltip: “If your bunny lover is out of breath, perhaps it’s time you climbed on top and did some of the work.”
//Orifice Priority: Same orifice as used in previous scene.
//Prerequisites: LapiTraining > 1 && pc.hasVagina = true //only check if pc HAS a vagina, not if the currently used orifice is a vagina. Biology reasons.
//Greyed-Out Text: “No matter how much your body wants to, you aren’t sure it’s safe to be taking more alien eggs inside you. Maybe after this litter is born you’ll be able to handle a few more... assuming you have the right anatomy.”
public function continueToGetEggStuffedByLapiButtsPart2(x:int):void
{
	clearOutput();
	lapinaraBust();
	author("ThaumX");
	output("While still laying in the warm sand, you gaze at the lapinara catching her breath. Her soaked ovipositor seems as hard as ever, and you stare as the engorged shaft makes barely-noticeable bobbing motions in time with the bunny’s pulse. The fat ovi-dong is too rigid to move much, and if anything, it seems larger and more swollen than before. Moving your gaze downward, you take in the futa’s pseudo-sack, still stretched taut with a load of eggs. You get up, your [pc.legOrLegs] and [pc.arms] still shaky, to head over to your interim lover. You could come up with all sorts of excuses for why, but the simple fact is that you don’t want to wait anymore, not when there’s such a beautiful cock to impale yourself on only a few feet away.");
	output("\n\nIn only a couple steps you’re next to the lapinara; her breathing has slowed, but her ovi-dick is still straining for release. You swing your [pc.leg] over her, and stand straddling her hips.");
	if(pc.isHerm()) output(" Your [pc.groin] drip [pc.cum] and [pc.girlCum], along with a rivulet of lapinera spunk, onto the slim body beneath you.");
	else if(pc.hasCock()) 
	{
		output(" Your [pc.cocks] drip");
		if(pc.cockTotal() == 1) output("s");
		output(" [pc.cum] along with a rivulet of lapinera spunk onto the slim body beneath you.");
	}
	else if(pc.hasVagina()) output(" [pc.EachVagina] is soaked, dripping [pc.girlCum] along with a rivulet of lapinera spunk onto the slim body beneath you.");
	else output(" A rivulet of lapinera spunk leaks out of you, splattering the slim body beneath you.");
	// IF pc.milkRate > 0 THEN
	if(pc.isLactating()) output(" The fluids are joined by occasional dribbles of [pc.milk] from your [pc.milkyNipples].");
	output(" The horny bunny doesn’t seem to care though, she’s entirely focused on the [pc.race] body standing above her.");

	output("\n\nWithout further ado, you bend your [pc.knees] and lower yourself over the towering ovipositor. When you’re close enough, you grasp the engorged tool and attempt to direct it toward your eager [pc.vagOrAssNoun " + x + "]. It barely budges, however, so instead you shift your [pc.hips] until your orifice is kissing the tip of the girthy egg-layer. Once it is in place, you waste no time impaling yourself, practically falling in your hurry to engulf the bunny’s member.");
	if(x >= 0) output(" It quickly slams back into your womb, joining the eggs that it left there previously. Whether it’s the thick cock, the eggs, or a combination of the two, you’d swear you can see your abdomen bulging from being so completely filled. Paradoxically, the feeling of being stretched and filled so completely leaves you wishing to be stuffed with even more.");
	else output(" It quickly slams back into your colon, joining the eggs that it left there previously. Paradoxically, the feeling of being stretched and filled so completely leaves you wishing to be even more full.");
	output(" If you could, you’d sit there feeling stuffed and use your muscles squeeze the bunny over the edge. Unfortunately, the lapinara’s anesthetic girlcum has caused you to lose most of your muscle control, making that option impossible. Knowing you won’t get what you want otherwise, you coax your shaky [pc.thighs] into lifting you a third of the way up the thick ovi-dong. You immediately relax, plummeting downward to be filled once more until your [pc.butt] stops your fall against the bunny’s thighs.");

	output("\n\nYou use the bounce provided by your [pc.butt] to help you start lifting upward again, only to fall once more. Soon you’ve established a steady rhythm, your rhythmic ride audibly punctuated by the sound of flesh hitting flesh, joined by a chorus of moans escaping your [pc.lips].");
	if(pc.biggestTitSize() >= 5) 
	{
		output(" Your [pc.biggestBreastDescript] bounce and jiggle hypnotically with the motion, ");
		if(pc.isLactating()) output("sending rivulets of [pc.milk] flying from your [pc.milkyNipples] to splash on the sand and your futa bunny.");
		else output(" the sensation only adding to your pleasure.");
	}
	if(pc.hasCock())
	{
		output(" [pc.EachCock] slaps against the lapinara’s belly with each bounce, smearing it with your [pc.cumColor] pre.");
	}
	output(" The pleasurable ride doesn’t last long before you feel the lapinara arching her back beneath you. She thrusts upwards until her hefty ovipositor is hilted inside you, and only then do you feel the rippling pressure that indicates another egg is on the way. The sudden thrust is joined by a soft cry from the dick-girl. ‘<i>Ohh! Ohh.. I’m... I’m cumming!</i>’ She doesn’t drop back down, her instincts driving her to keep her rod deep inside until her eggs are in their new home. The sudden new sensation combines with lustful thoughts about the impending load, and you’re pushed over the edge into a rampaging climax. Your [pc.legOrLegs] go");
	if(pc.legCount == 1) output("es");
	output(" weak, unable to support you any longer, and your merged bodies crash down into the sand.");

	output("\n\nThe impact drives the lapinara a fraction deeper into your orifice, causing a rush of ecstasy to explode in your brain. Your orgasmic screams rend the air, while ");
	if(pc.isHerm()) 
	{
		output("your [pc.cocks] erupt");
		if(pc.cockTotal() == 1) output("s");
		output(" in gush of [pc.cum], sending it arcing wildly through the air. Your [pc.vaginas] likewise release");
		if(pc.totalVaginas() == 1) output("s");
		output(" a torrent of [pc.girlCum]");
		if(pc.isSquirter()) output(", soaking the bunny’s fur until rivulets of the [pc.girlCumColor] fluid pour off of her to wet the sand");
		output(".");
	}
	// ELSE IF pc.hascock == true THEN
	else if(pc.hasCock())
	{
		output("your [pc.cocks] erupt");
		if(pc.cockTotal() == 1) output("s");
		output(" in gush of [pc.cum], sending it arcing wildly through the air.");
	}
	else if(pc.hasVagina())
	{
		output("your [pc.vaginas] release");
		if(pc.totalVaginas() == 1) output("s");
		output(" a torrent of [pc.girlCum]");
		if(pc.isSquirter()) output(", soaking the bunny’s fur until rivulets of the [pc.girlCumColor] fluid pour off of her to wet the sand");
		output(".");
	}
	else output("your body shudders in impaled bliss.");
	output(" The lapinara shouts ‘<i>eeh... eg... EGG!</i>’, and sure enough, you feel the egg knot stretching you as it travels up the burly ovipositor. Your orgasm explodes in intensity, but somehow you manage to avoid losing your senses like you did previously. It isn’t that this orgasm is weaker, just that you seem to have adapted somehow to the ridiculous pleasure. Though the world seems distant, you’re able to focus on the grimacing face of the lapinara as she works to deposit her egg. You finally get to experience the blossoming pleasure of the egg stretching out a new home for itself deep inside you, enjoying it in a way you hadn’t been able to in the past.");
	output("\n\nYour orgasm doesn’t end, rather it simply starts fading slowly away. The bunny beneath you is panting, but it seems to be more out of pleasure than exertion. You would start riding the ovi-dong again to keep your orgasm going, but your " + (pc.legCount == 1 ? "[pc.leg] is" : "[pc.legs] are") + " just too weak to manage more than a few more bounces.");

	processTime(25);
	// Player Becomes Sweaty? Not sure how this one works yet
	sweatyDebuff(1);
	// increment orgasm count by 1
	pc.orgasm();
	if(x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	// Choice between Ending 3 or Continuation 3
	clearMenu();
	if((lapiTrain() > 2 && pc.WQ() >= 50) || lapiTrain() <= 2) addButton(1,"Give Up",lapinaraImpregShitEnding3,x,"Give Up","The fact that you can hardly move anymore means that it’s probably time to call it quits. Besides, you have things to do.");
	else addDisabledButton(1,"Give Up","Give Up","You know there are more of those wonderful eggs waiting for you in this cute bunny’s sack. There’s no way you can leave without at least <i>trying</i> to help them get where they belong.");
	if(lapiTrain() >= 2) addButton(0,"Egg Milking",finalLapinaraEggStuffScene,x,"Egg Milking","You may not be able to ride the ovi-dong anymore, but there are other ways to get your little bunny to cum.");
	else addDisabledButton(0,"Egg Milking","Egg Milking","No matter how much your body wants to, you aren’t sure if you can fit more eggs inside you. You’re certain that after this litter is born you’ll be able to handle it.");
}
//Ending 3
//Button Text: “Give Up”
//Button Tooltip: “The fact that you can hardly move anymore means that it’s probably time to call it quits. Besides, you have things to do.”
//Orifice Priority: Same orifice as previous
//Prerequisites: LapiTrain == 3 && Willpower Ratio < 50 || LapiTrain > 3
// LapiTrain of 3+ means continuation 3 will be available, so there won’t be a “no available choices” situation.
//Greyed-Out Text: “You know there are more of those wonderful eggs waiting for you in this cute bunny’s sack. There’s no way you can leave without at least <i>trying</i> to help them get where they belong.”

public function lapinaraImpregShitEnding3(x:int):void
{
	clearOutput();
	lapinaraBust();
	author("ThaumX");
	output("Putting all your strength into your [pc.legOrLegs], you lift yourself off the turgid ovi-dong that’s impaling you. Falling to your hands and knees in the sand, you crawl over to where you discarded your gear. You’re still floating from the intensity of what you just experienced, and giddy with the contentment radiating from your new passengers. You stumble a bit as you stand up and start to pick up your gear. Your fumbling actions resemble those of a patient just waking up from general anesthetic. You don’t care, let alone notice, as you drunkenly pick up your things and once-again equip yourself for the harsh Tarkus desert.");
	output("\n\nBy the time you finish the drawn-out process of getting dressed, you are far more steady on your feet. The harsh environment helped to pull you out of your erotic stupor, and you’re [pc.eyes] are able to take in your surroundings with a much clearer mind. You still feel a blissful sense of contentment, but it isn’t so powerful that it overwhelms your ability to handle yourself out here. You look over at the lapinara still laying in the sand. She has recovered, and is sitting up watching you get ready to depart. She gives you a cute smile when she notices you looking, but she doesn’t exactly look content. Still, she offloaded far more eggs than she had any right to expect, and seems to be grateful. Your thoughts are still hazy, but it makes you wonder what these parasitic females would be like if they didn’t have eggs driving them into rut all the time. You don’t put much thought into it though, because what point would there be if the cute little bunnies couldn’t fill you with eggs? You give the bunny girl a wave goodbye as you set off over the sand. You spend the next few minutes trying to clear your head and focus on what you have to do next.");
	output("\n\nSome time later, you feel the lapinara anesthetic starting to wear off. Because you know what’s coming, you manage to sit down before the rush of pleasure hits you like an avalanche. The endless vibrations of pleasure have once again invaded your [pc.groin], and there’s nothing to do but sit back and enjoy it. After a few minutes that seem like hours, you’re back to normal and once again making your way across the junk-strewn sand.");

	processTime(5);
	pc.changeLust(20);
	// Apply vaginally/anally filled status as appropriate, 2400ml
	//Fen note: done in prev scene.
	// PC has lapinara egg pregnancy, pregnancyQuantity = 8
	addLapinaraEgg(6, x);
	output("\n\n");
	CombatManager.genericVictory();
}

//Optional Continuation 3 - Reverse Cowgirl Milking
//Button Text: “Egg Milking”
//Button Tooltip: “You may not be able to ride the ovi-dong anymore, but there are other ways to get your little bunny to cum.”
//Orifice Priority: Same orifice as used in previous scene.
//Prerequisites: LapiTraining > 2
//Greyed-Out Text: “No matter how much your body wants to, you aren’t sure if you can fit more eggs inside you. You’re certain that after this litter is born you’ll be able to handle it.”

//variable to randomize lapinara’s total egg count. Results in either 1 or 2
public function finalLapinaraEggStuffScene(x:int):void
{
	clearOutput();
	lapinaraBust();
	author("ThaumX");
	var randEggs:Number = rand(2) + 1;
	//IF LapiTrain == 4 THEN
	if(lapiTrain() >= 4) output("This isn’t your first time squeezing the most out of a defeated futa bunny, so you know exactly what to do. You lick your [pc.lips] as you prepare to get started, wondering if this time you’ll be able to completely empty the bunny’s pseudo-sack inside you.");
	else output("Sitting on what is rapidly becoming your favorite spot, you run your hand " + (pc.hasHair() ? "through your [pc.hair]" : "across your head") + " and ponder the problem of making your bunny cum. She may technically be female, but you figure that it’d probably work if you treated her like a normal male you wanted to milk.");
	output(" When you prepare to reposition yourself, you find that your anticipation has restored some measure of strength to your [pc.legOrLegs]. You lift yourself halfway off the rod embedded in you and start to turn your body. It’s a bit awkward, but before long you’re able to plop back down in a reverse cowgirl position. You sigh contentedly as your [pc.vagOrAss " + x + "] is once again full, momentarily distracted by a brief intensification of your fading orgasm. You won’t be sidetracked, however, and immediately continue your preparations. You take all the weight off your [pc.legOrLegs]");
	if(pc.legCount > 1 && pc.hasKnees()) output(", and leverage your [pc.hips] to splay your [pc.legsNoun] open wide and rest the heels of your [pc.feet] on the sand");
	output(".");

	output("\n\nWith your weight now resting solely on your lapinara cushion, you reach down and grab the cheeks of your [pc.butt] and spread them apart. Momentarily suspended on the fat egg-layer impaling your [pc.vagOrAss " + x + "], you hold back a moan as your body slides down another ");
	if(pc.buttRating() < 5) output("fraction of an inch");
	else if(pc.buttRating() < 10) output("inch");
	else if(pc.buttRating() < 15) output("inch and a half");
	else if(pc.buttRating() < 20) output("two inches");
	else output("several inches");
	output(" of the girthy meat.");

	output("\n\nFirmly hilted, you’re ready to get down to business. You bend over as much as you can with the unyielding cock inside you forcing your lower back to stay ramrod straight. ");
	if(pc.biggestTitSize() >= 7) 
	{
		output("Unfortunately, your [pc.chest] block your line of sight, preventing you from getting a good look at the futa’s egg sack. You let out a disappointed sigh, but because it can’t be helped, you’ll have to work by touch alone. You stretch your [pc.arms] down toward the bunny’s groin, squeezing your [pc.breasts] between them, ");
		if(pc.isLactating()) output("causing a spray of [pc.milk] to splatter across the sand.");
		else output("no doubt providing a provocative display if there was anyone around to see it.");
	}
	else if(pc.hasCock()) output("You peer around your still-dribbling [pc.cocks] to get a good look at the futa’s egg sack. It looks like there’s still plenty left, and your body shivers with anticipation of your prize. You stretch your [pc.arms] down toward the bunny’s groin, shifting your shoulders forward to increase your reach.");
	else output("You peer down at the futa’s egg sack, still swollen with eggs and visibly throbbing for release. A shiver starts at your [pc.vagOrAss " + x + "] and spreads through your body as you take in the prize waiting for you. You stretch your [pc.arms] down toward the bunny’s groin, shifting your shoulders forward to increase your reach.");
	output(" You use one hand to start gently kneading the lapinara’s ovary sack, while the other starts rubbing the rim of her tight anus. Both are already soaked with a mix of fluids, no doubt increasing the effect of your ministrations.");

	//This is a short paragraph for futa players with a cock long enough for autofellatio. I am ‘changing’ the required length to 20% of height due to the situation. In humans (that aren’t overweight or have limits to their flexibility) 10% is sufficient for most people to perform autofellatio anyways. This won’t interfere with normal masturbation scenes, so should be fine. Of course, change it if you need to! ^_^
	// IF pc.cocks[n].cLength / pc.tallness >= 0.2 THEN
	//Fen note: no cheating! Autofellatio requirements are what they are!
	if(pc.canAutoFellate(-1))
	{
		output("\n\nWhile you’re able to reach everything okay, you find that your [pc.cockBiggest] is constantly getting in the way and preventing you from properly milking the lapinara. That [pc.cumNoun]-drizzling penis is rock hard, and simply springs back after any attempt to reposition it. Needing it out of the way, you stop fondling the egg sack for a moment and firmly grasp your misbehaving member. Your hunched-over posture provides an obvious solution, prompting you to do what everyone does when they have more things to hold than hands to hold them. Bending the [pc.cockBiggest] at the root, ");
		if(pc.biggestTitSize() >= 7) output("you force it between your tightly-squeezed [pc.biggestBreastDescript]. The tremendous member won’t be contained, however, and juts out proudly at your face.");
		else output("you leverage it up towards your face.");
		output(" This close, you can see the dribbling stream of [pc.cumColor] ejaculate in minute detail, your unending chemical orgasm forcing it out as fast as your body can produce it.");
		// IF pc has perk ‘Autofellatio Queen’ || ‘Auto-Autofellatio’ || ‘Dumb-4-Cum OR pcData.autofellatioTimes > 2 THEN
		if(pc.hasPerk("Autofellatio Queen") || pc.hasPerk("Auto-Autofellatio") || pc.hasPerk("Dumb4Cum")) output(" You can’t resist that delicious [pc.cum], and you suck your [pc.cockHeadBiggest] past your [pc.lips] without a second thought. Savoring the flavor of your own [pc.cum], you almost forget the reason for putting in your mouth in the first place. Though you’d probably do it regardless, you suck hard on your [pc.cockHeadBiggest] to help keep it from escaping.");
		else output(" Your mind is too busy trying to focus on your goal through the rampant pleasure, and you simply don’t stop to consider what you’re about to do. You pop your [pc.cockHeadBiggest] into your mouth, sucking it deeper to help hold it in place.");
		output(" Your [pc.cockBiggest] now out of the way, you return your hand and begin kneading the buny’s pseudo-sack once more.");
		// proc Autofellatio Queen energy gain
		//Fen Note: Done automatically via loadInMouth below :3
		// proc oral cumflation, amount = pc.ballEfficiency * 200ml * pc.refractoryRate // by default this would work out to 3*200=600, 600*1=600ml. Players with higher efficiency or refractory rate will have consumed more. (a ‘boosted’ player might swallow 25*200*3 for 15,000ml) The idea is that the pc is leaking cum about as fast as it’s made, so cumflation amount would depend on their production during the event.
		//Fen note - I think 3 orgasms worth is plenty.
		pc.ballFullness = 100;
		pc.loadInMouth(pc);
		pc.ballFullness = 100;
		pc.loadInMouth(pc);
		pc.ballFullness = 100;
		pc.loadInMouth(pc);
		// END IF
	}
	output("\n\nIt would seem that lapinara are sensitive to ovary play, or at least your particular bunny has become sensitive, because you’ve been hearing moaning the whole time you’ve been playing with her exposed sack. As for yourself, that last whopper of an orgasm keeps going... Perhaps that intense girlcum being pumped into you has something to do with it. Whatever the reason, you certainly won’t complain. If you were more cognizant, you might even consider preserving some fresh samples to send to Steele Tech, to be licensed off as a pleasure enhancement chem. You’ve been massaging the bunny’s full sack and pert tailhole for a few minutes now, but the erotic noises from behind you aren’t getting any more intense. If anything, the moans have taken on a certain needy quality, as if desperate for release. Suddenly, you feel the bunny’s paws gripping your [pc.hips], trying futilely to pull you down further. You know what that means! ");
	if(pc.canAutoFellate(-1)) output("You attempt to smile around the [pc.cockHeadBiggest] stuffed in your mouth, and prepare to send the desperate bunny over the edge.");
	else output("Your [pc.lipsChaste] quirk upward in a smile as you prepare to send the desperate bunny over the edge.");

	output("\n\nGiving your impregnator no warning, you plunge your sodden finger into her ass and give her egg sack a good squeeze. You hear a loud yelp of pleasure, and you’re rewarded with another bout of undulating pressure reverberating inside you. Your orgasm explodes back into potency at the sensation, ");
	if(pc.canAutoFellate(-1)) output("forcing you to let your [pc.cockBiggest] flop out of your mouth as you scream out your ecstasy.");
	else output("forcing you to scream out your ecstasy.");
	output(" Even through the distracting bliss, you’re surprised when you feel the scrotum squeezed in your hand suddenly deflate a little, one of the eggs inside sucked out by some miracle of anatomy. Moments later, you feel the lapinara’s ovipositor bulge outward inside you, as the egg begins its journey down the thick egg layer. The egg finally arrives in its new home after a journey that seemed to last forever. The sensation is just as intense as before, and you only manage to keep squeezing the bunny’s egg sack because you brain was too busy to let your hand muscles relax. Regardless of the reason, your persistence is rewarded when you feel the sack shrink once more.");

	//This part is a sort of reward for players with the broodmother perk. Instead of passing out with the second egg, the PC manages to milk the bunny dry before passing out. It’s hinted at in the beginning of Cont. 3, where the PC mentions finally getting all the eggs.
	// IF LapiTrain == 4 THEN
	if(lapiTrain() >= 4)
	{
		output("\n\nYou steel yourself for the onslaught of pleasure you know is coming, attempting to focus exclusively on the somewhat deflated bag cupped in your hand. When you feel the next egg bolus sliding into you, you bite your [pc.lip], using the pain to help keep you in control. You squeeze the bunny’s egg sack harder, and push like you’re trying to shove the whole thing back inside her body. Your efforts bear fruit, and you feel the eggs being sucked up toward the lapinara’s ovipositor one-by-one. One, two, ");
		if(randEggs == 1) output("and finally three eggs disappear into the bunny’s body to start making their way into their new home.");
		else output("three, and finally four eggs disappear into the bunny’s body to start making their way into their new home.");
		output(" You’re left pushing against two large ovoids embedded in the bunny’s body at the base of the pseudo-sack. The ovaries hadn’t been noticeable before, but it seems you finally managed to completely empty the futa girl’s nutsack of eggs. You don’t have any time to celebrate your accomplishment, however, as all those remaining eggs start shoving their way inside you. Being ravaged by something resembling a ");
		if(CodexManager.entryUnlocked("Kui-Tan")) output("kui-tan cock covered in knots ");
		else output("cock covered in knots ");
		output("blows away your ability to reason. All there is, everything, becomes ecstasy as the overdose of fem cum combines with the extreme stimulation to completely overload your brain. Your [pc.face] goes slack while your [pc.eyes] stare blankly into space. Your body slumps over, only held upright by the thick ovipositor that now makes up the core of your existence. When the first egg of the bunch finally lodges inside you, the burst of pleasure shoots you past the breaking point. You lose consciousness, your mind too tired for anything but dreamless sleep.");
		if(x >= 0) pc.loadInCunt(enemy,x);
		else pc.loadInAss(enemy);
		
		//if(!pc.hasPerk("Broodmother")) gainBroodmotherPerk(); 9999 - Disabled!
	}
	// ELSE
	else
	{
		output("\n\nYou thought you had adapted to the ludicrous pleasure, but it seems your assumption was premature. The overwhelming pleasure erupting from the new egg knot stretching its way inside you blows away your ability to reason. All there is, everything, becomes ecstasy as the overdose of fem cum completely overloads your brain. Your [pc.face] goes slack while your [pc.eyes] stare blankly into space. Your body slumps over, only held upright by the thick ovipositor that now makes up the core of your existence. When the egg finally lodges inside you, the burst of pleasure shoots you past the breaking point. You lose consciousness, your mind too tired for anything but dreamless sleep.");
	}
	processTime(30);
	pc.orgasm();
	pc.orgasm();
	if(x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	clearMenu();
	addButton(0,"Next",finalEggSlutWrapup,[randEggs, x]);
}

public function finalEggSlutWrapup(arg:Array):void
{
	clearOutput();
	lapinaraBust();
	author("ThaumX");
	processTime(150+rand(15));
	output("When you come to sometime later, you find yourself laying on the sand ");
	if(hours >= 5 || hours < 20) output("in the shade of a fin-like piece of debris.");
	else output("in a spot sheltered by a small pile of metallic debris.");
	output(" You feel simply <i>amazing</i>, you feel so content that you’re practically bubbling with happiness. You take a moment lying in the warm sand to just appreciate everything, all the while enjoying the giddiness suffusing you. Despite the contentment and overall ecstatic mood, you still seem to be clear headed. It just seems that the more eggs you have inside you, the more powerful the effect of their combined hormones. You might enjoy... hell, you love a good egging, but you know it isn’t for everyone. Maybe one day when you’re in charge of Steele Tech, you can have them figure out how to distill whatever these eggs do into a pill. It’d probably make a fortune.");
	output("\n\nAfter a few more minutes of blissful contemplation, you finally sit up and take a look around. You don’t see your lover bunny anywhere, but you do see that all of your stuff has been neatly stacked a few feet away from you. You can also make out the drag marks and occasional footprint left in the sand from when the lapinara moved you over here. It seems she was plenty appreciative about you taking so many eggs off her hands, or out of her sack, as it were. After spending a few more minutes thinking about your cute futa bunny, you stand up and start getting ready to depart. Soon you’re setting off across the desert once more, but this time you have a spring in your step and a smile on your face.\n\n");
	
	// increment orgasm count by 1
	pc.orgasm();
	// IF player has broodmother perk THEN
	if(pc.hasPerk("Broodmother"))
	{
		//Apply vaginally/anally filled status as appropriate, 5000ml
		//Fen note: Done in previous scene via load-in
		//PC has lapinara egg pregnancy, pregnancyQuantity = 16 + (randEggs * 2) //18 or 20
		addLapinaraEgg(14 + (arg[0]*2), arg[1]);
	}
	else
	{
		//Apply vaginally/anally filled status as appropriate, 3000ml
		//Fen note: Done in previous scene via load-in
		//PC has lapinara egg pregnancy, pregnancyQuantity = 12
		addLapinaraEgg(10, arg[1]);
	}
	output("\n\n");
	CombatManager.genericVictory();
}


// Egg check
public function addLapinaraEgg(nEggs:int = 2, x:int = -99):void
{
	// Specific womb
	var idx:int = -99;
	
	if(x == -1 || (x >= 0 && x < pc.pregnancyData.length)) {
		idx = (x == -1 ? 3 : x);
	}
	// Any valid womb
	else {
		for(var i:int = 0; i < pc.pregnancyData.length; i++)
		{
			if(pc.pregnancyData[i].pregnancyType == "LapinaraPregnancy") { idx = i; break; }
		}
	}
	
	if(idx < 0) return;
	
	if(pc.pregnancyData[idx].pregnancyType == "LapinaraPregnancy")
	{
		pc.pregnancyData[idx].pregnancyQuantity += nEggs;
		pc.addPregnancyBellyMod(idx, nEggs * 5, false);
	}
}

public function lapinaraBirthinBuhbies(pregSlot:int):void
{
	clearOutput();
	author("ThaumX");
	showName("LAPINARA\nBIRTH!");
	var pData:PregnancyData = (pc.pregnancyData[pregSlot] as PregnancyData);
	var x:int = pregSlot;
	if(pregSlot == 3) x == -1;
	
	output("The contractions have been getting closer and closer, and you know that the next might be the start of pushing out the first of your baby bunnies. Rather than being worried about pain, however, you’re looking forward to it. The birthing has become more and more pleasurable, each new contraction eclipsing the pleasure from the last. It brings to mind the feeling you got from the parasitic lapinara’s anesthetic fem cum. You don’t know what caused this change, whether it was the water breaking or something else; all you know is that each new contraction feels better than the last.");
	output("\n\nYou’re certain that pushing out the first baby is going to push you over the edge, at least it will if you haven’t started cumming already. You enter the ecstasy of another contraction, there’s no baby yet, but it takes you right to the brink of orgasm. You’re left gasping for a minute before the next contraction starts, and this time you feel something catch and start to slide slowly out of you. The sensation is beyond what you had imagined; a sudden onslaught of pleasure so intense that calling it an orgasm doesn’t do it justice. You weren’t prepared, there was no way you could BE prepared for something so powerful.");
	output("\n\nThe pleasure takes away your ability to reason, and you lose any ability to understand what is going on. The world goes dark as your brain struggles to cope with sensations it was never meant to experience. All that remains of your world is pleasure, ecstasy, bliss, pushing, and more pleasure. You experience brief snippets of reality: a tiny mewling sound, something sliding out of you, new pressure on a [pc.milkyNipple], and a new smell, a whole jumble of impressions that don’t mean anything to you in your nearly-catatonic state.");
	if(x >= 0) pc.cuntChange(x,1500);
	else pc.buttChange(1500);
	
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",lapinaraBirthinBuhbies2,pregSlot);
}

public function lapinaraTrainingUpdate(kids:Number = 4):void
{
	if(lapiTrain() < 1 && kids >= 4) lapiTrain(1);
	else if(lapiTrain() < 2 && kids >= 6) lapiTrain(1);
	else if(lapiTrain() < 3 && kids >= 8) lapiTrain(1);
	else if(lapiTrain() < 4 && kids >= 12) lapiTrain(1);
}

public function lapinaraBirthinBuhbies2(pregSlot:int):void
{
	clearOutput();
	author("ThaumX");
	
	var pData:PregnancyData = (pc.pregnancyData[pregSlot] as PregnancyData);
	var x:int = pregSlot;
	if(pregSlot == 3) x == -1;

	output("When you awake sometime later, you’re struck by a horrible empty feeling. You feel so wrong, so hollow that it hurts. You look around desperately for your babies, wanting to hold them and feed them and somehow fill this wretched emptiness....");
	output("\n\nOf course, they are nowhere to be found. It took minutes of sobbing searching before you finally realized what had happened... that that evil machine had come and stole your babies while you were asleep. Your pain turns to rage and you vow to destroy it bolt by bolt, to make it suffer for what it’s done. You spend the next several minutes in a fragile mental state, inconsolable and sobbing as you slowly piece yourself back together.");
	output("\n\nEventually, painfully, you regain your sanity. You remember who you are, and what you’re doing. You know that the drone only took the babies to be cared for in your nursery, it wasn’t a malicious torture device. While you’re back to who you once were, the painful emptiness can’t be escaped. You remember that you have your own goals, and that there’s more to life than simply being pregnant.");
	output("\n\nWhile your lack of babies isn’t as raggedly painful as before, you can already feel your subconscious beginning to scream for replacements. It’s almost as if your body has decided that because it can’t take care of it’s babies, it’ll have to make more right away. The shock of losing your young so soon has put you into a <b>Deep Lapinara Heat.</b> You know that if you give in to these desires, the same tragedy with the nursery drone is going to repeat again.");
	output("\n\nYou know that you don’t have time to take care of a litter of babies once they’re born. You still can’t stop from wanting it though, wanting to return to that blissful feeling that seems so far away now. You also know that you have a choice, that you don’t have to give into the desires. You also know just how good it would feel, and that you have a whole nursery wing on Tavros to allow you to indulge yourself. You don’t know what you’ll decide yet, but you realize that you’d better be very careful to stay away from anything that could impregnate you unless you want your mind made up for you.");
	processTime(150+rand(30));
	
	lapiPregEndCheck(pc, pregSlot);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function lapiPregEndCheck(mother:Creature, pregSlot:int, deltaTime:int = 0, fromNursery:Boolean = false):void
{
	if(!(mother is PlayerCharacter)) return;
	
	var gainHeat:Boolean = (mother.fertility() > 0 && mother.hasVagina());
	
	// Post Effects
	if(fromNursery)
	{
		var vIdx:int = pregSlot;
		if(pregSlot == 3) vIdx == -1;
		if(vIdx >= 0) mother.cuntChange(vIdx, 1500, false);
		else mother.buttChange(1500, false);
		
		if(gainHeat) AddLogEvent("With your lack of babies, you can already feel your subconscious beginning to scream for replacements. It’s as if your body has decided that because it can’t retain all it’s babies, it’ll have to make more right away. The shock of handing your young to the nursery so soon has put you into a <b>Deep Lapinara Heat.</b> You know that if you give in to these desires, the process is going to repeat again.", "passive", deltaTime);
	}
	
	if(mother.fertilityRaw < 10) mother.fertilityRaw++;
	if(mother.pregnancyIncubationBonusMotherRaw < lapiTrain()) mother.pregnancyIncubationBonusMotherRaw++;
	
	//Give Deep Lapinara Heat Status Effect
	if(!gainHeat) { /* Nada! */ }
	else if(!mother.inHeat()) mother.createStatusEffect("Heat", 10, 35, 25, 5, false, "LustUp", "", false, 28800, 0xB793C4);
	else if(!mother.inDeepHeat())
	{
		mother.setStatusValue("Heat", 1, 10);
		mother.setStatusValue("Heat", 2, 35);
		mother.setStatusValue("Heat", 3, 25);
		mother.setStatusValue("Heat", 4, 5);
		mother.extendHeat(7 * 24 * 60);
	}
	else if(mother.heatMinutes() < 22 * 24 * 60) mother.extendHeat(7 * 24 * 60);
	mother.setStatusTooltip("Heat", "<b>You are in a deep heat!</b> Now that you’re no longer gestating any eggs or nursing any bunnies you have an insatiable need to breed. Perhaps you should avoid people if you don’t want to succumb to your desires and get pregnant again.\n\n+" + mother.statusEffectv1("Heat") * 100 + "% Fertility\n+" + mother.statusEffectv2("Heat") + " Minimum Lust\n+" + mother.statusEffectv3("Heat") + " Libido\n+" + mother.statusEffectv4("Heat") + " Tease Damage");
}
	
public function gainBroodmotherPerk():void
{
	// Perk: Broodmother
	// v1: Mother’s pregnancyMultiplier() bonus.
	// v2: Pregnancy’s pregnancyQuantity multiplier.
	// v3: 
	// v4: 
	pc.createPerk("Broodmother", 0.5, 2, 0, 0, "Increases the maximum gestation quantity of pregnancies, where possible.");
	
	// Unlock Broodmother perk
	output("\n\n(<b>Perk Gained: Broodmother</b> - Adapting to a higher birth count, your body has the potential to gestate up to twice the maximum amount of offspring for a given pregnancy.)");
}

