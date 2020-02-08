/* Ovilium- Xenogen Biotech */

// Changes
public function oviliumEffects():void
{
	clearOutput();
	showBust("");
	showName("\nOVILIUM");
	author("Gardeford");
	
	output("You pull the egg-shaped cork from the baby blue bottle in your hand. The glowing ivory liquid within quivers slightly with the minute twitches of your hand. You try to get a whiff of the contents’ smell, but find that it has almost none. The only thing your nose catches is the mass produced factory smell of the bottle. You look inside one more time before tipping your head back and imbibing the formula. The taste is just as indescribable as the smell. Not good, but not bad.");
	output("\n\n");
	
	// ([if no vag]: pc grows vag)
	if (!pc.hasVagina())
	{
		output("A semi-uncomfortable unzipping feeling momentarily rises in your loins. For a moment you wonder whether ingesting the liquid was a good idea, but the feeling passes. As soon as you’ve recovered your composure you reach between your legs, <b>finding a newly formed");
		if (pc.vaginalVirgin) output(" virgin");
		output(" vagina.</b>");
		
		pc.createVagina();
		processTime(5);
	}
	// (fertility increases, small lust +)
	else
	{
		var selWomb:Array = [];
		var x:int = 0;
		
		for(x = 0; x < pc.vaginas.length; x++)
		{
			if (!pc.isPregnant(x)) selWomb.push(x);
		}
		
		// Create Ovilium Impregnator
		var ppOvilium:PregnancyPlaceholder = new PregnancyPlaceholder();
		ppOvilium.createPerk("Fixed CumQ", 500, 0, 0, 0);
		ppOvilium.impregnationType = "OviliumEggPregnancy";
		ppOvilium.createStatusEffect("Ovilium Effect");
		
		// (If no open wombs(already preg))
		if (selWomb.length <= 0)
		{
			output("A funny fuzzy feeling ripples through your belly,");
			// 75% no effect:
			if (rand(4) != 0) output(" but nothing happens apart from that momentary sensation.");
			// 25% preg speeded by 2 hours:
			else
			{
				var nVal:int = 2 + rand(2);
				
				output(" and you feel a jolt inside. For a moment you worry about your pregnanc");
				if (pc.totalPregnancies() == 1) output("y");
				else output("ies");
				output(", but your codex informs you that you’re suddenly a");
				if (nVal == 2) output(" couple");
				else output(" few");
				output(" hours ahead of schedule.");
				
				preggcelleration(-1 * nVal * 60);
				
				if (rand(2) == 0) oviliumEggBump(ppOvilium, -1);
			}
			processTime(2);
		}
		else
		{
			if (pc.fertilityRaw < 3)
			{
				output("As the alabaster fluid slides down your throat you feel [pc.eachVagina] wetten considerably. You drift off into a daydream as you drink the rest of the egg filling potion. In your fantasy, you’re");
				if (rand(2) == 0) output(" lying in bed with the mate of your dreams, letting them kiss your pregnant belly as the two of you drift off to sleep");
				else output(" sitting at your owner’s feet, heavily pregnant with the eggs they graciously allowed you to carry");
				output(". You shake your head to clear your vision, blushing slightly as you realize what you were thinking.");
				output("\n\n");
				
				pc.fertilityRaw += 0.5;
				pc.changeLust(5);
				processTime(8);
			}
			// ([if pc has vag]: pc becomes preg with eggs -- one womb at a time!)
			output("You feel a pleasurable popping in your abdomen as the glowing drink hits your stomach. Egg after egg seemingly appears from nothing in your womb.");
			if (!pc.isNude()) output(" The upper portion of your outfit distends as y");
			else output(" Y");
			output("our belly expands with the growing pregnancy, blossoming until it’s pleasantly round.");
			
			processTime(5);
			
			// Preggos!
			pc.loadInCunt(ppOvilium, selWomb[rand(selWomb.length)]);
		}
	}
	//clearMenu();
	//addButton(0,"Next",mainGameMenu);
}

