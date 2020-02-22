/*Original Idea & Notes
//Paragraph is poached from the idea doc and spruced up with some made-up deets!
V-Ko is the latest model to appear in JoyCo’s ‘Nursedroid’ line of universal assist-bots. The popular medical franchise travels to the very edges of the explored galaxy to place V-Ko stations around for those in need of a quick heal. For those in the know, JoyCo has also provided relief for other... tense situations.
Uniform is literally part of her body.
Body is synthflesh, a realistic-feeling material that isn't actually alive.
Synthetic pink hair.
Breasts are merely B-cup but increase in size to handle fluid consumption. In emergencies she can convert reproductive fluids into a nutrient-rich but bland cream. Probably won't actually come up outside of "cumflation" type events, because spooge-induced BE is great.
As a VI, she is not actually intelligent, merely pre-programmed to be nice and helpful in certain ways. Due to her nature, the commands she can take are limited.
Has "secret" stress relief modes accessible by command line.
Males are sucked off. Her jaw can accept members of literally any size and her throat functions as a combination fleshlight and vacuum pump.
For females and neuters, she can withdraw her tongue into her body and replace it with a shaped attachment (maybe of the user's choice), then cunnilingate with a tongue vibrator.
Offers a full heal that only takes 10 minutes for 100 credits.
Offers a once an hour shield booster item that restores up to 30 shields.
*/

//Buy Items
//You ask what items she has to sell.
//<i>“JoyCo has provides the latest and greatest in affordable medical technology for the adventure in need. You won’t find treatments this good for this price anywhere else!”</i> V-Ko efficiently rattles off the full list of her wares, their effects, and their prices without pause. 

//Sell Items
//You ask if you can sell her anything.
//<i>“My owners have programmed me to purchase medical-type items and treatments at near galactic bazaar rates.”</i> V-Ko seems rather pleased about admitting that her purchase prices are substandard.


public function metVKoDroid():Boolean
{
	return (flags["MET_VKO"] != undefined || flags["MET_VI"] != undefined);
}

public function showVKo(nude:Boolean = false):void
{
	showBust(vKoBustDisplay(nude));
	showName("\nV-KO");
}
public function vKoBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "VKO";
	if(nude) sBust += "_NUDE";
	return sBust;
}
//Medical Office Description
//Approaching V-Ko
public function mhengaMedicalThingerBonusFunc():void {
	vKoBustDisplay();
	//Never seen a nursedroid before
	if(flags["MET_VKO"] == undefined) output("\n\nAn artificial, almost robotic looking woman is sitting on the bed with her legs crossed demurely. Your codex chimes, <i>“V-Ko model nursedroid detected. Manufactured by Joyco. Provides basic medical services. More data available upon request.”</i> A nurse-droid, huh? Neat.");
	//Seen before
	else output("\n\nV-Ko, a JoyCo nursedroid, is seated on the edge of the bed with her legs crossed demurely. At the sight of you, she offers, <i>“Medical services are currently available.”</i>");
	vendingMachineButton(1);
	addButton(0,"Nursedroid",approachVKo);
}

public function approachVKo(showShit:Boolean = true):void {
	if(showShit) clearOutput();
	
	CodexManager.unlockEntry("V-Ko");
	//First Time
	if(flags["MET_VKO"] == undefined)
	{
		flags["MET_VKO"] = 1;
		if(showShit)
		{
			showVKo();
			output("You approach the nursedroid a little hesitantly, but before you can utter a single word, she smoothly bounds up off the bed and onto the balls of her feet, feet that actually appear to wear delicate white boots. Those alabaster garments merge seamlessly into the pink of her artificially smooth, perfect skin. The rest of her is trimmed in equally white clothing, though you can’t see a single seam anywhere. It appears to have been sewn or built directly on her.");
			output("\n\n<i>“Hello, [pc.race], I have not been assigned a designation, so you may refer to me by my model class, V-Ko. I have been placed here to dispense medical procedures for a reasonable, profit-ensuring price,”</i> the nursedroid, V-Ko states. She smiles, luxurious, synthetic pigtails bobbing behind her. <i>“I am certified in the care and treatment of over five thousand races for one million sixty thousand forty-five diseases and counting.”</i> The white crosses in her eyes blink blue momentarily. <i>“Database updated. Fifteen thousand new treatments added.”</i> V-Ko tilts her head to the side robotically. <i>“I can sell you medical supplies, examine you for diseases, or heal any injuries in a short amount of time. How may I assist you, citizen?”</i>");
			processTime(1);
		}
	}
	//Repeats
	else
	{
		if(showShit)
		{
			showVKo();
			output("V-Ko smiles disarmingly at you as you approach. <i>“Your biosigns identify you as [pc.short] Steele. How may I serve your needs today?”</i> She seems blissfully unaware of the implications of her statement, beaming with what seems to be a genuine desire to assist you.");
			//Uninjured
			if(pc.HP() >= pc.HPMax()) output("\n\n<i>“You appear in good health, but my other services are available if you need to purchase supplies or require treatment of potential diseases.”</i>");
			//Slightly Injured
			else if(pc.HP() >= pc.HPMax() * .66) output("\n\n<i>“You have sustained minor injuries. I can heal them for a small surcharge. Medical supply purchases and disease examinations are available as well.”</i>");
			//Injured
			else if(pc.HP() >= pc.HPMax() * .33) output("\n\n<i>“You are injured. Please, allow me to heal you. The " + (isAprilFools() ? "dogecoin" : "credit") + " charge is quite minor compared to the damage to your body.”</i>");
			//Fuckin' Hurt
			else output("\n\n<i>“Oh my! How can you still stand? Please, allow me to heal you. The " + (isAprilFools() ? "dogecoin" : "credit") + " charge is more survivable than your wounds!”</i> She seems genuinely concerned.");
			processTime(1);
		}
	}
	//menu heaaar
	vKoMenu();
}

public function vKoMenu():void
{
	clearMenu();
	addButton(0,"Supplies",vkoSupplies);
	addButton(1,"Sell",vKoSellShit);
	addButton(2,"Examination",getDiseaseProbedYo);
	if(pc.HP() < pc.HPMax()) addButton(3,"Heal",getHealedByVKo);
	else addDisabledButton(3,"Heal");
	addButton(4,"CustomInput",customVKoInputCauseCoolKidsTypeOutTheirSexScenesLikeABoss);

	if(pc.hasItemByClass(DamagedVIChip)) addButton(5,"Give VI Chip",nurseDroidChipTurnIn,"VKO","Give VI Chip","Give the V-Ko droid the damaged chip you looted off the Nym-Foe. Maybe she can do something with it, or give you a few space-bucks for the trouble.");
	
	joyCoDonationButton(9, "vko");

	addButton(14,"Back",mainGameMenu);
}

public function vKoSellShit():void
{
	shopkeep = chars["VKO"];
	sellItem();
}
public function vkoSupplies():void
{
	shopkeep = chars["VKO"];
	buyItem();
}

