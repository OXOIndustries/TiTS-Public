import classes.Characters.PlayerCharacter;
import classes.GameData.Pregnancy.Child;
import classes.GameData.Pregnancy.UniqueChild;
import classes.GameData.Pregnancy.Containers.Genders;

/* Briget functions */
public function showBriget(nude:Boolean = false):void
{
	showName("\nBRIGET");
	showBust(brigetBustDisplay(nude));
}
public function brigetBustDisplay(nude:Boolean = false):String
{
	var str:String = "BRIGET";
	
	if(brigetIsBusty()) str += "_TITS";
	if(brigetIsPregnant()) str += "_PREG";
	if(nude) str += "_NUDE";
	
	return str;
}
public function brigetIsBusty():Boolean
{
	return false;
}
public function brigetIsPregnant():Boolean
{
	return false;
}

// General support shit
public function hasNurseryUpgrades():Boolean
{
	return false;
}

public function numNurseryUpgrades():int
{
	var numUpgrades:int = 0;
	// ???
	return numUpgrades;
}

public function hasNurseryStaff():Boolean
{
	return (numNurseryStaff() > 0);
}

public function numNurseryStaff():int
{
	var numStaff:int = 0;
	if (yammiAtNursery()) numStaff++;
	if (reahaAtNursery()) numStaff++;
	if (zilCallgirlAtNursery()) numStaff++;
	return numStaff;
}

public function yammiIsFollower():Boolean
{
	return false;
}

public function yammiAtNursery():Boolean
{
	return false;
}

public function reahaAtNursery():Boolean
{
	return false;
}

public function zilCallgirlAtNursery():Boolean
{
	if (flags["ZIL_CALLGIRL_AT_NURSERY"] == 1) return true;

	if (flags["ZIL_CALLGIRL_DISABLED_TYPE"] == 3 && flags["ZIL_CALLGIRL_DISABLED_TIMESTAMP"] != undefined && flags["ZIL_CALLGIRL_DISABLED_TIMESTAMP"] + (24 * 60) <= GetGameTimestamp())
	{
		flags["ZIL_CALLGIRL_AT_NURSERY"] = 1;
		return true;
	}

	return false;
}

public function visitedNursery():Boolean
{
	if (flags["BRIGET_MET"] != undefined || flags["NURSERY_VISITED"] != undefined || flags["USED_NURSERY_COMPUTER"] != undefined) return true;
	return false;
}

// Room functions


public function nurseryFoyerFunc():Boolean
{
	if (pc.hasStatusEffect("Pregnancy Pending") && pc.hasPregnancyOfType("ZephyrPregnancy"))
	{
		zephyrPregnancyEnds();
		return false;
	}

	if(flags["ELLIE_PREG_TIMER"] == 70 && flags["ELLIE_OPERATION"] == 3) return ellieEggsHatching();
	else if(isHalloweenish() && havePumpkinCarvingScenes() && flags["CARVED_W_KIDDOS"] == undefined) return doPumpkinCarving();
	else if(!isHalloweenish()) flags["CARVED_W_KIDDOS"] = undefined;
	
	output(" The Steele Tech logo is emblazoned across the wall opposite the elevator, surrounded by pastel-colored images of flowers and small animals.");
	if (silly) output(" There’s even a cute little cartoonish cow!");
	output(" A holo-terminal dominates the western wall, slowly scrolling through reams of digital text - the status of");
	var numChildren:int = ChildManager.numChildrenAtNursery();
	if (ChildManager.numChildren() == 0) output(" the nursery. One glance says it’s waiting and ready for the first of your spawn.");
	else if (numChildren == 1) output(" your child.");
	else output(" your children.");

	if (flags["BRIGET_MET"] == undefined)
	{
		output("\n\nA pallid-skinned woman in a suit-jacket and skirt is standing behind a desk, consulting a Codex couched under her arm. She doesn’t appear to have noticed you yet.");
		
		addButton(0, "Woman", nurseryMeetBriget);
	}
	else if (hours >= 7 && hours <= 16)
	{
		output("\n\nBriget is busily typing away behind the welcome desk. Seeing you standing around, your nurse-droid favors you with a matronly smile and slows the pace of her work invitingly, making herself look more available for you.");
		addButton(0, "Briget", nurseryApproachBriget);
	}

	addButton(1, "NurseryComp.", nurseryComputer, undefined, "Nursery Status Computer", "The holoterminal in the nursery is set up to monitor and summarize the status "+ (numChildren == 0 ? "of your potential children" : (numChildren == 1 ? "of your child" : "of all your children")) +", letting you stay up-to-date with a push of a button.");

	if(ChildManager.numChildrenAtNursery() < 1 && flags["ELLIE_PREG_TIMER"] < 70 && flags["ELLIE_AT_NURSERY"] != undefined)
	{
		output("\n\nYou find Ellie milling about in the reception area, clearly deep in thought as she mumbles to herself.");
		addButton(2, "Ellie", ellieAtNurseryPreHatch, undefined, "", "");
	}

	if(flags["NURSERY_VISITED"] == undefined) flags["NURSERY_VISITED"] =1;

	return false;
}

public function zephyrKidsOption(btnSlot:Number):Number
{
	var numZephKids:int = ChildManager.numOfUniqueType(ZephyrUniqueChild);

	if (numZephKids > 0)
	{
		if (hours > 6 && hours < 22)
		{
			output("\n\nYour kids fathered by Zephyr look like they’re growing up fast; undoutedly entirely human, something of a rarity in your nursery, but mightily energetic. Probably little troublemakers in waiting for you and the nursery staff!");

			addButton(btnSlot, "ZephyrKids", playWithZephKids, undefined, "Zephyr Kids", "Play with your kids.");
			btnSlot++;
		}
		else if (zephAtNursery())
		{
			output("\n\nYour kids fathered by Zephyr are fast asleep, tuckered out from a long day of activity. Zephyr herself has fallen victim to her exhaustion too, sound asleep amongst your children.");

			addButton(btnSlot, "ZephyrPics", picsWithZephKids, undefined, "Zephyr Pics", "Take some pictures of your kids’ proud second mommy.");
			btnSlot++;
		}
		else
		{
			output("\n\nYour kids fathered by Zephyr are fast asleep, tuckered out from a long day of activity.");
		}
	}
	
	return btnSlot;
}

