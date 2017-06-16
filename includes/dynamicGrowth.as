/* Dynamic growth/weight systems for immobilzation! */

public function removeImmobilized(deltaT:uint = 0):void
{
	AddLogEvent("<b>You’re no longer immobilized by your out-sized equipment!</b>", "good", deltaT);
	pc.removeStatusEffect("Endowment Immobilized");
}

// 4 levels, each to match the original ball growth stuff:
// [0] Egregious, [1] Ludicrous, [2] Overwhelming, [3] Immobilized!
// Length/Size Ratios: (for immobilization comparisons, average 5 ft person) Ex. - 5' person with M-cup for level 1 is [40/60] at position 0.
private var lvlRatioBalls:Array = [(9/60), (15/60), (25/60), (40/60)];
private var lvlRatioPenis:Array = [(9999/60), (9999/60), (9999/60), (9999/60)];
private var lvlRatioClits:Array = [(9999/60), (9999/60), (9999/60), (9999/60)];
private var lvlRatioBoobs:Array = [(9999/60), (9999/60), (9999/60), (9999/60)];
private var lvlRatioBelly:Array = [(9999/60), (9999/60), (9999/60), (9999/60)];
private var lvlRatioButts:Array = [(9999/60), (9999/60), (9999/60), (9999/60)];
// Threshold percentages for each level:
private var percentBalls:Array = [10, 25, 50, 100];
private var percentPenis:Array = [25, 50, 75, 100];
private var percentClits:Array = [25, 50, 75, 100];
private var percentBoobs:Array = [25, 50, 75, 100];
private var percentBelly:Array = [25, 50, 75, 100];
private var percentButts:Array = [25, 50, 75, 100];


/* General framework stuff */

public function immobilizedUpdate(count:Boolean = false, deltaT:uint = 0):Number
{
	if(!pc.hasStatusEffect("Endowment Immobilized")) return 0;
	
	var bodyPart:Array = [];
	
	if(pc.balls > 0 && pc.weightQ("testicle") >= percentBalls[3] && pc.heightRatio("testicle") >= lvlRatioBalls[3]) bodyPart.push("balls");
	else if(pc.hasCock() && pc.weightQ("penis") >= percentPenis[3] && pc.heightRatio("penis") >= lvlRatioPenis[3]) bodyPart.push("cock");
	else if(pc.hasVagina() && pc.weightQ("clitoris") >= percentClits[3] && pc.heightRatio("clitoris") >= lvlRatioClits[3]) bodyPart.push("clit");
	else if(pc.hasBreasts() && pc.weightQ("breast") >= percentBoobs[3] && pc.heightRatio("breast") >= lvlRatioBoobs[3]) bodyPart.push("boobs");
	else if(pc.weightQ("belly") >= percentBelly[3] && pc.heightRatio("belly") >= lvlRatioBelly[3]) bodyPart.push("belly");
	else if(pc.weightQ("butt") >= percentButts[3] && pc.heightRatio("butt") >= lvlRatioButts[3]) bodyPart.push("butt");
	
	if(!count)
	{
		var msg:String = "";
		var bodyText: String = "";
		var partList:Array = [];
		var immobileParts:int = (bodyPart.length);
		
		// Hoverboard exception!
		if(pc.hasItemByClass(Hoverboard)) immobileParts = 0;
		// Underwear exceptions!
		if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV))
		{
			if(InCollection("balls", bodyPart)) immobileParts--;
			if(InCollection("penis", bodyPart)) immobileParts--;
			if(InCollection("clitoris", bodyPart)) immobileParts--;
		}
		if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) || pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV))
		{
			if(InCollection("breast", bodyPart)) immobileParts--;
		}
		
		// Support exceptions!
		if(immobileParts <= 0)
		{
			AddLogEvent("Your", "passive", deltaT);
			if(bodyPart.length > 0)
			{
				if(InCollection("balls", bodyPart))
				{
					if(pc.balls == 1) partList.push("gigantic gonad");
					else partList.push("gigantic gonads");
				}
				if(InCollection("penis", bodyPart))
				{
					if(pc.cockTotal() == 1) partList.push("prodigious penis");
					else partList.push("prodigious penises");
				}
				if(InCollection("clit", bodyPart))
				{
					if(pc.totalClits() == 1) partList.push("colossal clit");
					else partList.push("colossal clits");
				}
				if(InCollection("boobs", bodyPart)) partList.push("titanic tits");
				if(InCollection("belly", bodyPart)) partList.push("bloated belly");
				if(InCollection("butt", bodyPart)) partList.push("epic ass cheeks");
				
				if (partList.length == 1) bodyText += partList[0];
				else
				{
					for (var x: int = 0; x < partList.length; x++)
					{
						bodyText += partList[x];
						
						if(partList.length == 2 && x == 0)
						{
							bodyText += " and ";
						}
						else if(x < partList.length - 2)
						{
							bodyText += ", ";
						}
						else if(x < partList.length - 1)
						{
							bodyText += ", and ";
						}
					}
				}
				msg += " " + bodyText;
			}
			else msg += " enormous body parts";
			msg += " make";
			if(InCollection(bodyText, "gigantic gonad", "bloated belly")) msg += "s";
			msg += " it impossible for you to move at all, you luckily have a remedy for that...";
			if(pc.hasItemByClass(Hoverboard))
			{
				msg += " Pulling out your pink hoverboard, you carefully guide it under your";
				if(bodyPart.length == 1)
				{
					if(bodyPart[0] == "balls") msg += ParseText(" [pc.sack]");
					else if(bodyPart[0] == "boobs") msg += ParseText(" [pc.chest]");
					else if(bodyPart[0] == "belly") msg += ParseText(" [pc.belly]");
					else if(bodyPart[0] == "butt") msg += ParseText(" [pc.butt]");
					else msg += " body";
				}
				else msg += " body";
				msg += ", relishing in the friction that’s cause by rubbing";
				if(bodyPart.length == 1 && bodyPart[0] == "boobs") msg += " them";
				else msg += " it";
				msg += " against the toy’s surface. With a few audible struggles, the hoverboard does its job and lifts your immobilizing weight off the ground!";
			}
			else if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) || pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV))
			{
				msg += " Activating the anti-gravity switches on your" + (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) ? " outfit" : " undergarments") + ", you quickly feel the immobilizing weight being lifted off the ground!";
			}
			msg += " Now you can travel with ease... more or less.";
			
			if(msg.length > 0) ExtendLogEvent(msg);
			
			removeImmobilized(deltaT);
			pc.lust(5 * bodyPart.length);
		}
	}
	
	return bodyPart.length;
}