// (If the pc gets cummed inside while eggpreg with ovilium, after sex this happens)
public function oviliumEggBump(cumFrom:Creature = null, vagIndex:int = -1):void
{
	if (cumFrom == null) return;
	
	var cumQ:Number = cumFrom.cumQ();
	var changes:int = 0;
	
	if (vagIndex >= 0)
	{
		changes += oviliumEggBumpEggs(vagIndex, cumQ);
	}
	else
	{
		for (var i:int = 0; i < pc.pregnancyData.length; i++)
		{
			changes += oviliumEggBumpEggs(i, cumQ);
		}
	}
	if (changes > 0)
	{
		AddLogEvent("You hear a slick pop and feel your womb expand slightly as one", "passive");
		if (changes != 1) ExtendLogEvent(" or two");
		ExtendLogEvent(" of the eggs inside multipl");
		if (changes == 1) ExtendLogEvent("ies");
		else ExtendLogEvent("y");
		ExtendLogEvent(". You feel a little more full, and rub your egg pregnant stomach contentedly.");
		// if first sex after preg:
		if (pc.statusEffectv2("Ovilium") == 0) ExtendLogEvent(" In addition to the popping noise you hear an odd sucking sound inside you. You figure it’s something to do with the eggs and don’t think too much about it, apart from noticing your womb feeling a bit heavier.");
		
		pc.addStatusValue("Ovilium", 2, 1);
	}
}
private function oviliumEggBumpEggs(iWomb:int = -1, cumQ:Number = 0):int
{
	var changes:int = 0;
	
	if (pc.pregnancyData[iWomb].pregnancyType == "OviliumEggPregnancy")
	{
		var bigEgg:Boolean = (pc.statusEffectv2("Ovilium") == 0);
		var clutchEggs:int = pc.pregnancyData[iWomb].pregnancyQuantity;
		var chances:int = Math.floor(clutchEggs / 6);
		for (var x:int = 0; x < clutchEggs; x++)
		{
			if (changes < 12 && rand(chances) == 0)
			{
				pc.pregnancyData[iWomb].pregnancyQuantity++;
				pc.pregnancyData[iWomb].pregnancyBellyRatingContribution += 0.125;
				pc.bellyRatingMod += 0.125;
				if (bigEgg)
				{
					pc.pregnancyData[iWomb].pregnancyQuantity++;
					pc.pregnancyData[iWomb].pregnancyBellyRatingContribution += 2;
					pc.bellyRatingMod += 2;
					bigEgg = false;
				}
				changes++;
			}
		}
	}
	
	return changes;
}
// Pregnancy multiplier bump.
public function preggcelleration(plusMinutes:int = 0):int
{
	var num:int = 0;
	
	for (var i:int = 0; i < pc.pregnancyData.length; i++)
	{
		if (pc.isPregnant(i))
		{
			// Minute sum/difference
			var pregMinutes:int = pc.pregnancyData[i].pregnancyIncubation + plusMinutes;
			// Get current multiplier
			var pregMulti:Number = pc.pregnancyData[i].pregnancyIncubationMulti;
			// Convert difference into multiplier
			if (pregMulti > 0)
			{
				if (pregMinutes > 0) pregMulti *= (pc.pregnancyData[i].pregnancyIncubation / pregMinutes);
				else pregMulti += 90;
				// Set multiplier
				pc.pregnancyData[i].pregnancyIncubationMulti = pregMulti;
				num++;
			}
		}
	}
	
	return num;
}

