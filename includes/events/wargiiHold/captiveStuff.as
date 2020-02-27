// Pre-battle add-on text for Nenne
public function nenneRoomTextBonerus():Boolean
{
	if(flags["WARGII_NENNE_SAVED"] == undefined)
	{
		//start fite
		startWarLionFight(true);
		clearOutput();
		showName((flags["MET_NENNE"] != undefined ? "SAVING\nNENNE":"SAVE\nA KORG"));
		showBust(nenneBustString(),"WAR_LION");
		author("B");
		output("You step into a shop that has a mortar and pestle on a plaque just outside the door. " + (flags["MET_NENNE"] != undefined ? "You keep your eyes peeled for Nenne and her whereabouts; you don’t want to leave any Korgonne behind":"You’re searching for any further Milodan to hunt down in the hold, and this shop just happened to be your next stop") + ".");
		output("\n\nAs you expected, you see that the place has been ransacked and dishevelled from a conflict, but what you hadn’t expected is that the offender is still in the shop. A tall Milodan stands in the room, perusing the wares of the apothecary, before it hears you and turns about, facing you down.");
		output("\n\nBehind the Milodan warrior, you see " + (flags["MET_NENNE"] != undefined ? "Nenne":"an older, female Korgonne with green eyes and greyed fur") + ", tied up in knots: a rope is going around her neck and mouth, gagging her, and that rope is connected to her wrists, and her wrists are tied to her ankles, and her ankles are tied to her knees. Her movement is completely restricted, and if she tried anyway, the noose around her neck would become tighter.");
		output("\n\nThe Milodan warrior had been carrying " + (flags["MET_NENNE"] != undefined ? "Nenne":"her") + " piggyback-style. When the captive dog-woman’s eyes meet yours, they dilate, and her breath catches in her chest. You can see that the fur on her cheeks have been matted down in long streaks connected to her eyes. Her body grows completely still – she wants to believe that you’ll help her, but she’s too afraid of the Milodan to call out to you or to struggle for her own freedom.");
		output("\n\nThe Milodan swiftly recognizes your aggressive posture and drops " + (flags["MET_NENNE"] != undefined ? "Nenne":"the Korgonne") + " like a sack. Her body flops onto the floor of the hold with a thick thud. <b>If you can win this fight, you’ll rescue " + (flags["MET_NENNE"] != undefined ? "Nenne":"another Korgonne") + "!</b>");
		//Apply captive: (Nenne 1);
		enemy.createStatusEffect("Has Captive",1);
		flags["TUNDRA_STEP"] = 0;
		return true;
	}
	else
	{
		output("As you expected, you see that the place has been ransacked and dishevelled from a conflict - your recent conflict, when you fought the milodan to rescue Nenne. The korgonne herself has likely taken to hiding in one of the smaller siderooms amongst the clutter. You can return to the battle through the doorway to the south.\n\n<b>You won’t be buying any more herbs until you win the battle!</b>");
		return wargiiEncounterStuff();
	}
	return false;
}

//THIS IS A FUCKING HACK, AND I KNOW IT. DEEEEEAL.
public function fightHasCaptive():Boolean
{
	return(enemy.hasStatusEffect("Has Captive"));
}
public function captiveRescueButton(arg:Number):void
{
	switch(enemy.statusEffectv1("Has Captive"))
	{
		//Nenne
		case 1:
			addButton(arg,"Rescue",saveNenne);
			break;
		case 2:
			addButton(arg,"Rescue",saveHeidrun);
			break;
		case 3:
			addButton(arg,"Rescue",saveLund);
			break;
		case 4:
			addButton(arg,"Rescue",rescueTuuvaBlurb);
			break;
		case 5:
			addButton(arg,"Rescue",rescueMaja);
			break;
		case 6:
			addButton(arg,"Rescue",rescueKiona);
			break;
		default:
			break;
	}
}
public function wargiiFightWinRouting():void
{
	trace("SCORE: " + wargiiScore());
	if(!inCombat())
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	if(!fightHasCaptive())
	{
		if(CombatManager.hasFriendlyOfClass(Tuuva)) {
			clearMenu();
			addButton(0,"Next",tuuvaAssistCombatOutro);
		}
		else CombatManager.genericVictory();
		IncrementFlag("WARGII_FIGHTS_WON");
	}
	else
	{
		switch(enemy.statusEffectv1("Has Captive"))
		{
			//Nenne
			case 1:
				clearMenu();
				addButton(0,"Next",saveNenne);
				break;
			case 2:
				clearMenu();
				addButton(0,"Next",saveHeidrun);
				break;
			case 3:
				clearMenu();
				addButton(0,"Next",saveLund);
				break;
			case 4:
				clearMenu();
				addButton(0,"Next",rescueTuuvaBlurb);
				break;
			case 5:
				clearMenu();
				addButton(0,"Next",rescueMaja);
				break;
			case 6:
				clearMenu();
				addButton(0,"Next",rescueKiona);
				break;
			default:
				CombatManager.genericVictory();
				break;
		}
	}
}