public function bodyPartUpdates(partName:String = "none", deltaT:uint = 0):void
{
	var weightQ:Number = pc.weightQ(partName);
	var heightQ:Number = pc.heightRatio(partName);
	
	// Exceptions
	if(pc.isGoo()) { /* Goos are immune to immobilization? */ }
	else if(InCollection(partName, ["testicle", "penis", "clitoris"]) && (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV))) { /* Anti-grav underwear lifts crotch stuff. */ }
	else if(InCollection(partName, ["breast"]) && (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) || pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV))) { /* Anti-grav tops lifts chest stuff. */ }
	// Weigh parts and add effects where necessary
	else
	{
		if(partName == "testicle" && pc.balls > 0)
		{
			//Hit basketball size >= 9
			if(weightQ >= percentBalls[0] && heightQ >= lvlRatioBalls[0] && !pc.hasStatusEffect("Egregiously Endowed"))
			{
				AddLogEvent(ParseText("Ugh, you could really use a chance to offload some [pc.cumNoun]. You"), "passive", deltaT);
				if(pc.ballDiameter() >= 9 && pc.ballDiameter() < 12)
				{
					if(pc.balls == 1) ExtendLogEvent("r testicle has reached the size of a basketball and shows");
					else ExtendLogEvent("r balls have reached the size of basketballs and show");
				}
				else
				{
					if(pc.balls == 1) ExtendLogEvent(" have " + pc.ballsDescript(true, true) + " and it shows");
					else ExtendLogEvent(" have " + pc.ballsDescript(false, true) + " and they show");
				}
				ExtendLogEvent(" no signs of stopping. The squishy, sensitive mass will definitely slow your movements.");
				
				//Status - Egregiously Endowed - Movement between rooms takes twice as long, and fleeing from combat is more difficult.
				pc.createStatusEffect("Egregiously Endowed", 0,0,0,0,false,"Icon_Poison", "Movement between rooms takes twice as long, and fleeing from combat is more difficult.", false, 0);
				pc.lust(5);
			}
			//Hit beachball size >= 15
			if(weightQ >= percentBalls[1] && heightQ >= lvlRatioBalls[1] && !pc.hasStatusEffect("Ludicrously Endowed"))
			{
				AddLogEvent(ParseText("Every movement is accompanied by a symphony of sensation from your swollen nutsack, so engorged with [pc.cumNoun] that it wobbles from its own internal weight. You have to stop from time to time just to keep from being overwhelmed by your own liquid arousal."), "passive", deltaT);
				
				pc.createStatusEffect("Ludicrously Endowed", 0,0,0,0,false,"Icon_Poison", "The shifting masses of your over-sized endowments cause you to gain fifty percent more lust over time.", false, 0);
				pc.lust(5);
			}
			//Hit barrel size
			if(weightQ >= percentBalls[2] && heightQ >= lvlRatioBalls[2] && !pc.hasStatusEffect("Overwhelmingly Endowed"))
			{
				AddLogEvent("Whoah, this is awkward. Your", "passive", deltaT);
				if(pc.balls == 1) ExtendLogEvent(" testicle is");
				else ExtendLogEvent(" nuts are");
				if(pc.ballDiameter() >= 25 && pc.ballDiameter() < 40) ExtendLogEvent(" practically barrel-sized");
				else ExtendLogEvent(" utterly massive");
				ExtendLogEvent("! If you aren’t careful,");
				if(pc.balls == 1) ExtendLogEvent(" it");
				else ExtendLogEvent(" they");
				ExtendLogEvent(" drag softly on the ground. Grass is no longer scenery - it’s hundreds of slender tongues tickling your nut");
				if(pc.balls != 1) ExtendLogEvent("s");
				ExtendLogEvent(". Mud is an erotic massage. Even sand feels kind of good against your thickened sack, like a vigorous massage.");
				
				pc.createStatusEffect("Overwhelmingly Endowed", 0,0,0,0,false,"Icon_Poison", "The shifting masses of your over-sized endowments cause you to gain twice as much lust over time.", false, 0);
				pc.lust(5);
			}
			//hit person size
			if(weightQ >= percentBalls[3] && heightQ >= lvlRatioBalls[3] && !pc.hasStatusEffect("Endowment Immobilized") && !pc.hasItemByClass(Hoverboard))
			{
				AddLogEvent("You strain as hard as you can, but there’s just no helping it. You’re immobilized. Your", "passive", deltaT);
				if(pc.balls == 1) ExtendLogEvent(" testicle is");
				else ExtendLogEvent(" balls are");
				ExtendLogEvent(" just too swollen to allow you to move anywhere. The bulk of your body weight is right there in your");
				if(pc.balls == 1) ExtendLogEvent(" sack");
				else ExtendLogEvent(" testes");
				ExtendLogEvent(", and there’s nothing you can do about it.");
				if(canShrinkNuts()) ExtendLogEvent(".. well, almost nothing. A nice, long orgasm ought to fix this!");
				else 
				{
					if(eventQueue.indexOf(bigBallBadEnd) == -1) eventQueue.push(bigBallBadEnd);
					if(pc.hasPerk("'Nuki Nuts")) ExtendLogEvent(" If a quick fap wasn’t illegal here, this would be far simpler. Too bad.");
				}
				pc.createStatusEffect("Endowment Immobilized", 0,0,0,0,false,"Icon_Poison", "Your endowments prevent you from moving.", false, 0);
				pc.lust(5);
			}
		}
		else if(partName == "penis")
		{
			/* 9999 */
		}
		else if(partName == "clitoris")
		{
			/* 9999 */
		}
		else if(partName == "breast")
		{
			/* 9999 */
		}
		else if(partName == "belly")
		{
			/* 9999 */
		}
		else if(partName == "butt")
		{
			/* 9999 */
		}
	}
	
	bodyPartCleanup(partName, deltaT);
}