public function zilBabyBonus(btnSlot:Number):Number
{
	var zilBlurbs:Array = [];
	
	if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_BEE, 0, 12) > 0) zilBlurbs.push("Your half-breed zil babies are happily resting their day away nearby, and you could probably pay them a visit if you’d like.");
	if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_BEE, 13, 36) > 0) zilBlurbs.push("Your bee-kids are playing nearby, quickly noticing your presence and giggling happily, probably hoping you’ll pay them a visit.");
	if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_BEE, 0, 12) > 0 && ChildManager.numOfTypeInRange(GLOBAL.TYPE_BEE, 13, 36) > 0) zilBlurbs.push("Your half-breed zil babies are happily resting their day away nearby, and your older bee-kids are playing around the nursery, giggling happily, probably hoping you’ll pay them a visit.");
	
	if(zilBlurbs.length > 0) output("\n\n" + zilBlurbs[rand(zilBlurbs.length)]);
	
	if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_BEE, 0, 36) > 0)
	{
		// Picks randomly if the PC has both toddlers and newborns. Should exclude Zhen’s kids if possible, should actually just be restricted to generic zil offspring, or require multiple zil children. 
		addButton(btnSlot, "Zil", playWithZil, undefined, "Zil Kids", "Pay a visit to your half-breed children.");
		btnSlot++;
	}
	else if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_BEE, 37, 9001) > 0)
	{
		addDisabledButton(btnSlot, "Zil", "Zil Kids", "You don’t have any kids young enough to play with. Maybe when you finish the quest, you’ll have time to be a real parent.");
		btnSlot++;
	}
	return btnSlot;
}
public function playWithZil(choice:Number = -1):void
{
	clearOutput();
	author("HugsAlright");
	showName("PLAY\nTIME!");
	
	if(choice == -1)
	{
		output("Which age group will you play with? (Buttons are in month age ranges)");
		clearMenu();
		if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_BEE, 0, 12) > 0) addButton(0, "0-12 Months", playWithZil, 0);
		else addDisabledButton(0, "0-12 Months", "0-12 Months", "You have no kids in that age range.");
		if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_BEE, 13, 36) > 0) addButton(1, "13-36 Months", playWithZil, 1);
		else addDisabledButton(1, "13-36 Months", "13-36 Months", "You have no kids in that age range.");
		if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_BEE, 37, 9001) > 0) addDisabledButton(3, "37+ Months", "37+ Month", "These kids are too old to play with.");
		return;
	}
	
	var boy:Boolean = false;
	var girl:Boolean = false;
	var msg:String = "";
	var numBabies:int = 0;
	
	var minAge:int;
	var maxAge:int;
	var children:Array = ChildManager.getChildrenOfType(GLOBAL.TYPE_BEE);
	var zilChildren:Array = [];
	var zilIdx:int = -1;
	
	if(choice == 0) { minAge = 0; maxAge = 12; }
	else if(choice == 1) { minAge = 13; maxAge = 36; }
	
	// Filter for children and ages
	if(children != null && children.length > 0)
	{
		zilIdx = 0; // The oldest should be first in the array!
		if(maxAge != -1 && maxAge < minAge) maxAge = -1;
		for(var i:int = 0; i < children.length; i++)
		{
			var c:Child = children[i] as Child;
			var m:int = c.Months;
			if((maxAge == -1 || m <= maxAge) && m >= minAge)
			{
				zilChildren.push(c);
				numBabies += c.Quantity;
			}
		}
	}
	// If valid children, set perameters.
	if(zilChildren.length > 0)
	{
		zilIdx = rand(zilChildren.length);
		if(zilChildren[zilIdx].NumMale > 0) boy = true;
		if(zilChildren[zilIdx].NumFemale > 0) girl = true;
		if(boy && girl) boy = (rand(2) == 0);
	}
	
	// Newborn
	// Available from 0-730 days in game, chooses random child gender if both are available.
	if(choice == 0)
	{
		if(pc.isLactating() && rand(2) == 0)
		{
			msg += "You decide you’re going to feed your babies while you’re here. Picking up one of from them from their cribs, you hear " + (boy ? "him" : "her") + " coo with glee when they open their " + ((zilIdx >= 0 && (zilChildren[zilIdx] is UniqueChild)) ? zilChildren[zilIdx].eyeColor : "[baby.eyeColor]") + " eyes and see your face looking back at them. Even with the amazing staff this nursery has, you’re sure all your children would enjoy a meal from their " + pc.mf("father", "mother") + ".";
			msg += "\n\nWith just that in mind, you";
			if(!pc.isChestExposed()) msg += " remove your top and";
			msg += " lift your " + (boy ? "son" : "daughter") + " to your chest. Almost immediately " + (boy ? "he" : "she") + " latches onto your teat and starts to suckle, taking in your nourishing nectar. You’re left alone in a blissful silence, a warm fuzzy feeling permeating your body as parental instincts take over.";
			msg += "\n\nAfter a while your baby has had " + (boy ? "his" : "her") + " fill, and you put the delicate bundle back into " + (boy ? "his" : "her") + " crib, quietly sleeping and well-fed.";
			if(numBabies == 2) msg += " Then, you do the same for " + (boy ? "his" : "her") + " sibling, giving the infant a nice meal and a warm, " + pc.mf("fatherly", "motherly") + " embrace before you set the baby down to rest again.";
			else if(numBabies > 2) msg += " Then, you do the same for all your other babies, giving them a nice meal and a warm, " + pc.mf("fatherly", "motherly") + " embrace before you set them down to rest again.";
			msg += "\n\nOnce all is said and done, you’re left feeling fulfilled as a parent, gazing down upon your offspring one last time before heading back to the rest of the nursery.";
		}
		else
		{
			msg += "You decide you’re going to play with your babies for a bit while you’re here. Picking up one of from them from their cribs, you hear " + (boy ? "him" : "her") + " coo with glee when they open their " + ((zilIdx >= 0 && (zilChildren[zilIdx] is UniqueChild)) ? zilChildren[zilIdx].eyeColor : "[baby.eyeColor]") + " eyes and see your face looking back at them. Even with the amazing staff this nursery has, you’re sure they could use a " + pc.mf("father", "mother") + "’s touch.";
			msg += "\n\nWith that in mind, you lift your baby up to your to your face, looking at " + (boy ? "his" : "her") + " smiling face for a moment. You can’t help but grin at your offspring’s happy mien, and blowing a raspberry on " + (boy ? "his" : "her") + " cheeks, drawing a chorus of joyous baby-giggles from the half-breed.";
			msg += "\n\nPlaying with babies seems to be so easy, bouncing " + (boy ? "him" : "her") + " in your arms, tickling, and peek-a-boo, all of it making for one happy bee. Eventually, your child grows tired, and with a few last embraces, you put the newborn back in " + (boy ? "his" : "her") + " crib, happily sleeping. Then, you do the same for all your other babies, taking time out of your busy schedule to make sure they all have smiles on their faces before setting them down to rest again.";
			msg += "\n\nOnce all is said and done, you’re left feeling fulfilled as a parent, gazing down upon your offspring one last time before heading back to the rest of the nursery.";
		}
		output(msg);
		
		processTime(5);
	}
	// Toddler
	// Available from 731 day in game and onwards. Chooses a random variant if both genders are available.
	else if(choice == 1)
	{
		if(boy)
		{
			msg += "Before you can even go over to them, one of your zil sons runs up to you, flanked by his " + (numBabies == 2 ? "twin" : "siblings at either side") + ". He looks quite a bit like you, bearing human skin and hair, but maintaining a zil’s appearance, especially with all that chitin growing on his limbs and those wings on his back.";
			msg += "\n\n<i>“" + pc.mf("Daddy, Daddy", "Mommy, Mommy") + "!”</i> he shouts barely able to stop himself from tripping when he stops in front of you, <i>“Wanna see something cool I learned how to do?!”</i>";
			msg += "\n\nYou smile and bring yourself down";
			if(pc.isTaur()) msg += " on your haunches";
			else if(pc.hasKnees()) msg += " on your knees";
			msg += " in front of the toddler and tell him you’d love to see.";
			msg += "\n\nA huge grin appears on your son’s face, <i>“Alright! Watch this!”</i> His mien quickly changes to one of pure concentration. Then <i>pop</i>! His wings fold out and start to buzz gently... much less intimidation than his full-sized kinsmen. Nevertheless, you smile as the young half-breed attempts a take-off, and sure enough, his perseverance pays off. His quickly flapping wings propel him off the ground, only a few inches, hovering there for a moment before he drops back onto the ground. He seems exhausted after that, breathing heavily but looking up at your with pride in his smile, <i>“Did I do that good, " + pc.mf("daddy", "mommy") + "?”</i>";
			msg += "\n\nYou chuckle and tell the tiny bee-boy you’re very impressed with that, and think he’ll be soaring all around the nursery in no time at all.";
			msg += "\n\n<i>“Really?!”</i> he exclaims, his " + (numBabies == 2 ? "twin" : "siblings") + " clapping supportively behind him, <i>“Okay! I’m gonna go practice some more then!”</i>";
			msg += "\n\nAnd like that, your son " + (numBabies == 2 ? "is" : "and his kin are") + " running off again. They seem to get along well together...";
		}
		else
		{
			msg += "Before you can even go over to them, one of your zil daughters runs up to you, flanked by her " + (numBabies == 2 ? "twin" : "siblings at either side") + ". She looks quite a bit like you, bearing human skin and hair, but maintaining a zil’s appearance, especially with all that chitin growing on her limbs and that abdomen behind her.";
			msg += "\n\n<i>“" + pc.mf("Daddy, Daddy", "Mommy, Mommy") + "!”</i> she shouts, barely able to stop herself from tripping when she stops in front of you. Then she takes up a slightly guilty stance, hiding her hands behind her back, <i>“I think I stung someone accidentally.”</i>";
			msg += "\n\nYou look at that tiny stinger on the bee-girl’s abdomen and smile warmly at your offspring asking her just who she thinks she hurt.";
			msg += "\n\nBefore she can answer, " + (numBabies == 2 ? "her twin" : "one of her siblings") + " takes a couple steps towards you, brandishing quite the welt on their tiny arm. This prompts you to ask your daughter why she hasn’t gone to Briget about this.";
			msg += "\n\n<i>“I thought I would get in trouble...”</i> she mumbles, looking down at her feet.";
			msg += "\n\nYou chuckle and extend your arms forward, then pull the tiny half-breed into a hug, telling her that sometimes you do something wrong and you have to get in trouble, but that it’s also the right thing to do. It also behooves you to explain that she needs to be more careful with her abdomen.";
			msg += "\n\nWhen she pulls back from the hug, her face seems a lot less nervous, and a lot more happy, <i>“Thanks, " + pc.mf("daddy", "mommy") + ", I promise we’ll go to Briget now!”</i>";
			msg += "\n\nThen like that she and her kin are off in their caretaker’s direction, leaving you with quite a bit of parental-pride swelling in your chest.";
		}
		msg += "\n\nWell, you unfortunately don’t have much more time to spend here with a fortune that still needs chasing, looks like you should say your goodbyes and get moving.";
		output(msg);
		
		processTime(7);
	}
	
	// Returns the PC to the nursery.
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function milodanPlayOptions(button:Number):Number
{
	if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 0, 16) > 0)
	{
		addButton(button,"Milodan",playWithMilodan);
		button++;
	}
	else if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 17, 9001) > 0)
	{
		addDisabledButton(button,"Milodan","Milodan","You don’t have any kits young enough to play with. Maybe when you finish the quest, you’ll have time to be a real parent.");
		button++;
	}
	//else output("\n\nDafuq is dis shit?");
	return button;
}
public function playWithMilodan(choice:Number = -1):void
{
	clearOutput();
	author("Wsan");
	showName("PLAY\nTIME!");
	//Build menu for playing
	if(choice == -1)
	{
		output("Which age group will you play with? (Buttons are in month age ranges)");
		clearMenu();
		if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 0, 2) > 0) addButton(0,"0-2 Months",playWithMilodan,0);
		else addDisabledButton(0,"0-2 Months","0-2 Months","You have no kits in that age range.");
		if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 3, 6) > 0) addButton(1,"3-6 Months",playWithMilodan,1);
		else addDisabledButton(1,"3-6 Months","3-6 Months","You have no kits in that age range.");
		if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 7, 16) > 0) addButton(2,"7-16 Months",playWithMilodan,2);
		else addDisabledButton(2,"7-16 Months","7-16 Months","You have no kits in that age range.");
		if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 17, 9001) > 0) addDisabledButton(3,"17+ Months","17+ Month","These kits are too old to play with.");
		return;
	}
	
	var boy:Boolean = false;
	var girl:Boolean = false;
	var numBabies:int = 0;
	
	var minAge:int;
	var maxAge:int;
	var children:Array = ChildManager.getChildrenOfType(GLOBAL.TYPE_MILODAN);
	var milChildren:Array = [];
	var milIdx:int = -1;
	
	if(choice == 0) { minAge = 0; maxAge = 2; }
	else if(choice == 1) { minAge = 3; maxAge = 6; }
	else if(choice == 2) { minAge = 7; maxAge = 16; }
	
	// Filter for children and ages
	if(children != null && children.length > 0)
	{
		milIdx = 0; // The oldest should be first in the array!
		if(maxAge != -1 && maxAge < minAge) maxAge = -1;
		for(var i:int = 0; i < children.length; i++)
		{
			var c:Child = children[i] as Child;
			var m:int = c.Months;
			if((maxAge == -1 || m <= maxAge) && m >= minAge)
			{
				milChildren.push(c);
				numBabies += c.Quantity;
			}
		}
	}
	// If valid children, set perameters.
	if(milChildren.length > 0)
	{
		milIdx = rand(milChildren.length);
		if(milChildren[milIdx].NumMale > 0) boy = true;
		if(milChildren[milIdx].NumFemale > 0) girl = true;
		if(boy && girl) boy = (rand(2) == 0);
	}

	//Play with baby (0-8 weeks)
	if(choice == 0)
	{
		output((boy ? "He" : "She") + "’s too young to play yet, but you reach into the cot where a kit is swaddled in cloth and gently boop " + (boy ? "him" : "her") + " on the nose. Milodan kits are blind for several weeks, so the kit can’t see you, but " + (boy ? "he" : "she") + " can smell you. " + (boy ? "He" : "She") + " sniffles when you remove your finger from " + (boy ? "his" : "her") + " snout and waves at you with outstretched arms, grabbing onto your fingertip with " + (boy ? "his" : "her") + " tiny hands. You can feel " + (boy ? "him" : "her") + " pulling your hand down, and when you acquiesce " + (boy ? "he" : "she") + " wraps " + (boy ? "his" : "her") + " arms around your fingers and falls asleep. You stroke " + (boy ? "his" : "her") + " hair with a smile, stealthily extricating your hand from the tiny kit’s grip and watching " + (boy ? "him" : "her") + " snoozing in the cot.");
		
		processTime(5);
	}
	//Play with baby (9-24 weeks)
	else if(choice == 1)
	{
		output("You notice a kit sitting upright in " + (boy ? "his" : "her") + " cot as you tiptoe by. " + (boy ? "He" : "She") + " lifts " + (boy ? "his" : "her") + " arms up, pointing upwards and clearly wanting to be picked up.");
		output("\n\nYou lift " + (boy ? "him" : "her") + " out of " + (boy ? "his" : "her") + " little bed. Woof! " + (boy ? "He" : "She") + "’s a lot heavier than " + (boy ? "he" : "she") + " was a few weeks ago. " + (boy ? "He" : "She") + " solemnly inspects you with wide eyes, reaching out to paw at your chin. You give " + (boy ? "his" : "her") + " little tufts of cheek fur a scruff, and " + (boy ? "he" : "she") + " responds by making a little noise that sounds like a bark. What a little cutie. You place the kit back in " + (boy ? "his" : "her") + " cot after a couple of minutes of idle play.");
		
		processTime(7);
	}
	//Play with baby (25-52 weeks)
	else if(choice == 2)
	{
		//One kit
		if(numBabies == 1)
		{
			output("You see your kit sitting down in " + (boy ? "his" : "her") + " nappies in the play area, waving a rattle around with a pacifier in " + (boy ? "his" : "her") + " mouth. Upon spotting you, " + (boy ? "he" : "she") + " shakily gets to " + (boy ? "his" : "her") + " feet and takes a few wobbling steps towards you before toppling over. Not to be deterred, though, " + (boy ? "he" : "she") + " crawls over to your [pc.leg] and uses it to brace " + (boy ? "him" : "her") + "self, raising " + (boy ? "him" : "her") + " to a standing position.");
			output("\n\n<i>“Mu mu,”</i> " + (boy ? "he" : "she") + " says, looking up at you very seriously. <i>“Mu mu.”</i>");
			output("\n\n<i>“Hey kiddo,”</i> you say with a grin, leaning down to muss " + (boy ? "his" : "her") + " hair a bit, your gaze softening. <i>“You’re growing up fast, huh?”</i>");
			output("\n\n<i>“Buh,”</i> the kit responds, shaking " + (boy ? "his" : "her") + " rattle.");
			output("\n\nYou spend some time with your fluffy kit, playing with " + (boy ? "him" : "her") + " and " + (boy ? "his" : "her") + " little set of blocks.");
		
			processTime(12);
		}
		//Multiple kits
		else
		{
			output("You see your kits sitting in their nappies in the play area, waving rattles around emphatically. One of them spots you, nudging " + (boy ? "his" : "her") + " littermate over and clambering atop " + (boy ? "him" : "her") + " to get to you. Standing and taking a few wobbly steps, " + (boy ? "he" : "she") + " falls back down when the kit " + (boy ? "he" : "she") + " climbed over bops " + (boy ? "him" : "her") + " with a rattle. Rather than crying, though, both of them crawl over to you to hug your [pc.leg].");
			output("\n\n<i>“Muh,”</i> one of them says, looking up at you intently. <i>“Mu mu.”</i>");
			output("\n\n<i>“Hey kiddo,”</i> you say with a grin, leaning down to muss " + (boy ? "his" : "her") + " hair a bit, your gaze softening. <i>“You’re growing up fast, huh?”</i>");
			output("\n\n<i>“Buh,”</i> the kit responds, shaking " + (boy ? "his" : "her") + " rattle.");

			//2 kits: 
			if(numBabies <= 2) output("\n\nYou spend some time with the two fluffy kits, playing with them and their little set of blocks.");
			//3-9 kits:
			else if(numBabies < 10) output("\n\nYou’re quickly joined by the rest of your fluffy kits. You spend some time playing with them and their little set of blocks, making sure they play nice.");
			else output("\n\nYou’re soon surrounded by a fluffy horde of kits, crawling all around (and over) you. You spend some time playing with them and their little set of blocks, making sure they play nice.");
		
			processTime(21);
		}
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function nurseryZilCallgirlRandomEvents():Boolean
{
	if (!zilCallgirlAtNursery() || hours < 8 || hours > 16) return false;
	if ((flags["NURSERY_ZIL_CALLGIRL_EVENT_DAY"] == undefined || flags["NURSERY_ZIL_CALLGIRL_EVENT_DAY"] < days) && rand(10) == 0)
	{
		var options:Array = [];

		var numZilCInfants:Genders = ChildManager.gendersOfUniqueTypeInRange(ZilCallgirlUniqueChild, 0, 12);

		options.push("You catch a glimpse of Zheniya, wearing a slinkier version of the Steele Tech uniform top paired with a frilled skirt that leaves her waspy abdomen and long legs bare. She’s quietly working away at scrubbing down the walls"+ (flags["ANNO_MISSION_OFFER"] == 3 ? " with a small, silvery-gray goo that covers her arm like a glove": "") + ". Seeing you watching, she gives her rump a little wiggle for you, working with a sultry spring in her step.");

		// At least one infant
		if (numZilCInfants.total >= 1)
		{
			options.push("You spy Zheniya sitting quietly in the corner, cradling" + (numZilCInfants.total > 1 ? " one of" : "") + " her child"+ (numZilCInfants.total > 1 ? "ren" : "") +" in her arms with her dress slipped down off one shoulder. Your half-zil child is nuzzled into "+numZilCInfants.mf("his", "her")+" mother’s breast, hands wrapped tightly around the hefty mound and lips locked onto the black teat. Zheniya is leaning back, eyes half-lidded, stroking her child’s wispy dark hair. She sees you and smiles, blowing a kiss your way.");
		}

		if (numZilCInfants.total >= 3)
		{
			options.push("Zheniya is sitting on the floor nearby, giggling and smiling as several adorable half-zil crawl all over her. She hugs them each in turn, kissing their brows or throwing them up in the air, "+ (numZilCInfants.Female >= 1 ? "letting their little wings float them back into her arms":"catching them with a gleeful spin") +". She seems perfectly at home, surrounded by her children." + (ChildManager.numChildren() > numZilCInfants.total ? " And even some that aren’t hers, you see." : ""));
		}

		var numTeens:Genders = ChildManager.numOfMobileGendersInRange(ChildManager.ALL_GENDERS, 14);

		if (numTeens.total > 0 && !zilCallGirlPregnant())
		{
			options.push("You hear Zheniya before you see her, buzzing and breathing hard. You turn around just in time to see her back-peddling around a corner, a boffer spear clutched in one hand, one of your children following close on her heels, aggressively lunging and thrusting. The former warrior blocks every strike, turning away blow after blow until her young opponent is covered with a sheen of sweat and starting to fumble. One precise counter-strike disarms "+ numTeens.mf("him", "her") +", and your zil lover catches the extra spear in her off-hand, spinning both under her arms.\n\n<i>“You fight well!”</i> she smiles. Turning to you, she adds, <i>“It seems martial prowess runs in the family, [pc.name]. It feels good to get a little wholesome exercise.”</i>\n\n<i>“Yeah, that was fun!”</i> her sparring partner grins, trying not to look too winded while you’re still looking.");
		}

		if (zilCallGirlPregnant())
		{
			options.push("Zheniya is sitting nearby, both hands on her "+zilCallGirlBellyFragment()+". Briget is standing over her, fussing over the pregnant zil: insisting she improve her diet, exercise but not over-strain herself... the usual spiel from the robotic matron. Zheniya nods agreeably with every point, though she’s clearly more interested in Briget’s massive bosom, which quivers under her jacket with every over-acted motion.");
		}

		if (zilCallGirlPregnant() || numZilCInfants.total > 0)
		{
			options.push("Zheniya walks past you with a spring in her step. You catch her with a brief hug, and note that she’s looking quite... slim today. At least, her normally bodacious bosom looks a little smaller. She chuckles and indicates the small box she’s carrying under an arm: full of honey vials, fresh from the milker station upstairs.\n\n<i>“I could get used to that kind of treatment,”</i> she smiles. <i>“The machine may not be gentle... but it is </i>wonderfully<i> vigorous.”</i>");
		}

		output("\n\n" + RandomInCollection(options));
		flags["NURSERY_ZIL_CALLGIRL_EVENT_DAY"] = days;

		return true;
	}
	return false;
}

public function nurseryI14Func():Boolean
{
	nurseryZilCallgirlRandomEvents();

	return false;
}

public function nurseryCommonAreaFunc():Boolean
{
	var btnIdx:int = 0;

	if(ChildManager.numChildrenAtNursery() > 0 && flags["ELLIE_PREG_TIMER"] < 70 && flags["ELLIE_AT_NURSERY"] != undefined)
	{
		output("\n\nYou find Ellie, happily playing with your other kids, singing to them in a lilting tone and waving her hands from side to side.");
		addButton(0, "Ellie", ellieAtNurseryPreHatch, undefined, "", "");
		return true;
	}

	if (zephAtNursery())
	{
		output("\n\nZephyr is here, idly rifling through a stack of computer tablets. Seems as though even if she leaves work, work doesn’t leave her!");
		addButton(btnIdx, "Zephyr", zephTalkAtNursery, undefined, "Go talk to Zephyr. She’ll probably want to fuck!");
		btnIdx++;
	}
	
	nurseryZilCallgirlRandomEvents();

	return false;
}

public function nurseryCafeteriaFunc():Boolean
{
	output("\n\nA pair of server bots are sitting in the kitchen, making sure there’s plenty of food and drink to go around.");
	if (yammiIsFollower() && !yammiIsCrew()) output(" Yammi’s hanging out in the kitchen, too, overseeing things while she’s not assigned to your ship’s crew.");

	nurseryZilCallgirlRandomEvents();
	
	var btnSlot:int = 0;
	if(seraAtNursery()) seraNurseryCafeteriaBonus(btnSlot++);
	else pc.removeStatusEffect("Sera at Nursery");
	if(riyaAtNursery()) riyaNurseryCafeteriaBonus(btnSlot++);
	else pc.removeStatusEffect("Riya at Nursery");
	
	return false;
}

public function nurseryG14Func():Boolean
{
	output("You’re standing in a long, pastel-blue corridor connecting the foyer to the children’s wing of the nursery.");
	var numKids:Genders = ChildManager.numOfMobileGendersInRange(ChildManager.ALL_GENDERS, 2, 8);
	if (numKids.total >= 10) output(" It looks as though a tornado has swept through here, leaving toys scattered around <i>everywhere</i>.");
	else if (numKids.total >= 1) output(" A few toys have been scattered around, left by one of your kids passing through.");

	nurseryZilCallgirlRandomEvents();
	
	return false;
}

public function nurseryEducationCenterFunc():Boolean
{
	if (hours >= 7 && hours <= 16)
	{
		if (ChildManager.mobileInAgeRangeYears(3, 16))
		{
			output("\n\nThe schoolrooms are up and operational now that you’ve started to deposit your offspring here. Steele Tech keeps several teachers on retainer here, and those who aren’t actively busy overseeing your children’s’ education are working away on future course material and lesson plans.");
		}
		else
		{
			output("\n\nWithout any children to attend to, the staff of teachers and experts on retainer are milling around the desk. They’re currently in the middle of a game of cards.");
		}

		nurseryZilCallgirlRandomEvents();
	}

	return false;
}

public function nurseryKidsDormsFunc():Boolean
{
	output("Most of the nursery deck is devoted to living space for what Dad must have assumed");
	if (ChildManager.numChildren() >= 10) output(" - correctly -");
	output(" would be many, many offspring. A central hub provides access to over a dozen small halls, branching off like tunnels in an anthill off in every direction. There must be hundreds of individual rooms available here, not to mention bathrooms, showers, laundry facilities... everything your heirs and the station’s support staff could ever need.");

	nurseryZilCallgirlRandomEvents();
	khorganBabyBlurbs();
	tamtamBabyBlurbs();
	var button:Number = 0;
	button = zilBabyBonus(button);
	button = milodanPlayOptions(button);
	button = ellieKidVisits(button);
	button = samBabiesVisitOptions(button);
	button = zephyrKidsOption(button);

	return false;
}

public function nurserySpecialistRooms():Boolean
{
	output("Of course, Dad couldn’t have predicted the needs of every alien species likely to");
	if (pc.hasVagina()) output(" knock you up");
	if (pc.hasVagina() && pc.hasCock()) output(" or");
	if (pc.hasCock()) output(" bear you an heir");
	output(", so the nursery comes equipped with a sub-deck of modular living chambers, able to easily be adapted to specific needs: from water tanks to zero-G to alternative atmospheres. Several specialist nurse-droids stand ready to tend to your more unique offspring.");

	addButton(0, "Chambers", nurserySpecialistRoomMenu, undefined, "Modular Chambers", "Take a look at the special chambers.");

	return false;
}

public function nurserySpecialistRoomMenu():void
{
	clearOutput();
	showBust("");
	showName("SPECIAL\nCHAMBERS");

	var numSpecials:int = 0;
	var specials:Array = [];
	var btnSlot:int = 0;
	var i:int = 0;

	output("Which chamber do you wish to observe?");

	if(ChildManager.ofType(GLOBAL.TYPE_CUNTSNAKE) || hasCuntsnakesInHatchery())
	{
		var numSnake:int = ChildManager.numOfType(GLOBAL.TYPE_CUNTSNAKE);
		
		output("\n\nA modular chamber simulating tropical rainforest weather is filled with various flora from Mhen’ga. There, it houses a hatchery and living environment perfectly suited for any cunt snakes you may have.");
		specials.push(["C.Snake", cuntsnakeHatchery, numSnake, "Cunt Snake Chamber", "Check on any cunt snakes or cunt snake eggs you may have."]);
		numSpecials++;
	}

	if (ChildManager.ofType(GLOBAL.TYPE_VENUSPITCHER))
	{
		output("\n\nOne of the modular chambers has been opened up and filled with soil sourced directly from Mhen’ga, allowing for the absolute best growing conditions possible for your venus pitcher offspring. Somehow, Briget has managed to secure a naleen female onto the staff, who is currently slithering about the jungle-like environ making sure everything is picture-perfect - and guaranteeing that your planty offspring will have someone native to play with as they develop.");
		numSpecials++;
	}

	if (ChildManager.ofType(GLOBAL.TYPE_SANDWORM_PARASITE) || ChildManager.ofType(GLOBAL.TYPE_SANDWORM))
	{
		var numButtBugWorm:int = ChildManager.numOfTypeInRange(GLOBAL.TYPE_SANDWORM_PARASITE, 0, 9001);
		var numButtBugHybrid:int = ChildManager.numOfTypeInRange(GLOBAL.TYPE_SANDWORM, 1, 9001);
		var numButtBugTotal:int = (numButtBugWorm + numButtBugHybrid);
		output("\n\nOne of the largest rooms have been converted to a simulation of Tarkus, evident by the smell and the sand being tracked in by the nurse droids as they leave it. The sand doesn’t stay there for long as it seems like it gets vacuumed back into the room after the doors close. Seems like either transporting sand here is expensive or they’re trying to minimize the need for new sand while keeping the place clean. A screen on top states that there " + (numButtBugTotal == 1 ? "is" : "are") + " currently " + num2Text(numButtBugTotal) + " of your Hilinara parasite children here, maybe you should visit " + (numButtBugTotal == 1 ? "it" : "them") + ".");
		specials.push(["Hilinara", nurseryHilinaraRoom, [numButtBugWorm, numButtBugHybrid, numButtBugTotal], "Hilinara Room", "Go into the room simulating Tarkus."]);
		numSpecials++;
	}

	if (ChildManager.ofType(GLOBAL.TYPE_COCKVINE))
	{
		var numVines:int = ChildManager.numOfType(GLOBAL.TYPE_COCKVINE);

		output("\n\n" + (numSpecials == 0 ? "One" : "Another one") +" of the rooms is kept air-tight, its locked door plastered with warnings. The viewing window next to it reveals nothing but blackness - but you can use controls next to it to change the whole screen to stark night vision, allowing you to see within. The room itself is narrower than most but considerably taller, filled with the vertically arranged porous Myrellion rock that Hydrus Constuprula loves undulating its way through. The wall-attached micro-cameras can be moved up and down, enabling you to pick out your cockvine offspring wherever "+ (numVines == 1 ? "it" : "they") +" may roam.");
		specials.push(["Cockvine", nurserySpecialistCockvine, numVines, "Cockvine Habitat", "Take a peek at your cockvines."]);
		numSpecials++;
	}

	if (ChildManager.ofType(GLOBAL.TYPE_WATERQUEEN))
	{
		output("\n\nConnected to the main entrance via a pressurized airlock is a water-filled chamber, simulating a deep saltwater lake with a sandy island in its center. Though the rooms inside are pitch black, a camera feed inside has been set to night vision, showing your Water Princesses scuttling about, half-submerged and completely hidden in the dark waters. Your head nurse has hired on a dusky female nyrea from their homeworld to help oversee their development - a brief word with her reveals the huntress is well acquainted with the Queen of the Deep, and that the princesses’ mother sends her regards.");
		specials.push(["W.Princess", nurserySpecialistWaterPricesses, undefined, "Water Princesses", "Interact with your princesses."]);
		numSpecials++;
	}

	if (ChildManager.ofType(GLOBAL.TYPE_TENTACLE))
	{
		var numTentacles:int = ChildManager.numOfType(GLOBAL.TYPE_TENTACLE);
		
		output("\n\nA" + (numSpecials == 0 ? "" : "nother") +" modular chamber with very thick glass holds your " + (numTentacles == 1 ? "tentacle child" : (num2Text(numTentacles) + " tentacle children")) + ". The chamber itself looks very sturdy and high-tech. You’re told that the viewing glass is a one-way mirror to prevent the beast" + (numTentacles == 1 ? "" : "s") + " from peering back at any unsuspecting passerbys. The inside speakers also emit soothing harmonics to keep " + (numTentacles == 1 ? "it" : "them") + " less agitated. " + (numTentacles == 1 ? "It looks" : "They look") + " quite happy in there.");
		numSpecials++;
	}

	if (numSpecials == 0)
	{
		output("\n\nCurrently, the specialist deck is empty.");
	}
	output("\n\n");
	
	clearMenu();
	for(i = 0; i < specials.length; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", mainGameMenu);
			btnSlot++;
		}
		
		if(specials[i][1] == null) addDisabledButton(btnSlot, specials[i][0], specials[i][3], specials[i][4]);
		else addButton(btnSlot, specials[i][0], specials[i][1], specials[i][2], specials[i][3], specials[i][4]);
		btnSlot++;
		
		if(specials.length > 14 && (i + 1) == specials.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", mainGameMenu);
		}
	}
	addButton(14, "Back", mainGameMenu);
}

