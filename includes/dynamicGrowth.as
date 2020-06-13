/* Dynamic growth/weight systems for immobilzation! */

public function applyEgregiouslyEndowed(deltaT:uint = 0):void
{
	pc.createStatusEffect("Egregiously Endowed", 0, 0, 0, 0, false, "Icon_Poison", "Movement between rooms takes twice as long, and fleeing from combat is more difficult.", false, 0);
}
public function applyLudicrouslyEndowed(deltaT:uint = 0):void
{
	pc.createStatusEffect("Ludicrously Endowed", 0, 0, 0, 0, false, "Icon_Poison", "The shifting masses of your over-sized endowments cause you to gain fifty percent more lust over time.", false, 0);
}
public function applyOverwhelminglyEndowed(deltaT:uint = 0):void
{
	pc.createStatusEffect("Overwhelmingly Endowed", 0, 0, 0, 0, false, "Icon_Poison", "The shifting masses of your over-sized endowments cause you to gain twice as much lust over time.", false, 0);
}
public function applyEndowmentImmobilized(deltaT:uint = 0):void
{
	pc.createStatusEffect("Endowment Immobilized", 0, 0, 0, 0, false, "Icon_Poison", "Your endowments prevent you from moving.", false, 0);
}
public function removeImmobilized(deltaT:uint = 0):void
{
	AddLogEvent("<b>You’re no longer immobilized by your out-sized equipment!</b>", "good", deltaT);
	pc.removeStatusEffect("Endowment Immobilized");
}

// 4 levels, each to match the original ball growth stuff:
// [0] Egregious, [1] Ludicrous, [2] Overwhelming, [3] Immobilized!
// Length/Size Ratios: (for immobilization comparisons, average 5 ft person) Ex. - 5' person with M-cup for level 1 is [40/60] at position 0.
private var lvlRatioBalls:Array = [(9/60), (15/60), (25/60), (40/60)];
private var lvlRatioPenis:Array = [(9999/60), (9999/60), (9999/60), (9999/60)]; //[(16/60), (32/60), (64/60), (128/60)];
private var lvlRatioClits:Array = [(9999/60), (9999/60), (9999/60), (9999/60)]; //[(16/60), (32/60), (64/60), (128/60)];
private var lvlRatioBoobs:Array = [(9999/60), (9999/60), (9999/60), (9999/60)]; //[(25/60), (50/60), (100/60), (200/60)];
private var lvlRatioBelly:Array = [(50/20), (70/20), (90/20), (120/20)];
private var lvlRatioButts:Array = [(20/20), (30/20), (50/20), (80/20)];
// Threshold percentages for each level:
private var percentBalls:Array = [10, 25, 50, 100];
private var percentPenis:Array = [25, 50, 75, 100];
private var percentClits:Array = [25, 50, 75, 100];
private var percentBoobs:Array = [25, 50, 75, 100];
private var percentBelly:Array = [5, 20, 55, 100];
private var percentButts:Array = [25, 50, 75, 100];


/* General framework stuff */

private function lvlBodyParts(lvl:int, strictList:Array = null):Array
{
	var bodyPart:Array = [];
	
	if((strictList == null || strictList.indexOf("testicle") != -1) && pc.balls > 0 && pc.weightQ("testicle") >= percentBalls[lvl] && pc.heightRatio("testicle") >= lvlRatioBalls[lvl]) bodyPart.push("balls");
	if((strictList == null || strictList.indexOf("penis") != -1) && pc.hasCock() && pc.weightQ("penis") >= percentPenis[lvl] && pc.heightRatio("penis") >= lvlRatioPenis[lvl]) bodyPart.push("cock");
	if((strictList == null || strictList.indexOf("clitoris") != -1) && pc.hasVagina() && pc.weightQ("clitoris") >= percentClits[lvl] && pc.heightRatio("clitoris") >= lvlRatioClits[lvl]) bodyPart.push("clit");
	if((strictList == null || strictList.indexOf("breast") != -1) && pc.hasBreasts() && pc.weightQ("breast") >= percentBoobs[lvl] && pc.heightRatio("breast") >= lvlRatioBoobs[lvl]) bodyPart.push("boobs");
	if((strictList == null || strictList.indexOf("belly") != -1) && pc.weightQ("belly") >= percentBelly[lvl] && pc.heightRatio("belly") >= lvlRatioBelly[lvl]) bodyPart.push("belly");
	if((strictList == null || strictList.indexOf("butt") != -1) && pc.weightQ("butt") >= percentButts[lvl] && pc.heightRatio("butt") >= lvlRatioButts[lvl]) bodyPart.push("butt");
	
	return bodyPart;
}
public function immobilizedUpdate(count:Boolean = false, deltaT:uint = 0):Number
{
	if(!pc.hasStatusEffect("Endowment Immobilized") || rooms[currentLocation].hasFlag(GLOBAL.LOW_GRAVITY)) return 0;
	
	var bodyPart:Array = lvlBodyParts(3);
	
	if(!count)
	{
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
		if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV))
		{
			if(InCollection("belly", bodyPart)) immobileParts--;
			if(InCollection("butt", bodyPart)) immobileParts--;
		}
		
		// Support exceptions!
		if(immobileParts <= 0)
		{
			var msg:String = "";
			var bodyText: String = "";
			var partList:Array = [];
			
			msg += "Your";
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
				msg += " Activating the anti-gravity switches on your " + (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV) ? "outfit" : "undergarments") + ", you quickly feel the immobilizing weight being lifted off the ground!";
			}
			msg += " Now you can travel with ease... more or less.";
			
			AddLogEvent(msg, "passive", deltaT);
			
			removeImmobilized(deltaT);
			pc.lust(5 * bodyPart.length);
		}
	}
	
	return bodyPart.length;
}