public function randomKorgSavingProcChances():void
{
	if(!enemy.hasStatusEffect("Has Captive") && korgCaptivesRemaining() > 0 && rand(5) == 0)
	{
		enemy.createStatusEffect("Has Captive",pickAKorgCaptiveNumber());
		switch(enemy.statusEffectv1("Has Captive"))
		{
			//Nenne
			case 1:
				break;
			//Heidrun
			case 2:
				addBust("HEIDRUN");
				output("\n\nBehind the hostile is " + (flags["MET_HEIDRUN"] == undefined ? "a korgonne with absolutely enormous tits":"Heidrun") + ", lead by tight leash. She looks to you plaintively. <b>If you defeat [enemy.himHer], you can free her from whatever depravity the savage [enemy.manWoman] intends!</b>");
				break;
			//Lund
			case 3:
				addBust("LUND");
				output("\n\nBehind your foe is the stunned form of " + (flags["MET_LUND"] == undefined ? "a short, male korgonne":"Lund") + ". He’s bruised and battered, but alive. Uncertain wobbles plague his steps; perhaps he’s recently suffered a blow to the head. <b>If you defeat [enemy.himHer], you can free him from whatever depravity the savage [enemy.manWoman] intends!</b>");
				break;
			//Maja
			case 5:
				addBust("MAJA");
				//Majas wargii hold rescue
				output("\n\nYou can see Maja behind the milodan. Her knees and elbows are tied to the ring of Savicite on her top, effectively leaving her in a forced fetal position. Her tail wags enthusiastically as she watches you fight, but a gag prevents her from cheering you on.");
				break;
			//Kiona
			case 6:
				addBust("KIONA");
				//kiona wargii hold rescue
				kionaWargiiPrebattle();
				break;
			default:
				break;
		}
	}
	else if(!enemy.hasStatusEffect("Has Captive") && flags["WARGII_TUUVA_SAVED"] != undefined && !pc.hasStatusEffect("Tuuva Combat CD") && rand(3) == 0) 
	{
		tuuvaJoinsTheBattle();
	}
}

public function tuuvaJoinsTheBattle():void
{
	//addBust(tuuvaBustString());
	output("\n\nAs you get ready to engage the milodan menace, you hear a yell ring out from behind you. Looking back, you see a stout figure clad in full plate and wielding a giant hammer charging in your direction. As it comes closer, the angry visage of Tuuva comes into view behind the plate helm. The tiny terror stops next to you and stamps the pommel of her hammer against the ground.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Tuuva help " + (!tuuvaLover() ? "friend":"lover") + " smash dumb kitty faces!");
	else output("I’m here to help crush these stupid cats!");
	output("”</i> She gives you a wink and hoists her hammer back up, assuming a combative stance.");
	var combatTuuva:Tuuva = new Tuuva();
	combatTuuva.cocks = tuuva.cocks;
	CombatManager.addFriendlyActor(combatTuuva);
}

