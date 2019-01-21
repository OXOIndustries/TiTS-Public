// Pre-battle add-on text for Nenne
public function nenneRoomTextBonerus():Boolean
{
	//start fite
	startWarLionFight(true);
	if(flags["WARGII_NENNE_SAVED"] == undefined)
	{
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
		default:
			break;
	}
}
public function wargiiFightWinRouting():void
{
	if(!fightHasCaptive()) CombatManager.genericVictory();
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
				output("\n\nBehind your foe is the stunned form of " + (flags["MET_LUND"] == undefined ? "a short, male korgonne":"Lund") + ". He's bruised and battered, but alive. Uncertain wobbles plague his steps; perhaps he's recently suffered a blow to the head. <b>If you defeat [enemy.himHer], you can free him from whatever depravity the savage [enemy.manWoman] intends!</b>");
			default:
				break;
		}
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
	//if(flags["WARGII_NENNE_SAVED"] == undefined) counter++;
	if(flags["WARGII_HEIDRUN_SAVED"] == undefined) captives.push(["Heidrun"]);
	if(flags["WARGII_LUND_SAVED"] == undefined) captives.push(["Lund"]);
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
	author("Fenoxo");
	output("With the milodan dispatched, you’re able to cut " + (flags["MET_HEIDRUN"] == undefined ? "the korgonne":"Heidrun") + " free. She thanks you tearfully, giving you a crushingly squishy hug, then takes off at a run before you can say a single thing to her. It’s probably best she find a place to hide for now.");
	if(flags["MET_HEIDRUN"] == undefined) output("\n\n<b>You saved another korgonne!</b>");
	else output("\n\n<b>You saved Heidrun!</b>");
	flags["WARGII_HEIDRUN_SAVED"] = 1;
	output("\n\n");
	CombatManager.genericVictory();
}

public function saveLund():void
{
	clearOutput();
	showLund();
	author("Fenoxo");
	if(lundBroken()) output("You waste no time in freeing Lund of his restraints and he leaps up, wrapping his arms around your waist. <i>“" + (!korgiTranslate() ? "Thanking [pc.master]! Lund wrist so sore...":"Thank you, [pc.master]! My wrists were so sore...") + "”</i> he whines. The seemingly refreshed korgonne sighs after a couple of seconds, looks around, and gives you an unbidden kiss on the cheek before bounding away, picking up a fallen spear on the way. Sneaky pup.");
	else output("You waste no time in freeing " + (flags["MET_LUND"] == undefined ? "the korgonne male":"Lund") + " from his restraints, but he shows no sign of thanks. Rubbing his wrists, he straightens and says, <i>“" + (!korgiTranslate() ? "Lund not needing help. Saving self would have.":"I didn’t need any help. I would’ve saved myself in a few minutes.") + "”</i> The sly korgonne scans his surroundings, then stalks off with a hunter’s grace, liberating a fallen spear on his way.");
	flags["WARGII_LUND_SAVED"] = 1;
	output("\n\n");
	CombatManager.genericVictory();
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
	flags["MET_NENNE"] = 1;
	output("\n\nAlthough you’re certain it’s working, Nenne can’t help but start crying all over again. The tears stream from her and she buries her face into your chest to hide from the unfamiliarity of her own hold. When you try to stand, she clutches you tighter and whimpers, begging you to remain still, as if where she is right now is the safest place in the whole universe.");
	output("\n\nYou try and reason with Nenne, gently reassuring her that she’s safe, but you need to hurry and hide her before any more Milodan come stumbling into her shop. You’re glad that she’s safe, but there are other Korgonne that need your help, and you can’t do that if Nenne is clinging to you the way she is.");
	output("\n\nYour words make it through to her, and she steadily releases her iron-tight grip on you, but it happens in ‘sections:’ first her paws lighten their grip on you just a little, and then her limbs unwrap from you just a little, and the process repeats until she’s released from you. All except for her left paw, which has found your way into your hand – she refuses to let that go. <i>“Okay,”</i> she whispers.");
	output("\n\nThe sounds of the Milodan ransacking the hold bounce of the stony walls, making it sound like they’re never too far away. You give her store a sweep, and although it’s certainly a mess after the Milodan had its way with it, there are no undesirables in either her shop or her living area. It’s safe for her here, but you nonetheless tell her to hide somewhere if she can.");
	output("\n\n<i>“Thank you,”</i> she whispers to you. She leans in close and draws a single, long lick up your cheek, letting you know how much she appreciates you coming to her rescue. <i>“" + (!korgiTranslate() ? "Thinking of what monsters doing to Nenne–":"I don’t want to think about what those monsters were going to do–") + "”</i>");
	output("\n\n<i>“Then don’t,”</i> you tell her, and she stops immediately. You repeat your instructions and tell her to make as little noise as possible; the Milodans won’t come back in here if they think it’s already been sacked and everything of value’s been taken.");
	output("\n\n<i>“" + !(korgiTranslate() ? "Waiting for moment of one":"Wait a moment") + ",”</i> she says, and you do so: you post yourself at the door to her apartment and keep an eye out into the hold. Although it doesn’t sound very friendly out there, you don’t see anyone coming in your direction. Nenne, meanwhile, disappears deeper into her apartment, and she emerges with a bouquet flowers in her hand.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Flower of sexy smelling-good":"These flowers emit a lust-inducing pheromone") + ",”</i> she says as she hands them to you. <i>“" + (!korgiTranslate() ? "Many effect on Korgonne. Helping will against Milodan":"It’s works wonders on the Korgonne; it’ll help you if you use them against the Milodan") + ".”</i>");
	output("\n\nYou take the bouquet and resist the urge to give the flowers a whiff yourself. Nenne is confident that the pheromones that these flowers emit will help you if you ever fight against a Milodan; you store them away and thank her for the foresight.");
	output("\n\n<i>“" + (korgiTranslate() ? "Helping Nenne; help Nenne help pups of Nenne. Please. Not letting Milodan hurting pups of Nenne.":"You saved me. Let me help you save my children. Please. Don’t let those monsters hurt my kids.") + "”</i>");
	output("\n\nYou promise her that you’ll do what it takes to rescue the Korg’ii hold. It placates her, and she lets you leave.");
	processTime(15);
	var aphrobutt:AphroDaisy = new AphroDaisy();
	aphrobutt.quantity = 5;
	enemy.inventory.push(aphrobutt);
	output("\n\n");
	flags["WARGII_NENNE_SAVED"] = 1;
	CombatManager.genericVictory();
}