private function bodyPartUpdates(partName:String = "none", deltaT:uint = 0):void
{
	// Exceptions
	if(pc.isGoo()) { /* Goos are immune to immobilization? */ }
	else if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV)) { /* Anti-grav outfit lifts all body parts. */ }
	else if(InCollection(partName, ["testicle", "penis", "clitoris"]) && pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV)) { /* Anti-grav underwear lifts crotch stuff. */ }
	else if(InCollection(partName, ["breast"]) && pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV)) { /* Anti-grav top lifts chest stuff. */ }
	// Weigh parts and add effects where necessary
	else
	{
		var weightQ:Number = pc.weightQ(partName);
		var heightQ:Number = pc.heightRatio(partName);
		var msg:String = "";
		
		if(partName == "testicle" && pc.balls > 0)
		{
			//Hit basketball size >= 9
			if(weightQ >= percentBalls[0] && heightQ >= lvlRatioBalls[0] && !pc.hasStatusEffect("Egregiously Endowed"))
			{
				msg = ParseText("Ugh, you could really use a chance to offload some [pc.cumNoun]. You");
				if(pc.ballDiameter() >= 9 && pc.ballDiameter() < 12)
				{
					if(pc.balls == 1) msg += "r testicle has reached the size of a basketball and shows";
					else msg += "r balls have reached the size of basketballs and show";
				}
				else
				{
					if(pc.balls == 1) msg += " have " + pc.ballsDescript(true, true) + " and it shows";
					else msg += " have " + pc.ballsDescript(false, true) + " and they show";
				}
				msg += " no signs of stopping. The squishy, sensitive mass will definitely slow your movements.";
				
				AddLogEvent(msg, "passive", deltaT);
				//Status - Egregiously Endowed - Movement between rooms takes twice as long, and fleeing from combat is more difficult.
				applyEgregiouslyEndowed(deltaT);
				pc.lust(5);
			}
			//Hit beachball size >= 15
			if(weightQ >= percentBalls[1] && heightQ >= lvlRatioBalls[1] && !pc.hasStatusEffect("Ludicrously Endowed"))
			{
				msg = ParseText("Every movement is accompanied by a symphony of sensation from your swollen nutsack, so engorged with [pc.cumNoun] that it wobbles from its own internal weight. You have to stop from time to time just to keep from being overwhelmed by your own liquid arousal.");
				
				AddLogEvent(msg, "passive", deltaT);
				applyLudicrouslyEndowed(deltaT);
				pc.lust(5);
			}
			//Hit barrel size
			if(weightQ >= percentBalls[2] && heightQ >= lvlRatioBalls[2] && !pc.hasStatusEffect("Overwhelmingly Endowed"))
			{
				msg = "Whoah, this is awkward. Your";
				if(pc.balls == 1) msg += " testicle is";
				else msg += " nuts are";
				if(pc.ballDiameter() >= 25 && pc.ballDiameter() < 40) msg += " practically barrel-sized";
				else msg += " utterly massive";
				msg += "! If you aren’t careful,";
				if(pc.balls == 1) msg += " it";
				else msg += " they";
				msg += " drag softly on the ground. Grass is no longer scenery - it’s hundreds of slender tongues tickling your nut";
				if(pc.balls != 1) msg += "s";
				msg += ". Mud is an erotic massage. Even sand feels kind of good against your thickened sack, like a vigorous massage.";
				
				AddLogEvent(msg, "passive", deltaT);
				applyOverwhelminglyEndowed(deltaT);
				pc.lust(5);
			}
			//hit person size
			if(weightQ >= percentBalls[3] && heightQ >= lvlRatioBalls[3] && !pc.hasStatusEffect("Endowment Immobilized") && !pc.hasItemByClass(Hoverboard))
			{
				msg = "You strain as hard as you can, but there’s just no helping it. You’re immobilized. Your";
				if(pc.balls == 1) msg += " testicle is";
				else msg += " balls are";
				msg += " just too swollen to allow you to move anywhere. The bulk of your body weight is right there in your";
				if(pc.balls == 1) msg += " sack";
				else msg += " testes";
				msg += ", and there’s nothing you can do about it.";
				if(canShrinkNuts()) msg += ".. well, almost nothing. A nice, long orgasm ought to fix this!";
				else 
				{
					if(eventQueue.indexOf(bigBallBadEnd) == -1) eventQueue.push(bigBallBadEnd);
					if(pc.hasPerk("'Nuki Nuts")) msg += " If a quick fap wasn’t illegal here, this would be far simpler. Too bad.";
				}
				AddLogEvent(msg, "passive", deltaT);
				applyEndowmentImmobilized(deltaT);
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
		else if(partName == "belly" && heightQ >= lvlRatioBelly[0])
		{
			// "Bulky Belly" debuff
			// v1: Multiplier that affects max reflexes, reflexes and evasion.
			pc.createStatusEffect("Bulky Belly", 1.0, 0, 0, 0, false, "Icon_Belly_Pregnant", "", false, 0);
			var nCurBellyDebuff:Number = pc.statusEffectv1("Bulky Belly");
			var nNewBellyDebuff:Number = 1.0;
			
			if(heightQ >= lvlRatioBelly[0])
			{
				if(nCurBellyDebuff > 0.9) msg = "You shift your weight and notice you are getting a little bit slower than usual... it looks like your mid-section’s size is affecting your mobility a little.";
				if(nCurBellyDebuff < 0.9) msg = "A bit easier to move, your belly seems a little less burdensome now.";
				nNewBellyDebuff = 0.9;
			}
			if(heightQ >= lvlRatioBelly[1])
			{
				if(nCurBellyDebuff > 0.7) msg = "You notice a little more lag in your movements as of late. The size of your belly has been a bit more burdensome, affecting your reaction time.";
				if(nCurBellyDebuff < 0.7) msg = "Feeling some of your reflexes return to you, you see that your belly is a bit less bulky now.";
				nNewBellyDebuff = 0.7;
			}
			if(heightQ >= lvlRatioBelly[2])
			{
				if(nCurBellyDebuff > 0.5) msg = "It’s really getting harder to move around as easily now. It looks like your reflexes have been greatly reduced due to your burgeoning belly.";
				if(nCurBellyDebuff < 0.5) msg = "Though still in the way, your belly seems a little less cumbersome than before.";
				nNewBellyDebuff = 0.5;
			}
			if(heightQ >= lvlRatioBelly[3])
			{
				if(nCurBellyDebuff > 0.3) msg = "You try to move around but your reactions are extremely slow. Your belly is just too massive and cumbersome for you to move yourself normally anymore! Everything must be done slowly and painstakingly.";
				if(nCurBellyDebuff < 0.3) msg = "Though still greatly in the way, your belly seems a little less massive than before.";
				nNewBellyDebuff = 0.3;
			}
			
			if(nCurBellyDebuff != nNewBellyDebuff) {
				if(msg != "") AddLogEvent(msg, "passive", deltaT);
				pc.setStatusValue("Bulky Belly", 1, nNewBellyDebuff);
				pc.setStatusTooltip("Bulky Belly", "The size of your belly weighs you down, dropping your reflexes and evasion chances by " + (Math.round((1.0 - nNewBellyDebuff) * 1000) / 10) + "%.");
			}
			
			if(weightQ >= percentBelly[3] && heightQ >= lvlRatioBelly[3] && !pc.hasStatusEffect("Endowment Immobilized") && !pc.hasItemByClass(Hoverboard))
			{
				// Butt bug, variant 1
				if(pc.statusEffectv1("Butt Bug (Female)") == 1 && pc.statusEffectv1("Butt Bug Egg Cycle") == 1)
				{
					if(pc.pregnancyData.length > 3 && pc.pregnancyData[3].pregnancyType == "ButtBugPregnancy1" && pc.pregnancyData[3].pregnancyQuantity >= 30)
					{
						applyEndowmentImmobilized(deltaT);
					}
				}
			}
		}
		else if(partName == "butt")
		{
			/* 9999 */
		}
	}
	
	bodyPartCleanup(partName, deltaT);
}

private function bodyPartCleanup(partName:String = "none", deltaT:uint = 0):void
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
			altCheck = (pc.balls <= 0 || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV));
			lvlRatio = lvlRatioBalls;
			perRatio = percentBalls;
			break;
		case "penis":
			altCheck = (!pc.hasCock() || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV));
			lvlRatio = lvlRatioPenis;
			perRatio = percentPenis;
			break;
		case "clitoris":
			altCheck = (!pc.hasVagina() || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV));
			lvlRatio = lvlRatioClits;
			perRatio = percentClits;
			break;
		case "breast":
			altCheck = (!pc.hasBreasts() || pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV));
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
	if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_ANTIGRAV)) altCheck = true;
	
	// Endowments
	if(InCollection(partName, ["testicle", "penis", "clitoris", "breast"]))
	{
		if((altCheck || weightQ < perRatio[3] || heightQ < lvlRatio[3]) && pc.hasStatusEffect("Endowment Immobilized")) 
		{
			if(lvlBodyParts(3).length <= 0) removeImmobilized(deltaT);
		}
		if((altCheck || weightQ < perRatio[2] || heightQ < lvlRatio[2]) && pc.hasStatusEffect("Overwhelmingly Endowed"))
		{
			if(lvlBodyParts(2, ["testicle", "penis", "clitoris", "breast"]).length <= 0) pc.removeStatusEffect("Overwhelmingly Endowed");
		}
		if((altCheck || weightQ < perRatio[1] || heightQ < lvlRatio[1]) && pc.hasStatusEffect("Ludicrously Endowed"))
		{
			if(lvlBodyParts(1, ["testicle", "penis", "clitoris", "breast"]).length <= 0) pc.removeStatusEffect("Ludicrously Endowed");
		}
		if((altCheck || weightQ < perRatio[0] || heightQ < lvlRatio[0]) && pc.hasStatusEffect("Egregiously Endowed"))
		{
			if(lvlBodyParts(0, ["testicle", "penis", "clitoris", "breast"]).length <= 0) pc.removeStatusEffect("Egregiously Endowed");
		}
	}
	// Belly Size
	if(partName == "belly")
	{
		if((altCheck || heightQ < lvlRatio[0]) && pc.hasStatusEffect("Bulky Belly"))
		{
			AddLogEvent("Shifting your weight around seems a lot easier now.  <b>Your [pc.belly] is no longer slowing you down!</b>", "good", deltaT);
			pc.removeStatusEffect("Bulky Belly");
		}
		if((altCheck || weightQ < perRatio[3] || heightQ < lvlRatio[3]) && pc.hasStatusEffect("Endowment Immobilized")) 
		{
			if(lvlBodyParts(3).length <= 0) removeImmobilized(deltaT);
		}
	}
}


public function immobilizationList():Array
{
	var funcList:Array = [];
	
	if(pc.hasStatusEffect("Endowment Immobilized"))
	{
		if(pc.balls > 0 && pc.weightQ("testicle") >= percentBalls[3] && pc.heightRatio("testicle") >= lvlRatioBalls[3]) funcList.push(bigBallNoBadEnd);
	}
	return funcList;
}
public function immobilizationHelp():void
{
	clearOutput();
	
	output("Due to your immobilized state, you take out your codex and call for help...");
	
	var funcList:Array = immobilizationList();
	
	clearMenu();
	if(funcList.length > 0) addButton(0, "Next", funcList[rand(funcList.length)]);
	else addButton(0, "Next", mainGameMenu);
}


/* Nuts stuff! */

public function nutSwellUpdates(deltaT:uint = 0):void
{
	bodyPartUpdates("testicle", deltaT);
	
	// Special underwear changes!
	if(pc.lowerUndergarment is HardlightAGJock)
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
			AddLogEvent(ParseText("No longer bulging it to its limits, the hardlight jock relaxes around your groin, giving you some much needed space to breathe--however, due to that, <b>it seems to have lost a little bit of its sexual appeal</b>."), "passive", deltaT);
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
	if(pc.perkv1("'Nuki Nuts") > 0 && pc.hasCock() && pc.canMasturbate())
	{
		//NO FAPS!
		if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP)) return false;
		if(rooms[currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL)) return false;
		return true;
	}
	return false;
}

