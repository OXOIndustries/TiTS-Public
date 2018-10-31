/*

The Sneezing Tits: an SSTD
By Slab Bulkhead

Overview
This is an SSTD that makes boobs grow. Fenoxo mentioned it in this blog post, and I got inspired.

What it Does
When Steele is affected with Sneezing Tits, there’s a small chance for them to sneeze every time they move on the map. Every time they sneeze, their boobs will go up by at least one cup size. This will continue until the disease goes away, Steele gets the disease cured, or Steele reaches the maximum possible boob size.

*/

// Infection Proc
public function sneezingTitsProcs(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
{
	var msg:String = sneezingTitsText(deltaT, maxEffectLength, doOut, target, effect);
	
	if (msg.length > 0) AddLogEvent(msg, "passive", maxEffectLength);
}

// Infection Text
public function sneezingTitsText(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass, forced:Boolean = false):String
{
	var msg:String = "";
	
	// After combat is over, if Steele has been infected, the following scene will happen:
	if (effect.value4 == 0)
	{
		msg += "You feel a faint tickle at the back of your throat. Did the previous combat encounter get you sick? It might be nothing, but you could always get it checked out.";
		effect.value4 = 1;
	}
	// Reveal and Codex unlock
	else if (effect.storageName == "Undetected Sneezing Tits" && (effect.minutesLeft <= 9360 || effect.value3 > 0))
	{
		effect.storageName = "Sneezing Tits";
		effect.tooltip = ("You have been infected!\n\n<i><b>Caution:</b> Sporadic sneezing may cause spontaneous breast growth.</i>");
		effect.iconShade = 0xFF69B4;
		effect.hidden = false;
		
		msg += "Your Codex beeps, alerting you that <b>you’ve been infected with The Sneezing Tits!</b> While your microsurgeons will be working full time to prevent you from spreading the virus around, sneezing " + (effect.value3 <= 0 ? "may" : "will") + " cause you to gain";
		if (target.hasBreasts()) msg += " extra";
		msg += " breast tissue... Unless you get it treated, of course.";
		
		CodexManager.unlockEntry("Sneezing Tits");
	}
	// Sneeze events
	else
	{
		if (!forced)
		{
			// Adjust chances based on progression of time...
			var chances:int = 50;
			// Effect duration
			if (effect.minutesLeft <= 8640) chances = 45;
			else if (effect.minutesLeft <= 7200) chances = 40;
			else if (effect.minutesLeft <= 5760) chances = 35;
			else if (effect.minutesLeft <= 4320) chances = 30;
			else if (effect.minutesLeft <= 2880) chances = 25;
			else if (effect.minutesLeft <= 1440) chances = 20;
			// Time passed
			if (chances > 40 && deltaT >= 15) chances = 40;
			else if (chances > 30 && deltaT >= 30) chances = 30;
			else if (chances > 20 && deltaT >= 60) chances = 20;
			else if (chances > 10 && deltaT >= 180) chances = 10;
			else if (chances > 5 && deltaT >= 720) chances = 5;
			else if (chances > 2 && deltaT >= 1440) chances = 2;
			
			if (rand(chances) != 0) return "";
		}
		
		switch(effect.value4)
		{
			case 1:
				// Single Sneeze
				// Every time Steele moves on the map, there’s a 1/100 chance that they’ll trigger a sneeze. When Steele sneezes, the following event occurs:
				if (forced || rand(4) != 0)
				{
					msg += "All of a sudden, your nose tickles, and you sneeze. There’s a strange billowing sensation from your chest. You catch your breath and look down at yourself.";
					// (+1 cup size)
					msg += sneezingTitsSneeze(target, effect, 1);
				}
				// Sneeze Build-up
				// Every time Steele moves on the map and doesn’t trigger a regular sneeze, there’s a 1/100 chance they’ll trigger a sneeze-build up. When this happens, the following event occurs:
				else
				{
					msg += "Your nose feels itchy. There’s a little bit of a tingling sensation, and you almost feel like you have to sneeze but not quite. You sniff a few times, but the feeling doesn’t go away.";
					effect.value4 = 2;
				}
				break;
			// The next time Steele moves, there’s a 50/50 chance they’ll sneeze.
			case 2:
				// If they sneeze, the following event occurs:
				if (forced || rand(2) == 0)
				{
					msg += "You lean back and make an <i>“Ah–ah–aaah”</i> noise, then let out a sneeze, not too loud but enough to draw notice. You take a deep breath once you’re sure you’re not going to sneeze again, and realize that your chest feels weightier than before.";
					// (+2 cup sizes)
					msg += sneezingTitsSneeze(target, effect, 2);
				}
				// If Steele doesn’t sneeze, the following event occurs:
				else
				{
					msg += "Your nose is really itching now. You rub at it, and sniff over and over, even cough a few times trying to shake off the feeling. You can tell you need to sneeze, and take a few deep breaths trying to make it happen, to no avail.";
					effect.value4 = 3;
				}
				break;
			// The next time Steele moves, there’s a 50/50 chance they’ll sneeze.
			case 3:
				// If they sneeze, the following event occurs:
				if (forced || rand(2) == 0)
				{
					msg += "The tingling in your nose finally becomes too much, and you sneeze loud enough to startle anyone nearby. You wipe at your eyes, breathing deep. Each breath comes with the realization of a considerably increased weight from your chest.";
					// (+3 cup sizes)
					msg += sneezingTitsSneeze(target, effect, 3);
				}
				// If Steele doesn’t sneeze, the following event occurs:
				else
				{
					msg += "Your eyes are watering, and your nose feels like it’s rebelling against the rest of your body. What is going on with your sinuses? You need to sneeze, but no matter what you do, it’s just not happening.";
					effect.value4 = 4;
				}
				break;
			// The next time Steele moves, they will sneeze. The following event occurs:
			case 4:
				msg += "The sneeze hits you all at once and harder than you’d thought possible. Your eyes squeeze shut as you bend yourself nearly in half at the sudden and violent exhalation, the sound so loud it echoes all around you. As you take a deep breath and attempt to recover, you feel a new and significant heaviness from your chest.";
				// (+4 cup sizes)
				msg += sneezingTitsSneeze(target, effect, 4);
				// Reset so it doesn’t become repetitive?
				effect.value4 = 1;
				break;
		}
	}
	
	return msg;
}

// Grow function
public function sneezingTitsSneeze(target:Creature, effect:StorageClass = null, sneezes:int = 0):String
{
	var msg:String = "";
	
	var biggestTitRow:Number = target.biggestTitRow();
	var oldBoobRating:Number = target.breastRows[biggestTitRow].breastRating();
	
	var breasts:String = target.breastDescript(biggestTitRow);
	
	for(var bIdx:int = 0; bIdx < target.breastRows.length; bIdx++)
	{
		if (target.breastRows[bIdx].breastRatingRaw <= 0) target.breastRows[bIdx].breastRatingRaw = sneezes;
		else target.breastRows[bIdx].breastRatingRaw += sneezes;
	}
	
	var newBoobRating:Number = target.breastRows[biggestTitRow].breastRating();
	if (target is PlayerCharacter)
	{
		switch(sneezes)
		{
			case 1:
				msg += "\n\n";
				// If growing from flat:
				if (oldBoobRating <= 0) msg += ParseText("You’re not sure how it happened, but that sneeze made you grow breasts. Where you once had a flat chest, you now have a pair of [pc.breasts], slightly tender from the growth. It doesn’t seem like much of a difference, but <b>you are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>");
				// If final size is from B-cup to D-cup:
				else if (newBoobRating < 7) msg += "Your " + breasts + " have increased in size, adding a small but visible amount of growth. You won’t need to buy new clothes anytime soon, but you’re definitely larger. <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>";
				// If final size is from E-cup to H-cup:
				else if (newBoobRating < 24) msg += "Your " + breasts + " have grown, and your chest is large enough to draw notice. You’re not in ultraporn-star territory, but your new growth has pushed you past what’s considered average to most people. <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>";
				// If final size is I-cup or higher:
				else if (newBoobRating < 199) msg += ParseText("Your " + breasts + " have grown, and when you look down, it’s hard to see past them. " + (!target.isChestExposed() ? "You adjust your [pc.upperGarments] to account for your new size, doing your best to give yourself more room." : "Your chest bounces as you walk, your [pc.breasts] free for all to see.") + " What’s one more cup size when you’re already this big? <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>");
				// If final size maxes out boob size:
				else msg += "Your " + breasts + ", already " + ((effect != null && effect.value3 > 0) ? "grown nearly beyond belief, swell once more" : "a size beyond belief, swell bigger") + ", and a shudder goes through you. Something about that seemed final, as though your body knows it can grow no more. <b>You have " + target.breastCup(biggestTitRow) + " breasts.</b> Your cold feels like it’s cleared up for now.";
				break;
			case 2:
				msg += "\n\n";
				// If growing from flat:
				if (oldBoobRating <= 0) msg += ParseText("You’re not sure how it happened, but that sneeze made you grow breasts. Where you once had a flat chest, you now have a pair of [pc.breasts], slightly tender from the growth. " + (!target.isChestExposed() ? "You adjust your [pc.upperGarments], shifting around to account for the sudden growth in size." : "You shift yourself this way and that, getting a good look at your new attributes.") + " <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>");
				// If final size is from B-cup to D-cup:
				else if (newBoobRating < 7) msg += "Your " + breasts + " have increased in size, adding a visible and considerable amount of growth. You won’t need to buy new clothes anytime soon, but you’re definitely larger. <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>";
				// If final size is from E-cup to H-cup:
				else if (newBoobRating < 24) msg += "Your " + breasts + " have grown, and your chest is large enough to draw notice. You’re not in ultraporn-star territory, but your new growth has pushed you past what’s considered average to most people. <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>";
				// If final size is I-cup or higher:
				else if (newBoobRating < 199) msg += ParseText("Your " + breasts + " have grown, and when you look down, it’s hard to see past them. " + (!target.isChestExposed() ? "You adjust your [pc.upperGarments] to account for your new size, doing your best to give yourself more room." : "Your chest bounces as you walk, your [pc.breasts] free for all to see.") + " What’s another cup size or two when you’re already this big? <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>");
				// If final size maxes out boob size:
				else msg += "Your " + breasts + ", already " + ((effect != null && effect.value3 > 0) ? "grown nearly beyond belief, swell once more" : "a size beyond belief, swell bigger") + ", and a shudder goes through you. Something about that seemed final, as though your body knows it can grow no more. <b>You have " + target.breastCup(biggestTitRow) + " breasts.</b> Your cold feels like it’s cleared up for now.";
				break;
			case 3:
				msg += "\n\n";
				// If growing from flat:
				if (oldBoobRating <= 0) msg += ParseText("You’re not sure how it happened, but that sneeze made you grow breasts. Where you once had a flat chest, you now have a pair of [pc.breasts], slightly tender from the growth. " + (!target.isChestExposed() ? "You adjust your [pc.upperGarments], shifting around to account for the sudden and significant growth in size." : "You shift yourself this way and that, getting a good look at your new attributes and adjusting your stride for the sudden increase in weight.") + " <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>");
				// If final size is from B-cup to D-cup:
				else if (newBoobRating < 7) msg += "Your " + breasts + " have increased in size, going from small to large in a single burst of growth. You won’t need to buy new clothes anytime soon, but you’re definitely much larger. <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>";
				// If final size is from E-cup to H-cup:
				else if (newBoobRating < 24) msg += "Your " + breasts + " have grown, and that sudden burst made your chest large enough to draw notice. You’re not in ultraporn-star territory, but your new growth has pushed you past what’s considered average to most people. <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>";
				// If final size is I-cup or higher:
				else if (newBoobRating < 199) msg += ParseText("Your " + breasts + " have grown, and when you look down, it’s hard to see past them. " + (!target.isChestExposed() ? "You adjust your [pc.upperGarments] to account for your new size, doing your best to give yourself more room." : "Your chest bounces as you walk, your [pc.breasts] free for all to see.") + " What’s a growth spurt like that when you’re already this big? <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>");
				// If final size maxes out boob size:
				else msg += "Your " + breasts + ", already " + ((effect != null && effect.value3 > 0) ? "grown nearly beyond belief, swell once more" : "a size beyond belief, swell bigger") + ", and a shudder goes through you. Something about that seemed final, as though your body knows it can grow no more. <b>You have " + target.breastCup(biggestTitRow) + " breasts.</b> Your cold feels like it’s cleared up for now.";
				break;
			case 4:
				msg += "\n\n";
				// If growing from flat:
				if (oldBoobRating <= 0) msg += ParseText("You’re not sure how it happened, but that sneeze made you grow breasts. Where you once had a flat chest, you now have a pair of [pc.breasts], slightly tender from the growth. " + (!target.isChestExposed() ? "You adjust your [pc.upperGarments], stretching them a little to get yourself comfortable again after the sudden and considerable growth in size." : "You shift yourself this way and that, getting a good look at your new attributes and adjusting your stride for the sudden and considerable increase in weight.") + " <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>");
				// If final size is from E-cup to H-cup:
				else if (newBoobRating < 24) msg += "Your " + breasts + " have grown, and that sudden burst made your chest large enough to draw notice. You’re not in ultraporn-star territory, but your new growth has pushed you past what’s considered average to most people. <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>";
				// If final size is I-cup or higher:
				else if (newBoobRating < 199) msg += ParseText("Your " + breasts + " have grown, and when you look down, it’s hard to see past them. " + (!target.isChestExposed() ? "You adjust your [pc.upperGarments] to account for your new size, doing your best to give yourself more room." : "Your chest bounces as you walk, your [pc.breasts] free for all to see.") + " What’s a growth spurt, even one as big as that, when you’re already this big? <b>You are now " + indefiniteArticle(target.breastCup(biggestTitRow)) + ".</b>");
				// If final size maxes out boob size:
				else msg += "Your " + breasts + ", already " + ((effect != null && effect.value3 > 0) ? "grown nearly beyond belief, swell once more" : "a size beyond belief, swell bigger") + ", and a shudder goes through you. Something about that seemed final, as though your body knows it can grow no more. <b>You have " + target.breastCup(biggestTitRow) + " breasts.</b> Your cold feels like it’s cleared up for now.";
				break;
		}
	}
	if (effect != null)
	{
		// Original tit size
		if (effect.value3 == 0) effect.value1 = oldBoobRating;
		// New tit size
		effect.value2 = newBoobRating;
		// Total Sneezes
		effect.value3 += sneezes;
		// End effect if boob too big!
		if (newBoobRating >= 199) effect.value4 = -1;
	}
	
	return msg;
}

// How to Lose it
// The disease will go away on its own, like a cold, after 4-7 days. When its duration is over, Steele will automatically have one sneeze for a single cup size of growth, with the following line added at the end:
public function sneezingTitsFinish(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
{
	var msg:String = sneezingTitsText(deltaT, maxEffectLength, doOut, target, effect, true);
	
	if (msg != "") msg += "\n\n";
	msg += "Your head feels clearer now. <b>It looks like your cold went away on its own";
	if ((effect.value2 - effect.value1) > 0) msg += ", though the growth it caused remains";
	msg += ".</b>";
	
	if (msg.length > 0) AddLogEvent(msg, "passive", maxEffectLength);
	
	pc.removeStatusEffect("Undetected Sneezing Tits", true);
	pc.removeStatusEffect("Sneezing Tits", true);
}
// Also, Steele can have the disease cured at any V-KO unit or at Vi on Myrellion.

// How to Get it
// The disease is spread by hostile NPCs, through combat encounters and post-combat sex. Any humanoid creature that’s capable of having boobs should be able to carry and spread the Sneezing Tits. This should be limited to NPCs without names, so there won’t be any changes to recurring characters’ appearances.
// NPCs who can get the Sneezing Tits should have about a 1 in 20 chance of being infected, so it’s not enough for it to happen all the time, but not so rare that people who want to get the disease have to hope to get really lucky.
// Just being in combat with an infected NPC will not infect Steele. This is so players who don’t want the disease can avoid it. If Steele has sex with the NPC after combat, there’s a 50-75% chance of getting the disease, possibly modified by the type of sex. If Steele selects [Wait] twice in battle, this will lead to the NPC sneezing on them, which has a 100% chance of Steele getting the infection. This will only occur once per combat.

public function sneezingTitsGetHostile(hostiles:Array):Creature
{
	if (hostiles.length == 1)
	{
		if ((hostiles[0] as Creature).hasStatusEffect("Undetected Sneezing Tits")) return hostiles[0];
	}
	else
	{
		var infected:Array = [];
		
		for(var i:int = 0; i < hostiles.length; i++)
		{
			if ((hostiles[i] as Creature).hasStatusEffect("Undetected Sneezing Tits")) infected.push(hostiles[i]);
		}
		
		if (infected.length > 0) return infected[rand(infected.length)];
	}
	
	return null;
}
// Getting tit-sick
public function sneezingTitsCombatTurnBonus(target:Creature, roundNum:int = 1):void
{
	if (target == null) return;
	
	// When Steele encounters an NPC with the Sneezing Tits, the following line will be added to their description in the first combat screen:
	if (roundNum == 1)
	{
		if (!target.isPlural) output("\n\n" + StringUtil.capitalize(target.getCombatName(), false) + " is making a faint sniffling sound and rubs at " + target.getCombatPronoun("pa") + " nose as " + target.getCombatPronoun("s") + " watches you. It looks like " + target.getCombatPronoun("s") + " has some kind of cold.");
		else output("\n\n" + StringUtil.capitalize(target.getCombatName(), false) + " are making faint sniffling sounds and rub at their noses as they watch you. It looks like they have some kind of cold.");
	}
	// During the battle, one of the following lines will be added at the end of the enemy’s action every other round:
	else
	{
		if (!target.isPlural) output(RandomInCollection([
			"\n\n" + StringUtil.capitalize(target.getCombatName(), false) + " sniffles again. " + StringUtil.capitalize(target.getCombatPronoun("s")) + " definitely sounds like " + target.getCombatPronoun("s") + " has a cold.",
			"\n\n" + StringUtil.capitalize(target.getCombatName(), false) + "’s breathing hitches for a second, then they take a deep breath. It seems like " + target.getCombatPronoun("s") + "’s holding back a sneeze.",
			"\n\n" + StringUtil.capitalize(target.getCombatName(), false) + " rubs quickly at " + target.getCombatPronoun("pa") + " nose, and sniffs again."
		]));
		else output(RandomInCollection([
			"\n\n" + StringUtil.capitalize(target.getCombatName(), false) + " sniffle again. They definitely sounds like they have a cold.",
			"\n\n" + StringUtil.capitalize(target.getCombatName(), false) + "’s breathing hitches for a second, then they take a deep breath. It seems like they’re holding back a sneeze.",
			"\n\n" + StringUtil.capitalize(target.getCombatName(), false) + " rub quickly at their noses, and sniff again."
		]));
	}
}
// If Steele selects the [Wait] action twice in battle, the following scene will happen after the second round of waiting:
public function sneezingTitsCombatWaitBonus(hostiles:Array):void
{
	if (pc.hasSSTD("Sneezing Tits", true) || pc.statusEffectv1("Sneezing Tits Infection") >= 2) return;
	
	var target:Creature = sneezingTitsGetHostile(hostiles);
	if (target == null) return;
	
	pc.createStatusEffect("Sneezing Tits Infection", 0, 0, 0, 0, true, "", "", true, 0);
	pc.addStatusValue("Sneezing Tits Infection", 1, 1);
	
	if (pc.statusEffectv1("Sneezing Tits Infection") >= 2)
	{
		if (!target.isPlural) output("\n\n" + StringUtil.capitalize(target.getCombatName(), false) + " seems to realize you’re not attacking " + target.getCombatPronoun("o") + ", and looks relieved for a moment before letting out a huge sneeze. " + StringUtil.capitalize(target.getCombatPronoun("s")) + " is quickly ready to fight again, but for a moment it looked like " + target.getCombatPronoun("pa") + " chest grew larger. Was that just your imagination?");
		else output("\n\n" + StringUtil.capitalize(target.getCombatName(), false) + " seem to realize you’re not attacking them, and look relieved for a moment before letting out huge sneezes. They are quickly ready to fight again, but for a moment it looked like their chests grew larger. Was that just your imagination?");
		
		sneezingTitsSneeze(target, null, (1 + rand(4)));
		
		pc.createStatusEffect("Undetected Sneezing Tits", 0, 0, 0, 0, true, "Icon_Boob_Torso", "Hidden Sneezing Tits infection!", false, 10080, 0xFF69B4);
	}
}