public function nurseryStairsShared(activeFloor:int):void
{
	output("A gunmetal-gray stairwell connects the children’s floor with the second, dedicated to the nursery’s staff and support facilities. You’re currently on the "+ num2Ordinal(activeFloor) +" floor.");
}

public function nurseryStairs1F():Boolean
{
	nurseryStairsShared(1);
	return false;
}

public function nurseryStairs2F():Boolean
{
	nurseryStairsShared(2);
	return false;
}

public function nurseryPlayerApptFunc():Boolean
{
	if (flags["BRIGET_MET"] != undefined && (pc as PlayerCharacter).hasPregnancyOfTypeOtherThan("EggTrainerFauxPreg")) addButton(0, "Maternity", nurseryMaternityWait, undefined, "Maternity Wait", "The nursery is set up to support you for the long term if need be. If adventuring across the galaxy while pregnant doesn’t seem like the best idea, you can move into the nursery and allow the staff to take care of you until you’re ready to pop.");
	else if (flags["BRIGET_MET"] == undefined) addDisabledButton(0, "Maternity", "Maternity Wait", "Perhaps you should meet with the head nurse before trying to do this...");
	else addDisabledButton(0, "Maternity", "Maternity Wait", "If you were pregnant, you could probably camp out here and be looked after until you were due...");
	addButton(1, "Shower", showerMenu, "nursery"); // this will probably require some tweaking internally to allow it to make complete sense off of the players actual ship.
	
	// Belly size hotfix
	if (!pc.isPregnant() && pc.bellyRatingMod != 0) addButton(4, "Fix Belly", nurseryFixBelly, undefined, "Fix Belly", "It seems your belly size is off...");

	return false;
}

public function nurseryBrigetsApptFunc():Boolean
{
	if (flags["BRIGET_MET"] == undefined) showName("NURSERY:\nNURSE’S APPT.");
	if (flags["BRIGET_MET"] != undefined && (hours < 7 || hours > 16))
	{
		output("\n\nBriget herself is sitting in the bedroom, working on a small holoterminal on the desk. She glances up at you and smiles faintly, clearly none-too-disturbed by your presence in her abode.");
		
		// 9999
		addDisabledButton(0, "Briget");
	}

	return false;
}

public function nurserySpareApptIsOccupied():Boolean
{
	if(flags["SERA_CREWMEMBER"] == 0) return true;
	return false;
}
public function nurserySpareApptBonus():Boolean
{
	var btnSlot:int = 0;
	
	// For followers or grown kids and stuff.
	if(flags["SERA_CREWMEMBER"] == 0) output(seraOnTavrosBonus(btnSlot++));

	return false;
}

public function nurseryC6Func():Boolean
{
	vendingMachineButton(2);
	return false;
}

public function nurseryE6Func():Boolean
{
	flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
	return false;
}

// Actual content shit

public function nurseryComputer():void
{
	clearOutput();
	author("Savin");

	var numChildren:int = ChildManager.numChildrenAtNursery();

	if (flags["USED_NURSERY_COMPUTER"] == undefined)
	{
		output("You step up to the holoterminal and boot it up. A simple Steele Tech login screen prompts you for the same username and password as your company email before blinking away and resolving into a friendly, colorful UI in the company’s familiar dark blue hues. A soft, feminine voice welcomes you to the Steele family nursery, and once it confirms you’re, well, you, the voice adds:");

		output("\n\n<i>“Greetings, [pc.name], and welcome to your personal nursery. This facility is currently managed in trust by the Steele Industrial Technology and Production board of directors, though its day-to-day management has been sourced to your family until such time as new ownership of the company is determined. Minimum operating expenses are provided for based on the number of children and staff currently in the nursery. In other words, the facility is for your use, and is under your direction. Please enjoy the facilities, and work with us to ensure your offspring have the best possible future.”</i>");
		
		output("\n\nThe voice recording ends, and another UI slides into focus, displaying the status of the nursery and its");
		if (numChildren == 0) output(" non-existent");
		output(" occupants.");

		flags["USED_NURSERY_COMPUTER"] = 1;
	}
	else
	{
		output("You step up to the nursery’s computer station and log in. As ever, it hands over complete control to you, showing off the status of the nursery and its");
		if (numChildren == 0) output(" non-existent");
		output(" occupants.");
	}

	nurseryComputerMenu();
}

public function nurseryComputerMenu(lastUsed:Function = null):void
{
	clearMenu();

	if (lastUsed == nurseryComputerChildren) addDisabledButton(0, "Children");
	else addButton(0, "Children", nurseryComputerChildren);
	
	if (lastUsed == nurseryComputerUpgrades) addDisabledButton(1, "Upgrades");
	else addButton(1, "Upgrades", nurseryComputerUpgrades);
	
	if (lastUsed == nurseryComputerStaff) addDisabledButton(2, "Staff");
	else addButton(2, "Staff", nurseryComputerStaff);

	if (lastUsed == nurseryComputerFacilities) addDisabledButton(3, "Facilities");
	else addButton(3, "Facilities", nurseryComputerFacilities);
	
	if(debug)
	{
		if (lastUsed == pregAverageLoadSizes) addDisabledButton(13, "Load Sizes");
		else addButton(13, "Load Sizes", pregAverageLoadSizes);
	}
	
	addButton(14, "Back", nurseryComputerLeaveMenu);
}

public function nurseryComputerLeaveMenu():void
{
	mainGameMenu();
}

public function nurseryComputerFacilities():void
{
	clearOutput();
	author("Savin");

	// Probably refactor this when we get more special types in
	var facilities:Array = [];
	if (ChildManager.ofType(GLOBAL.TYPE_CUNTSNAKE) || hasCuntsnakesInHatchery()) facilities.push("Cunt Snake Hatchery and Habitat");
	if (ChildManager.ofType(GLOBAL.TYPE_VENUSPITCHER)) facilities.push("Venus Pitcher Terrarium");
	if (ChildManager.ofType(GLOBAL.TYPE_COCKVINE)) facilities.push("Hydrus Constuprula Habitat");
	if (ChildManager.ofType(GLOBAL.TYPE_WATERQUEEN)) facilities.push("Water Strider Tank");
	if (ChildManager.ofType(GLOBAL.TYPE_TENTACLE)) facilities.push("UHS-1045 Harmonics Habitat");

	output("Your nursery is equipped with a special modular section, designed to be able to easily support unique alien biologies.");
	if (facilities.length <= 0)
	{
		output(" If you ever have children that need non-standard living environments, the headmistress will requisition the funds and staff to support them.");
	}
	else
	{
		output(" You currently have the following Specialist Rooms, designed to give your uniquely-needy offspring the conditions their alien biology requires to survive:\n");
		for(var i:int = 0; i < facilities.length; i ++)
		{
			output("\n<b>* " + facilities[i] + "</b>");
		}
		output("\n\n");
	}

	nurseryComputerMenu(nurseryComputerFacilities);
}

public function nurseryComputerUpgrades():void
{
	clearOutput();
	author("Savin");

	if (!hasNurseryUpgrades())
	{
		output("The nursery is quite large, and though currently sparse, has plenty of room for upgrades. Any special devices or accoutrements related to birth and pregnancy you find in the galaxy can be sent here.");
	}
	else
	{
		output("You currently have installed the following special upgrades to the nursery’s facilities:");
	}

	nurseryComputerMenu(nurseryComputerUpgrades);
}

public function nurseryComputerStaff():void
{
	clearOutput();
	author("Savin");

	if (!hasNurseryStaff())
	{
		output("The nursery is maintained largely by nurse droids at present, though a staff of biological caregivers and teachers are on retainer as well. If you find specialists who can support the nursery’s functions, perhaps you could send them here...");
	}
	else
	{
		output("You currently have the following specialist staff on hand:\n");
		if (yammiAtNursery()) output("\n<b>* Yammi, Head Chef");
		if (reahaAtNursery()) output("\n<b>* Cured Reaha, Milk-giver");
		if (zilCallgirlAtNursery()) output("\n<b>* Zheniya, Caregiver");
	}

	nurseryComputerMenu(nurseryComputerStaff);
}