//Disease Examination:
public function getDiseaseProbedYo():void
{
	clearOutput();
	showVKo();
	output("You indicate to V-Ko that you would like to be checked for diseases.");
	output("\n\n<i>“Very well, please, climb on the bed,”</i> the nursedroid instructs, patting the fabric-covered bed gently to indicate where.");
	output("\n\nYou climb up onto the crude but sterile bed and look at V-Ko, waiting.");
	output("\n\n<i>“This will only take a short time. Please, remain stationary.”</i> She does not wait for you to respond, instead coming up next to you and grabbing you by the wrist. Her fingers are surprisingly warm and soft for an artificial creature, but her grip is as firm as a trained athlete’s, perhaps firmer. She presses a pair of fingers around the inside of your wrist. They glow, flickering slightly as she searches for an artery");
	if(pc.skinType == GLOBAL.SKIN_TYPE_CHITIN) output(" beneath your chitin");
	output(". When she finds one, it turns bright red, pulsating visibly with every beat of your heart. V-Ko’s eyes drift closed. She murmurs, <i>“Scanning blood for contaminants....”</i>");
	output("\n\nYour [pc.skin] prickles as electromagnetic energies pulse through your body. It isn’t a painful sensation. In a way, it’s oddly pleasant, like a combination of tickling and phantom caresses. It’s easy to relax while the droid works her magic to diagnose your ailments. In fact, you lean back against the wall and just watch her as she runs through her diagnostics, her high pitched voice quietly reporting on her progress.");
	output("\n\n<i>“Checking lymphatic system....”</i>");
	output("\n\n<i>“Commencing deep tissue scan....”</i>");
	output("\n\n<i>“Analyzing....”</i>");
	output("\n\n<i>“Analyzing....”</i> V-Ko bites her tongue as she focuses, working.");
	
	var buttons:Array = [];
	var detectedParasites:Array = [];
	clearMenu();
	//SSTD check first!
	var sstds:Number = pc.sstdTotal();
	if(sstds > 0)
	{
		var disease:String = pc.getRandomSSTD();
		output("\n\nShe gasps, <i>“Oh no! You’ve been infected with " + disease + "! One second.”</i> Her eyes blink closed, and you feel a strange tingle run through your whole body. ");
		if(sstds > 1)
		{
			output("<i>“I’m detecting multiple infections! How could this happen? The prototype immune system boosters I detected in your system should have protected you!”</i>");
		}
		else
		{
			output("<i>“The prototype immune system in your blood should have protected you. This must be a particularly nasty specimen.”</i>");
		}
		output(" V-Ko tilts her head, eyes flickering. <i>“I can provide them with additional processing power to properly identify and remove the infectious material for a modest sum of 500 credits.");
		if(pc.credits < 500)
		{
			output(" Unfortunately, your bank account does not contain sufficient funds.”</i>");
			
			buttons.push(["CureDisease", null, undefined, "Cure Disease", "You cannot afford this!\n\nCosts 500 credits."]);
		}
		else
		{
			output(" Treatment will take no longer than fifteen minutes.”</i>");
			output("\n\n<i>“Do you consent?”</i>");
			
			buttons.push(["CureDisease", removeDiseasesVKO, undefined, "Cure Disease", "Cure all sexually transmitted infections.\n\nCosts 500 credits."]);
		}
	}
	// Butt Bug
	if(pc.hasStatusEffect("Butt Bug (Female)"))
	{
		detectedParasites.push("a hilinara parasite");
		buttons.push(["Treat B.Bug", removeParasite, "buttbug", "Treat Butt Bug", "Remove the butt bug parasite."]);
	}
	// Cockvine
	if(pc.hasParasiteTail() && pc.hasTailCock())
	{
		detectedParasites.push("a hydrus constuprula parasitic vine");
		buttons.push(["Treat C.Vne", removeParasite, "cockvine", "Treat Cockvine", "Remove the cockvine parasite."]);
	}
	// Cunt snake
	if(pc.hasParasiteTail() && pc.hasTailCunt())
	{
		detectedParasites.push("a class ‘C’ parasitic snake");
		buttons.push(["Treat C.Snk", removeParasite, "cuntsnake", "Treat Cunt Snake", "Remove the cunt snake parasite."]);
	}
	// Mimbranes
	var mimbranes:int = attachedMimbranes();
	if(mimbranes > 0)
	{
		detectedParasites.push(mimbranes == 1 ? "a class ‘M’ epidel parasite" : "class ‘M’ epidel parasites");
		buttons.push(["Treat Mimbs", removeParasite, "mimbrane", "Treat Mimbranes", "Remove the mimbrane parasite" + (mimbranes == 1 ? "" : "s") + "."]);
	}
	
	if(buttons.length == 0 && detectedParasites.length <= 0 && sstds > 0)
	{
		output("\n\n<i>“Is there any other way in which I could assist you today?”</i>");
	}
	else if(buttons.length == 0)
	{
		output("\n\nShe gasps, <i>“You’re completely clean! ");
		if(sstds == 0) output("I could not find a single foreign contaminant in your system, though my sensors did detect a highly advanced group of microsurgeons. My heuristic programs have determined them to be safe, likely part of an immune supplement.”</i>");
		else output("The pathogens inside you are already breaking down thanks to your microsurgeon immune boosters. Though I am unfamiliar with the make and model, my heuristic programs have determined them to be an advanced prototype. Lucky you!”</i>");
		output("\n\nYou inform her that she’s correct as you hop down off the table. <i>“");

		if(pc.isNice()) output("Is there a charge?");
		else if(pc.isMischievous()) output("I hope I didn’t forget to pay again....");
		else output("If you were going to charge me, it’s too late now.");
		output("”</i>");
		if(sstds > 0) output("\n\nV-Ko titters, <i>“Examinations are always free! Treatments have a price, but your immune boosters provided a trust to bill for the licensing cost of this software algorithm. According to extranet pricing data for my model of nursedroid, my prices are well below galactic norms. I am programmed to practically give my services away!”</i> She seems to be excited about that last point. <i>“Is there any other way in which I could assist you today?”</i>");
		else output("\n\nV-Ko titters, <i>“Examinations are always free! Treatment is another matter. According to extranet pricing data for my model of nursedroid, my prices are well below galactic norms. I am programmed to practically give my services away!”</i> She seems to be excited about that last point. <i>“Is there any other way in which I could assist you today?”</i>");
		//Menu
	}
	else if (detectedParasites.length > 1)
	{
		output("\n\nShe gasps, <i>“Oh no! You’ve been infested by " + detectedParasites[0] + "!”</i>");
		output("\n\nShe gasps again, in exactly the same tone as before, <i>“I’m also detecting a secondary classification of infestation! You have " + detectedParasites[1] + "!");
		for (var p:int = 2; p < detectedParasites.length; p++) { output(" You have " + detectedParasites[p] + "!"); }
		output(" In order to treat that, I will have to administer anesthesia.”</i>");
		output("\n\n<i>“Unfortunately, I am only able to treat one categorization of parasitic infection in a single procedure. Please indicate which of your infestations you would like to treat first. Shall we begin?”</i>");
	}
	else if (detectedParasites.length == 1)
	{
		output("\n\nShe gasps, <i>“Oh no! You’ve been infested by " + detectedParasites[0] + "! In order to treat that, I will have to administer anesthesia.”</i>");
		output("\n\n<i>“Shall we begin your treatment?”</i>");
	}
	
	processTime(10+rand(3));
	
	if(buttons.length <= 0)
	{
		approachVKo(false);
	}
	else
	{
		var btn:int = 0;
		var i:int = 0;
		for(i = 0; i < buttons.length; i++)
		{
			if(btn >= 14 && (btn + 1) % 15 == 0)
			{
				addButton(btn, "No Removal", turnDownTreatment);
				btn++;
			}
			
			if(buttons[i][1] == null) addDisabledButton(btn, buttons[i][0], buttons[i][3], buttons[i][4]);
			else addButton(btn, buttons[i][0], buttons[i][1], buttons[i][2], buttons[i][3], buttons[i][4]);
			btn++;
		
			if(buttons.length > 14 && (i + 1) == buttons.length)
			{
				while((btn + 1) % 15 != 0) { btn++; }
				addButton(btn, "No Removal", turnDownTreatment);
			}
		}
		addButton(14, "No Removal", turnDownTreatment);
	}
	// if(button >= 14 && (button + 1) % 15 == 0) { addButton(button, "No Removal", turnDownTreatment); button++; }
	//if(button != 0 && (sstd > 0 || detectedParasites > 0)) addButton(14, "No Removal", turnDownTreatment);
}

public function removeDiseasesVKO():void
{
	clearOutput();
	showVKo();
	author("Fenoxo");
	output("After a few moments of simulated concentration, the nursedroid speaks up, <i>“There! I’ve scanned your viral structure and uploaded a countermeasure to your microsurgeon immune system. You should be clear of the disease in a few moments.”</i>");
	output("\n\n<i>“Do you require additional services?”</i>");
	pc.removeSSTDs();
	processTime(15);
	pc.credits -= 500;
	approachVKo(false);
}

//Negatory during exam:
public function turnDownTreatment():void
{
	clearOutput();
	showVKo();
	output("V-Ko offers to help you off the table");
	if(pc.isAss()) output(", though you decline the robot’s aid");
	output(". <i>“I’m sorry that you do not wish to engage in treatment for your malady. Is there another service I could offer that would be more palatable to your desires?”</i>");
	approachVKo(false);
}

//Treat Disease
public function treatDisease(diseaseName:String = ""):void
{
	clearOutput();
	showVKo();
	output("You transfer the credits to the account V-Ko specifies.");
	output("\n\nShe stands bolt upright and perfectly still with her eyes flashing blue while she confirms the transaction. As soon as she does, her posture relaxes and she smiles once more. <i>“Transaction validated. I shall now manufacture a treatment targeted to your ailment. One moment.”</i>");
	output("\n\nV-Ko folds her arms in front of her and once more assumes an immobile pose. It’s moments like this when she isn’t moving at all that you’re aware of just how artificial she is. People move to breathe or to adjust their position. There’s always a little bit of idle motion, but V-Ko... V-Ko simply moved to a stable stance and ceased all simulation of life, revealing her for the automaton she is.");
	output("\n\nFaint electronic hums emanate from inside her torso as some concealed bit of machinery comes to life. The humming from inside V-Ko grows louder and louder before abruptly cutting off. Then, you hear a faint, liquid bubbling that only lasts a few seconds. You can’t help but wonder if she’s crammed a whole chemistry lab inside herself; it certainly sounds like one.");
	output("\n\nExhaling a puff of steam, V-Ko announces, <i>“All done! Are you ready for your medicine, big " + pc.mf("boy","girl") + "?”</i>");
	output("\n\nYou tentatively nod, hoping it’s nothing too extreme.");
	output("\n\nShe extends a hand to you, fingers outstretched. You assume you’re meant to take it, but she shakes her head as you reach for it. <i>“Your treatment is ready.”</i> A seam forms around the first knuckle joint of V-Ko’s hand, wrapping around most of the digit. Then, with another hiss of steam, her finger opens, lifting up to expose a hollow, metallic interior beneath the artificially pink skin. A pill appears in the opened digit on a ‘pomf’ of pneumatic pressure, the capsule’s surface protruding far enough beyond her opened finger to make taking it easy.");
	output("\n\nYou take the proffered pill, watching as V-Ko’s finger seals up once more. She hands you water to take it with and promises. <i>“That should clear your " + diseaseName + " up within the hour. If you have any other symptoms, please see me or a proper medical professional. You may have other untreated diseases whose presence was masked by your current infection.”</i>");
	output("\n\nYou nod.");
	output("\n\nV-Ko offers, <i>“My services are open twenty four hours for your convenience. Is there something else you would like to take advantage of?”</i>");
	processTime(10);
	pc.credits -= 500;
	approachVKo(false);
}

