/*
EITAN_PRISONER_NEGOTIATIONS:
-1, 2 asked for food
-3, asked for strippers
-4, asked for booze
-5, asked for medicine and air, PC hasn't talked to ula about it
-6, asked for medicine and air, PC has talked to ula about it
-7, asked for undershirt
-8, asked for water, PC hasn't talked to ula about it
-9, asked for water, PC has talked to ula about it
-10, asked for audience
-11, had audience
*/

public function ulaEitanBonus():void
{
	output("\n\nUla drums her clawtips against the throne in idle, distracted thought. She hasn’t noticed you yet; her eyes have the faraway look of someone trying to work through a difficult problem.");
	addButton(0, "Ula", ulaEitanTalk);
}

public function eitanBustDisplay(nude:Boolean = false):String
{
	return (nude ? "WAR_ALPHA_NUDE" : "WAR_ALPHA");
}

public function showEitan(nude:Boolean = false):void
{
	author("B");
	showBust(eitanBustDisplay(nude));
	showName("\nEITAN");
}

public function getEitan():Eitan
{
	return new Eitan();
}

public function canEitanEat(food:ItemSlotClass):Boolean
{
	if (food.type != GLOBAL.FOOD) return false;
	if (food is HealingPoultice) return false;
	return true;
}

public function canEitanDrink(drink:ItemSlotClass):Boolean
{
	if (drink.hasFlag(GLOBAL.ITEM_FLAG_ALCOHOLIC)) return true;
	return false;
}

public function canEitanHeal(drug:ItemSlotClass):Boolean
{
	// The only medicine that I could find was V-Ko offering Immuno-Boosters, so that’d have to do, unless you can think of something else to include.
	// Blacklist Nenne’s Healing Pultice, though
	if (drug is HealingPoultice) return false;
	if (drug.hasFlag(GLOBAL.ITEM_FLAG_MEDICINE)) return true;
	//if (drug is FSrgKit) return true;
	//if (drug is DoctorsBag) return true;
	return false;
}

public function canEitanWear(clothes:ItemSlotClass):Boolean
{
	if (clothes.type != GLOBAL.UPPER_UNDERGARMENT) return false;
	if (clothes.longName.toLowerCase().indexOf("undershirt") < 0) return false;
	return true;
}

public function wargiiMilodanTribeFreed():Boolean
{
	return flags["EITAN_PRISONER_NEGOTIATIONS"] > 10;
}

public function hasSexedEitan(countSparring:Boolean = true):Boolean
{
	return timesSexedEitan(countSparring) > 0;
}

public function timesSexedEitan(countSparring:Boolean = true):int
{
	var count:int = 0;
	if (countSparring)
	{
		if (flags["EITAN_SPAR_WIN_SEX"] != undefined) count += flags["EITAN_SPAR_WIN_SEX"];
		if (flags["EITAN_SPAR_LOSS_SEX"] != undefined) count += flags["EITAN_SPAR_LOSS_SEX"];
	}
	if (flags["EITAN_SEXED"] != undefined) count += flags["EITAN_SEXED"];
	return count;
}

public function ulaEitanTalk():void
{
	clearMenu();
	clearOutput();
	showUla();
	author("B & Fenoxo");
	processTime(4);

	output("You clear your throat as you approach Ula, startling her into scrabbling to a fully upright and completely presentable posture before she realizes that it’s you, not some stuffy korg noble. <i>“[pc.name]!”</i> She speaks your name like it’s the brightest rainbow on a cloudy day, and her tail noisily thwacks against the throne. <i>“" + (korgiTranslate() ? "I’ve been wanting to see you!" : "Was wanting see you!") + "”</i>");
	output("\n\n<i>“Oh?”</i> You step a little closer and ask");
	if (pc.isNice()) output(" how you can help.");
	else if (pc.isMisch()) output(" after what’s been bothering her.");
	else output(" what her problem is.");
	output("\n\n<i>“" + (korgiTranslate() ? "The milodan" : "Fang-cat") + " prisoners,”</i> she grouses, tail wags abruptly ceasing. <i>“" + (korgiTranslate() ? "I thought they’d be good for helping the gem-hearts in the tunnels. They’re big and strong, so they should be good at swinging picks and even better at hauling rocks" : "Think good for helping gem-hearts in tunnels. Milos big and strong, so swing pick good and carry rocks better") + ", right?”</i> She sighs and slaps a plush paw against her forehead, wearing a look irritation once it rebounds off. <i>“Too dumb. " + (korgiTranslate() ? "They think just because they’re bigger they can fight back, even in chains. Stupid cats. Our guards have energy shields and guns, but they still try. They get beaten down and end up too hurt to work, but we still have to feed them!" : "Think just because bigger can fight back even in chain. Stupid cats. Korg guards having shimmerbelts and guns, but still fight. Get beat down, then too hurt to work, but Korg’ii still have to feed!") + "”</i> She sighs. <i>“" + (korgiTranslate() ? "It could be worse, but I can’t stop thinking about it. There has to be a solution." : "Could being worse, but can’t stop thinking on. Must be some solve for problem.") + "”</i>");
	output("\n\nThat... is a hard situation, and you say as much.");
	output("\n\n<i>“It is,”</i> she agrees, reaching for the codex she has stashed in the arm of her throne. <i>“" + (korgiTranslate() ? "I researched what core worlds do. Killing the troublemakers’ kin seems to work, but it’s so" : "Researchinged what core clans do. Killing all problem makers’ kin seem work, but such") + " evil.”</i> She shudders. <i>“So monstrous. " + (korgiTranslate() ? "We are" : "Korg’ii") + " not like that. Never like that.”</i> She taps a finger on the screen. <i>“" + (korgiTranslate() ? "Others suggest mind control, but that’s not an option either. Even if we had the technology, I don’t really want to. Fool korgonne would be too tempted to abuse it." : "Others say controlling of minds, but not option either. Not have right core magics for doing, and not really wanting either. Too tempting for fool-korg to cause mischief.") + "”</i> She pouts. <i>“" + (korgiTranslate() ? "Being a leader is hard. I understand father-Chief better now, even if he’s been wrong many times." : "Leadership hard. Understanding father-Chief better now, even if he wrong many times.") + "”</i>");
	output("\n\nYou consider the situation for a moment: the milodan army, now essentially slave labor, is rebelling in spite of the supposedly temporary nature of their imprisonment. In short, they’re behaving like violent, unruly brutes, and Ula is unwilling to use the sort of brutality that would be necessary to bring them to heel. Still, perhaps there is another way. These milodans are intensely tribal, perhaps even moreso than the clannish korgonne...");
	output("\n\nYou point out that the fang-cats slavishly followed a single leader. Perhaps if he can be brought to heel, the rest will follow?");
	output("\n\nUla’s pupils narrow to pinpricks, and her snout flexes halfway into a toothy snarl. She looks more savage in this moment than any other time you’ve seen her, even mid-battle. <i>“" + (korgiTranslate() ? "The War Alpha is the worst of the bunch." : "War Alpha worst of bunch.") + "”</i> She clearly remembers the incident in the clan chief’s bedroom more clearly than you. Leaning forward, she looks for all the world like she wants to order his execution this very moment. <i>“" + (korgiTranslate() ? "More brutal than a butcher, more savage than a hunter, and greedier than a gem-heart." : "More brutal than butcher, more savage than hunter, more greedy than gem-heart.") + "”</i> She waves, then deflates, tucking her chin into her fluffy chest. <i>“" + (korgiTranslate() ? "But you are probably right. Tame the Alpha, and you tame them all." : "[pc.name] probably righting, though. Tame Alpha, tame whole tribe.") + "”</i>");
	output("\n\nIt’s certainly better than trying to reform the milodan one-by-one, which would take a lifetime or an entire hold worth of therapy korgs.");
	output("\n\nThe Chieftess’s nose continues to crinkle, and her eyes look away in frustration. <i>“Fine,”</i> she manages to say, <i>“but maybe " + (korgiTranslate() ? "you can help? We’re already wasting enough hands on guards, and I might want to kill that milodan if I see him again." : "good alien helping? Korg’ii already wasting many paws on guardings, and Ula not maybe want kill fang-cat if see again.") + "”</i>");

	addButton(0, "Help", steeleTakesUpHerdingBaraCats);
	addButton(1, "Not Now", ulaHasToWaitCauseYouHaveSlutsToDo);
}

public function ulaHasToWaitCauseYouHaveSlutsToDo():void
{
	clearMenu();
	clearOutput();
	showUla();
	author("B & Fenoxo");
	processTime(1);

	flags["ULA_HELP_MILO_NOT_NOW"] = 1;

	output("You tell Ula that you’re not ready to take on such a task right now.");
	output("\n\nThe fluffy Chieftess nods solemnly. <i>“" + (korgiTranslate() ?"I understand. Many tasks and troubles remain in the stars, awaiting your assistance. Korg’ii Hold shall remain, strong." : "Ula understand. Many tasks and troubles in stars needing [pc.name] helpings. Korg’ii Hold strong.") + "”</i> She slaps her fist proudly into the armrest of her chair. <i>“" + (korgiTranslate() ? "We’ll handle the prisoners fine. If feedings become a problem, we can always trade some of the extra gems the milodans are digging out for more food. The battle left us stronger. I just wish we could smooth over this one last problem." : "Handling prisoners fine. If feedings become problems, can tradings the extra gems milodans finding for more foods. Battle leave us stronger. Just wishing for last problem be fixed.") + "”</i>");

	ulaMenu();
}

public function steeleTakesUpHerdingBaraCats():void
{
	clearMenu();
	clearOutput();
	showUla();
	author("B & Fenoxo");
	processTime(1);

	output("You tell her that you can get started immediately. Ula reaches for her thigh, to one of the Savicite jewels she had strung up against the fat of her leg, and undoes its knot. <i>“" + (!korgiTranslate() ? "Giving this to mine-guards and saying situation to them. Rock telling guard you doing Chieftess’s work" : "Give this to the guards in the mines and explain the situation. The jewel will let them know that you’re acting on my authority") + ",”</i> she explains, handing the shining trinket over.");
	output("\n\nLike most korgonne jewelry, this particular piece is largely composed of Savicite, but you can tell right away that Ula has given you something a cut above the typical korgonne craftsmanship. The gemstone’s facets are smooth and unblemished, causing the light to reflect through the radioactive crystal in dizzying ways. Feathery strands of platinum weave a protective cocoon around it, and a twisted loop of gold and platinum strands gives way into a solid gold chain with multiple options for wearing on the neck, arm, or thigh as Ula did.");
	output("\n\n(<b>Gained Key Item: Token of Ula’s Favor</b>.)");
	pc.createKeyItem("Token of Ula's Favor");
	output("\n\n<i>“Already feeling better,”</i> Ula admits. She’s already sitting straighter, like a great weight has been lifted from her shoulders. <i>“" + (korgiTranslate() ? "First you save me, then you save the whole clan... maybe... maybe you can save the milodans" : "First [pc.name] save Ula, then save whole clan... maybe... maybe [pc.name] save fang-cats") + " too.”</i> She snorts as if she can’t quite believe what she said. <i>“" + (korgiTranslate() ? "I hope" : "Ula hoping") + " so.”</i>");
	output("\n\nYou nod in response.");

	flags["ULA_HELP_MILO_NOT_NOW"] = undefined;

	ulaMenu();
}

public function prisonerEitanBonus(btnSlot:int = 0):Boolean
{
	if (pc.hasKeyItem("Token of Ula's Favor") && (flags["EITAN_PRISONER_NEGOTIATIONS"] == undefined || flags["EITAN_PRISONER_NEGOTIATIONS"] < 11))
	{
		addButton(btnSlot, "Show Token", (flags["EITAN_PRISONER_NEGOTIATIONS"] == undefined ? meetPrisonerEitan : askToApproachPrisonerEitan));
		return true;
	}
	return false;
}

public function meetPrisonerEitan():void
{
	clearMenu();
	clearOutput();
	showBust("KORGONNE_MALE_GRAY", "KORGONNE_MALE_TAWNY", "KORGONNE_MALE_WHITE");
	author("B & Fenoxo");
	processTime(1);

	output("Showing Ula’s trinket to the guard earns you a look of surprise, respect, and an escort to the lowest mines in the hold, where the milodans are no doubt busy at work.");
	output("\n\nThis deep, you’d expect visibility to be exceedingly poor, but the frequently placed glowing crystals (and naturally occurring veins of them here or there) keep the rough-hewn passage illuminated. The ceilings are higher here than elsewhere, no doubt a result of adjustments for the hold’s taller captives. It would be almost pleasant if it wasn’t for the acrid, sulfurous odor in the air and the smothering geothermal heat roiling out of Uveto’s ocean-buried core.");
	output("\n\nThe sounds of pickaxes chipping against stone is everywhere, almost musical, except for in one direction: toward the captive milodan. From the haphazard impacts, you can already tell that their hearts aren’t in the work. They vary between faint, child-like strikes and booming impacts of frustrated muscles pushed to their limit by futile rage. Through it all, the echos of rough-housing rumble down the halls.");
	output("\n\nThe guards around the milodan living area briefly stop you - until you present Ula’s favor once more. You begin to explain why you’re here, but one waves you to silence. <i>“Don’t care so long as not have to stopping more fights. Follow.”</i> He crooks his finger to follow, and leads you to your target, his fellows shaking their heads in annoyance.");

	addButton(0, "Next", finallyMeetingAnEitan);
}

public function finallyMeetingAnEitan():void
{
	clearMenu();
	clearOutput();
	showBust("KORGONNE_MALE_GRAY", eitanBustDisplay());
	author("B");
	processTime(3);

	output("The lighting is poor; the natural light from the surface hardly reaches this far down, and the best the milodan have are luminous stones embedded into the walls.");
	output("\n\nWhat you <i>do</i> see is what appears to be the entire invading milodan army, each of them holding a pickaxe and chopping away at the stony walls. Bright, illustrious stones clatter to the stony floor where the chipping milodan pick it up and place it in a pouch near to their position. You see two of them fight over a small pebble, before one prevails and puts it in their own bag – they must be rewarded based on their performance. Each of the milodan are connected to the others via an elongated chain, attached to cuffs around their ankles.");
	output("\n\nSome of them notice you, and they sneer and spit. They recognize you. One of them shouts something, but is silenced when your korgonne escort jabs them with the dull end of their spear.");
	output("\n\nIn the far corner, you see one more robust milodan standing taller than his fellows: an absolute brick wall of a milodan, with a blue mohawk of hair, wielding a pickaxe twice the size of the others, and striking the wall with twice the force. He has a number of sacks near to him, each of them filled to the brim with glowing jewels, and he’s well on his way working on his next. He isn’t a part of the chain-gang: instead, he’s wearing a chain-link harness around his torso, connecting him to the floor, locking him in place while still giving him full motion of his arms.");
	output("\n\nUnlike the others, he is silent and diligent in his work, perhaps owing to his solidarity from the rest of the gang. He doesn’t notice you and the korgonne guard approach – that is, until your escort jabs him in the rib with the dull end of his spear. Even then, the massive milodan doesn’t react with pain or discomfort, and more like he just noticed that a child was trying to get his attention.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Having" : "You have") + " company,”</i> the korgonne guard says, and steps aside, giving you and the war alpha your space.");
	output("\n\nIt takes a moment for the war alpha to recognize you in the light of the dungeon. <i>“You,”</i> he thrums, his voice low. He turns his pickaxe down, slamming the flat head of the pick onto the floor.");
	output("\n\nThe loud boom causes the milodan chain-gang to stop and watch. You have an audience.");

	addButton(0, "Next", andItTurnsOutEitanDoesntLikeYouMuch);
}

public function andItTurnsOutEitanDoesntLikeYouMuch():void
{
	clearMenu();
	clearOutput();
	showEitan();
	showName("\nWAR ALPHA");
	processTime(3);

	var eitan:Creature = getEitan(); // this'll do for now

	output("You introduce yourself as [pc.name] Steele. You’ve come to " + (silly ? "bargain." : "talk."));
	output("\n\nThe war alpha flexes his chest in front of you, blowing himself up, probably to try and intimidate you. <i>“I am Eitan, son of Laklan, [pc.name] Steele, and I had come to steal the korgonne Hold and wear its princess like a loincloth,”</i> the war alpha responds as soon as you finish your sentence. The other milodan whoop in laughter. <i>“Not everything goes as we intend, [pc.name] Steele.”</i>");
	output("\n\nYou wait for the milodan to calm down before you try again.");
	if (pc.isNice()) output(" You ask Eitan if the korgonne had been treating him and his people as well as they could – are they in need of anything? You could provide them with some provisions, if they’re in need.");
	else if (pc.isMisch()) output(" You remind Eitan that it could have been worse: Ula has him working in her mines, but she could have just as easily made him into a personal butler or something. He should count his blessings that all you want is to talk!");
	else output(" You remind Eitan that you had beaten him in fair combat – hell, if you remember right, it was a two-on-one, so it wasn’t even fair, and he <i>still</i> lost. He should consider himself lucky that all you want is to talk.");
	output("\n\nEitan pauses for a moment, and the air of the dungeon goes still and silent – and then he lunges at you, the sound of his chains snapping into place beneath him to keep him still. It was a feint, and he knew he wasn’t going to get nearly close enough to you, " + (pc.willpower() < 25 ? "but you nonetheless flinch. He, and the rest of the milodan, start laughing uproariously at you and your weakness. You were supposed to keep up the stronger image, considering you had beaten him in a fight, but you couldn’t." : "but so did you, and you don’t flinch, standing your ground just outside of his reach. The milodan chain-gang ‘oooh’ at your stalwartness; you know that Eitan was hoping you would show weakness, and you wonder how he’ll react to you not falling for it."));
	if (pc.isNice())
	{
		output("\n\n<i>“You ask if my people need anything?”</i> he asks. <i>“Turn around and present yourself, [pc.name] Steele. It’s been too long since I’ve last been relieved, and the show would give my people a boost to their morale!”</i>");
		output("\n\nThe milodan whoop and cheer at the idea. It’s clearly a popular one with them.");
		if (pc.isBimbo() || pc.lust() >= 66 || pc.libido() >= 66) output(" Hell, you’ll admit, it’s a hot as fuck idea, but as much as you probably wouldn’t mind it under any other context, you need to keep a stern showing. You’re in control here.");
	}
	output("\n\n<i>“My people and I owe you nothing, [pc.name] Steele,”</i> Eitan continues, hefting his massive pickaxe up with one hand and slinging it over his shoulder. <i>“We have lost the war, and this is our punishment. Every one of us has accepted that this is where we will die... unless, of course, a larger, stronger army of milodan warriors does what we couldn’t.”</i>");
	output("\n\nYou argue that it doesn’t have to be that way. He and his people don’t have to die in this dark hole in their enemy’s prison.");
	output("\n\n<i>“Death would be better than whatever you would suggest,”</i> he snaps. <i>“We would sooner turn our axes on each other than integrate into the korgonne’s ranks, or whatever I’m sure you’d like to offer.”</i>");
	output("\n\nYou insist that he try and think rationally. You get that he’s mad that he lost the war, but moping in a dungeon and forcing the rest of his people to mope with him for the rest of their lives is a stubborn, selfish decision for a leader like himself to make. You offer again: all you want is to talk. If he gives you what you want, then you can give him something in return.");
	if (pc.isNice()) output(" Something <i>else.</i> Something material that he could use.");
	output("\n\nEitan looks " + (pc.tallness + 2 < eitan.tallness ? "down at" : (pc.tallness - 2 > eitan.tallness ? "up at" : "at")) + " you, the corner of his lip curling upward and his eyes narrowing. He doesn’t immediately respond with something sarcastic or abrasive – which is good, because it means he’s considering your offer.");
	output("\n\n<i>“What do you have to gain?”</i> he asks.");
	output("\n\nYou’d just like to get a better understanding of milodan culture: from how they think, to why they’re in a war with the korgonne. It’s not a <i>complete</i> lie, but you figure he probably wouldn’t respond positively if you told him you’re trying to convert him from his tribal-warfare way of thinking.");
	output("\n\n<i>“And you would provide me anything I like in return?”</i> he asks.");
	output("\n\n<i>“Within reason,”</i> you reply, and you list some things that you could provide him and his people: more food and water; softer, larger bedding; maybe escorts to the surface for some fresh air and sunlight.");
	output("\n\nHe hums, his hand rubbing at the shaft of his pickaxe. <i>“Bring to me...”</i> he hesitates, trying to decide what it is that he wants. <i>“Food. An exotic food, not native to our planet. I know you have the means to travel beyond the night stars. Prove to me that you mean what you say by bringing to me an exotic food, and then I will give you your conversation.”</i>");
	output("\n\n<b>Eitan wants to eat something exotic.</b> It’s a fairly mundane request. As soon as you have something for him to eat, he promises to give you some conversation.");
	output("\n\nYou tell him that you’ll hold up your word, and that you expect he’ll hold up his.");
	output("\n\n<i>“I’m not going anywhere,”</i> he says, and ends the conversation by turning back to his wall and swinging at it with his massive pickaxe. The milodan chain-gang, understanding the conversation to be over, resume their own tasks as if they had never stopped.");

	IncrementFlag("EITAN_PRISONER_NEGOTIATIONS");

	addButton(0, "Next", mainGameMenu);
}

public function askToApproachPrisonerEitan():void
{
	clearMenu();
	clearOutput();
	showBust("KORGONNE_MALE_" + RandomInCollection("TAWNY", "WHITE", "GRAY"));
	author("B");
	processTime(1);

	output("You head down towards the bottommost level of the korgonne Hold. Already, the sound of the milodan captives chipping away at the mines reaches your ears. You wonder if the Hold will ever run out of things for them to mine.");
	output("\n\nThe two korgonne guards recognize you as you approach. They don’t bother asking questions anymore; they know why you’re there. The one to the left turns and beckons you to follow, leaving his post so that he can lead you into the prison.");

	if (flags["EITAN_PRISONER_NEGOTIATIONS"] == 9) addButton(0, "Next", eitanIsNowAWateryBoye);
	else addButton(0, "Next", approachPrisonerEitan);
}

public function eitanRequestSuccessful():Boolean
{
	var item:ItemSlotClass;
	switch (flags["EITAN_PRISONER_NEGOTIATIONS"])
	{
		case 1: case 2:for each (item in pc.inventory) if (canEitanEat(item)) return true; break; //FoodQuest
		case 3: return pc.outfitSexiness() > 0;
		case 4: for each (item in pc.inventory) if (canEitanDrink(item)) return true; break;
		case 5: return false;
		case 6: for each (item in pc.inventory) if (canEitanHeal(item)) return true; break;
		case 7: for each (item in pc.inventory) if (canEitanWear(item)) return true; break;
		case 8: return false;
		case 10: return false;
		default: AddLogEvent("Bug in Eitan’s progression. Please report."); return false;
	}
	return false;
}

public function approachPrisonerEitan():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(1+rand(3));

	output("The milodan chain gangs pause their work momentarily once you and your korgonne guard escort enter the prison. Once they see that it’s you, they suppose that you’re here for their alpha, and they resume their work – but at with less fervor, more interested in you and him than they are bashing at a wall with a pick.");
	output("\n\nEitan is where you found him last: chained to the far corner with a harness, wielding a pickaxe larger than all the others, chipping chunks of ore larger than any other milodan could. Likewise, at your approach, he places the head of his pick onto the floor and takes a deep breath, calming his overworked body so you can have a proper conversation with him.");
	output("\n\n<i>“[pc.name] Steele,”</i> he says, his voice gruff and sore. Spending all this time in the mines must be torturous for their throats. <i>“Did you bring to me what I asked for?”</i>");

	if (eitanRequestSuccessful())
	{
		switch (flags["EITAN_PRISONER_NEGOTIATIONS"])
		{
			case 1: case 2: return eitanOfferButtons(canEitanEat, (flags["EITAN_PRISONER_NEGOTIATIONS"] == 1 ? timeToFeedEitan : timeToFeedEitanAgain), "Don’t share any of your food with Eitan.");
			case 3:
				processTime(3);
				output("\n\nYou lift your arms and spin on the spot, showing off your outfit to Eitan. This is exactly what he asked for: for you to wear something sexy so he can think about it when he’s alone at night. You feel you’re on a store shelf, spinning around and showing off to any would-be customer what they can get for the right price – all you need is a price tag to put the cherry on top. You’re supposed to be the one in charge of the conversations, here, and flaunting the goods is a good way to demean that.");
				if ((pc.isBimbo() || pc.libido() >= 66) && !pc.isAss()) output(" But – on the other hand, showing yourself off like this feels undeniably <i>sexy.</i> It’s <i>you</i> he wanted to show off, and it’s <i>you</i> he’ll be thinking about later. Maybe that can be a strength of yours – maybe you’re more in control of the conversation than you thought.");
				output("\n\nEitan leans back and grins as you move and display your body underneath the sexy clothing. He rubs at his chin with his right palm and he shifts from one leg to the other. The pants he was given by the korgonne are slipshod and hang off his body loosely, and they, and he, do <i>nothing</i> to mask the budding erection your movements are giving him.");
				output("\n\nYou end the pirouette by putting your hands on your hips and swishing them to one side.");
				if (pc.isAss()) output(" It’s embarrassing that you’ve had to put yourself to this level, and you keep having to remind yourself why you’re even going through the effort for Eitan in the first place.");
				output("\n\n<i>“Very nice,”</i> Eitan congratulates, his tongue swishing out to lick at his chops after the show. <i>“Your alien cultures really know the value of showing less. Sometimes it’s sexier to wear something revealing than it is to go naked.”</i>");
				output("\n\nYou’re not positive if that’s a compliment towards you, or towards non-milodan culture in general, or what.");
				output("\n\n<i>“" + (flags["WAR_ALPHA_DEFEAT_METHOD"] == 2 ? "I imagine performing like that must have been like second nature to you" : "I can’t imagine that was easy for you to have done") + ", [pc.name] Steele,”</i> he says as he leans on his overturned pickaxe. <i>“You have earned your conversation. Ask away.”</i>");
				break;
			case 4: return eitanOfferButtons(canEitanDrink, timeToGetAnAlphaTipsy, "Don’t let Eitan drink your booze.");
			case 6: return eitanOfferButtons(canEitanHeal, smugglingDrugsIntoDoggoPrison, "Don’t give Eitan any medicine.");
			case 7: return eitanOfferButtons(canEitanWear, unfotunatelyEitanShallNoLongerBeNude, "On second thought, he looks better naked.");
			default: output("\n\n<b>ERROR</b>"); addButton(4, "Escape!", mainGameMenu, undefined, "Escape!", "Run from the bug!"); return;
		}
		eitanPostRequestMenu(true);
	}
	// PC did not complete Eitan’s objective
	else failEitanRequest();
}

public function eitanOfferButtons(condition:Function, scene:Function, nothingTooltip:String):void
{
	var btnSlot:int = 0;
	var items:Array = new Array();
	for (var i:int = pc.inventory.length - 1; i >= 0; i--)
	{
		if (btnSlot == 14) btnSlot++;
		if (InCollection(pc.inventory[i].shortName, items) || !condition(pc.inventory[i])) continue;
		addButton(btnSlot++, pc.inventory[i].shortName, scene, pc.inventory[i], StringUtil.toTitleCase(pc.inventory[i].longName), "Give the Milo " + pc.inventory[i].description + ".");
		items.push(pc.inventory[i].shortName);
	}
	addButton(14, "Nothing", failEitanRequest, true, "Nothing", nothingTooltip);
}

public function failEitanRequest(intentional:Boolean = false):void
{
	if (intentional)
	{
		clearMenu();
		clearOutput();
		showEitan();
	}
	else output("\n\n");
	output("You tell him that you did not, and that you’re here for a visit regardless.");
	output("\n\n<i>“Our agreement is that you give me what I want, [pc.name] Steele, and in return, I answer your questions. I asked you");
	switch (flags["EITAN_PRISONER_NEGOTIATIONS"])
	{
		case 1: case 2: output(" for an exotic food, not native to Uveto"); break;
		case 3: output(" to wear something enticing that I can entertain myself with at night"); break;
		case 4: output(" for a drink that would undo the tension in me - and hopefully didn’t taste as badly as what Pyrite gave me"); break;
		case 5: case 6: output(" for medicine for my people, and for a trip to the surface for fresh air and sunlight"); break;
		case 7: output(" for something to wear underneath these chains so they’ll stop chafing me"); break;
		case 8: output(" fresh water for my people"); break;
		case 10: output(" an audience with the chieftain of the korgonne"); break;
		default: output(" to report this bug in the forums"); break;
	}
	output(".”</i> He hefts his mighty pickaxe with an irritated grunt and turns his back to you. <i>“We have nothing to discuss until you give me what I want.”</i>");
	output("\n\nWithout another word, he returns to his work, toiling away at a rock wall with his pick. He doesn’t respond to anything you say after that.");

	// Display the Eitan Rejected menu (detailed later)
	eitanPostRequestMenu(false);
}

// Exotic food 1
public function timeToFeedEitan(food:ItemSlotClass):void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(9);

	output("You tell him you did.");
	output("\n\nYou reach into your pack and retrieve the " + food.longName + " that you had brought just for Eitan. You aren’t sure what he finds most palatable – sweet, sour, juicy, tart, whatever – but he didn’t give you an instruction beyond ‘exotic.’ Hopefully, even if he doesn’t like it, he’ll still behave.");
	output("\n\nEitan handles the " + food.longName + " surprisingly gingerly, as if he were afraid he’d crush it between his fingers if he weren’t careful. You figure that he doesn’t know how to eat it: the natives of Uveto survive on whatever they can catch or harvest in the harsh snowy landscapes, and with teeth like his, he probably only eats meat.");
	output("\n\nYou teach him how to eat the " + food.longName + " – it’s hardly an ordeal, but it’s not a lesson you were expecting to teach. All the same, he follows your instructions to the letter, devouring the food with the appetite of a large man that hadn’t eaten something fulfilling in weeks. You notice that some of the other milodan watch on enviously; some of them even drool at the idea of getting something half-decent to eat.");
	output("\n\nEitan finishes the " + food.longName + ", the entire thing, in only a few moments. <i>“That’s not how I was expecting it to taste,”</i> he says, wiping his mouth with the back of his dirty, naked arm. <i>“But then, I should hope it wouldn’t taste like something I’m familiar with.”</i>");
	output("\n\nYou ask him if he liked it.");
	output("\n\n<i>“It was alright,”</i> he answers, then hefts his mighty pickaxe and turns towards his wall. <i>“You have asked your question. Our conversation is over. Bring me another if you want to ask anything more.”</i>");
	output("\n\nYou gawk and insist that he can’t be serious (and you’re careful to not phrase it as a question).");
	output("\n\n<i>“Being a milodan means putting yourself above all others. If I can’t beat you in a fight, [pc.name] Steele, and you want something from me, then I’ll do what I can to make it worth it to me.”</i> He swings the pick once, and immediately a chunk of the wall falls to his feet. <i>“Besides, the food the korgonne give us is tasteless and paltry. I’ll take this opportunity to get a decent meal out of it.”</i>");
	output("\n\nHe doesn’t say anything more. <b>If you want a <i>real</i> conversation out of him, you’ll need to bring him some more exotic food.</b>");
	output("\n\nYou also make a mental note to be more careful with your questions, so you never have to deal with <i>this</i> again...");

	pc.destroyItemByReference(food);
	IncrementFlag("EITAN_PRISONER_NEGOTIATIONS");

	eitanPostRequestMenu(false);
}

// Exotic food 2
public function timeToFeedEitanAgain(food:ItemSlotClass):void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(12);

	output("As you reach into your pack for the " + food.longName + " you got for Eitan, you bitterly think to yourself about the efforts you’re going through to try and find a middle-ground between the milodan and the korgonne.");
	if (pc.isNice()) output(" On the one hand, Eitan is just hungry, and he’s only doing what he thinks is a free meal ticket for the least amount of work. But still, you can’t say you enjoy being taken advantage of like that.");
	else if (pc.isMisch()) output(" You’re just trying to help, and Eitan is deliberately being difficult. You’re going to be <i>very</i> careful with how you phrase anything you say up to your next question.");
	else output(" You darkly fantasize about him choking on it. Surely the next alpha in line wouldn’t be as difficult.");
	output("\n\nOnce again, Eitan eats the entire thing, leaving nothing behind to discard. He sighs through his nose as he wipes his mouth with the back of his naked, dirty arm again.");
	output("\n\n<i>“Now,”</i> he says, his tongue licking a long, wide strand across his lips and sabre teeth, <i>“I’m sure you have a much more thorough question to ask me this time, [pc.name] Steele.”</i> He hefts the pickaxe up with one hand and slams the point into the floor, locking it in place so he can lean against its upturned handle. <i>“Ask me.”</i>");
	output("\n\nYou have a handful, actually, but <b>you only get one at a time.</b> Whatever question you don’t think to ask will be gated behind some other demand of his.");
	output("\n\nStill, you know exactly what question you want to ask this time.");

	pc.destroyItemByReference(food);

	eitanPostRequestMenu(true);
}

public function timeToGetAnAlphaTipsy(drink:ItemSlotClass):void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(10);

	output("You give Eitan the " + drink.longName + " that you had promised him, but you remind him that he promised he would only drink it when he’s not working the pickaxe. The liquid sloshes against its container noisily as Eitan handles it, flipping it top over bottom and testing its heft. You imagine he doesn’t need any instruction on how to open a bottle.");
	output("\n\n<i>“But what if I get thirsty?”</i> Eitan asks. It’s not a serious question and you know he’s just being difficult, but you tell him again to <i>not drink it</i> while he’s working. The last thing anybody needs - not yourself, not himself, not his milodan companions, and not any of the korgonne - is a milodan of his size and stature, and with his emotions towards his captives, getting drunk and whipping around a pickaxe of that size.");
	output("\n\nEitan laughs at how insistent, almost panicky, you are at him not getting drunk while on the job. <i>“Very well, [pc.name] Steele, you have my word that I will not drink this drink until after the work day is done.”</i> He places the bottle on the floor - as far from himself as his chains will allow him to reach, so that the debris from the wall doesn’t fall onto it. <i>“Can you promise me that it tastes better than what Pyrite gave me?”</i>");
	output("\n\nWell, first of all, taste is subjective. Everybody has a different palate, especially for something as divisive as alcohol. And second, he never told you what Pyrite Industries actually gave him.");
	output("\n\n<i>“I suppose I didn’t,”</i> he says, rubbing at his chin as he tries to remember what it was that Pyrite Industries had given him to drink. <i>“I guess it doesn’t matter. So long as this drink relieves me of my tension, I’ll just have to put up with the flavor.”</i> He slams his pickaxe into the ground hard enough to lodge it into place, and he leans on its upturned handle. <i>“You may ask me your question, [pc.name] Steele.”</i>");

	pc.destroyItemByReference(drink);

	eitanPostRequestMenu(true);
}