public function bigBallNoBadEnd():void { bigBallBadEnd(false); }
public function bigBallBadEnd(bBadEnd:Boolean = true):void
{
	//Dangerous area, can’t unswell:
	if(bBadEnd && rooms[currentLocation].hasFlag(GLOBAL.HAZARD))
	{
		if(disableExploreEvents())
		{
			bigBallNativesBadEnd();
			return;
		}
		
		clearOutput();
		showBust("");
		showName("\nIMMOBILIZED!");
		author("Jacques00");
		
		output("Welp, it looks like you are stuck out in the wilderness with a sack you cannot hide. Do you want to use your codex to call for help or stay and see what happens?");
		
		clearMenu();
		addButton(0, "Stay...", bigBallBadEndCont, "stay");
		addButton(1, "Help!", bigBallBadEndCont, "help");
	}
	//Not a dangerous area:
	else 
	{
		clearOutput();
		showBust("");
		showName("MEDICAL\nEMERGENCY!");
		author("Fenoxo");
		
		output("Eventually, you manage to get someone to pick you up and take you in for treatment. It isn’t cheap either.");
		if(pc.credits >= 10000)
		{
			pc.credits -= 10000;
			output(" Your finances are");
			if(pc.credits < 1000) output(" completely");
			output(" drained by your own libidinous foolishness, but at least you can move around normally again!");
		}
		else
		{
			pc.credits = 0;
			output(" Your finances aren’t capable of footing the bill, but at least the medical experimentation that pays for it all isn’t too bad.");
			if(pc.biggestTitSize() >= 1 && pc.breastRows[0].breasts < 3 && rand(2) == 0)
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
		
		pc.createStatusEffect("Milk Paused");
		pc.createStatusEffect("Cum Paused");
		processTime(1382);
		pc.removeStatusEffect("Milk Paused");
		pc.removeStatusEffect("Cum Paused");
		
		pc.removeStatusEffect("Blue Balls");
		if(pc.perkv1("'Nuki Nuts") > 0)
		{
			pc.ballSizeMod -= pc.perkv1("'Nuki Nuts");
			pc.setPerkValue("'Nuki Nuts", 1, 0);
		}
		if(pc.ballSizeRaw > 30) pc.ballSizeRaw = 30;
		
		pc.ballFullness = 0;
		nutStatusCleanup();
		pc.lustRaw = pc.lustMin();
		
		moveTo("SHIP INTERIOR");
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}
public function bigBallBadEndCont(response:String = "help"):void
{
	clearOutput();
	author("Jacques00");
	clearMenu();
	
	switch(response)
	{
		case "help":
		case "back":
			showBust("");
			showName("WHO YOU\nGONNA CALL?");
			
			if(response == "back") output("Who else do you call?");
			else
			{
				output("You decide it would be a better idea to ask for help and so you flip open your Codex and attempt to access your phone-a-friend speed dial list.");
				output("\n\nWho do you call?");
			}
			output("\n\n");
			
			var i:int = 0;
			var btnSlot:int = 0;
			var lifeline:Array = getCrewOnShipNames(false, true);
			lifeline.unshift("Steele Tech");
			lifeline.push("Unknown");
			
			for(i = 0; i < lifeline.length; i++)
			{
				addButton(btnSlot, lifeline[i], bigBallBadEndCont, lifeline[i]);
				btnSlot++;
				if(btnSlot >= 59 || (i == (lifeline.length - 1))) break;
				if((btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Never Mind", bigBallBadEndCont, "stay");
					btnSlot++;
				}
			}
			if(btnSlot > 14)
			{
				while((btnSlot < 59) && ((btnSlot + 1) % 15 != 0)) { btnSlot++; }
				addButton(btnSlot, "Never Mind", bigBallBadEndCont, "stay");
			}
			
			addButton(14, "Never Mind", bigBallBadEndCont, "stay");
			break;
		case "Steele Tech":
			showBust("MILLY");
			showName("CALL\nSTEELE TECH");
			
			output("It might be too embarrassing to call emergency services, so you try the next best thing and dial Steele Tech property retrieval");
			if(silly) output(" (because of course you would do such a thing)");
			output(" and wait... Beep.");
			output("\n\n<i>“Oh! Uh, um... Steele Tech pick-up crew, how may we be of service, " + pc.mf("Mr.","Ms.") + " Steele,”</i> a semi-nervous voice answers through audio... and after the video feed picks up, obviously female. You are greeted by her violet eyes and maroon lips on a chocolate-toned face, wearing a surprised expression.");
			if(flags["MHENGA_PROBE_CASH_GOT"] != undefined) output(" It’s Milly, and upon recognizing you, she flashes a bright smile and her two-finger salute.");
			output(" The " + (CodexManager.entryUnlocked("Dzaan") ? "dzaan" : "alien") + " girl adjusts her platinum, micro-braided ponytail and draps it over one shoulder, straightening her posture in attention. <i>“So, do you need us to send over a draggin’ wagon to tow a probe back to base?”</i>");
			output("\n\nYou smirk. <i>“Well, now that you mention it, I have " + (pc.balls == 1 ? "one big Steele Tech probe" : (num2Text(pc.balls) + " big Steele Tech probes")) + " I need help with...”</i> You try to pan and zoom your camera to reveal your [pc.ballsack] as much as possible. <i>“Do you think that is doable?”</i>");
			output("\n\nTaking in what she just saw, the girl is stunned. <i>“Oh, dear...”</i> is her response, too shocked to follow up with another word.");
			if(flags["MILLY_FUCKED"] != undefined) output(" Is... is that drool streaming down of the side of her mouth?");
			output("\n\nOut of the corner of the video feed, you spot a youthful, kaithrit male in the back, carelessy spinning by on his rolling chair. When his eyes meet the camera, you see him flinch and then, <i>“By the One--!”</i> His chair somehow flips from under him and CRASH! He is on the ground instantly.");
			output("\n\nThe noise breaks the girl’s trance and she reflexively hops out of her seat, her hair whipping to the motion, so she can quickly tend to her co-worker. <i>“A--are you okay, Ringo?”</i>");
			output("\n\n<i>“Yeah, yeah. I’m okay, I’m okay. Thanks,”</i> he groans, defeatedly.");
			output("\n\nConcluding that the accident wasn’t anything severe, but still too flustered by the sudden mix of emotions, the girl darts back up toward the camera, one hand covering her eyes as if to be polite and splurting out a string of apologies with the blindly-aligned camera looking up at her chin. <i>“S-sorry. I’ll call a team nearby to give you a lift!”</i> The camera reangles itself again from being hand held and you are left with an image of her tight, cocoa-colored cleavage, and then a big silhouette of her hand blocks the view before tapping a button and finally the video and audio feed cuts out... Beep.");
			output("\n\nAs innocent as she is, she" + (flags["MHENGA_PROBE_CASH_GOT"] != undefined ? "’s" : " seems to be") + " a good kid. Hopefully everything is okay over there. Anyway, it’s settled, you can now get out of your predicament.... somehow.");
			output("\n\n");
			
			processTime(8);
			
			addButton(0, "Next", bigBallBadEndCont, "success");
			break;
		case "Unknown":
			showBust("");
			showName("\n???");
			
			output("An unkown number? You don’t remember having this saved on your list... Oh well, no harm if it’s the wrong contact. You dial it and wait... Beep.");
			output("\n\n<i>“[pc.name], be careful!”</i> a masked voice answers without a greeting, the video feed appears all black for you. <i>“There are Playmore Dongs around there.”</i> What? <i>“Use a Dong Detector!”</i>");
			output("\n\n<i>“Wh...who are you?”</i> you respond.");
			output("\n\n<i>“Just call me... ‘DEEPTHROAT.’”</i>");
			output("\n\n<i>“Deepthroat?”</i> You are not sure if this is a joke, so you better make your situation clear. <i>“Listen, I just need help with my situation...”</i>");
			output("\n\nJust before you provide video proof, the voice answers, <i>“Already done.”</i> You could hear an audible grin.");
			output("\n\n<i>“What do you want in return?”</i>");
			output("\n\n<i>“I’ve waited a long time for this day. Now I want to enjoy the moment.”</i> The audio and video then cut off... Beep.");
			output("\n\nWhat’s with that guy? Well, Let’s hope they are true to their word....");
			output("\n\n");
			
			processTime(3);
			
			addButton(0, "Next", bigBallBadEndCont, "success");
			break;
		case "Celise":
			showBust(celiseBustDisplay());
			showName("CALL\nCELISE");
			
			output("Well, this is a crapshoot, but it’s an option at least... You dial for Celise and wait... Beep.");
			output("\n\n... Beep.");
			output("\n\n... Beep.");
			output("\n\nBeep. Beep.");
			output("\n\n.....");
			output("\n\n<i>“HELLOOOooo...!”</i> is the greeting, with some irritable crackling from exceeding the microphone’s audio levels. The video feed engages and all you see is a translucent green with the occasional bubbling.");
			output("\n\n<i>“Uh, Celise...?”</i> you ask.");
			output("\n\n<i>“Oh, hey, [pc.name]!”</i> she answers. The emerald begins to shuffle away from the camera lense and a familiar face emerges.");
			if(hasGooArmorOnSelf())
			{
				output("\n\n[goo.name] pokes her head out and adds, <i>“Like, heeey, Celise!”</i>");
				output("\n\n<i>“Hiya, [goo.name]!”</i> Celise responds, waving excitedly.");
			}
			output(" <i>“Do ya need something?”</i>");
			output("\n\n<i>“Well...”</i> You try your best to pan and zoom the camera to capture the immensity of your [pc.balls]. <i>“I need some help");
			if(pc.hasCock()) output(" emptying " + (pc.balls == 1 ? "this" : "these") + "--or at least");
			output(" getting " + (pc.balls == 1 ? "it" : "them") + " to a more manageable size.”</i>");
			output("\n\nThe green goo girl lets out an exaggerated gasp. <i>“Wow! I wish I was there so I could drink it all myself!”</i>");
			if(hasGooArmorOnSelf())
			{
				output("\n\n<i>“Ooo! Me too! Me too!”</i> [goo.name] adds.");
				output("\n\nCelise giggles, <i>“Of course, we can share!”</i>");
			}
			output("\n\nYou audibly clear your throat.");
			output("\n\nCelise’s face crinkles in deep concentration. <i>“Okay, I will send out the call!”</i>");
			output("\n\nWhat?");
			output("\n\nYou see her vigorously tapping and typing on the keys on the screen, supposedly, at least in her mind, putting together a team of experts to come and rescue you. However, in reality, the video display switches between color, grayscale, sepia tone, and fire and snow effects, while the sounds alternates between hyper girly, robot destroyer, auto-tune, and high-pitched and low-pitched. Basically, she’s just randomly changing the video and audio filters in her button mashing rampage.");
			output("\n\nYou are about to suggest something but the audio and video feed suddenly cut off with a static cue and then... Beep. The call has ended.");
			output("\n\nUh... perhaps you should try another contact....");
			output("\n\n");
			
			processTime(7);
			
			addButton(0, "Next", bigBallBadEndCont, "back");
			break;
		case "Reaha":
			showBust(reahaBustDisplay());
			showName("CALL\nREAHA");
			
			output("Maybe you should give your homely cowgirl a call? You dial for Reaha and wait... Beep.");
			output("\n\n<i>“Hello,”</i> the bovine beauty’s voice answers.");
			output("\n\nYou reply, <i>“He--”</i>");
			output("\n\n<i>“...You’ve reached the voice box of Reaha Hayes. I’m not here right now but if you leave your name and number after the ‘moo’, I will try to get back to you as soon as I can. Thank you!”</i>");
			output("\n\nGreat, well, she’s probably busy at the mo--");
			output("\n\n<i>“Moo!”</i>")
			output("\n\nGuess you better try another contact....");
			output("\n\n");
			
			processTime(5);
			
			addButton(0, "Next", bigBallBadEndCont, "back");
			break;
		case "success":
			showBust("");
			showName("\nWAITING...");
			
			output("Now to wait...");
			output("\n\nAnd wait...");
			output("\n\n...And wait.");
			output("\n\n");
			
			processTime(64);
			
			addButton(0, "Next", bigBallNoBadEnd);
			break;
		case "stay":
			showBust("");
			showName("\nWAITING...");
			
			output("You decide to stay and let fate decide for you....");
			output("\n\n");
			
			processTime(1);
			
			addButton(0, "Next", bigBallNativesBadEnd);
			break;
		default:
			showBust("");
			showName("\nNO RESPONSE");
			
			output("A ring... ring... aaaaaand no answer.");
			output("\n\nPerhaps you should try a different number?");
			output("\n\n");
			
			processTime(2);
			
			addButton(0, "Next", bigBallBadEndCont, "back");
			break;
	}
}
public function bigBallNativesBadEnd():void
{
	clearOutput();
	showBust("");
	showName("ALL OUT\nBALLS OUT");
	
	author("Fenoxo");
	
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

/* Boobs stuff! */

public function honeyPotBump(cumShot:Boolean = false, totalDays:int = 0):void
{
	var baseDShift:uint = (totalDays == 0 ? 0 : GetGameTimestamp() % 1440);
	
	totalDays = 1;
	
	for (var i:int = 0; i < totalDays; i++)
	{
		var msg:String = "";
		
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
			
			msg += ParseText("Your body tightens as the honeypot gene goes to work, diverting your excess bodymass into your [pc.chest], building you bigger and fuller of [pc.milkNoun].");
			
			for(var bb:int = 0; bb < pc.bRows(); bb++)
			{
				pc.breastRows[bb].breastRatingHoneypotMod += boobDiff;
			}
			if(pc.milkFullness < 100) pc.milkFullness = 100;
			AddLogEvent(msg, "passive", baseDShift + (i * 4320));
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod == 0)
		{
			msg += ParseText("Your [pc.chest] feel");
			if(!pc.hasBreasts()) msg += "s";
			msg += " bigger than normal, swollen";
			if(cumShot) msg += " from all the oral calories you’ve taken in.";
			else msg += " with the spare calories your honeypot gene has siphoned off of your meals.";
			AddLogEvent(msg, "passive", baseDShift + (i * 4320));
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod < 10 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 10)
		{
			msg += ParseText(" Your [pc.chest] practically glow");
			if(!pc.hasBreasts()) msg += "s";
			msg += " with the ever-expanding fruit of your honeypot gene. You wonder just how big you’ll get.";
			AddLogEvent(msg, "passive", baseDShift + (i * 4320));
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod < 20 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 20)
		{
			msg += ParseText("Sometimes when you move, your [pc.arm] sends your liquid-filled [pc.chest] bouncing. You can feel as much as hear the fluid churning inside, ready to be released into your hands, the ground, or a passersby’s open mouth.");
			AddLogEvent(msg, "passive", baseDShift + (i * 4320));
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod < 30 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 30)
		{
			msg += ParseText(" Every movement is accompanied by a weighty, sloshing jiggle from your [pc.chest]. The more you take in, the more like a gold myr honeypot you seem, growing until you seem more boob than ") + pc.mfn("man", "woman", "person") + ".";
			AddLogEvent(msg, "passive", baseDShift + (i * 4320));
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod < 40 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 40)
		{
			msg += ParseText(" Wherever you go, the eyes of every single passing sapient zero in on your [pc.chest].");
			if(!pc.hasBreasts()) msg += " It juts";
			else msg += " They jut";
			msg += ParseText(" from your body like the proud prow of a deep space freighter, filled with a glorious [pc.milkFlavor] bounty. If only they knew - if only they could sense just how great it would be to take your [pc.nipple] in your mouth and suck. An all too pleasurable shudder wracks your spine at the thought.");
			AddLogEvent(msg, "passive", baseDShift + (i * 4320));
		}
		else if(pc.breastRows[0].breastRatingHoneypotMod < 50 && pc.breastRows[0].breastRatingHoneypotMod+1 >= 50)
		{
			msg += ParseText(" It’s tough not to toddle forward off your [pc.feet] and onto your [pc.milkNoun]-engorged chest. The pressure would probably release a tide of [pc.milkFlavor] juice and still barely put a dent in your super-sized knockers. The honeypot gene is so amazing, the way it makes your body so fruitful... You’ve got to share this beautiful bosom with the galaxy!");
			AddLogEvent(msg, "passive", baseDShift + (i * 4320));
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

		msg = ParseText("There’s no way you could miss how your [pc.fullChest] have swollen up with [pc.milk]. You figure it won’t be long before they’re completely full. It might be a good idea to milk them soon. <b>With all that extra weight, ");
		if(pc.bRows() > 1) msg += "the top row is ";
		else msg += "they’re ";
		msg += ParseText("currently [pc.breastCupSize]s");
		if(pc.bRows() > 1) msg += ", and the others are similarly swollen";
		msg += ".</b>";
		AddLogEvent(msg, "passive", deltaT);
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
		msg = ParseText("Your [pc.fullChest] feel more than a little sore. They’re totally and unapologetically swollen with [pc.milk]. You heft the [pc.breastCupSize]s and sigh, swearing you can almost hear them slosh. <b>They’re totally full.</b>");
		AddLogEvent(msg, "passive", deltaT);
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
		
		msg = ParseText("Your [pc.nipples] are extraordinarily puffy at the moment, practically suffused with your neglected [pc.milk]. It’s actually getting kind of painful to hold in all that liquid weight, and if ");
		if(pc.hasPerk("Milky") || pc.hasPerk("Treated Milk") || pc.hasPerk("Hypermilky")) msg += "it wasn’t for your genetically engineered super-tits, your body would be slowing down production";
		else if(pc.hasPerk("Honeypot")) msg += "it wasn’t for your honeypot gene, your body would be slowing down production";
		else if(pc.isPregnant()) msg += "you weren’t pregnant, you’d probably be slowing production.";
		else if(pc.upperUndergarment is BountyBra) msg += "you weren’t wearing a <b>Bounty Bra</b>, your body would be slowing down production";
		else msg += "you don’t take care of it soon, a loss of production is likely";
		msg += ParseText(". Right now, they’re swollen up to [pc.breastCupSize]s.");
		AddLogEvent(msg, "passive", deltaT);
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
		
		msg = ParseText("The tightness in your [pc.fullChest] is almost overwhelming. You feel so full – so achingly stuffed – that every movement is a torture of breast-swelling delirium. You can’t help but wish for relief or a cessation of your lactation, whichever comes first. ");
		if(pc.hasPerk("Milky") || pc.hasPerk("Treated Milk") || pc.hasPerk("Hypermilky")) msg += "<b>However, with your excessively active udders, you are afraid the production will never stop.</b>";
		else if(pc.hasPerk("Honeypot")) msg += "<b>However, with your honeypot gene, they’ll likely never stop.</b>";
		else if(pc.isPregnant()) msg += "<b>With a pregnancy on the way, there’s no way your body will stop producing.</b>";
		else if(pc.upperUndergarment is BountyBra) msg += ParseText("<b>Your Bounty Bra will keep your [pc.fullChest] producing despite the uncomfortable fullness.</b>");
		else msg += ParseText("<b>If you don’t tend to them, your [pc.breastCupSize]s will stop producing [pc.milk].</b>");
		AddLogEvent(msg, "passive", deltaT);
		pc.removeStatusEffect("Pending Gain Milk Note: 200");
	}
	
	// Special bra changes!
	if((pc.upperUndergarment is BountyBra) || (pc.upperUndergarment is HoneypotBra))
	{
		if(pc.isLactating() && !pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_TRANSPARENT))
		{
			msg = ParseText("The [pc.milk] leaking from your [pc.nipples] stains your " + pc.upperUndergarment.longName + ", making it slick and wet. As a result, the material becomes more and more see-through, allowing possible passerbys to see the private areas of your [pc.chest]. <b>Your top is now transparent!</b>");
			AddLogEvent(msg, "passive", deltaT);
			pc.createStatusEffect("Bra Transparency");
			pc.upperUndergarment.onEquip(pc);
			pc.removeStatusEffect("Bra Transparency");
		}
		else if(!pc.isLactating() && pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_TRANSPARENT))
		{
			msg = ParseText("The dryness of your " + possessive(pc.upperUndergarment.longName) + " material is relieving. No longer sticking to your [pc.fullChest], the opaque garment now gives you a more modest appearance. <b>Your top is no longer transparent!</b>");
			AddLogEvent(msg, "passive", deltaT);
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
		/* Nada! */
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
		msg = "You’re pretty sure that your lactation is starting to slow down a little bit. If you don’t start milking yourself, you’ll eventually stop producing.", "passive";
		AddLogEvent(msg, "passive", 60 * numChanges);
		numChanges++;
	}
	
	if (pc.milkMultiplier < 80 && originalMultiplier >= 80)
	{
		msg = ParseText(" Low level tingles in your [pc.chest] remind you that producing [pc.milk] is something your body does, but if you keep ignoring yourself, you won’t for too much longer.");
		AddLogEvent(msg, "passive", 60 * numChanges);
		numChanges++;
	}
	
	if (pc.milkMultiplier < 70 && originalMultiplier >= 70)
	{
		msg = ParseText("You’re feeling pretty sore in your [pc.chest], but it’s not getting that much worse. <b>You’re pretty sure that you’re lactating less as a result of the inattention to your chest.</b>");
		AddLogEvent(msg, "passive", 60 * numChanges);
		numChanges++;
	}
	
	if (pc.milkMultiplier < 60 && originalMultiplier >= 60)
	{
		msg = ParseText("Your body’s ability to produce [pc.milk] is diminishing to the point where your [pc.fullChest] are barely making any more. It won’t take long before you stop production entirely.");
		AddLogEvent(msg, "passive", 60 * numChanges);
		numChanges++;
	}
	
	if (pc.milkMultiplier < 50 && originalMultiplier >= 50)
	{
		for(var x:int = 0; x < pc.bRows(); x++)
		{
			pc.breastRows[x].breastRatingLactationMod = 0;
		}
		msg = ParseText("Like a switch has been flipped inside you, you feel your body’s [pc.milk]-factories power down. <b>You’ve stopped lactating entirely.</b>");
		if(pc.milkFullness >= 75) 
		{
			msg += ParseText(" The swelling from your over-filled [pc.fullChest] goes down as well" + (pc.hasBreasts() ? ", leaving you with [pc.breastCupSize]s" : "") + ".");
			pc.milkFullness = 75;
		}
		AddLogEvent(msg, "passive", 60 * numChanges);
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
		msg = ParseText("The soreness in your [pc.nipples] is both persistent and pleasant in its own unique way. There’s no disguising how it makes your [pc.chest] practically glow with warmth.");
		AddLogEvent(msg, "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 30");
	}
	//40
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 40")) {
		msg = ParseText("Tingles run through your [pc.fullChest] every now and again. Your [pc.nipples] even feel moist. Perhaps you’ll start lactating soon?");
		AddLogEvent(msg, "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 40");
	}
	//50
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 50")) {
		msg = ParseText("A single droplet of [pc.milk] escapes from one of your [pc.nipples]");
		if(pc.isChestGarbed()) msg += ParseText(", staining your [pc.upperGarments] [pc.milkColor]");
		msg += ". <b>You’re lactating</b>, albeit slowly.";
		AddLogEvent(msg, "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 50");
	}
	//60
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 60")) {
		msg = ParseText("Judging by the feelings in your [pc.fullChest], you can safely say that you’re making [pc.milk] faster than before. Is that what");
		if(pc.hasPregnancy()) msg += " it feels like to be an expectant mother?";
		else msg += " expectant mothers feel like?";
		AddLogEvent(msg, "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 60");
	}
	//70
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 70")) {
		msg = "You’re pretty sure you’re lactating even more now. As a matter of fact, a scan by your codex confirms it. Your body is producing a decent amount of milk, perhaps a little under half its maximum capability.";
		AddLogEvent(msg, "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 70");
	}
	//80
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 80")) {
		msg = ParseText("Heat suffuses your chest, just another indication that your [pc.fullChest] have passed a new threshold of productivity. You’re definitely lactating harder.");
		AddLogEvent(msg, "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 80");
	}
	//90
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 90")) {
		msg = ParseText("There’s no doubt about how bountiful your [pc.fullChest] are feeling, swollen with potential just waiting to be milked out so that they can produce more. <b>You’re getting close to having your body as trained for lactation as possible.</b>");
		AddLogEvent(msg, "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 90");
	}
	//100
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 100")) {
		msg = ParseText("A wonderful, productive feeling swells in your [pc.fullChest], tingling hotly. A quick scan with your codex reports that your body is making [pc.milk] at its full capacity.");
		AddLogEvent(msg, "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 100");
	}
	//110
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 110")) {
		msg = ParseText("Somehow, your body is adapting to all the milking its been put through, and your [pc.fullChest] feel more powerful and fecund than ever before. Your chest is a well-trained milking machine.");
		AddLogEvent(msg, "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 110");
	}
	//125
	if(pc.hasStatusEffect("Pending Gain MilkMultiplier Note: 125")) {
		msg = ParseText("Your chest is practically singing in delight, and the only thing it sings about is [pc.milk] - rivers of never ending, liquid flows that will spill from you unceasingly. You have trained them to lactate as well as anything can be trained. If you want to make any more [pc.milk], you’ll have to grow your [pc.fullChest] bigger or turn to science.");
		AddLogEvent(msg, "passive", deltaT);
		pc.removeStatusEffect("Pending Gain MilkMultiplier Note: 125");
	}
}