public function tuuvaAssistCombatOutro():void
{
	clearOutput();
	showTuuva();
	author("QuestyRobo");
	output("Tuuva cheers and raises her hammer high into the air.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Dumb kitties no stand up to Tuuva and " + (!tuuvaLover() ? "friend":"lover") + "! Tuuva go, keep fighting, stay safe please!");
	else output("Those Milodans didn’t stand a chance against us! I gotta go and help fight these fuckers off. Keep safe!");
	output("”</i>");
	output("\n\nTuuva runs off, continuing her fight elsewhere.\n\n");
	pc.createStatusEffect("Tuuva Combat CD");
	pc.setStatusMinutes("Tuuva Combat CD",15);
	IncrementFlag("WARGII_FIGHTS_WON");
	CombatManager.genericVictory();
}

public function wargiiLeaveCombatEnd():void
{
	if(CombatManager.hasFriendlyOfClass(Tuuva)) tuuvaAssistCombatOutro();
	else 
	{
		IncrementFlag("WARGII_FIGHTS_WON");
		CombatManager.genericVictory();
	}
}

public function korgCaptivesRemaining():Number
{
	return korgCaptives().length;
}
public function korgCaptives():Array
{
	var captives:Array = [];
	//Doesnt count. Special one.
	//if(flags["WARGII_NENNE_SAVED"] == undefined) captives.push(["Nenne"]);
	if(flags["WARGII_HEIDRUN_SAVED"] == undefined) captives.push(["Heidrun"]);
	if(flags["WARGII_LUND_SAVED"] == undefined) captives.push(["Lund"]);
	if(flags["WARGII_MAJA_SAVED"] == undefined) captives.push(["Maja"]);
	//if(flags["WARGII_TUUVA_SAVED"] == undefined) captives.push(["Tuuva"]);
	if(flags["WARGII_KIONA_SAVED"] == undefined) captives.push(["Kiona"]);
	return captives;
}
public function pickAKorgCaptiveNumber():Number
{
	var captives:Array = korgCaptives();
	var captive:String = captives[rand(captives.length)];
	switch(captive)
	{
		case "Heidrun":
			return 2;
			break;
		case "Lund":
			return 3;
			break;
		case "Maja":
			return 5;
			break;
		case "Kiona":
			return 6;
			break;
		default:
			return 0;
			break;
	}
	return 0;
}

public function saveHeidrun():void
{
	clearOutput();
	showHeidrun();
	showName((flags["MET_HEIDRUN"] != undefined ? "SAVING\nHEIDRUN":"SAVE\nA KORG"));
	author("Fenoxo");
	output("With the milodan dispatched, you’re able to cut " + (flags["MET_HEIDRUN"] == undefined ? "the korgonne":"Heidrun") + " free. She thanks you tearfully, giving you a crushingly squishy hug, then takes off at a run before you can say a single thing to her. It’s probably best she find a place to hide for now.");
	if(flags["MET_HEIDRUN"] == undefined) output("\n\n<b>You saved a korgonne!</b>");
	else output("\n\n<b>You saved Heidrun!</b>");
	flags["WARGII_HEIDRUN_SAVED"] = 1;
	flags["TUNDRA_STEP"] = 0;
	output("\n\n");
	CombatManager.genericVictory();
	IncrementFlag("WARGII_FIGHTS_WON");
}

public function saveLund():void
{
	clearOutput();
	showLund();
	showName((flags["MET_LUND"] != undefined ? "SAVING\nLUND":"SAVE\nA KORG"));
	author("Fenoxo");
	if(lundBroken()) output("You waste no time in freeing Lund of his restraints and he leaps up, wrapping his arms around your waist. <i>“" + (!korgiTranslate() ? "Thanking [pc.master]! Lund wrist so sore...":"Thank you, [pc.master]! My wrists were so sore...") + "”</i> he whines. The seemingly refreshed korgonne sighs after a couple of seconds, looks around, and gives you an unbidden kiss on the cheek before bounding away, picking up a fallen spear on the way. Sneaky pup.");
	else output("You waste no time in freeing " + (flags["MET_LUND"] == undefined ? "the korgonne male":"Lund") + " from his restraints, but he shows no sign of thanks. Rubbing his wrists, he straightens and says, <i>“" + (!korgiTranslate() ? "Lund not needing help. Saving self would have.":"I didn’t need any help. I would’ve saved myself in a few minutes.") + "”</i> The sly korgonne scans his surroundings, then stalks off with a hunter’s grace, liberating a fallen spear on his way.");
	if(flags["MET_LUND"] == undefined) output("\n\n<b>You saved a korgonne!</b>");
	else output("\n\n<b>You saved Lund!</b>");
	flags["WARGII_LUND_SAVED"] = 1;
	flags["TUNDRA_STEP"] = 0;
	output("\n\n");
	CombatManager.genericVictory();
	IncrementFlag("WARGII_FIGHTS_WON");
}