// Medicine
public function smugglingDrugsIntoDoggoPrison(drug:ItemSlotClass):void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(11);

	output("You hand Eitan the " + drug.longName + ", just like he had asked for:");
	// medipen-type
	if (drug is ImmunoBooster)
	{
		output(" a small medipen filled with a sloshing liquid, with an opening on one side and a plunger on the other.");
		output("\n\n<i>“What is this?”</i> he asks, taking the pen from your fingers gingerly. He lets it rolls from his fingers to his palm – the whole pen can’t reach across the size of his massive hand. <i>“This doesn’t look like any medicine I’ve ever seen.”</i>");
		output("\n\nConsidering he lives in the snowy wastes with a tribe of other technologically-lacking milodan, you’re not surprised that he was expecting a traditional mortar-and-pestle type of medicine. You explain what a medipen is and how it functions: Eitan only needs to press the opening against his skin and press the plunger. His skin will absorb the medicine and protect him from whatever disease he’s trying to avoid.");
		output("\n\nEitan hums to himself, picking up the medipen with his other hand, pinching it between two fingers. You aren’t sure what material the pen is made of, but you wouldn’t be surprised if he could snap it in half accidentally. He turns it over in his fingers twice more before following your instructions and he puts the opening of the pen against his fur.");
		output("\n\nYou clarify that it needs to be against his <i>skin</i>, and that just putting it on his fur isn’t enough. He grunts, and does as you say, digging the pen deep into his fur until the point is right up against his skin.");
		output("\n\nBefore he presses the plunger, his eyes flit up to the milodan chain-gang, and he hesitates. His thumb hovers over the plunger, ready to press, but his mouth curls indecisively as he struggles with himself. You turn to see what he’s looking at – is he reconsidering using the medicine on himself?");
		output("\n\nUltimately, he decides to go through with it, and he presses the button on the pen down. The medipen ejects the medicine onto his skin, and he flinches. <i>“Colder than I was expecting,”</i> he tells you. <i>“How long do I hold it here?”</i>");
		output("\n\nJust as he asks that, the medipen beeps. <i>“Until now,”</i> you say, and you extend your hand for him to give the empty pen back. At first, he goes to just toss it aside, but when he sees your extended hand, he gives you the garbage back.");
	}
	// any other type
	else
	{
		output(" a dose of modern medicine, about large enough for someone with Eitan’s frame for it to be effective. Eitan was hoping to use it to stave off disease and infection, and you promise that the " + drug.longName + " will get the job done.");
		output("\n\nHe turns it over in his hand, weighing it in his palm. It’s not large enough to pool over the sides of his hand. <i>“I’m mostly familiar with herbal medicines and poultices from my tribe,”</i> he says. <i>“I’m not sure what this even is.”</i>");
		output("\n\nIn your culture, medicines can take many shapes and come in many forms. The most common that anyone can purchase are tablets or pills that are meant to be swallowed, but they can come in the form of liquid injections, or patches placed on the skin, or even inhaled and exhaled.");
		output("\n\nFor this medicine in particular, you explain to Eitan what it does and how he’s meant to handle it. At first, he’s hesitant - the line between medicine and poison can often be a thin one - but, owing to the progress you two have made, he follows your instructions and applies the medicine as you say.");
	}
	output("\n\n<i>“In any other position, [pc.name] Steele, I wouldn’t have trusted that what I just took was medicine. For all I know, it could be some magic brew that’ll transform me into you.”</i>");
	output("\n\nYou muse to yourself that you suppose his worries aren’t <i>entirely</i> unfounded in today’s day and age.");
	output("\n\n<i>“We’ll see if this medicine of yours makes me sicker than any disease,”</i> he says as he leans onto his overturned pickaxe. <i>“I suppose I’ll have to trust that your word is true. And if that’s the case, then I owe you another conversation.”</i>");
	output("\n\nAt that moment, the missing milodan from earlier is escorted back down from the outside. It was only a few moments outdoors, but he looks more energetic than some of his dirtier inmates. And once he’s chained back in, the milodan to his right is unchained and escorted out, continuing the cycle.");

	pc.destroyItemByReference(drug);

	eitanPostRequestMenu(true);
}

public function heyUlaCanYouLetTheMilosBreathe():void
{
	clearMenu();
	clearOutput();
	showUla();
	author("B & Fenoxo");
	processTime(4);

	output("After clearing your throat, you inform Ula that you have a favor to ask of her, related to your self-appointed reformation project.");
	output("\n\nUla smirks playfully. <i>“" + (korgiTranslate() ? "Is taming cats harder than you thought?" : "Cat taming harder-making than [pc.name] thinkinged?") + "”</i>");
	output("\n\nYou grin right back, explaining that while Eitan was standoffish at first, he’s been more and more amenable to talking with you over you time. Not long ago, he wasn’t thinking of anything but himself and his own amusement, yet now you’ve gotten him to think of someone besides himself for a change. He asked for medicine for his people, and to allow them a little time on the surface each day for fresh air.");
	output("\n\n<i>“No.”</i> Ula’s response is fast and frank. <i>“" + (korgiTranslate() ? "Leaving the door open all day, sending the cat-dogs in and out one at a time... it would leave us so vulnerable. We are not so strong as to reveal ourselves to the world at all times." : "Having secret door opening all day, sending cat-dogs in and out one at time. Korg’ii Hold not strong enough for reveal self to rest of world all times.") + "”</i> She must see the crestfallen look on your face, because stretches out from her throne to ruffle your hair, giggling softly. <i>“" + (korgiTranslate() ?"Don’t worry. There are small openings higher up in the hold. Aliens call them... balconies? Like balconies. The Milodans can go there if they need sun for their health" : "Not worry. Small openings higher up in hold. Alien have word for... balcony? Like balcony. Milodan can go there for sunning, if need sunning for health.") + "”</i>");
	output("\n\nThat... sounds like an agreeable compromise, and you say as much.");
	output("\n\n<i>“Good.”</i> Ula folds her stubby arms across her sizeable chest. <i>“" + (korgiTranslate() ? "The milodans should be thankful I’m so charitable." : "Milos be thanking-full Ula have such charity.") + "”</i>");
	output("\n\nYou thank Ula for it. It’ll definitely get you some points with Eitan – he’s really been listening to you lately.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Whiling here" : "While you’re here") + ",”</i> she says, her expression softening and her finger twirling through her hair as her emerald green eyes turn to crescents above her smile, <i>“" + (!korgiTranslate() ? "</i>else<i> of things of any Ula can be helping of?" : "is there anything</i> else <i>I can help you with?") + "”</i>");

	IncrementFlag("EITAN_PRISONER_NEGOTIATIONS");

	ulaMenu();
}

public function eitanPostRequestMenu(success:Boolean):void
{
	// If the PC did not accomplish Eitan’s task, or they only completed Exotic Food 1, then grey out all options except [=Appearance=] and [=Leave=], and display the following tooltip for all others:
	// Eitan won’t speak to you unless you give him what he wants first, and he’s nothing if not stubborn. You’ll have to give him what he wants before you can gain any headway with him.
	// If the PC did accomplish Eitan’s task, then grey out the [=Leave=] button.
	// Grey out a talk option once the PC views it, even if they leave, perform a task, and come back.

	addButton(0, "Appearance", lookAtTheHunkyAlphaMilo);

	if (flags["EITAN_PRISONER_TALKS"] & 1) addDisabledButton(1, "Himself", "Himself", "Eitan holds his status as the Alpha of the milodan above everything else, and he’s come to rely on – and abuse – all the amenities that includes. You haven’t convinced him to not covet all those things, but he <i>did</i> promise to reconsider his actions as the milodan’s role model.");
	else if (!success) addDisabledButton(1, "Himself", "Himself", "Eitan won’t speak to you unless you give him what he wants first, and he’s nothing if not stubborn. You’ll have to give him what he wants before you can gain any headway with him.");
	else addButton(1, "Himself", prisonerEitanAskHimself, undefined, "Himself", "Ask Eitan about himself. He’s a huge milodan – the strongest of them all. You wonder what kind of history is behind him and his body.");

	if (flags["EITAN_PRISONER_TALKS"] & 2) addDisabledButton(2, "Culture", "Culture", "Eitan is under the impression that the elders of his tribe were against getting help from outsiders like yourself, because it risked diluting their culture and way of life, but it turned out that he had never had a real sit-down with them to discuss the future of his kind. You’ve convinced him to at least give it a try, starting with his fellow prisoners.");
	else if (!success) addDisabledButton(2, "Culture", "Culture", "Eitan won’t speak to you unless you give him what he wants first, and he’s nothing if not stubborn. You’ll have to give him what he wants before you can gain any headway with him.");
	else addButton(2, "Culture", prisonerEitanAskMiloCulture, undefined, "Culture", "Ask Eitan about the culture that raised him to be what and who he is. What is it that the milodan value most?");

	if (flags["EITAN_PRISONER_TALKS"] & 4) addDisabledButton(3, "The War", "The War", "Eitan truly wants peace between the korgonne and the milodan, but before you had spoken to him, he thought it was only possible via extermination. He said himself that he has a lifetime’s worth of anger and grief to work through, but give him some time, and he may reconsider that peace is possible without any more bloodshed.");
	else if (!success) addDisabledButton(3, "The War", "The War", "Eitan won’t speak to you unless you give him what he wants first, and he’s nothing if not stubborn. You’ll have to give him what he wants before you can gain any headway with him.");
	else addButton(3, "The War", prisonerEitanTellsYouYouWerentThereMan, undefined, "The War", "The milodan and the korgonne have been at war since before either he or Ula can remember. Ask him for some more details about it, such as <i>why.</i>");

	if (flags["EITAN_PRISONER_TALKS"] & 8) addDisabledButton(4, "Family", "Family", "Eitan’s father was the tribe’s caregiver; he has two sisters, each of them in a different tribe; and his mother, Edrei, was the Alpha of his tribe before him. She was well-beloved by all, and Eitan grew to resent her reputation, thinking that he couldn’t possibly match it, so he instead didn’t even try and abused his privileges as Alpha. You’ve convinced him to at least <i>consider</i> trying to behave like Edrei did.");
	else if (!success) addDisabledButton(4, "Family", "Family", "Eitan won’t speak to you unless you give him what he wants first, and he’s nothing if not stubborn. You’ll have to give him what he wants before you can gain any headway with him.");
	else addButton(4, "Family", prisonerEitanOnTheMiloMilfHeCameFrom, undefined, "Family", "Eitan introduced himself as ‘son of Laklan.’ Ask him about his family, and who they were in the milodan hierarchy.");

	if (success) addDisabledButton(14, "Leave", "Leave", "You went through all that trouble to get Eitan what he asked for, and you’re not leaving until you get what you want in return!");
	else addButton(14, "Leave", letEitanBe, undefined, "Leave", "Leave Eitan to his work for now.");
}

public function letEitanBe():void
{
	clearMenu();
	clearOutput();
	showBust(eitanBustDisplay(), "KORGONNE_MALE_" + RandomInCollection("WHITE", "TAWNY", "GRAY"));
	showName("\nEITAN");
	author("B");
	processTime(1);

	output("You suppose that that’s enough time with Eitan for now. You have other things that need doing.");
	output("\n\n<i>“You know what you need to do if you want a more thorough conversation, [pc.name] Steele,”</i> he says over his shoulder, and with another swing of his huge pickaxe, your conversation with him is officially over.");
	output("\n\nThe korgonne guard escorts you out of the prison and back to his post.");

	addButton(0, "Next", mainGameMenu);
}

public function lookAtTheHunkyAlphaMilo():void
{
	clearOutput();
	showEitan();

	output("While you’re here, you get a better look at Eitan.");
	output("\n\nEitan is the ‘War Alpha’ of the milodan, and one glance at his body will tell you that he <i>earned</i> that title. The milodan stands a little over eight feet tall, and is built like a goddamn <i>mountain,</i> with muscles rippling from his neck to his ankles; every shift of his body causes some part of him to flex and bulge against the rest of him. He doesn’t look like he has an ounce of fat anywhere on him: he has biceps bigger than his head; thighs as thick around as his torso; and washboard abs you could shave ice on.");
	output("\n\nHe has magenta eyes that glint with more intelligence than you would have assumed, being a primitive tribesman, but " + (pc.intelligence() < 20 ? "you don’t really like the way he keeps looking at you or your korgonne guard escort" : "the way they narrow and scan your body, reading your body language, tell you that he’s capable and cunning: he can read into everything you say and do in his presence, and if you aren’t careful, he could take advantage of that") + ". He has large, black, pointed ears that stand straight up on his head, framing a tall, naturally-blue mohawk head of hair. He has a pair of saber-teeth jutting out of his upper jaw – perfect for ripping tender flesh apart.");
	output("\n\nHe’s covered from head to foot in grey fur, which is speckled all over with black dots, although his front side is pristine white. He has a bushy little tail above his butt, wider than it is long, that stands naturally upright with his posture – you doubt he does anything with it, much less wag when he’s happy. He has five fingers and toes.");
	if (eitanIsCrew()) output(" He’s wearing a Steele Tech uniform that clings to his body without inhibiting movement, giving you a full show of every muscle on display - and a little of everything else below the belt, too. The blacks and yellows of the uniform contrast with whatever fur that’s visible fairly sharply.");
	else if (wargiiMilodanTribeFreed()) output(" He isn’t wearing anything above the belt, and is wearing a loincloth to keep him otherwise decent in front of you. It’s larger and has a somewhat ornate design on it compared to the other milodan’s loincloths, but it’s still just a piece of fabric over his crotch.");
	else output(" He isn’t wearing clothes above the belt, and is instead wearing a harness made of chains that is itself connected to the floor, giving him full motion of his arms while still locking him in place. He’s also wearing a shoddy pair of trousers, offering nothing in terms of protection but otherwise keeping him decent.");

	if (flags["WAR_ALPHA_DEFEAT_METHOD"] == 2 || hasSexedEitan())
	{
		showEitan(true);
		output("\n\nWhen you managed to get him to sexually submit to you, you had gotten a good look at his equipment: when he’s fully aroused, he’s packing an intimidating monster of a cock, jutting a full, bloated twelve inches at full mast. His dick is tapered and he has a knot. His dick is also covered in nubs that pulse and beat when he’s fully hard, and the whole thing is covered in an angry crisscross of bulging veins. He has a pair of huge, fist-sized testicles beneath that behemoth of a dick.");
		output("\n\nYou didn’t get a good look at it and you’re not about to ask, but you assume he has an asshole hidden between those airtight, ceramic asscheeks of his, right where it belongs.");
	}

	addDisabledButton(0, "Appearance");
}

public function prisonerEitanAskHimself():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(8);

	output("Eitan is the largest and the strongest of the milodan, and he commands no small amount of respect among them. You ask him how that came to be: what training regimen did he undergo? What drove him to be what he is?");
	output("\n\n<i>“My body was forged from combat,”</i> he explains, pointing at various spots on his torso and drawing line across his leg. You hadn’t noticed against his thick fur coat, but the spots he pointed to had thinner fur than the rest – they’re scars. You imagine his skin beneath his fur is pockmarked with them. <i>“I was the biggest of the cubs of my generation. Food has been scarce all my life, and when you’re hungry, you fight, and if you want to win, you must be strong.”</i>");
	output("\n\nYou note that he makes it sound as though all he did was fight. It must have been a difficult life, all through adolescence.");
	output("\n\n<i>“I’d hunt, of course. There is no wild animal that I can’t overpower, save for a Frostwyrm. If ever there was large game to be hunted near our tribe, I would hunt it – and I would get the biggest haul of it.”</i>");
	output("\n\nIt sounds like he doesn’t like sharing, if he always insisted on taking the most food.");
	output("\n\n<i>“I have the largest form, [pc.name] Steele, and I need the most food. If any milodan wanted more than their share, they would have to earn it from me. Since being named the Alpha of my tribe, I have had my share of challengers for any number of reasons, whether for the title and the ego that comes with it, or for the food, or the right to any of the bodies in the tribe – and they have all failed against me.”</i>");
	output("\n\n‘The right to any of the bodies’ is a hell of a way to put it. You note that an example of the milodan like himself must have no shortage of prospective mates.");
	output("\n\n<i>“They do not all come to me, [pc.name] Steele. As Alpha, it is my right to mate with anybody within the tribe at my own discretion.”</i> He leans on his pickaxe and speaks casually, as if he were talking about the weather during the latest sports game. <i>“To deny the Alpha of the milodan is to challenge them. There are some that are less... opposed to my rights than others, let’s say.”</i> He chuckles and shifts his weight, splaying his legs to make his pants tighter around his crotch. " + (pc.willpower() < 25 ? "You can’t help but glance at the outline of his heavy balls, knowing that doing so means you lose the staring contest between you and him – but damn, if he doesn’t have some big, juicy nuts hiding in there." : "You know exactly what he’s trying to get you to do, but you refuse. He smiles, more to himself than to you, entertained with the idea that he’s met his equal."));
	output("\n\nThat doesn’t sound like a very fair stance to take. The other milodan probably fear him more than respect him.");
	output("\n\n<i>“It doesn’t matter what they think,”</i> he states matter-of-factly. <i>“The strongest of the milodan is who decides what is ‘fair’ among them. I am the strongest of the milodan, and my word, and my desires, are law. If there is any milodan that wants change, they’ll have to force it.”</i>");
	output("\n\nYou note that you had bested him in combat. That must make you the new Alpha of the milodan.");
	output("\n\nThe milodan chain-gang behind you slowly stop their mining, one by one, each of them taken by surprise at your assertion.");
	output("\n\n<i>“The circumstances were unfair,”</i> he counters, his tone suddenly serious and dire.");
	output("\n\nCorrect, they were – it was him and one of his buddies versus just you. It was two-on-one, and you <i>still</i> won.");
	output("\n\nHis lip curls on the side of his mouth, showing you his jagged, clenched teeth, and he sighs in frustration. There’s a truth to what you say, and they all know it. If you truly wanted to assert yourself as the Alpha of the milodan, Eitan would have no choice but to abdicate.");
	output("\n\nYou confirm (without phrasing it as a question) to Eitan that, if indeed you were to be named Alpha, as would be your right, then his body would be yours to mate with, whether he consented or not. It would be an awfully far way for someone like him to fall, after his boasting about having a ‘body forged from combat.’");
	output("\n\nYou stare at each other, and you feel as though you’re in combat with a tiger, locked in a zoo’s cage. Any sudden movement you make would probably make Eitan lash out at you, and you’re not so sure that his harness made of chains would totally stop him. His title as Alpha means everything to him, and you could take it all – to add insult to his injury of being made a prisoner in his enemy’s home.");
	output("\n\nYou assuage Eitan by telling him that you don’t intend to take his title as Alpha from him. It belongs to him.");
	output("\n\nHe, however, isn’t totally convinced, you can tell. Not that you won’t take his title, but that it still belongs to him. You <i>had</i> earned it. He would never admit it, of course, but it’s obvious to you, and to him, and to every milodan in the mine.");
	output("\n\nYou explain to Eitan that as much as it would be your right, you believe that a person’s autonomy is something that should never be infringed upon. You can’t just <i>impose</i> yourself onto others just because you’re strong enough that nobody can say ‘no’ to you. When you defeated him in combat, he was in a vulnerable enough state that you could have taken advantage of him, but you didn’t. From his attitude, you doubt he would’ve done the same if he won instead.");
	output("\n\nAs the Alpha of the milodan, he should be an example for the others to aspire to, and him shoving his dick into any nearby hole, whether they want it or not, will only inspire others to do unto him as he does unto them. You beat him in a fight and you’re giving him his autonomy – you warn that, one day, he’s going to lose another fight, and if he doesn’t change his attitude, his opponent won’t extend the same mercy.");
	output("\n\nEitan’s mouth uncurls, and his face is turned downward in thought. You’ve struck a chord with him: his eyes narrow and his chews at nothing as he stirs on your words. <i>“It’s my right,”</i> he whispers to himself, but he crooks his head to one side, unsure if he believes his own words.");
	output("\n\nBefore you let the conversation end, you continue that that way of thinking extends beyond just mating with whoever, whenever: it also applies to the other privileges he has as Alpha, including sharing the food. To his credit, he’s right when he says that his bigger body needs more food, but being altruistic with what meagre catches are available will go a further way with his respect among the milodan than hoarding an unfair share just because he can.");
	output("\n\nEitan takes a deep breath, sighing through his nose. <i>“This is how we have done it since the milodan first came to be, [pc.name] Steele. The Alpha having first and last say in all matters has been how we have done it since well before I was a cub.”</i>");
	output("\n\nIt may have <i>started</i> before him, but it can <i>end</i> with him. He is the Alpha of the milodan. He can decide where the Alpha’s privileges begin and end from his generation onward, and he can make the title of Alpha something to respect rather than fear.");
	output("\n\nHe laughs to himself, once, under his breath, almost like a hiccup. <i>“I will admit that you have given me much to think about, [pc.name] Steele,”</i> he says. <i>“But I cannot and I will not promise anything. You can’t ask the Alpha of the milodan to gut the rights of the Alpha of the milodan and expect him to agree on the spot.”</i>");
	output("\n\nYou concede that you can’t, but as long as he’s got something to think about while he picks away at that mine, you’ll be satisfied.");

	flags["EITAN_PRISONER_TALKS"] |= 1;

	addButton(0, "Next", getEitansNextRequest);
}

public function prisonerEitanAskMiloCulture():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(11);

	output("\You haven’t had the pleasure of interacting with the milodan outside of Uveto. You understand that they’ve become a star-faring race, but he and his tribe are still here on Uveto. You ask Eitan if he could describe his race’s culture: their values; how they establish a hierarchy; why some tribes are still on Uveto; whatever he can tell you.");
	output("\n\nEitan doesn’t immediately answer. He scratches at his chin and his lip curls in consideration. He maintains eye contact with you, though: he hasn’t ignored your questions and he’s trying to put his thoughts to words.");
	output("\n\n<i>“I feel that my species has become... segregated, over the generations,”</i> he starts. <i>“Centuries ago, Uveto first made contact with aliens calling themselves... the ‘Akkadi,’ if I remember right.”</i> He crooks his head. <i>“I’m not sure if that’s what they called themselves, actually. Oral history has a way of becoming muddied over time.”</i>");
	output("\n\n<i>“Whatever, it’s not important,”</i> he says, standing upright. <i>“What’s important is that the milodan, from that point on, had become... apart from themselves. There were tribes that took the Akkadi up on their offers and joined them in the stars, bringing food, medicine, and tools from elsewhere in the universe. And there were tribes that remained here on Uveto, my own among them.”</i>");
	output("\n\nIf you remember right, Eitan was wearing Pyrite Heavy Industries equipment during the siege of the Hold. He must not value his tribe’s traditions, if he was so willing to don their gear.");
	output("\n\n<i>“I am no fool, [pc.name] Steele,”</i> he says coldly. <i>“The patriarch of my tribe would see us fester on the frozen coasts in those huts made of ice. I was fed stories all my life of other milodan that had left our ‘ancestral home’ for another life beyond Uveto.”</i> The corners of his lips curl inward, showing the glint of his sharp teeth in what little light there was in the prison. <i>“When I was given my chance to leave this frozen hell behind me, I seized it. All I had to do was take the Korg’ii Hold and end the war between us so that I could sell the Hold and the land around it to Pyrite, and I would be given all the means I’d need to leave Uveto behind me forever.”</i>");
	output("\n\nFor someone that was born and raised on Uveto, he sure does hate it.");
	output("\n\n<i>“We survive on meager hunts wearing little more than sheets around our crotches, [pc.name] Steele,”</i> he spits. <i>“The warmest day on Uveto is colder than the fiercest winter night from wherever you come from, not that I’ll ever know the difference now. So much as falling asleep at the wrong time could mean freezing to death. A disease could wipe out an entire tribe in the space of half a generation. The wisest men and women of my backwards tribe would rather we put up with all of that than see we become something more, like what some other milodan had accomplished.”</i>");
	output("\n\nIt’s clear to you that he has some strong opinions about his own culture and what some of the milodan in his tribe value. You turn your gaze to the milodan chain-gang behind you – they must all be like-minded units from his village, all vying for something better.");
	output("\n\n<i>“And look where it got us,”</i> he scoffs. <i>“You’re wrong anyway. Most of them are here because I told them to fight. I am the Alpha, and they will do as I say. Only a few of them think as I do.”</i>");
	output("\n\nYou hum in thought, considering what to say (without phrasing it as a question) next. Taking a chance, you speculate aloud that Eitan didn’t care about any of them, and that he was only trying to get himself off Uveto.");
	output("\n\nHe laughs at the insinuation. <i>“I can command them to do as I say, [pc.name] Steele, but I can’t make them want what I want.”</i> He licks his lips. <i>“Not yet, anyway. If I could attune my mind to be like that of a Frostwyrm’s, my will would be theirs with just a thought.”</i>");
	if (flags["FROSTWYRM_NOT_HOSTILE"] >= 2) output("\n\n<i>Won’t he be in for a surprise,</i> you think to yourself.\n\n<i>“Still.”</i>");
	output(" He rubs at his chin again. <i>“I’ve given up on trying to elevate my tribe as a whole. If they want to freeze on Uveto, they can for all I care. I am only concerned with getting myself off the planet.”</i>");
	output("\n\nFrom the sounds of things, he must have thought that Pyrite Heavy Industries was his only opportunity to get off Uveto’s surface, and that he hadn’t considered alternatives.");
	output("\n\nEitan huffs through his nose, indignant at your insinuation. <i>“Pyrite was the only one that approached my tribe. They gave me a simple task and promised a reward. The Akkadi hadn’t come. Nobody else had.”</i>");
	output("\n\nFrom where you’re standing, it sounds to you that Eitan had sit on his laurels in his tribe all his life until something happened to him, rather than him trying to reach out to others. If he wanted to get help from the stars, he could have tried approaching Irestead, which was a short walk south from the Korg’ii Hold, or he could have tried negotiating with the korgonne from the start.");
	output("\n\n<i>“We are at</i> war <i>with the korgonne, [pc.name] Steele!”</i> he bellows, opening his mouth wide to shout his words at you. <i>“If there is any one sentiment I share with my tribe, it’s that I would rather be skinned alive than consort with my enemies. And approaching your [pc.race] tribe to the south? Look at me!”</i> he shouts, standing up and beating his chest once, the chain harness clanking against itself loudly. <i>“I</i> tower <i>above the average peasant in your tribe. I have teeth best used for carving flesh, and the tribal milodan of Uveto are known to be combative</i> at best! <i>None of your kind would approach with a kind word at any attempt!”</i>");
	output("\n\n<i>“I did,”</i> you say.");
	output("\n\n<i>“That’s a confident thing for you to say while I’m wearing this,”</i> he says, gripping at his harness, <i>“and only after you had defeated me in combat.”</i>");
	output("\n\nIn your defense, he struck first. But you two are getting sidetracked. The point you’re trying to make is that <i>you</i> are approaching him; <i>you</i> are a star-farer; and you have <i>connections.</i> You can give Eitan what he wants.");
	output("\n\nBut, you continue, why stop with just Eitan? He’s made it clear what his wants are: food, clothing, medicine, and to live somewhere warm. You could arrange to have all those things for the milodan if he wanted. Pyrite only extended that offer to him, but you can do more.");
	output("\n\n<i>“Even if you could, [pc.name] Steele, it isn’t about what I want,”</i> he insists. <i>“My tribe is backwards and forgotten because that’s how they like it.”</i>");
	output("\n\nYou muse that he would only think that if he were sitting in on the meeting between Pyrite and his elders. He doesn’t answer; instead, he straightens and, for the first time since you’ve met on more amicable footing, averts his gaze. Assuming that to not be the case, then he must think that because he’s had this conversation with his elders after Pyrite Industries spoke with him privately.");
	output("\n\n<i>“Pyrite approached me alone, [pc.name] Steele,”</i> he grumbles, barely loud enough to be heard over the milodan chain-gang. <i>“I told them that Pyrite would give us the means to defeat the korgonne, and in exchange, we would allow Pyrite room to manufacture on their land. I kept the rewards to myself because I knew the elders, and most others, wouldn’t approve.”</i>");
	output("\n\nIn that case, it sounds like a serious lack of trust and communication between him and his elders. Surely they wouldn’t turn away from the promise of a better life, including medicine to save their sick and their young. Maybe they only ‘fed’ him those stories about milodan travelling to the stars because they had given up hope that the same offer would be extended to them. Maybe they were bitter that they weren’t approached sooner, and by a kinder voice. And maybe the others in his tribe only agree with the elders because they’ve been led along all their lives too, and he’s the only one with the wherewithal to try and think differently.");
	output("\n\nEitan hums to himself, his eyes at his feet, considering your words. You end by making him a deal: if he can at least <i>try</i> to communicate with his fellow prisoners about the benefits of not being so insular and reaching out to a friendly hand, then, down the line, you can see about getting them the things he had asked for: more food, medicine, and maybe even a life off of Uveto.");
	output("\n\nEitan hums to himself, then grins and laughs once. <i>“It’s always so much easier to just tell them what to do,”</i> he says. <i>“If I had these things forced onto them, they would take it, whether or not they want it.”</i>");
	output("\n\nYou frown at his idea of humor.");
	output("\n\n<i>“I make no promises, [pc.name] Steele. We milodan can be difficult sometimes. But,”</i> he says, <i>“as long as I’m wearing this–”</i> He shrugs, making the chains on him jingle. <i>“I suppose I have nothing to lose trying to spread the word.”</i>");
	output("\n\nHim putting in the effort is the least you can ask for.");


	flags["EITAN_PRISONER_TALKS"] |= 2;

	addButton(0, "Next", getEitansNextRequest);
}

public function prisonerEitanTellsYouYouWerentThereMan():void // But you were
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(11);

	output("You decide to use your one question to focus on the milodan’s perspective on the war. You’ve heard the occasional story from the korgonne side; what’s the milodan’s point of view on the whole thing?");
	output("\n\nHe chews at nothing as he considers your question. <i>“Is that old korgonne that we ambushed in the snow still the chieftan?”</i> he asks instead.");
	output("\n\nYou tell him that he actually gave the position to his daughter after the fighting was over. He’s her advisor now.");
	output("\n\n<i>“The war between us has been going since before his time. All I’ve ever known about the korgonne is that we’ve been fighting. It’s just a fact.”</i>");
	output("\n\nHe knows that’s not a satisfactory answer, so he continues before you interject. <i>“I won’t pretend that the milodan are in the right. There’s hardly ever a ‘right side’ in a war, and our aggression is why we’re here in this hole in the first place. But that doesn’t excuse what the korgonne have done to us all my life.”</i>");
	output("\n\nYou muse that vengeance must have been one of his motivators for doing what he did.");
	output("\n\n<i>“Of course, [pc.name] Steele, but vengeance was just</i> one<i>.”</i> He leans on his pickaxe, placing both hands on the butt of its handle, one on top of the other, and resting his chin on them. <i>“Less than a generation ago, the korgonne had negotiated a ceasefire when their chief offered to surrender himself to us.”</i>");
	output("\n\n<i>Surely,</i> you muse, as a sign of good faith, the milodan kept him around rather than execute him.");
	output("\n\n<i>“The trade wasn’t made with my tribe, so I wouldn’t know. I’d like to learn what we did with him just as badly as you, I think. Maybe not for the same reasons, though.”</i> He straightens his back and keeps a smooth face, preventing you from getting a good read on what he means. <i>“We went from out-and-out war with each other to petty skirmishes between single korgonne and milodan out in the snow. And that’s how it stayed for most of my life, well after I was made Alpha, and well before,”</i> he pauses, glancing towards the milodan chain-gang, <i>“this.”</i>");
	output("\n\nIf Eitan were willing to trade that peace, however strenuous it was, you say that he must not have been very comfortable with it in the first place.");
	output("\n\n<i>“I wouldn’t trust a korgonne to wash my underclothes,”</i> he says bitterly. <i>“We have been enemies for</i> generations, <i>[pc.name] Steele. I agreed to nothing, never mind some silly ceasefire. When Pyrite approached my tribe with offers of gaining the upper hand and taking their Hold for ourselves in exchange for shiny rocks that we can’t eat or use for warmth, it seemed like an obvious choice.”</i> The corners of his lips curl into a small snarl. <i>“We would have succeeded if it were only the korgonne we had to deal with.”</i>");
	output("\n\nSo, then, it wasn’t only vengeance that motivated him, you say (without phrasing it as a question), but self-gain, and to advance a war that had been paused.");
	output("\n\n<i>“Ask any milodan or korgonne and they would tell you that the war never ended, [pc.name] Steele. Tensions were always high between us. Fighting constantly broke out. It was just done with fewer weapons, and with... alternative wounds for the loser, let’s say.”</i> He palms at his junk through his shoddy pants to emphasize his meaning. <i>“I was given the chance to end it once and for all. Take their Hold; enslave every last one of them; name the milodan as the victors.”</i>");
	output("\n\nEven if he succeeded, he must have known that eventually, his own people would consider him a war criminal. He broke the ceasefire, after all.");
	output("\n\n<i>“I don’t care,”</i> Eitan answers simply. <i>“It’s war.”</i>");
	output("\n\nHe’s made his views on the war itself very clear. But apparently the thought of trying to end the war peaceably had never crossed his mind, either.");
	output("\n\n<i>“Of course not. I have told you, [pc.name] Steele, I do not trust the korgonne. It doesn’t matter if they approach us, or if we approach them.”</i>");
	output("\n\nEitan had told you that the ceasefire came about when a korgonne chieftain surrendered himself in exchange for the peace. That chieftain didn’t <i>have</i> to give himself up like that, but he did because he thought it would have been best for both races if they had stopped the bloodshed. Throwing all pretences of not guiding his statements with non-questions to the wind, you ask if him he wouldn’t have done the same if the positions were reversed. ");
	output("\n\n<i>“I would not have. I’m not stupid enough to trust my enemies like that.”</i> He grunts at you. <i>“And don’t think I had to answer that, [pc.name] Steele. I know what you’re doing. This conversation could have stopped whenever I wanted.”</i>");
	output("\n\nYou note that, from what you’re hearing, Eitan has believed from the start that the korgonne are nothing but vile liars and warmongers. If that one chieftain was <i>really</i> so insincere... what was his goal? To surrender himself so that the milodan would lower their guard, a vulnerability that the korgonne never capitalized on? Eitan was the one that broke the ceasefire, not them.");
	output("\n\n<i>“I don’t know, and I don’t care.”</i> He narrows his eyes, standing steadfast against you and your logic. He’s just waiting for you to get tired and give up.");
	output("\n\nYou try one last thought before you leave. You ask him if he even <i>wants</i> peace.");
	output("\n\n<i>“I do,”</i> he says, <i>“but I don’t believe it’s possible as long as both races still live. We milodan have killed and kidnapped our share of korgonne over the generations, but they are no better than us. They’ve shed my people’s blood before and they’ll do it again.”</i>");
	output("\n\nUla didn’t kill him, though. She didn’t kill any of his people.");
	output("\n\n<i>“That doesn’t mean anything,”</i> he states coldly. <i>“Just because she hasn’t, doesn’t mean she won’t.”</i>");
	output("\n\nIt sounds to you like Eitan is being haunted by the decisions of the generations before him. You take him at face value when he says he wants peace, but he’s so paranoid that the korgonne currently in charge is just as bloodthirsty as the leaders before her, when the last chieftain, her own father, was willing to do what <i>his</i> predecessor did by sacrificing himself for the greater good. The korgonne have been trying for <i>three generations</i> to try and establish a more permanent peace between the two factions, and Eitan destroyed all that effort by breaking the ceasefire based on what happened before he was even around to make decisions, and not based on what’s happening <i>now.</i>");
	output("\n\n<i>“What’s happening</i> now, <i>[pc.name] Steele, is that my people and I are chained to the korgonne’s mines and forced to do menial labor until we die.”</i>");
	output("\n\nYou promise Eitan that, if he has the bravery to do what his predecessors couldn’t and reciprocate negotiations for peace, his fate doesn’t have to end in the korgonne mines. He doesn’t have to like it – you can’t imagine Ula would be too thrilled to sit in a room and discuss peace treaties with him either, after what had happened – but if you and her can come to an understanding, and he <i>really</i> wants peace, then the war can stop with his generation. ");
	output("\n\nHis brow furrows, and he casts his eyes to the beaten floor between you two. A low, long, throaty, contemplative hum rumbles from his throat. <i>“I am only Alpha of one tribe, [pc.name] Steele,”</i> he starts–");
	output("\n\nYou cut him off by saying that that sounds like quitter talk, which is hardly becoming of an Alpha. And besides: he said earlier that the old korgonne chieftain gave himself to a different tribe, and he respected the ceasefire as established by them until Pyrite Industries injected themselves into the matter. There’s clearly some communication and respect going on between the milodan tribes. If he announced to all the milodan that peace had been achieved – at his hand, mind! – then they would respect his announcement in turn.");
	output("\n\nEitan chews at nothing again, digesting what you’re saying. He takes a deep sigh, in and out through his nose. Peace between the korgonne and the milodan was in front of him this whole time, and he hadn’t realized it until now, too blinded by the wrongs committed in the war to see past them.");
	output("\n\nOf course, he doesn’t admit as much.");
	output("\n\n<i>“I have a lifetime’s worth of anger towards the korgonne to sort through, [pc.name] Steele,”</i> he admits with a lighter tone than usual. <i>“I will not ask for mercy, and I will not ask to negotiate. Not today. Not tomorrow.”</i>");
	output("\n\nHow about... after then?");
	output("\n\nHe takes another sigh through his nose. <i>“We’ll see.”</i>");

	flags["EITAN_PRISONER_TALKS"] |= 4;

	addButton(0, "Next", getEitansNextRequest);
}