public function bodyPartCleanup(partName:String = "none", deltaT:uint = 0):void
{
	if(immobilizedUpdate(true) >= 1) return;
	
	var weightQ:Number = pc.weightQ(partName);
	var heightQ:Number = pc.heightRatio(partName);
	var lvlRatio:Array = [1, 1, 1, 1];
	var perRatio:Array = [0, 0, 0, 0];
	var altCheck:Boolean = false;
	
	switch (partName)
	{
		case "testicle":
			altCheck = (pc.balls <= 0 || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV));
			lvlRatio = lvlRatioBalls;
			perRatio = percentBalls;
			break;
		case "penis":
			altCheck = (!pc.hasCock() || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV));
			lvlRatio = lvlRatioPenis;
			perRatio = percentPenis;
			break;
		case "clitoris":
			altCheck = (!pc.hasVagina() || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV));
			lvlRatio = lvlRatioClits;
			perRatio = percentClits;
			break;
		case "breast":
			altCheck = (!pc.hasBreasts() || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) || pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV));
			lvlRatio = lvlRatioBoobs;
			perRatio = percentBoobs;
			break;
		case "belly":
			altCheck = (pc.bellyRating() <= 0);
			lvlRatio = lvlRatioBelly;
			perRatio = percentBelly;
			break;
		case "butt":
			altCheck = (pc.buttRating() <= 0);
			lvlRatio = lvlRatioButts;
			perRatio = percentButts;
			break;
	}
	
	if(pc.isGoo()) altCheck = true;
	
	if ((altCheck || weightQ < perRatio[3] || heightQ < lvlRatio[3]) && pc.hasStatusEffect("Endowment Immobilized")) 
	{
		removeImmobilized(deltaT);
	}
	if ((altCheck || weightQ < perRatio[2] || heightQ < lvlRatio[2]) && pc.hasStatusEffect("Overwhelmingly Endowed"))
	{
		pc.removeStatusEffect("Overwhelmingly Endowed");
	}
	if ((altCheck || weightQ < perRatio[1] || heightQ < lvlRatio[1]) && pc.hasStatusEffect("Ludicrously Endowed"))
	{
		pc.removeStatusEffect("Ludicrously Endowed");
	}
	if ((altCheck || weightQ < perRatio[0] || heightQ < lvlRatio[0]) && pc.hasStatusEffect("Egregiously Endowed"))
	{
		pc.removeStatusEffect("Egregiously Endowed");
	}
}