// post-battle text for Nenne
public function saveNenne():void
{
	clearOutput();
	showNenne();
	showName((flags["MET_NENNE"] != undefined ? "SAVING\nNENNE":"SAVE\nA KORG"));
	author("B");
	output("You push past the body of collapsed Milodan warrior to get to " + (flags["MET_NENNE"] != undefined ? "Nenne":"the tied-up Korgonne") + " and her prone form. Her eyes are still on yours and her body is shaking like a leaf; the whites of her eyes have reddened because she was too afraid to blink. When your hand gently lays on her shoulder, she flinches, even though she knows (you think) that it’s only you.");
	output("\n\nYou whisper gentle reassurances as you work gently on the knots of the rope keeping her bound, starting with the two around her mouth and neck. You’re sure to keep physical contact with her, but to keep it gentle: a soft pat on the head, and a squeeze on the shoulder, to let her know that it’s you and that she’s safe. Although her body never stops its quivering, it seems to work, and she becomes visibly calmer over time.");
	output("\n\nAs soon as the last rope keeping her in place is undone, she rolls onto her front, and then she lunges at you, wrapping her limbs around your body and squeezing you tightly to her. You hug her back and keep up your whispering, telling her that she’s safe and that you’re there for her. " + (flags["MET_NENNE"] == undefined ? "In an effort to help calm her, you introduce yourself, and ask her what her own name is. It’s a bit muffled, but you can hear her say the name ‘Nenne,’ through shivering, clattering teeth.":""));
	if(flags["MET_NENNE"] == undefined) flags["MET_NENNE"] = 1;
	output("\n\nAlthough you’re certain it’s working, Nenne can’t help but start crying all over again. The tears stream from her and she buries her face into your chest to hide from the unfamiliarity of her own hold. When you try to stand, she clutches you tighter and whimpers, begging you to remain still, as if where she is right now is the safest place in the whole universe.");
	output("\n\nYou try and reason with Nenne, gently reassuring her that she’s safe, but you need to hurry and hide her before any more Milodan come stumbling into her shop. You’re glad that she’s safe, but there are other Korgonne that need your help, and you can’t do that if Nenne is clinging to you the way she is.");
	output("\n\nYour words make it through to her, and she steadily releases her iron-tight grip on you, but it happens in ‘sections:’ first her paws lighten their grip on you just a little, and then her limbs unwrap from you just a little, and the process repeats until she’s released from you. All except for her left paw, which has found your way into your hand – she refuses to let that go. <i>“Okay,”</i> she whispers.");
	output("\n\nThe sounds of the Milodan ransacking the hold bounce of the stony walls, making it sound like they’re never too far away. You give her store a sweep, and although it’s certainly a mess after the Milodan had its way with it, there are no undesirables in either her shop or her living area. It’s safe for her here, but you nonetheless tell her to hide somewhere if she can.");
	output("\n\n<i>“Thank you,”</i> she whispers to you. She leans in close and draws a single, long lick up your cheek, letting you know how much she appreciates you coming to her rescue. <i>“" + (!korgiTranslate() ? "Thinking of what monsters doing to Nenne–":"I don’t want to think about what those monsters were going to do–") + "”</i>");
	output("\n\n<i>“Then don’t,”</i> you tell her, and she stops immediately. You repeat your instructions and tell her to make as little noise as possible; the Milodans won’t come back in here if they think it’s already been sacked and everything of value’s been taken.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Waiting for moment of one":"Wait a moment") + ",”</i> she says, and you do so: you post yourself at the door to her apartment and keep an eye out into the hold. Although it doesn’t sound very friendly out there, you don’t see anyone coming in your direction. Nenne, meanwhile, disappears deeper into her apartment, and she emerges with a bouquet flowers in her hand.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Flower of sexy smelling-good":"These flowers emit a lust-inducing pheromone") + ",”</i> she says as she hands them to you. <i>“" + (!korgiTranslate() ? "Many effect on Korgonne. Helping will against Milodan":"It’s works wonders on the Korgonne; it’ll help you if you use them against the Milodan") + ".”</i>");
	output("\n\nYou take the bouquet and resist the urge to give the flowers a whiff yourself. Nenne is confident that the pheromones that these flowers emit will help you if you ever fight against a Milodan; you store them away and thank her for the foresight.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Helping Nenne; help Nenne help pups of Nenne. Please. Not letting Milodan hurting pups of Nenne.":"You saved me. Let me help you save my children. Please. Don’t let those monsters hurt my kids.") + "”</i>");
	output("\n\nYou promise her that you’ll do what it takes to rescue the Korg’ii hold. It placates her, and she lets you leave.");
	processTime(15);
	var aphrobutt:AphroDaisy = new AphroDaisy();
	aphrobutt.quantity = 5;
	enemy.inventory.push(aphrobutt);
	output("\n\n<b>You saved Nenne!</b>");
	flags["WARGII_NENNE_SAVED"] = 1;
	flags["TUNDRA_STEP"] = 0;
	output("\n\n");
	CombatManager.genericVictory();
	IncrementFlag("WARGII_FIGHTS_WON");
}