// Laying eggs
public function oviliumPregnancyEnds(pregSlot:int, pregEggs:int, totalEggs:int):void
{
	clearOutput();
	showBust("");
	showName("\nEGGS!");
	author("Gardeford");
	
	// (eggs here now)
	output("The next contraction knocks you right off your [pc.feet]. The eggs are coming out now and nothing is going to stop them. You");
	if (pc.hasLegs())
	{
		if (!pc.isCrotchExposed()) output(" pull off your [pc.lowerGarments] as best you can, spreading your [pc.legs] so the eggs can exit more easily");
		else output(" spread your [pc.legs] so the eggs can get out more easily, you wouldn’t want any of them to break");
	}
	else output(" lie down so that your " + (pregSlot == 3 ? "[pc.asshole]" : "[pc.vagina " + pregSlot + "]") + " is at a good angle for laying eggs");
	output(".");
	output("\n\nYou feel the contractions quickening and prepare to push the eggs out. Steeling yourself for the coming eggs, you prepare to push, expecting it to be a bit tough. Contrary to your beliefs, as soon as you push a torrent of eggs slip through your passage. The suddenness of it causes your muscles to tense, [pc.legs] splaying out in the air. Before you can recover your wits, a few more eggs slide out of you and into the pile.");
	
	var bigEgg:Boolean = false;
	
	// (normal)
	if (pc.statusEffectv2("Ovilium") <= 0)
	{
		output("\n\nYou can’t resist any longer as the final eggs leave your body, cumming as the last of them are pushed out. Spasms rock your body, pumping out two or three eggs at a time until your " + (pregSlot == 3 ? "ass" : "womb") + " is empty. You lie on the ground, resting for a moment until you’ve recovered enough to get up. A small probe emblazoned with the Steele logo appears seemingly out of nowhere, picking up all but one of the eggs with a couple beeps. You assume it’s taking the eggs somewhere to deal with, but since these eggs aren’t of the hatching variety you aren’t completely sure.");
	}
	// (if sex had)
	else
	{
		output("\n\nYou feel something big within you line up to come out. For once you actually have to push, and your eyes lose focus as a mammoth version of the previous eggs nudges through your " + (pregSlot == 3 ? "anus" : "opening") + ". You sigh as the giant reaches the halfway point and pops out easily, landing amidst the smaller eggs. A small probe emblazoned with the Steele logo appears seemingly out of nowhere, picking up all but the giant egg with a couple beeps. You assume it’s taking the eggs somewhere to deal with, but since these eggs aren’t of the hatching variety you aren’t completely sure.");
		
		bigEgg = true;
	}
	
	output("\n\nAfter all that, <b>you count having laid " + num2Text(pregEggs) + " eggs");
	if (totalEggs > 0) output(" this clutch");
	output("!</b>");
	
	pc.energy(-30);
	processTime(20 + rand(11));
	
	//oviliumEffectCheck();
	
	// Loot egg!
	output("\n\n");
	oviliumEggReward(bigEgg);
}
public function oviliumNurseryEnds():void
{
	clearOutput();
	showBust("");
	showName("\nEGG!");
	
	// Loot egg!
	var bigEgg:Boolean = (pc.statusEffectv2("Ovilium") > 0);
	oviliumEggReward(bigEgg);
}

// Remove tracking if no more Ovilium.
/*
public function oviliumEffectCheck():void
{
	if (!pc.hasStatusEffect("Ovilium")) return;
	
	for (var i:int = 0; i < pc.pregnancyData.length; i++)
	{
		if (pc.pregnancyData[i].pregnancyType == "OviliumEggPregnancy") return;
	}
	
	pc.removeStatusEffect("Ovilium");
}
*/