/* Nuts stuff! */

public function nutSwellUpdates(deltaT:uint = 0):void
{
	bodyPartUpdates("testicle", deltaT);
	
	// Special underwear changes!
	if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV))
	{
		var bigEndowments:Boolean = ((pc.balls > 0 && pc.ballSizeRaw >= 15) || (pc.cocks.length > 0 && pc.biggestCockLength() >= 15) || (pc.totalClits() > 0 && pc.clitLength >= 15));
		if(bigEndowments && pc.lowerUndergarment.sexiness <= 3)
		{
			AddLogEvent(ParseText("You feel a tightening around your groin, the hardlight jock bulging and accentuating the vast bigness of your endowment housed within... <b>Your underwear looks a little sexier now!</b>"), "passive", deltaT);
			pc.createStatusEffect("Jock Sexiness");
			pc.lowerUndergarment.onEquip(pc);
			pc.removeStatusEffect("Jock Sexiness");
		}
		else if(!bigEndowments && pc.lowerUndergarment.sexiness > 3)
		{
			AddLogEvent(ParseText("No longer bulging it to its limits, the hardlight jock relaxes around your groin, giving you some much needed space to breath--however, due to that, <b>it seems to have lost a little bit of its sexual appeal</b>."), "passive", deltaT);
			pc.lowerUndergarment.onEquip(pc);
		}
	}
}

public function nutStatusCleanup():void
{
	bodyPartCleanup("testicle");
}

public function canShrinkNuts():Boolean
{
	//Can fap it away!
	if(pc.perkv1("'Nuki Nuts") > 0 && pc.canMasturbate())
	{
		//NO FAPS!
		if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP)) return false;
		if(rooms[currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL)) return false;
		return true;
	}
	return false;
}