//rescued
public function rescueMaja():void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	showName((flags["MET_MAJA"] != undefined ? "SAVING\nMAJA":"SAVE\nA KORG"));
	author("Fenoxo");
	output("You rush to " + (flags["MET_MAJA"] != undefined ? "the korgonne" : "Maja") + "’s side as the milodan collapses, Cutting away her restraints and pulling the gag from her mouth. She works her jaw for a few seconds, massaging her cheeks before jumping into a sudden hug.");
	if(flags["MET_MAJA"] == undefined)
	{
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Stranger savings! M-Maja name Maja!");
		else output("You’ve come to save me! My name’s Maja!");
		output("”</i> The korgonne muffles into you.");
		output("\n\n<i>“[pc.fullName],”</i> you respond.");
		flags["MET_MAJA"] = 1;
	}
	output("\n\n<i>“" + (!korgiTranslate() ? "Many thankings! Maja thought milodan would carry her off for good,":"Thank you! I thought I was done for,") + "”</i> She says, clinging to you while she talks. She lets you go in short order, brushing herself off and adjusting her top. A shadow of worry still coats her features, and she glances off in the direction of the bottom floors.");
	output("\n\n<i>“" + (!korgiTranslate() ? "The animals! Animals still downstairs! Steele help? Maja need helpings, not safe to check alone. Get captured again,":"The animals! My animals are still trapped downstairs! Can you help me check on them? I’ll just get captured again if I go alone,") + "”</i> she begs, her tail giving a few subdued shakes as she looks back and forth through the halls.");
	output("\n\n<i>“");
	if(pc.isBimbo()) output("Those poor things! Of course I’ll come help,");
	else if(pc.isNice()) output("Of course I’ll come, we’ll make sure they’re safe,");
	else if(pc.isMischievous()) output("As cute as you looked all tied up like that, I don’t want them carting you off,");
	else output("I’ll be out a mount if they do anything down there, so count me in,");
	output("”</i> you reply, glancing around to regain your bearings. Maja scoots off in the direction of the stairs, hugging the walls and moving so carefully that her paws hardly make a sound on the cavern floor. You can hear fighting going on all around you, with explosions reverberating through the open passages at odd intervals. Hopefully they aren’t able to fully collapse any tunnels before you find whoever’s in charge.");
	output("\n\nYour would be guide ducks off before you can see what path she’s taking, leaving you to fight your way through the milodan attackers. Some of those animals might be a good help in the close quarters fighting of the tunnels, if you can make it down there.");
	output("\n\n<b>You saved Maja!</b>");
	flags["WARGII_MAJA_SAVED"] = 1;
	flags["TUNDRA_STEP"] = 0;
	output("\n\n");
	CombatManager.genericVictory();
	IncrementFlag("WARGII_FIGHTS_WON");
}