public function nurseryComputerChildren():void
{
	
	// Children sired count hotfix.
	if(nurserySiredBabyDiff() > 0)
	{
		nurserySiredRecordsFix();
		return;
	}
	
	clearOutput();
	clearBust();
	
	// Children at daycare count hotfix.
	if(nurseryOrphanedBabyDiff() > 0 || (StatTracking.getStat("pregnancy/total day care") < ChildManager.numChildrenAtNursery()))
	{
		author("Jacques00");
		
		output("<b>The computer makes some worrying blips.</b> It then displays a holo pop-up that reads:");
		output("\n\n<i>“Oops! An error has occured and data recovery is in process. Please wait while files are being retrieved...”</i>");
		output("\n\nIt seems your nursery records have not been set straight since the previous software update and some of the data on file may have been corrupted. To ensure consistency in recordkeeping, the computer is attempting to recover your past records and display them. You can’t do much beside wait for the automated system to do its thing...");
		
		clearMenu();
		addButton(0, "Next", nurseryRecordsFix);
		return;
	}
	
	author("Savin");

	var numChildren:int = ChildManager.numChildren();

	if (numChildren == 0)
	{
		output("Should you ever choose to have children sent to the nursery, this screen will allow you to get updates on their status.");
	}
	else if (numChildren == 1)
	{
		var genders:Genders = ChildManager.numGenders();
		output("Your one and only child here at the nursery is the center of attention.");
		if (genders.Male > 0) output(" His");
		else if (genders.Neuter > 0) output(" Its");
		else output(" Her");
		output(" status is summarized below:");
	}
	else
	{
		output("The computer displays a summarized status of all your offspring currently residing within the nursery:");
	}

	nurseryDisplayAllChildren();
	output("\n\n");

	nurseryComputerMenu(nurseryComputerChildren);
}

private var orphanList:Array = [
	"pregnancy/cockvine seedlings captured",
	"pregnancy/nyrea eggs", "pregnancy/royal nyrea eggs", "pregnancy/renvra eggs", "pregnancy/renvra kids",
	"pregnancy/psychic tentacle beast day care",
	"pregnancy/sydian births",
	"pregnancy/fertilized venus pitcher seeds/day care",
	"pregnancy/briha kids",
	"pregnancy/queen of the deep eggs",
	"pregnancy/raskvel sired/day care",
];
public function nurseryOrphanedBabyDiff():int
{
	// Count kids that were supposedly sent to the nursery pre-nursery update.
	var numNurseryKids:int = 0;
	for(var i:int = 0; i < orphanList.length; i++)
	{
		numNurseryKids += StatTracking.getStat(orphanList[i]);
		
		// Fix uneven stats.
		if(orphanList[i] == "pregnancy/psychic tentacle beast day care" && ChildManager.numOfType(GLOBAL.TYPE_TENTACLE) > 0)
		{
			if(ChildManager.numOfType(GLOBAL.TYPE_TENTACLE) != StatTracking.getStat(orphanList[i])) StatTracking.setStat(orphanList[i], ChildManager.numOfType(GLOBAL.TYPE_TENTACLE));
		}
	}
	
	if(debug)
	{
		output("There are " + numNurseryKids + " kids, minus " + ChildManager.numChildren() + " in nursery, making " + (numNurseryKids - ChildManager.numChildren()) + " orphaned!");
		output("\nChildren logged: " + StatTracking.getStat("pregnancy/total day care"));
		output("\n\n");
	}
	
	// Compare with actual number of kids in nursery.
	return (numNurseryKids - ChildManager.numChildren());
}
public function nurseryRecordsFix():void
{
	clearOutput();
	clearBust();
	author("Jacques00");
	output("You wait as the computer fixes your records");
	
	var msg:String = "";
	var numFixed:Number = 0;
	var orphanTypes:Array = [
		"cockvine seedlings",
		"nyrea eggs", "royal nyrea eggs", "Renvra, eggs", "Renvra, live",
		"psychic tentacle beast",
		"sydian",
		"venus pitcher",
		"Briha",
		"water queen",
		"raskvel",
	];
	
	for(var i:int = 0; i < orphanList.length; i++)
	{
		if(nurseryAddOrphanedChild(orphanList[i]))
		{
			numFixed++;
			msg += "\n\n<i>" + StringUtil.toTitleCase(num2Ordinal(numFixed)) + " entry detected (" + StringUtil.toTitleCase(orphanTypes[i]) + ")... correcting... corrected.</i>";
		}
	}
	
	var numInNursery:int = ChildManager.numChildrenAtNursery();
	var numInStat:int = StatTracking.getStat("pregnancy/total day care");
	
	// Nursery Stat Hotfix
	if(numInStat < numInNursery)
	{
		msg += "\n";
		msg += "\n<i>Number of Entries Logged: " + numInStat + "</i>";
		msg += "\n<i>Number of Actual Entries: " + numInNursery + "</i>";
		msg += "\n<i>Updating";
		if(numInNursery - numInStat > 20 || numInNursery - numInStat < 0)
		{
			msg += ".........................";
			StatTracking.setStat("pregnancy/total day care", numInNursery);
			numFixed += 5;
		}
		else
		{
			var e:int = 0;
			while(StatTracking.getStat("pregnancy/total day care") < numInNursery && e < 20)
			{
				StatTracking.track("pregnancy/total day care");
				msg += ".";
				numFixed += 0.25;
				e++;
			}
		}
		msg += "</i>";
		msg += "\n<i>Entry quantity matched.</i>";
		msg += "\n<i>Entry update complete.</i>";
	}
	
	if(msg != "")
	{
		output(", reading its output as it appears on the screen:");
		output(msg);
		output("\n\nAfter a brief moment, the computer finishes its data recovery. You can now use the nursery’s computer to check up on any children you may have.");
	}
	else
	{
		output("... But nothing comes up. Was it just a glitch?");
	}
	
	processTime(1 + Math.round(numFixed));
	
	clearMenu();
	addButton(0, "Next", nurseryComputerChildren);
}
public function nurseryAddOrphanedChild(statPath:String = ""):Boolean
{
	if(StatTracking.getStat(statPath) <= 0) return false;
	
	var childType:int = -1;
	var childMRate:Number = 1.0;
	var childTotal:int = 0;
	var childWgtM:int = 50;
	var childWgtF:int = 50;
	var childWgtI:int = 0;
	var childWgtN:int = 0;
	
	var i:int = 0;
	var corrected:Boolean = false;
	
	switch(statPath)
	{
		// Cockvine
		case "pregnancy/cockvine seedlings captured":
			childType = GLOBAL.TYPE_COCKVINE;
			childMRate = 2.5;
			childTotal = StatTracking.getStat(statPath);
			childWgtM = 1; childWgtF = 0; childWgtI = 0; childWgtN = 0;
			break;
		// Nyrea
		case "pregnancy/nyrea eggs":
		case "pregnancy/royal nyrea eggs":
		case "pregnancy/renvra eggs":
		case "pregnancy/renvra kids":
			childType = GLOBAL.TYPE_NYREA;
			childMRate = 1.0;
			childTotal = (StatTracking.getStat("pregnancy/nyrea eggs") + StatTracking.getStat("pregnancy/renvra eggs") + StatTracking.getStat("pregnancy/royal nyrea eggs") + StatTracking.getStat("pregnancy/renvra kids"));
			break;
		// Tentacle
		case "pregnancy/psychic tentacle beast day care":
			childType = GLOBAL.TYPE_TENTACLE;
			childMRate = 2.5;
			childTotal = StatTracking.getStat(statPath);
			childWgtM = 0; childWgtF = 0; childWgtI = 0; childWgtN = 1;
			break;
		// Human
		case "pregnancy/sydian births":
			childType = GLOBAL.TYPE_HUMAN;
			childMRate = 1.0;
			childTotal = StatTracking.getStat("pregnancy/sydian births");
			break;
		// Venus Pitcher
		case "pregnancy/fertilized venus pitcher seeds/day care":
			childType = GLOBAL.TYPE_VENUSPITCHER;
			childMRate = 1.0;
			childTotal = StatTracking.getStat(statPath);
			childWgtM = 0; childWgtF = 1; childWgtI = 0; childWgtN = 0;
			break;
		// Water Queen
		case "pregnancy/queen of the deep eggs":
			childType = GLOBAL.TYPE_WATERQUEEN;
			childMRate = 2.0;
			childTotal = StatTracking.getStat(statPath);
			childWgtM = 0; childWgtF = 1; childWgtI = 0; childWgtN = 0;
			break;
		// Raskvel
		case "pregnancy/raskvel sired/day care":
			childType = GLOBAL.TYPE_RASKVEL;
			childMRate = 6.0;
			childTotal = StatTracking.getStat(statPath);
			break;
		// Briha Kids
		case "pregnancy/briha kids":
			childType = GLOBAL.TYPE_MYR;
			childTotal = StatTracking.getStat(statPath);
			break;
		// Failsafe
		default:
			childType = -1;
			childTotal = -1;
			break;
	}
	
	// Remove any children from the count if they already exist
	var children:Array = ChildManager.getChildrenOfType(childType);
	var uniqueChildren:Array = [];
	var totalNum:int = 0;
	var child:Child;
	if (children != null && children.length > 0)
	{
		child = children[0]; // The oldest should be first in the array!
		for (i = 0; i < children.length; i++)
		{
			var c:Child = children[i] as Child;
			if(c is UniqueChild) { uniqueChildren.push(c); }
			else totalNum += c.Quantity;
		}
		
		childTotal -= totalNum;
	}
	
	// Add children
	if(childType >= 0 && childTotal > 0)
	{
		switch(statPath)
		{
			case "pregnancy/briha kids":
				// Get all the counters ready
				var brihaTotal:int = StatTracking.getStat(statPath);
				var brihaKids:int = brihaTotal;
				var brihaBoys:int = StatTracking.getStat("pregnancy/briha sons");
				var brihaGirls:int = StatTracking.getStat("pregnancy/briha daughters");
				// Each birth is spaced one child per her incubation period (120 days)
				var brihaDaySpan:int = 120;
				// Unique ages
				var brihaFirstborn:int = Math.abs(flags["BRIHA_OLDEST_SPAWN_AGE"] != undefined ? flags["BRIHA_OLDEST_SPAWN_AGE"] : 120);
				var brihaSecondborn:int = Math.abs(flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"] != undefined ? flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"] : 120);
				var brihaLastborn:int = Math.abs(flags["BRIHA_LATEST_SPAWN_AGE"] != undefined ? flags["BRIHA_LATEST_SPAWN_AGE"] : 120);
				// Make babies
				for(i = 0; i < brihaTotal; i++)
				{
					var brihaFirsts:Array = listBabiesOfParent("BRIHA");
					// First Unique (oldest)
					if(brihaKids == StatTracking.getStat(statPath) && brihaFirsts.length <= 0)
					{
						brihaDaySpan = brihaFirstborn;
						addUniqueChildBriha(false, brihaDaySpan);
						brihaGirls--;
					}
					// Second Unique (second oldest)
					else if(brihaKids == (StatTracking.getStat(statPath) - 1) && brihaFirsts.length <= 1)
					{
						brihaDaySpan = brihaSecondborn;
						addUniqueChildBriha(true, brihaDaySpan);
						brihaBoys--;
					}
					// Generic kids
					else if(brihaBoys > 0 || brihaGirls > 0)
					{
						if(i == (brihaTotal - 1)) brihaDaySpan = brihaLastborn;
						else brihaDaySpan -= 120;
						if(brihaDaySpan < 0) brihaDaySpan = 0;
						
						if((brihaBoys > 0 && brihaGirls > 0 && rand(2) == 0) || brihaBoys == 0)
						{
							addChildBriha(1, false, brihaDaySpan);
							brihaGirls--;
						}
						else
						{
							addChildBriha(1, true, brihaDaySpan);
							brihaBoys--;
						}
					}
					// Failsafe -- too many babies!
					else
					{
						brihaDaySpan -= 120;
						if(brihaDaySpan < 0) brihaDaySpan = 0;
						
						if(rand(2) == 0)
						{
							addChildBriha(1, false, brihaDaySpan);
							StatTracking.track("pregnancy/briha daughters");
						}
						else
						{
							addChildBriha(1, true, brihaDaySpan);
							StatTracking.track("pregnancy/briha sons");
						}
						StatTracking.track("pregnancy/total sired");
					}
					brihaKids--;
					corrected = true;
				}
				break;
			default:
				ChildManager.addChild(
					Child.NewChild(
						childType,
						childMRate,
						childTotal,
						childWgtM, childWgtF, childWgtI, childWgtN
					)
				);
				corrected = true;
				break;
		}
	}
	
	return corrected;
}
private var siredList:Array = [
	"pregnancy/briha kids",
	"pregnancy/ellie sired",
	"pregnancy/ilaria sired",
	"pregnancy/khorgan sired",
	"pregnancy/raskvel sired/total",
	"pregnancy/sam sired",
	"pregnancy/sera sired",
	"pregnancy/tam sired",
	"pregnancy/ula sired",
	"pregnancy/zil call girl kids",
];
public function nurserySiredBabyDiff():int
{
	var numSired:int = 0;
	
	for(var i:int = 0; i < siredList.length; i++)
	{
		numSired += StatTracking.getStat(siredList[i]);
	}
	
	return (numSired - StatTracking.getStat("pregnancy/total sired"));
}
public function nurserySiredRecordsFix():void
{
	clearOutput();
	clearBust();
	author("Jacques00");
	
	output("<b>The computer makes some blips while it syncs with your codex.</b> It then displays a holo pop-up that reads:");
	output("\n\n<i>“It seems that the nursery computer and your codex are out of sync. Please wait while we correct your records....”</i> After a few seconds, it then concludes, <i>“... Data sync successful! Thank you for your patience.”</i>");
	output("\n\nLooks like whatever information was off has been corrected now.");
	
	var numSired:int = 0;
	var numBirth:int = StatTracking.getStat("pregnancy/total births");
	
	for(var i:int = 0; i < siredList.length; i++)
	{
		if(StatTracking.getStat(siredList[i]) > 0)
		{
			numSired += StatTracking.getStat(siredList[i]);
			switch(siredList[i])
			{
				case "pregnancy/briha kids":
					numBirth -= StatTracking.getStat("pregnancy/briha kids");
					break;
				case "pregnancy/raskvel sired/total":
					numBirth -= StatTracking.getStat("pregnancy/raskvel sired/day care");
					break;
			}
		}
	}
	if(numSired < 0) numSired = 0;
	if(numBirth < 0) numBirth = 0;
	
	StatTracking.setStat("pregnancy/total sired", numSired);
	StatTracking.setStat("pregnancy/total births", numBirth);
	
	clearMenu();
	addButton(0, "Next", nurseryComputerChildren);
}


public function nurseryDisplayAllChildren():void
{
	var allUniques:Array = null;
	var sortedTypedBuckets:Object = null;

	if (ChildManager.nurseryCacheInvalid)
	{
		var types:Array = ChildManager.getKnownTypes();

		var uniques:Array = [];
		var bucketedTypes:Object = {};

		// It might be wise to smash the type + age buckets together as another tier in the underlying cache, but at least everything
		// will be in some form of order atm

		var ageBrackets:Array = [
			6570, 	// 18+
			5840, 	// 16-18
			4380, 	// 12-16
			2920, 	// 8-12
			1460, 	// 4-8
			365,	// 1-4
			273,	// 9 months
			181,	// 6 months
			90,		// 3 months
			30,		// 1 month
			0		// newborn
		];

		for (var i:int = 0; i < types.length; i++)
		{
			var bucket:Array = ChildManager.getBucketOfType(types[i].name);
			var ageBuckets:Array = [];
			bucketedTypes[types[i].name] = ageBuckets;

			for (var b:int = 0; b < ageBrackets.length; b++)
			{
				ageBuckets.push(new Genders());
			}

			for (var c:int = 0; c < bucket.length; c++)
			{
				var cc:Child = bucket[c] as Child;
				
				if (cc is UniqueChild)
				{
					uniques.push(cc);
					//continue;
				}
				
				for (var bb:int = 0; bb < ageBrackets.length; bb++)
				{
					if
					(	(bb == 0 && cc.Days >= ageBrackets[bb])
					||	(cc.Days < ageBrackets[bb - 1] && cc.Days >= ageBrackets[bb])
					) ageBuckets[bb].add(cc.NumGenders);
				}
			}
		}

		ChildManager.nurseryCacheInvalid = false;
		sortedTypedBuckets = ChildManager.nurseryComputerCache = bucketedTypes;
		allUniques = ChildManager.nuseryComputerUniquesCache = uniques;
	}
	else
	{
		sortedTypedBuckets = ChildManager.nurseryComputerCache;
		allUniques = ChildManager.nuseryComputerUniquesCache;
	}

	// It may be wise to expand this into some form of menu down the line. We have the backing data to support a lot of different
	// ways to view this too, so we could show all in age range quite easily
	nurseryDisplayGenericChildren(sortedTypedBuckets);
	nurseryDisplayUniqueChildren(allUniques);
}