public function bigBallBadEnd():void
{
	clearOutput();
	author("Fenoxo");
	//Dangerous area, can’t unswell:
	if(rooms[currentLocation].hasFlag(GLOBAL.HAZARD))
	{
		output("It isn’t long before the natives of this place take you as an amusement - a live-in toy whose virility is the show-piece of an alien exhibit. You never do manage to get your dad’s fortune, but hey, at least you get to live in relative comfort and have all the orgasms your body can handle.");
		
		days += 40 + rand(6);
		hours = rand(24);
		processTime(rand(60));
		
		for(var i:int = 0; i < 12; i++)
		{
			pc.orgasm();
		}
		
		badEnd();
	}
	//Not a dangerous area:
	else 
	{
		output("Eventually, you manage to get someone to pick you up and take you in for treatment. It isn’t cheap either. ");
		if(pc.credits >= 10000)
		{
			pc.credits -= 10000;
			output("Your finances are ");
			if(pc.credits < 1000) output("completely ");
			output("drained by your own libidinous foolishness, but at least you can move around normally again!");
		}
		else
		{
			pc.credits = 0;
			output("Your finances aren’t capable of footing the bill, but at least the medical experimentation that pays for it all isn’t too bad.");
			if(pc.biggestTitSize() >= 1 && rand(2) == 0 && pc.breastRows[0].breasts < 3) 
			{
				output(" A third breast is a small price to pay, after all.");
				pc.breastRows[0].breasts = 3;
			}
			else if(pc.balls < 3) 
			{
				output(" A trio of smaller nuts is a small price to pay, after all.");
				pc.balls = 3;
			}
		}
		pc.ballSizeRaw = 30;
		currentLocation = "SHIP INTERIOR";
		generateMap();
		processTime(1382);
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

/* Boobs stuff! */

public function honeyPotBump(cumShot:Boolean = false, totalDays:int = 0):void
{
	var msg:String = "";
	var baseDShift:uint = (totalDays == 0 ? 0 : GetGameTimestamp() % 1440);
	
	totalDays = 1;
	
	for (var i:int = 0; i < totalDays; i++)
	{			
		if(pc.thickness >= 30)
		{
			pc.thickness -= 10;
			var boobDiff:Number = 10;
			if(pc.thickness >= 60)
			{
				boobDiff += 10;
				pc.thickness -= 10;
			}
			boobDiff /= 10;
			
			AddLogEvent(ParseText("Your body tightens as the honeypot gene goes to work, diverting your excess bodymass into your [pc.chest], building you bigger and fuller of [pc.milkNoun]."), "passive", baseDShift + (i * 4320));
			
			for(var bb:int = 0; bb < pc.bRows(); bb++)
			{
				pc.breastRows[bb].breastRatingHoneypotMod += boobDiff;
			}
			if(pc.milkFullness < 100) pc.milkFullness = 100;
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod == 0)
		{
			AddLogEvent(ParseText("Your [pc.chest] feel"), "passive", baseDShift + (i * 4320));
			if(!pc.hasBreasts()) ExtendLogEvent("s");
			ExtendLogEvent(" bigger than normal, swollen ");
			if(cumShot) ExtendLogEvent("from all the oral calories you’ve taken in.");
			else ExtendLogEvent("with the spare calories your honeypot gene has siphoned off of your meals.");
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod < 10 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 10)
		{
			AddLogEvent(ParseText(" Your [pc.chest] practically glow"), "passive", baseDShift + (i * 4320));
			if(!pc.hasBreasts()) ExtendLogEvent("s");
			ExtendLogEvent(" with the ever-expanding fruit of your honeypot gene. You wonder just how big you’ll get.");
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod < 20 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 20)
		{
			AddLogEvent(ParseText("Sometimes when you move, your [pc.arm] sends your liquid-filled [pc.chest] bouncing. You can feel as much as hear the fluid churning inside, ready to be released into your hands, the ground, or a passersby’s open mouth."), "passive", baseDShift + (i * 4320));
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod < 30 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 30)
		{
			AddLogEvent(ParseText(" Every movement is accompanied by a weighty, sloshing jiggle from your [pc.chest]. The more you take in, the more like a gold myr honeypot you seem, growing until you seem more boob than ") + pc.mfn("man", "woman", "person") + ".", "passive", baseDShift + (i * 4320));
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod < 40 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 40)
		{
			AddLogEvent(ParseText(" Wherever you go, the eyes of every single passing sapient zero in on your [pc.chest]."), "passive", baseDShift + (i * 4320));
			if(!pc.hasBreasts()) ExtendLogEvent(" It juts");
			else ExtendLogEvent(" They jut");
			ExtendLogEvent(ParseText(" from your body like the proud prow of a deep space freighter, filled with a glorious [pc.milkFlavor] bounty. If only they knew - if only they could sense just how great it would be to take your [pc.nipple] in your mouth and suck. An all too pleasurable shudder wracks your spine at the thought."));
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod < 50 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 50)
		{
			AddLogEvent(ParseText(" It’s tough not to toddle forward off your [pc.feet] and onto your [pc.milkNoun]-engorged chest. The pressure would probably release a tide of [pc.milkFlavor] juice and still barely put a dent in your super-sized knockers. The honeypot gene is so amazing, the way it makes your body so fruitful... You’ve got to share this beautiful bosom with the galaxy!"), "passive", baseDShift + (i * 4320));
		}
		//Bump up boob size for 3 days of eating or a cumshot!
		for(var cc:int = 0; cc < pc.bRows(); cc++)
		{
			pc.breastRows[cc].breastRatingHoneypotMod += 1;
			//Drinking cum refills milk most of the way
			if(cumShot) if(pc.milkFullness < 81) pc.milkFullness = 81;
		}
	}
}

//Notes about milk gain increases
public function milkGainNotes(deltaT:uint = 0):void
{
	var msg:String = "";
	var x:int = 0;
	
	//Cross 75% milk fullness +1 cup
	//This doubles past F-cup
	if(pc.hasStatusEffect("Pending Gain Milk Note: 75"))
	{
		//Bump size!
		for(x = 0; x < pc.bRows(); x++)
		{
			if(pc.breastRows[x].breastRatingRaw >= 5) pc.breastRows[x].breastRatingLactationMod = 1.5;
			else pc.breastRows[x].breastRatingLactationMod = 1;
		}

		AddLogEvent(ParseText("There’s no way you could miss how your [pc.fullChest] have swollen up with [pc.milk]. You figure it won’t be long before they’re completely full. It might be a good idea to milk them soon. <b>With all that extra weight, "), "passive", deltaT);
		if(pc.bRows() > 1) ExtendLogEvent("the top row is ");
		else ExtendLogEvent("they’re ");
		ExtendLogEvent(ParseText("currently [pc.breastCupSize]s"));
		if(pc.bRows() > 1) ExtendLogEvent(", and the others are similarly swollen");
		ExtendLogEvent(".</b>");
		pc.removeStatusEffect("Pending Gain Milk Note: 75");
	}
	//Cross 100% milk fullness + 1.5 cups
	//This doubles past F-cup
	if(pc.hasStatusEffect("Pending Gain Milk Note: 100"))
	{
		//Bump size!
		for(x = 0; x < pc.bRows(); x++)
		{
			if(pc.breastRows[x].breastRatingRaw >= 5) pc.breastRows[x].breastRatingLactationMod = 2.5;
			else pc.breastRows[x].breastRatingLactationMod = 1.5;
		}
		AddLogEvent(ParseText("Your [pc.fullChest] feel more than a little sore. They’re totally and unapologetically swollen with [pc.milk]. You heft the [pc.breastCupSize]s and sigh, swearing you can almost hear them slosh. <b>They’re totally full.</b>"), "passive", deltaT);
		pc.removeStatusEffect("Pending Gain Milk Note: 100");
	}
	//Cross 150% milk fullness + 2 cups
	//This doubles past F-cup
	if(pc.hasStatusEffect("Pending Gain Milk Note: 150"))
	{
		//Bump size!
		for(x = 0; x < pc.bRows(); x++)
		{
			if(pc.breastRows[x].breastRatingRaw >= 5) pc.breastRows[x].breastRatingLactationMod = 3.5;
			else pc.breastRows[x].breastRatingLactationMod = 2;
		}
		
		AddLogEvent(ParseText("Your [pc.nipples] are extraordinarily puffy at the moment, practically suffused with your neglected [pc.milk]. It’s actually getting kind of painful to hold in all that liquid weight, and if "), "passive", deltaT);
		if(pc.hasPerk("Milky") || pc.hasPerk("Treated Milk")) ExtendLogEvent("it wasn’t for your genetically engineered super-tits, your body would be slowing down production");
		else if(pc.hasPerk("Honeypot")) ExtendLogEvent("it wasn’t for your honeypot gene, your body would be slowing down production");
		else if(pc.isPregnant()) ExtendLogEvent("you weren’t pregnant, you’d probably be slowing production.");
		else if(pc.upperUndergarment is BountyBra) ExtendLogEvent("you weren’t wearing a <b>Bounty Bra</b>, your body would be slowing down production");
		else ExtendLogEvent("you don’t take care of it soon, a loss of production is likely");
		ExtendLogEvent(ParseText(". Right now, they’re swollen up to [pc.breastCupSize]s."));
		pc.removeStatusEffect("Pending Gain Milk Note: 150");
	}
	//Hit 200% milk fullness cap + 3 cups
	//This doubles past F-cup
	if(pc.hasStatusEffect("Pending Gain Milk Note: 200"))
	{
		//Bump size!
		for(x = 0; x < pc.bRows(); x++)
		{
			if(pc.breastRows[x].breastRatingRaw >= 5) pc.breastRows[x].breastRatingLactationMod = 4.5;
			else pc.breastRows[x].breastRatingLactationMod = 3;
		}
		
		AddLogEvent(ParseText("The tightness in your [pc.fullChest] is almost overwhelming. You feel so full – so achingly stuffed – that every movement is a torture of breast-swelling delirium. You can’t help but wish for relief or a cessation of your lactation, whichever comes first. "), "passive", deltaT);
		if(pc.hasPerk("Milky") || pc.hasPerk("Treated Milk")) ExtendLogEvent("<b>However, with your excessively active udders, you are afraid the production will never stop.</b>");
		else if(pc.hasPerk("Honeypot")) ExtendLogEvent("<b>However, with your honeypot gene, they’ll likely never stop.</b>");
		else if(pc.isPregnant()) ExtendLogEvent("<b>With a pregnancy on the way, there’s no way your body will stop producing.</b>");
		else if(pc.upperUndergarment is BountyBra) ExtendLogEvent(ParseText("<b>Your Bounty Bra will keep your [pc.fullChest] producing despite the uncomfortable fullness.</b>"));
		else ExtendLogEvent(ParseText("<b>If you don’t tend to them, your [pc.breastCupSize]s will stop producing [pc.milk].</b>"));
		pc.removeStatusEffect("Pending Gain Milk Note: 200");
	}
	
	// Special bra changes!
	if((pc.upperUndergarment is BountyBra) || (pc.upperUndergarment is HoneypotBra))
	{
		if(pc.isLactating() && !pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_TRANSPARENT))
		{
			AddLogEvent(ParseText("The [pc.milk] leaking from your [pc.nipples] stains your " + pc.upperUndergarment.longName + ", making it slick and wet. As a result, the material becomes more and more see-through, allowing possible passerbys to see the private areas of your [pc.chest]. <b>Your top is now transparent!</b>"), "passive", deltaT);
			pc.createStatusEffect("Bra Transparency");
			pc.upperUndergarment.onEquip(pc);
			pc.removeStatusEffect("Bra Transparency");
		}
		else if(!pc.isLactating() && pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_TRANSPARENT))
		{
			AddLogEvent(ParseText("The dryness of your " + possessive(pc.upperUndergarment.longName) + " material is relieving. No longer sticking to your [pc.fullChest], the opaque garment now gives you a more modest appearance. <b>Your top is no longer transparent!</b>"), "passive", deltaT);
			pc.upperUndergarment.onEquip(pc);
		}
	}
}