//pc enters tamed tamelings
//if(flags["WARGII_MAJA_SAVED"] == 1) majaTamelingFreething
public function majaTamelingFreething():void
{
	author("Gardeford");
	showBust("MAJA");
	showName("\nMAJA");
	output("\n\nA single milodan digs through the things atop Maja’s desk, looking to have already pillaged the boxes and bags around the room in search of loot. Maja creeps forward " + (silly ? "examining a fallen post before shaking her head. She hefts her massive bust as she sneaks up behind the looter. With one swift move she turns her body and smashes her chest into the back of the cat-man’s knees, when he falls with a huff she lifts her breasts and brings them slapping down onto his head. He bounces off the table, falling into a mewling stupor.":"examining a fallen post and grasping it with both hands. She deftly sneaks up to the looter, leveling her improvised club. In one swift move she brings the long stake into the back of the cat-man’s knees. When he falls with a huff she lifts her weapon and brings it down on his head, reducing him to a mewling stupor."));
	output("\n\nYou hear a scuffling noise from the pen room, and another milodan rushes into the office area. Her attention is trained entirely on Maja, so she doesn’t notice when you kick one of the barrels. The tumbling container knocks her legs out from under her. She falls on her face, scrambling to regain her bearings. Unfortunately, she stays down just long enough for Maja to " + (silly ? "give her the kind of tiddy drop that would get a gorillion upvotes on the extranet":"smack her on the head with her length of post") + ".");
	output("\n\nNo more sound comes from the animal pens barring the curious cooing and grunting of the animals themselves, but the two of you still edge carefully into the back area. The food storage and extra bedding are ransacked, but you can’t see any other milodan in the area. Some of the kor’diiak paw excitedly at the fence when they see Maja round the corner. She drops her club, scooting over to the gate as quickly as she can and comforting the animals. You walk up to the nog’wich pen, petting a few of the younger cat-horse’s who are curious enough to investigate. You turn in time to see Maja undoing the lock on the kor’diiak cage.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Maja send kor’diiak to help with fighting. Many strongs, bigger than milodan. Maybe think twice about weapons. If kor’diiak di- get hurt, they take up space in passage, block way for intruders. Kor’diiak much smart though, know not to run into shootings. Maja will stay with these milodan, Keep them from getting into trouble. Maybe give taste of own medicine,":"I’ll send out some of the kor’diiak to help with the fighting. The milodan might think twice about kil- about shooting them if their bodies will block important passageways. They’re smart though, and they should know well enough to not run into the line of fire if they can’t attack first. I’ll stay here with these two, make sure they don’t get into trouble. Maybe i’ll give them a taste of their own medicine if they’re up for it,") + "”</i> she gives you a half-hearted smile.");
	output("\n\n<i>“I’m sure they’ll be fine. I’ll help get this sorted out soon.”</i> You step to the side to give some kor’diiaks the space to step through the doorway. They squeeze past, lumbering towards the sounds of fighting. You duck out after they’re through, moving toward the throne room.");
	flags["WARGII_MAJA_SAVED"] = 2;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//kiona