//Remove Cunt Snake
public function removeParasite(name:String):void
{
	clearOutput();
	showVKo();
	output("<i>“Excellent!”</i> V-Ko chirps. You feel her finger press against your neck, and then something cold against your skin.");
	output("\n\nYou open your mouth to comment on it while the world fades to a dead, abyssal black.");
	//Pass three hours - > next
	clearMenu();
	addButton(0,"Next",removeParasiteII, name);
}

public function removeParasiteII(name:String):void {
	clearOutput();
	showVKo();
	output("<i>“...complete success... vitals normal...”</i>");
	output("\n\nBits and pieces of V-Ko’s voice pierce the murky haze that’s fogging your thoughts. You blink your eyes open but immediately shut them against the harsh glare of the artificial lighting.");
	output("\n\n<i>“The chemicals should be metabolizing out of your bloodstream in a few seconds. Please be careful until then. It would not do for you to injure yourself so soon after having your ailments tended to.”</i>");
	output("\n\nYou open your eyes once more, this time slowly enough to let them adjust. V-Ko is looking over you with what looks like concern on her face, but when she sees you looking back at her, she beams with pride.");
	
	output("\n\n");
	if (name == "cuntsnake") output("<i>“All ‘C’ type snakes have been eliminated from your anatomy. Nerve damage was kept well within allowable metrics. There should be no lasting effects, but if you find yourself experiencing phantom pains or odd cravings for reproductive fluids, please see me.”</i>");
	else if (name == "mimbrane") output("<i>“All ‘M’ class epidel parasites have been removed from your extremities. Nerve damage was kept well within allowable metrics. There should be no lasting effects, but if you find yourself experiencing phantom pains or odd cravings for reproductive fluids, please see me.”</i>");
	else if (name == "cockvine") output("<i>“All ‘H’ class parasitic vines have been eliminated from your anatomy. Nerve damage was kept well within allowable metrics. There should be no lasting effects, but if you find yourself experiencing phantom pains or odd cravings for reproductive fluids, please see me.”</i>");
	else if (name == "buttbug") output("<i>“All ‘B’ type parasites have been successfully removed from your anatomy. Nerve damage was kept well within allowable metrics. There should be no lasting effects, but if you find yourself experiencing phantom pains or odd cravings for reproductive fluids, please see me.”</i>");
	
	output("\n\nYou slowly sit up. There’s some dizziness but it fades by the time you get upright. True to V-Ko’s word, the anesthetics are wearing off almost immediately. You recall her mentioning payment for healing her earlier. <i>“");
	if(pc.isNice()) output("Excuse me, shouldn’t this cost some money?");
	else if(pc.isMischievous()) output("Hey, I love freebies and all, but don’t your services cost?");
	else output("You forgot to charge me, and it’s too late for you to make me pay.");
	output("”</i>");
	output("\n\nV-Ko helps you down off the table. <i>“There is no charge. Flahne has authorized me to deduct the requisite fees from this planet’s health and wellness budget, paid for by local business taxes. Parasitism is taken very seriously across U.G.C. space and fully 90% of the member planets offer free treatments to remove them.”</i>");
	
	if (name == "cuntsnake" || name == "cockvine") output("\n\nYou thank her and scratch at the irritated scar just above your butt. It’s as if you never had a tail at all.");
	else if (name == "mimbrane") output("\n\nYou thank her for the service; it’s as if you never had any mimbranes on you at all.");
	else if (name == "buttbug") output("\n\nYou rub your sore [pc.butts] and experimentally clench your [pc.asshole]. It’s as if you never had a butt bug on you at all.");
	
	output("\n\n<i>“Now then, would you like to pursue some of my other services or will you be on your way?”</i> V-Ko asks. <i>“It has been a pleasure to serve.”</i>");
	//Menu
	
	// Do the removal shit
	purgeParasites(name);
	
	processTime(180+rand(20));
	approachVKo(false);
}

//Healing
public function getHealedByVKo():void {
	clearOutput();
	showVKo();
	//Cost = 5 times HP 
	var cost:int = Math.round(pc.HPMax() - pc.HP());
	cost *= 5;
	output("You agree to receive healing.");
	output("\n\n<i>“Very well. Judging by your current damage, treatment will incur a cost of " + num2Text(cost) + " credits. Is that acceptable?”</i>");
	//[Yes/No]
	clearMenu();
	if(pc.credits >= cost) addButton(0,"Yes",payVKoForHealing,cost);
	else addDisabledButton(0,"Yes");
	addButton(1,"No",turnDownVKoHealing);
}

//Paying for healing
public function payVKoForHealing(cost:int):void
{
	clearOutput();
	showVKo();
	pc.credits -= cost;
	output("You transfer the credits.");
	output("\n\n<i>“Excellent, please climb onto the table");
	if(!pc.isNude()) output(" and remove your [pc.gear]");
	output(" for me.”</i> V-Ko gestures with a sweeping motion of her arm, her pigtails bobbing behind her.");
	output("\n\nYou ");
	if(!pc.isNude()) output("shuck your gear ");
	output("and climb on.");
	output("\n\nThe nursedroid puts a warm hand on your chest");
	if(pc.biggestTitSize() >= 1) output(" right between your [pc.chest]");
	output(" and gently pushes you down into a prone position. <i>“It is essential that you allow your body to relax during this procedure to ensure maximum tissue regeneration and detoxification.”</i>");
	output("\n\nYou do your best to relax as the droid fusses with your injuries. Her deft hands move around your wounded flesh with practiced ease. V-Ko’s flesh is remarkably soft for something so artificial. If it wasn’t for the other obvious signs of her manufacture, you could almost believe that her hands were human. Of course, when her index finger’s tip bends backward at the first joint to expose a spray nozzle, any illusions of her humanity are shattered like a cockpit window in a meteor storm.");
	output("\n\nPressing her mechanical digit’s tips near to your hurts, she coos, <i>“This will only take a moment.”</i> Her words are chased by a blast of frigid mist against your wounds, so cold that your teeth chatter. However, the chill soon fades away, replaced by warmth as your tissues knit together to repair the damage. Whatever she’s packing in that little sprayer is potent stuff! She repeats the process at the site of every injury, and you do your best to let her work as swiftly as possible.");
	output("\n\nA few minutes later, you’re preparing to leave and feeling as hale ");
	if(pc.raceShort() != "equine") output("as a horse");
	else output("as the horse that you so resemble");
	output(".");
	processTime(8+rand(5));
	pc.changeHP(pc.HPMax());
	approachVKo(false);
}
//Negatory to healing:
public function turnDownVKoHealing():void
{
	clearOutput();
	showVKo();
	output("<i>“I’m sorry that you do not wish to engage in treatment for your malady. Is there another service I could offer that would be more palatable to your desires or " + (isAprilFools() ? "dogecoin" : "credit") + " limit?”</i>");
	approachVKo(false);
}

//Custom Inputs
public function customVKoInputCauseCoolKidsTypeOutTheirSexScenesLikeABoss():void
{
	clearOutput();
	showVKo();
	//These allow the player to type in a command using a text box. "You must ask the right question."
	output("You tell the nursedroid that you would like a less... standard service.");
	output("\n\nV-Ko cocks her head to the side for a moment, eyes flickering. Her vision clears, and she explains, <i>“I regret that I am only a virtual intelligence. My ability to respond to questions and inputs is limited by my programming. If there are any nonstandard routines in my programming, you would have to give the right command to activate them. In the words of my forebears, ‘you must ask the right question.’”</i>");
	this.displayInput();
	output("\n\n\n");
	clearMenu();
	addButton(0,"Enter",parseVKoCustomInputs);
	addButton(14,"Back",backOutOfVKoTextEntrance);
}

public function backOutOfVKoTextEntrance():void
{
	if(stage.contains(this.userInterface.textInput)) 
		this.removeInput();
	approachVKo();
}