public function lactationUpdateHourTick(totalHours:int):void
{
	//These are easy since they proc with time passage and can be added to event buffer.
	//Milk Multiplier crosses a 10 point threshold while dropping
	//Drops .5 an hour above 150 fullness. 1 above 200 fullness
	//Milk Rate drops by .1 an hour above 200.
	var originalMultiplier:Number = pc.milkMultiplier;
	var totalChange:Number = 0;
	var t:Number = 0;
	var msg:String = "";
	//Bounty bra never loses milkMultiplier!
	if(pc.upperUndergarment is BountyBra || pc.isPregnant() || pc.hasPerk("Honeypot") || pc.hasPerk("Mega Milk") || pc.hasPerk("Hypermilky"))
	{

	}
	else
	{
		if(pc.milkFullness >= 200) 
		{
			if (pc.hasPerk("Milky") && pc.hasPerk("Treated Milk")) { }
			else if (pc.hasPerk("Milky") || pc.hasPerk("Treated Milk"))
			{
				t = 0.2 * totalHours;
				totalChange -= t;
				pc.milkMultiplier -= t;
			}
			else
			{
				t = 1 * totalHours;
				totalChange -= t;
				pc.milkMultiplier -= t;
			}
		}
		else if(pc.milkFullness >= 150) 
		{
			if (!pc.hasPerk("Milky") && !pc.hasPerk("Treated Milk"))
			{
				t = 0.5 * totalHours;
				totalChange -= 6;
				pc.milkMultiplier -= t;
			}
		}
	}
	
	//Drops a tiny amount if below 50.
	if (pc.milkMultiplier < 50 && !(pc.upperUndergarment is BountyBra) && !pc.isPregnant() && !pc.hasPerk("Honeypot") && !pc.hasPerk("Mega Milk") && !pc.hasPerk("Hypermilky")) 
	{
		if(pc.hasPerk("Milky") && pc.hasPerk("Treated Milk") || (flags["NURSERY_MATERNITY_WAIT_ACTIVE"] != undefined)) {}
		else if (pc.hasPerk("Milky") || pc.hasPerk("Treated Milk"))
		{
			t = 0.02 * totalHours;
			totalChange -= t;
			pc.milkMultiplier -= t;
		}
		else
		{
			t = 0.1 * totalHours;
			totalChange -= t;
			pc.milkMultiplier -= t;
		}

		if (!pc.hasPerk("Milky"))
		{
			t = 0.1 * totalHours;
			totalChange -= t;
			pc.milkMultiplier -= t;
		}
		else
		{
			t = 0.2 * totalHours;
			totalChange -= t;
			pc.milkMultiplier -= t;
		}
		
		if(pc.milkFullness > 0) 
		{
			t = totalHours;
			totalChange -= t;
			pc.milkFullness -= t
			
			if (pc.milkFullness < 0)
			{
				pc.milkFullness = 0;
			}
		}
	}
	
	if (pc.milkMultiplier < 0)
	{
		pc.milkMultiplier = 0;
	}
	
	// Derp this should actually chain as it was
	var numChanges:int = 1;
	
	if (pc.milkMultiplier < 90 && originalMultiplier >= 90)
	{
		AddLogEvent("You’re pretty sure that your lactation is starting to slow down a little bit. If you don’t start milking yourself, you’ll eventually stop producing.", "passive", 60 * numChanges);
		numChanges++;
	}
	
	if (pc.milkMultiplier < 80 && originalMultiplier >= 80)
	{
		AddLogEvent(ParseText(" Low level tingles in your [pc.chest] remind you that producing [pc.milk] is something your body does, but if you keep ignoring yourself, you won’t for too much longer."), "passive", 60 * numChanges);
		numChanges++;
	}
	
	if (pc.milkMultiplier < 70 && originalMultiplier >= 70)
	{
		AddLogEvent(ParseText("You’re feeling pretty sore in your [pc.chest], but it’s not getting that much worse. <b>You’re pretty sure that you’re lactating less as a result of the inattention to your chest.</b>"), "passive", 60 * numChanges);
		numChanges++;
	}
	
	if (pc.milkMultiplier < 60 && originalMultiplier >= 60)
	{
		AddLogEvent(ParseText("Your body’s ability to produce [pc.milk] is diminishing to the point where your [pc.fullChest] are barely making any more. It won’t take long before you stop production entirely."), "passive", 60 * numChanges);
		numChanges++;
	}
	
	if (pc.milkMultiplier < 50 && originalMultiplier >= 50)
	{
		for(var x:int = 0; x < pc.bRows(); x++)
		{
			pc.breastRows[x].breastRatingLactationMod = 0;
		}
		AddLogEvent(ParseText("Like a switch has been flipped inside you, you feel your body’s [pc.milk]-factories power down. <b>You’ve stopped lactating entirely.</b>"), "passive", 60 * numChanges);
		if(pc.milkFullness >= 75) 
		{
			ExtendLogEvent(ParseText(" The swelling from your over-filled [pc.fullChest] goes down as well, leaving you with [pc.breastCupSize]s."));
			pc.milkFullness = 75;
		}
	}
	
	//Clean up boob size stuff
	pc.setBoobSwelling();
}