/* Belly stuff! */

public function bellySizeUpdates(deltaT:uint = 0):void
{
	bodyPartUpdates("belly", deltaT);
}

/* Wiener stuff! */

// Append randomly to move events if possible (with small exhib gains):
public function priapismBlurbs():void
{
	if(!pc.hasStatusEffect("Priapism")) return;
	if(!pc.hasCock()) { pc.removeStatusEffect("Priapism"); return; }
	
	// Covers check
	if(!pc.isCrotchExposed(true))
	{
		AddLogEvent(ParseText("Your [pc.cockHeads] painfully push" + (pc.cocks.length == 1 ? "es" : "") + " against your [pc.crotchCover], with feral determination. <i>Ouch, that hurts!</i> You quickly yank off your [pc.crotchCovers] and sigh with relief as your hot maleness" + (pc.cocks.length == 1 ? " surges" : "es surge") + " outward, hard and bouncing in the breeze, unflappably erect with no signs of fading. <b>It looks like your case of priapism will prevent you from wearing almost anything there for the moment...</b>"), "passive");
		//Queue event to remove bits
		if(!pc.isCrotchExposedByArmor(true) || (pc.hasArmor() && !pc.isCrotchExposedByLowerUndergarment(true)))
			eventQueue.push( function():void { unequip(pc.armor, true); } );
		if(!pc.isCrotchExposedByLowerUndergarment(true))
			eventQueue.push( function():void { unequip(pc.lowerUndergarment, true); } );
		
		return;
	}
	
	if(rand(10) != 0) return;
	
	var msgList:Array = [];
	var msg:String = "";
	var pcLocation:String = getPlanetName();
	var cLength:Number = pc.biggestCockLength();
	var cumQ:Number = pc.cumQ();
	
	if(InShipInterior(pc))
	{
		// Ship - lowish exhib
		if(pc.exhibitionism() < 33)
		{
			msg += "Whew. At least your ship affords your priapic state some privacy";
			if(annoIsCrew()) msg += ", for the most part. You doubt Anno will mind";
			msg += ".";
			msgList.push(msg);
			msg = "";
		}
		// Ship high exhib
		if(pc.exhibitionism() >= 66)
		{
			msg += "Part of you is saddened that nobody can check out your priapic cock" + (pc.cocks.length == 1 ? "" : "s") + ", so proudly displayed.";
			if(crew(true) > 0) msg += " Then you remember you’re not the only one on your ship, and a wicked smile graces your features.";
			msgList.push(msg);
			msg = "";
		}
	}
	// Public:
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC))
	{
		// Low exhib & libido
		if(pc.exhibitionism() < 33 && pc.libido() < 33) msgList.push("You try to keep out of the way, your hips turned away from prying eyes. It doesn’t work very well.");
		// Any room/exhib
		msgList.push("You feel tremendously exposed.");
		// public
		msg += "Everyone you pass can see your [pc.crotch] on full display.";
		if(pc.isBimbo() || pc.isBro()) msg += " Hot.";
		msgList.push(msg);
		msg = "";
		// public
		msg += "A passerby strokes [pc.oneCock] on the way by, leaving you ";
		if(pc.isBimbo() || pc.isBro()) msg += "horny and disappointed. They never stick around!";
		else if(pc.exhibitionism() < 33) msg += "panting and confused.";
		else if(pc.exhibitionism() < 66) msg += "even more turned on and ready to go.";
		else msg += "disappointed that you won’t get to put on a show.";
		msgList.push(msg);
		msg = "";
		// Public, low exhibs
		if(pc.exhibitionism() < 33) msgList.push("You’re not sure if you can get used to the leering eyes and blushing faces.");
		// Public
		msgList.push("A passerby openly ogles you, winking when you catch them staring.");
		msgList.push("");
		// Public
		msgList.push("The synthetic ‘click’ of an unmuted Codex snapping a holo rouses your attention, but the pervert wisely hides before you can pinpoint their location. Sighing, you adjust your still-hard cock" + (pc.cocks.length == 1 ? "" : "s") + ".");
		// Mhenga
		if(pcLocation == "Mhen'ga")
		{
			msgList.push("Settlers give you odd looks in passing, eyes flicking over your exposed groin in curiosity and occasional delight.");
			msgList.push("The faint scent of honey thickens in the air when a zil passes by, eyeing you.");
			// Mhenga - sexed Flahne - not in her office
			if(flags["FLAHNE_SEXED"] != undefined)
			{
				if(flahneInOffice()) { /* In office */ }
				else msgList.push("Flahne whistles at you and waves on her way by. <i>“Looking good, sugar!”</i>");
			}
			// Mhenga Penny Cumslut Public
			if(pennyIsCumSlut() && flags["PENNY_HIDING_CUMSLUTTERY"] == undefined) msgList.push("Less people spend time checking out your ever-present than you would expect. Then again, ever since you taught Penny how to be a cum-slut, the settlement has gotten used to seeing a lot more dick.");
		}
		// Tarkus
		if(pcLocation == "Tarkus")
		{
			msg += "Raskvel girls (and even a few males) keep “accidentally” bumping into you and grabbing onto [pc.oneCock] for support before moving on.";
			if(pc.isBimbo() || pc.isBro()) msg += " How anyone comes to this planet and doesn’t waste a week banging slutty shortstacks into oblivion, you’ll never know.";
			msgList.push(msg);
			msg = "";
			msg += "A grinning raskvel maiden sneakily plants a smooch on the underside of [pc.oneCock] on her way by, fading into the crowd before you can identify her.";
			if(cumQ < 500) msg += "With how easily your pre drools, she likely got a taste as well.";
			else if(cumQ < 3000) msg += "With the heavy flows of pre you leak, she likely got a new coat of lipgloss for her effort.";
			else msg += "With the gobs of pre that keep spilling from you, she likely got a mouthful of liquid excitement for her trouble.";
			msgList.push(msg);
			msg = "";
			// Public - tarkus, 2+ legs
			if(pc.hasLegs()) msgList.push("A raskvel skims right between your [pc.legs], ears flapping along the delicate underside" + (pc.cocks.length == 1 ? "" : "s") + " of your [pc.cocks].");
		}
		// Myrellion
		if(pcLocation == "Myrellion")
		{
			msgList.push("The natives of Myrellion act like they’ve never seen " + (pc.cocks.length == 1 ? "a " : "") + "[pc.cocks] before. Inky onyx eyes follow you wherever you go.");
			msgList.push("Giggling myr women sneak peaks at your crotch whenever they think you aren’t looking.");
			msgList.push("Another visitor flashes you a thumbs up in response to your brazenly displayed package.");
			msg += "Myr cluster around wherever you go, murmuring among themselves. Pushing through the throng without getting groped is a challenge";
			if(pc.isBimbo() || pc.isBro() || pc.exhibitionism() >= 66) msg += " you’re happy to fail";
			msg += ".";
			msgList.push(msg);
			msg = "";
		}
		// New Canadia
		if(pcLocation == "Canadia Station")
		{
			msgList.push("Whispering voices follow you wherever you go: <i>“Look at that one, eh?”</i> <i>“Pervert...”</i> <i>“I bet it’s fake.”</i>");
			msgList.push("A deertaur canters by you, then stops to look back over her shoulder. Her tail flutters playfully. After a second, she winks at you and trots off, haunches upraised to display a moistening slit. Tease.");
			// New Canadia - lil dicks
			if(cLength <= 12) msgList.push("A moose-taur in the bright red uniform of New Canadia’s Peacekeeper force smirks casually as he checks out your [pc.cockBiggest]. <i>“Poor lil [pc.guyGirl].”</i>");
			// New Canadia - in the middle
			else if(cLength <= 24) msgList.push("A moose-taur in the bright red uniform of New Canadia’s Peacekeeper force chuckles as he stomps by. <i>“Foreigners...”</i>");
			// New Canadia - big dicks only
			else if(cLength <= 48) msgList.push("A moose-taur in the bright red uniform of New Canadia’s Peacekeepers nods approvingly as he gazes at your [pc.cockBiggest]. <i>“Not bad.”</i>");
			//New Canadia - hyper
			else msgList.push("A moose-taur in the bright red uniform of New Canadia’s Peacekeeper force recoils at the sight of your [pc.cockBiggest]. <i>“Pretty sure you need a permit for artillery like that.”</i> The quiet slap of his own dick smacking into his belly chases him as he trots off. More than once, he looks back longing.");
		}
		// NT
		if(pcLocation == "New Texas")
		{
			msgList.push("The poor cow-girls keep trailing off mid-conversation when they see you and your priapic shaft" + (pc.cocks.length == 1 ? "" : "s") + " passing by.");
			msgList.push("Leaky nipples stiffen in the wake of your crotch-exposing priapism. To those cow-girls, you must be quite the tease.");
		}
		// Public high exhib
		if(pc.exhibitionism() >= 66) msgList.push("You spot someone looking at your crotch and thrust it suggestively at them, all the harder for every set of eyes that fixes on your permanently engorged erection.");
		// bimbo
		if(pc.isBimbo()) msgList.push("It kind of looks like your awesomely erect cock" + (pc.cocks.length == 1 ? " is" : "s are") + " leading you around wherever you go, which is kind of how you like it, honestly.");
	}
	// Hazard
	if(rooms[currentLocation].hasFlag(GLOBAL.HAZARD))
	{
		// Hazard
		msgList.push("Was it really a good idea to go exploring with your [pc.cocks] hanging out, advertising your need for all to see?");
		// Hazard
		msgList.push("You’ll have to be on guard with how exposed you are.");
		// Hazard bro
		if(pc.isBro()) msgList.push("You know, maybe walking around with a rager is a great idea. Nothing to intimidate the locals like knowing some Grade A beef is on patrol and ready to claim the first ass to get in its way.");
		// Hazard bimbo
		msgList.push("Someone should like, make a pill you can take to have a boner all the time. And then dose the universe with it. Interspecies diplomacy is just a fancy phrase for finding your way into cute aliens’ pants anyhow. It’s wayyyy easier without the pants.");
		// Hazard
		msgList.push("You really hope an alien doesn’t take a cheap shot at your exposed genitalia.");
		// Mhenga
		if(pcLocation == "Mhen'ga")
		{
			msgList.push("You sweat so much from the humid jungle that your exposed, priapic member" + (pc.cocks.length == 1 ? "" : "s") + " gleam" + (pc.cocks.length == 1 ? "s" : "") + ".");
			msgList.push("You tread carefully, lest you slip on a vine and fall dick-first into a pit.");
		}
		// Tarkus
		if(pcLocation == "Tarkus")
		{
			msgList.push("You make damned sure to watch how you move around in this twisted landscape. The last thing you need is to scrape your rigid dick" + (pc.cocks.length == 1 ? "" : "s") + " against a rusty chunk of metal.");
			msgList.push("Your [pc.skin] feels almost greasy from traveling such a polluted area, visibly reflected in the oily shine of your [pc.cocks].");
		}
		// NT
		if(pcLocation == "New Texas")
		{
			msgList.push("Those varmints had best not view your still-hard cock as bait.");
			msgList.push("Maybe you should do this when you can wear something more substantial.");
		}
	}
	
	// Cuntsnake
	if(pc.hasTailCunt()) msgList.push("You bat your [pc.cuntTails] away from your exposed dick" + (pc.cocks.length == 1 ? "" : "s") + ".");
	// Cocktial
	if(pc.hasTailCock()) msgList.push((pc.tailCount == 1 ? "Your [pc.cockTail]" : "One of your [pc.cockTails]") + " arches up in sympathetic engorgement. Fortunately it isn’t as afflicted as the rest of you.");
	
	// Special
	var spList:Array = [];
	var select:int = -1;
	
	// public, high lust, high libido or bimbo, and high fullness
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && ((pc.lust() >= 66 && pc.libido() >= 66) || pc.isBimbo()) && pc.ballFullness >= 66) spList.push(1);
	// Bimbo
	if(pc.isBimbo()) spList.push(2);
	// Bro
	if(pc.isBro()) spList.push(3);
	
	if(spList.length > 0 && rand(10) == 0)
	{
		select = spList[rand(spList.length)];
		eventQueue.push( function():void {
		
		clearOutput();
		clearMenu();
		author("Fenoxo");
		
		msg = "";
		switch(select)
		{
			case 1:
				showBust("GALOTIAN");
				showName("SURPRISE\nBLOWJOB!");
				msg += ParseText("A giggling galotian grabs [pc.oneCock] before you can react, enshrouding it in slippery tightness. You’re too turned on and too backed up to do anything but groan and thrust into her velvety-soft goo, pleasure mounting into an explosive blast of backed-up [pc.cumNoun]. Again and again, you cum for the mystery slut, creating a ");
				for(var i:int = 0; i < 5; i++) { pc.orgasm(); cumQ += pc.cumQ(); }
				if(cumQ < 200) msg += "small";
				else if(cumQ < 500) msg += "big";
				else if(cumQ < 800) msg += "huge";
				else if(cumQ < 1000) msg += "baseball-sized";
				else if(cumQ < 3000) msg += "melon-sized";
				else msg += "mammoth";
				msg += ParseText(" [pc.cumColor] bubble inside her arm.");
				msg += "\n\nShe pops off and giggles, revealing the condom she slipped over your dick. <i>“Thanks! I needed a snack for the road.”</i> She winks and expertly extracts the stuffed prophylactic from your still-hard member, tying it off into a sealed balloon before pushing it into her belly.";
				if(cumQ >= 1000) msg += " She looks instantly, terrifically pregnant.";
				msg += " <i>“Here’s a " + (isAprilFools() ? "dogecoin" : "credit") + " for the trouble!”</i>";
				msg += "\n\nYou’re left staring at a single credit chit, still hard and a little leaky from the sudden sexual encounter.";
				if(flags["RECRUITED_CELISE"] != undefined) msg += " Celise would be so jealous.";
				processTime(5);
				pc.exhibitionism(1);
				pc.credits += 1;
				pc.lust(5);
				addButton(0, "Next", mainGameMenu);
				break;
			case 2:
				clearBust();
				showName("COCK\nSELFIE!");
				msg += "You snap a quick selfie of just you and your dick to save for later. It’s fucking hot, looking so turned on and <i>ready</i> all the time. Maybe you can jack off to it later.";
				processTime(1);
				pc.lust(5);
				addButton(0, "Next", mainGameMenu);
				addButton(1, "Look", pcAppearance);
				break;
			case 3:
				clearBust();
				showName("DICK\nPIC!");
				msg += "You snap a quick picture of your dick. Might as well while it’s nice and hard.";
				var dickpics:Array = [];
				if(flags["KIRO_BAR_MET"] != undefined) dickpics.push("Kiro");
				if(flags["MET_SHEKKA"] != undefined) dickpics.push("Shekka");
				if(flags["MET_PENNY"] != undefined) dickpics.push("Penny");
				if(flags["MET_EMMY"] != undefined) dickpics.push("Emmy");
				if(flags["MET_ANNO"] != undefined) dickpics.push("Anno");
				if(flags["MET_SYRI"] != undefined) dickpics.push("Syri");
				if(flags["SAEN MET AT THE BAR"] != undefined && flags["SAENDRA_DISABLED"] != 1) dickpics.push("Saendra");
				if(flags["RECRUITED_CELISE"] > 0) dickpics.push("Celise");
				if(dickpics.length > 0) msg += " As an afterthought, you send it to " + dickpics[rand(dickpics.length)] + ".";
				processTime(1);
				pc.lust(5);
				// CHECK APPEARANCE SCREEEN?
				addButton(0, "Next", mainGameMenu);
				addButton(1, "Look", pcAppearance);
				break;
		}
		output(msg);
		
		} );
	}
	// Generic
	else if(msgList.length > 0)
	{
		output("\n\n" + msgList[rand(msgList.length)]);
		if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) pc.exhibitionism(1);
	}
}