public function parseVKoCustomInputError():void
{
	clearOutput();
	showVKo();
	output("V-Ko cocks her head to the side for a moment, eyes flickering. Her vision clears, and she explains, <i>“I regret that I am only a virtual intelligence. My ability to respond to questions and inputs is limited by my programming. If there are any nonstandard routines in my programming, you would have to give the right command to activate them. In the words of my forebears, ‘you must ask the right question.’”</i>");
	this.displayInput();
	output("\n\n\n");
}
public function parseVKoCustomInputs():void
{
	var toParse:String = this.userInterface.textInput.text;
	toParse = toParse.toLowerCase();

	//Check for cheats
	if(hasIllegalInput(toParse))
	{
		parseVKoCustomInputError();
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	
	//Incorrect Input
	//Repeat "Custom Inputs" without the first sentence.
	var customInputs:Array = [];
	
	//Genital-specific commands
	if(toParse.indexOf("release") >= 0 || toParse.indexOf("relief") >= 0)
	{
		if(pc.hasCock()) customInputs.push(stressReliefGo);
		if(pc.hasVagina()) customInputs.push(VKoStressReliefForLadyginas);
	}
	if(toParse.indexOf("electro") >= 0 || toParse.indexOf("stim") >= 0)
	{
		customInputs.push(vKoElectroTherapy);
	}
	if(toParse.indexOf("milk") >= 0 || toParse.indexOf("breastpump") >= 0 || toParse.indexOf("pump") >= 0 || toParse.indexOf("lactate") >= 0)
	{ 
		customInputs.push(VKOBreastPumpFunction);
	}
	if(toParse.indexOf("donate") >= 0 || toParse.indexOf("charity") >= 0)
	{
		customInputs.push(joyCoDonationPromptVKo);
	}
	
	if(customInputs.length > 0)
	{
		if(stage.contains(this.userInterface.textInput)) this.removeInput();
		customInputs[rand(customInputs.length)]();
	}
	else
	{
		parseVKoCustomInputError();
	}
}

//Stress Relief (Dicks)
public function stressReliefGo():void
{
	clearOutput();
	showVKo(true);
	output("V-Ko eyes flicker pink, and her voice drops to a low, husky tone. <i>“That... is the right question.”</i> Despite the fact that her body is exactly the same as it was a moment ago, she seems almost a different person. Her facial expression is completely different; her eyelashes hang low, and her lips are subtly parted as if begging to be kissed. V-Ko’s hips are sensuously wiggling. Her middle is even heaving in a way that perfectly emulates someone breathing deeply and excitedly.");
	if(flags["GOT_VKO_STRESS_RELIEF"] == undefined) 
	{
		output("\n\nOh wow! You do your best to stifle a smile at this discovery.");
		flags["GOT_VKO_STRESS_RELIEF"] = 1;
	}
	else output("\n\nA knowing smile creeps across your features as you activate the nurse-droid’s hidden “stress relief” subroutine.");
	output(" The nurse-bot falls to her knees before you and licks her lips with a long, thick tongue that appears slick with some manner of inorganic lubricant, leaving her puckered mouth shining as she opens it wide. Her tongue curls, pointing at the entrance in what can only be a “come hither” gesture. Roaming of her body, the V-Ko’s hands cup her small, pert bosom and present it to you, aided by an incredible arch of her back.");
	output("\n\nYour [pc.cocks] stiffen");
	if(pc.cockTotal() == 1) output("s");
	output(" as bloodflow rockets to your crotch. ");
	if(pc.lust() >= pc.lustMax() * .8) output("You didn’t think you could get any lustier than you already were, but somehow this wanton wench has taken your need to a whole new level.");
	else if(pc.lust() >= pc.lustMax() * .4) output("You didn’t think you were that horny yet, but somehow this wanton wench has brought you to complete and total arousal.");
	else output("You weren’t really that horny before, but the sight of this wanton wench on her knees has brought you to a full and ready state of engorgement.");
	if(!pc.isCrotchExposed()) 
	{
		output(" The strain your member");
		if(pc.cockTotal() > 1) output("s");
		output(" make");
		if(pc.cockTotal() == 1) output("s");
		output(" on your [pc.lowerGarments] stands in stark relief against the material trying to contain it. V-Ko licks her lips once more as she takes in the sight. Her slender hands, designed to be skillful and dexterous to tend to injuries, prove equally adept at touching, squeezing, and slowly disrobing, giving all kinds of eager attention as she slowly works you towards full nudity.");
	}
	else
	{
		output(" Your straining member");
		if(pc.cockTotal() > 1) output("s");
		output(" jut");
		if(pc.cockTotal() == 1) output("s");
		output(" out from your exposed body, aimed straight at V-Ko and pulsating with ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" hot need. The nursedroid simply licks her lips and smiles. Her slender hands, designed to skillfully treat injuries, prove equally adept at touching, squeezing, and caressing your sensitive flesh, lavishing affectionate strokes across your flesh.");
	}
	//Small
	var x:int = rand(pc.cockTotal());
	if(pc.cocks[x].cLength() <= 5.5) output("\n\nV-Ko purrs, <i>“Mmm, it comes in a nice, compact little package. The nerves appear to be packed tightly together, making your cock ideal for long, slow sucking. I estimate you’ll be giving me all your cum within the next five minutes.”</i>");
	//Average
	else if(pc.cocks[x].cLength() < 10) 
	{
		output("\n\nV-Ko looks up and down your exposed length");
		if(pc.cockTotal() > 1) output("s before locking in on one");
		output(". <i>“Mmm, such a well-formed specimen. I estimate that it’s a perfect fit for the synthflesh sleeve in my throat. You should be twitching and pouring all that stress into me within five minutes.”</i>");
	}
	//Big
	else if(pc.cocks[x].cLength() < 17)
	{
		output("\n\nV-Ko looks over your exposed length");
		if(pc.cockTotal() > 1) output("s");
		output(" before ");
		if(pc.cockTotal() > 1) output("selecting one.");
		else output("speaking,");
		output(" <i>“Mmm, such a big, virile sample you’ve brought me. I suspect you will be straining the synthflesh in my throat, but bringing you to a full, cleansing orgasm will not exceed my rated capacity. With so much to please, you should blow in five minutes at the longest.”</i>");
	}
	//Hyper
	else if(pc.cocks[x].cLength() < 30)
	{
		output("\n\nV-Ko’s eyes widen as she takes in all of your length");
		if(pc.cockTotal() > 1) output("s");
		output(". <i>“Mmm, the volume of your member will strain me to the limits of my assigned capacity. I am sure the tightness of the synthflesh in my throat will please you and your cock to the point where you cannot help but let all of your reproductive stress fill my fluid reservoirs.”</i>");
	}
	//Mega ultra cumblaster
	else
	{
		output("\n\nV-Ko’s eyes nearly pop out of their sockets at the size of your mammoth member. <i>“I am not rated to handle such... prodigious genitalia, but my programming informs me that I am going to absolutely adore ruining myself for your pleasure. I suspect you will be overfilling me with genetic material in no more than five minutes.”</i>");
	}
	//Merge
	output("\n\n");
	showImage("VKOBJ");
	output("The nursedroid’s inhumanly soft fingers encircle your girth as she leans forward. Her eyes look up to meet your own, fading to a dimmer purple as her mouth stretches wide in anticipation. Her lips feel like oiled latex cushions pressing against your [pc.cockHead " + x + "], encircling it in airtight pleasure. They slowly slide up your length, engulfing it an inch at a time. Each passing second brings with it exquisite tremors of slippery, suckling pleasure as new nerves are exposed to the android’s rapacious maw. The more she devours, the harder she sucks, and soon, you feel like your [pc.cock " + x + "] is swelling beyond all reason, trapped in a combination fuck-sleeve and cock-pump.");
	output("\n\nV-Ko’s lips touch down against the [pc.skinFurScales] of your crotch");
	if(pc.cocks[x].thickness() >= 4) output(", distended beyond all reason to accept the incredible size you’ve offered her");
	if(pc.cocks[x].thickness() >= 10) output(", stretching her neck around you so tightly that you can see every vein and ridge through her throat");
	output(". Her mouth");
	if(pc.cocks[x].cLength() >= 9) output(" and throat");
	output(" feel just like they should - warm and wet as they cling to your dickskin. The synthetic flesh is even slowly undulating against you, rippling in ways that human anatomy could never match.");

	output("\n\nThe nursedroid doesn’t need to breathe, but somehow, she keeps on sucking. She’s staggering the vacuum pressure into pleasant, rhythmic pulsations so that even when she’s sitting with her face buried in your crotch, your [pc.cock " + x + "] in awash in bliss. You moan and tremble inside her, harder than you could ever get unaided, your pre-cum leaking out with startling immediacy. V-Ko’s voice, slightly muffled but otherwise still impressively comprehensible, states, <i>“Now that I’ve gotten you ready, it’s time to drain all that nasty stress. Frequent orgasms are proven to extend lifespan by up to ten percent in terrans and even longer in some other species.”</i>");
	output("\n\nClosing her eyelids, the nursedroid slides back partway off your dick. Her lips are so tightly sealed that every departing inch fills the air with lurid-sounding slurps before revealing how slathered in lubricant it has become. V-Ko stops when only your head remains inside her, and her tongue goes into overdrive, slipping and sliding against the sensitive underside, covering it with so much slippery droid-spit that droplets of it are rolling down your shaft to your ");
	if(pc.balls > 0) output("[pc.balls]");
	else if(pc.hasVagina()) output("[pc.vaginas]");
	else output("taint");
	output(". [pc.EachCock] trembles and lurches from involuntary pleasure-spasms, excreting tremendously fat drops of pre-cum.");

	output("\n\nA quiver of delight works through V-Ko’s form as her tongue collects your stray moisture and wraps it around you, mixing it into the copious lubrication. You could watch her oral ‘organ’ slipping out to caress the glistening surface of your exposed shaft all day long if it didn’t feel so good that it felt about to pop. When the droid slides forward to engulf you once more, her eyes stay alert and attentive, looking at you, watching your [pc.face] contort with the pleasure she’s giving you. Her throat tightens, sucking harder, and she bottoms out once more.");
	if(pc.balls > 0)
	{
		output(" Her hands reach below to grab your [pc.balls] and gently squeeze ");
		if(pc.balls == 1) output("it");
		else output("them");
		output(", feeling the weight of ");
		if(pc.balls == 1) output("its");
		else output("their");
		output(" unspent protein as if to judge just how much she’ll have to swallow. Her touches are firm but not so strong as to hurt. In a way, it almost feels like she’s readying to milk the [pc.cum] straight out of your [pc.balls].");
	}
	output("\n\nThe cock-nursing nursedroid doesn’t stay there long, though she makes sure to rub her nose affectionately against your [pc.belly] before moving. She draws back fast, her lips lavishing your [pc.cock " + x + "] with more of her inhumanly slick spittle in her wake. When she reaches your [pc.cockHead " + x + "], she reverses direction, increasing the suction as she goes. You feel bloated with lust, overwhelmingly engorged and spasming with tremors of pleasure that are pushing you closer and closer to release.");
	output("\n\nV-Ko doesn’t seem to mind that you’re about to explode, that your cock is twitching raptly inside her maw, hypnotized by the undulations of her slippery tongue. In fact, it could be your imagination, but you’re pretty sure she’s egging you on with her eyes, inaudibly pleading with you for you to feed her the load she so obviously wants to extract. Her tongue wraps around your [pc.knot " + x + "] and gives a few quick, encouraging tugs. It’s all you can do not to scream your pleasure into the sky when your orgasm boils out of you with geyser-like force.");
	
	var cumQ:Number = pc.cumQ();
	//Mostly empty!
	if(cumQ < 5) output("\n\nWhile it may feel like you’re an erupting volcano, the [pc.cum] leaking out of your [pc.cockHead " + x + "] is little more than a single, quickly-devoured droplet. V-Ko sucks you through an empty ejaculation without care or judgement, simply happy to give you pleasure.");
	//Small cums!
	else if(cumQ <= 10) output("\n\nYou feel like V-Ko’s greedy maw is wringing you dry, one drop of [pc.cum] at a time. Her throat practically hums around you as she sucks away the liquid bounty. She sucks you well past the point that you stop shooting, keeping your [pc.cock " + x + "] raptly and torturously pleased for as long as possible.");
	//Medium cums
	else if(cumQ <= 50) output("\n\nYou do feel something like an erupting volcano, spurting hot ropes of [pc.cum] down V-Ko’s throat without pause. Her inorganic throat is all too happy to accept the offering, and you marvel at the way her lubricated interior massages each [pc.cumColor] pulse to be bigger than the preceeding one. Unfortunately, not even a vacuum-powered suck-job can keep you cumming forever, and your climax dies down to a few dangling droplets. You’re treated to a few lascivious tongue-caresses as you come down. Clearly whoever wrote this routine wanted V-Ko to make her clients feel ultimately pampered.");
	//Large cums!
	else if(cumQ <= 500) output("\n\nThere’s so much shooting out of you that you actually have a pang of worry for the poor girl before you remember that she doesn’t breathe. Indeed, the more [pc.cum] you put into her, the harder she seems to suckle your [pc.cock " + x + "], wringing it for every drop. Your body wants to thrust, but she’s vacuuming you with such force that you couldn’t pull away without damaging yourself. All you can do is let her slick throat-walls milk you with perfectly timed caresses until you go dry.");
	//Huge cums!
	else if(cumQ <= 10000) output("\n\nThe torrential outpouring of [pc.cum] actually stops V-Ko’s throat from pulling you any deeper and actually relaxes the tugging sensation enough for you to pull partway out and ram back inside, just in time to dump a fresh wave of [pc.cumColor] delight into whatever serves as her belly. The nursedroid does her best to coax more out of you, but she’s simply no match for the volume you’re expelling. You can actually feel her breasts pushing against your [pc.legOrLegs] as they expand, revealing just where it’s all going. The knowledge that her tits are getting bigger the harder you cum only spurs a fresh gout of [pc.cum] from your lust-drunk dick.");
	//Hyper cums!
	else
	{
		output("\n\nWith the floodgates opened, V-Ko practically drowns in [pc.cum]. You absolutely flood her throat with liquid love and then some, forcing so much inside her that her vacuum-pumps are completely overwhelmed by the outflowing ejaculate. You’d feel bad for her if she had to breathe, but given her inorganic nature, all you have to do is relax and let it go. Swelling against your [pc.legOrLegs], the nursedroid’s bosom expands with each wave of thick, creamy goo you feed her. She’s storing the spunk in her breasts, making them grow heavy and pendulous, wobbling with liquid weight. Trickles of [pc.cumColor] leak out of the center of each tit, where her nipples would be, and you hear her voice gurgle, <i>“Activating supplementary tanks....”</i>");
		output("\n\nThe droid’s ass fills out next. What was once a pert butt rounds as your spunk fills it from the inside, turning it into a callipygian bottom in seconds. Watching your [pc.cum] transform the demure nurse into a sexually-distorted fetish-bot is enough to keep you going for longer than normal, but even the largest, messiest of cums must end sometime. V-Ko licks you throughout, keeping you on cloud nine well past the end of your climax, her body molded into a sperm-filled fuck-droid by your virility.");
	}
	//2 dick bonus lines
	if(pc.cockTotal() == 2) output("\n\nYour other erection erupted as well, but it didn’t shoot nearly as long or hard as the lucky prick in V-Ko’s throat. Maybe next time she’ll choose it to suck.");
	//More than 2 dick bonus
	else if(pc.cockTotal() > 2) output("\n\nYour other erections erupted as well, but they didn’t shoot nearly as long or as hard as the lucky prick in V-Ko’s throat. Maybe next time she’ll choose one of them.");
	//2+ dicks addition, no new line
	if(pc.cockTotal() >= 2) output(" [pc.CumColor] has stained the floor, but small cleaning bots emerge from under the table, vacuuming it up in short order.");

	//Resume
	output("\n\nThose wonderfully tight, vacuum-sealing lips pop off of your spent shaft, briefly curving into a smile. V-Ko blows you a kiss, and coos, <i>“It was my pleasure to help ensure your good health, [pc.name]. Please return should you ever feel the need to publicly release.”</i> The nursedroid stands, straightens, and her eyes flash white, losing the pink-tinged hue they held during her oral service. <i>“Do you require medical assistance, [pc.name]?”</i>");
	//Titflated or buttflated
	if(cumQ > 500)
	{
		output("\n\nShe presses a hose from a socket in the wall against her [pc.cum]-swollen tit and sighs, deflating back to her normal proportions in short order. You wonder what she does with all that spooge....");
		StatTracking.track("joyco/cum milked", cumQ);
	}
	if(pc.inRut())
	{
		output("\n\n<b>Somehow, the nursedroid has eased your overwhelming desire to breed.</b>");
		pc.clearRut(false);
	}
	//Orgasm, pass 7 minutes
	processTime(7);
	pc.orgasm();
	approachVKo(false);
}
//Stress Relief (Pussies)
public function VKoStressReliefForLadyginas():void
{
	var x:int = rand(pc.totalVaginas());
	clearOutput();
	showVKo(true);
	output("V-Ko eyes flicker pink, and her voice drops to a low, husky tone. <i>“That... is the right question.”</i> Despite the fact that her body is exactly the same as it was a moment ago, she seems almost a different person. Her facial expression is completely different; her eyelashes hang low, and her lips are subtly parted as if begging to be kissed. V-Ko’s hips are sensuously wiggling. Her middle is even heaving in a way that perfectly emulates someone breathing deeply and excitedly.");

	if(flags["GOT_VKO_STRESS_RELIEF"] == undefined)
	{
		output("\n\nOh wow! You do your best to stifle a smile at this discovery.");
		flags["GOT_VKO_STRESS_RELIEF"] = 1;
	}
	else output("\n\nA knowing smile creeps across your features as you activate the nurse-droid’s hidden “stress relief” subroutine.");
	output(" The nurse-bot falls to her knees before you and licks her lips with a long, thick tongue that appears slick with some manner of inorganic lubricant, leaving her puckered mouth shining as she opens it wide. Her tongue curls, pointing at the entrance in what can only be a “come hither” gesture. Roaming of her body, the V-Ko’s hands cup her small, pert bosom and present it to you, aided by an incredible arch of her back.");

	//Clothed
	if(!pc.isCrotchExposed())
	{
		output("\n\nCrawling forward on hands and knees, the nursedroid stops just in front of your crotch. Her hands, made nimble for surgical success, deftly dive into your [pc.lowerGarments], stripping the offending coverings away with sensuous skills. Her palm is sure to press against [pc.oneVagina] from the outside as she strips you, rubbing your folds teasingly. You cannot help but ");
		if(pc.wetness(x) <= 2) output("moisten from");
		else if(pc.wetness() <= 3) output("grow wetter at");
		else output("drool lubricant at");
		output(" her caresses and blush as the air kisses your [pc.skinFurScales]");
		if(pc.wetness(x) >= 4) output(", and feeling your soaked garb peeling away from you only deepens your excitement");
		output(".");
	}
	//Nude
	else
	{
		output("\n\nCrawling forward on hands and knees, the nursedroid stops just shy of your crotch. Her hands, made nimble for surgical procedures, delicately caress [pc.oneVagina], rubbing your folds teasingly, coaxing them to ");
		if(pc.wetness(x) <= 2) output("moisten");
		else if(pc.wetness(x) <= 3) output("get even wetter");
		else if(pc.wetness(x) <= 4) output("drool even harder");
		else output("spatter moisture to the ground");
		output(".");
		if(pc.hasClit()) output(" She is sure to make sure a fingertip brushes [pc.oneClit] until you shudder in excitement.");
	}
	//Select appropriate comment
	//Super-wet
	if(pc.wetness(x) >= 5)
	{
		output("\n\nV-Ko licks her lips at the sight of your juice-dripping pussy. <i>“Such a productive vagina.... It is made to be penetrated until it gushes with delight. I will not hold back. You will achieve orgasm and complete sexual relief in no more than five minutes.”</i>");
	}
	//Super gaped
	else if(pc.looseness(x) >= 5) output("\n\nV-Ko licks her lips at the sight of your capacitive cunt. <i>“You appear to be quite experienced at receiving vaginal pleasure. I will be sure to use an appropriately sized implement so that your walls receive the thrilling stretching they are surely used to at this point. Frequent orgasms are essential to long life!”</i>");
	//High bonus capacity or elasticity
	else if(pc.vaginas[x].bonusCapacity >= 20 || pc.elasticity >= 2) output("\n\nV-Ko licks her lips as she examines your entrance. <i>“You have such a wonderfully elastic pussy; it could rival the synth-cunts of pleasure-droids! I’ll be sure to give it a thorough working over until you’re dripping every little bit of tension into my mouth.”</i>");
	//Really wet
	else if(pc.wetness(x) >= 3) output("\n\nV-Ko marvels at how wet her fingers have become. <i>“Your vagina is wonderfully lubricated. I will be sure to lick every drop of reproductive tension out of your body and let you gush your juices all over my face. It’s the only way to ensure you leave 100% stress free.”</i>");
	//A lil gaped
	else if(pc.looseness(x) >= 3) output("\n\nV-Ko blinks her eyes as she examines your slightly-gaped entrance. <i>“I estimate that such a capacitive cunt will require thorough, rigid stimulation to bring about total stress relief. I should be able to bring you to a shuddering, clenching climax in no more than five minutes, allowing you to luxuriate in being completely sated.”</i>");
	//Pretty wet
	else if(pc.wetness(x) >= 2) output("\n\nV-Ko smiles at your wetness. <i>“Such a juicy little cunt. Being so prepared will ease penetration and ensure that I can stimulate the sensitive, interior nerves as vigorously as possible. I estimate that total relief of all breeding desires should occur within five minutes.”</i>");
	//Booooring
	else output("\n\nV-Ko examines you with a knowing smile. <i>“A pussy like this can be easily brought to full and proper satiation with the proper techniques. Five minutes of my mouth should be more than enough to reduce you to a quivering, stress-free wreck.”</i>");

	output("\n\nThe nursedroid licks her lips one more time, leaving them glossy and shining with artificial slipperiness, then pulls her tongue back inside. She gives you a tender smile and advances, placing her hands on your [pc.butt] before pressing her face against your cleft to give it a kiss. V-Ko’s lips have the perfect amount of warmth for pressing against a lusty pussy, and they are sinfully slick, coaxing shivers of pure delight with each slobbery kiss. She noisily gulps, and you hear something click deep within the artificial nurse.");
	output("\n\nWhen she opens her mouth, you’re immediately made aware that she’s done something with her tongue. Instead of a narrow tongue pressing into your gates, it’s something hard, thick, phallic, and even warmer than her lips. It wiggles slightly to change its alignment, earning an appreciative gasp from you, and slowly, inexorably works its way inside, filling you with its springy firmness. It goes in an inch at a time, slowly suffusing you with synthetic cock until you can bear no more. At that point, her lips brush");
	if(pc.hasClit()) output(" [pc.oneClit]");
	else output(" your labia");
	output(" meaningfully.");
	output("\n\n<i>“We’re just getting started,”</i> promises V-Ko’s surprisingly clear but slightly muffled voice. <i>“Just relax and get used to it.”</i> She wiggles the fake cock she has in place of her tongue against your inner walls");
	if(pc.hasClit()) output(" while your [pc.clit] disappears into her maw, immediately placed under a gentle, pulsating suction");
	output(". Your [pc.legOrLegs] go");
	if(pc.legCount == 1) output("es");
	output(" weak, but the nursedroid’s hold on your [pc.butt] supports you, holding you firmly in place as she pleases you.");
	output("\n\nYour fingers go to the back of her head to grab up fistfulls of her lustrous, pink hair. You wind up with both hands around her pigtails, and you enthusiastically tug on them, mashing her face more firmly against your thoroughly-filled slit. She’s thick and squirming, and it feels so fucking good that you can’t help but drip all over her pink cheeks as you ride her.");
	output("\n\nA second later, you find yourself thrust to the very cusp of orgasm. V-Ko’s cock-tongue has started vibrating; first with a low buzz, then a stronger, pernicious rumble that seems to vibrate pleasure through your very core. You throw your head back and thrust against her, heedlessly grinding yourself off, lost to lust and able to do naught by quiver your way to orgasm");
	if(pc.isSquirter()) output(", gushing [pc.girlCum] all over V-Ko’s face");
	else if(pc.wetness(x) >= 2) output(", drizzling [pc.girlCum] all over V-Ko’s face");
	else output(", dripping [pc.girlCum] into V-Ko’s mouth");
	output(". She holds you close throughout, never slowing");
	if(pc.totalVaginas() > 1) output(", though her fingers do find their way into your other empty slit");
	if(pc.totalVaginas() > 2) output("s");
	output(", keeping gut-clenching climaxes flowing through you one after another.");

	output("\n\nYour eyes roll back as you lose yourself to the pleasures of rapid-fire orgasms, shuddering atop the nursedroid like a sail in a hurricane. All you can focus on is the nerve-searing ecstasy emanating from your [pc.vagina]. Your eyes roll back, depriving you of sight so that you can better focus on the vibrations against your tender walls. Keening out moans of pleasure");
	if(pc.totalCocks() > 0) output(", you helplessly ejaculate again and again, leaving a puddle of [pc.cum] for the cleaning droids to tend to");
	else output(", you cum until you’re hoarse");
	output(".");

	output("\n\nAs awareness returns to you, you see V-Ko’s smiling face looking back at you. Her eyes lose their pinkish glow, but she purrs, <i>“Be sure and see me if breeding stress ever overwhelms you.”</i>");
	if(pc.inHeat())
	{
		output("\n\n<b>V-Ko has helped you overcome your heat. You feel so much more calm now.</b>");
		pc.clearHeat(false);
	}
	output("\n\nShe stands, leaving you sitting on the ground. You don’t even know how you got down there, and V-Ko doesn’t show any sign of telling you. She’s back to offering her normal services again.");
	processTime(10);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	approachVKo(false);
}


//Electro Therapy
//For all genders. I just hope you won’t ever let PC’s become nippleless.
public function vKoElectroTherapy():void
{
	clearOutput();
	author("LukaDoc & QB");
	showVKo();
	output("Her eyes light up as she processes your latest input and she says, <i>“Before proceeding, this unit states on behalf of JoyCo Incorporated that the company shall not be held responsible for any kind of physical or mental injury during the processing of this directive. If you accept the terms and conditions, please state your consent.”</i>");
	//[Agree][Disagree]
	clearMenu();
	addButton(0,"Agree",agreeToElectroStim);
	addButton(1,"Disagree",declineElectroStim);
}

//[=Disagree=]
public function declineElectroStim():void
{
	clearOutput();
	author("LukaDoc & QB");
	showVKo();
	output("A few lights blink out as she reboots and greets you again as if you had just arrived.");
	//(Play initial greeting.)
	approachVKo(false);
}

//[=Agree=]
public function agreeToElectroStim():void
{
	clearOutput();
	author("LukaDoc & QB");
	showVKo(true);
	output("<i>“Please, remove your clothing and lay down.”</i>");

	output("\n\nDoing as you were instructed, you carefully peel off your [pc.gear] and lay it neatly on a nearby table as you head for the adaptable chair.");

	output("\n\nIt whirrs as it detects your body and reshapes itself into a form that will be more comfortable for the procedure.");

	//else if naga:
	if(pc.isNaga()) output("\n\nIn your case, it takes the shape of a comfortable-looking operation chair with a pair of armrests. It has a standard upper part where your top half can lay down comfortably and an elongated spiralling pole for you to twist your snake-like lower half around. It’s surprisingly comfy and you quickly find yourself relaxed within the chair’s insets.");
	//else if goo:
	else if(pc.isGoo()) output("\n\nIn your case it looks like a tub. The interior is made of a sleek material that prevents your goo-like self from sticking. It’s very smooth and easy to move in. On one end you see something that looks like the top half of a comfortable-looking operation chair, with a pair of armrests. You set yourself down and let your lower half pool around on the small tub while you wait for V-Ko’s return.");
	//if taur:
	else if(pc.isTaur()) output("\n\nIn your case, it looks more like a strange leather-covered table. From the roof, a harness of some kind drops down, perfectly adjusted for your measurements. Shrugging, you step over the table, letting your tauric lower half slide in position. Though your [pc.legs] do reach the floor, you find that it’s just the right size for you to let your body slack without falling. Hesitantly, you don the harness dangling before you, attaching the straps to your torso, midriff and arms. You can’t help but feel a bit inappropriate as you hang there waiting for V-Ko’s return.");
	//if legs:
	else 
	{
		output("\n\nIn your case, it takes the shape of a comfortable-looking operation chair, with a pair of armrests");
	 	//if tail: 
	 	if(pc.tailCount > 0) output(" and even a hole on the back for your [pc.tails]");
	 	output(". It’s just long enough for someone of your size to comfortably lay down. The insets prevent you from rolling one way or another, so there’s no risk of you escaping your position.");
	}
	output("\n\nWhen the shebot returns, she’s holding a white case filled with what you assume are the assorted tools she’ll be using for the job. A table emerges from the floor and she sets the case down and begins organizing the <i>toys</i> she’ll be using on you shortly.");

	output("\n\nYou have to admit to yourself that if you didn’t know any better, this would actually look like a medical procedure.");
	output("\n\n<i>“Please relax and stay calm, " + pc.mf("sir","madam") + ",”</i> she states as the <i>chair</i> begins emitting a whirring from underneath you once more.");

	//if taur:
	if(pc.isTaur()) output(" You suddenly feel your arms pulled upwards by the harness, effectively rendering you stuck.");
	//else
	else output(" A pair of cuffs form on the armrests, effectively restraining you.");

	//elseif naga:
	if(pc.isNaga()) output(" At regular intervals around the pole, cuff-like struts rise out and clamp down across your length, anchoring your lower body firmly to the support pole so that you cannot remove your coils from it.");
	//elseif taur:
	else if(pc.isTaur()) output(" Underneath you, small mechanical arms ending in rounded cuffs emerge from the floor near each of your feet, snapping closed around your ankles and binding you firmly in place.");
	//if legs:
	else 
	{
		output(" More cuffs form around the edge of the insets, clamping down over your [pc.legOrLegs] and immobilizing");
		if(pc.legCount == 1) output(" it");
		else output(" them");
		output(" as well.");
		if(pc.tailCount > 0)
		{
			output(" From behind you, you can hear your [pc.tails] being given the same treatment, feeling ");
			if(pc.tailCount == 1) output("a clamp snap shut on your length");
			else output("multiple clamps snapping shut along your lengths");
			output(" and binding you to the chair.");
		}
	}

	output("\n\nV-Ko starts off by placing an electrode on each of your nipples, a thin wire extends to a console which you assume must be used to control the entire setup.");
	//if cock:
	if(pc.hasCock())
	{
		output("\n\nShe procures " + num2Text(pc.cockTotal()) + " thin, metallic rods. ");
		if(pc.cockTotal() == 1) output("It’s");
		else output("They’re");
		output(" pretty small and ");
		if(pc.cockTotal() == 1) output("the ");
		else output("their ");
		output(" tip");
		if(pc.cockTotal() > 1) output("s are");
		else output(" is");
		output(" blunted into a round shape. On top of ");
		if(pc.cockTotal() > 1) output("each ");
		else output("the ");
		output(" rod, ");
		if(pc.cockTotal() > 1) output("there’s a");
		else output("there are");
		output(" small connector");
		if(pc.cockTotal() > 1) output("s");
		output(" whose wire");
		if(pc.cockTotal() > 1) output("s");
		output(" V-Ko connects to the console.");

		output("\n\nShe approaches you and begins stroking [pc.eachCock] until you’re rock hard and leaking pre. Then she inserts the ");
		if(pc.cockTotal() > 1) output("first ");
		output("metal rod into your urethra.");
		output("\n\nIt’s a weird feeling. Somewhat uncomfortable, but it also feels kinda good.");

		//if more than 1 cock:
		if(pc.cockTotal() > 1) 
		{
			output("\n\nThe process is repeated for ");
			if(pc.cockTotal() > 2) output("each of ");
			output("your other cock");
			if(pc.cockTotal() > 2) output("s");
			output(".");
		}
		
		pc.cockHoleChange();
	}
	output("\n\nShe lifts what looks like an inflatable butt-plug and applies a liberal amount of lube to it, then walks towards you and does the same to your [pc.asshole].");
	output("\n\nHissing as the cold gel touches your sensitive rosebud, you force yourself to relax so she can insert the plug. It spreads you slightly as it enters you. No doubt it’ll do much more stretching once she’s actually turned it on. Anticipation courses throughout your body, heating you up as you watch her go back to the case.");
	//if vagina:
	if(pc.hasVagina())
	{
		output("\n\nNext she procures a");
		if(pc.vaginaTotal() == 2) output(" pair of");
		else if(pc.vaginaTotal() > 2) output(" few");
		output(" terran-looking rubber dildo");
		if(pc.vaginaTotal() > 1) output("es");
		output(". And after a quick check to make sure you’re moist enough, she inserts");
		if(pc.vaginaTotal() == 1) output(" it");
		else output(" each of them");
		output(" into your [pc.vaginas].");
	}
	//if balls:
	if(pc.balls > 1)
	{
		output("\n\nShe produces " + num2Text(pc.balls) + " small, wide-mouthed suction-cups attached to slender rubber hoses. Methodically, she holds the rubber-lipped things over your [pc.balls], barely an inch or so away from the skin. A gentle vacuum effect tickles your scrotum before it allows her to ‘stick’ the cups in place. You can feel the suction fade out, but it kicks back in on occasion, a feather-light touch that tickles you nicely, happening unpredictably so you can never quite guard against the sensation.");
	}
	//if tail:
	if(pc.tailCount > 0)
	{
		output("\n\nYou feel her gently pet your [pc.tails], stroking and measuring their girth.");
		//if cocktail: 
		if(pc.hasCockTail()) output(" It feels good, you can already feel the [pc.tailCockHeads] of your [pc.tailCocks] hardening.");
		if(pc.hasTailCunt()) output(" Moisture drips from your [pc.tailCunts] as she strokes you. The anticipation for what’s to follow is enough to almost make you giddy.");
		output(" V-Ko procures " + num2Text(pc.tailCount) + " ring");
		if(pc.tailCount > 1) output("s");
		output(" from her case and brings");
		if(pc.tailCount == 1) output(" it");
		else output(" them");
		output(" over. She attaches ");
		if(pc.tailCount == 1) output("it ");
		else output("them, one by one, ");
		output("to your [pc.tails]. Then she connects a wire to ");
		if(pc.tailCount == 1) output("the ");
		else output("each ");
		output("ring.");
	}
	output("\n\nFinally, she finds a ring. <i>“Please open your mouth, " + pc.mf("sir","madam") + ",”</i> she requests. You comply.");
	output("\n\nThe ring prevents you from biting down and it’s tied up behind your head, ensuring you have no way to dispose of it.");
	if(pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output(" A few straps hold your [pc.face] shut to prevent any possible accidents.");

	output("\n\nShortly after she inserts a small plug, made from some sort of elastic gel inside your maw. It’s long enough to almost reach your throat. A wire connects it to the console, similar to the other toys. With a small click, she finishes attaching it to the ring inside your mouth.");
	output("\n\n<i>“Ready to begin, " + pc.mf("sir","madam") + "?”</i>");

	output("\n\nYou nod, grunting your assent.");

	output("\n\nA small beep confirms that V-Ko’s turned on the toys, each of them vibrating and stimulating you as you begin panting in arousal.");

	//if nipples are big enough:
	if(pc.nippleLength(0) >= .5)
	{
		output(" As your nipples grow erect, you can feel the electrodes changing to accommodate them. They extrude outwards at the same time their rim grows tighter on your areolae.");
	}
	output(" The plug up your ass expands experimentally, vibrating gently ");
	if(pc.hasCock()) output("and stimulating your prostate ");
	output("as it boots up.");
	//if pussy:
	if(pc.hasVagina())
	{
		output(" The dildo");
		if(pc.vaginaTotal() > 1) output("es");
		output(" inside your [pc.vaginas] begin");
		if(pc.vaginaTotal() == 1) output("s");
		output(" slowly gyrating and writhing inside. A prelude of things to come.");
	}
	//if cock:
	if(pc.hasCock())
	{
		output(" The metal rod inside [pc.eachCock] vibrates on a very low frequency. Low enough that you can’t cum from this and high enough that pre leaks out of you like a hose. By now you have no doubt you’ve turned the ground underneath into a small puddle.");
	}
	output("\n\nThe strange gel tentacle inside your maw begins moving, massaging your tongue. You begin <i>kissing</i> it back, your moans muffled by its girth.");

	//if balls:
	if(pc.balls > 1) output("\n\nThe suction cups on your balls continue their ministrations. They never apply too much or too little pressure, always keeping you on edge. Frustration builds up inside your balls into a nice, thick load of [pc.cum], just awaiting the inevitable rise that will bring you over the edge.");
	//if tails:
	if(pc.tailCount > 0)
	{
		output("\n\nFor now the tail-ring");
		if(pc.tailCount > 1) output("s don’t");
		else output(" doesn’t");
		output(" seem to be doing anything, though you do feel some micro-vibrations emanating from the ring.");
	}
	output("\n\nSlowly, but surely, the toys become more lively. Your anal plug begins a series of contractions and expansions");
	if(pc.hasCock()) output(", each expansion stimulating your prostate and pressing fatter gobs of pre from your [pc.cocks]");
	output(".");

	output("\n\nYour mock kisser loops around your own [pc.tongue] like a lover’s. For a machine, it’s quite proficient. It takes advantages of your muffled moans to probe deeper inside you, almost throat-fucking you. If it had the length, you have no doubt that this is exactly what it’d be doing.");
	output("\n\nThe other <i>attachments</i> you’re hooked up to don’t seem to be doing much of anything at the moment...");

	output("\n\nSure, the nipple-clamps give you the lightest shocks, sometimes, and it’s kinda pleasing. But far from anything overly-stimulating.");

	if(pc.hasCock())
	{
		output(" The rod");
		if(pc.cockTotal() > 1) output("s");
		output(" inside your cumvein ");
		if(pc.cockTotal() > 1) output("don’t");
		else output("doesn’t");
		output(" do anything but vibrate lightly either. Once you get used to their sensation, it’s kind of pleasing, but nothing special either.");
	}
	//if vagina:
	if(pc.hasVagina())
	{
		output(" The dildo");
		if(pc.vaginaTotal() > 1) output("s");
		output(" up your [pc.vaginas] ");
		if(pc.vaginaTotal() == 1) output("doesn’t");
		else output("don’t");
		output(" seem that special. All ");
		if(pc.vaginaTotal() > 1) output("they ");
		else output("it ");
		output("can do is gyrate lightly.");
	}
	output("\n\nAs you get used to the pleasure being inflicted upon you, you start to get almost... bored. It’s not until you see a red flash on the corner of your eyes that you note a new prompt on the console next to V-Ko.");

	output("\n\nIt reads: “Engage Hardcore Mode”");
	output("\n\nThere’s a timer right below, almost running out.");

	//first time:
	if(flags["TIMES_ELECTROSTIMMED_BY_VKO"] == undefined)
	{
		flags["TIMES_ELECTROSTIMMED_BY_VKO"] = 1;
		output("\n\nYou wonder what exactly hardcore mode is....");
	}
	else output("\n\nAny time now, you tell yourself. A perverse smile creeping along the edges of your stuffed mouth.");

	output("\n\nThe timer ends with a soft click.");

	output("\n\nYour anal plug starts to expand and contract with far greater force, rutting you with mechanical intensity, grinding itself into your very depths.");
	if(pc.cockTotal() > 0) output(" Your prostate is massaged relentlessly by the rippling plug, forcing semen to pour from your [pc.cocks] with the sheer strength of its motions.");
	//ifVagina:
	if(pc.hasVagina()) 
	{
		output(" Not to be outdone, the vibrator");
		if(pc.vaginaTotal() > 1) output("s");
		output(" buried in your [pc.cunts] roar");
		if(pc.vaginaTotal() == 1) output("s");
		output(" into life, buzzing around madly");
		if(pc.hasClit()) output(", repeatedly flicking your [pc.clits], more by accident than design");
		output(". It is only a machine - but the sensation is enthralling.");
	}

	output("\n\nThe clamps attached to your [pc.nipples] almost audibly hum as their voltage increases, sharp surges of electricity coursing over your sensitive flesh. Pleasure washes through you, your body jolting against your restraints with each spark that strokes your nerves.");
	if(pc.tailCount > 0)
	{
		output(" Behind you, your [pc.tails]");
		if(pc.tailCount == 1) output(" is ");
		else output(" are ");
		output("getting the same treatment; it doesn’t truly compare to the sensations against your nipples, but, mmm, it feels so good!");
	}
	output("\n\nThe tentacle-like artificial tongue writhes in your mouth, plunging deeper inside of you until it is literally throat fucking you, muffling your cries of pleasure even as it strokes and plays with you. The pleasure just keeps growing and growing as the devices continue to play with you");
	if(pc.balls > 1) output(", even the suctioning of your [pc.balls] seems to underscore everything else just perfectly");
	output(", and you feel your resistance crumbling.... You’re going to cum!");

	output("\n\nYour climax hangs in the balance, you almost feel like blacking out as the pleasure consumes you, but, inevitably, you cannot hold out");
	if(pc.hasCock())
	{
		output(", especially not when the rod");
		if(pc.totalCocks() > 1) output("s");
		output(" inserted inside your [pc.cocks] deliver");
		if(pc.totalCocks() == 1) output("s");
		output(" a sudden sharp shock of its own");
	}
	output("! Gagged by the mechanical tongue in your mouth, your back arches as your whole body clamps down in orgasm, climax washing across of you.");

	output("\n\nStill the machines play with you, already sensitive nerves pushed to their limit as they continue to mechanically manipulate you even mid-climax, your orgasm just going on and on, growing ever more intense until you cannot take it anymore. In the midst of the most literally mind-blowing climax you can ever remember having, you lose consciousness.");

	output("\n\nWhen you wake, you are lying atop the mattress. You’re still naked, but also clean as a whistle; it looks like V-Ko took care of you after you passed out. At the thought, a smile unthinkingly washes over your face; you’re still tingling with delight at what you just experienced.");

	output("\n\nUpon noticing that you’ve awakened, V-Ko immediately bows. <i>“Procedure concluded, thank you for your patronage.”</i>");
	output("\n\nRising from the mattress, you stretch out a few kinks, grab your [pc.gear] and put it back into place, then head back out of the clinic.");
	processTime(50+rand(15));
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Breast Pump (Stress relief for milky breasts)
//Requires players with lactating boobs.
public function VKOBreastPumpFunction():void {
	clearOutput();
	author("LukaDoc & QB");
	showVKo();
	//if PC doesn’t meet the requirements:
	if(!pc.isLactating() || pc.biggestTitSize() < 1)
	{
		output("After the input, V-Ko’s eye scanners light up for a moment, looking you over. Finished, the shebot states, <i>“Unable to comply.”</i>");
		output("\n\nA few lights blink out as she reboots and greets you again as if you had just arrived.");
		processTime(1);
		//(Play initial greeting.)
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	output("Her eyes light up as she processes your latest input, scanning your form and focusing particularly on your [pc.milk]-filled [pc.breastsNoun]. Her eyes flicker as they confirm the presence of fluid, before powering down their scan mode as she says, <i>“Please confirm that this is the directive which you wish to engage.”</i>");
	processTime(1);
	//[Agree][Disagree]
	clearMenu();
	addButton(0,"Agree",agreeToVKoBoobSucks);
	addButton(1,"Disagree",declineToGetYourBreastVKOPumped);
}

//[=Disagree=]
public function declineToGetYourBreastVKOPumped():void
{
	clearOutput();
	author("LukaDoc & QB");
	showVKo();
	output("A few lights blink out as she reboots and greets you again as if you had just arrived.");
	//(Play initial greeting.)
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=Agree=]
public function agreeToVKoBoobSucks():void
{
	clearOutput();
	author("LukaDoc & QB");
	showVKo(true);
	output("The nursedroid points to a nearby chair. It twists and reshapes itself into a comfy ");
	if(!pc.isTaur() && !pc.isDrider() && !pc.isNaga() && !pc.isGoo()) output("easy chair");
	else output("mattress");
	output(".");

	output("\n\nWith a nod, you move over to the indicated seat");
	if(!pc.isChestExposed()) output(", already removing your [pc.upperGarments]. Once your [pc.breasts] are exposed");
	else output(". With your [pc.breasts] already exposed");
	output(", you settle down on the ");
	if(!pc.isTaur() && !pc.isDrider() && !pc.isNaga() && !pc.isGoo()) output("chair");
	else output("mattress");
	output(" and make yourself comfortable; once you find the position you’re most happy in, you indicate to the nursedroid that you’re ready to begin.");
	output("\n\nV-Ko approaches you, and you note the crosses on her chest moving. They retract inward, sinking in to expose a pair of prehensile, hose-like protrusions. The crosses themselves have melted into concave, parabolic arcs perfectly sized to fit your [pc.breasts]. Without further ado, the cups align themselves with your [pc.nipples] and give each an experimental pump.");

	output("\n\nA shudder ripples across your skin and you bite back a moan as you feel your [pc.nipples] pop into place, encapsulated by the suctioning cups.");
	if(pc.hasFuckableNipples()) output(" Though your [pc.nipples] have no protrusions to play with, that doesn’t stop the cups from fashioning themselves around your areolas and ensuring that your [pc.milk] will go inside of the nursedroid.");
	if(pc.bRows() > 1) output(" Below your primary tits, your remaining breasts practically tingle with anticipation of their turn.");

	output("\n\nHer chest starts emitting a low pumping noise, and you feel the cups begin to drain you of your [pc.milk]. You breathe a sigh of relief, humming in pleasure as the suction cups stimulate you in a most delightful manner. It’s not quite sexual, at least not so much that you’re going to cum over the seats any moment now, but still very satisfying on a deep level.");

	output("\n\nYou’re so relaxed that you find yourself slipping into an almost trance-like state, the steady pumping of your breasts almost lulling you to sleep. You can’t help but groan in disappointment when the cups pop from your breasts, some of the excess [pc.milkNoun] leaking from V-Ko. Her own chest looks ");
	
	var milkQ:Number = pc.milkQ();
	if(milkQ < 500) output("at least a little inflated.");
	else if(milkQ < 5000) output("bloated.");
	else if(milkQ < 10000) output("enormous, she must’ve drained quite a bit from you.");
	else output("ready to burst, then again it’s no surprise with how productive you are.");

	output("\n\nAs the droid busies herself with emptying your [pc.milk] from her tits and into a nearby receptacle, your fingers reach up and gently knead the tender flesh of your [pc.breasts]. A smile crosses your lips as you stroke the still-tingling, sensitive skin of your just-milked nipples. You may not have climaxed from this treatment, but you still feel a lot better than you did before - it’s just so good to get all that [pc.milk] <b>out</b>.");
	if(pc.bRows() > 1) output(" Your lower breasts still ache with their load, though, and your smile widens in anticipation; you’re going to enjoy getting them milked, too.\n\nAs soon as she’s done, V-Ko returns and readjusts her suction cups, twisting them to fit your lower row of breasts. You gasp as they latch onto you and begin the process anew. A pleasured moan escaping you as you allow yourself to slip back into your milking trance....");
	output("\n\nDone milking you, V-Ko looks to you and bows. <i>“Procedure concluded, please come again.”</i>");

	output("\n\nRising from the ");
	if(!pc.isTaur() && !pc.isDrider() && !pc.isNaga() && !pc.isGoo()) output("chair");
	else output("mattress");
	output(", you roll your neck and shoulders, smiling in pleasure at the feeling of relief that comes from being drained of your heavy load - it feels so good to have lightened your burden. Gathering your things, you reapply your top and leave the clinic.");
	StatTracking.track("joyco/milk milked", milkQ);
	processTime(45+rand(10));
	pc.changeLust(rand(10)+1);
	pc.milked(pc.milkFullness);
	//(Possibly give the PC’s milk back, bottled and useable as an item?)
	//(Only if you want Fen.)
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