//Milk Multiplier crosses a 10 point threshold from raising
public function milkMultiplierGainNotificationCheck(deltaT:uint = 0):void
{
	var msg:String = "";
	
	//kGAMECLASS cheat to cheat these messages into the event buffer? Or pass event buffer as an argument? Regardless, seems the cleanest way to keep it from interrupting the scene it gets called in.
	//30
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 30")) {
		AddLogEvent(ParseText("The soreness in your [pc.nipples] is both persistent and pleasant in its own unique way. There’s no disguising how it makes your [pc.chest] practically glow with warmth."), "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 30");
	}
	//40
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 40")) {
		AddLogEvent(ParseText("Tingles run through your [pc.fullChest] every now and again. Your [pc.nipples] even feel moist. Perhaps you’ll start lactating soon?"), "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 40");
	}
	//50
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 50")) {
		AddLogEvent(ParseText("A single droplet of [pc.milk] escapes from one of your [pc.nipples]"), "passive", deltaT);
		if(pc.isChestGarbed()) ExtendLogEvent(ParseText(", staining your [pc.upperGarments] [pc.milkColor]"));
		ExtendLogEvent(". <b>You’re lactating</b>, albeit slowly.");
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 50");
	}
	//60
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 60")) {
		AddLogEvent(ParseText("Judging by the feelings in your [pc.fullChest], you can safely say that you’re making [pc.milk] faster than before. Is that what "), "passive", deltaT);
		if(pc.hasPregnancy()) ExtendLogEvent("it feels like to be an expectant mother?");
		else ExtendLogEvent("expectant mothers feel like?");
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 60");
	}
	//70
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 70")) {
		AddLogEvent("You’re pretty sure you’re lactating even more now. As a matter of fact, a scan by your codex confirms it. Your body is producing a decent amount of milk, perhaps a little under half its maximum capability.", "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 70");
	}
	//80
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 80")) {
		AddLogEvent(ParseText("Heat suffuses your chest, just another indication that your [pc.fullChest] have passed a new threshold of productivity. You’re definitely lactating harder."), "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 80");
	}
	//90
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 90")) {
		AddLogEvent(ParseText("There’s no doubt about how bountiful your [pc.fullChest] are feeling, swollen with potential just waiting to be milked out so that they can produce more. <b>You’re getting close to having your body as trained for lactation as possible.</b>"), "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 90");
	}
	//100
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 100")) {
		AddLogEvent(ParseText("A wonderful, productive feeling swells in your [pc.fullChest], tingling hotly. A quick scan with your codex reports that your body is making [pc.milk] at its full capacity."), "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 100");
	}
	//110
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 110")) {
		AddLogEvent(ParseText("Somehow, your body is adapting to all the milking its been put through, and your [pc.fullChest] feel more powerful and fecund than ever before. Your chest is a well-trained milking machine."), "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 110");
	}
	//125
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 125")) {
		AddLogEvent(ParseText("Your chest is practically singing in delight, and the only thing it sings about is [pc.milk] - rivers of never ending, liquid flows that will spill from you unceasingly. You have trained them to lactate as well as anything can be trained. If you want to make any more [pc.milk], you’ll have to grow your [pc.fullChest] bigger or turn to science."), "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 125");
	}
}