public function prisonerEitanOnTheMiloMilfHeCameFrom():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(15);

	output("When you and Eitan first properly introduced yourself, you recall that he called himself ‘son of Laklan.’ You ask who that is – presumably it’s the name of one of his parents. What kind of milodan were they? Does he have other family?");
	output("\n\n<i>“I am the oldest of a litter of three. My two siblings, both sisters, have since moved to their own clans, and I’m unsure of what has become of them. The youngest was an excellent fisherwoman, and the next-oldest was an excellent teacher, so I’d imagine they’ve found their own places in their own tribes doing their own things.”</i> He rubs at his chin again and a low, contemplative growl escapes his throat. <i>“I...,”</i> he starts, then interrupts himself. <i>“No, it’s best I hadn’t.”</i>");
	output("\n\nYou make a note to consider going back to that later.");
	output("\n\n<i>“Anyway, Laklan is my father,”</i> he answers simply. <i>“He was neither an alpha of the tribe, nor was he a wiseman. He was an average hunter, of average build. His contribution to my lineage and to our tribe was that he was the caretaker: he tended to the wounded; he repaired the weapons; and he prepared the kills from the hunt.”</i>");
	output("\n\nThat’s interesting, that Laklan is so far removed from Eitan. It’s a wonder that he announced himself as Laklan’s son.");
	output("\n\n<i>“Why would I not?”</i> he asks sincerely, his voice pitching upward in surprise at the insinuation. <i>“Caretaking is an important part of any tribe. He may not have been the strongest or most efficient hunter, but his work was vital to the survival of my tribe. If he himself were ever sick or injured, it was up to the rest of the clan to recuperate him, so that he could resume his duties to the clan.”</i>");
	output("\n\nYou hadn’t expected Eitan to take such a progressive stance towards his father’s position in the clan. He speaks as though he has a lot of respect for his father – as he should – but, obviously, he didn’t exactly follow in his father’s footsteps to be a tribe’s caretaker.");
	output("\n\n<i>“I did not follow in my father’s footsteps, no,”</i> he corroborates. <i>“I....”</i> He winces uncharacteristically, his mouth curling into a snarl for only a moment. <i>“I followed in my mother’s.”</i>");
	output("\n\nYou tilt your head in surprise and say nothing. You don’t know how to ask him to repeat himself without phrasing it as a question.");
	output("\n\n<i>“My mother’s name was Edrei. She was the alpha to our tribe. The largest and the strongest and most beloved of them all.”</i>");
	output("\n\nYou make a note of his adjective choice and to go back to it later. Instead, you wonder if the title of Alpha is hereditary, or if Eitan had to earn it from Edrei like any other milodan.");
	output("\n\nAt the non-question, Eitan’s nose curls into itself as he snarls at the memory. <i>“An Alpha raising another Alpha isn’t unusual, and the offspring has to earn the title in combat.”</i> He glances away, mumbling words to himself that you can’t make out. Talking about his mother is clearly a bit of a sour point for him.");
	output("\n\nYou ask him to repeat himself, assuming repetition to be a freebie question.");
	output("\n\n<i>“She was injured by a Frostwyrm long before I was ready to challenge her. Although she was still Alpha, she took the title of fertility priestess nearly overnight, and she was put in the rare position of being both titles at once. She wasn’t capable of combat anymore, but we still had a tradition to uphold, and she needed to abdicate her title as Alpha quickly. I,”</i> he grimaces, but in frustration rather than shame, <i>“slapped her once, and that was the battle. I had claimed my title from her.”</i>");
	output("\n\nIf she was really incapable of combat herself, then it sounds to you like she just wanted her son to ascend and she took advantage of a loophole.");
	output("\n\n<i>“Exactly!”</i> Eitan bellows, extending both of his hands to you, palms up. <i>“As Alpha, it was her responsibility to uphold the tradition of passing on the title by combat. She had abused our tribe’s systems to get out of fighting me!”</i>");
	output("\n\nThat’s... not what you meant at all, and from the way he’s phrasing it, that’s probably not what Edrei intended when she threw the fight. You’d sooner think that she threw the fight because she wanted her son to ascend, and not so much because she was injured.");
	output("\n\nEitan says nothing and taps his foot on the stony floor impatiently. The thought that his mother passed him the title without a fight because she loved him, and not because she was looking out for her own well-being, had crossed his mind, but he clearly doesn’t want to think of it that way.");
	output("\n\nGoing back to the earlier thought, you assume that, because she was ‘beloved by all,’ the ceremony that came with passing on the title to him must have been rather grand.");
	output("\n\n<i>“Oh yes,”</i> he says mockingly, waving his palms and shrugging his shoulders in what can only be described as ‘aggressive indifference.’ <i>“Every milodan in the tribe was there to congratulate Edrei on what a fine son she had raised. How they would miss her being the alpha of the tribe, and how she would make a fine priestess instead. How they</i> knew <i>her son Eitan would follow in her footsteps.”</i>");
	output("\n\nYou take it that he wasn’t interested in doing that.");
	output("\n\n<i>“They</i> revered <i>her, [pc.name] Steele. Male or female, betrothed or not – going from Alpha of the tribe to priestess of the tribe has a way of giving you a</i> reputation. <i>One that her son couldn’t hope to match.”</i>");
	output("\n\nFrom the sounds of things, Eitan resents his mother for being popular, and he hasn’t been able to live up to her legacy. You doubt he’d want to be named ‘priestess’ himself, so you don’t mention it. You imply that she must have been one hell of a leader.");
	output("\n\n<i>“I could be a better one!”</i> he shouts, the chains of his harness rattling at his booming voice. <i>“But the milodan tribesmen and women are all too busy fawning and reminiscing and crying about ‘what could have been’ if Edrei hadn’t been injured.”</i> He calms down and hangs his head, his hands clenching into fists over and over. <i>“Sometimes, [pc.name] Steele,”</i> he mutters, <i>“it feels like I’m not the Alpha of the tribe, and I’m just a sit-in for my mother.”</i>");
	output("\n\nRecognizing that Eitan is in a bit of a vulnerable state, you take the chance and ask what kind of Alpha she was. Surely there’s a reason why the tribe liked her so much.");
	output("\n\nEitan takes a deep breath through his nose as he considers even answering the question. <i>“Compassionate,”</i> he answers after a long moment. <i>“Generous. She smiled a lot.”</i>");
	output("\n\nIt’s easy to see where the divide might have started, if she’s all of those things, particularly since he himself... isn’t. You suppose she wasn’t much for combat herself, despite being Alpha.");
	output("\n\n<i>“A very un-Alpha-like attitude, don’t you think?”</i> he confirms.");
	output("\n\nSo, then, the attack on the korgonne must not have been approved by her.");
	output("\n\n<i>“It was not,”</i> he confirms again.");
	output("\n\nClearly, the idea of trying to lead by her example had crossed his mind, and he wasn’t for it. You wonder why that might be.");
	output("\n\n<i>“Because I don’t believe Edrei is what an Alpha should</i> be<i>,”</i> he says sternly. <i>“The Alpha of the tribe is the strongest of them all, [pc.name] Steele. Anything and everything belongs to the Alpha – it is the Alpha’s</i> right <i>. The Alpha shouldn’t shy from combat or challenges, and the Alpha shouldn’t give what’s theirs to anyone else. She was too soft for a leader.”</i>");
	output("\n\nAnd yet, Edrei is beloved by all in her tribe, and he’s admitted that the rest of the tribe’s attitude towards him makes his title feel hollow. Clearly, she had figured something out. You ask, if it’s adoration he wants, if he’s even <i>tried</i> to do what she’s done and act as a more benevolent leader.");
	output("\n\n<i>“I don’t</i> need <i>to act like Edrei does, [pc.name] Steele. I am the Alpha. The tribe will give me what I want, when I want it.”</i>");
	output("\n\nThat doesn’t answer your question, and he knows it.");
	output("\n\nHe sighs through his nose. <i>“No,”</i> he admits.");
	output("\n\nYou tell Eitan that he can have it one of two ways – either keep abusing his privileges above the other milodan as their Alpha by indiscriminately taking what doesn’t belong to him and have his reputation among his tribes-people remain as it is, or he can swallow his pride and try to be a bit more like his mother. She threw the match against him so that he could have those privileges in the first place, and if you were Edrei, you’d feel that behaving as he is would be a serious betrayal of that trust. He has a lot of animosity towards his mother and the standards she’s established, but it’s up to him whether he wants to meet those standards, even if he’ll only be able to do it by giving up the things he feels he’s earned.");
	output("\n\nEitan’s hands have curled into fists so tight that you think his claws might dig into his palms hard enough to draw blood, if he isn’t careful. His breathing is steady, and his eyes are on you as he digests what you’ve said to him – you take the lack of any snappy comeback as a good sign, that he’s considering your words and that they’ve had a serious effect on him.");
	output("\n\nBefore you leave, you want to go back to one thing he said a while ago. When he was talking about his sisters, he was about to say something, but then decided that ‘it was better that he hadn’t.’ You don’t ask him to clarify, leaving it implied between you that he should.");
	output("\n\n<i>“I hadn’t told them about my attack on the korgonne Hold,”</i> he says, his voice relaxing. <i>“It was better that I hadn’t because I didn’t want them to worry, or to try and stop me, or to warn Edrei.”</i>");
	output("\n\nYou assure Eitan that he doesn’t have to try and take after Edrei right this moment, if he doesn’t want to. It’s easier said than done to swallow your pride. But leaving his sisters out of the loop and deliberately acting in a way his mother wouldn’t approve would have hurt them more than any physical thing he could do to anyone in his own tribe. Rebuilding his relationships with them would be a good start to repairing his reputation among the milodan.");
	output("\n\nEitan takes another deep sigh through his nose. <i>“I’ll think about it,”</i> he tells you.");
	output("\n\nIt’s better than a ‘no.’");

	flags["EITAN_PRISONER_TALKS"] |= 8;

	addButton(0, "Next", getEitansNextRequest);
}
	
public function getEitansNextRequest():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(3+rand(3));

	switch (flags["EITAN_PRISONER_NEGOTIATIONS"])
	{
		case 1: case 2:
			output("<i>“Now, if I’m not mistaken, [pc.name] Steele, I remember our agreement being that I would give you more conversation, but only if you give me anything that I ask for first.”</i>");
			output("\n\nYou remind him – within reason. Anything he wants, within reason.");
			output("\n\n<i>“Right. Within reason.”</i> He smiles an uncomfortable, mischievous, maybe even predatory smile, showing off his massive sabre teeth. <i>“I have just the idea.”</i>");
			output("\n\n<i>“Unfortunately, I haven’t had the opportunity to see the stars and other planets for myself, [pc.name] Steele. I have you to thank for that.”</i> He flicks his thumbs under the chains of his harness as if they were overall straps. <i>“I’m blind and dumb to all the different cultures of the universe. I’ll never know what it’s like to be among different people, and speak their language... and appreciate the body in their ways.”</i>");
			output("\n\nYou shiver at the insinuation of what it is he wants, but you don’t interrupt and let him finish the thought before you reject him.");
			output("\n\n<i>“You might not have noticed, but the milodan men and women tend to not wear very much,”</i> he laughs. <i>“It leaves so little to the imagination! And down here, that’s all I have. I want you to wear an outfit for me that another culture would find sexually appealing. Give me something to think about at night, [pc.name] Steele.”</i>");
			output("\n\n<b>Eitan wants you to put on a little show for him by wearing something sexy.</b> You suppose it could have been something far worse.");
			output("\n\nWith his demand made clear, he hefts his massive pickaxe and turns his back to you, resuming his work.");
			break;
		case 3:
			output("Eitan taps on his lower jaw, his left arm wrapped around his chest as he thinks to himself. <i>“What should I ask of you this time?”</i> he wonders aloud, his eyes roaming the ceiling of the mine. There are only so many things he could ask from you, so he knows he needs to make it count. <i>“Your last,”</i> he chuckles, <i>“‘gift’ will get me through a listless night or two. Maybe I should have you wear less?”</i>");
			output("\n\nYou grit your teeth. As much as you like to think you’re making progress with him, it’s difficult to say for sure when he says things like that.");
			output("\n\n<i>“No, that’d be a waste, I think. I shouldn’t waste this opportunity on things I can’t touch. Living in this dark mine and doing nothing but swinging a pick for all hours of the day in the name of my enemies tends to have you yearn for the physical, [pc.name] Steele.”</i>");
			output("\n\nHe lowers his gaze and his mouth straightens as he starts to seriously think about what it is he wants. He only gets one thing at a time, and like he said, he’s smart enough to not waste it.");
			output("\n\n<i>“During my short time with Pyrite, they introduced me to a type of drink that I had never had before. I wasn’t much for the taste, but the effect it had on me when I drank enough has had me craving a bit for some more, to feel that way again.”</i>");
			output("\n\nYou ask him to go more into detail about how he felt when he drank enough of the drink. You have an idea of what it is he wants, but it’s better to be safe than sorry.");
			output("\n\n<i>“It ruined my sense of balance and it made my vision swim, but it also... unwound me, I suppose. I don’t often get to really relax, [pc.name] Steele, given my status as alpha – whether it’s fighting or mating, my body is usually tensed up over one thing or another. And working in the mines underneath the korgonne Hold has me wound up. The drink you get me doesn’t have to be the same ones that Pyrite gives me – like I said, I wasn’t for the taste. Whatever makes me feel the same way again.”</i>");
			output("\n\nIt seems that the milodan aren’t immune to the effects of alcohol, just like the rest of the universe. <b>Eitan wants something alcoholic to drink.</b> That sounds fairly simple to you.");
			output("\n\nYou tell him that you can find him something to drink, but he has to promise he’ll only drink it when he’s not swinging that pickaxe. Giving a very strong milodan with some seething emotions towards the korgonne some alcohol while he’s chained up and swinging a pick around sounds like a bad time to you.");
			output("\n\nEitan huffs through pursed lips, but nods. <i>“Fine,”</i> he answers, and then hefts his mighty pickaxe with one hand and turns back to his wall. With the clank of his pick against the ore, your conversation is over.");
			// any drink that causes Tipsy or Drunk will work
			break;
		case 4:
			output("You stand idle now that your formal conversation is over, waiting for Eitan to tell you what it is he wants for you to get for him. You’ve been making some decent progress with him, trying to convince him that his way of thinking is aggressive and wrong, but you’re not there yet. You just need to keep it up for a bit, and that means getting him something so he’ll keep talking.");
			output("\n\nEitan, however, doesn’t say anything, not right away. He rests both his hands on the butt of his overturned pickaxe, and his eyes are on the chain-gang of milodan, each of them working to chip away at the mines. His eyes are narrowed in thought and his breathing comes out slowly and evenly; you shift from one side to the other to try and get his attention, and he ignores you. It’s almost as if he’s having a conversation with himself.");
			output("\n\n<i>“[pc.name] Steele,”</i> he begins, his voice low and gravelly. <i>“Tell me. Can you name an enemy that can’t be seen; that no armor can protect you from; that no weapon can defeat; and can conquer someone as strong as myself?”</i>");
			if (pc.intelligence() < 30)
			{
				output("\n\nYou admit that you aren’t certain. You were lost as soon as he asked you to name an invisible opponent.");
				output("\n\n<i>“Disease,”</i> he answers simply. He frowns and keeps his eye on the milodan chain-gang as he says the word. <i>“No matter how strong I get, disease can find a way to bring me down.”</i>");
			}
			else
			{
				output("\n\n<i>“Disease,”</i> you answer. It wasn’t a particularly subtle riddle, if indeed it was one.");
				output("\n\nEitan’s eyes turn to yours, and he smiles. <i>“I had expected nothing less from you, [pc.name] Steele.”</i> His eyes go from your own, to your [pc.feet], then back up. <i>“You would have made a fine alpha yourself, you know. In some other tribe.”</i>");
			}
			output("\n\n<i>“I’m worried that, in the conditions we’re in, with so little fresh air and sunlight, the conditions are perfect for disease to strike my people and me. This time, Steele, I want two things from you.”</i>");
			output("\n\nHe lifts his massive, furry hand and extends his index finger. <i>“The first is that I want each of us to see the outside for a moment. Lead us one-by-one if you must. A bit of fresh air will help stave off disease and weakness.”</i> He lifts his middle finger next. <i>“And second, I want medicine. Pyrite had shown me what your star-faring peoples are capable of with medicine. I want some of it for myself. And I don’t trust anything from the korgonne, so I don’t want any of their medicine.”</i>");
			output("\n\nEitan may be hoarding the medicine, but he’s at least <i>trying</i> to think of his people by advocating them getting some fresh air. That’s a start! <b>You’ll have to ask Ula about bringing the milodan aboveground for some fresh air and sunlight,</b> and <b>you’ll need to find some medicine for Eitan.</b>");
			output("\n\nUla should be easy to convince, but where can you find some medicine...?");
			// The only medicine that I could find was V-Ko offering Immuno-Boosters, so that’d have to do, unless you can think of something else to include.
			// Blacklist Nenne’s Healing Pultice, though
			break;
		case 6:			
			output("Eitan stands mostly still, leaning on his overturned pickaxe, as he digests his conversation with you. Lately, he’s been more and more contemplative after your discussions; with every long-winded discussion, you’re having more and more of an impact on him. You wonder what it is that he’s going to ask from you this time.");
			output("\n\n<i>“These last few times we’ve spoken, it’s been getting harder and harder to think of what it is I want, [pc.name] Steele,”</i> he says. <i>“Before you and I started speaking regularly, I would have asked for anything from weapons to having you service me.”</i>");
			output("\n\nHis insinuation that he’d have you go down on him is so casual. But you suppose you aren’t surprised, given the privileges he’s been used to as the alpha.");
			output("\n\n<i>“Although I suppose that’s considered a rude thing to say in your culture,”</i> he admits. <i>That</i> surprises you. <i>“I’ve asked for exotic food; I’ve asked for you to dress enticingly; and I’ve asked for medicine. If I’m to ask for something that I need, I shouldn’t waste it.”</i>");
			output("\n\nYou tell him that if he’s having a hard time deciding, he doesn’t <i>have</i> to ask for anything at all, and you two could talk for free.");
			output("\n\nHe smirks at that. <i>“We could,”</i> he says, <i>“and I’ll consider it... but only if you wear this,”</i> he continues, thumbing at his chain harness, <i>“and you start swinging around this.”</i> He pats at the butt of his overturned pickaxe. <i>“As long as I’m a prisoner, I’ll take any advantage I can get, [pc.name] Steele.”</i>");
			output("\n\n<i>“Fair enough,”</i> you reply.");
			output("\n\n<i>“Although that</i> does <i>give me an idea.”</i> He hooks both his thumbs underneath the chains of his harness again. <i>“These chains chafe and dig into my fur with all the heavy motion. I want you to bring me something that I can wear underneath it that can help me with that.”</i>");
			output("\n\n<b>Eitan wants you to bring him an undershirt.</b> It’s probably the most innocuous request he’s made. Either he’s really running low on ideas for what to ask for, or he’s just trying to not be so intrusive on your day-to-day life – which would be a far cry from the Eitan you once knew.");
			output("\n\n<i>“I’m looking forward to our next discussion... and my under-thing to wear,”</i> he tells you before he picks up his pick and turns back to the wall, resuming his manual labor.");
			break;
	}

	IncrementFlag("EITAN_PRISONER_NEGOTIATIONS");

	addButton(0, "Next", mainGameMenu);
}

public function unfotunatelyEitanShallNoLongerBeNude(clothes:ItemSlotClass):void
{
	IncrementFlag("EITAN_PRISONER_NEGOTIATIONS"); //Incremented here so showEitan can take it into account in the future. Probably won't be used anyways. sadfaec -LF

	clearMenu();
	clearOutput();
	showEitan();
	processTime(6);

	output("You return to Eitan with the " + clothes.longName + " that he had asked for. He doesn’t thank you for it – but he doesn’t say much of anything. As soon as his eyes meet yours, his lips curl downward into a contemplative frown, and he says nothing as he works the undershirt on, worming it down beneath the chains without removing them. It’s a struggle, and the shirt wasn’t meant for someone with his titanic frame, but he gets it on, even if it’s a little small for him.");
	output("\n\nEvery time before, Eitan would greet you with his confident, if a little smug, smirk, no matter how exhausted he’d been from all the mining. This, however, Eitan appears... pensive. Normally, he’d invite you to ask him something, but not this time. His eyes are cast to the ground, not in submission, but in thought.");
	output("\n\n<i>“[pc.name] Steele,”</i> he says after a moment. His voice is lower and smoother than usual. <i>“Every time you’ve approached me and given me what I’ve asked for, you asked me a question, and we would have a bit of a back-and-forth for a while.”</i> You don’t respond – it wasn’t a question, but merely a statement. <i>“This time, I have something I’d like to ask you.”</i>");
	output("\n\nThat’s an interesting turn. You tell Eitan that you’re listening.");
	output("\n\n<i>“You’ve given me much to think about all this time. From what it means to be the alpha, to the segregated culture surrounding my people, to the milodan’s relationship with the korgonne, to my personal standing with my family. I’ve abused my privileges as alpha and I’ve instigated violence for....”</i> He pauses and looks to the milodan next to him, still toiling away in chains at the mines beneath his enemy’s living space. <i>“For nothing but the sake of violence, I suppose.”</i>");
	output("\n\nEitan has come a long way, clearly. Your time with him has had an obvious effect, down to himself calling his own actions ‘abusive.’ He’s even downright remorseful for even starting the violence against the korgonne in the first place.");
	output("\n\n<i>“Tell me about yourself, [pc.name] Steele,”</i> he says. <i>“All we’ve spoken about is myself and my way of thinking and doing. You’re compassionate enough to give me what I want when all you want in exchange is to talk; you’re well-off enough to explore the stars at a whim; and I’ve had enough time to come to terms with the fact that you can beat me in combat. How does one,”</i> he says, motioning to your whole body, his own chains clinking with the motion of his arms, <i>“do all that?”</i>");
	output("\n\nThat’s a hell of a question. To start with, you ask Eitan if he understands the concept of ‘economy.’ <i>“I’m afraid I don’t,”</i> he answers, and you give him a quick, base rundown on concepts like ‘money’ and ‘fair exchanges.’ Him being the alpha for most of his life and taking advantage of everything that that means, it takes him a moment to understand the idea of exchanging a note that says it’s worth something for a good or service, but he gets it well enough by the time you’re done.");
	output("\n\nYou tell Eitan that you’re the child of a man that owned a lot to his name. When he passed away, he challenged you to follow in his footsteps and travel the stars in search of items that can only be handled by someone in your bloodline, and if you succeed, you’ll inherit everything that he left you. It’s somewhat similar to how he took the title of Alpha from his mother.");
	output("\n\nYou regale to Eitan that your journey has taken you to man-made planets called ‘stations’ that rest among the stars, to planets teeming with jungle life and thick forests, to desert planets sunken in garbage and refuse, to planets with deep underground networks and caves that reach far lower than the mines you and he are standing in now. You’ve fought with pirates");
	if (flags["RESCUE KIRO FROM BLUEBALLS"] == 1) output(" and you’ve become fast friends with others");
	if (flags["TARKUS_DESTROYED"] != undefined) output("; you’ve made some difficult decisions");
	if (flags["WHUPPED_DANES_ASS_ON_MHENGA"] != undefined) output("; you’ve overcome obstacles in your path towards claiming your inheritance, including your own kin");
	if (!paigeBlind()) output("; you’ve given your own personal wealth to others for their well-being and expected nothing in return");
	output("; and you’ve " + (pc.cockVirgin && pc.analVirgin && pc.vaginalVirgin ? "done it all while keeping yourself chaste and ready for the one that <i>truly</i> matters to you." : "taken your share of lovers in your time."));
	if (flags["FROSTWYRM_NOT_HOSTILE"] >= 2 || flags["FROSTWYRMSLAIN"] == 1)
	{
		output("\n\nAnd on top of all of that... you’ve done what");
		if (flags["FROSTWYRMSLAIN"] != undefined)
		{
			output(", by his own admission, no milodan has ever done before: you’ve defeated a Frostwyrm. Not only did you beat it in combat, but you slew it and took its scales for yourself.");
			output("\n\nEitan’s eyes widen. <i>“You’re lying,”</i> he spouts, almost instinctively, but he reels himself back. <i>“Right? No one can slay a Frostwyrm. Not even the strongest of the milodan alphas can do it.”</i>");
			output("\n\nIf he ever gets out of the korgonne mines, you invite him to check for himself. You tell him to journey east, towards the Uveto ocean, where a Frostwyrm was known to roost. It’s not there anymore.");
			output("\n\nEitan’s eyes lay unflinchingly on yours, his hands clenching and unclenching, but he doesn’t try to argue or deny you.");
		}
		else
		{
			output(", the milodan hadn’t ever <i>dreamed</i> of doing: not only did you defeat a Frostwyrm in combat... but you then went on to <i>mate</i> with it.");
			output("\n\n<i>“You’re lying,”</i> he says immediately, his eyes narrowing.");
			output("\n\nYou continue: not <i>only</i> did you mate with it, but you <i>successfully crossbred</i> with it. You have a clutch of Frostwyrm half-breeds out in the Uveto ocean waiting for you.");
			output("\n\n<i>“That’s impossible,”</i> he says, his words coming out harsher and sterner. <i>“I had believed you up until now, [pc.name] Steele, but now I think your whole story might be some naïve lie to try and get me to lower my inhibitions.”</i>");
			output("\n\nIf you were the type to lie, especially after everything you’ve done for Eitan, you probably would have done it by now. [frostwyrm.name] isn’t exactly the type to be welcoming towards guests – you had to fend her off two or three times yourself before you two came to an understanding – so you can’t exactly introduce Eitan to her. You instead ask Eitan to consider two things: if you were going to lie, why would you wait until now to do it, and if you were going to lie, why would it be about something so over-the-top? Why wouldn’t you lie about something smaller?");
			output("\n\nEitan grumbles to himself and chews at nothing as he considers your words. You’ve been nothing but honest up until now, and he knows it, but to think that someone had not only bested a Frostwyrm in combat, and not only mated with it, but also <i>crossbred</i> with it, is so grandiose that you think the only way to truly convince him is if he sees it for himself.");
		}
	}
	output("\n\nYour journey to inherit your father’s legacy has taken you all over the universe, and you still have so much more to see and more planets to visit. You’ve accomplished more than you could have dreamed was possible before you visited so many different cultures and locations. Mediating the conflict between the milodan and the korgonne, and doing what you can to rehabilitate Eitan, is just another step on your adventure.");
	output("\n\nEitan sighs as you end your story, his chin resting in his hand. <i>“‘Rehabilitate,’ huh?”</i> he says above a low, throaty growl. <i>“On the one hand, [pc.name] Steele, I don’t like the idea of you trying to manipulate my way of thinking. I am the alpha of the milodan, and in the end, it’s up to me to decide what that means.”</i> He hums to himself again. <i>“But on the other... like I said, I’ve been thinking about our talks and your way of thinking. Maybe ‘rehabilitate’ isn’t too far off the mark.”</i>");
	output("\n\nYou ask if there’s anything more you can do for him.");
	output("\n\nEitan sighs through his nose again and looks around his space. He looks at the massive pickaxe beside him, and he looks at his chain harness, and he looks at the wall he had been picking at for what seems like a lifetime, now. He looks at you, and at your korgonne escort, and himself. And he looks at the milodan chain-gang, not too far away, most of them still toiling at the mines but a handful of them watching you and Eitan with some curiosity.");
	output("\n\n<i>“I want one more thing,”</i> he says after an eternity. <i>“I want water.”</i>");
	output("\n\n<i>“Water?”</i> you parrot, looking for confirmation. You know for a fact that Ula’s been sending him enough food and water.");
	output("\n\n<i>“But not for me. For them.”</i>");
	output("\n\nHe nods towards his people, all chained by the ankles and the waist together in a long line, chipping at the savicite walls.");
	output("\n\n<i>“Bring me enough water to quench each of them. That’s what I want from you this time, [pc.name] Steele.”</i> He hefts his massive pickaxe up with his left hand and slings it over his shoulder. <i>“We’ll see where our conversations go next time.”</i>");
	output("\n\nHe turns his back to you and returns to his labor, swinging his pick at the uneven walls. Chips of stone clank to the floor at his feet with every massive swing. Your conversation is over, and if you want to speak with Eitan again, <b>you’ll have to ask Ula for more water for the milodan.</b>");

	pc.destroyItemByReference(clothes);

	addButton(0, "Next", mainGameMenu);
}

public function theCatsWantWaterAndUlaIsBewildered():void
{
	clearMenu();
	clearOutput();
	showUla();
	author("B & Fenoxo");
	processTime(3);

	output("You jump straight to your request. <i>“");
	if (pc.isBimbo()) output("Sooo the milodan like, need more water.");
	else if (pc.isAss() || pc.isBro()) output("More water for the milodan.");
	else output("The milodan need more water.");
	output("”</i>");
	output("\n\nUla looks crestfallen that you’ve chosen to talk about the milodan prisoners instead of a topic she’d be more interested in, but like any good chieftess, she waits for you to finish your request before responding. <i>“" + (korgiTranslate() ? "I’m confused. Do they not have enough water? Are they really that thirsty?" : "Am confuse. Is current waterings not enough? Milodan really such thirsty?") + "”</i>");
	output("\n\nYou explain that Eitan - the War Alpha - requested it for his people, not for himself. He’s trying to look out for his people instead of simply using them as tools, like he used to. He could have asked you for any favor in the universe, and he chose to make sure his people’s palates were suitably moistened. That he chose to eschew standard milodan culture for his charges is a <i>really big deal</i>. This could be the beginning of a tremendous breakthrough!");
	output("\n\nUla’s eyes wander the room as she considers it. <i>“" + (korgiTranslate() ? "I must admit, [pc.name]... I don’t want the fang-cats happy. Maybe hunger pangs and thirsty throats are good punishment for what they did to us." : "Am admitting, [pc.name]... Ula not want fang-cats happy. Maybe thinking thirst-having and hunger-panged is good payment for what to do to Korg’ii.") + "”</i> Her jaw sets, and her eyes dart back to you, ice-hard. <i>“" + (korgiTranslate() ? "But I won’t rule from anger. Chief, chieftess... any good leader does what’s right for the people, even if it’s hard or hurts your own heart to do." : "But Ula not rule from anger. Chief, chieftess... any good leader do what right for people. Even if hard or hurt own heart to do.") + "”</i> She nods. <i>“" + (korgiTranslate() ? "The milodan will have their water, and I’m glad I know you, [pc.name]. You truly are the best alien." : "Milodan having waters, and Ula glad know you, [pc.name]. You best alien.") + "”</i>");
	output("\n\nYou thank her for her generosity and " + (pc.isBimbo() || pc.isNice() ? "give her another" : "let her give you a") + " big, warm hug. She sighs again and melts into you, her head resting on the crook of your shoulder for a moment.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Whiling here" : "While you’re here") + ",”</i> she says, her expression softening and her finger twirling through her hair as her emerald green eyes turn to crescents above her smile, <i>“" + (!korgiTranslate() ? "</i>else <i> of things of any Ula can be helping of?" : "is there anything</i> else <i>I can help you with?") + "”</i>");

	IncrementFlag("EITAN_PRISONER_NEGOTIATIONS");

	ulaMenu();
}

public function eitanIsNowAWateryBoye():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(13);

	output("You had expected there to be a commotion when you first came into the prison mines after having spoken with Ula. Maybe some general merriment, or, worst-case, maybe a scuffle over who gets more water now that there’s a surplus of the commodity, but, perhaps more unnervingly, there’s nothing out of the ordinary at all to be heard.");
	output("\n\nWhen you round the corner and you’re brought into the mine proper, you see the milodan chain-gang, each of them carrying a heavy pouch, either in their hand or on their hip. They slosh with liquid with every movement; Ula had kept to her word and sent down excess water for each of them to enjoy. But most of them are acting as if there’s nothing new at all to their day: some of them are chugging their water – apparently they were more parched than you had realized – but most of them are just back to the grind.");
	output("\n\nStanding in the corner of the room is Eitan, with his pickaxe flipped over and his hands resting one over the other on the butt of the handle. His expression is sour and his eyes are cast downward. He doesn’t have any additional water of his own – he specifically asked for more water for his people, and not for him, so you wouldn’t be surprised if he didn’t get any.");
	if (pc.intelligence() < 20) output("\n\nYou wonder what’s gotten Eitan into such a sour mood. He got exactly what he asked for – this should be a happy moment for him, and for you, but that’s clearly not the case. You know you should talk with him some more, but he also doesn’t look like he’s in an especially talkative mood, and you might just make it worse.");
	else output("\n\nIf you had to guess, Eitan was hoping his reputation with his own people would flip like a switch for the good deed he did. He told you that his mother was ‘beloved by all’ when she was alpha, and he was probably fantasizing about getting the same recognition for this one thing that he did, and when he didn’t get it, it soured his mood. You know that it’ll take more than one good deed, and you’re sure he’s smart enough to know that too – you just hope he doesn’t think it was a waste of time.");
	output("\n\nOne of the male milodan, the closest to Eitan on the chain, keeps glancing over his shoulder with every swing of his pick, and before you can approach Eitan yourself, the milodan disrupts the chain by stepping away from his post and approaching his alpha. The milodan stood a head shorter than Eitan and wasn’t nearly as wide, giving you a perspective on how large the alpha is. The milodan had to tilt his head backward just to meet Eitan’s gaze eye-to-eye.");
	output("\n\nThe smaller milodan said something, but you’re too far away to hear, and his voice is drowned out by the sound of picks against ore. It’s a quick, one-sided conversation, with Eitan standing and listening. But, most importantly, you can make out the words ‘thank you’ before the milodan returns to his position with his pickaxe, swinging away like nothing happened.");
	output("\n\nThose two little words have an effect on Eitan. His body doesn’t move; his eyes don’t rise from the downward stare; and his expression doesn’t un-cloud – save for his brow, which unfurrows. It’s such a slight change to his look that " + (pc.reflexes() < 20 ? "you’re surprised that even you managed to pick it up" : "you doubt anyone else could have noticed it") + ", but it’s enough to let you know that it’s changed his mood.");
	output("\n\nEitan doesn’t acknowledge you at first when you approach him. He’s still absorbing what had just happened and how he should process it.");
	if (pc.intelligence() < 20) output(" Hopefully, it’s enough to get him over whatever funk he’s in, but you keep yourself available all the same, just in case he needs to talk some more things out with you.");
	else output(" It may not be the fantasy he was hoping would come true, but, with any luck, that one little sign of appreciation would let him know that he’s on the right track.");

	addButton(0, "Next", eitanHasConsideredTheThings);
}

public function eitanHasConsideredTheThings():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(4);

	output("<i>“[pc.name] Steele,”</i> Eitan finally says after a solemn few moments. You stand at attention, ready for whatever he’s about to say.");
	output("\n\nHe takes a deep breath: in, then holds it, then out, in a single, long, smooth exhale through his mouth. His body visibly deflates, as if years and years of tension had left him with that one breath.");
	output("\n\n<i>“Tell the korgonne chieftain that I would have an audience with her,”</i> he says. <i>“We’ll discuss the future between the korgonne and the milodan.”</i>");
	output("\n\nYou don’t want to dissuade him – that’s a big thing that he wants to do, and it’s the goal you and Ula were hoping to achieve from the start – but you remind him that his reputation with Ula isn’t exactly in good standing. She remembers what he nearly did to her in the throne room.");
	output("\n\n<i>“I’m not excited about it myself, [pc.name] Steele,”</i> he admits. <i>“A part of me is furious at the idea of making peace with the korgonne. We’ve been enemies for generations. And seeking peace only</i> after <i>I’ve been defeated will be seen as weakness and submission.”</i> He sighs again. <i>“But that’s my pride getting in the way of what I know is the greater good. A generations-long war can end with us.”</i> He inhales sharply through his nose; this whole time, his eyes still haven’t met yours. <i>“At the very least, peace between the milodan and the korgonne means no alpha after me would have to endure the same humiliation.”</i>");
	output("\n\nYou’ve done it: you’ve gotten Eitan to seek peace between the two races. <b>All that’s left now is to tell Ula that Eitan wants to speak with her.</b> She’ll probably be exactly as thrilled about it as he is, but she’s got a cool head on her shoulders, and you know she’s looking forward to some real progress, too.");

	IncrementFlag("EITAN_PRISONER_NEGOTIATIONS");

	addButton(0, "Next", mainGameMenu);
}