public function nurseryDisplayGenericChildren(sortedTypedBuckets:Object):void
{
	if(ChildManager.numChildren() <= 0) return;
	
	var displayAges:Array = [
		"18+ years",
		"16-18 years",
		"12-16 years",
		"8-12 years",
		"4-8 years",
		"1-4 years",
		"9-12 months",
		"6-9 months",
		"3-6 months",
		"1-3 months",
		"newborn"
	];
	
	output("\n\n" + blockHeader("Children Overview", false));
	
	for (var key:String in sortedTypedBuckets)
	{
		var thisBucket:Array = sortedTypedBuckets[key];
		var displayCnt:int = 0;
		
		output("\n<b><u>" + GLOBAL.TYPE_NAMES[int(key)] + " Offspring</u></b> - Total: " + ChildManager.numOfType(int(key)));
		
		for (var i:int = 0; i < thisBucket.length; i++)
		{
			if (thisBucket[i].any())
			{
				var b:Genders = thisBucket[i];
				var entries:Array = [];
				if (b.Male > 0) entries.push(b.Male + " son" + (b.Male == 1 ? "" : "s"));
				if (b.Female > 0) entries.push(b.Female + " daughter" + (b.Female == 1 ? "" : "s"));
				if (b.Intersex > 0)
				{
					switch(int(key))
					{
						case GLOBAL.TYPE_GOOEY:
						case GLOBAL.TYPE_BOTHRIOC:
						case GLOBAL.TYPE_RAHN: entries.push(b.Intersex + " monogender" + (b.Intersex == 1 ? "" : "s")); break;
						default: entries.push(b.Intersex + " mixed-gender"); break;
					}
				}
				if (b.Neuter > 0) entries.push(b.Neuter + " ungendered");

				if(entries.length > 0)
				{
					output("\n<b>* " + StringUtil.toDisplayCase(displayAges[i]) + ":</b> " + CompressToList(entries));
					displayCnt++;
				}
			}
		}
		
		if(displayCnt <= 0) output("\n<i>* There is no relevant data to display for your " + (GLOBAL.TYPE_NAMES[int(key)]).toLowerCase() + " offspring.</i>");
	}
}

public function listBabiesOfParent(parentName:String = "", unnamed:Boolean = false, ageMin:int = -1, ageMax:int = -1):Array
{
	var babies:Array = [];
	
	for(var i:int = 0; i < ChildManager.CHILDREN.length; i++)
	{
		var baby:* = ChildManager.CHILDREN[i];
		if(baby is UniqueChild && baby.UniqueParent == parentName)
		{
			if(unnamed && baby.Name != "") { /* Ignore baby. */ }
			else if(ageMin >= 0 && baby.Days < ageMin) { /* Ignore baby. */ }
			else if(ageMax >= 0 && baby.Days > ageMax) { /* Ignore baby. */ }
			else babies.push(baby);
		}
	}
	
	return babies;
}
public function nurseryDisplayUniqueChildren(uniques:Array):void
{
	// Placeholder-esque until I come back through implementing the first actual unique children

	/*
	Children by {Unique Parter}
	// Agerange + gender of child, plus race name/hybridism. If name, show name.
	*/
	
	if(ChildManager.numUniqueChildren() <= 0) return;
	
	output("\n\n" + blockHeader("Unique Children", false));
	
	var parentList:Array = [];
	var parentName:String = ""; 
	for(var b:int = 0; b < uniques.length; b++)
	{
		parentName = uniques[b].UniqueParent;
		if(parentList.indexOf(parentName) == -1) parentList.push(parentName);
	}
	
	for(var p:int = 0; p < parentList.length; p++)
	{
		parentName = parentList[p];
		var babies:Array = listBabiesOfParent(parentName);
		var nKids:Number = (StatTracking.getStat("pregnancy/" + parentName.toLowerCase() + " kids") + StatTracking.getStat("pregnancy/" + parentName.toLowerCase() + " sired"));
		
		output("\n<u><b>Children by " + (chars[parentName] != null ? chars[parentName].short : StringUtil.toDisplayCase(parentName.toLowerCase())) + "</b></u>");
		if(nKids > 0) output(" - Total: " + nKids);
		if(babies.length > 0)
		{
			for(var i:int = 0; i < babies.length; i++)
			{
				var baby:UniqueChild = babies[i];
				
				// Check for null variables and reset them (just in case...)
				if(baby.Name == null) baby.Name = "";
				if(baby.originalRace == null) baby.originalRace = "NOT SET";
				if(baby.skinTone == null) baby.skinTone = "NOT SET";
				if(baby.lipColor == null) baby.lipColor = "NOT SET";
				if(baby.nippleColor == null) baby.nippleColor = "NOT SET";
				if(baby.eyeColor == null) baby.eyeColor = "NOT SET";
				if(baby.hairColor == null) baby.hairColor = "NOT SET";
				if(baby.furColor == null) baby.furColor = "NOT SET";
				if(baby.scaleColor == null) baby.scaleColor = "NOT SET";
				if(baby.chitinColor == null) baby.chitinColor = "NOT SET";
				if(baby.featherColor == null) baby.featherColor = "NOT SET";
				
				// Race Hotfix
				if(baby.originalRace != "human" && baby.originalRace.indexOf("half") != -1 && baby.originalRace.indexOf("human") != -1) baby.originalRace = "human";
				
				// Print stats
				if(baby.Quantity == 1) 
				{
					if(baby.Name == "") output("\n<b>* One Child:</b> ");
					else output("\n<b>* " + (baby.Name == "" ? "<i>(Unnamed)</i>" : baby.Name) + ":</b> ");
				}
				else output("\n<b>* " + StringUtil.toDisplayCase(num2Text(baby.Quantity)) + " Children:</b> ");
				if(baby.Days >= 6570) output("18+ years");
				else if(baby.Days >= 365) output(baby.Years + " year" + (baby.Years == 1 ? "" : "s"));
				else if(baby.Days >= 30) output(baby.Months + " month" + (baby.Months == 1 ? "" : "s"));
				else output("Newborn");
				//output(" (Born: " + minutesToDate(baby.BornTimestamp) + ")");
				//output(", " + formatFloat(baby.MaturationRate * 100) + " % growth rate");
				output(",");
				output(" " + (baby.originalRace == "NOT SET" ? GLOBAL.TYPE_NAMES[baby.RaceType] : StringUtil.toDisplayCase(baby.originalRace)));
				output(",");
				if(baby.Quantity == 1)
				{
					if(baby.NumNeuter > 0) output(" Sexless");
					if(baby.NumFemale > 0) output(" Female");
					if(baby.NumMale > 0) output(" Male");
					if(baby.NumIntersex > 0)
					{
						switch(baby.RaceType)
						{
							case GLOBAL.TYPE_GOOEY:
							case GLOBAL.TYPE_BOTHRIOC:
							case GLOBAL.TYPE_RAHN: output(" Monogender"); break;
							default: output(" Hermaphrodite"); break;
						}
					}
				}
				else if(baby.Quantity > 1)
				{
					var sexes:Array = [];
					if(baby.NumMale > 0) sexes.push(baby.NumMale + " son" + (baby.NumMale == 1 ? "" : "s"));
					if(baby.NumFemale > 0) sexes.push(baby.NumFemale + " daughter" + (baby.NumFemale == 1 ? "" : "s"));
					if(baby.NumIntersex > 0)
					{
						switch(baby.RaceType)
						{
							case GLOBAL.TYPE_GOOEY:
							case GLOBAL.TYPE_BOTHRIOC:
							case GLOBAL.TYPE_RAHN: sexes.push(baby.NumIntersex + " monogender" + (baby.NumIntersex == 1 ? "" : "s")); break;
							default: sexes.push(baby.NumIntersex + " mixed-gender"); break;
						}
					}
					if(baby.NumNeuter > 0) sexes.push(baby.NumNeuter + " ungendered");
					if(sexes.length > 0) output(" " + CompressToList(sexes));
				}
				else output("<i>Unknown Sex</i>");
				
				var desc:Array = [];
				if(baby.skinTone != "NOT SET") desc.push(" " + baby.skinTone + " skin");
				//if(baby.lipColor != "NOT SET") desc.push(baby.lipColor + " lips");
				//if(baby.nippleColor != "NOT SET") desc.push(baby.nippleColor + " nipples");
				if(baby.eyeColor != "NOT SET") desc.push(baby.eyeColor + " eyes");
				if(baby.hairColor != "NOT SET") desc.push(baby.hairColor + " hair");
				if(baby.furColor != "NOT SET") desc.push(baby.furColor + " fur");
				if(baby.scaleColor != "NOT SET") desc.push(baby.scaleColor + " scales");
				if(baby.chitinColor != "NOT SET") desc.push(baby.chitinColor + " chitin");
				if(baby.featherColor != "NOT SET") desc.push(baby.featherColor + " feathers");
				if(desc.length > 0)
				{
					output("\n\t- Having " + CompressToList(desc) + ".");
				}
			}
		}
		else
		{
			output("\n<i>* There is no nursery data currently stored for your children from " + (chars[parentName] != null ? chars[parentName].short : StringUtil.toDisplayCase(parentName.toLowerCase())) + ".</i>");
		}
	}
	
	if(parentList.length <= 0) output("\n<i>* There is no nursery data currently stored for any of your unique children.</i>");
}

public function nurseryMeetBriget():void
{
	clearOutput();
	author("Savin");
	showName("\nWOMAN");
	showBust(brigetBustDisplay());

	output("The woman at the desk seems to be the person to talk to here, so you make your way over and clear your throat to get her attention. She glances up from her Codex, immediately adopting a welcoming, matronly smile on her plump pink lips. There certainly is a <i>lot</i> of woman there, too, now that you’re paying closer attention to her: her hips and thighs are thick and fertile-figured to an almost exaggerated degree, as is the shapely bust hefting up the front of her crisp suit-jacket. Combine those ample assets with the square hardlight glasses and the neat bun binding back thick locks of reddish-pink hair, and the woman cuts a figure you can only describe as");
	if (pc.isBro() || pc.LQ() >= 75) output(" <i>absolute MILF</i>");
	else output(" that of an ancient fertility goddess");
	output(". No way those curves are anything but artificial - and when you’re finally able to drag your gaze back up to her eyes, solid yellow irises and all, you know you’re looking at a gynoid.");

	output("\n\nA very familiar-looking gynoid, now that you think about it.");

	output("\n\n<i>“[pc.name]! I know it’s been some time, but I do remember teaching you not to stare. At least not so blatantly,”</i> the robotic woman chuckles, tucking her Codex under an arm and leaning back against the desk. <i>“It’s so good to see you again, dear.”</i>");

	output("\n\nWait. No way... <i>“Briget!?”</i> you all but blurt out, blinking away your surprise. <i>“What are you doing here?”</i>");
	
	output("\n\nA flood of childhood memories come rushing back, of the first decade of your life spent in the nurse-droid’s loving care. She was like a surrogate mother in your own’s absence, with you and Dad every step of the way until your tween years. You haven’t really seen her since.");
	
	output("\n\n<i>“In the synth-flesh,”</i> she answers, pushing up the hardlight spectacles on the bridge of her nose. <i>“As for what I’m doing here... when Victor commissioned the nursery for you, he decided someone with experience raising Steeles would be the natural choice to oversee things. With a hundred and thirty years of raising your father’s offspring under my belt, there’s hardly anyone more qualified.”</i>");
	
	output("\n\nLetting herself swell with pride for a moment, Briget adds, <i>“Besides, we both thought you could use a familiar face out here.”</i>");
	
	output("\n\nThe ancient gynoid stands with a smile, setting her Codex down and opening her arms to you. <i>“Now, if it’s not too much trouble, I think I’m about a decade overdue for a hug, "+ pc.mf("mister", "missy") +".”</i>");

	processTime(7+rand(5));

	//[Hug] [No hug]
	clearMenu();
	addButton(0, "Hug", nurseryMeetBrigetII, true, "Hug Her", "Nursedroids give the best hugs!");
	addButton(1, "No Hug", nurseryMeetBrigetII, false, "Don’t Hug", "You’re a little old for hugs, huh?");
}

public function nurseryMeetBrigetII(acceptedHug:Boolean):void
{
	clearOutput();
	author("Savin");
	showBriget();

	if (acceptedHug == false)
	{
		output("You give Briget a look, eliciting a pouted sigh and a shrug from her. <i>“Tsk, tsk. Very well, [pc.name], I suppose we can skip the pleasantries. As your father should have explained, the nursery here is pre-paid and held in trust for you: any children you have can be sent here for care and education, in virtually any number, and we are equipped to provide for any species, core-world or rush-space, you end up breeding with. If you’re anything like Victor, I suspect that my staff and I will be quite busy before long.”</i>");
	}
	else
	{
		output("Now there’s something you’ve been missing! You step forward and allow yourself to be pulled into a tight embrace, squished against the nurse-droid’s oh-so-soft, fleshy body. You’re immediately subsumed in a sense of warmth and security that’s been too-long absent from your life; the smell of rich, sweet perfume washes over you. More like a child than you’d intended, you find yourself nuzzling your [pc.face] into the lapel of Briget’s jacket, just enjoying the softness of the silky fabric on your [pc.skinFurScales].");
		
		output("\n\nBriget laughs pleasantly, running a hand across your [pc.hair]. <i>“It really is good to see you again, dear. Retirement was so thoroughly unfulfilling without at least one of my precious Steeles to take care of... though now that the nursery is up and running, I trust you’ll be keeping me busy with a whole new generation of the family, hmm?”</i>");
		
		output("\n\nIf you’re anything like your father, the answer will no doubt be a resounding <i>“yes.”</i>");
	}

	output("\n\n<i>“So,”</i> Briget says, turning your attention towards the holoscreen dominating the nearby wall. <i>“The nursery’s controller V.I. has been set to give you up to the minute status of the facility and any children you send here. Of course, it’s merely a monitoring agent: the actual act of caregiving and education falls to me and the staff I’ve assembled. As I did for your father, so too will I do for you. You have my solemn promise that your heirs will be the best-cared-for and educated children in the galaxy.”</i>");

	switch (flags["PC_UPBRINGING"])
	{
		case GLOBAL.UPBRINGING_PAMPERED:
			output("\n\nConsidering the way Briget brought you up, completely in the lap of luxury with all the love and attention - and expensive things - you could ever want, you know she’s telling the truth.");
			break;
		case GLOBAL.UPBRINGING_AUSTERE:
			output("\n\nMaybe without Dad around to force your kids to endure what you went through, she’ll actually be able to live up to that promise.");
			break;
		case GLOBAL.UPBRINGING_ATHLETIC:
			output("\n\nYou’re more concerned about them growing up nice and strong like you - but despite her soft, curvy physique, you know Briget’s more than capable of ensuring that. She plays a mean game of gravball for a hundred and thirty year old.");
			break;
		case GLOBAL.UPBRINGING_BOOKWORM:
			output("\n\nEducation, you know, Briget can handle in spades. She looks every bit the sexy teacher, and has the cyber-brain to match.");
			break;
		/*case GLOBAL.UPBRINGING_SLUTTY:
			output("\n\nBriget must not have realized exactly what you were up to all those years, but you feel that she won’t let them get up to anything naughty for a long while.");
			break;*/
		case GLOBAL.UPBRINGING_BALANCED:
		default:
			output("\n\nYou turned out better than average under her care, and that was in Dad’s estate, not that much different from your average kid. With a staff of experts and a top of the line facility under her direction, you can’t wait to see what Briget can do.");
			break;
	}
	
	flags["BRIGET_MET"] = 1;
	processTime(10+rand(5));

	nurseryBrigetMenu();
}