// Egg chooser...
private function oviliumEggReward(bigEgg:Boolean = false):void
{
	var eggList:Array = [];
	// Egg items:40% chance normal egg
	// 50% chance of special egg
	if (!bigEgg)
	{
		eggList.push(new SmallEgg());
		eggList.push(new SmallEgg());
		eggList.push(new EggPinkSmall());
		eggList.push(new EggBlueSmall());
		eggList.push(new EggWhiteSmall());
	}
	else
	{
		eggList.push(new LargeEgg());
		eggList.push(new LargeEgg());
		eggList.push(new EggPinkLarge());
		eggList.push(new EggBlueLarge());
		eggList.push(new EggWhiteLarge());
	}
	
	if (eggList.length > 0)
	{
		quickLoot(eggList[rand(eggList.length)]);
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

// Egg item description
public function oviliumEggTooltip(eggSize:String = "none", eggColor:String = "none"):String
{
	var desc:String = "";
	
	if (eggSize == "small") desc = "The " + eggColor + " egg is small enough to fit in your palm. It looks rather inconspicuous and normal.";
	else if (eggSize == "large") desc = "The " + eggColor + " egg is large enough to hold in both hands. It looks like it would make a good, filling meal.";
	else desc = "This is " + indefiniteArticle(eggColor) + " egg.";
	
	switch (eggColor)
	{
		case "pink": desc += "[oviliumEggEffect fluid]"; break;
		case "blue": desc += "[oviliumEggEffect preggcelleration]"; break;
		case "glowing white": desc += "[oviliumEggEffect fertility]"; break;
	}
	
	return desc;
}
public function oviliumEggEffect(effectTF:String = "none"):String
{
	var desc:String = "";
	
	if (effectTF == "none")
	{
		/* Nothing */
	}
	else if (effectTF == "fluid")
	{
		if(flags["OVILIUM_TF_FLUID"] != undefined) desc += "\n\nEating this will most likely change your fluid production.";
	}
	else if (effectTF == "preggcelleration")
	{
		if(flags["OVILIUM_TF_PREGGCELLERATION"] != undefined) desc += "\n\nEating this will most likely change your pregnancy duration.";
	}
	else if (effectTF == "fertility")
	{
		if(flags["OVILIUM_TF_FERTILITY"] != undefined) desc += "\n\nEating this will most likely change your fertility.";
	}
	
	return desc;
}

// Use egg item
public function eatOviliumEgg(eggSize:String = "none", eggColor:String = "none"):void
{
	clearOutput();
	author("Gardeford");
	
	var effectTF:String = "none"
	var nVal:Number = 0;
	
	output("You take one bite of the " + eggColor + " egg in your hands and before you know it the whole thing is gone.");
	if (!inCombat())
	{
		showBust("");
		if (silly) showName("\nYUM!");
		else showName("SNACK\nBREAK");
		
		output(" Its taste is hard to place. It was good, but you can’t for the life of you think of anything to compare it to.");
		
		if (eggColor == "none")
		{
			/* No changes */
		}
		// pink egg: boost pc fluid production, big gives larger increase.
		else if (eggColor == "pink")
		{
			effectTF = "fluid";
			if (eggSize == "small") nVal = 1;
			if (eggSize == "large") nVal = 2;
		}
		// blue egg: accelerate current pregnancy by 2 hours, big delays 4 hours.
		else if (eggColor == "blue")
		{
			effectTF = "preggcelleration";
			if (eggSize == "small") nVal = (-2);
			if (eggSize == "large") nVal = (2);
		}
		// Glowing white egg: increase fertility/virility slightly. big egg bigger increase.
		else if (eggColor == "glowing white")
		{
			effectTF = "fertility";
			if (eggSize == "small") nVal = 0.25;
			if (eggSize == "large") nVal = 0.50;
		}
	}
	// Effects, go!
	oviliumEggTF(effectTF, nVal, eggSize, eggColor);
}

// NPC and "normal" effects
public function npcEatOviliumEgg(target:Creature = null, eggSize:String = "none", eggColor:String = "none"):void
{
	// small egg, restore 10% hp. Big egg, restore 30% hp.
	var healing:int = 5;
	if (eggSize == "small") healing = 10;
	if (eggSize == "large") healing = 30;
	
	if (target.HP() + healing > target.HPMax())
	{
		healing = target.HPMax() - target.HP();
	}
	
	if (target is PlayerCharacter)
	{
		if (healing > 0) output(" You feel better almost immediately! (<b>+" + healing + " HP</b>)");
		else output(" Nothing changes except for the taste in your mouth.");
	}
	else
	{
		if (inCombat()) output("\n\n");
		else clearOutput();
		output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : target.capitalA + target.short) + " eats " + indefiniteArticle(eggSize) + " " + eggColor + " egg");
		if (healing > 0) output(" and instantly regains a little health! (<b>+" + healing + " HP</b>)");
		else output(" but to no effect.");
	}
	target.HP(healing);
}