public function moreLikeUlaTruceManGeddit():void
{
	clearMenu();
	clearOutput();
	showUla();
	author("B & Fenoxo");
	processTime(4);

	output("When you enter Ula’s room, you find her pacing back and forth across it, her hands behind her back. She doesn’t look particularly perplexed, but the body language is nonetheless unsubtle.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Ula thinking just now of you" : "I was just thinking of you") + ",”</i> she says when she sees you. You two exchange your usual greeting, pulling each other in for a quick hug before returning to a more casual distance. <i>“" + (!korgiTranslate() ? "Going forwards-making with milo jerk?" : "Have you made any progress with the milodan War Alpha?") + "”</i>");
	output("\n\nJumping straight to the point, it seems. You tell her that you have, and that you’re confident you’ve made a huge breakthrough, but you need something else from Ula.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Thinking so" : "I figured") + ",”</i> she laughs, smiling warmly as she waits for your instruction.");
	output("\n\nYou tell her she might not like it.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Honest-having, Ula not sure how feelinged when [pc.name] talking at big milo. Milo not-might deserving of mine-work forever, but Ula unforgiving what big milo almost do." : "To be honest, this whole time, I couldn’t decide on how I felt about you talking with the milodan alpha. On the one hand, I don’t think the milodan deserve to live out the rest of their lives in my mines, but on the other, I haven’t forgotten what the alpha nearly did to me, and I still haven’t forgiven him for it.") + "”</i> She stands up straight and brushes a lock of hair from her eyes, both of them narrowed into slits as she remembers the night of the invasion, and how dangerously close Eitan came to violating her. <i>“" + (!korgiTranslate() ? "Ula thinking that, if [pc.name] really-really try and fix big milo and really-really getting close, then Ula harder trying too." : "I’ve been thinking that, if you’ve really,</i> really <i>been trying to get through to him, and you really think you’re getting close, then I should try and be a little more supportive.") + "”</i>");
	output("\n\nYou’re glad she thinks that way, because Eitan specifically asked for an audience with her.");
	output("\n\nAt the news, her expression, and her jaw, drop, and her body tenses. <i>“" + (!korgiTranslate() ? "[pc.name] saying big milo wanting second chance at Ula-raping?" : "You’re saying the milodan alpha wants me alone in a room with him</i> again?<i>") + "”</i>");
	output("\n\nYou had every intention of sitting in, and you’ve proven you can handle him. Besides, if Eitan is telling the truth, and you have no reason to believe he isn’t, he wants to talk with her to discuss <i>peace.</i> He wants to formally end the war between the korgonne and the milodan once and for all.");
	output("\n\nUla groans at the news. She puts her face into both her palms and just stays there for a moment, absorbing everything you’re telling her.");
	output("\n\n<i>“" + (korgiTranslate() ? "This whole mess began with the War Alpha faking peace talks. Almost every part of me is screaming at the prospect of seeing his stupid cat-snout again," : "Whole mess start with War Alpha faking peace talks. Almost every part of Ula scream-having against seeing dumb catsnout again,") + "”</i> she tells you, her voice muffled through her hands. You worry that she won’t, but soon enough, she relaxes, pulling her paws away to reveal her determined expression. <i>“" + (korgiTranslate() ? "I’m not going to let fear tell me what to do. I won’t let old hurts dig the tunnel of our future. My father hated milos more than any korg, but he tried for peace. It was a mistake then... but I am understanding why he kept trying. If this works, the whole tribe will have a safer future. If not, only I pay for the mistake." : "Ula not let fear tell what do. Not let old hurts dig future. Father hating milos more than any korg, but he try for peace. Was mistake then... but am understanding why he still try. If work, whole tribe have safer future. If not, only chief pay for mistake.") + "”</i> She smiles. <i>“" + (korgiTranslate() ? "And you saved me before. Saved me more than once! If you’re here, I’m sure it will be fine." : "And [pc.name] save Ula before. Savinged many times! If [pc.name] here, it be fine.") + "”</i>");
	output("\n\nShe stands up straight and heads to the door of her room, then out to the halls of the Hold. From there, she flags down the first warrior she finds and mouths a few words to them that you can’t make out.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Here waiting" : "Wait here with me") + ",”</i> she tells you when she returns. <i>“" + (!korgiTranslate() ? "Big milo coming." : "The milodan alpha will be joining us soon.") + "”</i>");
 
	addButton(0, "Next", ulaNegotiationsThing);
}


public function ulaNegotiationsThing():void
{
	clearMenu();
	clearOutput();
	showBust(ulaBustDisplay(), eitanBustDisplay());
	author("B & Fenoxo");
	processTime(7);
 
	output("You and Ula wait in a tense silence, counting the minutes as you wait for Eitan to be brought up from the mines. She goes back to her pacing, her claw between her teeth; she rehearses talking points to herself, followed by rebuttals, before she finds a flaw or an inconsistency with her own arguments and she starts again.");
	output("\n\nThe general noise of motion and community coming from the Hold hush to a whisper, and you know you’re not waiting for much longer: the sound of heavy footsteps, accompanied by the clinking of chain against chain, reverberate through the open hallways, and soon, Eitan, escorted by two large-but-still-dwarfed korgonne warriors, is brought to Ula’s chamber. Looking at him and his circumstances, it’s difficult to believe that this isn’t the first time he’s been in here.");
	output("\n\nEitan keeps his mouth shut. His eyes go to you first, then to Ula, and they stay there. He’s still wearing the chain harness, but since he’s not chained to the floor, the korgonne used the loose strands of chain to wrap and bind his wrists.");
	output("\n\nThe tension between him and Ula is palpable, and it wouldn’t take much for Ula to call off the whole thing and send him back to the dungeons.");
	output("\n\n<i>“Leave,”</i> she instead says to the guards. With that one word, they turn and leave her chamber, standing guard at the entrance, leaving just her, you, and Eitan alone in there.");
	output("\n\nUla is half Eitan’s height, if even that, and he’s so tall compared to the generally-miniscule korgonne that his head brushes against the ceiling. Without her prompt, Eitan sinks to one knee, then the other, and then falls onto his rump, crossing his massive furry legs in front of himself. Even in his sitting posture, Ula only meets him eye-to-eye standing upright.");
	output("\n\n<i>“You and I have history, chieftain,”</i> Eitan finally starts, rolling his shoulders and leaning forward. <i>“Let’s not make this any more awkward than it needs to be and get right to it. I’d imagine [pc.name] Steele has told you why I asked for an audience with you.”</i>");
	output("\n\n<i>“" + (!korgiTranslate() ? "Lessing of us past-talking is better" : "The less we talk about our past, the better") + ",”</i> she says venomously. Ula’s nose crinkles at the sound of his voice and her eyes instinctually narrow, but just as quickly, she relaxes herself. She’s still new to her position as chieftain of the korgonne, and she’s doing everything she can to remain diplomatic, as much as she’d probably rather run her claws through his stomach.");
	output("\n\n<i>“" + (!korgiTranslate() ? "[pc.name] mention talk of peacing between korgs and milos," : "[pc.HeShe] told me you wanted to talk peace between the korgonne and the milodan,") + "”</i> she recaps, straightening her back to try and maintain a sense of authority over him. <i>“" + (!korgiTranslate() ? "Not-belief Ula had of first. Milo and korg peace-having before cat-dogs lie, murder, and invade." : "I could hardly believe it at first. The milodan and the korgonne</i> had <i>peace before you lied, murdered, and invaded our home unprovoked.") + "”</i>");
	output("\n\n<i>“[pc.name] Steele had given me a lot to think about during [pc.hisHer] visits and our discussions. And, with all the labor you had me doing, I’ve had nothing better to do but reflect.”</i>");
	output("\n\nUla snorts at him derisively. <i>“" + (!korgiTranslate() ? "Thinking milos peace-wanting only because milos lost. Not peace-giving to korgonne if won." : "I’m sure you’re only after peace now that you lost. I doubt you’d give us the same peace if you won.") + "”</i>");
	output("\n\n<i>“Probably not,”</i> he admits. <i>“If I never lost the one fight that mattered most, I wouldn’t have learned the humility I know now.”</i> Despite Ula’s obvious hate for him, he sits still, totally unfazed by her. <i>“Chieftain, I grew up believing that the korgonne were my sworn enemies, and it’s taken a lot of time and thinking for me to swallow my pride and admit to my enemy that I was in the wrong. If you don’t think I’m being honest when I say we can make peace, then send me back down. I’ve accepted that I might never leave.”</i>");
	output("\n\nUla stands her ground, unable to keep from working her jaw as she processes his apology. " + (pc.isBimbo() ? "She’d look wayyyy nicer if she just smiled more!" : "No matter her heritage, she has a long way to go in the schooling her emotions during diplomatic discussions."));

	addButton(0, "Next", eitanNegotiationsThingToo);
}

public function eitanNegotiationsThingToo():void
{
	clearMenu();
	clearOutput();
	showBust(ulaBustDisplay(), eitanBustDisplay());
	author("B & Fenoxo");
	processTime(5);

	output("After a moment, Ula says, <i>“" + (!korgiTranslate() ? "What conditions war-cats want for peace-having? Peace always costing much." : "What are your conditions for peace? It always costs something.") + "”</i>");
	output("\n\nEitan takes a deep breath himself and hesitates before answering. You bet he’s been rehearsing his own statements to himself, like what she did before he came. <i>“A formal end to the war between the korgonne and the milodan,”</i> he answers clearly. <i>“No truces. No stalemates. An agreement to end the conflict for good. And for my people and I to be released from your mines.”</i>");
	output("\n\nUla smiles at this like she’s beginning to believe him. <i>“" + (!korgiTranslate() ? "Warm requests. Would happying to do." : "Wonderful requests. I’d be thrilled to achieve them.") + "”</i> After a pause, she adds, <i>“" + (!korgiTranslate() ? "But need all Pyrite-core-magics from milo tribe. Knowing some kept in village. Not trust milos with second time." : "But I’ll need all the technology Pyrite gave your tribe. I know some remained in the village, and I can’t trust that you won’t try this mess a second time.") + "”</i>");
	output("\n\nEitan reels in surprise at the demand. <i>“All of them?”</i> he parrots. <i>“Including the medicine? I won’t do that, chieftain; after everything I’ve been through to get my people medicine, and to get us modern weapons and defenses from Frostwyrms and aliens, I won’t just hand them away. We’d be better off staying in your mines.”</i>");
	output("\n\nUla recoils as if slapped, taken completely aback by Eitan’s care for his tribes’ weakest members. <i>“" + (!korgiTranslate() ? "Understanding. Not need milodan medicine or food. Only worried about war. War Alpha know Korg’ii not seek war, not seek territory. Korg’ii Hold have all needings in hold, but can’t just give whole invading army back guns with pat on back and promise of ‘not do again.’ Giving us..." : "I understand. We don’t need your medicine or food. We’re only worried about war. You know the Korg’ii do not seek war or territory. The hold has everything we need, but that doesn’t mean I can just turn loose an invading army with all their weapons and a promise not to do it again. You’ll need to give us...") + "”</i> she taps her fuzzy chin, <i>“..." + (!korgiTranslate() ? "three of four parts guns and halfing armors." : "three quarters of the weapons and half of the armors.") + "”</i>");
	output("\n\nAt <i>that,</i> Eitan doesn’t immediately answer");
	if (pc.intelligence() >= 25) output(", and you know why: if the korgonne have all the Pyrite Industries weapons, then there’s no guarantee that she won’t immediately use them against the milodan, and given that they lost <i>with</i> the technological advantage, the milodan wouldn’t stand a chance if Ula decided to start eradicating them with their own tools");
	output(".");
	output("\n\n<i>“Half of both,”</i> he says after a moment.");
	output("\n\n<i>“Not budging!”</i> she retorts. <i>“" + (!korgiTranslate() ? "Milo tribe breaking last truce with lies and false negotiates. Ula already offer great deal, and only do because [pc.name] vouching for fang-cats. Korg’ii always made bleed for peace. Not this time." : "Your tribe broke the last truce with lies and false negotiations. I already offered you a great deal, and I only did it because [pc.name] vouched for you. Korg’ii Hold has always had to bleed for every peace we’ve ever had. Not this time.") + "”</i> She stamps her paw. <i>“" + (!korgiTranslate() ? "Being happy to keep medicines and any weapons. Elders already thinking Ula having too much mercy." : "Be happy you get to keep anything - especially the guns. The elders already think I’ve treated you too mercifully.") + "”</i>");
	output("\n\nEitan stiffens his back. <i>“The armor won’t even fit the korgonne,”</i> he says.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Don’t care, and point is not being" : "I don’t care, and that’s not the point anyway") + ",”</i> Ula retorts.");
	output("\n\nHe breathes in deep through his nose. He’ll have some explaining to do among the milodan. <i>“Fine,”</i> he eventually grunts through clenched teeth. <i>“I agree to your terms. But... just know that I’m putting a lot of trust in you for this.”</i> Ula says nothing in response. <i>“Anything else?”</i>");
	output("\n\nTapping her paw on the ground, Ula looks away from the mass of milodan muscle and toward you, finding solace in a friendly face while she thinks. Her expression cycles through four or five different emotions before she returns her gaze to the prisoner with a shuddering sigh: <i>“No.”</i>");
	output("\n\nEitan nods, and he lets out a deep breath. He must have been holding it since they started. <i>“We have a deal.”</i>");
 
	addButton(0, "Next", peaceInOurSmuttyKorgTime);
}

public function peaceInOurSmuttyKorgTime():void
{
	clearMenu();
	clearOutput();
	showBust(ulaBustDisplay(), eitanBustDisplay());
	author("B & Fenoxo");
	processTime(24*60);

	output("The next day...");
	output("\n\nYou, Eitan, and the entire chain-gang of milodan are standing outside of the korgonne Hold in the afternoon. Ula and every adult korgonne capable of carrying a weapon are with you. Some part of her still fears that this entire negotiation was nothing more than another front for <i>another</i> sneak attack. Older, wizened korgonne are busy ushering in a stockpile of Pyrite Industries weaponry and technology into the Hold. ");
	output("\n\nThe stockpiles arrived in the morning. Ula’s father himself hand counted the items as they were presented. He was sceptical that they were being sincere with how many weapons they were giving away, but he was honor bound to abide by Ula’s judgements. His opinion did nothing to better Ula’s mood, but she wisely deferred to your expertise in the field.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Discussing of past completed" : "As we discussed") + ",”</i> Ula says to Eitan, flanked on either side by a pair of warrior korgonne. Her words come out stilted, through a stiff mouth; as much as she wanted to milodan out of her mines, and even though she got everything she demanded out of their negotiations, she still can’t stand the sight of Eitan and is eager to have him gone. <i>“" + (!korgiTranslate() ? "All seeminged count true. Maybe milos keep few more guns than agree, but [pc.name] saying it enough, so it enough." : "All the weapons and armor seem accounted for. Maybe you’ve kept a few back from us, but [pc.name] says this is enough, so it’s enough.") + "”</i>");
	output("\n\nEitan says nothing, his head hanging on his neck. He’s still wearing the chain harness, and, like during the negotiations the day before, his wrists have been bound together with their loose threads.");
	output("\n\nUla, noticing his downtrodden expression, relaxes her body and sighs herself – more in exasperation than in stress or sadness. <i>“Eitan,”</i> she says, calling him by his name for the first time, <i>“" + (!korgiTranslate() ? "maybe coming from Ula not mean much, but... being good leader means decisions hard. Harder than stone. Doubt ever able to stand you, but... Ula can respect." : "maybe it doesn’t mean much coming from me, but... being a good leader means making hard decisions. Harder than stone. I doubt I’ll ever be able to stand being around you, but... I can respect you.") + "”</i> She nods slightly, her features the calmest you’ve seen in Eitan’s presence. <i>“" + (!korgiTranslate() ? "Hoping chiefs and chieftesses of future not have these worries." : "I hope the chiefs and chieftesses of the future don’t have to deal with these worries.") + "”</i>");
	output("\n\nEitan lifts his head high enough to meet her gaze. You can tell he’s terribly conflicted about it all – having to shirk the attitudes he’s built up all his life about being alpha, and having to submit to the demands of a korgonne less than half his size – but he knows that he’s making the overall better decision, and the pain of his humiliation will be temporary.");
	output("\n\n<i>“Likewise,”</i> he responds, apparently not in the mood to waste words.");
	output("\n\nUla leans to the guard on her left. You recognize it as one of the two guards maintaining the post at the prison. <i>“" + (!korgiTranslate() ? "Letting go small milos first" : "Release the chain-gang first") + ",”</i> she instructs, and her guard steps forward, the key to their shackles bouncing off his hip. One by one, he undoes the shackles at their ankles; when one is released, the guard instructs them to step away from the gang before he undoes the next. And they repeat this process until they’re all released, their chain lying flaccid in the snow.");
	output("\n\nThe milodan are silent the entire time, unsure of how to react to the scenario. Many of them turn to Eitan, their alpha, for instruction: should they attack? Should they refuse freedom in the name of their pride, since, to them, freedom means having to grovel to their enemies?");
	output("\n\nBut Eitan stands steadfast and unmoving. He gives them no hint or instruction. And each of them are at a total loss for it. The milodan are a warrior race, and submitting, even for the greater health of both themselves and the korgonne in the long run, has them at ends with themselves. So, they do what Eitan is doing: stand silent and stoic.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Milodan walking to far snowbank" : "You will march to the other side of the far snowbank") + ",”</i> Ula instructs to the directionless milodan. <i>“" + (!korgiTranslate() ? "Releasing big milo when smaller milo sight-gone" : "We will release your alpha once you are out of eyesight") + ".”</i>");
	output("\n\nAt first, the milodan don’t move. Ula is not their alpha. <i>“Do as she says,”</i> Eitan says over his shoulder – and, hesitantly, one by one, the milodan turn and march, making their way towards their tribe’s home. Eitan doesn’t turn to see them leave.");
	output("\n\nOnce the last milodan is over the hill and they’re all out of eyesight, the guard approaches Eitan. He drops to his knees to let the guard reach the lock pressed between his shoulder-blades; with a click and the turn of the key, the chain harness is undone, and the harness hangs limply on his body. He could remove it like a shirt. He’s free.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Ula sure big milo can finding own way home" : "I’m sure you can find your own way home") + ", Eitan,”</i> she says. <i>“Good luck.”</i>");
	output("\n\nWith that, she turns and leaves, making her way back into the Hold. Her guards maintain their stance until she’s safe inside, and then they turn to enter the Hold themselves, leaving just you and Eitan in the snow.");

	moveTo("KORGII B14");

	addButton(0, "Next", timeForTheMilosToGoFree);
}

public function timeForTheMilosToGoFree():void
{
	clearMenu();
	clearOutput();
	showEitan();
	author("B");
 
	output("Once Ula and the other korgonne are safely inside the Hold, Eitan turns on the spot to face you. His wrists are still bound by the chains, but they, like the rest of his harness, are loose, and he could easily wriggle them off with a few shakes.");
	output("\n\n<i>“[pc.name] Steele,”</i> he begins. You can see something in his eyes that you never saw before – a type of sincere, earnest clarity that was clouded by the attitudes and aggressions that you had talked him out of. It was as if he had cataracts that blinded him from seeing the korgonne as anything other than an opposing peoples to be subdued and eradicated, and while you doubt he’d ever call them ‘friends,’ you can at least tell that he’s swallowed all that fury, and now, all he wants is to go home.");
	output("\n\nHe, however, doesn’t phrase it as such. In fact, he doesn’t say much of anything at first, at a loss for the words you’d just decided for him to yourself. A moment ticks by awkwardly between you two as he struggles with his next sentence.");
	output("\n\n<i>“The direction... of not just my life,”</i> he stutters, making it up as he goes, <i>“but of all the milodan... would have been... uncertain, if it weren’t for you. In the past, I would have preferred that I were victorious over the korgonne. Failing my attack led to one embarrassment after another, as the alpha of the milodan, but... knowing how it ends, and that no milodan alpha after me will suffer the same embarrassments, I’m not sure I would prefer it any other way. There is more to life than fighting and war, and it’s my own fault for having seen it that way in the first place.”</i>");
	output("\n\nThat’s... wow. That’s a touching, sensitive thing to say, especially for a guy like him.");
	output("\n\n<i>“You are welcome in my tribe, [pc.name] Steele,”</i> he says. <i>“In fact, I would enjoy your company for a visit, if you can. We have more things to... discuss.”</i>");
	output("\n\nYou allow your eyes to fall down Eitan’s body: from his face, to his barrel chest, to his washboard abs hidden beneath that thin undershirt you gave him, to those thin pants with holes that the korgonne gave him to keep him decent. When you eye the bulge in his pants and you see the way his tail swishes when you stare at it, you get a pretty solid idea of what it is he wants to ‘discuss’ with you in his tribe.");
	output("\n\nStill, the ball’s in your court. He’s giving you the option to visit, and hell, it doesn’t have to go any further than words if you don’t want. You tell him that you’ll consider it.");
	output("\n\n<i>“You can find us to the south and east from your offworlder settlement,”</i> he instructs. <i>“Towards the ocean where the Frostwyrm makes its territory. You’ll find that we aren’t very... approachable to strangers, but if you say my name, they’ll know to turn to me first.”</i>");
	output("You tell him you’ll keep it in mind as he lifts the now-loose harness up and over his head, tossing it into the snow at the foot of the Hold’s trap door. He turns and makes for his tribe’s home without another word.");
	output("\n\n<b>Eitan can now be found at his tribe, east of Irestead.</b>");

	IncrementFlag("EITAN_PRISONER_NEGOTIATIONS");

	addButton(0, "Next", mainGameMenu);
}

public function leaveEitansTribe():void
{
	move("UVGR O34");
}

public function miloTribeMenu():void
{
	addButton(0, "Tent", goIntoEitansTent, undefined, "Tent", "The biggest tent in the tribe belongs to Eitan and his family. This is where you’d be if you’re looking for anyone in the alpha’s line.");
	addButton(14, "Leave", leaveEitansTribe);
}

public function eitansTribe():Boolean
{
	clearMenu();
	clearOutput();

	if (flags["BEEN_TO_EITANS_TRIBE"] == undefined)
	{
		showEitan();
		processTime(7);

		output("When you crest one last snow dune, you finally see what can only be the milodan tribe that Eitan invited you to.");
		output("\n\nWhat you see is a number of pitched tents – more than a dozen but less than thirty – in a semi-circle formation, with the ‘mouth’ of the tribe opening towards a beaten path that other milodan come and go from. The tents are made from furs and leathers of Uveto’s native wildlife stitched together, forming tight-knit and sturdy canvases that don’t even flap in the wind. Milodan of all shapes and sizes are milling about, each of them responsible for some job: the youngest ones are grooming the older ones, while the able-bodied ones are either bringing in a fresh kill or are dressing down an earlier one.");
		output("\n\nYou aren’t really sure how to approach the tribe, though. Eitan told you that his name would be enough to get you to him, but... well, how do you approach <i>any</i> milodan? Every single one you met before Eitan was aggressive, and Eitan himself needed to be whittled down over time.");
		output("\n\nBut then you figure, " + (pc.isNice() ? "you have to believe that Eitan was telling the truth, and that the milodan aren’t so immediately bloodthirsty that they’ll take you to their alpha once you say his name. If you didn’t believe Eitan’s word, then why are you here in the first place?" : "fuck it; <i>if</i> any milodan were to start something with you, you damn-near singlehandedly cleared them all out of the korgonne Hold when they attacked, <i>and</i> you’ve subdued their alpha. What’s a sentry going to do to you?"));
		output("\n\nWhen you approach the tribe by cresting the hill and making its way down its broad side, a patch of snow explodes to your side. You freeze in place, and look toward the tribe’s walls - on one of the higher towers stands a milodan with a rifle trained on your position. That was a warning shot. Eitan wasn’t kidding.");
		output("\n\nStill, you don’t move, and you’re soon joined by another milodan warrior, this one wielding a spear made from stone. You say Eitan’s name, and that changes everything. The milodan already in front of you widens his eyes, straightens his back, lifts his spear, and waves his hand behind him to the incoming wave of milodan warriors. They all stop.");
		output("\n\nStill, you aren’t given a warm welcome: instead of trying to gut you, the milodan " + (pc.isNice() ? "grabs you by the arm and yanks you behind him, marching you into the tribe’s perimeter. That’s hardly a way to treat a guest of their alpha, but you figure it might be best to go at their pace rather than try and raise a ruckus." : "tries to grab you by the arm, but you’re not about to stand for that; you whip your arm back and say Eitan’s name again while motioning for the milodan to keep walking. The warrior glares at you, unappreciative of your standoffishness, but doesn’t try again."));
		output("\n\nYou’re led to the largest tent in the tribe by a huge margin, taking up easily more than four times the space as the next-largest tent. The inside is fairly lavish, for an indigenous tribe like the milodan: the snow is covered with something hard and comparatively warm, likely just stones or wood, and they’re covered with plush carpets, some of them clearly not-Uvetan in nature and likely pillaged from an Irestead caravan, while others are made of fur, likely from the hide of some poor native animal. The tent is large enough to be separated into compartments, each room covered in thin, draping materials to give some semblance of privacy, although you can make out what appears to be a bed lying on the floor through some of them.");
		output("\n\nSitting in the center of the tent, his head hanging in his hands, is Eitan. He’s no longer wearing the shoddy pants the korgonne gave him and he’s replaced them with the same signature loincloth that the other warriors wear, although he still has the undershirt you gave him on. At the sound of you and your milodan escort approaching, he lifts his gaze, and his eyes widen in surprise when he sees it’s you.");
		output("\n\n<i>“[pc.name] Steele,”</i> he says, his voice lifting with his body as he stands to greet you. It’s the first time since you really started talking with him that he sounded something better than neutral – in the short time he’s been out of the korgonne prison, his spirits have already lifted.");
		output("\n\nHis eyes go to the milodan warrior you’re with. <i>“Leave us be,”</i> Eitan tells the warrior, <i>“and let the tribe know that this one is welcome.”</i>");
		output("\n\nAt that, your escort leaves without another word to spread the news.");
		output("\n\n<i>“Like I told you, [pc.name] Steele, my people aren’t the most approachable towards strangers,”</i> he laughs. " + (pc.femininity < 60 ? "He places one hand on your shoulder, guiding you in from the cold of the exposed tribe, and motions you to the seat beside his own, inviting you to sit. If nothing else, he’s already a fairly gracious host." : "He extends his hand for you to take, which you do – though his hand is rough, probably from all that time swinging big, heavy pickaxes around, his grip is gentle. He only holds it long enough to lead you to the spot beside where he was sitting, but it’s a gentlemanly gesture all the same."));
		output("\n\n<i>“It’s good to see that you’ve found my tribe without issues, [pc.name] Steele,”</i> he says as he lowers himself to his own sitting position. <i>“I was hoping you would come.”</i>");
		output("\n\nYou tell him that it wouldn’t be very polite to turn down an invitation from the alpha himself. And he’s already been rather accommodating, such as whitelisting your name with just a sentence.");
		output("\n\nHe smiles at you. It’s a genuine, charming, lip-curling, teeth-gleaming smile that disarms you. <i>“You’ll find that I have many more</i> obligations <i>to show you, [pc.name] Steele, as my guest. You need only say the word.”</i>");
		output("\n\nYou glance at his body and the way how it strains the undershirt it’s contained in. You have a pretty clear idea on what sort of <i>amenities</i> someone like him is capable of.");
		output("\n\nYou know, if you want.");

		flags["BEEN_TO_EITANS_TRIBE"] = 1;

		eitanMenu();
	}
	else
	{
		author("B");
		showName("\nEITAN’S TRIBE");
	
		output("You crest the familiar snow done and are greeted once again by the sprawling image of a milodan tribe just a few dozen paces away.");
		output("\n\nWhen you approach, you spot one of the milodan snipers on the tribe’s tower with his rifle trained on you, but once he sees it’s you, he lowers his weapon and resumes his lookout. The guardsman at the tribe’s opening even waves you in. Honestly, the milodan can be cordial when they know to be – they’re just jumpy around strangers, is all.");
		output("\n\nYou make your way to the center of the tribe. The alpha’s tent is in front of you – it’s difficult to miss, being the largest of them all by a long shot – but now that you’re generally accepted as an extended guest of the tribe, you could travel anywhere and speak to anyone, if you wanted.");

		miloTribeMenu();
	}
	return true;
}

public function goIntoEitansTent():void
{
	clearMenu();
	clearOutput();
	showName("\nALPHA’S TENT");
	author("B");
	processTime(1);

	output("You show yourself into the alpha’s tent.");
	output("\n\nIt’s fairly plush and welcoming, at least compared to the exposed air of the tribe’s common ground just out front. The floor is hard and warm, and is covered in all manner of carpets to provide a soft, sturdy experience for your feet (or your rump, if you sat). The tent is so large that it’s split into compartments, and thin, wispy drapes cover them to provide only token privacy – you can see pretty much straight through them.");

	var btnSlot:int = 0;
	if (eitanIsCrew()) output("\n\nUnfortunately, it doesn’t look like anyone is home. Eitan is on your ship, and you aren’t sure where the rest of his family are. The tent gives you some relief from the cold, so you can stay and rest if you want, but there’s otherwise nothing here.");
	else
	{
		output("\n\nSitting in the center of the tent is Eitan, his hands wringing together and his eyes cast downward in thought. When he looks up to see you, his expression lifts, and he beckons you to join him, patting the seat next to him on the floor.");
		addButton(btnSlot++, "Eitan", approachTentEitan, undefined, "Eitan", "Speak with Eitan, the milodan’s current alpha, and the one you’ve helped rehabilitate from the korgonne mining prison.");
	}

	addButton(14, "Leave", function():void
	{
		clearMenu();
		clearOutput();
		author("B");
		showName("\nEITAN’S TRIBE");
		output("As comforting as the alpha’s homestead is compared to the exposed vacancy of the milodan tribe’s common ground, it’s time to leave. You turn your back on the warm, comfortable tent and return to the tribe’s open area.");
		miloTribeMenu();
	});
}

public function approachTentEitan():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(1);

	output("You take Eitan’s invitation and park yourself right beside him.");
	output("\n\n<i>“Welcome again, [pc.name] Steele. It’s good to see you,”</i> he says, patting you on the shoulder warmly and smiling at you. You admit to yourself that it’s nice to get this kind of attention from him – you really get the sense that you’re welcome with him, and that he considers you a friend. <i>“What can I do for you this time?”</i>");

	eitanMenu();
}

public function eitanMenu():void
{
	clearMenu();
	addButton(0, "Appearance", lookAtTheHunkyAlphaMilo);
	addButton(1, "Talk", haveAChattyChatWithTheBigOlCattyCat, undefined, "Talk", "For someone that comes from a society that doesn’t have electricity, Eitan is well-spoken and opinionated. Ask him for one of them on something!");
	addButton(2, "Sex", bangTheAlphaCatto, undefined, "Sex", "You can’t deny that Eitan has an enviable body, and he probably fucks like an engine. It’s time to see if all those talks about putting other’s needs before his own applies to his lovemaking.");
	addButton(3, "Spar", takeEitanForAPracticeRun, undefined, "Spar", "As much as you’ve done to convince him that violence shouldn’t be a first-resort, there’s nothing wrong with a little consensual roughhousing. Maybe it’ll even have a happy ending, depending on how it goes.");
	if (eitanIsCrew()) addButton(4, "Dismiss", eitanPlsGetOutYoureLeavingFurEverywhere, undefined, "Dismiss", (getPlanetName() != "Uveto Station" ? "Eitan may not be on Uveto, but that doesn’t mean you have to be the asshole and just dump him on some strange planet with no way home. At least buy the guy a ticket home!" : ""));
	else addButton(4, "Recruit", (eitanRecruited() ? letEitanBackIntoYourShip : pickUpAMiloForYourShip), undefined, "Recruit", "Eitan would make an excellent bodyguard and general heavy-duty handyman. And he’d probably look like a real piece of work in a uniform...");
	if (eitanIsCrew()) addButton(14, "Leave", crew);
	else addButton(14, "Excuse", leaveEitansTribe);
}

public function haveAChattyChatWithTheBigOlCattyCat():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(1);

	output("What do you want to talk about?");

	eitanTalkMenu();
}

public function eitanTalkMenu(from:String = ""):void
{
	clearMenu();

	if (from == "Uplifting") addDisabledButton(0, "Uplifting");
	else addButton(0, "Uplifting", whatDoesEitanThinkAboutStarMilos, undefined, "Uplifting", "He’s told you a few times now that whenever a milodan is brought from their tribes on Uveto to join the modern societies that walk the stars, that milodan is considered to be ‘uplifted.’ Ask him for more on that.");

	if (from == "Sex") addDisabledButton(1, "Sex Pref");
	else addButton(1, "Sex Pref", whatGetsEitanOffAnyways, undefined, "Sexual Preferences", "Eitan likes to brag that he fucks a lot, and him being the alpha of the tribe, it’s easy to see why he might be so popular. Ask him what his ideal partner is like, if any.");

	addButton(14, "Back", (eitanIsCrew() ? eitanMenu : eitanMenu)); // 9999
}

public function whatDoesEitanThinkAboutStarMilos():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(8+rand(4));

	output("A few times now, Eitan’s mentioned that whenever a milodan is taken from their tribe and introduced into modern society, he’s described that milodan as ‘uplifted.’ It was also one of his driving reasons for launching his attack on the korgonne: because Pyrite Industries had offered to uplift him. You ask him what that means, exactly, from the milodan’s point of view.");
	output("\n\nEitan hums and slumps in his seat at the question. <i>“Maybe you haven’t noticed, [pc.name] Steele, but my tribe’s lifestyle doesn’t involve things like modern medicine or electricity,”</i> he starts. <i>“All my people from my generation and younger know that being uplifted would mean an end to the general hardships we have to face, but it’s tougher to convince the wisemen and the elders that life could be better if we accepted help.”</i>");
	output("\n\nHe rubs at his chin as he recalls something, and from the grin on his face, he considers it a fond memory. <i>“I remember when Pyrite first approached me and showed me the miracles a more advanced society than my own is capable of,”</i> he says. <i>“Weapons that could fell a Frostwyrm, or clear out whole rooms of korgonne. Medicines that could cure any illness or heal any wound. The one I was with, he demonstrated by cutting his palm open – with a little spray of something from a metal can, the wound was healed without a scar.”</i>");
	output("\n\nEitan’s eyes light up, and he leans into you as he continues. <i>“Never having to worry about hunting for food, much less running out of it. Being able to control the heat of the air around you, so you’re never cold again. Speaking with someone else from some distant tribe in a matter of moments. It all seemed so... fantastic.”</i>");
	output("\n\nYou admit that there are a lot of conveniences and pleasantries that you’ve learned to take for granted nowadays. Even something as mundane as being able to talk over such a large distance could be seen as magic to someone as out-of-the-loop as Eitan. But clearly, and like he said, the people in charge of the milodan tribes aren’t as keen as taking in help.");
	output("\n\nAt that, Eitan sighs and slumps in his spot again. <i>“I know what I’d like to say,”</i> he starts. <i>“I’d</i> like <i>to say that the elders are just stuck in their ways, and that we, the milodan, can’t survive forever by ourselves. There are fewer Frostwyrms now then there ever were before, and I’m worried that whatever took them out will happen to us as well. What we have now is what we’ve had for generations, and if it’s worked for them, they think it’ll work for us.”</i>");
	output("\n\n<i>“But,”</i> he sighs, <i>“I accepted Pyrite’s help, and look where it got me.”</i>");
	output("\n\nYou ask if that’s his fault for disobeying the wishes of his elders and trying to do what’s best for him and his tribe, or if it’s Pyrite Industry’s fault for taking advantage of a difficult situation his tribe is in, and trying to capitalize on that by instigating conflict.");
	output("\n\n<i>“Whether the blame is with Pyrite is beside the point, [pc.name] Steele,”</i> he responds. <i>“I took a chance with them, and I failed. I did more harm to my tribe and to myself than if I had done what the elders wanted from me and did nothing.”</i>");

	// Eitan is a crewmate
	if (eitanRecruited())
	{
		output("\n\nYou ask if, after having spent his time with you so far, he’s put some thought into expressing his experiences at being ‘uplifted’ himself. Surely his tribe’s elders aren’t so stubborn that they’d turn a deaf ear to him now that he’s been a part of modern society himself.");
		output("\n\nEitan laughs darkly at the question, his lips curling into a sarcastic smile. <i>“Remember that we’re milodan, [pc.name] Steele,”</i> he answers. <i>“My stubbornness is what got me, and what kept me, in that prison in the first place. Imagine me, but a generation older, and set even harder in my ways.”</i>");
		output("\n\nSo, what, he’s just given up? He’s taking all the benefits of being uplifted for himself, without trying to bring it to his tribe?");
		output("\n\n<i>“I said that I’m stubborn, [pc.name] Steele,”</i> he repeats, smiling a more genuine smile than before. <i>“I haven’t given up yet. I doubt I’ll ever get my whole tribe uplifted like I am, thanks to you, but maybe there’s some way to bring the ‘uplifting’ to them. If I can find some more of that spray from the metal cans that can heal wounds without leaving scars, not even</i> they <i>would be thick enough to turn medicine like that away.”</i>");
		output("\n\nFrom the sounds of things, Eitan has hope, and he has an idea. You wonder to yourself if there’s any way you’ll be able to help him out in the future.");
	}
	// Eitan is not a crewmate
	else
	{
		output("\n\nSo, then, is his dream to be ‘uplifted’ dead in the water, just like that? Being ‘uplifted’ means having a better life. Is his want for himself and his people to live better extinguished with one failure?");
		output("\n\n<i>“Not to me,”</i> he answers, <i>“but it does to the elders of the tribe. Being the alpha only gets me so far. One failure is enough to convince them that I haven’t had a smart idea rattling anywhere in my skull. I doubt that even the Akkadi themselves could convince them to start moving forward now.”</i>");
		output("\n\nIt sounds like he’s resigned to the fact that he won’t be able to convince the higher-ups in his hierarchy that having modern conveniences would be a better thing for his people. You don’t want to entertain the thought of a future where Eitan succeeded and annexed the Hold after slaughtering the korgonne, but it’s difficult to think that his own people wouldn’t be better off if he had – provided Pyrite Industries kept to their promises.");
		output("\n\nYou ask if it’s still out of the question that he ‘uplift’ himself. Maybe he can’t do his whole race, or even his whole tribe, all at once, but if he can start with himself, it’d be putting one foot in front of the other.");
		output("\n\n<i>“I’m sure the elders, except my parents, would be happy to see me gone, at the least,”</i> he tells you.");
		output("\n\nSomething to think about.");
	}

	eitanTalkMenu("Uplifting");
}