public function nurseryApproachBriget():void
{
	clearOutput();
	author("Savin");
	showBriget();

	output("You");
	if (flags["BRIGET_FUCKED"] != undefined) output(" wander up and grab a handful of Briget’s plump derriere. Your lovely nurse giggles in a girlish way reserved just for you, pressing herself back against your hand. <i>“Hello, sweet thing. What can momma do for you?”</i>");
	else output(" gently clear your throat, commanding Briget’s attention. <i>“Ah, [pc.name]. What can I do for you?”</i>");

	processTime(2+rand(3));
	nurseryBrigetMenu();
}

public function nurseryBrigetMenu():void
{
	clearMenu();
	
	//addButton(0, "Talk", nurseryBrigetTalkMenu, undefined, "Talk", "Sit and have a chat with Briget.");
	addButton(1, "Nursery", nurseryBrigetNurseryTalk, undefined, "Nursery", "Discuss the nursery’s status and functions with its head nurse.");
	//if (hours >= 7 && hours <= 16) addButton(2, "PrivateRoom", nurseryBrigetPrivateRoom, undefined, "Private Room", "Suggest that you and Briget move somewhere more private");
	//else addButton(2, "Sex", nurseryBrigetSex, undefined, "Sex", "See if you can make this motherly gynoid feel like a woman...");
	//addButton(10, "Appearance", nurseryBrigetAppearance);
	
	var btnSlot:int = 5;
	
	if(seraPregnancyIsDue())
	{
		if(flags["SERA_PREGNANCY_CHECK"] != undefined && (flags["SERA_PREGNANCY_CHECK"] + 1) >= days) addDisabledButton(btnSlot++, "Sera", "Sera", "Maybe you should wait before checking on her again.");
		else addButton(btnSlot++, "Sera", brigetSeraPregCheck, undefined, "Sera", (flags["SERA_PREGNANCY_CHECK"] == undefined ? "Ask where she is." : "Ask how she’s doing."));
	}
	
	addButton(14, "Back", mainGameMenu);
}

public function nurseryBrigetNurseryTalk():void
{
	clearOutput();
	author("Savin");
	showBriget();

	output("<i>“Let’s talk about the nursery,”</i> you prompt.");
	
	output("\n\nBriget immediately stands up a little straighter, suddenly looking very business-like. <i>“Of course, [pc.name]. That’s why I’m here, after all.”</i>");

	nurseryBrigetNurseryTalkMenu();
}

public function nurseryBrigetNurseryTalkMenu(lastFunc:Function = null):void
{
	clearMenu();
	
	if (lastFunc != nurseryBrigetNurseryStatus) addButton(0, "Status", nurseryBrigetNurseryStatus, undefined, "Nursery Status", "Ask Briget about the nursery’s current status.");
	else addDisabledButton(0, "Status");

	if (lastFunc != nurseryBrigetNurseryStaff) addButton(1, "Staff", nurseryBrigetNurseryStaff, undefined, "Nursery Staff", "Ask Briget about the nursery’s special staff.");
	else addDisabledButton(1, "Staff");

	addButton(14, "Back", nurseryBrigetMenu);
}

public function nurseryBrigetNurseryStatus():void
{
	clearOutput();
	author("Savin");
	showBriget();

	output("<i>“How are things at the nursery?”</i> you ask. Briget tuts at you, saying that you’re quite capable of looking at the holoscreen’s readouts yourself, but you simply say that you’d like to hear it from her. The head nurse doubtless can paint a more vivid picture than a few stale stat-displays.");
	
	output("\n\n<i>“Oh, very well,”</i> the gynoid teases, leaning back on her desk");
	if (flags["BRIGET_FUCKED"] != undefined) output(" in a way that makes those lovely big breasts of hers thrust out against her blouse.");
	else output(" in a way that makes her blouse look awfully tight.");
	output(" <i>“At the moment, we’re caring for");

	var numChildren:int = ChildManager.numChildren();
	if (numChildren > 1)
	{
		output(" " + numChildren + " of your darling children.");
		if (numChildren >= 10) output(" Quite the prolific breeder you’re becoming. Then again, what did I expect from a Steele?");
	}
	else if (numChildren == 1) output(" your one and only child. You must be so proud!");
	else output(" all of no children. Do me a favor and get to breeding, dearest. Your father didn’t bring me out of retirement to sit here idle!");
	output("”</i>");
	
	output("\n\n<i>“Our facilities are");
	if (!hasNurseryUpgrades() && !hasNurseryStaff()) output(" as your father bought them. We’re operating at near-perfect efficiency, and at budget.");
	else if (hasNurseryUpgrades() && hasNurseryStaff())
	{
		output(" greatly expanded thanks to your efforts. The nursery is bigger and better than anything old Victor could have hoped for");
		if (numChildren >= 10) output(", just like your lovely brood, my dear. You’re well on your way to out-breeding your father already");
		output("!");
	}
	else output(" somewhat upgraded thanks to you. Please, continue finding more staff and equipment out there on your adventures - everything you bring back makes the nursery that much better of a place for your children to grow up.");
	output("”</i>");
	
	output("\n\n<i>“The staff is");
	if (!hasNurseryStaff()) output(" largely robotic, with some specialists in education and infant-handling on retainer. The nurse-droid staff is quite capable, though, I assure you - and we both know I’m quite able to handle as many children as needed myself.");
	else if (numNurseryStaff() < 10)
	{
		output(" still more robotic than organic, but is becoming more diverse by the day. Thanks to your efforts, I’m sure we’ll soon boast the most colorful staff in the galaxy - a fitting way to operate, given what your father");
		if (numChildren >= 10) output(" correctly");
		output(" expected of you and your brood.");
	}
	else output(" We’re flush with everything we could ever need, all thanks to you, oh captain my captain. The way things are going, you might want to start asking some of your many, many half-siblings if they’d like to make use of the facility: we have more than enough staff.");
	output("”</i>");
	
	output("\n\nBriget flashes you a smile and taps on her Codex, glancing through the information at her display. <i>“I believe that covers everything of note at present. Anything else, [pc.name]?”</i>");

	processTime(5+rand(5));

	nurseryBrigetNurseryTalkMenu(nurseryBrigetNurseryStatus);
}

public function nurseryBrigetNurseryStaff():void
{
	clearOutput();
	author("Savin");
	showBriget();

	//Has no special staff:
	if (!hasNurseryStaff())
	{
		output("Out of curiosity, you ask <i>“If I find someone out there in the galaxy that would fit in well here at the nursery, can I offer them a job?”</i>");

		output("\n\nBriget purses her lips a moment, thinking. <i>“I suppose so. Technically speaking, I am in charge of all matters related to staff, but of course I trust your judgement, dear, especially in regards to your own children. If you find someone with skills or talents you think would make the nursery a better place for us to bring up your offspring, I would be happy to have them. There will need to be interviews and contracts, of course, but those should be a formality.”</i>");

		output("\n\nThat answers that, you suppose. Does she have any suggestions for staff she needs? Any particular skillsets you should be on the lookout for?");

		output("\n\n<i>“Oh, I take care of everything we </i>need<i> here, strictly speaking,”</i> Briget assures you. <i>“But that doesn’t mean I always have the contacts to find us truly unique skills on demand. Your father had the foresight to make accommodations for a laboratory and bio-science center on the second floor, which could begin to provide all manner of benefits to your reproductive health - and your fertility/virility - were it staffed and equipped. We also have a modular living bay designed to accommodate your differently-abled children, and those who need non-standard conditions to grow. Finding specialist caretakers for these environments is within my purview, but finding additional experts who can better educate and care for Rush-space species may be easier for you than it is for me.”</i>");

		output("\n\nSo scientists and aliens, basically?");

		output("\n\n<i>“Basically,”</i> Briget nods. <i>“Oh, and while we’re quite able to source milk and other foods from corporate sources, I’ve always found that children respond better to a mother’s touch... and nourishment. Of course I am equipped for such functions - I nursed you, after all - but I am still a synthetic, as is my milk.");
		if (pc.isLactating()) output(" Since you’re quite obviously lactating already");
		else if (pc.isPregnant()) output(" Now that you’re pregnant");
		else output(" If you yourself should ever become pregnant");
		output(", we have a milking station on the second floor which you can use to store some of your milk away for your children. Of course, should you find individuals willing to donate their own natural milk, we would be happy to compensate them for it.”</i>");

		output("\n\nInteresting.");
		if (reahaIsCrew()) output(" Maybe you should talk to Reaha about that...");
	}
	else
	{
		output("<i>“How’s the staff doing?”</i> you ask. Things certainly seem a little more lively around here.");

		output("\n\nBriget smiles, directing your attention to the holoterminal on the wall. It flickers over to a status display, showing off current numbers of synthetic and organic employees working in the nursery, along with breakdowns of their roles and terms of employment.");

		output("\n\n<i>“Everything is going quite well, dear.");
		if (numNurseryStaff() < 10) output(" Though most of the nursery’s duties are still fulfilled by drones and nurse droids, having an organic touch has certainly made our little home away from home that much more vibrant and pleasant. Even I have to admit, children do seem to respond better to living caregivers... at least until they get to know me.”</i> She chuckles pleasantly, though her eyes turn downcast rather quickly.");
		else if (numNurseryStaff() >= 10)
		{
			output(" You’ve certainly found more employees than I would have expected. Our budget is a bit strained at present, but I believe the effects more than justify a bit of " + (isAprilFools() ? "dogecoin" : "credit") + "-pinching here and there: I never expected the nursery to feel so vibrant and alive");
			if (ChildManager.numChildren() >= 2) output(", even with all your precious darlings here with me");
			if (ChildManager.numChildren() >= 10) output("! We’ve built a community here thanks to you, dear");
			output(". They say it takes a village, and I can certainly see the wisdom in that now. I simply </i>know<i> that your offspring will be the best and brightest the galaxy has to offer under our care");
			if (ChildManager.numChildren() == 0 && !pc.isPregnant()) output("... when you have them, that is");
			output(".");
		}
	}

	processTime(5+rand(5));

	clearMenu();
	nurseryBrigetNurseryTalkMenu(nurseryBrigetNurseryStaff);
}

