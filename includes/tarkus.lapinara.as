import classes.Engine.Combat.DamageTypes.TypeCollection;
//The Lapinara (Junkyard Planet Enemy)
//By WorldofDrakan

//Enemy Lapinara Encounter:
//**All Lapinara have a ⅓ chance of dropping a strange white carrot.

//Finding a Lapinara:
public function encounterALapinara():void
{
	foes = new Array();
	chars["LAPINARAFEMALE"].prepForCombat();
	author("WorldOfDrakan");
	lapinaraBust();
	//[First Encounter]
	if(flags["ENCOUNTERED_PARASITIC_LAPINARA"] == undefined)
	{
		output("\n\nYou tense up nervously at the sound of a rapid pitter-patter of feet from a location that is difficult to discern. It does sound close, however. Are you being followed? You aren’t able to ponder this new development for long. Suddenly, you’re knocked forward as your stalker forcibly piggybacks herself onto you.");
		output("\n\n<i>“Hello, lover,”</i> she coos, sniffing you, feeling you all over. As the strange little alien pokes and prods at your body, your Codex beeps in an urgent message: <i>“Lapinara detected. These rabbit-like aliens enter an aggressive rut-like state when their ovaries have eggs ready. They will then attempt to implant these eggs into a host via an ovipositor. Avoidance is recommended if at all possible.”</i>");
		output("\n\nYou flail about frantically until the creature loses her grip, falling to the ground with a light thud. You’re now able to get a good look at her. She is most definitely a lapinara. She gets up, shaking off dust. Her expression of glee turns into one of mischief and malice.");
		output("\n\n<i>“They’re fun when they play hard to get!”</i>\n\nLooks like this girl isn’t taking no for an answer!");
		flags["ENCOUNTERED_PARASITIC_LAPINARA"] = 0;
		CodexManager.unlockEntry("Lapinara");
	}
	//[Subsequent Encounters]
	else
	{
		output("\n\nYou hear a familiar scurrying of feet from somewhere behind you. You immediately turn around, ready to face your assailant. Sure enough, she’s right there, her eyes wide in an expression of surprise.");
		output("\n\n<i>“So it looks like the prey is getting smart? Oh, I do love a challenge!”</i>");
	}
	flags["ENCOUNTERED_PARASITIC_LAPINARA"]++;
	clearMenu();
	addButton(0,"Next",startCombatLight);
}

public function lapinaraBust():void
{
	if(foes[0].hairColor == "silver") userInterface.showBust("LAPINARA_2");
	else userInterface.showBust("LAPINARA");
}

//Combat Description:
//**Combat stats to be determined by Fen.

public function lapinaraAI():void
{
	lapinaraBust();
	if(rand(3) == 0) lapinaraHornCharge();
	else if(rand(2) == 0) lapinaraFalconPunch();
	else lapinaraBite();
}

//Horn Charge:
public function lapinaraHornCharge():void
{
	//Dodge: 
	if(combatMiss(foes[0],pc)) output("The lapinara charges at you. Thanks to your evasive skills, you manage to sidestep her attack. She stumbles slightly as she misses her target.");
	//Hit (shield is down): 
	else
	{
		var damage:TypeCollection = foes[0].meleeDamage();
		damage.add(8);
		damageRand(damage, 15);
		
		if(pc.shields() > 0) 
		{
			output("The lapinara charges at you, ramming your shield.");
			applyDamage(damage, foes[0], pc);
		}
		else
		{
			//Hit (backfire, rare; requires armor):
			if(pc.armor.defense > 0 && rand(3) == 0) 
			{
				output("The lapinara charges at you, ramming you. However, thanks to your protective armor, she is instead knocked aback, stunned.");
				foes[0].createStatusEffect("Stunned",1,0,0,0,false,"Stunned","Cannot act for a turn.",true,0);
			}
			else 
			{
				output("The lapinara charges at you, ramming you, the painful impact briefly staggering you.");
				applyDamage(damage, foes[0], pc);
			}
		}
	}
	processCombat();
}