public function whatGetsEitanOffAnyways():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(8+rand(4));

	output("You aren’t particularly well-versed in milodan culture, so you don’t know if this is overstepping some boundaries or something, but you tell Eitan that you’d like to ask him about his sex life, if that’s okay with him.");
	output("\n\n<i>“Of course it’s okay with me,”</i> he responds, taken aback by the insinuation. <i>“Why wouldn’t it be?”</i>");
	output("\n\nIn some parts of your own culture, people aren’t so forward with their sex lives or adventures, and some people prefer to keep it personal. You take it, from his response, that the milodan don’t exactly think the same way.");
	output("\n\n<i>“[pc.name] Steele, my people walk around the tribe wearing nothing but a piece of cloth around their waist. The most fertile of our women are made into priestesses, and the most endowed are made into temptresses as a style of combat. To say that the milodan aren’t shy about our sexual activities would be an understatement.”</i>");
	output("\n\nYou suppose that makes sense, given the circumstances surrounding the milodan and their way of life. But still, even with them being as open with their sexuality as they are, surely Eitan must have some... preferences about his ideal partner, right?");
	output("\n\nAt that, Eitan hesitates and cocks his head to one side. <i>“I’m not sure I understand the question.”</i>");
	output("\n\nYou make it simple: does he prefer to have sex with women, or with men?");
	output("\n\n<i>“It makes no difference to me,”</i> he answers with a shrug. <i>“A hole is–”</i> Again, he hesitates. <i>“No, that’s how I thought</i> before. <i>I should try and give my sexual partners more respect than just calling them holes for me to fill. But, all the same, when I’m in the middle of a rut and I’m with someone, I find it doesn’t really matter what they look like at the time.”</i>");
	output("\n\nEitan hums before you can think of another question to ask him. <i>“Although, I will say,”</i> he continues, <i>“I find that male partners are more... eager to take me where a woman usually wouldn’t,”</i> he laughs, <i>“and I find a vagina easier and more rewarding to please with my mouth. And more delicious.”</i>");
	output("\n\nYou wouldn’t have thought that Eitan would be the type to go down on a lot of partners. He strikes you as more the type to have people go down on him.");
	output("\n\n<i>“I often have more than one partner at once, [pc.name] Steele.”</i> He speaks with total earnestness – he isn’t trying to brag, despite how a sentence like that would make anyone green with envy. <i>“It’s no secret that the alpha of the tribe is among the most desirable sexual partners. My children are guaranteed to be strong. But that also means that the women of the tribe need to learn to share – and it’s not always with other women.”</i>");
	output("\n\nYou note that he says that awfully clinically. Why, in his opinion, would a male of his tribe want to mate with him, if they can’t have his children?");
	output("\n\n<i>“For any reason they want,”</i> he responds. <i>“I don’t question it. If someone approaches me and asks to mate, I’m not about to turn them down.”</i>");
	output("\n\nOn the one hand, it’s difficult to not be a little envious of Eitan’s attention: to be surrounded by an entire tribe of men and women that wants his sexual attention at all times, and they all know how, and are all willing, to share. But, on the other, he must find that exhausting.");
	output("\n\nEitan laughs again at the question. <i>“You don’t get a form like this,”</i> he says, pounding his fist against his chest, <i>“by getting a little winded from mating, [pc.name] Steele.”</i>");
	output("\n\nGiven that there’s only one alpha in the tribe, you ask him what his family thinks about him constantly fucking all the time. Surely it must be difficult for them to put up with, too.");
	output("\n\n<i>“Now</i> that <i>is a difficult question to answer,”</i> he says, pointing a finger at you. <i>“I have two sisters, and my mother was the alpha of the tribe before me. Like I said, the alpha of the tribe is one of the most sexually desirable partners, and that doesn’t exclude family. An alpha mating with his or her siblings is... discouraged, but it’s not exactly forbidden.”</i>");
	output("\n\nYou wave your hands and tell Eitan to stop for a moment. Milodan culture <i>doesn’t</i> forbid incest? They only ‘discourage’ it?");
	output("\n\n<i>“That’s right,”</i> he answers. <i>“You’d think the offspring of an alpha mating with each other would produce a stronger alpha than any generation before it, but that’s... not always the case. Which is why it’s discouraged. But, when you’re in a heat, or a rut, and you’re living with the most desirable mate in the tribe... sometimes, you can’t help yourself.”</i>");
	output("\n\nWell, that’s... information that you have now.");
	output("\n\nBut still, you have to ask Eitan one last question, and you steel yourself for the answer. He mentioned that he has two sisters. Has he ever... had sex with either?");
	output("\n\n<i>“No,”</i> he responds simply.");
	if (pc.isMisch())
	{
		output("\n\nYou, getting some courage at that brisk answer, ask if the thought’s ever crossed his mind.");
		output("\n\n<i>“Maybe once or twice,”</i> he admits slyly.");
	}
	output("\n\nOkay, that’s enough questioning for you.");

	eitanTalkMenu("Sex");
}

public function bangTheAlphaCatto():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(1+rand(3));

	// Play this if the PC hasn’t had sex with Eitan
	if (hasSexedEitan(false))
	{
		output("You relax in your seat, allowing your eyes to roam over Eitan’s body. At his square, sturdy shoulders; at his strong, flexible fingers; at his thick, muscular thighs, capable of fucking you into a crater–");
		output("\n\nEitan smiles and spreads his legs, giving you a direct line of sight to his bulge. You and he are comfortable enough with your relationship that you help yourself to a great, big helping of the eye-candy he’s giving you.");
		output("\n\n<i>“Would you like some more, [pc.name] Steele?”</i> he asks, his thumb hooking into the waistband of his " + (eitanIsCrew() ? "pants." : "loincloth."));
		output("\n\nHe knows you so well, now.");
	}
	// Play here if the PC has had sex with Eitan
	else
	{
		output("You keep stealing glances at Eitan’s tight, toned, muscular body. He’s the alpha male of the milodan, and by the Gods, does he have the form to match a title like that: even at total rest like he is, every muscle, every contour, is vying to steal your attention and ogle some different part of his body. From those tight pecs, holding a pair of lungs that could fuel a body for hours of hard stamina training; to his bulging biceps, capable of lifting a partner up, or pinning a partner down; to those thighs, hiding a bulge that, completely soft, is still the size of your fist–");
		output("\n\nYour unabashed ‘appreciation’ of his body doesn’t go unnoticed. You realize that you and he have been sitting in total silence for about a minute or two, and he’s been shifting and moving the entire time, watching your eyes come to a stop on some different part of him.");
		output("\n\nEitan reaches toward you, his fingers flexed, ready to grab onto some part of you – but he stops suddenly, flinching at his own hand. <i>“Er,”</i> he stutters, awkwardly putting his hand back down. <i>“Sorry.”</i>");
		output("\n\nYou ask him what on Terra he has to apologize for.");
		output("\n\n<i>“Let’s be clear, [pc.name] Steele: I recognize that look. It’s no secret what it is you want.”</i>");
		output("\n\nYou laugh and turn your eyes to scan something far less interesting in the tent. You didn’t thing you were being subtle, but you were trying not to be obvious.");
		output("\n\n<i>“I know that I’m desirable. I wouldn’t be much of an alpha if I weren’t. My children will be very strong and healthy.”</i> He hooks a thumb into the waistband of his " + (eitanIsCrew() ?" pants" : "loincloth") + " and gives it a flick, smiling when the motion attracts your eyes to it. <i>“Before my attack on Korg’ii Hold, if anyone gave me a look like that, I would take them. And if I fancied any partner among the milodan, I would take them. There wouldn’t be words; as alpha, it’s my right to any partner I desire.”</i>");
		output("\n\nYou shift your [pc.hips] to one side. The idea of being <i>taken</i> by someone as studly as him is... it’s a hot idea, now that you’re looking at him.");
		output("\n\n<i>“But you’ve taught me that I shouldn’t use my status as alpha so selfishly. The wants of my partner meant nothing to me; all they were to me was a warm body, and their satisfaction wasn’t my concern.”</i> He places his hand on his knee, leaning onto it as he speaks to you. <i>“I have to make a lot of changes to my lifestyle if I’m to be a better alpha for my people, and... well, I don’t intend to stop mating,”</i> he laughs, slapping his knee, <i>“but my lovemaking lifestyle is going to have to change with the rest of them. And who better to start with than you?”</i>");
		output("\n\nYou straighten your back in surprise, that he’d proposition you so suddenly like that. He sees your body language and straightens his own, worried that he had done something wrong. <i>“Sorry, let me rephrase,”</i> he says, extending his hand to you. <i>“I think we both know the answer to this question, [pc.name] Steele, but... would you like to mate?”</i>");
		output("\n\nYou look his body over again and imagine it. Being underneath him, feeling the <i>weight</i> and the <i>power</i> of all that muscle <i>boring</i> into you. The grip of his hands on your body, <i>squeezing</i> you. Your hands running through his fur, feeling every <i>rippling</i> muscle as he pants in exertion, thrusting himself <i>into</i> you again and <i>again.</i>");
		if (pc.hasCock()) output(" And then you flipping him over and returning the favor: the feel of his own body <i>clenching</i> onto you, taking you into himself.");
		output(" And doing it all for <i>hours...</i>");
		output("\n\nIt doesn’t take much to convince yourself.");
		if (silly) output(" You wouldn’t have clicked the button if you weren’t already sure!");
	}
	output("\n\n<i>“Yes,”</i> you reply, and before you can get another word out of your mouth, Eitan’s hand lunges at you like a viper striking at its prey. He grabs you by the wrist and stands, dragging you with him, and once you’re both up, " + (pc.tallness < 5*12+6 ? "he lowers his shoulder to your [pc.belly] and hooks his arm around your [pc.legs]. With a heft, you’re over his shoulder, helplessly taken by him and his bigger body." : "he lowers his shoulder to your [pc.legs] and locks her arm behind them. With a shove with his body, you tip over, and he catches you with his other shoulder – and he stands, lifting your body across his shoulders, your [pc.belly] against the back of his head."));
	output("\n\nYou’re totally at his mercy as he makes his way to " + (eitanIsCrew() ? "his bed – barely large enough for him alone, so you two are going to have to stack up, one on top of the other" : "one of the partitioned ‘rooms’ of the tent, blocked by a lacy sheet that does nothing to provide you two any privacy") + ". Once there, he flops you down like a doll, crashing you onto " + (eitanIsCrew() ? "his mattress" : "a stack of thick, billowing sheets and blankets") + " with enough force to make you bounce half a foot back up.");
	output("\n\n" + (eitanIsCrew() ? "He fumbles a bit with his pants, trying to get them undone – he’s still not used to the concept of a ‘button’ or a ‘zipper,’ but he knows not to damage his uniform. He gets it done, and they open and expose his lower half" : "His claws slip across the strap of his loincloth, and they snap, the flimsy fabric falling to his feet") + ", leaving him totally bare from the waist down. And with a yank on his " + (eitanIsCrew() ? "top half" : "shirt") + ", it comes flying off the top of his head, leaving him, and his muscled, Adonis-like body, totally naked for you to enjoy.");
	if (!(pc.isAssExposed() && pc.isChestExposed() && pc.isCrotchExposed())) output("\n\nYou take the time to get yourself undressed as he hurriedly works to get himself naked. After all this build-up, you wouldn’t want to keep either of you waiting any longer than you need. It’s quick work to remove your [pc.covers] and get yourself as nude as he is.");
	output("\n\nEitan crashes down on top of you, his palms slapping down on either side of your head. He growls, and you can feel the heat of his breath wash over your face; his body clenches, and you can see every strand of fur on his body slowly stand on end on top of his flexing muscles. Your eyes are drawn lower, to his package: only half hard and it’s already thick as a wrist, with less than half of his dick still tucked into his receding sheath. Its tip drags its way up your crotch,");
	if (pc.hasCock()) output(" tracing along the underside of your own [pc.cock], leaving a slimy trail of pre along your length");
	else if (pc.hasVagina()) output(" its spaded tip poking and prodding at your [pc.clit] for a moment, dribbling some of its pre onto your buzzer");
	else output(" poking at your bare [pc.skinFurScales], leaving a trail of pre along where it goes");
	output(" as it gets harder and harder, right before your eyes.");
	output("\n\nEitan grunts and thrusts his hips at you, making his delectable cock bounce and jostle with the motion, flinging more of his fluids up your stomach. He’s getting impatient. It’s a testament to how well you’ve ‘trained’ him that he isn’t immediately fucking you into the floor and is awaiting your input.");
	output("\n\nAnd that input is–");

	eitanSexMenu();
}

public function eitanSexMenu():void
{
	clearMenu();

	var eitan:Creature = getEitan();

	addButton(0, "Get Fucked", vaginaRouter, [tellEmTheAlphasGonnaFuckYouDown, eitan.cockVolume(0), 1, 0], "Get Fucked", "You’re too horny for games or foreplay. He’s got a big dick, and you have a hole that needs filling.");
	addButton(1, "Suck Him", lickingMiloPolesFromTheUvetanSnow, undefined, "Suck Him", "It’d be a mouthful, but you <i>need</i> to know if that alpha milodan cock of his tastes as good as it looks!");
	addButton(2, "Ride Him", vaginaRouter, [getOnTopOfEitansCock, eitan.cockVolume(0), 1, 0], "Ride Him", (pc.hasCock() ? "Roll Eitan over and assert yourself as the top for once. Keep in mind, he’ll still be the one penetrating you." : "Getting fucked by a real stud like Eitan is great and all, but sometimes you just want to be the one doing the riding, you know?"));
	
	if (!pc.hasGenitals()) addDisabledButton(3, "Oral", "Oral", "It’ll be awfully difficult for him to do this if you have nothing for him to do it with!");
	else if (pc.hasVagina()) addButton(3, "Get Eaten", vaginaRouter, [puttingEitansCatTongueToWork, 0, 0, 0], "Get Eaten", (pc.hasCock() ? "If you asked, Eitan would probably be more than eager to eat your box – but a real lady-killer like him might not be so enthusiastic about sucking your dick. You’ll win some, you’ll lose some!" : "Eitan fancies himself to be a real man’s man. If that’s true, then everyone knows that a real man isn’t afraid to go down on their partner."));
	else addButton(3, "Get Sucked", penisRouter, [puttingEitansCatTongueToWork, pc.biggestCockVolume() + 1, false], "Get Sucked", "Eitan fancies himself to be a real man’s man. If that’s true, then everyone knows that a real man isn’t afraid to go down on their partner.");
}

public function tellEmTheAlphasGonnaFuckYouDown(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showEitan(true);
	processTime(20+rand(31));

	var eitan:Creature = getEitan();

	output("Both of your hands quest down between you, both of them on his body as they travel southward. Your fingertips dig into the fur on his chest, feeling how tight the muscles underneath that thick, bushy milodan fur of his are, before going on and feeling the ridge of each and every pronounced ab on his six-pack bulging through his belly fur. He clenches at your touch, thickening the muscles against your fingers, making you pause, which makes him chuckle once.");
	output("\n\nYour left hand gets impatient and dips further down, faster, seeking out his pitch-black rod, its pointed head poking at your pelvis. They gently coil around his thick shaft – you can feel his heart through the thick skin of his cock, bloating it with every pump, making the prongs and ridges on the underside of the head bloat against your touch with every beat. He hisses inwardly at your touch and pumps his hips forward, fucking his cock into your grip, splitting the gap in your hand open wider and gliding your grip down the length of his shaft. His fist-sized fuzzy balls");
	if (pc.balls > 0) output(" press into yours, rubbing right up against them");
	else if (pc.hasVagina()) output(" press against your [pc.vagina " + vagIdx +"], the fur on his nuts tickling your vulva");
	else output(" glide against the blank slate that is your crotch");
	output(" with his hump. Inches pour from his sheath, making you wonder just how much more he has hidden in there.");
	output("\n\nYour right hand is a bit more reserved, drinking in his body with every touch and tickle against his ironclad, muscled body. They count, and double-check, each of his abs, before going lower to massage at his waist, where his stomach becomes his groin. You can feel the heat of his cock radiate against the back of your hand, guiding you towards its warmth; before long, you’re leaning your shoulder deeper between you two, until your fingers grace the base of his cock, where it connects with his body, and your knuckles bump against that thick, inflating knot down there.");
	output("\n\nIt’s not the sex that you had fantasized about just moments ago, but there’s something <i>undeniable</i> about the way Eitan’s body bears down on you, surrounding you on all sides, while he fucks your hand loosely. You have a front-row seat to everything: the way his chest inflates with his breathing and the way his dick bloats with every passing second, until it reaches its full size: a foot and some change, with a girth that could make a Slyveren think twice.");
	output("\n\nYou can’t help but gasp to yourself at the sight and the feel of it. Eitan’s body was <i>made</i> to fuck: everything from his powerful body to his weaponized cock makes you shiver in lust. " + (vagIdx < 0 ? "Your [pc.asshole]’s clenched in both anxiety and impatience with every fantasy of taking that log of a cock into it, and while no person in the universe wouldn’t find him intimidating... you’re more excited to find out not if you can, since that’s not the question, but how much you’ll enjoy it." : "Your [pc.vagina " + vagIdx +"]’s been dripping down your [pc.thighs] ever since he hoisted you over his shoulder, and the heat of his body is ten times more intense against your own sensitive folds. Your body’s programming is demanding that you take Eitan and his seed, and you’ve run out of reasons to disagree long ago."));
	output("\n\nSomething comes over Eitan, and he suddenly doesn’t have the patience for your marvelling. His own hand reaches back and grabs you by the [pc.thigh], hoisting your [pc.legOrLegs] up and wrapping " + (pc.hasLegs() ? "them" : "it") + " around his waist. You get the picture and you " + (pc.hasLegs() ? "lock them behind his back at the ankles" : "squeeze tight") + ", keeping you in place; " + (vagIdx < 0 ? "you have to shift yourself a little higher and curl your body a little further to align the tip of his cock with your [pc.asshole], but when you feel the tip of his point tickle at your entrance, you know you’re lined up properly." : "in this position, your [pc.vagina " + vagIdx +"] tickles at the very tip of his cock, his point spearing just <i>barely</i> in between your folds.") + " All it’ll take is one thrust...");
	output("\n\nOnce Eitan feels your pliable body press against the tip of his cock, he lets his repressed instincts and habits take over: his hips thrust forward, and your [pc.vagOrAss " + vagIdx +"] has no choice but to accommodate him. " + ((vagIdx < 0 ? pc.ass.looseness() : pc.looseness(vagIdx)) < 5 ? "Your body clenches and tightens at the intrusion; you thought you were ready to take someone as huge as him, but his cock, like the rest of him, is thick and solid as could be. The breath leaves your lungs in surprise, and Eitan grunts in ascension – he likes his bottoms nice and tight." : "He’s big, you won’t deny, but you’ve handle plenty of big boys in your time, and your experienced body is receptive to the challenge. You hiss in pleasure as he inserts himself into you, and Eitan grunts in acknowledgement – you might not be the tightest hole in the milodan tribe, but there’s something to say for a [pc.manWoman] with <i>experience</i> to make up for it."));
	if (vagIdx < 0) pc.buttChange(eitan.cockVolume(0));
	else pc.cuntChange(vagIdx, eitan.cockVolume(0));
	output("\n\nOne of Eitan’s powerful hands grips you by the [pc.ass], his claws raking into your [pc.skinFurScales]; his grip is strong and his claws are sharp, the motions together making it just a bit too uncomfortable. You think to try and guide him, to get him to ease up, but just as quickly as he thrust in, he slides out – and then <i>fucks</i> his big, thick cock deeper into you, splitting you wider. You can feel every little nub and prong along the head of his cock tickle at muscles inside you that no other cock was designed to reach, and suddenly, you don’t much care that he’s a little ‘handier’ than you’d like.");
	output("\n\nMore than just the cock splitting you apart like a fist through a peach, you’re treated to a one-man musical that is Eitan’s clockwork-like body flexing to fuck you. You see every muscle along his arms and shoulders tighten to maintain their grips and stability; his abdominals flex every time he thrusts forward, burying another inch into you; his jaw tightens and frowns, the breath leaving him in throaty exhales with every clap of his body against yours. You wrap your arm around his, laying your hand on his shoulder, and it’s like gripping a fuzzy stone column.");
	output("\n\nYou feel less like a participant in the lovemaking and more like a passenger. Eitan’s only ever known to fuck one way: with him as the dominant party. His grip on your ass stings a bit – you wouldn’t be surprised if he bruises you by the end of this – and you can feel your body ceding more of itself to make room for his cock with every thrust. In the heat of the moment, he’s less of a man and more of a beast – or maybe, more like a machine, designed to fuck, and you are the battery that runs it. Milodan are responsive to shows of assertiveness; maybe you’ll have to flex a bit yourself if you want to be the top, next time.");
	output("\n\nEitan’s huge, furry balls clap against the underside of your [pc.ass] and you can feel his bloated milodan knot battering against your poor [pc.vagOrAss " + vagIdx +"]. Your other hand reaches up, flatly palming against his chest, and you feel his heartbeat through the sheer muscle and fur of his torso. Despite the fact that his knot is only a few powerful humps away from tying you to him, you doubt he’s close. Or, if he is, you doubt he’ll be satisfied with only one.");
	output("\n\nIt’s all you can do to keep from shouting out as he pushes forward more and more insistently. You can feel your body split as his knot crams itself into your abused hole, and it’s already over a foot of prime milodan breeding cock inside you, fucking you senseless. You can feel every ridge, every vein, of his throbbing, fat member grind against your sensitive rim; a spurt of his pre feels like a lesser man’s load inside you. The bruising from his hand on your butt is going to go well with the ones his weighty nuts are leaving on you with every inward slap.");
	output("\n\nOne last thrust, and Eitan grunts and hisses, pushing forward with all the might his hips can manage to squeeze that apple-sized knot inside you – although, from your vantage point, it might as well be a whole melon getting shoved into your [pc.vagOrAss " + vagIdx +"]. Your body can’t resist the unstoppable force that is a horny Eitan trying to knot his partner, and after a few brutal seconds, he slides forward, his knot secured deep inside you.");
	output("\n\nYou’ve rarely felt as full as you are right now: over a foot of milodan meat, with a ball of fucking flesh bloating your body and preventing anything else from getting in or out. You dare to look down between your bodies, and you see the bulge of his cock outlined in your own [pc.belly]: you can see how deeply the head of his cock reaches into you, and you can see the fat bulge of your [pc.skinFurScales] around his inflamed knot. " + (vagIdx < 0 ? "Any deeper, and he’ll be damn-near poking into your stomach. It’s a wonder that your body’s been able to contain such a monster already." : "It’s a wonder he managed to cram so much of himself into you: you thought for sure you would have run out of room, but you must have just halves of inches left to spare."));
	output("\n\nFully knotted inside you, Eitan doesn’t have much room to fuck you as hard as he has been, but that doesn’t stop him from trying. He grunts and lowers his shoulders, burying your face in the crook of his neck, using the new angle as stability to powerfuck you as hard as the inch-or-so between his knot and his pelvis will allow. You can feel every throb and every push of his cock reaching new distances and expanding to strain new muscles and touch new nerves inside you. You think you’ve lost the strength in your [pc.legOrLegs] to keep " + (pc.hasLegs() ? "them" : "it") + " locked behind his waist, and it’s the stiffness keeping you steady at this point.");
	output("\n\nWith one last thrust, Eitan sighs and his body seems to compress onto you: the grip on your asscheck pushes and tightens; his other arm curls in, wrapping around your shoulders; and his back arches outwardly a bit, coiling his body inward, trapping you in a hot prison of studly cat-muscle. And then, he cums.");
	output("\n\nHis balls clench up against you, dragging their fur across the broad of your ass, and you can feel every surging pump of his milodan cum driving up through his thick, meaty cock and into your body. It takes you a moment to register just how expansive the first load is: you can feel his cum building up inside you, trapped by your body and his knot, filling all those little spots that his behemoth of a cock couldn’t reach. By the second load, your body feels tight and hot, strained by the absolute totality of his output. Your first thought was that he’s just pent up, and this is the load he’s been saving for a while – but what if it isn’t? What if Eitan cums this much regularly?");
	output("\n\nWhile it may not be the answer you’re looking for, Eitan, running on a sexual energy you’ve rarely seen displayed, slams his free hand onto the cushion next to your hand and sits up, his cock still lodged deep inside your [pc.vagOrAss " + vagIdx +"]. And he starts again, fucking you the inch his knot will let him, except now he’s pushing not just against your body, but against the building flood of alpha milodan cum inside your body, making it slosh and shake inside you like a snow-globe.");
	output("\n\nYour body submits to the pleasure of being Eitan’s hot water bottle, and you have your first orgasm before he has his second: your " + (vagIdx < 0 ? "[pc.asshole]" : "[pc.vagina " + vagIdx + "]") + " clenches, and a thunderbolt of pleasure rips through you, from your " + (vagIdx < 0 ? "sphincter" : "cooch") + " to your scalp. It’s not just one orgasm, either: it’s so many, so quickly, that you couldn’t hope to count them with a clearer head than yours. You’d clench tighter onto Eitan if he didn’t already have you so full that you’re stretched to the limit around him. Your [pc.legOrLegs] " + (pc.hasLegs() ? "shake" : "shakes") + " in the pleasure, quivering against Eitan’s tight body, and your vision grows blurry and crossed; you have to bite into your lower lip to keep from screaming something in pleasure – or from blacking out.");
	if (pc.hasCock())
	{
		output("\n\nAnd <i>then,</i> your [pc.cock] follows suit, stiff as iron and red with the blood keeping it stiff. With your body arched as it is, your cock is pointed like a weapon back at your chest, and your [pc.cum] rockets from you, painting yourself [pc.cumColor] from your stomach to");
		if (pc.cumQ() < 250) output(" your chest");
		else output(" your face" + (pc.cumQ() < 3000 ? "." : ", and then as far as the wall behind you."));
		output(" With every push of Eitan’s cock into your body, he milks your prostate for more of your own jizz to cover you, and even when you don’t have anything left to shoot, the constant hammering of his body into yours ekes out orgasm after dry orgasm.");
	}
	output("\n\nHis second round is much faster than his first, owing both to your own pleasure setting off his fuse, and to the fact that he’s probably sensitive so soon after his first round. This time, when it happens, his body stiffens upright: both of his hands find your waist, gripping your handles as hard as his hand on your ass (which, in the heat of the moment, you hardly notice), and he thrusts forward once more, stuffing at much of himself as he can into you.");
	output("\n\nYou keep your eyes on the connection between you two: the way his stomach stays taught, every abdominal clearly visible through his on-end fur, but more on your own [pc.belly]. You feel the flood of yet more hyper-dominant alpha milodan jizz stuff into your " + (vagIdx < 0 ? "voracious asshole" : "thirsty little box") + ", and your stomach fills and expands with his virile loads, the [pc.skinFurScales] straining to contain <i>all that cum.</i> Before your very eyes, you see your " + (vagIdx < 0 ? "stomach" : "womb") + " bloat and expand, making you look like you’ve eaten a whole holiday spread by yourself, and with every clench of Eitan’s balls and with every throb of his cock inside you, the pudge gets just a little bit bigger.");
	output("\n\nIt gets tight – tight enough to make you feel a little unwell – but, thankfully, Eitan’s knot yields before your body does, and high-pressure streaks of pearly milodan jizz shoot from the creases between his overachieving cock and your poor, stretched [pc.vagOrAss " + vagIdx +"]. The spray back out against him, soaking into his belly fur, and every thrust and every wet pump after just renews the pressure of the sprays.");
	output("\n\nThe relief of your body deflating from having such an overbearing load inside it is enough to make you cum yet again – which spurs Eitan forward once more, rutting his hips against you like he wants a third go, but at a more casual, leisurely pace.");
	output("\n\nUnfortunately, you don’t have the energy, or the capacity, to stay awake to see it through, and you pass out from the sensory overload.");

	// end scene (scene: Get Fucked); decrease Lust to 0; decrease HP by 5 (but do not let it fall to 0); go to (scene: Aftercare)
	pc.orgasm();
	pc.HP(Math.max(-5, 1 - pc.HP()));
	if (vagIdx < 0) pc.loadInAss(eitan);
	else pc.loadInCunt(eitan, vagIdx);
	eitan.orgasm();

	addButton(0, "Next", eitanCuddlesYouBecauseYouPassedOut, {id:0, vagIdx:vagIdx});
}

public function lickingMiloPolesFromTheUvetanSnow():void
{
	clearMenu();
	clearOutput();
	showEitan(true);
	processTime(15+rand(26));

	var jerky:int = rand(pc.cocks.length);
	var jilly:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);

	output("You’re transfixed by his cock: the way that its girth beats in time with his heart, and the way it keeps pouring from his sheath. You bring both hands down between you two and you cusp it, feeling it fill your hand and the space between you more and more. Every drop of his pre against your body sears against your [pc.skinFurScales], and every jerk of your fingers on his sensitive shaft makes it just a bit bigger and just a bit fatter. His sheath bloats and expands as his knot struggles to break free from the spongy flesh, and when it does, Eitan takes a long, pleasured sigh, his body shivering on top of yours.");
	output("\n\nThe sex moves at a more casual pace than his earlier manhandling implied it would: you take your time beneath his body, enjoying the feel of his cock in your hands and the way his huge, muscled body rolls against itself with every little motion of his hips or the breathing in his lungs. The musk of his cock as it extends toward you wafts in with the heat of your bodies building between you two – he smells every bit the man his muscles would have you believe he is, and frankly, it’s a sexy smell. You instinctively want more of it.");
	output("\n\nEitan lets you do as you like underneath him for the moment. He enjoys the way you’re doting over his form: he notices the way your eyes keep going from his chiselled upper body, to his stomach, to his bloated milodan dick, and back; and he notices the way your nostrils flare when you catch a whiff of his musk; and he notices when you palm the tip of his prick to catch a bead of his pre so you can smear it along his shaft, making your handjob slick.");
	output("\n\nBut even still, he’s on top, and the sex is going to move at the pace he dictates.");
	output("\n\n<i>“I’ll need more than a pair of hands, [pc.name] Steele,”</i> he says, his voice coming out as a low growl – it almost sounds menacing, although that may just be the positions you two are in and you being totally exposed and naked beneath him. <i>“If you’re so enamored with me, then I won’t mind giving you a closer look for our session.”</i>");
	output("\n\nYou hardly register the words, honestly, but some unconscious part of you acquiesces. You feel his body move and shuffle before you see it; his fur draws along your body, and you feel his bulging muscles grind against you as he crawls forward, pulling his body along yours. ");
	output("\n\nYour eyes are level with his chest, then your nose draws a line down his two columns of abs – and then you’re wetly jabbed in the chin by his leaking cock, the nubs and prickles on his spaded head tickling at your [pc.skinFurScales]. His dick stiffly rubs its way up your cheek before coming to rest against your nose, the point of his cock above your eye, and the bulge of his knot against your [pc.lips].");
	output("\n\nEven before now, your world had shrunken down to just Eitan and his body, and now, your senses are overloaded with his overpowering sexuality. A bead of his pre drips onto your forehead, and you can feel the moisture you’ve been rubbing into his cock against your face. You need no instruction – your priorities have been overwritten with this alpha stud’s cock grinding against your face, and you start by puckering your lips and giving his beating, heavy knot a wet kiss.");
	output("\n\nEitan exhales through his nose, and his cock bounces at the feel, but he doesn’t try to realign himself for you to take him properly – that’s your job. One you take with aplomb, opening your mouth and dragging your parted lips up every throbbing inch of his pitch-black cock, your [pc.tongue] covering the gap left between them and tasting the pre you’ve massaged into his sensitive flesh. His enormous, fuzzy balls, each the size of a fist, drag their way down your own [pc.chest] as you rise towards the tip of his spire.");
	output("\n\nThe pointed head crests the hook of your nose and comes to rest on your upper lip, right between your nostrils. And you just lay there for a moment, enjoying the practical high you’re getting off his musk: the weight of his thick, heavy cock and balls against your mouth, chin, and chest; the smell of his musk, straight from the source to your nose; and not just the taste, but the feel of his throbbing cock against your salivating mouth. All six of Eitan’s abs clench and unclench at every little motion of your mouth on his equipment; he’s as ready to fuck your mouth as your mouth is ready to be fucked.");
	output("\n\nYou don’t make either of you wait any longer. Just a few more inches, and you lean back far enough for his cock to line up with your mouth. You split your [pc.lips] and coil your tongue along his fat, broad, pointed tip, guiding you in–");
	output("\n\nAs soon as Eitan recognizes that his cock is in a warm, wet hole, his instincts take over, and he thrusts. Suddenly, the light sample of prime milodan dick becomes a greedy gourmet feeding: your eyes widen in surprise at the impact of his cock cramming into your mouth, pushing your tongue down and making your jaw stretch to accommodate him.");
	output("\n\nOn the plus side, he’s <i>delicious.</i>");
	output("\n\nAll pretences of foreplay are forgotten, and Eitan regresses (hopefully temporarily) back to that hyper-dominant alpha milodan that you had worked so hard to change: a brute of a stud that doesn’t care as much for your own pleasure as he does for his own. You should be rightfully concerned for yourself – sex is about mutual pleasure, after all – but, underneath the mountain of muscle that is Eitan, with your mouth stuffed full of his piston of a cock, and his balls slapping onto your chest with every push in, and the sight of his abs straining to contain all that raw sexual energy... you find yourself enjoying exactly where you are.");
	output("\n\nStill, you have a pair of hands, and in between the rampant thrusts of your milodan stud fucking your mouth, you find the sense to use them. One hand goes to Eitan’s ass, gripping onto his steely cheek and grabbing a fistful of the fluff there, feeling the tightness of his glute, while the other tends to yourself: with your lower body exposed to the comparatively cool are of the room, you");
	if (pc.hasCock())
	{
		output(" reach for your [pc.cock " + jerky + "], standing rigid behind Eitan and his humping hips. You’re hard as diamonds – honestly, you could probably get off without having to touch yourself, with the way Eitan is drilling your mouth, but the dumb lizard part of your brain wants whatever pleasure it can find, and in short order, you’re fucking your hand almost as hard as your milodan is your face.");
		if (pc.hasVagina()) output(" Unfortunately for your feminine half, though, you only have one hand to spare, leaving your poor [pc.vagina] to fend for itself.");
	}
	else
	{
		output(" hook your hand toward your [pc.vagOrAss " + jilly + "], your cloying fingers searching for your sensitive entrance. It’s hardly difficult to find, given how excited you are, and your body is eagerly receptive to having something extra inside it to give it that little extra kick. Not that you need it – you could probably orgasm just fine without the extra stimulation, with how expertly Eitan is drilling your face – but, hell, why not?");
	}
	if (flags["USED_SNAKEBYTE"] != undefined) output("\n\nThere aren’t a lot of cocks in the world that can <i>really</i> satisfy your ribbed, erogenous throat, and Eitan is one of the rare few that can accomplish the task. You eagerly yawn your mouth wider, inviting him to deepthroat you as far as he can; Eitan, still drunk on his own dominant performance, pays little heed to your invite and fucks your mouth at his own pace. Your patience is rewarded, and soon, he’s down to the knot, that bulbous flesh battering harshly against your [pc.lips] with every thrust. If you can just get your mouth a bit wider, you’ll be able to take that, too...");
	else if (pc.canDeepthroat()) output("\n\nEventually, Eitan hits that spot in your mouth where your gag reflex would normally be - but you’ve managed to work your way past that long ago, and there isn’t a goddamn thing in this universe that’s going to keep you from taking every last inch of this fat fucking cock into your mouth. If you can open your mouth wide enough, you’ll gladly even take him down to the knot.");
	else output("\n\nIt’s not long before Eitan reaches his cock about as deep into your mouth as you’re willing to take him, and as soon as he starts testing your limit, you start to gag and thrash beneath him, choking on his meat. For his part, he has enough control over himself to know not to push any further than he already is, but that doesn’t mean he’ll be taking it easy on you with what he <i>can</i> fit in. All it means is that the facefucking is going to get a little more brutal to compensate.");
	output("\n\nYou don’t have any agency in the way he takes your mouth for his pleasure, other than to try and wriggle your tongue whenever his cock gives it the room on the outswing, and to hollow your cheeks and give him a tighter, hotter sensation. His dick fills your mouth the way not a lot of cocks can: you feel like a stranger in your own mouth, and it actually belongs to him – you’re just borrowing it so you can fellate him.");
	output("\n\nEitan grunts in exertion. One of his hands comes down on your head, gripping you by the scalp, and he leans forward to lean on his other. His jackhammer thrusts become more forceful, but with less distance on the thrusts. His cock gets thicker, and a steady trickle of his pre slides down your throat, where you can’t taste it. You can feel his balls clench and ride up your [pc.chest]; it’s only a few seconds from now....");
	if (pc.canDeepthroat())
	{
		output("\n\nYou strain to open your mouth wider for him. That knot of his is so tantalizingly close – it’s not enough to just open wide enough to take it into your mouth, but it also needs to clear your teeth. With his newer, more insistent pumping, he sinks down to about halfway across his knot. Just a bit more, and–");
		output("\n\nWith one final push, he pushes himself past your lips, sinking himself totally into your maw, knotting you orally. You can feel his cock penetrating into your throat, the nubs on his tip tickling at nerves you didn’t realize you had. You can hardly breathe, and all you can see is Eitan’s furry crotch obscuring your view – but you’ve done it. His big balls rest comfortably in the crook of your neck, and your nose is pressed right into the fur of his pelvis. Your only regret is that, when he cums, you won’t be able to taste it.");
	}
	output("\n\nHis orgasm hits hard. His hand pulls you into his body" + (flags["USED_SNAKEBYTE"] == undefined ? ", forcing you deeper onto him, but this time, your struggles hardly register with him" : " – if it weren’t for the thick milodan knot in your mouth, his grip on you would ensure that you aren’t going anywhere") + ". You can feel his balls draw into his body, raking against your chin, and you feel, and you <i>hear,</i> the surge of his thick, virile, milodan alpha spunk coursing through his cock and straight into your gullet.");
	output("\n\nYou lay there, beneath him, struggling to maintain your own composure as your oxygen is cut from your body. You can feel every thick, heady gush glide down your throat and settle into your stomach; in the space of a single load, Eitan cums more than a lesser man or milodan, and he has yet more to give you. You chug his cum like a frat boy at a kegger with something to prove, not that you have much other choice. The seconds tick by, each of them weighing your [pc.belly] down further with more and more of his load, but to your poor lungs, they feel like hours.");
	output("\n\nBut as hard as it might be on your lungs, your body can’t help but be brought over the edge from the treatment of having such a stud of a milodan fucking your throat. Your [pc.hips] thrust into the air impiously, and your");
	if (pc.hasCock())
	{
		output(" [pc.cock " + jerky + "] spurts in your hands, arcing your [pc.cum] through the air behind Eitan. There’s nothing and nobody to catch any of it, and it sails onward,");
		if (pc.cumQ() < 250) output(" splattering onto the cushions underneath your [pc.legOrLegs].");
		else if (pc.cumQ() < 3000) output(" reaching high into the air before coming down near the far corner of the room.");
		else output(" reaching as far as the far wall and climbing a fair distance up it, and there’s much more where that came from.");
		if (pc.hasVagina()) output(" And your");
	}
	if (pc.hasVagina()) output(" poor, neglected [pc.vagina] clenches at nothing, desperately hoping that Eitan will treat it just as roughly as he’s treating your mouth. You can’t help but buckle at the sensations emanating from your pussy; as empty as it is, a clearer mind could be confused for having something thick and juicy in it, given the earthquake of an orgasm you’re getting right now.");
	output("\n\nEventually, Eitan proves that he is indeed mortal, and he withdraws");
	if (flags["USED_SNAKEBYTE"] != undefined) output(", with some effort: you’re tired, abused, and sore, but you muster the strength to open your mouth again to let his knot out");
	output(" – but no sooner do you take a deep, stuttering breath does he start again, fucking your mouth with his still-rock-hard cock, his nuts slapping against you with his hips once again. Your hand goes from his ass to his abs, weakly trying to message him to stop, or at least to slow down, but, like a milodan possessed, he hardly even notices.");
	output("\n\nYou never had much control in the lovemaking between you two this time, and you feel what little semblance of agency you had is slipping. Your stomach is packed full enough with his jizz to feed you for a day, and your mouth is so sore that you don’t think you’ll be able to eat solid foods for a little while. But he’s not stopping: despite just having gotten off, his cock, apparently lacking a refractory period, is neither soft enough nor sensitive enough for him to not want more.");
	output("\n\nAnd even though you’d rather not keep going... you can’t deny the effect that his blatant display of domination and one-upmanship is having on you. You’re about ready to cum a second time yourself. Hell, maybe more.");
	output("\n\nStill, for all the display of alpha-maleness that he’s giving you, his second orgasm comes much more quickly than the first. It takes only a few moments of his giant, fuzzy nuts slapping you in the chin");
	if (flags["USED_SNAKEBYTE"] != undefined) output(", and his knot tugging at your [pc.lips]");
	output(", and his enormous cock violating your throat, for him to tense up and ready another gout of his cream for your full-but-hungry belly. His cock stiffens and bloats in that by-now-familiar sensation of having a great, big dick like his cumming in your mouth, and your throat is inundated with another wave of his cum.");
	output("\n\nYou can’t help it: you cum a second time with him, making a mess of " + pc.cockAndVagina("yourself", "the cushions beneath you", " and ") + ". Eitan’s sexual energy is contagious, and like you thought, you hardly feel spent or exhausted after the second round, and could probably go for another, if it didn’t mean taking more jizz into your stuffed stomach.");
	output("\n\nLike before, you have no choice but to chug, taking down every bubbly drop of his jizz into your belly. Your hand goes from his abs to your own [pc.belly], and with every flush of his seed down your throat, you feel yourself bloating and expanding, growing tauter from overeating. Eitan growls and his fists curl into balls above your head in time with his spasming cock; with every little action comes another fresh wave from his overworked balls for you to suck down. A part of you hopes that none of it leaks from your mouth, or, heaven forbid, your nose, since it would mean that you’re so backed up that it’s washing out – but, on the other hand, it <i>would</i> relieve some pressure....");
	output("\n\nFinally, just as your lungs can take no more, Eitan calms down and relaxes his body on top of you, slumping slightly. He isn’t soft yet, so his cock is still lodged " + (flags["USED_SNAKEBYTE"] == undefined ? "knot-deep" : "root-deep") + " into your maw, but if he’s relaxing, it means that you can soon, too.");
	output("\n\nBut... Eitan starts again. At a more casual pace this time, but all the same, he’s ready for a third round.");
	output("\n\nAs willing as your spirit may be, your lungs have had enough, and you pass out just as you start to feel the warmth of the fur on his balls against your chin once more.");

	// end scene (scene: Suck Him); decrease Lust to 0; decrease HP by 5 (but do not let it fall to 0);
	pc.orgasm();
	pc.HP(Math.max(-5, 1 - pc.HP()));
	var eitan:Creature = getEitan();
	pc.loadInMouth(eitan);
	pc.loadInMouth(eitan);

	// go to (scene: Aftercare)
	addButton(0, "Next", eitanCuddlesYouBecauseYouPassedOut, {id:1});
}