// Effects:
private function oviliumEggTF(effectTF:String = "none", nVal:Number = 0, eggSize:String = "none", eggColor:String = "none"):void
{
	var changes:int = 0;
	var x:int = 0;
	var num:int = 0;
	var msg:String = "";
	
	// None!
	if (effectTF == "none")
	{
		/* No changes */
	}
	// [if dick](cum+)
	else if (effectTF == "fluid")
	{
		var cumUp:Boolean = false;
		if (pc.hasCock())
		{
			if (pc.cumMultiplierRaw < 100)
			{
				msg += "You feel a churning in your [pc.balls]. Your codex beeps to alert you of a";
				if (nVal <= 1) msg += " minor";
				else msg += "n";
				msg += " increase in potency, a change you can’t wait to test out.";
				
				pc.cumMultiplierRaw += nVal;
				if (pc.cumMultiplierRaw > 100) pc.cumMultiplierRaw = 100;
				cumUp = true;
				
				flags["OVILIUM_TF_FLUID"] = true;
				changes++;
			}
		}
		// [if vag](wetness+)
		if (pc.hasVagina())
		{
			num = 0;
			for(x = 0; x < pc.vaginas.length; x++)
			{
				if (pc.vaginas[x].wetnessRaw < 5)
				{
					pc.vaginas[x].wetnessRaw += nVal;
					if (pc.vaginas[x].wetnessRaw > 5) pc.vaginas[x].wetnessRaw = 5;
					num++;
				}
			}
			if (num > 0)
			{
				if (cumUp) msg += " ";
				msg += "A pleasurable shock jolts your loins, and you feel yourself grow";
				if (nVal <= 1) msg += " slightly";
				else msg += " much";
				msg += " wetter than you were before.";
				
				flags["OVILIUM_TF_FLUID"] = true;
				changes++;
			}
		}
	}
	// (Preg accel)
	else if (effectTF == "preggcelleration")
	{
		num = preggcelleration(nVal * 60);
		
		if (num > 0)
		{
			msg += "A thrilling spasm throbs at your cervix, nearly buckling your legs. Your codex informs you that the pregnanc";
			if (num == 1) msg += "y";
			else msg += "ies";
			msg += " you’ve been expecting ha";
			if (num == 1) msg += "s";
			else msg += "ve";
			msg += " been";
			if (nVal < 0) msg += " expedited";
			else msg += " delayed";
			msg += ".";
			
			flags["OVILIUM_TF_PREGGCELLERATION"] = true;
			changes++;
		}
	}
	// (fertility/virility+)
	else if (effectTF == "fertility")
	{
		if (pc.hasCock() && pc.cumQualityRaw < 10)
		{
			pc.cumQualityRaw += nVal;
			if (pc.cumQualityRaw > 10) pc.cumQualityRaw = 10;
			num++;
		}
		if (pc.hasVagina() && pc.fertilityRaw < 10)
		{
			pc.fertilityRaw += nVal;
			if (pc.fertilityRaw > 10) pc.fertilityRaw = 10;
			num++;
		}
		if (num > 0)
		{
			msg += "Visions of following in your father’s footsteps play through your head as you finish the egg treat. You feel like making children until your lineage is spread throughout the whole frontier.";
			
			flags["OVILIUM_TF_FERTILITY"] = true;
			changes++;
		}
	}
	
	if (changes <= 0)
	{
		npcEatOviliumEgg(pc, eggSize, eggColor);
	}
	else output("\n\n" + msg);
}