//Punch:
public function lapinaraFalconPunch():void
{
	//Dodge:
	if(combatMiss(foes[0],pc)) output("The lapinara attempts to swing at you, but you deftly dodge and deflect every punch she sends your way.");
	else {
		if(pc.shields() > 0) output("The lapinara punches, aiming for your gut, but instead connecting with your shield.");
		else output("The lapinara delivers a swift blow to your gut, briefly doubling you over. Ow.");
		
		var damage:TypeCollection = foes[0].meleeDamage();
		damageRand(damage, 15);
		applyDamage(damage, foes[0], pc);
	}
	processCombat();
}

//Bite:
public function lapinaraBite():void
{
	var damage:TypeCollection = new TypeCollection( { kinetic: 5 + (foes[0].physique() / 2) }, DamageFlag.PENETRATING);
	damageRand(damage, 15);
	
	//Dodge: 
	if(combatMiss(foes[0],pc)) output("The lapinara lunges at you. Thanks to your evasive skills, you manage to sidestep her attack. She stumbles slightly as she misses her target.");
	else
	{
		//Hit (shield is up): 
		if(pc.shields() > 0) output("The lapinara lunges forward, attempting to bite you. Instead, her powerful teeth connect with your shield. She jumps back, rubbing her mouth in pain.");
		//Hit (shield is down):
		else output("The lapinara lunges forward, grabbing ahold of your arm and painfully sinking her teeth into your flesh.");
		applyDamage(damage, foes[0], pc);
	}
	processCombat();
}
	