public function getOnTopOfEitansCock(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showEitan(true);
	processTime(20+rand(31));

	var eitan:Creature = getEitan();

	output("You run your eyes over Eitan’s body, drinking in every little detail of his chiselled, damn-near-perfected form: the bulge of his pecs and the fluff of the fur on his chest; the way the sheer definition of his abs shows through on the fur on his stomach, even as thick as it is; the way his arms tense on either side of your head while he keeps himself steady on top of you. His body is the <i>definition</i> of the male form, and soon, it’s not enough to just examine him with your eyes.");
	output("\n\nYour hands explore his torso: your left starts at his ribs, tickling at the thick muscle over them, while your right palms at his chest and wraps around to his back. Eitan moans at your touch and arcs his back, giving you better access to his body. You see a flash of black from the corner of your eye as his body moves, and you’re reminded of his great, big, juicy cock, still spilling from his overfull sheath, bloating larger and fatter at your touch.");
	output("\n\nHis hips buck at you, animalistic and instinctual – as much as he enjoys the feel of your hands on his body, he’s still a needy, horny milodan, and he’s in need of something sexier than the air between you two for him to fuck. You nearly forget that you were feeling at the tense contours of his muscular body when your eyes set on that foot-long cock, ready to properly breed and break a bitch.");
	output("\n\nStill... as sexy as the idea is of you lying on your back, underneath the brick wall that is Eitan’s body, as he thrusts into you again and again, panting with exertion, your name whispering from his lips, while your body melds to the shape of his cock, until it all comes to a sudden head – right, as you were thinking, as sexy as that all might be, you’d like to take this in a different direction. If Eitan had his way, he’d fuck you into the cushions, all strength and ferocity but no grace. You’re not done admiring his body with your hands.");
	output("\n\nEitan normally prefers to top, clearly, so it snaps him from his submersion into his own sexual revere when you put your hand on his shoulder and give it a push. He looks down at you, at first confused, but your body language is clear, and neither of you need to exchange words. You’ll know whether you have his permission in a moment.");
	output("\n\nLike a gentleman and a proper lover, he acquiesces immediately, rolling onto his side, then grabbing your own shoulder before rolling onto his back, flipping you up on top of him. It’s a quick, sudden action: suddenly, you’re on top of Eitan, your body lying flat on his muscular form. Eitan’s cock stands straight up in the air behind you; with a thrust of his hips and a shift backward, his fat shaft is caught between your asscheeks.");
	output("\n\nYou lay on top of Eitan limply, just... relaxing, on top of his nude form. Your face is buried in the bushy fur of his neck, and your [pc.chest] is squished against his own. His muscular form doesn’t make for an especially comfortable mattress, but you’re hardly there for rest, as the massive cock bouncing and frotting against your [pc.ass] will remind you.");
	output("\n\nEitan’s own hands come down on your [pc.hips], guiding your body by holding it still as he hotdogs your ass. With every thrust upward, you can feel his bloated knot slap you in the pelvis, and you feel the tickle of the fur on his balls against your [pc.skinFurScales]; on every draw back, you can hardly count the inches it takes until you feel his cock begin to taper as it comes down to the tip, confusing you to his size.");
	output("\n\nBut that’s okay: you’re on top of Eitan, soaking in his muscular body for yourself, as he entertains himself by fucking the cleavage of your ass.");
	if (pc.hasCock())
	{
		output(" Neither of you hardly mind the pool of pre you’re leaving on Eitan’s own stomach from all the frotting");
		if (pc.balls > 0) output(", especially as his cock grinds against the skin of your [pc.sack].");
		if (pc.hasVagina()) output(" But your cooch is a different story.");
	}
	if (pc.hasVagina()) output(" It feels almost criminal to have such an exemplary shaft grind into your butt, so close to your [pc.vagina] that you can feel the heat of his cock mingle with heat from your pussy, without penetrating into it. Your body whines to you that it <i>needs</i> Eitan inside it, right <i>now.</i>");
	output("\n\nYou can’t deny your body’s needs any longer. You place your hands on your chest and, with a grunt, sit upright on top of him; you can feel Eitan’s cock sink into the valley of your butt until his tip " + (pc.hasTail() ? "juts into the underside of your tail" : "pokes at the base of your spine") + ". You reach back, fishing for his dick so you can guide it into yourself and finally feel that fat meat stretch you open and get nice and nestled inside you.");
	output("\n\nEitan chuckles beneath you – he knew exactly how riled up it would make you, and it was all just him waiting for you to move first. You’re the top, after all – the sex doesn’t proceed until you say it does. And, you say with your body, as the tip of his cock finds the entrance to your [pc.vagOrAss " + vagIdx + "] – <i>it does.</i>");
	if (vagIdx < 0) pc.buttChange(eitan.cockVolume(0));
	else pc.cuntChange(vagIdx, eitan.cockVolume(0));
	output("\n\nAs soon as you squat yourself a bit backwards to take him into your body, Eitan, correctly assuming he no longer needs to wait, thrusts upward. Suddenly, your [pc.vagOrAss " + vagIdx +"] is filled with far more cock, and is spread far wider, than you were prepared to handle, all at once: it might have only been two or three inches, and you <i>want</i> that fat cock of his inside you, but still, those few inches are a solid reminder of how much left you have to take.");
	output("\n\nBut neither of you are backing down: those few inches are enough to get you started on taking <i>the rest</i> with aplomb. You sink down a few inches, then pause, then sink, then pause, getting a little fuller and spread a little wider each time. Eitan’s hands are tight on your hips, but he only moves when you move.");
	output("\n\nYou lean forward, running your hands first over his stomach and feeling the ridge of each of his bulging abs underneath his plush fur, before stopping on his thick, muscled chest. You needed a better position for your hips so you could start fucking him properly, but getting a nice handful of his body while you were at it was a plus.");
	output("\n\nWhen you press down onto Eitan’s crotch, he thrusts up and in, sinking more of that heavy cock into your [pc.vagOrAss " + vagIdx +"]. You groan at the sensation of your body splitting apart to take his shaft: Eitan is so exceptionally well-endowed that it almost doesn’t feel like you’re fucking him, and more like he’s wearing you, almost like an accessory. A soft, warm, wet accessory with hips he’s manhandling with those strong, firm hands of his.");
	output("\n\nAs the pace picks up – with you using your higher leverage to bounce on his body, and with him thrusting into you when he can – Eitan’s breath starts getting a bit more ragged, and his body gets a bit more tense. His muscle visibly bulge underneath his fur, from around his shoulders and down his arms. Every thrust has his stomach crunch, outlining the creases of his abs even through the thick fur around his stomach. The thighs you’re bouncing on feel almost like rocks with how sturdy they are. You could throw any kind of challenge at this body you’d want, and you bet it’d all just bounce right off him.");
	output("\n\nEventually, your body collides with his knot, battering up against your sensitive hole. It’s not a question of ‘if’ Eitan is going to knot you, especially with gravity on his side, pulling you onto his body – it’s a question of whether you’re prepared to have yourself stuck and locked to his form until his cock is satisfied and deflated.");
	output("\n\nAnd, well, if Eitan’s body can take any sort of challenge, you certainly aren’t about to shy away from this one.");
	output("\n\nYou lean forward, resting your head against his chest, focusing on the rhythm of your bodies together. Whenever he pulls out, it’s almost like there’s an Eitan’s shaped vacuum inside your body, and whenever he thrusts in, you feel so full, yet no matter how much you take of him, you feel like you could take a little more. Eitan is the alpha of the milodan tribe, and he sometimes likes to talk about how much he fucks because of it – given his movements, and the way his hands know exactly where to stay, and he knows exactly how to match your pace with you on top, you’re inclined to believe him.");
	output("\n\nHis knot pushes insistently against your [pc.vagOrAss " + vagIdx +"], reminding you’re on something of a timer. You’ve been so lost in Eitan’s form, sinking yourself into his fur and admiring his body beneath it, that you’ve nearly lost track, but stuffing a ball of flesh the size of a fist into your body has a way of snapping you out of things. You clench your teeth and hiss, grabbing fistfuls of his milodan fur for stability, and you drop your [pc.hips] onto him as he rises his own, both of you intent on making this happen.");
	output("\n\nIt goes at your pace, but happen it does: inch by tantalizing, delicious, but difficult inch, you feel your body yawn wide enough to accept that fat ball of cock-flesh and you feel him push it into you, filling whatever little nooks you didn’t realize you had inside you and stuffing you to your limit. It’s a relief you didn’t realize you needed when you two finally get over the widest part, and the rest of it is fairly smooth until you bottom out.");
	output("\n\nYour [pc.ass] rests against the top of his furry, overfull balls; you can feel their fur tickle at your [pc.skinFurScales] as he grinds his cock inside of you, getting himself nice and nestled. Now that you’re packed to the brim with his hot shaft, he can’t do much thrusting either way, but that doesn’t stop him from instinctually trying, to ensure that his seed gets as deep into you as he possibly can.");
	output("\n\nNot that he has to worry much about that, if the density in his balls has anything to say about it.");
	output("\n\nEitan grunts once, his own body clenching and curling around yours: his hands go to the swell of your [pc.ass] and his thighs reach up and pinch your [pc.hips], constricting you in the solid mass of muscle that is his body. And what comes next is a load that only the alpha of the milodan would be capable of outputting:");
	output("\n\nAs unbelievable as it is, you feel his shaft get even more bloated inside you, before you feel a hot gush of his cum coat your insides. The first shot alone would put the average man’s whole load to shame: you can feel your");
	if (vagIdx < 0) output(" stomach fill up and stretch against your body; a single load of that down your throat would have been enough for a proper meal, and he has so many more to give you. The second shot fills you more thoroughly, bloating your [pc.belly] until there’s a bit of paunch around your navel, sloshing with his cum and with nowhere to go with that thick knot tying you both so tightly.");
	else
	{
		output("body stretch and pull, the fire in your pussy doused with the first offering, but Eitan has so much more to give. The next pulse along his cock has your own [pc.belly] round out just beneath your navel, and with his knot tied to you so tightly, there’s nowhere for his cum to go");
		if (pc.fertility() > 0 && !pc.isPregnant(vagIdx)) output(" but straight to your eggs");
		output(".");
	}
	output(" And with the third...");
	output("\n\nWith your body stretched taut and your [pc.vagOrAss " + vagIdx +"] getting so rigorously pounded, stretched, abused, and <i>filled,</i> you can’t help but cum yourself.");
	if (pc.hasVagina())
	{
		output(" You bury your face into Eitan’s chest and groan as your [pc.vagina" + (vagIdx < 0 ? "] clenches hard." : " " + vagIdx + "] clenches hard, making the tight seal around his base just that much more absolute.") + " Your orgasm ripples through your body, resonating from your crotch and robbing the strength from your fingers; you even lose your sight for a second, making you see swirls and stars, all from the pounding your stuffed, drenched pussy is getting from Eitan’s monster cock.");
		if (pc.isHerm()) output(" Of course, for you, that’s not all.");
	}
	if (pc.hasCock()) output(" Your [pc.hips] gyrate, unable to keep steady, trying to fuck some invisible hole while Eitan has his way with yours. The warm, bushy fur of his torso is a fine-enough substitute, and you unload on his front-side, your [pc.cum] jetting into his fur. You don’t have a lot of room for motion yourself, what with Eitan’s knot in your [pc.vagOrAss " + vagIdx +"], so every little rocking motion you can get, driving your [pc.cock] into his fur, will have to tide you over.");
	output(" And, just like with Eitan, your second orgasm comes right on the heels of his fourth load...");
	output("\n\nAs amazing as your orgasms feel, what feels even better for your poor, stressed body is when the seal between your body and Eitan’s knot gives way just enough to let a few dribbles of his jizz out of you. It’s not enough to deflate you, but it’s enough that it’s not going to get any worse, at least.");
	output("\n\nAt least, that’s what you <i>thought,</i> but as soon as you try and relax against Eitan and take some time to catch your breath, you feel him start to pump up against you once more. He isn’t done yet: one round isn’t enough for the alpha of the milodan, and he needs his partner to maintain the same sort of sexual energy he’s capable of.");
	output("\n\nUnfortunately for you, though, the first tug of his knot against your [pc.vagOrAss " + vagIdx +"] has you seeing stars once again, and this time, your vision doesn’t clear up right away.");

	// end scene (scene: Ride Eitan); decrease Lust to 0; decrease HP by 5 (but do not let it fall to 0); go to (scene: Aftercare)
	pc.orgasm();
	pc.HP(Math.max(-5, 1 - pc.HP()));
	if (vagIdx < 0) pc.loadInAss(eitan);
	else pc.loadInCunt(eitan, vagIdx);
	eitan.orgasm();

	addButton(0, "Next", eitanCuddlesYouBecauseYouPassedOut, {id:2, vagIdx:vagIdx});
}

public function puttingEitansCatTongueToWork(genIdx:int):void
{
	clearMenu();
	clearOutput();
	showEitan(true);
	processTime(15+rand(26));

	var vagIdx:int;
	var cockIdx:int;
	if (pc.hasVagina())
	{
		vagIdx = genIdx;
		cockIdx = rand(pc.cocks.length);
	}
	else cockIdx = genIdx;

	output("You run your hands through the bushy fur of his chest, feeling your digits along the tightness of his muscles underneath. One goes to his right pec, palming at how steely and powerful his chest is there, while the other goes lower, to his abs, feeling each and every one and marvelling at how they push back against your digits.");
	output("\n\nEitan makes a low moan, almost like a purr, as he feels your hands on his body. His arms tense and bulge on either side of you, almost like he’s trying to show off to you. Not that he needs to – you get the picture loud and clear.");
	output("\n\nYour eyes trail from his ironclad stomach, to his chest, to his thick neck, and to his face. The expression he has is almost charming: the confident, wry smile and the way his eyes narrow and focus onto yours. His tongue slips out and gives his lips a linger lick, moistening them for what they’re about to do. If you two were on opposite ends of a crowded room, you’d know from that expression alone that you two were going to fuck.");
	output("\n\nBut for all the fondling and ogling you’ve been doing to his form and his muscles, it still feels like <i>you’re</i> the piece of meat on display between you two. Eitan is on top of you, and the pace of the sex is entirely as his discretion; that he’s waiting for you to give him an instruction, implicit or otherwise, is somewhat telling. He <i>knows</i> what he wants, and he knows that <i>you</i> know what he wants, he’s just waiting for you to tell him to do it.");
	output("\n\nThere’s some pure, sexual power coming from Eitan: he doesn’t need to move a muscle or say a word, and he already has you wanting what he wants. It makes you " + pc.cockAndVagina("stiff as a log", "wet as a puddle", " and ") + ". You could ask him to fuck you – his jet-black cock is standing thick as can be between you two, bloated and pulsing, his sheath stretched around his knot, ready to burst forth – but that’s not what you want. That’s not what <i>he</i> wants.");
	output("\n\n<i>“Eitan,”</i> you say, your voice a little shakier than you intended, <i>“go down on me.”</i>");
	output("\n\nHe sets about your command with surprising swiftness: his body bears down on you, pressing his muscular, heavy body onto yours, pressing you into the cushions with his weight and his fur. He hums to himself as he begins to slide backward; you can feel every individual hair on his fluffy body pull on your [pc.skinFurScales] as he goes. <i>“Normally,”</i> he says, his own tongue licking down your naked body as he moves, <i>“I am not the one to service others, [pc.name] Steele. It should be the privilege of others to service the alpha.”</i>");
	output("\n\nAs he gets to your pelvis, he nuzzles into your belly, pressing his nose into your stomach.");
	if (pc.isHerm()) output(" Both parts of you vie for both your attention and his: your [pc.cock " + cockIdx +"] buries itself into the fur on his face, and the heat of your [pc.vagina " + vagIdx +"] bounces off his chest and back to you. You aren’t sure which he would rather start with – honestly, you’ll be happy with whatever, you think.");
	else if (pc.hasVagina()) output(" The heat of your [pc.vagina " + vagIdx +"] reverberates off his chest, then back onto you. The closer he gets to it, the harder it gets to not just grab him by the hair and shove him face-deep into yourself – you doubt he wouldn’t let you.");
	else output(" Your [pc.cock " + cockIdx +"] stands at attention against his neck, resting in the crook between his collarbone and his ear. It grinds against his jaw, rubbing against the fluffy fur on his face, partially disappearing into it.");
	output("\n\nHis hand travels down to your crotch, making its way to your junk. His hands are huge and his fingers are rough, to say nothing of the fact that his claws don’t retract and they trace lines down your [pc.skinFurScales] as he feels you, but he’s gentle as a cloud the whole way. When you finds your");
	if (pc.hasCock())
	{
		output(" [pc.cock " + cockIdx + "], he hooks the crotch of his thumb around your [pc.base " + cockIdx +"], giving you a tug and testing your length and rigidity. He makes it " + (pc.cLength(cockIdx) <= 12 ? "to your [pc.cockHead " + cockIdx +"], his palm running across your tip and collecting your pre, before gliding back down" : "halfway to your tip – he looks down to see just how large you are, then, once he knows just how much you’re packing, he resumes his handjob") + ". When he gets back to your bottom, his fingers curl around your taint");
		if (pc.balls > 0) output(", to clasp at your [pc.balls], cupping them between his digits and hefting their weight");
		if (pc.hasVagina()) output(" – when his fingers find the wetness of your [pc.vagina " + vagIdx +"]. He tests his find a bit, sinking a finger down to his first knuckle, and based on your reaction and the feel of your pussy, he knows what he’s found, and a smile crosses his face.");
	}
	else output(" [pc.vagina " + vagIdx +"], he’s quick to insert his index finger down to the knuckle. You flinch, ready for his claw to scratch, but he, in his expertise, does little more than twist and thrust inside; you can hardly tell that he has a claw at all, and all you feel is a thick, furry finger inside your box, getting you ready for something larger and more... vibrant.");

	// Continue here if the PC is female/herm
	if (pc.hasVagina())
	{
		output("\n\nOnce he’s satisfied that he’s gotten you nice and <i>warmed up</i>, he withdraws from your [pc.vagina " + vagIdx +"], teasingly slowly, his eyes on you and your reaction the whole time. You can’t help but bite into your lower lip at the sight of him and the feel of his finger exiting you – and when he brings his hand up to his mouth to suck his finger dry, you’re suddenly on the edge of your patience, and you’re about to yell at him to get started already.");
		output("\n\nEitan hears your unspoken command loud and clear, but, even despite that, he does what you don’t expect: he");
		if (pc.hasCock())
		{
			output(" lifts your [pc.cock " + cockIdx +"]");
			if (pc.balls > 0) output(" and [pc.balls]");
			output(" out of the way, places his right hand on your stomach, and he");
		}
		output(" shoves his nose right into your wet box, sinking his face down to the whiskers inside you. You jump in surprise at the sudden feel of his fat, stout nose crammed right up your junk, and your [pc.skinFurScales] shiver when you feel the air rush over your vulva as he takes a <i>huge</i>, deep breath through his nose, taking in as much of your bitch-in-heat scent as he can in a single go.");
		output("\n\nHis whole body shakes and clenches at the unbridled smell of you, causing the hand on your stomach to rack its claws against your flesh. Eitan shudders as he exhales through his mouth and the hackles on his shoulders rise up – if you could get a look at his cock, you bet it’d be hard enough to puncture ice. Unfortunately, a good, raw fucking isn’t what either of you wanted this time. Or perhaps it <i>is</i> fortune: after that, you’d imagine a man like Eitan might fuck you so hard, he’d split you in two.Unable to contain himself after that, Eitan leans in, tilting his head back, and he shoves his tongue into your box, coiling it around itself like a drill. You flinch at first – milodan have rough, sandpaper-like tongues, and the last thing you want is to feel something like that scrape at your insides. But this is clearly not Eitan’s first time going down on a woman: his movements with his tongue are slow and deliberate, and he’s careful to try and keep his tongue rolled around itself to keep its rough buds folded into themselves. You had expected him to go down on you like a starving man at a banquet, especially after that display of him taking in your horny scent, but you can guess that milodan females aren’t such a fan of the sensation of having something with a sandpaper-like texture inside them either.");
		output("\n\nTo make up for his lack of speed, his tongue is huge and broad, and he uses that to his advantage. You feel the broad, dull sides of his saber-teeth press into the V of your pelvis as he leans into your body, reaching as deep into as any cock could hope to and then some. Rather than thrash it side to side, or try to spell the alphabet or whatever, he makes a long, lingering pass, from left to right, and then twists his tongue around, like the drill’s been put into reverse, before he withdraws and does it all again.");
		output("\n\nThere’s a sense of... calm <i>power</i> to the way he’s eating you out. He spears in; makes a complete pass inside you, like he’s a dog trying to lick the inside of a peanut butter jar clean; then twists and withdraws before starting again. He’s so <i>thorough;</i> his motions are so <i>deep;</i> the coil of his tongue inside you has you subconsciously shifting your [pc.hips] in the same direction. Eitan puts more emphasis on the totality of a single pass of his tongue inside your cunt, rather than the speed: an average lover going at an average speed could get in three or four licks in the time it takes for him to do one, but they also wouldn’t go half as deep, or fill you half as full.");
		if (pc.hasCock())
		{
			output("\n\nAnd your [pc.cock " + cockIdx +"] is hardly still and unspoken-for the entire time: although Eitan’s in no rush to tend to it with his mouth, he keeps his hands busy: one on your [pc.legOrLegs], and the other on your shaft, stroking it in time with his passes into your box with his tongue. His motions are fluid and easy, jerking you from your [pc.knot " + cockIdx + "] to");
			if (pc.cLength(cockIdx) > 14) output(" halfway towards");
			output(" your [pc.cockHead " + cockIdx +"], coaxing out your pre, massaging it all the way up as he goes.");
			if (pc.balls > 0) output(" Your [pc.balls] rest lightly on his nose the whole while, weighing down on his face as he devours you; his motions nuzzle his face deeper into the cleavage of your nuts as he goes, which may or may not be intentional, but you’re not about to ask him to stop either way.");
		}
		output("\n\nDespite you being the one being serviced, Eitan is playing your body like a fiddle. Everything he does, with his hands, to his mouth, to his tongue, to the way his nose keeps grinding up against your [pc.clit " + vagIdx + "]");
		if (pc.balls > 0) output(" and the underside of your [pc.sack]");
		output(", is all very deliberate: expertly practiced on likely hundreds of viable mates to master eating a pussy with a tongue designed to rip muscle from bone. His eyes have narrowed and glazed over, like he’s in a different world and his body is running purely on muscle memory – like he’s a cunt-consuming machine designed to get you off in the most efficient way possible, given his unique traits.");
		output("\n\nAnd it all just <i>works:</i> you can feel your body tense up, starting at your crotch and radiating out to your extremities, as orgasm overtakes you. Eitan can tell too, even when his head is somewhere else: on his final pass, rather than withdraw, his slithers his tongue up and down, like a caught serpent, grinding his huge, fat tongue against your walls (and careful to do it with his smooth, spongy underside). You clench, pinching his tongue and locking it deep inside you, milking it like a cock as your [pc.girlCum] washes down the coil of his tongue and right into his waiting mouth.");
		output("\n\nYou grip onto the cushions beneath you tightly enough to turn your knuckles white. Your stomach clenches; your eyes cross; and your [pc.vagina " + vagIdx +"] cums and cums.");
		if (pc.isBiped()) output(" Your [pc.legs] wrap loosely around his neck – any tighter and you’ll pinch yourself on his saber-teeth – and lock by the ankle behind his muscular back, keeping him hard-pressed into your groin and making sure he’s not leaving until he’s taken every last drop your pussy has to give him.");
		output(" You bite into your [pc.lip], and soon, your eyes start to water, muddying your vision further. All thoughts in your head briefly stop: all that you’re concerned with is that fat tongue of his fucking you nice and deep in your cunt.");
		if (pc.hasCock())
		{
			output("\n\nIt was almost enough to distract you from the orgasm rocking your [pc.cock " + cockIdx +"]; although it was slower to come, what with not getting the same attention as its sister, it jets your [pc.cum] like a hose all the same,");
			if (pc.cumQ() < 250) output(" spraying into the air nearly a foot and a half high before raining back down onto your [pc.belly] and across Eitan’s hair");
			else if (pc.cumQ() < 3000) output(" launching as high up as your neck and leaving a slimy trail all the way down to your crotch from there, and flinging as far back as Eitan’s tail with his every upward jerk, painting his back with a [pc.cumColor] racing stripe");
			else output(" erupting with enough force to arc high above your own head when Eitan’s fist strokes downward, covering damn near every inch of you on the way and leaving a thick trail of your [pc.cumColor] cum to pool on your clenched stomach, and with enough force on the upward strokes to practically miss Eitan’s body completely until it rains back down on him, going from his tail, to his hair, and soaking his nose in your seed");
			output(". Your body can’t extricate one pleasure from another, and whenever another orgasm rocks your [pc.vagina " + vagIdx +"], another strains along your cock, pushing more of your cum from somewhere deep in your " + (pc.balls > 0 ? "[pc.balls]" : "body") + " and catapulting it somewhere else in the room.");
		}
		output("\n\nAfter a few convulsions, each one accompanied by an orgasm strong enough to offset your eyes and make your head light as air, your senses slowly come back to you, one by one. Your eyesight first, followed by your hearing as the ringing in your ears starts to quiet–");
		output("\n\nBut Eitan, the thirsty boy, twists his tongue inside you and withdraws, following the same patterns as he did just moments ago. You’re unprepared for the eagerness for a second round, and your body is still sensitive from the battering your poor pussy is taking from a tongue wide enough to split your body open. You try and tell him to stop, but you’re still weak from the stimulation, and your breath leaves your throat as an airy gasp. Your hips buck unconsciously into Eitan’s face, and he takes that as your permission to keep going.");
		output("\n\nThe heartier women of the");
		if (pc.race() == "milodan") output(" natural-born");
		output(" milodan might be able to take this kind of oral lashing, but your constitution is a little weaker than theirs, and your vision begins to swim once again...");
	}
	// Continue here if the PC only has a penis
	else
	{
		output("\n\nOnce Eitan has you good and <i>warmed up</i>, he unwraps his fingers from your cock, letting it bob and wave in the air between you teasingly, his eyes on you and your reaction the whole time. You can’t help but bite into your lower lip at the sight of him and the feel of the cold air around your shaft, bathed occasionally by his breath – and when he brings his palm up to his mouth lick the pre from it, you’re suddenly on the edge of your patience, and you’re about to yell at him to get started already.");
		output("\n\nEitan hears your unspoken command loud and clear, but, even despite that, he does what you don’t expect: he leans down, pressing his nose right up against the base of your dick, and wraps his long, feline-like tongue around your girth, wrapping you in a wet, warm, spongy blanket. You flinch at first – milodan have rough, sandpaper-like tongues, and the last thing you want is for Eitan to start scrapping his tongue across your junk.");
		output("\n\nBut whether Eitan knows exactly what he’s doing and he knows how to avoid that, or he’s more experienced with sucking dick than you would have guessed, that’s not what happens. Rather than lick inwardly, where he flops his tongue onto your skin and then sucks it back into his mouth, he goes in the opposite direction, drawing his tongue against you on the way out. Going <i>with</i> the grain of the barbs on his tongue makes his licks ticklish at worst, while still having all the familiar pleasures of having a mouth on your cock.");
		output("\n\nEitan is slow and laborious as he bathes your [pc.cock " + cockIdx +"] with his tongue, slowly dragging himself from your [pc.base " + cockIdx +"] and going upward, slathering every inch of you with his spittle. To make up for his lack of speed, his tongue is long and wide, which he uses to his advantage: a single lick wraps around the thick of your dick, cradling your width with his tongue before disengaging, pulling his tongue back in, and starting again. It’s not a quick process – anyone else probably would have gone straight to the fellatio, while he prefers to acclimate your senses to his unique biology – but the fact is, you’re hard, and Eitan has your dick against his mouth.");
		output("\n\nYou feel the enamel of his saber-teeth press against the V of your crotch as he leans in further, climbing his way up to your tip. As badly as you might want to just open his mouth and start fucking his face, and even though <i>he</i> is servicing <i>you,</i> Eitan is still very much the one in charge here: he knows exactly what you’re doing, and he needs your obedience to properly get you off. So much as an unconscious, impious thrust against his tongue could result in something neither of you intended. It’s all up to him.");
		// 16 inches or less:
		if (pc.cLength(cockIdx) <= 16)
		{
			output("\n\nFinally, after torturing you with pleasure for a short eternity, he reaches your spire");
			if (pc.cLength(cockIdx) >= 12) output(", although he had to shuffle himself forward to better sit on his knees to align himself with your length");
			output(". The tip of your [pc.cockHead " + cockIdx +"] pokes into the inside of his top lip, showing you his normally-hidden razor-sharp teeth. You freeze – your dick is awfully close to all of that sharpness – but if you didn’t trust Eitan to handle himself around your equipment, it’s a bit too late to stop now. Besides... based on his half-lustful, half-entertained expression, and the way his hot breath sharply exhales around your tool, he found your reaction amusing.");
			output("\n\nHis methods when he goes down on your properly are more of the same, but the different angle provides a wholly different tactile sensation. His tongue draws downward along your shaft as he sinks lower, which feels unique by itself, but his saber-teeth prevent him from providing a lot of suction on your cock. So, instead, he tilts his head to one side and he drags your [pc.cockHead " + cockIdx +"] along the inside of his cheek, while pursing his lips as best he can without pinching or, heaven forbid, biting.");
			output("\n\nIt’s not like any oral you’ve ever gotten before: you’ve heard of partners forgetting to use their tongues, but Eitan is almost <i>exclusively</i> tongue and not a lot of suction, thanks to his teeth. He has you ride the inside of his cheeks more often than most, too, and because you’re trying to be careful not to thrust against his mouth, it’s less like you’re fucking his face and more like his face is fucking your cock. Every movement is slow, deliberate, and <i>delicious.</i> It’s a wholly unique and not-at-all unwelcome experience, and suddenly, you’re closer than you realized.");
			output("\n\nYour fingers clench onto the cushions beneath you, gripping big fistfuls of fabric tightly enough to turn white as the rush of your orgasm thunderbolts through your body. Eitan recognizes each and every sign, but he doesn’t stop: he just keeps on going at his own pace like what’s happening is the most natural thing for him to be doing right then and there.");
			output("\n\nWhen your first gout of [pc.cum] rushes up your shaft, it rides against the inside of his cheek before billowing against the back of his throat.");
			if (pc.cumQ() < 250) output(" And he takes it all, like a real man’s man, letting your juice fill and puff his cheeks a bit – but he doesn’t swallow. His lips are apart, so your jizz drools back onto yourself, but even then, once you’ve cum about as much as you probably are, he turns his head to the side and " + (eitanIsCrew() ? "spits into the trash receptacle built into his quarters. At least he had the sense to not spit on your floor." : "spits onto a pile of unwashed, discarded rags near the corner of the little pocket of tent you two are in. Just more laundry to do, you suppose."));
			else if (pc.cumQ() < 3000) output(" His throat clenches, and his eyes bulge a bit – he was expecting a hearty load, but it still caught him by surprise, and he reflexively swallowed a bit before recollecting himself and letting your jizz pool into his cheeks. Eitan can’t close his lips, so most of your [pc.cum] backwashes back onto you, but even if he were a spitter and not a swallower, your output is just so much that he has no choice but to take the occasional gulp in order to make space. You can tell he’d rather not, but he’s also a man’s man that puts your pleasure first – at least, while he’s blowing you.");
			else output(" a shitload:That turns out to be a mistake, given your output: his eyes widen and he leans back, trying to put some distance between you and your geyser of a cock, but it’s too late to protect his unsuspecting throat from the first thick, creamy gout of your [pc.cum], and he swallows the first mouthful. Eitan’s lips can’t close around you, so what doesn’t get caught in his bloated cheeks – and that’s already more than a lot – backwashes against your bare pelvis and dribbles down his chin, sticking to the fur on his neck and chest. Eitan almost looks like he’s panicking: he’s more of a cuntlicker than he is a cocksucker, and he has no experience dealing with an output like yours. Should he try to swallow more? Should he back out? Whether it’s because of his indecision, or because he’s just a man’s man, he keeps you in his jaw, pumping away at his poor, overwhelmed throat.");
		}
		// 17 inches or more:
		else
		{
			output("\n\nYou’re too long for him to bother trying to crane himself all the way up and take you into his mouth, so he doesn’t bother trying. His face presses into the width of your shaft, obscuring most of his features, while his tongue continues to do more of the same: drawing fat licks across your girth, reaching for different spots along your sides. He’s not going to put in the effort to properly fellate a massive cock like yours, so this is about all you’re going to get. Which is fine with you – you’re not sure you wanted teeth as sharp as his against your sensitive glans.");
			output("\n\nInstead, though, he does everything else he can to pleasure a dick like yours. He’s had lots of experience with his own, and he can guess how someone else with a dick would prefer they want theirs to be touched. He rubs his fluffy cheek against the broad side of your shaft, letting the soft, bristly fur caress your skin – which is more of a symbolic gesture than a pleasurable one, but the symbolism is hot all the same – and he keeps his hands busy: one to hold your monster steady against him, and the other to travel down to your [pc.base " + cockIdx +"], his fingers tickling at the space where your cock meets your " + (pc.balls > 0 ? "[pc.sack]." : "body."));
			output("\n\nEitan is clearly more of a cuntlicker than a cocksucker, but he knows his way around a body, and the fact that he’s putting in the effort to please you at all should say a lot about how much he respects you, given his alpha-male manly-man nature. It’s not like any kind of oral sex you’ve had before: Eitan can’t kiss you because his saber-teeth don’t make it easy to pucker his lips, so while some partners can forget to use their tongue, Eitan’s technique is almost <i>exclusively</i> tongue. He’s slow; deliberate; and calculated, and it all culminates in a <i>delicious</i> sensation that brings you closer to your peak at a faster pace than you realized.");
			output("\n\nYour fingers clench onto the cushions beneath you, gripping big fistfuls of fabric tightly enough to turn white as the rush of your orgasm thunderbolts through your body. Eitan recognizes each and every sign, but he doesn’t stop: he just keeps on going at his own pace like what’s happening is the most natural thing for him to be doing right then and there.");
			output("\n\nThe first gush of [pc.cum] rocketing up your enormous shaft presses into Eitan’s cheek and rolls underneath his tongue before charging the rest of the way upward, bloating your cock’s tip and");
			if (pc.cumQ() < 250) output(" dribbling out in thick, but nonetheless modest spurts, especially for your size. Eitan massages each and every pulse of your jizz getting pushed up from " + (pc.balls > 0 ? "your [pc.balls], his hand palming and tickling each nut individually, one after the other" : "inside you, both his hands helping your cum upward, from your base, to your shaft, and to just a little ways beneath your tip") + ". Your [pc.cum] splashes down in every direction: bits of it fall back onto your [pc.belly] while more of it cascades down onto Eitan’s hair and a bit down his back, and still more of it flings elsewhere in the shaking excitement of your orgasm.");
			else if (pc.cumQ() < 3000) output(" bursting from your [pc.cockHead " + cockIdx +"], spurting like an upturned faucet with every thick, powerful pump of your creamy jizz up your shaft. Eitan uses his face, his tongue, and his hands to guide your cum up from your " + (pc.balls > 0 ? "[pc.balls]" : "[pc.base " + cockIdx +"]") + ", although it’s hardly necessary: there’s so much of it, and your [pc.cock " + cockIdx +"] is so perfectly designed to handle it, that every lurch and every throb of your shaft is accompanied by another gout of the stuff raining down on all sides. Much of it falls onto you, dripping onto your [pc.belly] and as high as your [pc.chest], while most of the rest of it washes down onto Eitan, clinging to his hair and to the fur all along his muscled back, reaching as far as his tail. And for his part, while he may prefer to go down on someone with a vagina, he, with his eyes closed and his throat vibrating and his motions going as smoothly as if you weren’t cumming a waterfall onto you both, is totally content with the cumbath he’s getting.");
			else output(" <i>exploding</i> from your [pc.cockHead " + cockIdx +"], erupting like a volcano and Eitan is the poor soul that decided that settling directly beneath it was a wise idea. Once the first thick, heavy blast of your seed splashes down onto him, he pauses in his movements: you clearly don’t need the help in cumming any more, but he also doesn’t move away, accepting everything that happens, now that he’s brought it about. Your [pc.cum] unloads from " + (pc.balls > 0 ? "your overstuffed and overachieving [pc.balls]" : "some unseen, unknown vacuum of space inside you") + ", raining down on all sides like a decorative public fountain, inundating your belly from your [pc.chest] down, and <i>submerging</i> Eitan, from his face, to his sturdy shoulders, to his muscular back, until it’s dripping off the tight curves of his ass. With just one burst, his face is covered in your spunk, and the only detail you can still make from it is the pink of his tongue wrapped tightly to your shaft. And for his part, he seems totally okay with it all...");
		}
		output("\n\nYou can feel your body slowly unwinding from an orgasm like that, left to the mercy of Eitan and his masterful tongue. It takes a conscious thought (and a bit of effort) to unclench your fingers from the cushions, one by one. You briefly let your eyes flutter closed.");
		output("\n\nBut just as you start to relax, you feel Eitan starting again on you. Gently, and with more... nuanced and subtle actions, but the intent is pretty clear: one orgasm is not enough from his partner. It must be a milodan thing, to expect multiple rounds from your partner in such quick succession.");
		output("\n\nYou want to tell Eitan to slow down, and that you’re not");
		if (pc.race() == "milodan") output(" built like");
		output(" a milodan – you need you rest in between bouts. Just as his tongue hits a particularly sensitive nerve cluster on your [pc.cock " + cockIdx +"], your eyes shut again; it was only meant to be for a second, but...");
	}

	// end scene (scene: Suck Him); decrease Lust to 0; decrease HP by 5 (but do not let it fall to 0);
	pc.orgasm();
	var eitan:Creature = getEitan();
	if (pc.hasCock() && !pc.hasVagina()) eitan.loadInMouth(pc);

	// go to (scene: Aftercare)
	addButton(0, "Next", eitanCuddlesYouBecauseYouPassedOut, {id:3, genIdx:genIdx});
}