// Priapism stuff
public function applyPriapism(target:Creature = null):void
{
	if(target == null) target = pc;
	target.applyPriapism();
}
public function getCaughtWithPriapism():Boolean
{
	if(disableExploreEvents()) return false;
	if(!pc.hasCock()) { pc.removeStatusEffect("Priapism"); return false; }
	if(pc.isCrotchExposed(true) && !pc.isCrotchExposed()) return false;
	if(currentLocation == "SHIP INTERIOR") return false;
	if(InCollection(shipLocation, [currentLocation, rooms[currentLocation].northExit, rooms[currentLocation].eastExit, rooms[currentLocation].southExit, rooms[currentLocation].westExit])) return false;
	
	var cLength:Number = pc.biggestCockLength();
	var chances:int = 1;
	if(cLength <= 12) chances = 10;
	else if(cLength <= 18) chances = 8;
	else if(cLength <= 24) chances = 6;
	else if(cLength <= 36) chances = 4;
	else chances = 2;
	
	if(rand(chances) != 0) return false;
	
	clearOutput();
	clearBust();
	showName("PRIAPISM\nPROBLEMS...");
	author("Jacques00");
	
	var bMale:Boolean = (rand(2) == 0);
	
	output("Traversing around with your fully erect dick" + (pc.cocks.length == 1 ? "" : "s") + " out is quite daring for you, especially in a place where nudity is prohibited. Unexpectedly, from of the corner of your eye, you see a patrolling U.G.C. officer crossing your path... and just as you have your back turned to hide your exposed manhood" + (pc.cocks.length == 1 ? "" : "s") + ", " + (bMale ? "he" : "she") + " spots you!");
	output("\n\n<i>“You! Halt!”</i>");
	if(pc.isBimbo()) output("\n\nYou blush, a bit flustered and giggly inside while trying to skip your way in the opposite direction.");
	else if(pc.isBro()) output("\n\nYou act casual and straighten out your back to stride away in the opposite direction.");
	else if(pc.isNice()) output("\n\nYou sigh that your luck was so bad but try to nervously walk away in the opposite direction.");
	else if(pc.isMischievous()) output("\n\nYou curse under your breath. Despite your bad luck, you try to inconspicuously stride away in the opposite direction.");
	else if(pc.isAss()) output("\n\nYou audibly let out a curse and rapidly stomp your way in the opposite direction, hoping that the cop didn’t catch you.");
	else output("\n\nYou pretend not to see the police officer and proceed on your way in the opposite direction.");
	
	clearMenu();
	addButton(0, "Next", getFinedForPriapism, bMale);
	
	return true;
}
public function getFinedForPriapism(bMale:Boolean = false):void
{
	clearOutput();
	author("Jacques00");
	
	var isBimbro:Boolean = (rand(3) == 0);
	var cIdx:int = pc.biggestCockIndex();
	var cLength:Number = pc.cLength(cIdx);
	var cumQ:Number = pc.cumQ();
	
	showBust("UCG_" + (bMale ? "MALE" : "FEMALE") + "_" + (!isBimbro ? "1" : "2"));
	showName("PAY THE\nFINE...");
	
	output("<i>“I said, Stop right there!”</i>");
	if(hasGooArmorOnSelf()) output("\n\n<i>“Uh, oh... busted!”</i> [goo.name] cries.");
	output("\n\nNot wanting to cause a disturbance in public, or potentially get arrested, you stop in place.");
	output("\n\n<i>“Good. " + (!bMale && isBimbro ? "Like" : "Now") + ", hands up and turn around slowly...”</i>");
	output("\n\nYou do as the officer says by lifting your [pc.hands] and turning to face " + (bMale ? "him" : "her") + "... Your [pc.cocks] front and center.");
	
	if(!isBimbro)
	{
		output("\n\nThe officer has " + (bMale ? "his" : "her") + " palm on the hilt of " + (bMale ? "his" : "her") + " belt, ready to draw a weapon, but stops seeing as you are no immediate threat--despite the heat you are packing in your groin area...");
		output("\n\n<i>“Is there a problem, officer?”</i> you ask.");
		output("\n\n" + (bMale ? "He" : "She") + " pulls out a data slate. <i>“Indecent exposure in a public area. That’s a fineable offense, kid.”</i> The police" + (bMale ? "man" : "woman") + " replies, tapping a few buttons and signing a statement.");
		output("\n\n<i>“How--”</i>");
		output("\n\n<i>“Five thousand creds,”</i> " + (bMale ? "he" : "she") + " interrupts before you can even start. <i>“You can pay the fine or I can fill out an arrest form, understand?”</i>");
		if(pc.credits > 10000)
		{
			output("\n\nSeeing as you can foot the cost, you decide to pay the fine. Here’s to a dent in your funds...");
			output("\n\nThe officer smiles and waves " + (bMale ? "his" : "her") + " scanning device over your codex, taking the required funds. <i>“Thank you very much for your cooperation, uh, [pc.Mister] Steele. Just for that, I’ll keep this out of your permanent record.”</i>");
			
			pc.credits -= 5000;
		}
		else if(pc.credits > 5200)
		{
			output("\n\nYou can afford the cost, but it would set you back quite a lot. You decide to pay it anyway.");
			output("\n\nThe officer smiles and waves " + (bMale ? "his" : "her") + " scanning device over your codex, taking the required funds. <i>“Thank you for your cooperation, [pc.Mr] Steele. You seem like a responsible " + pc.mf("fellow", "lady") + " so I’ll keep this out of your permanent record, how’s that?”</i>");
			
			pc.credits -= 5000;
		}
		else if(pc.credits > 200)
		{
			output("\n\nYou tell the officer that you don’t have enough to pay the fine, hoping to get out of it cost-free.");
			output("\n\nThe officer furrows " + (bMale ? "his" : "her") + " brows, then continues, <i>“Ah, that’s too bad. Well, I’ll take what you have but leave you 200 creds behind and a very stern warning, how’s that?”</i>");
			output("\n\nSurprised by the sudden kindness, you agree to the deal. Even though the cost is high, you won’t be completely broke at least.");
			output("\n\n<i>“Alright, then it’s a deal.”</i> The officer waves " + (bMale ? "his" : "her") + " scanning device over your codex, taking all but 200 credits from your funds. <i>“Thank you for your cooperation, um, [pc.Mr] Steele. I’ve kept this off your permanent record but I highly advise that you do not repeat this offense in the future or the law may not be as forgiving.”</i>");
			
			pc.credits = 200;
		}
		else
		{
			output("\n\nWith a slanted frown, you tell the officer that you have " + (pc.credits > 0 ? "barely any" : "no") + " money left in your account to pay.");
			output("\n\nThe officer furrows " + (bMale ? "his" : "her") + " brows, then continues, <i>“A rusher without money, how does that work out? Listen, I’m not in the mood to play tough cop today, so I’m just going to let you off with a warning.”</i> Then after a few taps to cancel " + (bMale ? "his" : "her") + " report, " + (bMale ? "he" : "she") + " adds, <i>“No bookkeeping necessary, but I do require a scan for transport.”</i>");
			output("\n\nSurprised by the sudden act of kindness, you thank the officer for letting the offense slide and allow " + (bMale ? "him" : "her") + " to scan your codex for extra information.");
			output("\n\n<i>“It’s alright, [pc.Mister] Steele, U.G.C. doesn’t pay low-ranking cops like me much, so I know what it’s like to penny pinch for my family.”</i> " + (bMale ? "he" : "she") + " says. <i>“Just be sure to get a job or something out there. The Rush should be full of opportunities.”</i>");
		}
		output("\n\nAfter finishing the transaction, a hovering transport drone pulls up alongside the police officer. " + (bMale ? "He" : "She") + " pairs the scanned data to the drone and instructs you to step aboard. You do so, as exposed as you are, and your limbs are immediately fastened in place with restraints--as a matter of protocol, of course. The officer sits " + (bMale ? "him" : "her") + "self in front of you, pulls down the top and starts the engines. Soon, the both of you are traveling towards your parked ship.");
		output("\n\nThe drone slows and grounds itself once it reaches your ship. The top opens up and the officer slides out of the vehicle. The restraints are undone and you are escorted to your ship’s airlock while wrapped in a modesty blanket.");
		output("\n\nNow that you are in a more isolated location, the officer gives you a final parting. <i>“You’re lucky I was in a good mood--just don’t let it happen again, you hear?”</i> " + (bMale ? "He" : "She") + " then turns to leave as the airlock opens and you enter your ship. " + (bMale ? "He" : "She") + " sure handled your situtation with great professionalism.");
		output("\n\nOnce inside, your [pc.cock " + cIdx + "] pulses with mix of rebellion and embarrassment");
		if(cumQ > 500) output(" as it drools a line of pre-cum down your shaft");
		output(". How troublesome!");
	}
	else
	{
		if(bMale)
		{
			output("\n\nThe officer has his thick, burly arms crossed around his muscular, barrel chest. His casual expression shows that he obviously doesn’t perceive you as a threat at all. When he sees your [pc.cock " + cIdx + "], he gives an approving <i>“Hmph.”</i>");
			output("\n\n<i>“Is there a problem, officer?”</i> you ask.");
			output("\n\n<i>“Obviously,”</i> he answers. Pointing at your erection" + (pc.cocks.length == 1 ? "" : "s") + ", he continues, <i>“That--Some kinda S.T.D., or are you always in raging-boner mode?”</i>");
			output("\n\n<i>“Uh...”</i>");
			output("\n\n<i>“Hey, don’t play dumb with me,”</i> he says aloud as he closes in on you, your face meeting him eye-to-eye. After a moment, he glances side to side, then tilts his head in to whisper to you <i>“Now argue back.”</i> His brows raise. <i>“Don’t sweat it, just play along.”</i>");
			output("\n\nYou are struck with confusion but decide to go with it if it’ll get you out of trouble.");
			if(pc.isNice()) output(" <i>“Uh, oh... Oh no, a cop. What will you do--arrest me...?”</i> His face signals for you to be more offensive. <i>“Um, dumb pigs, am I right?”</i>");
			else if(pc.isMischievous()) output(" <i>“H-hey, a copper. What, you think you’re someone tough?”</i> He grins, urging you to keep it up. <i>“Pigs don’t scare me--go ahead, arrest me!”</i>");
			else output(" <i>“Get the fuck off me, damn pig!”</i> He grins in approval. You’re right on target. <i>“I’m not afraid to fight a cop, so keep it up, asshole!”</i>");
			output(" you shout audibly to no one you are aware of listening.");
			output("\n\n<i>“Damn right! Indecent exposure is a fineable offense, but for your smack-talk, I’m gonna have to send you off! How about that, huh?”</i>");
			output("\n\nThe two of you continue faux-arguing while he cuffs your hands behind your back and a hovering transport drone pulls up alongside the brutish police officer. He forecfully, yet carefully, shoves you into the vehicle with one hand, jumps in and slams the top down with the other. While inside, he continues shouting profanities and loudly revs the engine. The drone then sends the both of you towards the direction of your parked ship.");
			output("\n\nYou shake your head and look at him wide-eyed. <i>“What was that about?”</i>");
			output("\n\n<i>“Like I said, kid, don’t sweat it. You did great. Probably gonna impress the captain too.”</i> He seems very proud of himself. <i>“In my rank, I have to be extra tough to climb higher. Small tickets don’t matter--it’s all about the raw attitude in this business.”</i>");
			output("\n\n<i>“So you’re not going to fine me?”</i> you ask, starting to get the picture.");
			output("\n\n<i>“If you actually threw a punch, I would’ve had to, heh,”</i> he chuckles. <i>“I’ll let it slide... for now.”</i>");
			output("\n\nYour [pc.cock " + cIdx + "] throbs while your restrained limbs are helpless to do anything about it. Precum leaks from your [pc.cockhead " + cIdx + "], running down to the [pc.base " + cIdx + "].");
			output("\n\nThe officer turns to you and nods in understanding. <i>“Ah, been there. Just gotta keep fucking and jacking. It’ll pass,”</i> he advises. <i>“And " + (pc.cocks.length == 1 ? "put a cocksock on it" : "wear cocksocks") + " or something if you don’t want to get caught again--I might not be around to let you off the hook next time.”</i>");
			output("\n\nThe drone finally arrives near your ship and lands. The top opens and the officer athletically leaps out. He releases your locks, messily wraps you in a modesty blanket, and escorts you to your ship’s airlock.");
			output("\n\nAs you enter your ship, the officer turns to leave, giving you a thumbs up and shouting <i>“Good luck with the boner!”</i> then jumping back into the transport and speeding off. Though he manhandled you into a false play of power, he at least let you off free of charge.");
			if(pc.lust() < pc.lustMax()) output("\n\nWell, speaking of, all that physical contact must have done some work on your arousal since you do feel a little more turned on now...");
		}
		else
		{
			var bFits:Boolean = (pc.cThickness(cIdx) <= 24);
			
			output("\n\nThe officer has her hands placed on her very wide hips, tilting her body to one side, making her big bubble butt protrude outwards. Her overly inflated breasts cover her entire chest and strain the parted top of her uniform, creating a tight line of boob cleavage for all to see. Framing her head and draping over her shoulders is a mane of long, wavy hair, neatly tied into a pair of pig tails. On her rouge-blushed face, she is wearing a pair of tinted shades that cover her eyes, her glossy lips are equally as bloated as her tits, and her smooth jaw moves rhythmically to undeniably masticate some chewing gum.");
			output("\n\n<i>“Is there a problem, officer?”</i> you ask.");
			output("\n\nYou can’t tell where her eyes are directed, but she seemingly looks you up and down. Pursing her lips, she inflates her gum outwards and bites down on it, popping the bubble in her mouth. Her lips reverberate from the sudden burst of air and she resumes chewing. Removing her hands from her hips, she begins twirling her locks with one hand. Long-nailed fingers reach up and pull her shades off, revealing gem-colored eyes with extremely long, fluttering lashes. She blinks a couple times, then continues to examine you, eyes visibly fixated on your [pc.cock " + cIdx + "]. <i>“You got a license to carry that?”</i> She finally blurts, pointing at your obvious, raging erection" + (pc.cocks.length == 1 ? "" : "s") + ".");
			output("\n\nYour cock" + (pc.cocks.length == 1 ? " produces" : "s produce") + " a dollop of precum in response, throbbing just a little more in desire. <i>“Uh... no?”</i>");
			output("\n\nThe officer grins under her plump lips, pulls out her data slate, and proceeds to tap a few buttons on the display. <i>“That’s, like, totally a fine.”</i> She concludes, then waves her fingers toward your codex. <i>“Now gimme.”</i>");
			output("\n\nBefore you can ask how much you are being fined for, she quickly scans your device and yet no money is withdrawn from your account. Odd. Did she even charge you?");
			output("\n\n<i>“Now come with me to take your punishment, okay? You’ve been a bad, bad [pc.boy]!”</i> As she announces this, a hovering transport drone pulls up alongside the bimboish police officer. You follow her to the vehicle and she proceeds to restrain you to it in such a way, straddling herself this way and that in an erotic display, until you’re positioned with your back leaning against the seat, limbs fastened, and cock" + (pc.cocks.length == 1 ? "" : "s") + " jutting forwards. This does not seem like the standard restraining protocol...");
			output("\n\nThe officer hops on board in front of you, her round ass in your face as she seductively closes the top. Once the hatch is latched, she taps a few buttons on the console to get the engines revving and the drone lifts and hovers off towards your ship, cruising in auto-pilot mode.");
			output("\n\nResuming her flirtations with you, the officer lifts her legs to turn in your direction and they swiftly straddle your [pc.hips] like some kind of hungry hug monster. <i>“Like, where were we?”</i> She purses her lips. <i>“Oh yea, you’ve been naughty, haven’t you? Or at least...”</i> she gently runs her finger across the shaft of your [pc.cock " + cIdx + "], <i>“this one has...”</i> She licks her lips, adding more shine to her puckers and affectionately kisses your [pc.cockhead " + cIdx + "].");
			
			pc.lust(200);
			
			output("\n\nA tingle shoots through your shaft like lightning and your arousal spikes--what was that?! Your mind is clouded in a lusty haze as the law enforcer removes her top and cushions your shaft between her pillowy light yet rubbery tight breasts. Several points of contact are alight when she continues to");
			if(bFits) output(" swallow your dick in her mouth");
			else output(" make out with your extremely thick dick");
			if(pc.cocks.length > 1) output(", " + (pc.cocks.length == 2 ? "the other" : "your others") + " missing out on the fun");
			if(bFits) output(", slurping your length up and down with a perfect frequency");
			else output(", applying kiss marks all along your shaft");
			output(". She is such a cock slut!");
			output("\n\nYour arousal can only go so far and you are on the edge of tipping. You quickly reach climax but before you can cum, the cop clamps down on your [pc.base " + cIdx + "] and expertly swipes her tongue over your cumslit, wrapping your [pc.cockhead " + cIdx + "] in her chewing gum! When she finally releases her grip and gives you a final wet kiss on your shaft, you explode. [pc.CumColor] [pc.cumNoun] shoots into the makeshift condom, filling it");
			if(cumQ <= 200) output(" only slightly.");
			else if(cumQ <= 500) output(" up quite a bit.");
			else if(cumQ <= 1000) output(" up to almost full capacity.");
			else if(cumQ <= 3000) output(" to maximum capacity with seed.");
			else output(" up and inflating it well beyond its normal proportions...");
			if(pc.cocks.length == 2) output(" The same can’t be said about your other cock however, as it sprays its load all over the slut’s chest.");
			else if(pc.cocks.length > 1) output(" The same can’t be said about your other cocks however, as they spray their load all over the slut’s chest and thighs.");
			output("\n\nShe pops the condom off your shaft and the sensation triggers another mini orgasm, making you spurt a line of [pc.cumVisc] [pc.cumNoun] across her face. She licks off what she can with a lusty smile while holding the bubble over her head like an ornament. <i>“I think you’ve learned your lesson.”</i> She mashes a button on the console and the vehicle’s top flips open, showing that you’ve finally reached your destination after completing the blowjob session. She unlocks your restraints and your are free to exit. She forgets to hand you a modesty blanket, but you’re too flushed to consider asking.");
			output("\n\nAs you open your airlock, the policewoman wiggles her curvy bottom in her seat and blows you a fat kiss.");
			output("\n\n<i>“Catch you again sometime, babe?”</i> Her long-lashed eye winks at you.");
			output("\n\nYou " + (pc.isBimbo() ? "giggle" : "chuckle") + " to yourself, stepping inside your ship and wave back to her.");
			output("\n\nShe smiles and her drone’s top closes until she finally hovers off.");
			output("\n\nWhat a strange encounter");
			if(pc.exhibitionism() >= 66) output("... maybe you should go around with an exposed hard-on more often");
			output("!");
		}
	}
	output("\n\n");
	
	processTime((30 + rand(15)));
	if(isBimbro)
	{
		if(bMale) pc.lust(15);
		else pc.orgasm();
	}
	currentLocation = "SHIP INTERIOR";
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}


/* Clothing stuff */

public function clothingSizeUpdates(deltaT:uint = 0):void
{
	// Special stretchy clothes changes!
	//stretchBonusSexinessCheck(pc, deltaT);
	if(pc.lowerUndergarment is GabilaniPanties)
	{
		(pc.lowerUndergarment as GabilaniPanties).stretchUpdateCheck(pc,true);
	}
}