public function nurseryMaternityWait():void
{
	clearOutput();
	author("Savin");

	output("You glance around the apartment, finding your hand drifting to your [pc.belly]. Maybe you shouldn’t be galavanting about the galaxy when you’ve got a young, vulnerable life growing inside you, you think to yourself. The nursery is equipped to support you and your spawn almost indefinitely: you can stay here in safety and comfort until you’re ready to give birth, whenever that may be. Hopefully your space-race quest can wait.");
	
	nurseryMaternitySure(false);
}
public function nurseryMaternitySure(clearText:Boolean = true):void
{
	var firstSlot:int = PregnancyManager.getNextEndingSlot(pc, "EggTrainerFauxPreg");
	var firstDuration:int = PregnancyManager.getRemainingDurationForSlot(pc, firstSlot);
	
	if(clearText)
	{
		clearOutput();
	}
	else
	{
		output("\n\n");
	}
	
	output("It looks like this may take");
	if(firstDuration < 660) output(" less than a day");
	else if(firstDuration < 1440) output(" about a day");
	else if(firstDuration < 2100) output(" over a day");
	else if(firstDuration < 2880) output(" a couple days");
	else if(firstDuration < 4320) output(" several days");
	else if(firstDuration < 10080) output(" about a week");
	else if(firstDuration < 20160) output(" over a week");
	else if(firstDuration < 40320) output(" a couple weeks");
	else if(firstDuration < 43200) output(" about a month");
	else if(firstDuration < 63360) output(" over a month");
	else if(firstDuration < 80640) output(" a couple months");
	else if(firstDuration < 475200) output(" several months");
	else if(firstDuration < 481800) output(" almost a year");
	else if(firstDuration < 525600) output(" about a year");
	else if(firstDuration < 1007400) output(" over a year");
	else if(firstDuration < 1051200) output(" a couple years");
	else output(" " + num2Text(minutesToYears(firstDuration)) + " years");
	output(" before you’re due");
	if(pc.totalPregnancies() > 1) output(" -- at least for the nearest pregnancy anyway");
	output(".");
	
	output("\n\nWould you like to stay here until you give birth?");
	
	clearMenu();
	addButton(0, "Yes", nurseryMaternityWaitGo);
	addButton(1, "No", mainGameMenu);
	addButton(4, "Maybe", nurseryMaternityMaybe, firstDuration);
}
public function nurseryMaternityMaybe(firstDuration:int = 0):void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	
	var totalPreg:int = pc.totalPregnancies();
	
	clearOutput();
	
	output("Do you want to rest the full time until you are due, or wait some time before then?");
	
	clearMenu();
	
	addButton(0, "Full Time", nurseryMaternityWaitGo, undefined, "Wait: Until Due", "Rest until your nearest pregnancy is due.");
	
	if ((firstDuration - 5) > 1440) addButton(5, "1 Day", nurseryMaternityWaitTime, 1440, "Wait: One Day", "Rest for one full day.");
	else addDisabledButton(5, "1 Day", "Wait: One Day", ("You" + (totalPreg == 1 ? "r pregnancy" : " have a pregnancy that") + " will be due before this time!"));
	if ((firstDuration - 5) > 10080) addButton(6, "1 Week", nurseryMaternityWaitTime, 10080, "Wait: One Week", "Rest for one full week.");
	else addDisabledButton(6, "1 Week", "Wait: One Week", ("You" + (totalPreg == 1 ? "r pregnancy" : " have a pregnancy that") + " will be due before this time!"));
	if ((firstDuration - 5) > 43200) addButton(7, "1 Month", nurseryMaternityWaitTime, 43200, "Wait: One Month", "Rest for one full month.");
	else addDisabledButton(7, "1 Month", "Wait: One Month", ("You" + (totalPreg == 1 ? "r pregnancy" : " have a pregnancy that") + " will be due before this time!"));
	if ((firstDuration - 5) > 525600) addButton(8, "1 Year", nurseryMaternityWaitTime, 525600, "Wait: One Year", "Rest for one full year.");
	else addDisabledButton(8, "1 Year", "Wait: One Year", ("You" + (totalPreg == 1 ? "r pregnancy" : " have a pregnancy that") + " will be due before this time!"));
	if ((firstDuration - 5) > 30) addButton(9, "Custom", nurseryMaternityWaitCustom, firstDuration, "Wait: Custom", "Rest for as long as you like until right before birth.");
	else addDisabledButton(9, "Custom", "Wait: Custom", ("You" + (totalPreg == 1 ? "r pregnancy" : " have a pregnancy that") + " will be due very soon!"));
	
	addButton(14, "Back", nurseryMaternitySure);
}
public function nurseryMaternityWaitTime(duration:int = 0):void
{
	clearOutput();
	author("");
	
	var timeList:Array = minutesToDurationList(duration, true);
	
	// 9999 - Maybe needs better text...
	output("You wait for" + (timeList.length > 0 ? (" approximately " + CompressToList(timeList)) : "some time") + " as Briget tends to you for the desired amount of time....");
	
	flags["NURSERY_MATERNITY_WAIT_ACTIVE"] = 1;
	processTime(duration);
	flags["NURSERY_MATERNITY_WAIT_ACTIVE"] = undefined;
	
	var firstSlot:int = PregnancyManager.getNextEndingSlot(pc, "EggTrainerFauxPreg");
	var firstDuration:int = PregnancyManager.getRemainingDurationForSlot(pc, firstSlot);
	output("\n\nYou get up and are on your way" + (firstDuration <= 30 ? " -- extremely close to delivering at any moment!" : "."));
	
	dailyAutoSleep(duration);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function nurseryMaternityWaitCustom(firstDuration:int = 0):void
{
	var limit:int = (firstDuration - 5);
	
	if(stage.contains(userInterface.textInput)) removeInput();
	clearOutput();
	
	output("How long do you wish to wait for?\n<i>(Value should be in number of minutes. Maximum time until your next birth is " + limit + " minutes.)</i>");
	displayInput();
	output("\n\n\n");
	
	clearMenu();
	addButton(0, "Next", nurseryMaternityWaitCustomOK, firstDuration);
	addButton(14, "Back", nurseryMaternityMaybe, firstDuration);
}

public function nurseryMaternityWaitCustomOK(firstDuration:int = 0):void
{
	var limit:int = (firstDuration - 5);
	
	if(isNaN(Number(userInterface.textInput.text))) {
		nurseryMaternityWaitCustom(firstDuration);
		output("Choose a value that is a positive integer, please.");
		return;
	}
	else if(Number(userInterface.textInput.text) < 1) {
		nurseryMaternityWaitCustom(firstDuration);
		output("Choose a value that is 1 minute or more, please.");
		return;
	}
	else if(Number(userInterface.textInput.text) > limit) {
		nurseryMaternityWaitCustom(firstDuration);
		output("Choose a value that is " + limit + " minutes or below, please.");
		return;
	}
	var duration:int = Math.floor(Number(userInterface.textInput.text));
	if(stage.contains(userInterface.textInput)) removeInput();
	nurseryMaternityWaitTime(duration);
}

public function nurseryMaternityWaitGo():void
{
	clearOutput();
	author("Savin");

	output("You ping Briget over the nursery’s intercom and tell your old nurse that you’re thinking about taking an extended stay with her.");
	
	output("\n\n<i>“Oh? That’s marvelous, [pc.name]. Say the word, and I’ll have your personal effects brought up from your ship.”</i>");
	
	output("\n\nYou affirm your decision with her and turn your focus to the bed, deciding that with so much free time suddenly on your hands, it’s time to catch up on some much-needed rest. It isn’t long before Briget arrives along with several of the nursery’s drones, carrying boxes of your personal effects: everything from spare clothes to your toothbrush, whatever you’ll need for your stay. Before she leaves you, the gynoid nurse gingerly approaches and places a hand on your [pc.belly].");

	output("\n\n<i>“I’m very excited to see what the newest addition to the family will be, [pc.name],”</i> she");
	if (flags["BRIGET_FUCKED"] == undefined)
	{	
		output(" says with the warm, matronly smile you’ve come to expect. <i>“Now you just relax and let me and my staff take good care of you until the next Steele is ready to join us.”</i>");

		output("\n\nYou nod appreciatively, content to have someone experienced to care for you while you’re vulnerable - and for your offspring once you’ve delivered them. Briget chuckles at the complement, reaching in to give you a kiss on the brow before sashaying out of the room. You’re half surprised she didn’t try and tuck you in.");
	}
	else
	{
		output(" murmurs, guiding you back to the bed. Once the drones are gone she’s quick to straddle your [pc.hips], wrapping her arms around your neck and leaving her over-ample chest so close that you can’t help but nestle your head into the soft, pillowy embrace of her cleavage. <i>“Just as important, I get to have you all to myself for a while. Now I want you to lay back and let momma take care of absolutely everything, my dear.”</i>");

		output("\n\nBefore you can respond, Briget’s hand reaches down,");
		if (pc.hasCock()) output(" wrapping around your [pc.cock]");
		else if (pc.hasVagina()) output(" slipping a pair of fingers across the lips of your quim");
		else output(" caressing your barren loins");
		output(". She smiles seductively, eyelids heavy and plump lips pursed; it’s only natural to follow her into a deep, long kiss, letting Briget lead you into bed and take care of your every need the way only an amorous nurse droid can...");
	}

	output("\n\nYour first night in the nursery is more restful than you imagined it ever could be.");
	var firstSlot:int = PregnancyManager.getNextEndingSlot(pc, "EggTrainerFauxPreg");
	var firstDuration:int = PregnancyManager.getRemainingDurationForSlot(pc, firstSlot);
	if (firstDuration >= 2880)
	{
		output(" By the end of the second day, you can feel all the tension bleeding away: all the aches and the cares of your adventuring life seem so far away as you’re pampered by Briget and her staff. The matronly gynoid simply refuses to let you lift a finger for yourself, insisting that she knows exactly how to treat a pregnant Steele after all these years. Considering her breadth of experience, and how relaxed and contented you soon find yourself, it’s hard to argue the point.");

		if (flags["CREWMEMBER_SLEEP_WITH"] != undefined)
		{
			output(" " + getSleepingPartnerName() + " joins you after the first night, carrying in a handful of belongings and making " + (isSleepingPartnerMale() ? "him" : "her") + "self comfortable in your shared living space. Briget");
			if (flags["BRIGET_FUCKED"] != undefined) output(" takes the extra presence in your bed in stride - you are a Steele, after all. Your poor bed, however, clearly wasn’t made for the sexual escapades that the three of you get up to - though a shattered headboard or two is easily replaced.");
			else output(" quickly rearranges things to accommodate your lover, making sure you’re both well tended to.");
		}
	}

	if (firstDuration >= 1051200) output("\n\nThe years pass")
	else if (firstDuration >= 481800) output("\n\nThe year passes");
	else if (firstDuration >= 80640) output("\n\nThe months pass");
	else if (firstDuration >= 20160) output("\n\nThe weeks pass");
	else if (firstDuration >= 1440) output("\n\n The days pass");
	else output("\n\nThe day passes");
	output(" in a slow, peaceful haze. Your [pc.belly] grows, swelling with life until the inevitable end of your pregnancy comes. When it does, Briget is at your side in the blink of an eye, accompanied by several nurse-droids that haul you onto a stretcher, dazed and moaning, and cart you off to a maternity ward on the station. You barely notice an anesthetic hypospray hissing against your neck; only a sudden grogginess tips you off, and then the world goes black.");

	// We don't want to process-time passed the actual birthing stuff, we need to intercept the usual system, execute the cleanups (for stat tracking)
	// THEN pass the time, so we don't trigger any of the other stage progression outputs.

	var baseTime:uint = GetGameTimestamp();
	var allBirths:Array = [];

	// Rather than ending ALL, what should happen is we end the next available, and check if any other pregnancies are _close enough_ to ending, and also end those,
	// and compress them all together. The PC is aware during the entire pregnancy, so we can't just clear _all_ of them with no regard to some that finish halfway through!

	var ends:uint = baseTime + firstDuration;
	var c:Child = PregnancyManager.nurseryEndPregnancy(pc, firstSlot, ends);
	if (c != null) allBirths.push(c);

	// The first pregnancy is now over, so now we can check again to see if there are any ending within say 24 hours and end those too
	var bEndedSecondPreg:Boolean;
	var finalDuration:int = firstDuration;

	do
	{
		bEndedSecondPreg = false;
		if ((pc as PlayerCharacter).hasPregnancyOfTypeOtherThan("EggTrainerFauxPreg"))
		{
			var nextSlot:int = PregnancyManager.getNextEndingSlot(pc, "EggTrainerFauxPreg");
			var nextDuration:int = PregnancyManager.getRemainingDurationForSlot(pc, nextSlot);

			if (nextDuration - firstDuration <= 1440)
			{
				bEndedSecondPreg = true;
				ends = baseTime + nextDuration;
				c = PregnancyManager.nurseryEndPregnancy(pc, nextSlot, ends);
				if (c != null) allBirths.push(c);
				finalDuration = nextDuration;
			}
		}
	} while (bEndedSecondPreg)

	flags["NURSERY_MATERNITY_WAIT_ACTIVE"] = 1;
	processTime(finalDuration);
	flags["NURSERY_MATERNITY_WAIT_ACTIVE"] = undefined;
	
	dailyAutoSleep(firstDuration);
	
	clearMenu();
	addButton(0, "Next", nurseryMaternityWaitPostBirths, { births: allBirths, dur: finalDuration });
}

public function nurseryMaternityWaitPostBirths(args:Object):void
{
	var allBirths:Array = args.births;
	var finalDuration:uint = args.dur;

	clearOutput();
	author("Savin");

	output("When you wake up you’re back in your bedroom, buck naked and tucked into the covers. You’ve definitely been given a bath while you were out, and your equipment is neatly stacked on the desk across the room from you. Briget is sitting in the chair, turned half aside from you and humming happily to herself.");

	var lastBorn:Child = (allBirths.length > 0 ? allBirths[allBirths.length - 1] : null);
	if (lastBorn != null)
	{
		output(" Her suit-jacket is unbuttoned, and she’s holding a newborn " + GLOBAL.TYPE_NAMES[lastBorn.RaceType].toLowerCase() + " in her arms, letting " + lastBorn.randomApplicableGender("him", "her", "her", "it") + " nurse from one of her full, milk-swollen breasts.");

		output("\n\nBriget blinks when you stir, brought back from her motherly daydreaming. ");
	}
	else
	{
		output("\n\n");
	}
	
	output("<i>“Oh, [pc.name]. I thought you would be asleep for some time still.... Do forgive an old gynoid for still taking some little pleasure in watching over you while you dream, hmm?”</i>");
	
	if (lastBorn != null) output("\n\nShe smiles and glances down to the little bundle in her arms. <i>“Everything went perfectly, of course. You’re now mother to " + (lastBorn.Quantity == 1 ? ("a newborn " + GLOBAL.TYPE_NAMES[lastBorn.RaceType].toLowerCase()) : (num2Text(lastBorn.Quantity) + " newborn " + GLOBAL.TYPE_NAMES[lastBorn.RaceType].toLowerCase() + " babies")) + ". Congratulations, dear.”</i>");

	var totalDays:int = Math.floor(finalDuration / 1440);
	var totalHours:int = Math.round((finalDuration % 1440) / 60);
	output("\n\nYou spend a few moments stretching and collecting yourself");
	if (lastBorn != null) output(" - and fussing over your newborn offspring -");
	output(" before glancing at the clock sitting on the desk. <b>You’ve spent");
	if (totalDays > 0) output(" " + num2Text(totalDays) + " day" + (totalDays > 1 ? "s" : ""));
	if (totalHours > 0)
	{
		if (totalDays > 0) output(" and");
		output(" " + num2Text(totalHours) + " hour" + (totalHours > 1 ? "s" : ""));
	}
	output(" here</b> in leisure. God only knows what your rival’s gotten up to in that time.");
	
	output("\n\nNow unburdened of your pregnancy, you figure it’s time to get back on the space-trail.");

	processTime(15);
	pc.shower();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function nurseryFixBelly(response:String = "intro"):void
{
	clearOutput();
	showName("BELLY\nFIX");
	clearMenu();
	
	switch(response)
	{
		case "intro":
			output("Choosing to do this will clear your excess belly size and revert your belly back to its default size. Are you sure you want to do this?");
			addButton(0, "Yes", nurseryFixBelly, "yes");
			addButton(1, "No", nurseryFixBelly, "no");
			break;
		case "yes":
			output("Your nanomachines get to work and tingles run across your [pc.belly]. Suddenly, it shifts and reverts back to its former shape... more or less.");
			
			pc.bellyRatingMod = 0;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "no":
			output("It’s just a minor bug, really. Maybe later perhaps?");
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

public function nurserySpecialistCockvine(numVines:int = 1):void
{
	clearOutput();
	showName("COCKVINE\nHABITAT");
	author("Nonesuch");
	
	output("You head towards the Hydrus Constuprula habitat’s viewing window, adjust the dials to enable the night vision and move the camera about the tunnels in search of " + (numVines == 1 ? "your" : "a") + " cockvine...");
	
	var children:Array = ChildManager.getChildrenOfType(GLOBAL.TYPE_COCKVINE);
	var child:Child;
	var oldestVine:int = 0;
	if (children != null && children.length > 0)
	{
		child = children[0];
		for (var i:int = 0; i < children.length; i++)
		{
			var c:Child = children[i] as Child;
			if(oldestVine < c.Years) oldestVine = c.Years;
		}
	}
	
	if (numVines <= 1 || (numVines <= 4 && oldestVine <= 1))
	{
		output("\n\nThere is " + (numVines == 1 ? "the" : "a") + " little guy now - snaking its way through the depths of its current home, grasping the rock occasionally with acquisitive interest. As far as you can tell, it looks reasonably healthy and happy.");
		if(numVines > 1) output(" The " + (numVines == 2 ? "other cockvine spawn is" : "rest of your cockvine spawn are") + " tunneling happily through the darkness.");
	}
	else if (numVines <= 4 && oldestVine <= 4)
	{
		output("\n\n" + (numVines == 1 ? "The cockvine" : "Your first") + " has taken root, and is not so much of a little guy anymore. Its exercise ball-shaped bulb is rooted deep, and it has sprouted several long tentacles reaching through the crevices many feet above it.");
		if(numVines > 1) output(" The " + (numVines == 2 ? "other cockvine spawn is" : "rest of your cockvine spawn are") + " still dinky and mobile, tunneling happily through the darkness.");
	}
	else
	{
		output("\n\n" + (numVines == 1 ? "Y" : "The first of y") + "our plant spawn has grown into an absolute monster, with over a dozen tentacles each reaching pretty much the entire height of the room, up the central crevice, laid out hopefully across the surface.");
		if(numVines > 1) output(" Another smaller one has taken root in the corner.");
		if(numVines > 4) output(" Counting up the remaining cockvine you can see slithering through the gloom, you guess at least two or three have chosen to merge with the bigger beasts.");
	}

	output("\n\nThe staff tell you that the creature");
	if (numVines > 1) output("s");
	output(" make");
	if (numVines == 1) output("s");
	output(" for a great waste disposal device - any vegetable or animal matter left over by the Nursery’s kitchen disappears in moments when it’s thrown into the chamber.");
	
	processTime(3);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function nurserySpecialistWaterPricesses():void
{
	clearOutput();
	author("Savin");

	if (flags["NURSERY_WATER_PRINCESS_VISTS"] == undefined)
	{
		showName("NYREAN\nHUNTRESS");
		
		output("You step up to the glass door separating your watery children’s living space from the drier climate of the nursery, peering through into total darkness. You give a glance to the nyrean huntress standing nearby, wrapped up in the Steele Tech uniform that shows off plenty of toned muscle and a bulge that looks like she’s packing a coconut in her crotch. Kid friendly, for sure.");
		
		output("\n\n<i>“Greetings,");
		if (flags["KING_NYREA"] == undefined) output(" captain");
		else output(" my " + pc.mf("king", "queen"));
		output("”</i> the huntress says, giving you a respectful incline of her head. <i>“A pleasure to make your acquaintance.”</i>");
		
		output("\n\nThere’s clearly no need to introduce yourself, so you just return her gesture and ask what she’s doing here, exactly. What qualifies her to watch over your young princesses?");
		
		output("\n\nThe huntress smiles demurely, folding her hands behind her back. <i>“I’m afraid there’s nobody truly experienced with raising Water Queen anymore. My only qualification is that our queen tried to breed me several times. None of her eggs took, though not for lack of trying, or desire on my part. When you were impregnated, the Queen asked me to come and find you; to serve you as I would have her. I am ever her loyal servant, and it is my honor to watch over the princesses while they mature.”</i>");
		
		output("\n\nThat’s about as good as you’re likely to get, you suppose. For now, you ask how the princesses are doing.");
		
		output("\n\n<i>“They’re well. Very well,”</i> the huntress answers, turning towards the monitors on the wall. <i>“They’re still sensitive to the light, and we’ve had to expand their living space - Queens of the Deep Water are solitary beings, and they like to keep their distance from each other. And from me, when they don’t wish to nurse or play-fight. You’ll be pleased to know they’re growing quickly, and growing strong, too. The Queen was worried her daughters would be anemic, if they survived at all; she’s quite happy to have been proven wrong.”</i>");
		
		output("\n\nAs are you. On that note, is it alright for you to go inside and visit?");
		
		output("\n\n<i>“Of course! The princesses have been asking after you almost non-stop since their arrival. They’ll be overjoyed to see their "+ pc.mf("father", "mother") +" again. Head inside whenever you like - just be very loud when you do. They can be a little jumpy when they’re nesting.”</i>");

		processTime(30);

		flags["NURSERY_WATER_PRINCESS_VISTS"] = 0;

		clearMenu();
		addButton(0, "Next", nurserySpecialistWaterPricesses);
	}
	else
	{
		showName("WATER\nPRINCESSES");
		
		IncrementFlag("NURSERY_WATER_PRINCESS_VISTS");
		var children:Array = ChildManager.getChildrenOfType(GLOBAL.TYPE_WATERQUEEN);
		var totalNum:int = 0;
		var child:Child;
		if (children != null && children.length > 0)
		{
			child = children[0]; // The oldest should be first in the array!
			for (var i:int = 0; i < children.length; i++)
			{
				var c:Child = children[i] as Child;
				totalNum += c.Quantity;
			}
		}

		output("You step up to the door and take a peek at the night-sight monitor next to it. The screen is divided into a number of different viewpoints, each keeping track of one of your "+ num2Text(totalNum) +" young princesses. Most of your royal brood is quietly nesting, tucked away in the various half-submerged corners of the modified chamber and soaking underneath beds of fungus and leaves.");

		output("\n\nAs their caretaker suggested, you make sure that opening the door makes plenty of noise. The door itself is huge, befitting the size its occupants will grow to, and a long tunnel stretches out after it to help funnel out the nursery’s light so opening up doesn’t accidentally blind your subterranean spawn. You traverse the tunnel, stepping out onto a little sandy island at the water’s edge, not much more than three yards to a side.");
		
		output("\n\nIt’s pitch black inside, save for the dim light filtering through the tunnel at your back. A pair of red lanterns have been set up at the water’s edge, hooked up to power cables on the bulkheads. You flip them on and close the door, leaving yourself in dim crimson glow. Remembering that the princesses are already able to read and write, and so presumably speak, you call out a <i>“Hello?”</i> into the shadows.");
		
		output("\n\nA long moment passes.");
		
		output("\n\nThe water ripples in front of you, and a head of silky hair blossoms on the surface, followed by a pair of dark eyes. Unlike the Queen’s, your daughter’s are fundamentally human in shape and color, staring up at you with wild curiosity. She rises from the pool a moment later, revealing a humanoid upper half the same lustrous blue as her mother, wrapped up in a one-piece swimsuit from shoulders to her waist, where the sprawling, spidery crab-body begins in earnest.");

		output("\n\n<i>“"+pc.mf("Daddy", "Mommy") +", is that you?”</i> the princess asks, suddenly smiling. <i>“It is! Everyone, come look who’s here, quick!”</i>");

		output("\n\nShe scuttles up out of the water, and suddenly you’re made aware again of just how massive her species is. Once she’s on land, you’re left");

		// 9999 really need to define what "young" means in this instance.
		// Also, as this is written kinda skips out on a fair important portion of the kids getting older, because
		// it's feasible that the player could literally have just given birth to them and then walked into the specialist room and suddenly they're all 8ft tall???

		var bIsYoung:Boolean = GetGameTimestamp() - child.BornTimestamp <= 1051200;
		if (bIsYoung && pc.tallness >= 96) output(" staring more or less eye-to-eye with your young daughter. Her spindly legs put her on a much higher vantage than a human, and her more personable half is shapely and tall, built like a swimmer.");
		else if (bIsYoung) output(" staring up at your towering daughter. She’s bigger than a leithan already, a bit awkward on her spindly land legs but riding so high that it’s hard to see her face in the gloom.");
		else output(" leaning back and staring wide-eyed at the titan you gave birth to. She’s enormous, easily as big as the Queen herself now, riding high on slender legs each taller than a human, elevating her so high that it’s hard to see her face in the red gloom. You can, however, see that the more personable half sitting atop the crab-like lower body has developed into quite the woman, voluptuous and strong and just as gorgeous as her mother.");
		output(" If only the Queen could see her now...");

		clearMenu();
		addButton(0, "Next", nurserySpecialistWaterPricessesII, child);
	}
}

public function nurserySpecialistWaterPricessesII(child:Child):void
{
	clearOutput();
	showName("WATER\nPRINCESSES");
	author("Savin");

	output("Several more heads of tentacled hair peek up from the water’s edge a few moments later, and soon you’re overwhelmed with chattering voices - a chorus of <i>“Hi!”</i> <i>“Welcome home!”</i> <i>“We missed you so much!”</i> and more. Half a dozen pairs of hands grab at you, pulling you into hugs and kisses every which way. Your not-so-little girls giggle and cry out with joy, pulling you in so many directions at once that you’re momentarily afraid they’ll forget their own strength... but no, they’re as gentle as angels once you start squirming, setting you back down on the sandbar and folding their legs under themselves, coming down to your level.");

	output("\n\nBefore long, your princesses have coaxed you into sharing your adventurous tales with them. Their curiosity is boundless, you soon discover: wanderlust and starry-eyed wonder fills them with every word, and they’re on the edge of their crabby seats as you recount some of your more dangerous exploits and less steamy encounters.");
	
	output("\n\nEventually between stories, you note that your princesses have really grown since you birthed them - much, much faster than a human child. You remember the Queen hinted at herself being quite young by Terran standards, so... just how mature are her spawn already? They were talking, reading, and writing just moments after they hatched, after all. And they’re already so big...");
	
	output("\n\n<i>“We don’t know!”</i> the first of the bunch answers apologetically. <i>“We’ve tried to find a, um... a codex? For our race! But we can’t find any information.”</i>");
	
	output("\n\n<i>“Briget’s been helping us!”</i> another princess offers. <i>“She says nobody’s ever seen a Water Queen before.”</i>");
	
	output("\n\n<i>“Or whatever we’re supposed to be called!”</i> a third chimes in. <i>“Mother knows more, but our ‘caretaker’ says she won’t leave Myrellion. Not even to come visit!”</i>");
	
	output("\n\nThey’ve been talking to the Queen? If so, you have to wonder: does she want her daughters back home, now that they’re born?");

	output("\n\n<i>“No,”</i> the first of your daughters admits. <i>“I mean, I’m sure she’d like us to visit! But the whole point of, um, making you our "+ pc.mf("father", "mother") +" was to make sure we got off Myrellion, wasn’t it? There’s nothing for us there...”</i>");

	output("\n\n<i>“We need to go colonize new planets!”</i> another of the bunch grins. <i>“Just like you! A Princess for every planet "+ pc.mf("daddy", "mommy") + " goes to on the rush.”</i>");

	output("\n\nThe rest of them laugh and cheer; a few slap their sister on the back or rump, making her blush a dark blue.");

	output("\n\nAfter a few moments, the first of them leans over and puts her head on your shoulder. A few of her head-tendrils wrap softly around your neck. <i>“Don’t worry, "+ pc.mf("daddy", "mommy") +", we’re not going anywhere for a while. There’s so much to learn before we go! Briget’s promised to teach us day and night while we’re here, and even says some of us might be able to go to a, um... a universe-city!”</i>");

	switch (pc.affinity)
	{
		default:
		case "physique":
			output("\n\n<i>“But some of us are gonna be big, tough warriors instead!”</i> one of the tallest princesses boasts, flexing her impressive muscles. Several of her sisters ooh and ahh, scuttling over to grope at her biceps or poke at her chiseled abs. " + (pc.affinity == "physique" ? "Definitely takes after you" : "Such determination") + ", that one.");
			break;

		case "reflexes":
			output("\n\n<i>“Some of us!”</i> another of the princesses grins, a slender, willowy girl on a particularly long-legged lower body. <i>“I’ve been watching grav-ball, though, and I’m totally going to try out for it!”</i>");
			output("\n\n<i>“They’ll never let you in!”</i> another huffs. The two start squabbling, and have to be pulled apart by their sisters.");
			break;

		case "aim":
			output("\n\nOne of the other princesses scuttles forward and puts her hands on her hips, towering over the first. <i>“Maybe you, smarty-crab! <b>I</b>’m thinking about joining the Peacekeepers! See the galaxy before I settle down with a brood of my own.”</i>");
			break;

		case "intelligence":
			output("\n\n<i>“Yeah!”</i> another of them beams. <i>“Mo- I mean, Miss Briget says if I keep acing all her math tests, I could probably get a scholarship to Terra Prima. She says I’ve got what it takes to be an, um... an astro-physicist! Whatever that is!”</i>");
			output("\n\n<i>“Nerd!”</i> one of the princesses further back in the darkness shouts. The math-whiz blushes and sticks her tongue out over her shoulder.");
			break;

		case "willpower":
			output("\n\nAnother princess stalks out of the shadowy waters, crossing her arms under her");
			if (child != null && GetGameTimestamp() - child.BornTimestamp <= 1051200) output(" exceptionally ample");
			output(" chest. <i>“Maybe <i>you’re<i> going to university, but Miss Briget says some of us should think about testing for Games and Theory. Says we have sharp minds.”</i>");
			output("\n\n<i>“Isn’t that, like, code for psychic powers?”</i> another princess chuckles. <i>“Can you read my mind, now?”</i>");
			output("\n\n<i>“Maybe someday!”</i> the other scoffs. <i>“Or maybe I’ll just </i>blow things up with my brain!</i>");
			break;
	}

	output("\n\nYou find yourself laughing at the princess’s antics. Despite what their caretaker said, you’re quickly coming to see that they love each other very much - and you, too, the way they cuddle up around you with adoring eyes, content to bask in your presence.");
	if (pc.hasKeyItem("Water Princess Note"))
	{
		output(" You find yourself reaching into your pack and pulling out the little note they left you all that time ago, scrawled on the back of the drone’s receipt. Seeing it, the first of your princesses gives a delighted squeal. <i>“Ah, you really kept it!”</i>");
	
		output("\n\nOf course you did. It was just about the most precious thing you’ve ever gotten.");
		
		output("\n\nShe grins ear to ear and throws her arms around your neck. <i>“I’m so glad!”</i>");
		
		output("\n\n<i>“We all are!”</i> another adds. Several of her sisters voice their agreement.");
		
		output("\n\n<i>“And we meant what it said. We’re super thankful to have you, "+ pc.mf("daddy", "mommy") +"! And then there’s the nursery and Miss Briget and everything else you’ve done for us since. So from all of us: thank you so much!”</i>");
	}
	
	output("\n\nYou smile and put your arms around a pair of the young princesses, holding your brood close for a while. Eventually, though, a few of them start yawning, or mumbling complaints about their carapaces getting dry. That seems like your cue to let them get back to their watery nests - an idea that earns you groans and pleas to stay, but you know you need to let them get some rest. Giving them farewell hugs, you see them back into the water before turning to the tunnel and switching the lights back out to darkness.");
	
	processTime(55+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Debug function!
public function pregAverageLoadSizes():void
{
	clearOutput();
	showName("AVERAGE\nLOAD SIZES");
	
	output("The average load sizes for each potential sire are as follows:\n<i>(Pregnancies that are set to alwaysImpregnate are omitted.)</i>");
	
	output("\n\n<b><u>ButtBugPregnancy</u></b>: " + (new ButtBugPregnancy()).definedAverageLoadSize + " mLs");
	output("\n\n<b><u>ButtBugPregnancy0</u></b>: " + (new ButtBugPregnancy0()).definedAverageLoadSize + " mLs");
	output("\n\n<b><u>ButtBugPregnancy1</u></b>: " + (new ButtBugPregnancy1()).definedAverageLoadSize + " mLs");
	output("\n\n<b><u>ButtBugPregnancy2</u></b>: " + (new ButtBugPregnancy2()).definedAverageLoadSize + " mLs");
	output("\n* <b>Butt Bug Male:</b> " + getButtBugPregContainer(-1).cumQ() + " mLs");
	
	output("\n\n<b><u>CockvinePregnancy</u></b>: " + (new CockvinePregnancy()).definedAverageLoadSize + " mLs");
	output("\n* <b>Cockvine:</b> " + (new Cockvine()).cumQ() + " mLs");
	
	output("\n\n<b><u>KorgonnePregnancy</u></b>: " + (new KorgonnePregnancyHandler()).definedAverageLoadSize + " mLs");
	output("\n* <b>Korgonne Male:</b> " + (new KorgonneMale()).cumQ() + " mLs");
	
	output("\n\n<b><u>MilodanPregnancy</u></b>: " + (new MilodanPregnancyHandler()).definedAverageLoadSize + " mLs");
	output("\n* <b>Milodan Male:</b> " + (new MilodanMale()).cumQ() + " mLs");
	output("\n* <b>Milodan Male (Group):</b> " + (new MilodanMaleGroup()).cumQ() + " mLs");
	
	output("\n\n<b><u>RenvraEggPregnancy</u></b>: " + (new RenvraEggPregnancy()).definedAverageLoadSize + " mLs");
	output("\n* <b>Renvra:</b> " + chars["RENVRA"].cumQ() + " mLs");
	
	output("\n\n<b><u>RenvraFullPregnancy</u></b>: " + (new RenvraFullPregnancy()).definedAverageLoadSize + " mLs");
	output("\n* <b>Renvra:</b> " + chars["RENVRA"].cumQ() + " mLs");
	
	output("\n\n<b><u>RiyaPregnancy</u></b>: " + (new RiyaPregnancyHandler()).definedAverageLoadSize + " mLs");
	output("\n* <b>Riya:</b> " + getRiyaPregContainer().cumQ() + " mLs");
	
	output("\n\n<b><u>SeraSpawnPregnancy</u></b>: " + (new SeraSpawnPregnancyHandler()).definedAverageLoadSize + " mLs");
	output("\n* <b>Sera:</b> " + chars["SERA"].cumQ() + " mLs");
	
	output("\n\n<b><u>SydianPregnancy</u></b>: " + (new SydianPregnancyHandler()).definedAverageLoadSize + " mLs");
	output("\n* <b>Sydian Male:</b> " + (new SydianMale()).cumQ() + " mLs");
	
	output("\n\n<b><u>ZaaltPregnancy</u></b>: " + (new ZaaltPregnancyHandler()).definedAverageLoadSize + " mLs");
	output("\n* <b>Zaalt:</b> " + (new Zaalt()).cumQ() + " mLs");
	
	output("\n\n<b><u>ZephyrPregnancy</u></b>: " + (new ZephyrPregnancyHandler()).definedAverageLoadSize + " mLs");
	output("\n* <b>Zephyr:</b> " + getZephyrPregContainer().cumQ() + " mLs");
	
	output("\n\n<b><u>ZilPregnancy</u></b>: " + (new ZilPregnancyHandler()).definedAverageLoadSize + " mLs");
	output("\n* <b>Zil Male:</b> " + (new ZilMale()).cumQ() + " mLs");
	output("\n* <b>Zil Male (Pack):</b> " + (new ZilPack()).cumQ() + " mLs");
	output("\n* <b>Zil Hover Fly:</b> " + (new ZilHoverFly()).cumQ() + " mLs");
	output("\n* <b>Zil Tribe:</b> " + (new ZilTribe()).cumQ() + " mLs");
	output("\n* <b>Zil Champion Bow:</b> " + (new ZilChampionBow()).cumQ() + " mLs");
	output("\n* <b>Zil Champion Spear:</b> " + (new ZilChampionSpear()).cumQ() + " mLs");
	
	/*
	
	output("\n\n<b><u></u></b>: " + (new ()).definedAverageLoadSize + " mLs");
	output("\n* <b>:</b> " + (new ()).cumQ() + " mLs");
	*/
	
	output("\n\n");
	
	nurseryComputerMenu(pregAverageLoadSizes);
}

public function nurseryMilkingRoomFunc():Boolean
{
	if(flags["MET_ZEPHYR"] != undefined)
	{
		if (!zephAtNursery()) addDisabledButton(0, "ZephMilking", "Zephyr Milking", "Zephyr isn’t at the nursery to lend a hand.");
		else if (!pc.isLactating()) addDisabledButton(0, "ZephMilking", "Zephyr Milking", "You need to be lactating to milk yourself!");
		else if (!pc.hasVagina()) addDisabledButton(0, "ZephMilking", "Zephyr Milking", "You need a pussy for Zephyr to assist in your endeavours!");
		else if (pc.isPregnant()) addDisabledButton(0, "ZephMilking", "Zephyr Milking", "Zephyr won’t want to be too rough on her pregnant lover...");
		else if (!pc.hasItemByClass(MagicMilker)) addDisabledButton(0, "ZephMilking", "Zephyr Milking", "You need a MagicMilker to hand.");
		else addButton(0, "ZephMilking", milkedByZeph, undefined, "Zephyr Milking", "Take some time to milk yourself and perhaps a little more time with Zephyr too...");
	}

	return false;
}