public function eitanCuddlesYouBecauseYouPassedOut(sceneArgs:Object):void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(150+rand(46));

	output("When you come to, you’re warm as could be, and you feel tight all over. You thought you were only out for a moment – just a blink of an eye, really – but you must have been knocked unconscious from Eitan and his highly-demanding lovemaking. The milodan fuck like machines: just one round isn’t enough to satisfy even their runts of the litter, and to think that you just bed the alpha of a whole tribe...!");
	output("\n\nOn top of the heat and the constriction, you feel something rough drag across your " + (pc.hasHair() ? "[pc.hair]" : "bald scalp. It doesn’t hurt – on the contrary, it almost feels like a gentle scratch on your skin, like you’re getting an itch") + ". It’s a struggle to adjust yourself to see what it is, but when you move against your bindings, you realize that you’re actually trapped up against Eitan’s thick, muscular body, and the things keeping you still are his arms and legs wrapped around your body, spooning you to him.");
	output("\n\n<i>“Hmm,”</i> he hums, lifting his head to get a better look at your face. <i>“Good morning, [pc.name] Steele.”</i>");

	// PC is on the ship
	if (eitanIsCrew())
	{
		output("\n\nYou ask if it’s really morning. <i>“I don’t know,”</i> he answers, shuffling his body against yours to better get comfortable against you. <i>“I have no sense of time in this ship. I just said it was because I thought that’s what your culture says when someone wakes up.”</i>");
		output("\n\nYou sigh and lower your head against his forearm. You should really try and teach him how to read a clock.");
	}
	// PC is on Uveto
	else
	{
		if (hours < 2 || hours >= 17) output("\n\nYou start in his grip. Did you two really go until <i>morning?</i> <i>“No, it’s currently evening,”</i> he says, tightening his grip on you to keep you from disturbing your mutual rest. <i>“I just thought saying it’s ‘morning’ is a thing your culture does when someone is awake. But if you’d like to mate until morning, that would be no problem.”</i>\n\nYou sigh and lower your head against his forearm. As tempting as the offer is, you’re a bit tuckered out. Maybe next time.");
		else if (hours < 12) output("\n\nYou ask if it’s indeed morning. <i>“It is. Is that... surprising to you?”</i>\n\nYou sigh and lower your head against his forearm. You suppose not, given when you started. Maybe you should try and get your sleep schedule in order...");
		else output("\n\nYou ask if it’s really morning. <i>“No, it’s the afternoon. Your culture tells others that it’s morning when they wake up, don’t you?”</i>\n\nYou sigh and lower your head against his forearm. Whatever, he’ll figure it out someday.");
	}

	// Merge
	output("\n\nYou can feel the bulge of his enormous cock press against the crease of your [pc.ass] as you shuffle against him. You replay what you two had done just a scant few hours ago: with every motion you recall, your body aches in both exertion and in pleasure, pleading with you to rest for another few hours and begging you for more of Eitan’s masterful and unique brand of lovemaking.");
	switch (sceneArgs.id)
	{
		default: case 0: output(" Your poor [pc.vagOrAss " + sceneArgs.vagIdx + "] is still flinching and relaxing, trying to reset back to <i>before</i> it had a cock as large as Eitan’s inside it. Your " + (sceneArgs.vagIdx < 0 ? "belly" : "womb") + " still feels full to the brim, and with every little jostle of your body, you can feel it sloshing around inside you. It’ll take a while before you’re done with however many loads he put inside you..."); break;
		case 1: 
			for (var loads:int = rand(2) + rand(2); loads > 0; loads--) pc.loadInMouth(getEitan());
			output(" Your [pc.lips] feel stretched and battered, worse for wear, and your [pc.belly] is bloated with his jizz – you aren’t sure how many more loads he put into you when you blacked out, and it’s entirely possible that he only put in the two. You can still taste his cock on your tongue and the feel of his balls on your chin, but they’re pale phantoms compared to the real thing...");
			break;
		case 2: output("\n\nIf Eitan is thinking about your last session himself, his body language isn’t showing it: he’s fairly calm against your body (bulge against your butt notwithstanding), holding you close to him and grooming your " + (pc.hasHair() ? "hair" : "scalp") + " while you two relax. You feel like you’re wearing a giant, fuzzy, breathing quilt that’s got you wrapped up nice and snug. You can feel his heartbeat through his muscular chest against you."); break;
		case 3:
			if (pc.hasVagina()) output(" Your [pc.vagina " + sceneArgs.genIdx + "] is still shaking and giving little tremors of pleasure through you as you recall the feel of Eitan’s big, thick tongue coiling and moving inside you. Eitan’s technique was so unique and specific to him that, with every shift of your [pc.thighs], you can still imagine him beneath you, face-deep into your muff, twisting his tongue around inside you and making you cum again...");
			else output(" Your [pc.cock " + sceneArgs.genIdx + "] hangs limp against your inner thigh, but the feel of his long, thick, wet tongue coiling around your meat and urging the cum from your body is not only impossible to forget, but it’s getting you a little hard just thinking about it. Despite his inability to literally suck, and even though he’s probably not as enthusiastic about sucking dick as he probably is about eating pussy, it’s obvious that it’s not the first time he’s done it...");
			break;
	}
	output("\n\nFuck it. You don’t have anywhere to be anytime soon, and even if you did, Eitan isn’t about to let you get up and go do it. You close your eyes again and head back to sleep in his embrace.");

	addButton(0, "Next", gettingACatnapWithEitan);
}

public function gettingACatnapWithEitan():void
{
	clearMenu();
	clearOutput();
	clearBust();
	showName("");
	author("B");
	processTime(90+rand(31));
 
	output("When you awake again, you’re still wrapped up nice and snug in some bedsheets, but Eitan isn’t with you. It feels distinctly colder than before, although you admit that it’s nice to have some freedom of movement to yourself.");
	output("\n\nYou sit up in the bed, " + (eitanIsCrew() ? "looking around Eitan’s quarters. He’s a big guy, and his personal quarters aren’t that large, so he’d be difficult to miss, but he isn’t anywhere in sight. He must be touring the ship on his own." : "scanning the alpha’s tent through the wispy-thin sheets, trying to find Eitan. He’s difficult to miss, with a body like his: he’s sitting in the center pit, lounging as he was when you first saw him. At least he didn’t go too far."));
	output("\n\nYou get up and reach for your effects, presenting yourself as you were before your vigorous lovemaking. One you’re good and ready, you leave, making for " + (eitanIsCrew() ? "the bridge of your ship." : "the common room of the alpha’s tent."));

	IncrementFlag("EITAN_SEXED");

	addButton(0, "Next", (eitanIsCrew() ? mainGameMenu : goIntoEitansTent));
}

public function takeEitanForAPracticeRun():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(1+rand(2));

	// First time
	if (flags["EITAN_SPARRED"] == undefined)
	{
		processTime(3);
		output("You ask Eitan how he keeps in shape ever since you got him out of the mines. You understand that he’s had a... particular lifestyle before his failed invasion of the korgonne Hold, and although he hasn’t done anything violent since then (which you congratulate), you also aren’t sure how he manages to keep the massive, muscular form he’s maintained since then.");
		output("\n\n<i>“" + (eitanIsCrew() ? "Not a lot,”</i> he replies. <i>“The food is plentiful, and there is no place for me to hunt larger game, so my hunting skills are wasted here. Your ship has equipment that’s good for maintaining a person’s body, but I still haven’t gotten used to using them. And, on Uveto, there was no shortage of prospective mates to keep me busy – mating is an excellent way to keep in shape, but the pickings are far slimmer here" : "There are lots of ways to keep a body as strong as mine, especially in a world as unforgiving as ours,”</i> he says. <i>“Whenever you aren’t around, I try to keep busy by joining the hunting packs and bringing home food for the tribe. Mating is also a decent way to keep in shape as well") + "”</i>, he laughs. <i>“Why do you ask?”</i>");
		output("\n\nIn turn, you answer his question with a question: is he familiar with the concept of ‘sparring?’");
		output("\n\n<i>“Yes,”</i> he answers. <i>“It’s mock-combat in a controlled environment.”</i> He turns his gaze askance and raises an eyebrow at you. <i>“Are you suggesting we fight, [pc.name] Steele?”</i>");
		output("\n\nIf anyone’s proven that they can handle someone with Eitan’s size, it would be yourself, you respond. He’s done well in maintaining his aggression, but it could still be useful, and even healthy, to have an outlet from time to time. If he wants to keep his body strong and his instincts sharp, fighting against you in, as he described it, a controlled environment, could be a good way to get in some exercise and to let out those building combative instincts.");
		output("\n\nHe isn’t convinced, and in fact, his eyebrows crease as he considers your response. <i>“Is that safe?”</i> he asks. <i>“I’ve done a lot of soul-searching to try this newer, more passive lifestyle, [pc.name] Steele, and I’m worried that fighting might make me... prefer my older lifestyle again.”</i>");
		output("\n\nYou tell him that if he doesn’t want to, you two don’t have to. But if he <i>does</i> ever regress, it’d be better to do it against you, when you’ve proven that you can beat him, in a place where you two have control over whatever happens during your sparring session.");
		output("\n\nEitan hums, his hand against his chin as he considers your words. <i>“Fine,”</i> he says after a bit. He stands. <i>“I suppose you’re right in that there would be nobody else would be a better training partner.");
		if (eitanIsCrew())
		{
			output(" But this room is too small for us to spar in.”</i>");
			output("\n\nYou generally keep the ship’s hold sparsely occupied: it wouldn’t take much effort to move things around and give you two a larger space to work with. It’s a short trip down into the ship’s belly, and, as you had said, it’s just a matter of moving some things around and cleaning the hold up a bit until you two have an arena large enough for a decent sparring session.");
		}
		else
		{
			output(" We can start right here.”</i>");
			output("\n\nYou stand along with him and help him tidy up the common room, giving you two a larger arena to move around in. Once it’s cleared away, it’s just you and Eitan, and he’s ready to square off against you.");
		}
		output("\n\n<i>“When you’re ready,”</i> he says, putting one foot in front of the other and raising both clawed hands in front of himself.");
		output("\n\n<b>You’re sparring against Eitan!</b>");
	}	 
	// Subsequent times
	else
	{
		output("You ask Eitan if he’s in the mood for another sparring match. You wouldn’t want either of you to lose your edge, and he’s a strong and cunning enough opponent to keep you on your toes.");
		output("\n\n<i>“If you’d like,”</i> he answers, pulling himself to his feet. <i>“I haven’t seen much action since after I was released from the korgonne. Fighting is good for the blood.”</i>");
		output("\n\nIt’s a short ritual between you two to get the arena set up: " + (eitanIsCrew() ? "you head to the ship’s cargo hold, where it’s just a matter of arranging what little cargo you have down there a bit" : "you clear the common room of its cushions and pillows until it’s wide and bare") + ", giving you two a wide, somewhat-circular arena for you two to move freely in.");
		output("\n\n<i>“When you’re ready,”</i> he says, putting one foot in front of the other and raising both clawed hands in front of himself.");
		output("\n\n<b>You’re sparring against Eitan!</b>");
	}

	IncrementFlag("EITAN_SPARRED");

	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(getEitan());	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(eitanGoesDownOnceAgain);
	CombatManager.lossScene(eitanBeatsThePCWithoutBadEnding);
	CombatManager.displayLocation("SPARRING");

	addButton(0, "Spar!", CombatManager.beginCombat);
}


public function eitanGoesDownOnceAgain():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(1);

	// PC wins via HP
	if (enemy.HP() <= 0)
	{
		output("Eitan stumbles backward after that last blow, then crumples to one knee, his fist falling to the floor for balance. He pants, his gaze cast downward, trying to recollect himself. He hasn’t admitted defeat, but it’s obvious between you two: if this were a real fight, you could have ended it as soon as he lost his balance and turned his eyes away.");
		output("\n\nYou approach Eitan and extend your hand to him, offering to pull him to his feet. His eyes rise when he sees your feet, and he looks at your hand. He doesn’t take it immediately.");
		output("\n\n<i>“It may just be a spar,”</i> he says, <i>“but defeat doesn’t sting any less.”</i> He rejects your offer and stands under his own power, his legs wobbling and his body crunching in pain when he tries to stretch his torso. You don’t blame him for being prideful: he’s the alpha of the milodan, the strongest of them all, and just because you’ve changed his attitude and perceptions towards others, that doesn’t mean he doesn’t expect more from himself.");
		output("\n\n<i>“Still,”</i> he says, wincing under his breath, <i>“you’re a powerful opponent, [pc.name] Steele. Better I lose to you and learn something about it than to anyone lesser than you or me.”</i>");
		output("\n\nThat’s a huge compliment, coming from him.");

		CombatManager.abortCombat();
	}
	// PC wins via Lust
	else
	{
		showEitan(true);

		output("Finally, Eitan can take no more. " + (eitanIsCrew() ? "His uniform displays the flexibility in its fabric by clinging to his body even as his <i>raging</i> erection fully tents it, displaying to any eyes that can see precisely how enormous he is. The only thing protecting it from the cool, recycled air of your ship is a flimsy zipper. Grunting in frustration, he fumbles with the zipper at first, but his claws don’t have an easy time gripping the pulley – so, instead, he grips both sides of the fabric and <i>pulls,</i> yanking the zipper’s teeth apart with his sheer strength. His cock springs to life from the opening, standing a full foot from his body." : "His loincloth does nothing to hide the <i>raging</i> erection you’ve given him – in fact, with the way the fabric drapes over the extended spire of his cock, just barely long enough to conceal him up to his tip, you’d argue it actually makes it <i>more</i> obvious. Grunting in frustration, he rips at the spindly threads around his waist, discarding the whole thing and baring his all to you."));
		output("\n\n<i>“Damn you, [pc.name] Steele,”</i> he curses under his breath, sinking to both knees and masturbating in front of you. The ‘plap plap’ of both his hands furiously beating his meat in front of you is the only sound of aggression left between you two. <i>“I was expecting you to fight like a warrior, not like a temptress.”</i>");
		output("\n\nYou laugh and ask him if this is any way for a warrior to <i>lose.</i>");
		output("\n\n<i>“I don’t need your chiding,”</i> he says back, although his tone is higher, almost as if he’s whining to you. <i>“I need you to finish me off! I submit already, just... just...!”</i>");
		output("\n\nEitan looks like he could <i>really</i> use a hand – or some other body part – and he’s in a rare position where he’s vulnerable enough to <i>beg</i> for you to get him off. Normally, he’s the one on top, but now you have all the power.");
		output("\n\nHow would you like to use it?");
		output("\n\n");

		pc.maxOutLust();
		CombatManager.showCombatUI();

		if (pc.hasCock()) addButton(0, "With Penis", penisRouter, [eitanGetsAConsolationDicking, pc.biggestCockVolume()+1, false], "With Penis", (pc.shortestCockLength() > 17 ? "You’re too large for Eitan to take to the base, but you’ll be damned if you aren’t going to pass up the opportunity to fuck his ass with whatever you can fit!" : "To be honest, there’s a part of you that’s wanted to really put Eitan in his place ever since the siege, and putting your dick in his firm, muscular butt will probably do it..."));
		else addDisabledButton(0, "With Penis", "With Penis", "Well, fuck.");

		addButton(1, (pc.hasVagina() ? "With Pussy" : "With Ass"), vaginaRouter, [showEitanTheTruePowerOfTheBottom, enemy.cockVolume(0), 1, 0], (pc.hasVagina() ? "With Pussy" : "With Ass"), (pc.hasVagina() ? "Eitan is so full of machismo that he probably thinks he <i>can’t</i> be dominated by a vagina. This will set him straight for sure." : "You wouldn’t be surprised if Eitan always thought that only submissive bottoms got fucked in the butt. Won’t he be in for a surprise!"));
	}
}

public function eitanBeatsThePCWithoutBadEnding():void
{
	clearMenu();
	clearOutput();
	showEitan();

	// PC loses via HP
	if (pc.HP() <= 0)
	{
		processTime(1);
		output("You double over from that last blow, unable to maintain your balance. You crumple in pain and slump, your eyes cast to the floor between you and Eitan. You don’t admit defeat, but that’s only because you can’t get the words out – Eitan’s won this time, and it’s obvious to you both.");
		output("\n\nEitan" + (enemy.lust() < 50 ? ", recognizing that the spar is over, relaxes his stance and steps toward you. You lift your head just high enough to see him extend his furry hand to you." : " lurches towards you, then hesitates. You look up to see him and his body – particularly, the tent he’s made in his " + (eitanIsCrew() ? "uniform" : "loincloth") + ". You’ve put on a bit of a display for him during that fight, and you’ve gotten him randy enough to want to do something about it, but he doesn’t act. Before you changed his way of thinking, he probably would have taken you right then and there. Instead, he extends something else in your direction: his hand.") + " <i>“It was a good fight, [pc.name] Steele,”</i> he says.");
		if (pc.isAss()) output("\n\nYour body is in a lot of pain, and taking his help to stand would be the easy way out – but you’re not one to take the easy routes, and it’s a bit of a sting to lose to Eitan after you had already proven that you can beat him in less-fair circumstances. You refuse his hand and, although your body aches, you right yourself under your own power.");
		else output("\n\nYou take a moment to yourself, waiting for the pain in your body to ease, before you accept his hand and pull yourself upright. Your body hurts and would rather go back to its hunched-over state, but at least you’re upright.");
		output("\n\n<i>“You should take this loss as a compliment,”</i> he says, already getting back to work reassembling the space as you two had it before you started. <i>“I’ve had to change my train of thought in order to beat you in a fight. Nobody’s ever pushed me the way you have.”</i> He laughs, mostly to himself. <i>“Better that I won this fight than the one we had in the korgonne Hold.”</i>");
		output("\n\nWell... he’s certainly right about that.");
	}
	else
	{
		showEitan(true);
		processTime(45+rand(2*60+31));

		var hole:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);

		output("You sink to your knees, unable to contain yourself any longer in front of Eitan.");
		output("\n\nIf you’re honest with yourself, a part of you had always found Eitan undeniably attractive, and it was always a shame you two had met with such opposition. Eitan is the alpha of the milodan, and he has the form to prove it: the rippling muscles that can hold you close and keep you warm – or pin you down and hold you still; he’s thick in all the most perfect, delicious spots; and you can hardly keep yourself from salivating at the thought of his big, meaty milodan cock–");
		output("\n\nYou’re hardly being subtle with your fantasies, given your position, on your knees in front of Eitan in what was supposed to be a sparring session. Your hand had unconsciously found its way between your [pc.thighs], playing with " + (pc.isHerm() || !pc.hasGenitals() ? "whatever it can find" : (pc.hasCock() ? "[pc.cock]" : "[pc.vagina " + hole + "]")));
		if (pc.isCrotchGarbed()) output(" underneath the waistline of your [pc.lowerGarments]");
		output(". You must look like a real thirsty slut in front of him.");
		output("\n\nHe, at least, doesn’t seem to mind the display. He casually steps toward you, all pretences of this being an honest sparring session totally forgotten by now. <i>“Oh, [pc.name] Steele,”</i> he sighs, his own hand thumbing at the line of his " + (eitanIsCrew() ? "uniform" : "loincloth") + ". His other hand gently plays with your [pc.hair] once he’s in reach.");
		output("\n\n<i>“If all you wanted was to be treated like a common slut, you could have just asked.”</i> Suddenly, he yanks on your head, mashing your face into the bulge of his lower clothes. The tip of his rapidly-stiffening cock jabs against your upper lip; it’s already stained and wet from his own arousal. <i>“Take a deep breath.”</i>");
		output("\n\nYou obey the command without registering it, and you take a great, big sigh through your nose, taking in Eitan’s wet musk. It makes your eyes cross, and you’re suddenly much thirstier than you were just a moment ago. The hard bulge of his cock grows larger and firmer, and he rocks his hips forward in time with your breath, dragging the cloth barely containing his erection across your face. You lean into him and his cock, letting it scrape across your cheek.");
		output("\n\nWith a lusty growl, Eitan " + (eitanIsCrew() ? "fumbles with the pants of his uniform at first, before digging his claws into the crease down its front and giving it a yank, pulling them apart and letting both halves of his pants fall to two pieces. You’re... pretty sure it’s designed to do that" : "snaps the spindly strand keeping his loincloth in place with one claw, letting it fall to the side and bearing his whole to you") + ". You hardly give the discarded clothing a second thought: what has your undivided attention is the rock-hard obelisk of prime milodan man-meat throbbing at its full, twelve-and-a-half-inch mast, across the bridge of your nose. A dollop of his musky pre beads at his pointed tip and drips steadily onto your cheek.");
		output("\n\n<i>“Another deep breath,”</i> he instructs again, pulling your nose to his base, where his quickly-billowing knot meets his sheath. He grinds your nose right into the base, digging you nostril-deep into the spongy flesh of his cock-pocket. When you breathe, it’s more of a reflex than you obeying any instruction, and your nose is submerged in the earthy tang of Eitan’s hot, wafting musk, getting it straight from the source.");
		output("\n\nYou can’t help but pant like a dog, lolling tongue and all, and Eitan it quick to put that to work too: as soon as he feels your hot breath against his balls, he thrusts his hips forward, ramming the broad side of his right, fat, fist-sized nut against your mouth. You hardly register the texture of his fur; you’re overwhelmed by the scent and the taste of <i>him,</i> and it’s so overpowering, your body runs on its own when your tongue licks at it and your lips purse against it over and over. You get so distracted by your primeval instincts that Eitan needs to manually guide you to his left nut and give it just as thorough a bath.");
		output("\n\nEitan lets you go at your own pace for another moment, breathing through your nose (which is still dutifully buried in his stretched-taut sheath) and licking at his sack, while he masturbates his length above you. You can feel his pre drip down from his tip and land on the nape of your neck, and every other lick you make, another drop slides down your spine.");
		output("\n\nHe grunts in both pleasure and frustration, then pulls back, leaving you to take a breath of some clean, untainted air – but only for a moment, because as soon as he realigns himself, your mouth is filled from [pc.lips] to throat with his burgeoning, needy cock, filling every little crevice in your mouth with his meat. In one frantic, horny thrust, he sinks down to his knot, pressed tightly against your face; he doesn’t even give you time to adjust.");
		output("\n\nTime passes by in a hazy blur after that: you stay on your knees in front of your big, strong, sexy, alpha milodan, while he fucks your throat. Both of his hands find either side of your skull, holding you in place, while he jackhammers his muscular hips against you, his enormous balls slapping you in the neck with every inward swing. He’s fucking your mouth like it’s been a fantasy of his for years – hell, maybe he’s always found you attractive, too, and this is the only opportunity he’s had since you two met to really cut loose and enjoy you the way he’s wanted to.");
		output("\n\nHe occasionally grunts, but you don’t think he says anything in between the viscous pounds he’s giving your mouth. Not that you could understand any words he says anyway: you’re far too distracted by the taste of his cock against your [pc.tongue], and the sight of his abs crunching with every thrust in, and the feel of his churning balls battering your chin, and the sound of his knot clapping against your [pc.lips]–");
		output("\n\nEither you’re <i>so</i> out of it that you’ve lost track of time, or Eitan was much closer than you expected, because after only a few, blissful moments of you letting Eitan abuse your throat, he’s already hunched over you, teeth clenched, breath held, and you can feel his cock throb and expand in your gullet. You know he’s cumming, particularly from your throat reflexively swallowing his hot seed, but, to your mild dismay, you can’t taste any of it – he’s so deep in your throat that it’s going past your tongue.");
		output("\n\nStill, there’s a type of sexual solace to kneeling there, mostly-limp, while your big, strong, sexy partner unloads gout after stomach-stretching gout into your belly. Your nose is crammed into the bottom of his abdomen, and his balls repeatedly pull and clench against your chin with every fresh new load. It’s kind of relaxing, in a way, knowing that you’ve gotten him off so strongly and you barely had to move a muscle to do it.");
		output("\n\nAs soon as you think that thought, though, Eitan withdraws his cock, still shaking and unloading his cream wherever he has the sense to point it. A thick strand is left along the flat of your tongue, and the next goes across your face, streaking over your right eye and landing on your scalp. You think to lean forward, to maybe take the tip in between your lips and suck the jizz from his geyser of a cock like the good [pc.boyGirl] cumdump you are, but before you act, Eitan’s hands are on you again.");
		output("\n\nWith a twist and a shove, you’re pushed face-down onto the floor – the motion makes you a bit dizzy, especially with the heavy, creamy load jostling with your every motion now settling in your [pc.belly]. Before you can ask him what he’s doing, or even try to help him get there, his hands are on your [pc.hips]");
		if (pc.isCrotchGarbed()) output(" and his fingers in the waistband of your [pc.lowerGarments], stretching them with two powerful yanks and pulling them down over the swell of your thighs, exposing you to him. With all obstructions out of the way,");
		output(" and he pulls your [pc.ass] up, arching your back against his grip.");
		output("\n\nYou can hardly believe the sort of sexual aggression Eitan is putting out right now. You must have really gotten him in the mood with your sorry excuse for a sparring session.");
		output("\n\nEitan doesn’t even need to aim where he’s going: he’s so experienced with fucking someone else in this position that he could nail his target on the first try with his eyes closed. True to form, with a single thrust, and with both of his hands on your shoulders to keep you in place, the tip of his cock finds your [pc.vagOrAss " + hole + "], and he digs himself a few inches deep in the first thrust.");
		if (hole < 0) pc.buttChange(enemy.cockVolume(0));
		else pc.cuntChange(hole, enemy.cockVolume(0));
		output("\n\nIt’s all so much for you to process: from the musk-and-ball worship, to the rapid-fire oral and swallowing what must have been damn near half a cup of cum, if not more, and he’s not only still hard, but it only took him a second to go straight to fucking you properly. You can’t help but cum on his cock once he sinks down a few more inches,");
		if (hole < 0)
		{
			output("your body clenching and gripping on his shaft");
			if (pc.hasCock()) output(", your own [pc.cock] shooting your [pc.cum] into long [pc.cumColor] streaks on the floor");
		}
		else output("your [pc.vagina " + hole + "] clamping and moistening around his shaft");
		output(", making it a bit tougher for him to slide home into you – not that that matters to you, and not that that’ll stop him. It was a forgone conclusion from the start that you’re taking that knot of his.");
		output("\n\nYour world is a dizzying mess of him thrusting and manhandling your body to his liking, and you begging him for more. Not with words – you couldn’t make a coherent sentence if you tried – but with your body, and with your pleading grunts and moans. Every noise you make, from the little squeaks to the whorish moans, drives him to fuck you deeper and harder. It’s only a few moments before he’s down to his knot, and you can feel his balls slap into your [pc.thighs], already working to squirt another fresh load into your other end.");
		output("\n\n<i>“You are many things, [pc.name] Steele,”</i> Eitan tells you, his voice strained and his breathing shallow from all the rampant, hardcore sex. <i>“And one thing you are is bottom bitch worthy of an alpha.”</i> His body leans over you, and you feel his thick, muscular, furry chest bearing down on your back. His mouth is right next to your ear, and you can feel the breath huff from his nostrils in exertion. <i>“I’ll be glad to put a load in that thirsty mouth of yours whenever you ask.”</i>");
		output("\n\nWhether it’s because he’s fucking your brains through your ears, or just because he’s right, you can’t help but cum a second time; the strength leaves your arms and you collapse beneath him, lying flat on your [pc.chest]. Your [pc.ass] stays up in the air, not because you have the strength in your knees to keep it up, but because it’s suspended there by Eitan’s impaling, thrusting cock. His knot pushes and batters against your [pc.vagOrAss], and from the sound of Eitan’s grunting, you’re about to take the whole thing in just a moment....");
		output("\n\nAfter just a few more thrusts, your prediction comes true: Eitan tenses above you and hisses through clenched teeth as his hips make one final thrust in, forcing your body to yield to his insistent advance. You can feel your [pc.vagOrAss] split apart to accommodate his immense girth, but, coming from two orgasms one right after the other, there’s hardly any pain; all you want is for him to lock you two together by the girth of his fat fucking cock and for him to dump another load or four straight into your " + (hole < 0 ? "ass. If he can bring you to such orgasmic highs just by ploughing your asshole until it’s turned to mush, maybe being his regular bottom bitch isn’t such a bad idea..." : "womb. The thought of him giving you little alpha milodan babies briefly flashes in your mind’s eye..."));
		output("\n\nThe best part comes after he’s good and locked to you: you can feel his giant nuts grind up against your [pc.thigh] as they clench and unload, dumping the first thick, juicy wad of his cum straight into you willing body. You can feel his cum drive up his shaft, bloating it inside you, and you can feel his cock’s tip expand before dumping its payload right into your body. " + (hole < 0 ? "Your [pc.belly], already fairly taxed with the full meal he had given you just minutes before, stretches taut and expands slightly from the first load alone, and he has so much more than that to give – and with his knot firmly in place, you’re just going to have to deal with it." : "Your womb feels like it fills to capacity with just that one blast, and yet you know he’s got so much more than that to give – and with his knot good and tied to you, none of it is going anywhere."));
		output("\n\nThe second load he fires off makes you feel like you’re a balloon, and you’re being given a stress test to see just how much you can take before you can pop. Your abdomen rounds out with his liquid weight, sagging with his prodigal load and audibly gurgling with effort in trying to contain it all.");
		output("\n\nYou can’t help but orgasm a third time with the third load – the sensation of having so much inside you, filling you so totally, puts you over that razor-thin precipice yet again. Some dumb, lizard-like part of your psyche is <i>thrilled</i> that you’ve not only pleasured your mate, but you’re being rewarded with enough cum to " + (hole < 0 ? "damn near feed a village" : "sire a family of quintuplets") + ", at the rate he’s pumping it into you.");
		output("\n\nBy the fourth load–");
		output("\n\n...");
		output("\n\nYou’ve passed out.");
		output("\n\nYou wake up on the floor of " + (eitanIsCrew() ? "your cargo hold" : "the alpha’s tent in the milodan village") + ". Your lower half feels cold, soaked, and a bit sore. The last thing you clearly remember is sparring with Eitan – the last thing you <i>hazily</i> remember is him pounding your [pc.vagOrAss] and making you cum until... well, until you passed out, clearly.");
		output("\n\nYou cast your eyes around the room for Eitan, but he isn’t anywhere to be found at the moment. When you try to move, you feel the soreness in your [pc.vagOrAss] bite you back, and you can feel his jizz flowing from your gaping hole and down your [pc.thigh]. Your [pc.belly] is still rounded with his cum sloshing around inside you, as proof of his obscene virility – the virility of an alpha milodan, for sure.");
		output("\n\nYou take another moment to yourself before you try to stand. It takes a bit of effort and time until you can pull yourself to your [pc.footOrFeet], and even then, it’s on");
		if (!pc.hasLegs()) output(" a");
		output(" wobbly, rickety [pc.legOrLegs]. It’s even more effort to gather your effects" + (pc.isCrotchGarbed() ? " and to retrieve your discarded [pc.lowerGarments]." : "."));
		output("\n\nMaybe you’ll " + (eitanIsCrew() ? "go do your rounds for a little bit, to try and" : "take a quick walk around the tribe, just to") + " get the feeling back in your whole body – and maybe work off a bit of this water weight you’ve tacked on. You doubt Eitan will be hard to find by the time you’re done.");

		// end scene (scene: PC Gon’ Get It); reduce Lust to 0; if in the tent, place the PC one square outside the tent; if in the ship, display the ship’s main menu; give the PC the Vaginally or Anally-Filled statuses
		pc.orgasm();
		enemy.orgasm();
		if (hole < 0) pc.loadInAss(enemy);
		else pc.loadInCunt(enemy, hole);

		IncrementFlag("EITAN_SPAR_LOSS_SEX");
	}

	CombatManager.abortCombat();
}