/*Tail Trip:
**She will only attempt this if your shield is down. You really don’t want her to succeed at this attack (or maybe you do?).

Dodge: <i>“The lapinara swings her tail in the direction of your [pc.legs]. Thinking fast, you jump, her tail swishing harmlessly under you.”</i>
Hit: <i>“The lapinara swings her tail in the direction of your [pc.legs], subsequently tripping you. She immediately hops on top of you, pinning you down. Damn, she’s strong for such a little thing! You'll need to break free of her grasp, and fast!”</i>
Struggle (strength, succeed):  <i>“You pry the lapinara off you you, tossing her backwards and you get back on your feet.”</i>
Struggle (reflex, succeed): <i>“You manage to slip out from under the lapinara, clearly catching her off guard.”</i>
Struggle (first fail, both strength and reflex): <i>“The lapinara strengthens her grasp, pulling a syringe from her belt. She uncaps it, delving the needle into your neck. You scream loudly. The pain is unbearable! As she withdraws you needle, you can already feel the potent drug going to work on your body. You'll need to break free soon, before this drug overwhelms you!”</i>
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

//Sex Scenes:
//Egg Implantation (lapinara wins):
public function loseToFemaleLapinara():void
{
	if(!pc.hasVagina() || (pc.hasCock() && rand(2) == 0)) loseToLapinaraAndGetEggplantedDudesAndNeuters();
	else loseToLapinaraAndGetEggplantedChicks();
}

public function loseToLapinaraAndGetEggplantedDudesAndNeuters():void
{
	author("WorldOfDrakan");
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
	if(pc.legCount < 2) output(" 'em");
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

	output("\n\nNo way. This bitch! She’s implanting her eggs in you! Soon enough, you feel a new sensation, a new object in your ass, likely one of her damn eggs. You see the bunny-girl thrashing about madly in a fit of pleasure, and it isn’t long before another one comes in behind its brother. You’re sure that it has to be the last of the eggs, as she’s collapsed over you, panting. Eventually, she pulls out, playfully rustling your hair.");

	output("\n\n<i>“You felt amazing, tiger,”</i> she comments. <i>“We should do that again sometime.”</i>");
	output("\n\nIt’s then that she leaves without another word, rapidly disappearing into the landscape.\n\n");
	//No orgasm? +10 lust!
	pc.lust(10+rand(3));
	processTime(20+rand(4));
	genericLoss();
}

//(Female/Herm Variant)
public function loseToLapinaraAndGetEggplantedChicks():void
{
	author("WorldOfDrakan");
	lapinaraBust();
	var x:int = rand(pc.vaginaTotal());
	output("\n\nYour lapinara assailant grins wickedly as she admires you, her prize. She approaches you, forcibly removing your [pc.gear]. The sex-crazed bunny-girl takes a moment to inspect your [pc.crotch]. You see her nodding in silent approval. She then moves a hand down to play with [pc.oneVagina], licking her lips in anticipation as she gently rubs your [pc.clits] with her thumb, another finger prodding at your entrance.");
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
	if(pc.legCount < 2) output(" 'em");
	output(",”</i> she orders once more, waving a syringe in your face.");
	output("\n\nYou really don’t want to experience whatever it is she has in that syringe. It can’t be pleasant. At all. You do as the bunny says, albeit rolling your eyes as you do.");
	output("\n\n<i>“That’s a good " + pc.mf("boy","girl") + ",”</i> she coos, giving your [pc.clits] a rewarding touch before grabbing ahold of your [pc.legOrLegs]. You won’t be moving");
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
	output("\n\nNo way. This bitch! She’s implanting her eggs in you! Soon enough, you feel a new sensation, a new object in your vag, likely one of her damn eggs. You see the bunny-girl thrashing about madly in a fit of pleasure, and it isn’t long before another one comes in behind its brother. You’re sure that it has to be the last of the eggs, as she’s collapsed over you, panting. Eventually, she pulls out, playfully rustling your hair.");

	output("\n\n<i>“You felt amazing, Babe. We should do that again sometime.”</i>");

	output("\n\nShe leaves without another word, rapidly disappearing into the landscape.\n\n");

	//No cums for pc. +10 lust. Poor PC.
	pc.lust(10);
	processTime(20+rand(4));
	genericLoss();
}

public function defeatDatLapinara():void
{
	author("WorldOfDrakan");
	lapinaraBust();
	//Lapinara Loses By HP:
	if(foes[0].HP() < 1)
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
	if(pc.lust() >= 33) output("\n\nThat does sound like a tempting offer. What will you do?");
	else {
		output("\n\nYou aren't any where near horny enough to even consider the offer.\n\n");
		clearMenu();
		addButton(14,"Leave",genericVictory);
		return;
	}
	clearMenu();
	if(pc.hasCock()) 
	{
		addButton(0,"Pitch Anal",targetLapinaraSex,lapinaraButtfuckSelector,"Pitch Anal","Attempt to fuck her butt, or if you're too big, hotdog her.");
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
	addButton(14,"Leave",genericVictory);
}

//Cunt Tail Fuck (PC Wins):
//**Requires a cunt tail, obviously.
public function cuntTailFuckLapinaraParasitic():void
{
	clearOutput();
	author("WorldOfDrakan");
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
	pc.lust(+10);
	processTime(20+rand(5));
	//Feed cunt tail mebbe? Nah...
	genericVictory();
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
			output("\n<b>" + (x+1) + ":</b> " + pc.cockNoun(pc.cocks[x].cType, false, false));
			addButton(x,upperCase(num2Text((x+1))),targetFunc,x);
		}
	}
}

public function lapinaraButtfuckSelector(cockNum:int = 0):void
{
	if(pc.cocks[x].cLength() > 20) hotdoggingALapinara(cockNum);
	else buttFuckALapinara(cockNum);
}

//Buttfuck (PC Wins):
//**Requires penis.
public function buttFuckALapinara(cockNum:int = 0):void
{
	clearOutput();
	author("WorldOfDrakan");
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
	output("\n\n<i>“You’re fucking amazing...”</i> she finally speaks up, a dazed look on her face. <i>“We really need to do that again sometime.”</i>");
	processTime(20+rand(5));
	pc.orgasm();
	genericVictory();
}

//(Dick Too Big Variant (Hotdogging))
//**Cock/Biggest cock must be more than 20 inches in length.
public function hotdoggingALapinara(cockNum:int = 0):void
{
	clearOutput();
	author("WorldOfDrakan");
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

	output("\n\nOh, so she wants to go for some hotdogging? Clever girl! You give her a-okay to continue. Without another word, the lapinara skillfully rubbing your length between her spacious rump cheeks. They’re so delightfully soft! Occasionally, she takes the time to give your cock a playful squeeze with her tail and hand as well, stroking herself all the while. It is then that you notice something peculiar about her dick. It’s swollen to nearly three times its original width!");
	output("\n\n<i>“E-EGG eggeggEGG!”</i> she whines lustily, now pistoning her hand over her pseudocock at a rate you would have never imagined possible.");
	output("\n\nA mere seconds later, you lose it, blowing your [pc.cumColor] spooge all over her back. At the same time, two soft-shelled eggs shoot from her cock in rapid succession with a loud pop, landing onto your chest. She slumps over you, exhausted and at a loss for breath.");
	output("\n\n<i>“You’re fucking amazing...”</i> she finally speaks up, a dazed look on her face. <i>“We really need to do that again sometime.”</i>\n\n");
	processTime(20+rand(5));
	pc.orgasm();
	genericVictory();
}

//Get Licked (PC Wins):
public function getLickedByLapinara():void
{
	clearOutput();
	author("WorldOfDrakan");
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

	output("\n\nWithout further interruption, the lapinara gets to licking. She starts by gingerly tracing your outer lips with her tongue, pulling them apart to expose your labia, taking a moment to gently nibble on the folds. She then moves on to [pc.oneClit], kissing it lovingly before cusping her mouth over it, suckling.");
	output("\n\nYou gasp in surprise as you feel one of your partner’s fingers slipping into your vag, then two, then three... With her free hand, she furiously pumps her pseudocock, eliciting girly moans from deep within her throat. You swear that you can make out words in her muffled moans. Something about eggs, you think.");
	output("\n\nIt isn’t much longer before you reach orgasm, your inner walls reflexively clamping down on the lapinara’s skilled fingers. She releases her mouth from your clit, wailing to the sky as a strange popping sound originates from under her. A quick glance reveals two soft-shelled eggs on the ground that weren’t there before.");
	output("\n\n<i>“That was fun!”</i> she comments, catching her breath. <i>“Do you think that we could do that again sometime?”</i>");
	output("\n\nYou very well might like to do that again someday.\n\n");
	processTime(20+rand(5));
	pc.orgasm();
	genericVictory();
}

//Get Blown (PC Wins):
//**Requires penis.
public function getBlownByLapinara(cockNum:int = 0):void
{
	var x:int = cockNum;
	if(x < 0) x = pc.biggestCockIndex();
	clearOutput();
	author("WorldOfDrakan");
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
		output("\n\nAnd without another word, she cups her mouth over your [pc.cock " + x + "]. You groan softly as her warmth envelops you. She starts off slow, but it isn’t long before she’s completely deepthroating you, her muscles contracting pleasantly around your length, and she still manages to keep a hand on her own dick. She’s a fucking natural!");
		
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
		output("\n\nAnd without another word, she cups her mouth over your [pc.cock " + x + "]. You groan softly as her warmth envelops you. She starts off slow, but it isn’t long before she’s got half of your length in her mouth, completely deepthroating it, her muscles contracting pleasantly around your length, and she still manages to keep a hand on her own dick. She’s a fucking natural!");
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
		output("\n\nAnd without another word, she cups her mouth over your [pc.cock " + x + "]. You groan softly as her warmth envelops you. She starts off slow, and isn’t able to take much more than one fourth of the length, but she makes do with what she has, completely deepthroating it, her muscles contracting pleasantly around your length. And she still manages to keep a hand on her own dick. She’s a fucking natural!");
	}
	output("\n\nEventually, you swear that you can make out words in her muffled grunting. Something about eggs? Nevermind that. Your thoughts are lost in the amazing orgasm that you’re experiencing. ");
	//Small-Medium Cums: 
	if(pc.cumQ() <= 100) output("She swallows the load easily, and you can even make out a faint smile on her lips as she does.");
	//Large Cums:
	else if(pc.cumQ() < 300) output("She swallows your load with some difficulty, a look of strong concentration on her face the whole time.");
	else output("Try as she may, she is completely unable to take the whole load. Some makes it in, but the rest splatters all over her face.");
	output(" A quick glance reveals what she was whining about earlier: Two soft-shelled eggs on the ground below her that weren’t there before.");

	output("\n\n<i>“Delicious!”</i> she exclaims, finally coming back to her senses. <i>“You need to give me some more of that sometime.”</i>\n\n");
	processTime(20+rand(5));
	pc.orgasm();
	genericVictory();
}