public function kionaWargiiPrebattle():void
{
	var haveMet:Boolean = false;
	if (flags["KIONA_MET"] == 1) haveMet = true;
	
	//we want to clear the usual intro text for the attacker
	clearOutput();
	
	output("Everywhere around you is chaos. There is no shortage of rifle blasts reverberating through Korg’ii Hold’s corridors, or yelping and howling as the hostile takeover progresses. You’ve seen a number of korgonne guards fight back against their assailants, though not a great deal many have been able to stand up to the vast difference in armament grades so far.");
	output("\n\nWhile traversing the hallway, you come across one such fight smack dab in the middle of your path. A towering hulk of a milodan has its high-tech rifle pointed right at the korgonne. Despite staring down the barrel of a large gun, she shows no sign of wanting to back down.");
	if (haveMet) output(" Now that you think about it, this korgonne looks distinctly familiar. Looking at the numerous piercings dotting her body, you can tell that she’s definitely Kiona!");
	output(" She has on a reinforced fur cloak overtop of some delicate jeweled clothing. Against the milodan warrior’s weaponry, however, you doubt it will do very much to protect her.");
	output("\n\nWithout warning, " + (haveMet ? "Kiona" : "the korgonne") + " bursts forward towards her opponent, brandishing a pair of daggers. She makes a few feints along the way, deftly dodging the hail of fire coming at her. Whenever she can get close enough, she slashes, though her blows bounce uselessly off of the warrior’s armor. While dodging a lunging grab, she reaches into her belt and brings a blowgun to her mouth, firing several darts at her foe, only for the same result to happen.");
	output("\n\nWith a frustrated snarl, she rushes towards the milodan warrior again. When she reaches it, she thrusts a dagger towards a thinner section of its armor. Unlike her usual evasive movements, her attack method is very forceful and straightforward this time. The milodan easily avoids her attempted charge and in the same movement, brings the butt of its gun down on the back of her head. With a heavy thud and a high-pitched yelp, " + (haveMet ? "Kiona" : "the korgonne") + " stumbles and crashes into a pile of broken crates and remains unmoving.");
	output("\n\n<i>“Stupid mutts,”</i> the milodan grumbles. When you step closer, it quickly turns to you and brandishes its weapon at you.");
	output("\n\n<i>“An off-worlder? Here?”</i> The warrior furrows their brow in confusion for a brief moment before adjusting their aim. <b>As much as you want to check on " + (haveMet ? "Kiona’s" : "the korgonne’s") + " safety, you need to get rid of the immediate threat in front of you first.</b> You unsheathe your own weapon and engage the milodan warrior.");
}
public function rescueKiona():void
{	
	clearOutput();
	showKiona(false, true);
	var translateKorgi:Boolean = korgiTranslate();
	var haveMet:Boolean = false;
	if (flags["KIONA_MET"] == 1) haveMet = true;
	
	output("With the milodan warrior out of the way, you rush over to " + (haveMet ? "Kiona" : "the fallen korgonne") + " to make sure that she is okay. You gingerly lift her out of the wreckage of crates and lay her down on the ground. From your cursory examination, a small trickle of blood leaks from an open wound on her forehead, likely from impact with the crates rather than the gun butt. A small lump swells from the impact point of the milodan’s rifle, tender to the touch.");
	output("\n\nYou gather what first-aid materials you have on hand and what you can find in the immediate area, you dress her wound to stop the bleeding. A loud boom reminds you that other hostile invaders are still in the vicinity, and treating an unconscious korgonne in the middle of a high-traffic hallway is asking for more trouble to show up.");
	output("\n\nYou apply the finishing touches before hoisting " + (haveMet ? "Kiona’s" : "the korgonne’s") + " limp body into your arms and make your way over to a well-hidden spot not far off. There, you place her down once more and gently tap her cheek in an attempt to wake her up. " + (haveMet ? "Kiona’s" : "The korgonne’s") + " eyelids flicker open a few moments later, her hazel eyes looking unfocused into yours.");
	if (kionaLuciniteQuestStage() >= 2)
	{
		if (flags["KIONA_TALK_YOU"] == 1) output("\n\n<i>“[pc.name]?”</i>");
		else output("\n\n<i>“Off-worlder?”</i>");
		output(" Kiona groans groggily. She attempts to sit upright, but you prevent her from doing so, urging her to rest.");
		if (translateKorgi) output("\n\n<i>“B-but... I need to help my clanmates. I need to help Korg’ii Hold...”</i>");
		else output("\n\n<i>“B-but... Kiona need helpings clanmates. Needings to help Korg’ii Hold...”</i>");
		output(" She trails off, burying her face into her hands and grunting in pain. As eager as she may be to defend the hold, she’s definitely in no condition to be fighting right now. That blow to the head from earlier is not doing her any favors, and you tell her as much.");
		
		if (translateKorgi) output("\n\n<i>“Urgh... I hate feeling fucking useless. It’s not fair that those damn milodan got a huge -OW- upgrade from last time. They’re like... off-worlder strong all of a sudden.”</i>");
		else output("\n\n<i>“Urgh... Hatings feeling frickin no use. It not fair damn cat-dogs got -OW- huge power up from last time. Fang-cats like... alien-strong all of sudden.”</i>");
		output(" Kiona snarls, smashing a fist into the ground in frustration.");
		output("\n\nIn an attempt to keep her pride intact, you reassure her that the moves that she put on during her fight would have felled any opponent that equally matched her. Your praises work well to placate Kiona, who visibly relaxes the more you comfort her.");
		output("\n\nWhen Kiona finally calms down, you stand up, telling Kiona that you need to be on your way to help any others you see in the hold.");
		if (translateKorgi) output("\n\n<i>“Alright. Be careful out there. As soon as I feel good enough to move on my own, I’ll go back to my shop to defend it.”</i> Kiona smiles slightly before adding, <i>“And kick all of their asses for me!”</i>");
		else output("\n\n<i>“Alright. Careful out there. Soon as Kiona feel good enough to move on own, will go to shop to defend.”</i> Kiona smiles slightly before adding, <i>“And kick all cat-dog arses for Kiona!”</i>");
		output("\n\nYou give her a nod in acknowledgement before heading back into the fray.");
	}
	else
	{
		output("\n\nSuddenly, she springs up from her resting place, pushing you away and backing herself against the nearby wall while reaching for her belt. " + (haveMet ? "Kiona" : "The korgonne") + " pats her hips frantically, searching for her missing weapons. The anxiousness on her face rapidly becomes more evident the more she pats herself down. Finally, she brings her furred fists in front of her in a defensive manner, shielding herself from you.");
		if (translateKorgi) output("\n\n<i>“W-who? " + (haveMet ? "The..." : "An...") + " off-worlder? I’ll hurt you if you come closer! I won’t be your slave!”</i>");
		else output("\n\n<i>“W-who? Alien? Will hurtings if coming closer! Will not be slave!”</i>");
		output(" " + (haveMet ? "Kiona" : "The korgonne") + " shouts at you. She is trembling violently against the wall, whether from fear or the blow to the head you can’t tell.");
		output("\n\nYou do whatever you can to calm her down, telling her that you witnessed her fight, what you did while she was unconscious, and that you are fighting on the korgonnes’ side. By the end of your explanation, she doesn’t seem much less tense than she was to start with, not that you can blame her. Her own home has turned into a warzone in the blink of an eye.");
		
		if (translateKorgi) output("\n\n<i>“I need to get back out there. N-need to help hold... help...”</i>");
		else output("\n\n<i>“Needings to get back out there... Needings to help hold... help...”</i>");
		output(" " + (haveMet ? "Kiona’s" : "The korgonne’s") + " shaking legs buckle underneath of her. You rush over and manage to catch her just before she falls down. You ease her back to her resting spot, urging her to stay there and recover from her injury. She tries to wrestle you away the entire time, but ultimately gives up when her efforts end in vain.");
		output("\n\nAfter making her as comfortable as possible, you reassure her that you’ll do what you can in her place to make sure Korg’ii Hold and its inhabitants are safe. As you turn to leave, you hear a dull thud behind you, followed by a wet sniffle.");
		output("\n\n<i>“Dammit...”</i> she growls through a heavy sob. You continue forward into the fray.");
		flags["KIONA_LUCINITE_QUEST"] = 3;
	}
	
	output("\n\n<b>You saved Kiona!</b>");
	flags["WARGII_KIONA_SAVED"] = 1;
	flags["TUNDRA_STEP"] = 0;
	output("\n\n");
	CombatManager.genericVictory();
	IncrementFlag("WARGII_FIGHTS_WON");
}