public function eitanGetsAConsolationDicking(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showEitan(true);
	processTime(25+rand(46));

	var tooBig:Boolean = pc.cLength(cockIdx) > 17;

	output("You step toward Eitan, your arms crossed under your [pc.chest]. The bulge of your [pc.cock " + cockIdx + "] is as obvious to him as it is to you: the sight of big, strong, powerful Eitan, on his knees and begging for relief after your <i>particular</i> brand of combat has gotten you roused and ready.");
	output("\n\nBut you’re not going to be the one to start. If Eitan wants it that badly, he’ll work for it himself. You tell him as much and instruct him to start by claiming his prize.");
	if (pc.isCrotchGarbed())
	{
		output("\n\nEitan is eager: his hands fly to your [pc.crotchCover], but he fumbles with getting your equipment off like had with his own. You sharply tell him not to damage your gear, and he obeys, but he grunts and scowls in frustration the longer he goes without getting you naked so he can sate the fire you’ve stoked inside him. It takes him nearly a minute of trying to work his sausage fingers and thick claws into getting your gear to loosen, but his every struggle is your entertainment, and you make no move to assist. Every time his hands brush into the tent of your [pc.cock " + cockIdx + "], it bloats and flexes, a little damp spot creasing through the material.");
		output("\n\nIn truth, as fun as it is to see Eitan so frustrated with getting your gear loose, it’s difficult to not just undo them yourself and get right to it. But, you’re in a rare position to not only dominate Eitan, but to have him willingly submit to you. You don’t want to pass up the opportunity.");
		output("\n\nEventually (and blissfully), Eitan manages to figure it out, and he pulls your [pc.crotchCovers] loose around your [pc.hips]. With an excited tug, you’re left naked from the waist down, with your [pc.cock " + cockIdx + "] standing on end and ready for the <i>real</i> show to start.");
	}
	output("\n\n<i>“For anyone else, [pc.name] Steele, I would have just taken the loss and then fucked my own hand to calm down,”</i> he clarifies through his drooling mouth. <i>“But there’s something about you. I don’t know if it’s the way you fight, or if it’s something else. All I know is....”</i> He glances at your [pc.cock " + cockIdx + "], and his eyes do not look back up to yours. <i>“It’s you I need right now.”</i>");
	output("\n\n");
	if (tooBig) output("Eitan hesitates at the sheer size of you – the air swishes and almost audibly cuts when your enormous cock springs to action. But he doesn’t respond well to intimidation. ");
	output("Without instruction, Eitan leans in and takes your meat into his mouth, running his broad, prickly tongue along the underside of your shaft and pinning your [pc.cockHead " + cockIdx + "] against the roof of his mouth. He");
	if (tooBig) output(" can’t even make it halfway down you, but that’s okay with you, and that doesn’t stop him. He also");
	output(" can’t close his lips around your shaft because his saber teeth would force him to bite into it – something neither of you want, that’s for sure – so instead of sucking like a thirsty whore, his technique is more of an elaborate, and <i>eager</i>, tongue-bath.");
	output("\n\nYou place your hand on Eitan’s head and run your fingers through his blue mohawk as he sucks you into his gullet, tasting your flesh and coaxing your pre with every slow, but firm and thorough, pass of his tongue on your shaft. You say nothing; the physical contact ought to be communication enough.");
	output("\n\nEitan’s hands find your [pc.hips], and he grabs two big, thick handfuls, squeezing your body and yanking you closer to his own. He keeps his head still, trapping you in the confines of his mouth");
	if (tooBig) output(" , which is a brave move");
	output(". Once you’re as deep as you’re going to get");
	if (!tooBig)
	{
		output(", with his neck bulging, his lips against your [pc.base " + cockIdx + "], his nose against your abdomen");
		if (pc.balls > 0) output(", and your [pc.balls] against his chin");
	}
	output(", he takes a deep breath through his nose, taking in as much of your scent as he can through the throatful of cock he’s got stuffed in there. He pauses, and his eyes cross just a little, before he resumes.");
	output("\n\nYou can’t deny that Eitan’s cock-hungry, cum-guzzling, submissive attitude isn’t a hell of a turn on, and you think he might be trying to get you to cum into his mouth for one reason or another – either that’s how he wants to get himself off, or maybe he’s forgotten just how horny he is himself. Either way, as easy as it would be to just stand there and blow a load in Eitan’s throat, this isn’t how you want this to end.");
	output("\n\nYou grab a fistful of his hair and yank, just hard enough for him to get the picture. Extracting your cock from his mouth is slow, and his tongue coils and licks every inch it can as you withdraw from his gullet. The air of the room is cool against your spit-dripping [pc.cock " + cockIdx + "] – it’d be a waste to not put it somewhere warmer right away. You tell Eitan to turn over.");
	if (tooBig) output("\n\nHe doesn’t follow your instruction with the same eagerness as all the others. His eyes flit to your erect, bobbing, overweight and oversized cock, and he shivers at the thought of taking something that big into himself. But, like he said, it’s you he needs, and his lust overcomes his fear.");
	else output("\n\nHe does as you say, but he’s a bit slower than you had expected him to be. Once he’s on his knees and elbows, you can see why: as soon as he let go of your hip, he’s been jerking himself silly. It must have been difficult to multitask between following your instruction, beating himself off, and being so horny that he must be dizzy.");
	output("\n\nOnce he’s in position, he spreads his legs and hikes up his backside, flipping his small, bushy tail up and giving you total, unimpeded access to his asshole. You can’t imagine Eitan, the studly woman’s-man that he is, taken a lot of men up the ass, but he holds the position easily and even somewhat naturally. You can see the thick muscles on his thighs, down to his calves, flex with practiced ease, and his normally tight-and-firm ass is more relaxed than normal – maybe he takes these positions as part of his regular body-building, like a type of pseudo-yoga?");
	output("\n\nYou take a moment to admire his form when you step up behind him, although you keep his mind busy and yourself entertained by flopping your cock in between his asscheeks. Your hands play with his strong, shapely legs, tickling at their musculature from his knees to his ass, up one leg and then down the other. There’s something so <i>visceral</i> about having someone as powerful as Eitan so desperately wanting someone like you to fuck him in the ass, and every little muscle you feel through the thick fur is just another reminder of how you’ve <i>tamed</i> him.");
	output("\n\nThat’s enough – any more fantasizing, and you’re liable to blow before you’ve even put yourself inside him. You hunch your back over his, and you back up your [pc.hips]" + (tooBig ? ", feeling every inch of your manhood glide in between those thick glutes, feeling every long strand of fur caress your length as you go" : " a bit") + ", until you can feel your [pc.cockHead " + cockIdx + "] rest against the winking star of his anal entrance. Eitan’s body flinches, but before he can get tense, and before you tease either of you any more, you thrust in.");
	output("\n\nEitan hisses through clenched teeth, and his fingers curl into white-tipped fists, as you slide yourself into his asshole, but he doesn’t show any sign of wanting you to stop. The very thorough lubing he gave you earlier comes through for you both in a big way:");
	if (tooBig) output(" despite your immensity,");
	output(" it’s a smooth push into his tight ass.");
	pc.cockChange();
	if (tooBig) output("\n\nYou figured from the beginning that you weren’t going to get every last inch of yourself into Eitan’s body – as big as he is, and as strong as he’s made his body, your cock would impale him like a spear if you thrust the whole thing into him at once. But that doesn’t mean you aren’t going to shove in what you can: you doubt you’ll get many opportunities like this again (at least, not without seducing him like you did, of course), so you take what you can get when you can get it.");
	output("\n\nFucking Eitan is just like fucking anyone else’s ass: you don’t just shove it all in at once. You do a little bit; then, you pause so you can adjust to being inside someone, and he can adjust to having someone inside him; then you start again and get yourself a little deeper. But unlike just anyone else, Eitan’s body is built like a fucking rock, and his reflexive clenching isn’t making things any more expedient for either of you.");
	output("\n\n" + (tooBig ? "On one particularly deep thrust, Eitan winces and his body straightens reflexively. Unfortunately, it looks like you’ve hit his limit" : "Thankfully, it isn’t too long until you bottom out, with your [pc.base " + cockIdx + "] battering up against the meat of Eitan’s ass") + ". You’re as deep as you’re going to get");
	if (pc.hasKnot(cockIdx) && !tooBig) output(" – for now");
	output(" – and that means it’s time to <i>fuck</i> his ass like the silly, horny little backdoor slut like he’s made himself out to be.");
	output("\n\nYou right your upper body, your hands resting on his hips for leverage, as you pull back in one forceful swing, and then <i>ram</i> yourself back into him, your body clapping against his like flesh on clay. Eitan grunts in pleasure beneath you, his face burying into the floor below, when you do it again, and he makes no overt, obvious movement when you proceed at your own greedy pace, fucking his ass like you <i>mean</i> it.");
	output("\n\nIn some part of your head, you wonder where this sudden attitude came from. You had earnestly helped him reform and establish peace between the milodan and the korgonne, and now you’re fucking his ass like it owes you money. Maybe you’ve had some pent-up, repressed sexual tension with Eitan that’s been building since the day you met, and you’re only now letting out the steam you didn’t realize you were building. Maybe it’s just easier to fuck his ass when you think about how much of an asshole he was during the siege. Whatever; he’s a tight piece of ass, and you’re reaming it for everything it’s worth.");
	output("\n\nYou bring up your right hand and slap it back down onto his asscheek, practically feeling it bounce back off from the tightness of his form. He grunts and, to your surprise, lifts his ass up and pushes back into you, wordlessly asking for more. You do it again, and the only noise out of him this time is the rush of air through his nostrils. His body shakes with pleasure, and you can still feel his hand working overtime on his own cock through the pounding you’re giving him. He wants more; you have more to give him!");
	if (tooBig) output("\n\nIt’s not long before Eitan grunts, stiffens, and clenches on your length, once you hit some limit inside of him. You’re huge by anyone’s standards, and even though you’ve still got a bit left to go – your [pc.knot " + cockIdx + "] is all that’s left, so, about a handful – you show some mercy to the poor milodan and don’t press any further. You were looking forward to the sound of your [pc.hips] slapping against his, but that’s the sacrifice you’ll have to make for getting what you can inside him.");
	else
	{
		output("\n\nBefore long, but still not long enough, you find yourself bottoming out inside of Eitan, the [pc.skinFurScales] of your [pc.hips] pressing into the thick muscle of his own.");
		if (pc.balls > 0) output(" Your [pc.balls] gently rest against his own, the skin of your sack rubbing against the gentle fuzz of his own, tickling you.");
		output(" Eitan lets out a low growl, and he shifts and shuffles his butt against you, getting you nice and nestled inside himself, adjusting to having the entirety of you inside him. His shoulders lower, and he braces himself for the fucking that you’re about to give him, and the fucking that he wants.");
	}
	output("\n\nYou lean over Eitan’s back and wrap your arms around him, placing your palms flat against his chiselled, firm chest, digging your fingers into the fur. Braced as you are, you really start <i>fucking</i> Eitan " + (tooBig ? "with everything you can safely cram into him, sawing every last inch in and out" : ", slamming your hips against his, filling the room with the clapping sound of you fucking his ass") + ". Eitan’s body coils with every thrust in and unwinds with every swing out; he even buries his face into the floor beneath himself and grunts in lust. For such a dominant top, he’s loving having your dick in his ass right now.");
	output("\n\nYou lean further over him, bringing your mouth up to his neck so he can feel your breath wash down his collarbone. You make sure he knows that he’s pleasuring you by panting right in his ear, and even moaning a bit through pursed lips.");
	output("\n\n<i>“Eitan,”</i> you whisper huskily. Like you had hoped, the sound of his name on your lips makes him pause and shiver. His ass clenches on your [pc.cock " + cockIdx + "] and pins you in place.");
	output("\n\n<i>“Cum for me,”</i> you command through a hushed breath.");
	output("\n\nLike the good boy that he is, Eitan nearly yips in both surprise and pleasure, his shoulders hunching upward, and you feel him orgasm beneath you. He loses all control over his lower body, and he doesn’t hump back against you with your thrusts anymore: the only thing he can do is jerk his cock as frantically as he can, spilling a pool of his alpha milodan cum uselessly onto the floor beneath you, as proof that, right then and there, there was another alpha in the room.");
	output("\n\nThe thought that you’ve driven him to where he is brings you to your own climax. You pull Eitan");
	if (tooBig) output("as far down you as you can");
	else
	{
		output("onto your [pc.base " + cockIdx + "]");
		if (pc.hasKnot(cockIdx)) output(", tying yourself to him, making sure that not a drop of <i>your</i> alpha jizz leaves his body");
	}
	output("; you feel it in your " + (pc.balls > 0 ? "[pc.balls]" : "groin") + " first, your [pc.cum] driving up your shaft, bloating it and filling Eitan out even further, and then you feel it in your [pc.cockHead " + cockIdx + "] as it inflates to dump your load into his body, the first sprays of your cum shooting deep into his ass.");
	if (pc.cumQ() < 250) output("\n\nYou drive your [pc.hips] in time with every gout of your [pc.cum] launching up your shaft and into his bowels. And Eitan, ever the overachiever, even when it comes to being a bottom bitch for someone, graciously takes every last drop you have for him; he doesn’t grunt in displeasure from the weight of your seed, and in fact, you feel his tail wrap around your [pc.waist], holding you closer to him while your jizz floods his asshole. If he’s so eager to be your impromptu cumdump, you’ll be happy to give him every drop he wants.");
	else if (pc.cumQ() < 3000) output("\n\nWith just one blast of your [pc.cum] inside his bowels, Eitan clenches beneath you – he knows what a big load is, and although he can’t see yours, he sure as shit can fill your cum filling out his stomach with every thick, overdone gout. Your jizz comes in thick, lingering waves: a massive load of it comes through your shaft and lasts a hot second, then there’s only a heartbeat of downtime before the second one comes and fills Eitan’s stomach out further. And it repeats again and again.");
	else output("\n\nEitan hisses through her saber teeth in surprise, and he lowers himself to brace for the obvious incoming flood of [pc.cum] in his bowels. Just <i>one</i> gout of your jizz in his body already has his normally toned, flat, six-pack abs fill out into a paunch, and you, the overachiever that you are, have oh-so-much more to give to him, and he knows it. By the time your first wave is done, Eitan needs to pant to catch his breath, and he grunts – and cums again himself – when the second wave starts.");	
	if (pc.hasKnot(cockIdx)) output(" And with your [pc.knot " + cockIdx + "] as filled out as it is inside of him, it all has nowhere else to go...");
	output("\n\nTime passes with you errantly fucking Eitan’s ass with what little room you can spare, shooting a bit more jizz a little deeper into him with every thrust forward. He grunts and clenches underneath you with every one; his hand hasn’t left his jet-black cock the whole time, spraying every last drop of his own cum onto the spreading pool of milodan cum beneath himself.");
	output("\n\n");
	if (pc.hasKnot(cockIdx)) output("It takes a few minutes filled with nothing but you resting on top of Eitan’s body, taking in his scent with every exhausted breath, until your [pc.knot " + cockIdx + "] softens enough for you to tug. ");
	output(" Eventually, you pull out");
	if (pc.cumQ() >= 250) output(", and a ton of jizz spills out with you, like you had uncorked a spigot");
	output(", leaving Eitan gaped and winking in the wake of the brutal ass-thrashing you’ve given him; you stand on wobbly [pc.legOrLegs], your [pc.cock " + cockIdx + "] still a bit hard, but flagging – it wouldn’t take much effort to get you hard enough for another go, if you wanted to fuck your newly-christened bottom some more.");
	output("\n\nBut Eitan, exhausted from everything from the fight to the hardcore sex (and probably unused to being a bottom), is nearly asleep. His eyes are closed and his body is at least somewhat relaxed, given the position he’s in.");
	output("\n\nYou decide to leave him be for now as you put your effects back on.");
	if (eitanIsCrew()) output(" Maybe you’ll go and do the rounds a bit while he rests; surely he’ll be back in his quarters" + (silly ? " and acting like nothing happened at all" : "") + " by the time you’re done.");
	else output(" Maybe you’ll show yourself around the village for a bit; surely he’ll be awake and " + (silly ? "acting like absolutely nothing happened" : "ready for anything") + " when you come back.");

	// end scene (scene: Fuck Eitan’s Butt); reduce Lust to 0; if in the tent, place the PC one square outside the tent; if in the ship, display the ship’s main menu
	pc.orgasm();
	enemy.orgasm();
	enemy.loadInAss(pc);
	IncrementFlag("EITAN_SPAR_WIN_SEX");

	CombatManager.abortCombat();
}

public function showEitanTheTruePowerOfTheBottom(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showEitan(true);
	processTime(25+rand(46));

	output("There’s something undeniably empowering about having a man, especially a man as powerful and masculine as Eitan, on their knees in front of you and furiously beating their meat because of <i>you</i>, begging you to help them get off. He looks so <i>receptive</i> to anything you might suggest, if it means getting him that sweet, sweet release he’s craving right now.");
	output("\n\nThe");
	if (pc.hasCock()) output(" truth is, you could fuck him yourself if you wanted, of course. The sexual empowerment you’re feeling is making you as hard as Eitan is right now. But... the");
	output(" sight of Eitan on his knees, footlong-cock in both his hands, his pre dribbling from his tip with every pump into his own palms – it’d be a shame to let all that sexual energy to go waste.");
	output("\n\nThat said, though, while you don’t exactly need encouragement, you could use a little <i>prep.</i> And Eitan’s face <i>happens</i> to be");
	if (pc.tallness <= 4*12+6) output(" close enough to");
	output(" level with your [pc.vagOrAss " + vagIdx + "] that it wouldn’t be much work on either of your parts to get started...");
	output("\n\n");
	if (pc.isCrotchGarbed()) output("You follow Eitan’s example and undo your [pc.lowerGarments], letting the flump into a puddle around your [pc.feet], leaving you bare from the waist down. ");
	output("Naked as he is, you turn about on the spot and look over your shoulder to him as you clap your hand against your [pc.ass]. You instruct Eitan to go down on you and get you both ready.");
	output("\n\n" + (vagIdx < 0 ? "Eitan, to your surprise, doesn’t waste any time shuffling forward and getting right to work – maybe he’s more focused on the end reward, but he’s quick to get started on rimming your asshole all the same." : "Eitan is anxious and eager to get started, and wastes no time shuffling the few inches toward you to submerge his face into your ass.") + "You feel the fuzz of the fur on his face against the sensitive cleavage of your asscheeks, and you feel his whiskers tickle and lightly scratch at the [pc.skinFurScales] of the swells of your butt; you next feel the bump of his nose against the base of your " + (pc.hasTail() ? "[pc.tail]" : "spine") + " – followed by the wet, hot sensation of a horny tongue crammed deep into your box.");
	output("\n\nHis hands clamp onto your [pc.hips] to keep you steady so he can dive deeper into the valley of your ass. Which is good foresight of him: Eitan has more enthusiasm than you were expecting, and he’s a big guy with a big, fat, squishy tongue to go with it, so as soon as you felt him dig in, the strength left your [pc.legOrLegs] and the breath left your lungs. There’s nothing to lean on nearby other than Eitan himself, so if it weren’t for those strong, tight hands on your body to hold you steady while he loudly and intensely slurps at your [pc.vagOrAss " + vagIdx + "]");
	if (vagIdx >= 0) output(", cleaning you of your pussy juices as quickly as you can make them");
	output(" to make you as wet and lubed as he can, you’d have at least fallen over by now.");
	output("\n\nHe’s <i>so</i> eager and intense about the whole thing that you’re tempted to just ride this one out: you don’t often find someone this masterful at eating " + (vagIdx < 0 ? "ass, never mind so willingly" : "cunt") + ", and you almost want to see what would happen if you just let him go until you finished on his face. " + (vagIdx < 0 ? "It’s almost like he’s forgotten that he’s about to fuck it, and he’s just an enthusiastic ass-eater that’s been starved of a damn good ass to eat for years" : "The man’s acting like he’s been starving in a harsh desert for days, and your peach is the fruit that’ll save his life (provided he doesn’t bite)") + ", given how voraciously his tongue is working you over.");
	output("\n\nEitan hums, the vibration massaging up his neck and reverberating through your body, adding to the sensation of having a milodan tongue shoved inside you over and over. He’s like your own personal, custom-made vibrator: one with hands, free-will motion, and the consciousness to <i>want</i> to please you.");
	output("\n\nBut, once he cranes his neck upward and his tongue hits a particularly deep spot inside you, you feel the familiar sensation of an orgasm starting to build up inside you. He’s so good, but it’s too soon: although you were just fantasizing about fucking his face to the end, you haven’t actually forgotten that he’s got a rock-hard cock that he can’t even tend to himself, with his hands both on your [pc.hips]. Which, with how tightly he’s holding them, and how his claws are flexing in his passion, are starting to hurt.");
	output("\n\nYou’re probably wet enough by now. You reach behind yourself and grab Eitan by the hair, clenching a big fistful of his blue locks in between your fingers, and you yank. He grunts in displeasure, but honestly, it was probably more that he was forced to stop than from any pain you might have given him.");
	output("\n\n<i>“On your back,”</i> you demand, and he obeys without a word, falling backwards; his huge, heavy body hits the floor with a loud thud, and you can feel it shake beneath the impact. Standing straight up from his pelvis, like a compass trying to guide you home, is his stiff, erect, pitch-black, footlong cock; it throbs in time with his heart, the taut shaft pulsing and his knot inflating with every second that ticks by. A droplet of pre courses down the stiff underside of his shaft, travelling over the swell of his knot and getting lost into the stretched crease of his sheath.");
	if (pc.willpower() < 25) output("\n\nHonestly, it takes some willpower of your own to not return the favor and start fellating him with the same earnestness he’s shown you, but you’ve won the fight, and <i>he</i> begged <i>you</i> for release. You are the alpha right now, and he is your willing underling: he is <i>beneath</i> you because he <i>wants</i> to be, and he needs you to be <i>his</i> alpha. You wouldn’t want all that hard work he’s done eating your [pc.vagOrAss " + vagIdx + "] to be for nothing.");
	output("\n\nEitan needs <i>some</i> action, <i>right now,</i> and the sight of his big, juicy cock isn’t doing anything to calm you down, either. No more games – you stand over Eitan’s cock and you sink " + (pc.hasKnees() ? "to your own knees" : "down") + ", grabbing him by the hot, beating knot and angling his tip toward your dripping wet and well-prepared [pc.vagOrAss " + vagIdx +"]. As soon as the tip of his cock tickles the " + (vagIdx < 0 ? "wrinkles of your [pc.asshole]" : "folds of your [pc.vagina " + vagIdx + "]") + ", Eitan can’t help but thrust himself inside, lodging himself tip-deep into your body – you almost feel the penetration before you feel the heat of his body against your own with how quick it was.");
	if (vagIdx < 0) pc.buttChange(enemy.cockVolume(0));
	else pc.cuntChange(vagIdx, enemy.cockVolume(0));
	output("\n\nYou gasp through clenched teeth, then grab another fistful of his chest fur and give it a yank. You tell him that <i>you</i> are on top, and the sex will go at <i>your</i> pace. Not that you didn’t like it, of course, but it’s the principle of the matter.");
	output("\n\nEitan snorts like a bull about to charge, but he obeys and restrains himself. His hands find your hips once more, and he grips them as tightly as he did when he last stopped, but that’s as far as he goes. His cock is still lodged down to the tip inside you, but he doesn’t thrust. His body is shaking and his grip is inconsistent, but he’s doing as you say.");
	output("\n\nYou <i>could</i> reward him and just give him what you both want – but you also want to test him a bit. You rock your [pc.hips] in his grip, dragging your body forward and back, shifting his cock like a joystick as you move. Eitan’s eyes stay focused on yours while his nostrils flare and he bites into his lower lip; you feel his cock surge and bloat with a shot of his pre into your [pc.vagOrAss " + vagIdx +"], but, displaying his discipline to you, he does nothing but wait.");
	output("\n\nYou tell him that you’re very impressed, and you give him a reward by gliding your body down his shaft, inch by precious, tantalizing inch. You can feel your body split to accommodate his girth; you can feel the friction of his shaft against the walls of your body; you can feel the contours of his cock and you can map out every bulge and vein as you sink down; you can practically hear the sound of skin moving against skin; and you can measure the loads of his pre by the spoonful with how badly he needs you.");
	output("\n\nAt first, you think of stopping halfway down and teasing him some more. There’s something delicious about the way he’s quivering to contain himself and the way he’s nearly about to pop just from sliding down a few more inches. Given his dick a few more teasing pulls and turns this way and that would damn near make him squeal, and the face he’d make would be a sight to see.");
	output("\n\nBut you’re having as much trouble denying yourself as Eitan is himself. The sex will go at your pace, that hasn’t changed – and now you want the sex to <i>really</i> amp up.");
	output("\n\nYou lean over Eitan and place your hands on his shoulders, pinning him down");
	if (pc.biggestTitSize() > 4) output(" and smothering his face into your cleavage, nuzzling his nose deep into the valley of your [pc.chest]");
	output(". With the leverage yours, you <i>slam</i> your [pc.hips] down, sucking his length into your [pc.vagOrAss " + vagIdx +"] immediately to his knot – and thanks to Eitan’s earlier work and your own excitement, you even take the cap of that into yourself, too.");
	output("\n\nEitan takes it as your wordless permission to start bucking up and into you, and you allow it. The pace may be yours, but there’s no denying what you two are right now: a pair of fucking animals with their own pleasure as their highest priorities. The air of the room is filled with the sound of your hips slamming together; of the wet squelches of Eitan’s dripping, beading cock powering into your body; of you panting and of him moaning beneath you, his lips mouthing your name in between shuddering breaths.");
	if (pc.hasCock()) output("\n\nIn between it all, you’ve nearly forgotten about your neglected, ignored [pc.cock], dribbling your own pre like a burst faucet onto Eitan’s abs. " + (vagIdx < 0 ? "It’s difficult to focus on the sensation of your own dick, or indeed even have the focus to pay it any mind, when your [pc.vagina " + vagIdx + "] is being so thoroughly ploughed and filled and stretched, making you see stars. On the one hand, you wonder if you’ll manage to cum through your cock without any other stimulation – but on the other, you could hardly give a shit." : "Which makes sense, given the absolute brutalizing Eitan is giving your prostate: every one of his thrusts into you is like you thrusting ten times into the tightest hole in the galaxy. Your [pc.asshole] is the fuse to the stick of dynamite that is your [pc.cock], and it won’t be long before you explode all over his chest and mat his fur with your seed."));
	output("\n\nGiven the... <i>urgency</i> of the scenario – of you riding Eitan’s cock like you have something to prove, and of Eitan fucking you like you’re the best lay he’s ever had and he only gets one opportunity with you – it’s no shock when you feel your body beginning to yield more and more to the bulb of his cock, granting it entrance after it’s battered into you several dozen times in the space of a minute. You can feel your [pc.vagOrAss " + vagIdx +"] getting tight, not because you’re trying to deny it, but because you’re being stretched so wide from having something the size of a pair of fists together pushed into a hole in your body. And you <i>want</i> it.");
	output("\n\nWith one last, greedy, needful thrust from the both of you, you push with all your core muscles down and onto Eitan, <i>desperate</i> to get it inside you and lock you to him so that you can take all his seed for yourself. It’s not a conscious need: your body <i>yearns</i> to feel your " + (vagIdx < 0 ? "guts" : "womb") + " flood with his cum and to greedily have every last drop stay inside you. And Eitan feels the same way, with his push up and into you. Your combined efforts pay off: after a tense moment of pushing from you both, you crest the widest, fattest part of his knot, and it’s smooth sailing until your [pc.hips] collide with his and you feel his huge, furry nuts against your [pc.ass].");
	output("\n\nEitan can’t help but clench his body, burrowing his face");
	if (pc.biggestTitSize() > 4) output(" even further");
	output(" into your chest, tensing all of his rock-hard muscles and tightening the grip his hands have on your [pc.thighs], as the first surge of his cum rockets up his shaft. You can feel his balls pull up against your body, and you can feel his cock thicken with the first gout, to the point where you know exactly where the cum is in his shaft before it ejects – and you know that you can’t feel the end of it just yet.");
	output("\n\nThe splash of his alpha milodan seed inside you is full, thick, and hot; your body feels full from just the first round, and, knowing Eitan and the pre he’s been copiously feeding your [pc.vagOrAss " + vagIdx +"] for the past few minutes, he’s got so many more to give. " + (vagIdx < 0 ? "Just one load is enough to make you feel like you’ve eaten a full-course meal with dessert, and you hardly have the space to take any more" : "Just one load is enough to make your [pc.vagina " + vagIdx +"] feel like you’re stuffed to your limit: your body is little more than a water balloon for his cum, and everything else is just extra that you can hardly afford the space to contain") + ", but as long as that juicy knot of his stays in place, you’re going to take every last little bit he has, and you wouldn’t have it any other way. By the second, your [pc.belly] begins to bloat very slightly from the stress, and Eitan isn’t anywhere <i>close</i> to done.");
	output("\n\nNaturally, your own release comes hot on Eitan’s heels – you were already riding the edge from the whole display and feeling your partner orgasm inside you (and so... productively), pushes you over the edge:");
	if (vagIdx < 0)
	{
		output(" all the erogenous zones you have in your [pc.asshole] are lighting up, and your body feels warm, like you’re sitting too close to a fire, but you have neither the strength nor the inclination to stop what you’re doing. Every pulse of Eitan’s cock inside you deposits another load so big and thick that it’d make an average man blush with envy, bloating your poor stomach all the wider, and making you cum all the harder with him.");
		if (pc.hasCock()) output(" Every blast soaks your poor, overworked prostate, making your own [pc.cock] leap in time with Eitan’s shots, and with another heartbeat, you’re cumming onto his chest, your [pc.cum] matting and soaking his fur with your seed" + (pc.cumQ() < enemy.cumQ()*.75 ? "." : "; as proof that neither of you are ‘average,’ you manage to keep up with his loads, pulse for pulse, and he’s painted positively [pc.cumColor] from the neck down before long."));
	}
	else
	{
		output(" your [pc.vagina " + vagIdx +"] tightens and pinches around Eitan’s knot, and your orgasm <i>rips</i> through you like a force of nature, rocketing from your pussy to your extremities and making your");
		if (pc.skinType == GLOBAL.SKIN_TYPE_SKIN) output(" hair");
		else if (pc.hasFur()) output(" fur");
		else output(" nerves");
		output(" stand on end. It’s like some kind of lewd race to one-up each other on how long you can make your orgasms last: when you feel another pulse of Eitan’s cum bloat your womb and tighten your body, your [pc.vagina " + vagIdx +"] clamps harder and another shock of pleasure shoots through you, lasting longer. Your eyes cross during the worst of it all, and sometimes, you forget to breathe.");
	}
	output("\n\nBy the time he’s done, and you follow shortly after, Eitan’s panting like he’s run a mile on the floor beneath you. His eyes are closed and his tongue is lolling from his slack jaw. It takes you another moment to realize that you’ve had your fingers buried into his chest, tensed and crooked like daggers into the soft fur – you wouldn’t be surprised if you were hurting him, but with how big and strong he is, and with how in the moment he was, he probably didn’t notice at all.");
	output("\n\nEitan is passed right out beneath you; you double-check by jostling him a bit, and he doesn’t even stir. You have a bit of time to yourself, to soak in your sexual victory over Eitan, knowing that you’ve subdued him so thoroughly that he became incapacitated. And... well, you’re not going anywhere until he softens up a bit.");
	output("\n\nIt’s not very long until he gets flaccid enough for you to slide off him, but it’s still well longer than it would take a lesser man or milodan to grow soft. As soon as the seal of his knot in your [pc.vagOrAss " + vagIdx +"] gives even the littlest leeway, a veritable burst of his warm, gooey semen gushes from your poor, abused hole, soaking back onto his balls and down his inner thighs.");
	output("\n\nWhen you clamber off him, he still doesn’t move – he’s sound asleep. You decide to leave him be for now as you put your effects back on.");
	if (eitanIsCrew()) output(" Maybe you’ll go and do the rounds a bit while he rests; surely he’ll be back in his quarters" + (silly ? " and acting like nothing happened at all" : "") + " by the time you’re done.");
	else output(" Maybe you’ll show yourself around the village for a bit; surely he’ll be awake and " + (silly ? "acting like absolutely nothing happened" : "ready for anything") + " when you come back.");

	// end scene (scene: Pussywhip Eitan); reduce Lust to 0; if in the tent, place the PC one square outside the tent; if in the ship, display the ship’s main menu; give the PC the Vaginally or Anally-Filled statuses
	pc.orgasm();
	enemy.orgasm();
	if (vagIdx < 0) pc.loadInAss(enemy);
	else pc.loadInCunt(enemy, vagIdx);
	IncrementFlag("EITAN_SPAR_WIN_SEX");

	CombatManager.abortCombat();
}

public function miloSparringIsCancelled():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(1);

	output("You drop your attack stance and tell Eitan that you surrender.");
	output("\n\nAt first, Eitan maintains his stance, but once he’s confident that you mean no further aggression yourself, he relaxes, lowering his guard. <i>“As you say, [pc.name] Steele,”</i> he says. <i>“The fight wouldn’t be proper if one of us was incapable or unwilling. If you ever want to spar again, you know where I’ll be.”</i>");
	output("\n\nAt least he doesn’t seem to be too annoyed about it, seeing as you’re the one who wanted to spar him.");

	CombatManager.abortCombat();
}