import classes.Creature;
import classes.Items.Miscellaneous.BBQToGo;
import classes.Items.Miscellaneous.Kalocrunch;
import classes.Items.Miscellaneous.LargeEgg;
import classes.Items.Miscellaneous.MhengaMango;
import classes.Items.Miscellaneous.MyrNectar;
import classes.Items.Miscellaneous.SmallEgg;
import classes.Items.Miscellaneous.ZilHoney;
import classes.Items.Recovery.PexigaSaliva;
/*
Flags Key:

PIPPA_AFFECTION : Tracks Pippa's affection for Steele
	undefined - Steele has not met Pippa
	1-100 - Pippa's affection for Steele on a scale of 1 to 100
PIPPA_RECRUITED : Tracks whether Pippa has been made a crew member
	0/undefined - Pippa has not asked to be made a crew member
	-1 - Pippa has asked to join Steele's crew, but was turned down
	1 - Pippa has asked to join Steele's crew, and was welcomed aboard
	2 - Pippa joined the crew, but was kicked off (not currently possible)
PIPPA_FED : Tracks how many times Pippa has been given food
	undefined - Steele has not given Pippa any food
PIPPA_STANDARD_MASSAGE_RECIEVED : Tracks how many times Steele has recieved a standard massage from Pippa
	undefined - Steele has not recieved a standard massage from Pippa
PIPPA_SPECIAL_MASSAGE_RECIEVED : Tracks how many times Steele has recieved a special massage from Pippa
	undefined - Steele has not reieved a special massage from Pippa
PIPPA_HAPPY_ENDINGS - Tracks how many times Steele has gotten a happy ending from Pippa
	undefined - Steele has not gotten any happy endings from Pippa
PIPPA_SEXED - Tracks how many times Steele has had sex with Pippa
	undefined - Steele has not had sex with Pippa
PIPPA_ASS_FUCKED - Tracks whether or not Steele has fucked Pippa in the ass
	undefined/0 - Steele has not fucked Pippa in the ass
	1 - Steele has fucked Pippa in the ass
PIPPA_DOMINANCE - Tracks Pippa's dominance
	undefined/0 - Steele has not had sex with Pippa
PIPPA_TALKED_HER - Check if Steele has talked to Pippa about herself
	undefined/0 - Have not talked to Pippa about herself
	1 - Have talked to Pippa about herself
PIPPA_TALKED_YAMMI - Check if Steele has talked to Pippa about Yammi
	undefined/0 - Have not talked to Pippa about Yammi
	1 - Have talked to Pippa about Yammi
PIPPA_TALKED_REAHA - Check if Steele has talked to Pippa about Reaha (treated)
	undefined/0 - Have not talked to Pippa about Reaha
	1 - Have talked to Pippa about Reaha
PIPPA_NURU_TIMER - Timer for Pippa's email about Nuru massage
	undefined/0 - Affection not high enough to unlock nuru massage
	- Set to game time once affection is high enough
PIPPA_FLIRTED - Check if Steele has flirted with Pippa successfully
	undefined/0 - Have not
	1 - Have
*/
	
public function metPippa():Boolean
{
	return !(flags["PIPPA_AFFECTION"] == undefined);
}

public function recruitedPippa():Boolean
{
	return flags["PIPPA_RECRUITED"] >= 1;
}

public function pippaOnShip():Boolean
{
	return flags["PIPPA_RECRUITED"] == 1;
}

public function pippaRecruitTurnedDown():Boolean
{
	return flags["PIPPA_RECRUITED"] == -1;
}

// Handle displaying Pippa's name and bust
public function showPippa(naked:Boolean = false, oiled:Boolean = false):void
{
	if (!metPippa())
	{
		showName("\nPIG GIRL");
	}
	else
	{
		showName("\nPIPPA");
	}
	
	// if naked false, show normal, clothed bust
	// else if naked true and oiled false, show normal, naked bust
	// else if oiled true, show oiled, naked bust
	
	author("Ascent");
}

public const PIPPA_AFFECTION_MIN:int = 0;
public const PIPPA_AFFECTION_SEX:int = 25; // Starts offering sex (if not already available due to being treated) and begins calling Steele by first name
public const PIPPA_AFFECTION_MASSAGE:int = 35; // Unlocks nuru massage
public const PIPPA_AFFECTION_NAME:int = 50; // Pippa begins calling Steele by terms of endearment, minimum for her to request to join crew, regardless of other requirements
public const PIPPA_AFFECTION_CREW:int = 75; // Threshold for meeting one of the crew request requirements
public const PIPPA_AFFECTION_MAX:int = 100;

public function pippaAffection(addAffection:int = 0):int
{
	if (flags["PIPPA_AFFECTION"] == undefined) flags["PIPPA_AFFECTION"] = PIPPA_AFFECTION_MIN;
	
	flags["PIPPA_AFFECTION"] += addAffection;
	
	if (flags["PIPPA_AFFECTION"] > PIPPA_AFFECTION_MAX) flags["PIPPA_AFFECTION"] = PIPPA_AFFECTION_MAX;
	else if (flags["PIPPA_AFFECTION"] < PIPPA_AFFECTION_MIN) flags["PIPPA_AFFECTION"] = PIPPA_AFFECTION_MIN;
	
	if (flags["PIPPA_AFFECTION"] >= PIPPA_AFFECTION_MASSAGE && flags["PIPPA_NURU_TIMER"] == undefined && !pc.isTaur()) flags["PIPPA_NURU_TIMER"] = GetGameTimestamp();
	
	return flags["PIPPA_AFFECTION"];
}

public const PIPPA_DOMINANCE_MIN:int = 0;
public const PIPPA_DOMINANCE_DEFAULT:int = 50;
public const PIPPA_DOMINANCE_MAX:int = 100;

public function pippaDominance(addDominance:int = 0):int
{
	if (flags["PIPPA_DOMINANCE"] == undefined)
		flags["PIPPA_DOMINANCE"] = PIPPA_DOMINANCE_DEFAULT;
	
	flags["PIPPA_DOMINANCE"] += addDominance;
	
	if (flags["PIPPA_DOMINANCE"] > PIPPA_DOMINANCE_MAX) flags["PIPPA_DOMINANCE"] = PIPPA_DOMINANCE_MAX;
	else if (flags["PIPPA_DOMINANCE"] < PIPPA_DOMINANCE_MIN) flags["PIPPA_DOMINANCE"] = PIPPA_DOMINANCE_MIN;
	
	return flags["PIPPA_DOMINANCE"];
}

public function pippaCallsSteele():String
{
	if (pippaAffection() >= PIPPA_AFFECTION_NAME) return RandomInCollection("Honey", "Pumpkin", "Sweet Pea", "Sugar", "Cupcake", "Dumpling");
	else if (pippaAffection() >= PIPPA_AFFECTION_SEX) return pc.nameDisplay();
	else return "Steele";
}

public function pippaFed(addFed:int = 1):int
{
	if (flags["PIPPA_FED"] == undefined) flags["PIPPA_FED"] = 0;
	
	flags["PIPPA_FED"] += addFed;
	
	return flags["PIPPA_FED"];
}

public function pippaStandardMassageCost():int
{
	var baseCost:int = 250;
	
	if (pippaOnShip()) return baseCost / 2;
	else return baseCost;
}

public function pippaStandardMassagesGiven(addMassage:int = 1):int
{
	if (flags["PIPPA_STANDARD_MASSAGE_RECIEVED"] == undefined) flags["PIPPA_STANDARD_MASSAGE_RECIEVED"] = 0;
	
	flags["PIPPA_STANDARD_MASSAGE_RECIEVED"] += addMassage;
	
	return flags["PIPPA_STANDARD_MASSAGE_RECIEVED"];
}

public function pippaSpecialMassageCost():int
{
	var baseCost:int = 500;
	
	if (pippaOnShip()) return baseCost / 2;
	else return baseCost;
}

public function pippaSpecialMassagesGiven(addMassage:int = 1):int
{
	if (flags["PIPPA_SPECIAL_MASSAGE_RECIEVED"] == undefined) flags["PIPPA_SPECIAL_MASSAGE_RECIEVED"] = 0;
	
	flags["PIPPA_SPECIAL_MASSAGE_RECIEVED"] += addMassage;
	
	return flags["PIPPA_SPECIAL_MASSAGE_RECIEVED"];
}

public function pippaSexed(addSex:int = 1):int
{
	if (flags["PIPPA_SEXED"] == undefined) flags["PIPPA_SEXED"] = 0;
	
	flags["PIPPA_SEXED"] += addSex;
	
	return flags["PIPPA_SEXED"];
}

public function pippaHappyEndingsGiven(addHappyEnding:int = 1):int
{
	if (flags["PIPPA_HAPPY_ENDINGS"] == undefined) flags["PIPPA_HAPPY_ENDINGS"] = 0;
	
	flags["PIPPA_HAPPY_ENDINGS"] += addHappyEnding;
	
	return flags["PIPPA_HAPPY_ENDINGS"];
}

public function hasValidPippaFood():Boolean
{
	return pc.hasItem(new BBQToGo()) || pc.hasItem(new MyrNectar()) || pc.hasItem(new Kalocrunch()) || pc.hasItem(new LargeEgg()) || pc.hasItem(new MhengaMango()) || pc.hasItem(new PexigaSaliva()) || pc.hasItem(new SmallEgg()) || pc.hasItem(new ZilHoney());
}

// any non-transformative food items + some drinks
public const GIVE_BBQ:String = "give bbq";
public const GIVE_NECTAR:String = "give nectar";
public const GIVE_KALOCRUNCH:String = "give kalocrunch";
public const GIVE_LARGE_EGG:String = "give large egg";
public const GIVE_MANGO:String = "give mango";
public const GIVE_PEXIGA_SALIVA:String = "give saliva";
public const GIVE_SMALL_EGG:String = "give small egg";
public const GIVE_ZIL_HONEY:String = "give zil honey";
public const NEVERMIND:String = "nevermind"; // Back out of menu without changing anything using this

public function givePippaFoodMenu(func:Function):void
{
	clearMenu();
	
	var btnSlot:int = 0;
	
	if (pc.hasItem(new BBQToGo()))
	{
		addButton(btnSlot, new BBQToGo().shortName, func, GIVE_BBQ);
		btnSlot++;
	}
	if (pc.hasItem(new MyrNectar()))
	{
		addButton(btnSlot, new MyrNectar().shortName, func, GIVE_NECTAR);
		btnSlot++;
	}
	if (pc.hasItem(new Kalocrunch()))
	{
		addButton(btnSlot, new Kalocrunch().shortName, func, GIVE_KALOCRUNCH);
		btnSlot++;
	}
	if (pc.hasItem(new LargeEgg()))
	{
		addButton(btnSlot, new LargeEgg().shortName, func, GIVE_LARGE_EGG);
		btnSlot++;
	}
	if (pc.hasItem(new MhengaMango()))
	{
		addButton(btnSlot, new MhengaMango().shortName, func, GIVE_MANGO);
		btnSlot++;
	}
	if (pc.hasItem(new PexigaSaliva()))
	{
		addButton(btnSlot, new PexigaSaliva().shortName, func, GIVE_PEXIGA_SALIVA);
		btnSlot++;
	}
	if (pc.hasItem(new SmallEgg()))
	{
		addButton(btnSlot, new SmallEgg().shortName, func, GIVE_SMALL_EGG);
		btnSlot++;
	}
	if (pc.hasItem(new ZilHoney()))
	{
		addButton(btnSlot, new ZilHoney().shortName, func, GIVE_ZIL_HONEY);
		btnSlot++;
	}
	
	addButton(14, "Back", func, NEVERMIND);
}

public function pippaEatFood(food:String):String
{
	var response:String = "";
	
	switch(food)
	{
		case GIVE_BBQ:
			pc.destroyItem(new BBQToGo(), 1);
			response = "Pippa tears open the to-go box, and before you know it, there's nothing left but bones.";
			break;
		case GIVE_NECTAR:
			pc.destroyItem(new MyrNectar(), 1);
			response = "Pippa opens the thermos of myr nectar and knocks it back like it's a mere shot glass.";
			break;
		case GIVE_KALOCRUNCH:
			pc.destroyItem(new Kalocrunch(), 1);
			response = "Pippa eats through the kalocrunch bar in no time, leaving nothing but crumbs.";
			break;
		case GIVE_LARGE_EGG:
			pc.destroyItem(new LargeEgg(), 1);
			response = "Pippa quickly eats the large egg and licks her lips.  She looks quite refreshed.";
			break;
		case GIVE_MANGO:
			pc.destroyItem(new MhengaMango(), 1);
			response = "Pippa eats the mango so quickly that there's noticable juice spray.  Somehow, she seems sexier.";
			break;
		case GIVE_PEXIGA_SALIVA:
			pc.destroyItem(new PexigaSaliva(), 1);
			response = "Pippa looks at the pexiga saliva warily, but upon catching the sweet scent, drinks it in one gulp.";
			break;
		case GIVE_SMALL_EGG:
			pc.destroyItem(new SmallEgg(), 1);
			response = "Pippa pops the small egg in her mouth whole and swallows it down.";
			break;
		case GIVE_ZIL_HONEY:
			pc.destroyItem(new ZilHoney(), 1);
			response = "Pippa downs the vile of honey in the blink of an eye.  She looks more energetic.";
			break;
	}
	
	pippaAffection(4);
	pippaFed();
	
	return response;
}

// Handles text description for area outside of Pippa's house
public function approachingPippasHouse(btnSlot:int = 1):void
{
	if (!metPippa())
	{
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;

		output("\n\nTo the west you notice one of the houses has a sign that reads <i>“Professional Massages Available - Keep Yourself Warm”</i>.  The sign doesn't look very professional, despite its assurance, but you are curious, especially about that last part.  Besides, if it turns out to be something shady, you can handle yourself.");

		addButton(btnSlot, "Buzzer", meetPippa, undefined, "Buzzer", "Apparently this house gives massages that will help you keep warm.");
	}
	else if (recruitedPippa())
	{
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;

		output("\n\nTo the west is Pippa's house, now unoccupied.  The sign advertising her massage services is still up, but has been unprofessionaly scrawled over with a large <i>“X”</i>.")
	}
	else
	{
		flags["NAV_DISABLED"] = undefined;
	}
}

// Handles initial meeting with Pippa after pressing her house buzzer
public function meetPippa(itemGiven:String = ""):void
{
	clearMenu();
	
	// Function initially called
	if (itemGiven == "")
	{
		clearOutput();
		currentLocation = "PIPPA HOUSE";
		generateMap();
		removeUvetoCold();
		pippaAffection(10);
		processTime(3);
		showPippa();
		
		output("Your finger's hardly left the buzzer when the door swings open.  Standing on the other side of the door is a young woman who seems to have modded herself into a pig-morph.  Most notably, she has a pig's nose despite an otherwise human face.  She also has pig's ears and light pink skin.  You barely notice, but she also has a soft layer of sparse, [pippa.hairColor] hair covering her body.  It matches the color of her shoulder-length hair, which is, perhaps appropriately, partially tied into bun pigtails in the back.  She's a decent height, about five and a half feet tall.  She has a chubby body, her stomach poking out over tight, gray yoga pants, so stretched as to be almost transparent in the right light.  Despite her pudgy stomach, she maintains a curvy figure, with hips and an ass that are larger still.  Her thick, digitigrade legs end in cloven hoofs.  She has [pippa.breastCupSize] breasts, barely contained in a tight, white tank top that ends just above her belly button.  She has an excited look on her face, but upon taking you in, it quickly turns to disappointment.");
		
		output("\n\n<i>“Oh.  I'd been expecting someone bringing me food.  You are not here to bring me food.”</i>");
		
		output("\n\nYou give her your reasons for pushing the buzzer, ");
		
		if (pc.isBimbo() || pc.isBro())
		{
			output("<i>“Oh no, sorry!  I was just thinkin' a massage would feel real good.”</i>");
		}
		else
		{
			output("<i>“");
			
			if (pc.isNice())
			{
				output("Sorry.  ");
			}
			
			output("Your sign just caught my eye.  You give massages?”</i>");
		}
		
		output("\n\n<i>“Right.  I do give massages,”</i> she responds, as if she'd forgotten her own profession.  <i>“Come on in.”</i>");
		
		output("\n\nAs you follow her in, you see a curly little pig tail poking out of her pants, matching her other features.  You sit across from her in a standardly furnished room, but through a doorway you see a room with a massage table.  Having gotten in from the cold, she continues, <i>“I don't usually get much business; I think all of the Huskar around here are afraid of getting oil in their fur.");
		
		if (pc.isAss() && !(pc.isBimbo() || pc.isBro()))
		{
			pippaAffection(-5);
			
			output("”</i>");
			
			output("\n\nYou interject, <i>“Maybe it's because of your shoddy sign.”</i>");
			
			output("\n\nShe narrows her eyes at you briefly before continuing, ignoring your quip.  <i>“");
		}
		else output("  ");
		
		output("Anyway, it is nice to have a customer.  My name's Pippa, by the way.  And you are?”</i>");
		
		output("\n\n<i>“I'm [pc.name] Steele.”</i>");
		
		output("\n\nUpon hearing your name, she has a knowing look on her face, but doesn't say much, <i>“That so? Well, " + pc.mf("Mister", "Miss") + " Steele, about the massage.  I use a special oil that will help keep you warm in my massages.  My cost is " + pippaStandardMassageCost() + " credits.”</i> ");
		
		if (pc.isTreated())
		{
			output("  Before you can answer, she continues, <i>“But actually...you're Treated, aren't you?”</i>");
			
			if (pc.isBimbo() || pc.isBro())
			{
				output("\n\n<i>“Wow, you're so smart!  I totally am!”</i>");
				
				output("\n\nA lusty look begins to form on her face and she responds, <i>“That's what I thought.”</i>");
			}
			else
			{
				output("\n\n<i>“I am.  Is that a problem?”</i>");
				
				output("\n\nA lusty look begins to form on her face and she responds, <i>“Not at all.”</i>");
			}
			
			output("  She stands up and begins to move toward you.  <i>“How about we forget the massage for now, and instead, we fuck.  It's been too long since I got to have some fun with a sexy, treated slut.”</i>");
			
			pc.lust(10);
			pippaDominance(1);
			flags["PIPPA_FLIRTED"] = 1;
		}
	}
	else if (itemGiven != NEVERMIND) // If a String other than NEVERMIND is passed in, that should mean giving Pippa food
	{
		clearOutput();
		
		if (pc.isBimbo() || pc.isBro())
		{
			output("<i>“I have some food!  You want some?”</i>");
		}
		else
		{
			output("<i>“You know, I actually do have food on me, if you'd like some.”</i>");
		}
		
		output("\n\nShe responds excitedly, <i>“Really?  That's so nice, thank you!”</i> " + pippaEatFood(itemGiven) + "  <i>“That was delicious.  Now then, where were we?”</i>");
		
		pippaAffection(1); // Small boost to normal food affection for initial meeting
	}
	
	if (pippaFed(0) == 0 && hasValidPippaFood()) // PCs with valid food can give her some food on intitial meeting once
	{
		addButton(2, "Give Food", givePippaFoodMenu, meetPippa, "Give Food", "You have some food you could give Pippa");
	}
	
	if (pc.isTreated()) // Treated PCs can fuck her right away
	{
		addButton(0, "Fuck Her", pippaSexMenu, meetPippa, "Fuck Her", "Give Pippa what she wants.");
		addButton(1, "Turn Down", pippaRejectSex, itemGiven, "Turn Down", "Reject Pippa's proposition.");
	}
	else // And non-treated PCs can pay for a massage
	{
		if (pc.credits >= pippaStandardMassageCost())
		{
			addButton(0, "Massage", pippaStandardMassage, undefined, "Massage", "Try out one of Pippa's massages.");
		}
		else
		{
			addDisabledButton(0, "Massage", "Massage", "You don't have enough credits to afford a massage.");
		}
		
		addButton(1, "Turn Down", pippaRejectMassage, itemGiven, "Turn Down", "Don't get a massage right now.");
	}
}

// Displays the menu for having sex with Pippa
public function pippaSexMenu(func:Function):void
{
	clearMenu();
	
	// Bend her over and fuck her ass.  Must have cock greater than or equal to 10 inches
	if (pc.hasCock())
	{
		var longestCockIndex:int = pc.longestCockIndex();
		
		if (pc.cocks[longestCockIndex].cLength() >= 8)
		{
			addButton(0, "Ass Fuck", pippaFuckAss, undefined, "Fuck Her Ass", "Bend Pippa over and fuck her ass.");
		}
		else
		{
			addDisabledButton(0, "Ass Fuck", "Fuck Her Ass", "You don't have a cock big enough to reach through Pippa's massive ass.");
		}
	}
	else
	{
		addDisabledButton(0, "Ass Fuck", "Fuck Her Ass", "Bend Pippa over and fuck her ass. (Requires a cock.)");
	}
	
	// Bend her over and hot dog her.  Must have cock less than or equal to 4 thickness
	if (pc.hasCock() && !pc.isTaur() && flags["PIPPA_ASS_FUCKED"] == 1)
	{
		var smallestCockIndex:int = pc.smallestCockIndex();
			
		if (pc.cocks[smallestCockIndex].thickness() <= 4)
		{
			addButton(1, "Hot Dog", pippaHotDog, undefined, "Hot Dog", "Bend Pippa over and get off with Pippa's ass cheeks.");
		}
		else
		{
			addDisabledButton(1, "Hot Dog", "Hot Dog", "You need a thinner cock to get off with Pippa's ass cheeks.");
		}
	}
	else
	{
		addDisabledButton(1, "Hot Dog", "Hot Dog", "Bend Pippa over and get off with Pippa's ass cheeks. (Requires a cock and non-tauric body, as well as already having fucked her asshole.)");
	}
	
	// Pippa rides the player with her pussy
	if (pc.hasCock() || pc.hasHardLightEquipped())
	{
		if (!pc.isTaur())
		{
			addButton(2, "Get Ridden", pippaChooseCockToFuckPussy, undefined, "Get Ridden", "Let Pippa ride you with her pussy.");
		}
		else
		{
			addDisabledButton(2, "Get Ridden", "Get Ridden", "Let Pippa ride you with her pussy.  (Must not be a taur.)");
		}
	}
	else
	{
		addButton(2, "Get Ridden", pippaFuckPussy, undefined, "Get Ridden", "Let Pippa ride you with her pussy. (Requires a cock or hardlight-equipped underwear.)");
	}
	
	// Pippa will sit on the PC's face
	if (!pc.isTaur() && !pc.hasMuzzle() && !pc.hasBeak())
	{
		addButton(3, "Get Sat On", pippaGetSatOn, undefined, "Get Sat On", "Pippa will sit on your face and get herself off.");
	}
	else
	{
		addDisabledButton(3, "Get Sat On", "Get Sat On", "Pippa will sit on your face and get herself off. (Must not be a taur, have a muzzled face, or have a beak.)");
	}
	
	// PC straddles Pippa's lap while she drinks their milk
	if (pc.milkQ() >= 1000 && pc.isLactating() && !pc.isTaur())
	{
		addButton(4, "Feed Milk", pippaFeedMilk, undefined, "Feed Milk", "Feed Pippa with your tits.");
	}
	else
	{
		addDisabledButton(4, "Feed Milk", "Feed Milk", "You'll need to be a heavily lactating non-taur to give Pippa a personal feeding.");
	}
	
	addButton(14, "Back", func, NEVERMIND);
}

// For rejecting sex during initial meeting if PC is treated
public function pippaRejectSex(itemGiven:String = ""):void
{
	clearOutput();
	clearMenu();
	showPippa();
	pippaAffection( -5);
	pippaDominance(-1)
	
	output("Pippa's look of lust quickly turns to annoyance.  <i>“Seriously?  You're treated and you're turning down sex?”</i>");
	
	output("\n\nYou explain that you came in for a massage, ");
	
	if (pc.isBimbo() || pc.isBro())
	{
		output("<i>“Well, like, I was just thinkin' a massage sounded nice.”</i>");
	}
	else
	{
		output("<i>“Well, I came in for a massage.”</i>");
	}
	
	output("\n\nShe stares at you for a second before responding, <i>“You know what?  You can have your massage.  Another time.  For now, out.”</i>  She walks over to the door and opens it, gesturing toward the outside.");
	
	if (pippaFed(0) > 0)
	{
		output("  Her face softens slightly and she says, <i>“Thank you, again, for the food.”</i>");
	}
	
	addButton(0, "Leave", move, rooms[currentLocation].eastExit);
}

public const OIL_SOURCE_STANDARD_MASSAGE:String = "standard massage";
public const OIL_SOURCE_SPECIAL_MASSAGE:String = "special massage";

// Apply an "oil warmed" status effect for Pippa's massages
public function applyOilWarmed(target:Creature, source:String):void
{
	var desc:String = "";
	var duration:int = 1;
	
	if (source == OIL_SOURCE_STANDARD_MASSAGE) duration = 720;
	else if (source == OIL_SOURCE_SPECIAL_MASSAGE) duration = 1440;
	
	if(target == chars["PC"]) desc = "You're covered in warm, protective oil!";
	else desc = target.capitalA + target.short + " is covered in warm, protective oil!";
	desc += "\nFreeze resistance: +" + Math.ceil(MathUtil.LinearInterpolate(5, 15, duration / 1440)) + "%";
	
	if(!target.hasStatusEffect("Oil Warmed"))
	{
		
		target.createStatusEffect("Oil Warmed", 0, 0, 0, 0, false, "Icon_Water_Drop", "", false, duration, 0xFF7A59);
	}
	else
	{
		if (target.getStatusMinutes("Oil Warmed") < duration) target.setStatusMinutes("Oil Warmed", duration);
	}
}

// Pippa's standard massage scene
public function pippaStandardMassage():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	if (pc.isTaur())
	{
		output("\n\nPippa eyes you up and down and states, <i>“Well, I guess we won't be needing the massage table.  You kneeling will do.”</i>");
	}
	else
	{
		output("Pippa leads you to her massage table.");
	}
	
	output("  <i>“I'm going to go to another room and let you get");
	
	if (!pc.isNude()) output(" undressed and");
	
	output(" settled in.  Just give me a call when you're ready.”</i>");
	
	if (pippaSexed(0) > 0) output("  It seems weird, considering you've seen each other naked, to say the least, but it");
	else output("It");
	
	output(" seems she was serious when she put <i>“Professional”</i> on her sign.  With her now out of the room, you");
	
	if (!pc.isNude()) output(" strip completely nude and");
	
	if (pc.isTaur()) output(" kneel down");
	else output(" lay face down on the massage table");
	
	output(" and call her back in.  She reappears, now with a bottle of oil strapped to her waist.  You close your eyes and let her go to work.");
	
	output("\n\nThe massage is...well, it's more or less what you expect out of a massage.  Pippa starts on your");
	
	if (pc.isTaur())
	{
		output(" [pc.lowerBody], working oil into your [pc.hips] and [pc.legs], and of course, your [pc.ass], before moving onto your"); 
	}
	
	output(" upper body.  She works out all of your back muscles");
	
	if (pc.hasWings()) output(", paying special attention to the spots where your wings meet your back");
	
	output(".");
	
	if (!pc.isTaur()) output("  She moves onto your [pc.lowerBody], working oil into your [pc.legs].  Having covered your back, she has you flip over.");
	else output("  Your upper back and [pc.lowerBody] taken care of, she moves around to your front.");
	
	output("  On the front, she starts with your [pc.arms], but quickly moves onto squeezing and working her oil into your [pc.chest].  ");
	
	if (pc.isTaur()) output("Finally, ");
	else output("After, ");
	
	output("she gives some attention to your [pc.belly].");
	
	if (!pc.isTaur())
	{
		output("  Finally, she moves back to your [pc.lowerBody], focusing now on your [pc.thighs].");
		
		if (pc.hasGenitals())  output("  Her hands brush near your genitals, but never make contact.");
	}
	
	output("\n\nWhile the massage is standard in terms of routine, Pippa is quite talented with her fingers.  Her fingers are almost magic, dancing over your [pc.skin] and drawing out any and all fatigue and soreness.  Throughout the massage, you're driven into a relaxing bliss.  And the oil is also worth mentioning.  You feel warm and tingly everywhere she touches, as if you've been basking in the sun.  You're not even sure how much time has passed when Pippa finally removes her hands from you and states, <i>“Done.”</i>");
	
	output("\n\nYou open your eyes and ");
	
	if (pc.isTaur()) output("slowly stand up.");
	else output("slowly sit up.");
	
	pc.lust(20);
	
	if (pc.lust() >= 33 && pc.hasGenitals() && flags["PIPPA_FLIRTED"] == 1)
	{
		output("  You look at Pippa and she's smiling, with a lusty twinkle in her eye.  <i>“Maybe we aren't done.”</i>  You hadn't even noticed in your state of relaxation, but you've become quite aroused, ");
		
		if (pc.hasCock()) output("your [pc.cock] erect");
		if (pc.isHerm()) output(" and ");
		if (pc.hasVagina()) output("your [pc.pussy] wet");
		
		output(".  <i>“What do you say we take care of that?”</i>");
		if (pippaHappyEndingsGiven(0) == 0) output("  Well this is new.");
		
		addButton(0, "Turn Down", pippaHappyEndingReject, undefined, "No Happy Ending", "You're happy enough with just a massage.");
		addButton(1, "Hands", pippaHappyEnding, "hands", "Happy Ending", "Pippa will give you a happy ending using her hands.");
		addButton(2, "Mouth", pippaHappyEnding, "mouth", "Happy Ending", "Pippa will give you a happy ending using her mouth.");
		if (pc.hasCock() && !pc.isTaur()) addButton(3, "Tits", pippaHappyEnding, "tits", "Happy Ending", "Pippa will give you a happy ending using her tits.");
	}
	else
	{
		output("You look at Pippa and she's smiling.  <i>“Hope you enjoyed it, " + pippaCallsSteele() + ".  I'll leave you to get dressed.  Please take your time.”</i>");
		
		addButton(0, "Next", mainGameMenu);
	}
	
	processTime(30);
	applyOilWarmed(pc, OIL_SOURCE_STANDARD_MASSAGE);
	pippaStandardMassagesGiven();
	pippaAffection(1);
	pc.credits -= pippaStandardMassageCost();
	pc.HP(pc.HPMax() / 4);
	pc.energy(pc.energyMax() / 4);
	
	
}

// Handles all variations on Pippa giving the PC a happy ending after a standard massage
public function pippaHappyEnding(type:String = "hands"):void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	var genitalType:int;
	var penisIndex:int;
	var vaginaIndex:int;
	
	if (type == "tits") genitalType = 0;
	else if (pc.isHerm()) genitalType = rand(2);
	else if (pc.hasCock()) genitalType = 0;
	else genitalType = 1;
	
	if (pc.hasCock()) penisIndex = rand(pc.cocks.length);
	else if (pc.hasVagina()) vaginaIndex = rand(pc.vaginas.length);
	
	output("It's not exactly your idea of professional, but you certainly aren't going to turn down extending the massage to other areas of your body.  ");
	
	if (type == "hands")
	{
		output("Pippa smiles and rubs some of her massage oil into her hands, then quickly moves ");
		
		if (pc.isTaur())
		{
			if (genitalType == 0) output("under you");
			else output("behind you");
		}
		else output("next to your waist");
		
		output(".  She takes her hand and ");
		
		if (genitalType == 0)
		{
			output("slowly rubs oil all over your [pc.cock " + penisIndex + "] before gently wrapping her hand around it and gently stroking up and down.  ");
			
			if (pc.hasVagina() && !pc.isTaur())  output("With her other hand, she rubs oil into your [pc.pussy " + vaginaIndex + "], slips some fingers in, and begins finger fucking you.");
		}
		else
		{
			output("slowly rubs oil into your [pc.pussy " + vaginaIndex + "], slips some fingers in, and begins finger fucking you.  With her other hand, she ");
			
			if (pc.isTaur()) output("reaches under you and ");
			
			output("strokes your cock, rubbing oil into it at the same time.");
		}
	}
	else if (type == "mouth")
	{
		output("Pippa licks her lips and makes her way ");
		
		if (pc.isTaur())
		{
			if (genitalType == 0) output("under you");
			else output("behind you");
		}
		else output("next to your waist");
		
		output(".  She tentatively licks your ");
		
		if (genitalType == 0)
		{
			output("[pc.cock " + penisIndex + "] before taking ");
			
			if (pc.cocks[penisIndex].volume() <= 11) output("the whole thing");
			else output("as much as possible");
			
			output(" in her mouth.  While her lips stroke up and down your shaft, her tongue swirls around licking at and massaging every square inch it can reach.  ");
			
			if (pc.hasVagina() && !pc.isTaur()) output("Though her mouth is wrapped around your [pc.cockNoun " + penisIndex + "], her hands are free, and she uses one to gently rub and fuck your free [pc.pussyNoun " + vaginaIndex + "].");
		}
		else
		{
			output("[pc.pussy " + vaginaIndex + "] before devouring it entirely.  She sucks and licks all around, inside and out, getting at every square inch she can reach.  If you didn't know better, you'd think she was trying to literally eat your pussy.  While she tends to your [pc.pussyNoun " + vaginaIndex + "] with her mouth, she uses her free hand to gently stroke your [pc.cockNoun " + penisIndex + "].");
		}
	}
	else if (type == "tits")
	{
		output("Pippa slips her arms out of her tank top and begins to raise it up, but, rather than removing it, she leaves it wrapped around her [pippa.tits] like a mini tube top.  Her [pippa.breastsNoun] spill over the top and bottom of her make-shift wrap, creating an inviting passage underneath.  She takes some of her massage oil and rubs it into her dual cleavage, and, sticking her hand in, all throughout the [pippa.breastNoun] passage she's created.  She approaches you, holds her [pippa.breastsNoun] up over your [pc.cock " + penisIndex + "], and lowers her [pippa.breasts] down over it.  Your [pc.cockNoun " + penisIndex + "] surrounded by warm, soft, breast flesh, she begins moving up and down and wraps her arms around her chest, making the passage even tighter.");
	}
	
	output("\n\nWhether it's because of the oil, the state of relaxation you've been driven into, or some combination of the two, you're in a heightened state of arousal, and her ");
	
	if (type == "hands") output("hands are just as magical now as they were during the massage");
	else if (type == "mouth") output("tongue is just as magical as her hands were during the massage");
	else if (type == "tits") output("[pippa.breastsNoun] wrapped around your [pc.cockNoun " + penisIndex + "] are as magical as her hands were during the massage");
	
	output(".  Already you feel your body tightening up, and, as soon as it comes on, it releases.  Orgasmic bliss washes over you, ");
	
	if (type == "hands") output("coating Pippa's hand in");
	else if (type == "mouth") output("filling Pippa's mouth with");
	else if (type == "tits") output("flooding the valley of Pippa's [pippa.breastsNoun] with");
	
	output(" your ");
	
	if (genitalType == 0) output("[pc.cum]");
	else output("[pc.girlcum]");
	
	output(".  She just sits up, tilts her head,");
	
	if (type == "mouth") output(" swallows,");
	
	output(" smiles at you, and says, <i>“ I hope you'll come back again.”</i>");
	
	
	pippaHappyEndingsGiven();
	pippaAffection(1);
	pc.orgasm();
	processTime(5);
	
	addButton(0, "Next", mainGameMenu);
}

public function pippaHappyEndingReject():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("You inform Pippa that you're happy with just a massage, and she's fine with that, <i>“Want to keep the massage strictly professional, huh?  I can respect that.  I'll leave you to get dressed then.  Please take your time.”</i>");
	
	addButton(0, "Next", mainGameMenu);
}

// Pippa's nuru massage scene part 1
public function pippaSpecialMassage():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("Pippa smiles and requests, <i>“Give me just a little bit to prepare.”</i>  She walks away, but reappears a few minutes later, looking no different.  She leads you to her bed, and it's obvious what she was preparing.  Her bed is devoid of pillows or any typical bedding.  The mattress has been wrapped in what seems to be some sort of plastic sheet, shining with an oily gloss.  Towels are laid out all around the bed, and, rather than the bottle of oil that would be present at a normal massage, a bucket of oil sits on her nightstand.  <i>“Now then, let's get started.”</i>");
	
	output("\n\nPippa removes her clothes, not making a show of it, but not moving quickly either.  She first removes her constricting tank top, letting her [pippa.belly] and [pippa.breasts] free, and then pulls her tight yoga pants down over her [pippa.legs], unleashing her [pippa.ass].");
	
	if (!pc.isNude()) output("  Next she turns her attention to you, stripping you of all of your gear, and brushing her hands over your skin at every opportunity.");
	
	output("  With the both of you naked, she dips her hands in the bucket of oil and runs them down the sides of your body.  Her hands come to rest on your [pc.hips] and she says, <i>“You do me.”</i>  You dip your own hands into the oil and, its warmth already beginning to seep into you, you reciprocate, rubbing oil all over Pippa's body.");
	
	output("\n\nYou start by massaging it into each other's chests.  You run your hands over her [pippa.tits], gently squeezing and running your hands all around them.  As you do, a light flush begins to spread through her chest.  You stick your oiled up fingers into her inverted nipples, their hidden size obvious to the touch of your probing fingers.  As your fingers emerge, so do her nippes, hardening with the further flushing of her chest.  You fair about the same as she gives the same attention to you, rubbing the oil into your [pc.chest].");
	
	if (pc.isLactating()) output("  In your case, her massaging causes some of your [pc.milk] to dribble out and mix with the oil.");
	
	output("\n\nYou quickly finish oiling up your upper bodies and move onto your lower bodies.  Pippa does you first, running her hands around your thighs");
	
	if (pc.hasGenitals())
	{
		output(" and teasing you, barely brushing by your ");
		
		if (pc.hasCock()) output("[pc.cocks]");
		if (pc.isHerm()) output(" and ");
		if (pc.hasVagina()) output("[pc.vaginas]");
		
		output(", but never really touching them.  She leaves you waiting and moves on to oil");
	}
	else output(" before oiling");
	
	output(" up the rest of your [pc.legs].  Then she has you turn around, and grabs your [pc.ass].  But rather than rubbing oil into, she lets go after a moment, and you feel her [pippa.breasts] pressing into you.  She wraps her arms around your [pc.hips] and rubs her breasts up and down, dragging her nipples across your [pc.buttcheeks] and rubbing oil into them.  Your ass must be sufficiently oiled, because she draws away from you and ");
	
	if (pc.hasGenitals())
	{
		output("suddenly reaches under your legs, ");
		
		if (pc.hasVagina()) output("rubbing oil into your [pc.vaginas]");
		if (pc.isHerm()) output(", before ");
		if (pc.hasCock())
		{
			output("stroking oil into ");
			
			if (pc.hasCocks()) output("each of ");
			
			output("your [pc.cocks]");
		}
		
		output(".  Now that she's oiled you up, not to mention made you ");
		
		if (pc.hasVagina()) output("wet");
		if (pc.isHerm()) output(" and ");
		if (pc.hasCock()) output("hard");
		
		output(", she ");
	}
	
	output("stands up.");
	
	output("\n\nYou kneel down and reciprocrate in full, rubbing oil all over Pippa's [pippa.legs], but ignoring her [pippa.pussy].  ");
	
	if (pc.hasBreasts())
	{
		if (pc.biggestTitSize() < 19) output("Your [pc.tits] are quite a bit smaller than Pippa's but you still decide to use them ");
		else output("You use your [pc.tits] ");
		
		output("to rub oil into her [pippa.ass], just as she she did, enjoying it as much as when she did it to you");
		
		if (pc.isLactating()) output(", and leaving a mess of [pc.milk] all over her ass");
	}
	else
	{
		output("With your [pc.chest] lacking in tits, you use your hands to oil up Pippa's [pippa.ass].  You squeeze, and knead while you're at it, and even run your hand through her crack, teasing at her [pippa.asshole]");
	}
	
	output(".  You finish up, rubbing oil into her [pippa.pussyNoun] and running her [pippa.clit] through your fingers.  Now that you're both oiled up, heat radiates through you, and you're both rather flushed.  Pippa has you lay down on the bed face down.  ");
	
	if (pippaSpecialMassagesGiven(0) <= 3) output("Between the oil covering your body and the oil covering the bed, you nearly fall onto the floor twice trying to climb on.  This will take some getting used to.  ");
	
	output("  Once you're settled down on the bed, Pippa deftly climbs on top of your back.");
	
	pc.credits -= pippaSpecialMassageCost();
	processTime(15);
	pc.lust(30);
	
	addButton(0, "Next", pippaSpecialMassageII);
}

public function pippaSpecialMassageII():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("The massage truly starts, as she begins working on your back muscles, but now, the ministrations of her hands alternate with the feeling of her rubbing her [pippa.tits] all up and down your backside.  Sometimes she uses her tits and hands at the same time; as her hands work on your shoulders, you feel her [pippa.nipples] pressing into your lower back.  To work on your legs, she flips around, resting her [pippa.pussyNoun] on your back and her breasts on your ass.");
	
	output("\n\nTaking advantage of the slipperiness, Pippa easily flips you onto your back beneath her.  On your front, she starts with your [pc.arms].  She works on your arm muscles only briefly, relative to a normal massage, and then, in turn, lifts each arm and sticks it into the depths of her cleavage.  She runs wraps her [pippa.breasts] around each arm completely, and strokes up and down, breast fucking herself with each of your arms.  After she's done with your arms, she straddles your waist and works on your [pc.chestNoun], working out any and all stress in your pecs");
	
	if (pc.breastRows[0].breastRating() >= 4) output(", even through your large [pc.breastsNoun]");
	
	output(".  She slides down and lays flat on top of you, pressing her [pippa.tits] into your [pc.chest], and uses her hands to massage your shoulders.  Finished with your upper body, Pippa flips around and massages the fronts of your legs.  ");
	
	if (pc.hasGenitals())
	{
		output("As she does, her [pippa.tits] move over your [pc.hips], sometimes ");
		
		if (pc.hasCock()) output("leading to your [pc.cocks] running through her cleavage, ");
		else if (pc.hasVagina()) output("brushing her [pippa.nipples] over your [pc.pussy], ");
		
		output("a preview of the finale.");
		output("\n\n");
		
		if (pc.hasCock())
		{
			var cockIndex:int = pc.thickestCock();
			
			output("Pippa rights herself and straddles your hips.  She presses down, not letting you penetrate her, but trapping your [pc.cock " + cockIndex + "] flat between your body and her [pippa.pussy].  She grinds her [pippa.pussyNoun] over your [pc.cockNoun], slowly, but steadily.  Her aroused pussy lips are swollen up, enveloping your cock in wet, oily, warmth as she grinds.  After so much touching and teasing throughout the massage, you're both already close to your limits, flushed, sweaty, and panting.  She climaxes first, coating your cock in her juices.  Pushed over the edge, you splatter your [pc.belly] and [pc.chest] with your own [pc.cum].");
		}
		else if (pc.hasVagina())
		{
			output("Pippa rights herself, and locks her legs with yours.  She presses herself into your crotch, pressing her [pippa.pussy] into your [pc.pussies].  She begins grinding, slowly but steadily rubbing her [pippa.pussyNoun] against your [pc.pussies].  Her aroused, swollen pussy lips feel as good as you imagine her fingers might.  As she tribs, your pussies begin to feel like one wet, oily, hot mass of pussy flesh.  After so much touching and teasing throughout the massage, you're both already close to your limits, flushed, sweaty, and panting.  She hugs tight onto your leg, and you climax together, coating each other in the lusty mix of your juices.");
		}
	}
	else
	{
		output("She finishes up with your legs, finishing up with all of your body parts.  She doesn't look done however; she's flushed and sweating, and her breathing is heavy.  This massage may be a paid service, but she has certain expectations of it.  She rights herself and locks her legs with yours.  She presses her [pippa.pussy] into your bare crotch and, hugging your leg, begins grinding.  It doesn't do anything for you, but you let her have her fun.  Her pussy lips are swollen with arousal and you can feel them and her [pippa.clit] dragging over your skin.  After the teasing and touching throughout the massage, it doesn't take long for her to orgasm, coating your crotch in her juices.");
	}
	
	output("\n\nPippa collapses on top of you and just relaxes there for a little bit.  Eventually she climbs off and you carefully slide off after her.  She looks at you, her eyes tired, and says, <i>“I hope you enjoyed that, " + pippaCallsSteele() + ".  I'm going to clean up in here and take a shower.  And maybe a nap.  I'll see you later.”</i>");
	
	processTime(30);
	applyOilWarmed(pc, OIL_SOURCE_SPECIAL_MASSAGE);
	pippaSpecialMassagesGiven();
	pippaAffection(3);
	pc.HP(pc.HPMax() / 2);
	pc.energy(pc.energyMax() / 2);
	if (pc.hasGenitals()) pc.orgasm();
	
	addButton(0, "Next", mainGameMenu);
}

// For rejecting massage during initial meeting if PC is not treated
public function pippaRejectMassage(itemGiven:String = ""):void
{
	clearOutput();
	clearMenu();
	showPippa();
	pippaAffection(-5);
	
	output("Pippa looks a little annoyed.  <i>“That's too bad. I'll be here if you change your mind at some point.”</i>");
	
	if (pippaFed(0) > 0)
	{
		output("  <i>“Thanks again for the food.”</i>");
	}
	
	addButton(0, "Leave", move, rooms[currentLocation].eastExit);
}

// Description of entering Pippa's house
public function pippaHouseBonus(arg:String = ""):void
{
	removeUvetoCold();
	author("Ascent");

	output("You stand in Pippa's house, a welcome reprieve from the cold.  There's nothing too remarkable about the pig girl's house except for her massage table, visible in another room.  At the moment, she is " + RandomInCollection("eating", "eating", "massaging her hands", "lounging around", "doing yoga", "exercising her fingers") + ".");
	
	addButton(0, "Pippa", pippaMainMenu);
}

public function pippaMainMenu(arg:String = ""):void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	if (arg == "") output("You approach Pippa and she greets you, <i>“Hey, " + pippaCallsSteele() + ".  What're we getting up to today?”</i>");
	else if (arg != NEVERMIND) output("Pippa's eyes light up.  <i>“Food for me?”</i>  " + pippaEatFood(arg) + "  <i>“Thanks, " + pippaCallsSteele() + ".”</i>");
	
	addButton(0, "Appearance", pippaAppearance);
	
	addButton(1, "Talk", pippaTalkMenu);
	
	if (hasValidPippaFood()) addButton(2, "Give Food", givePippaFoodMenu, pippaMainMenu);
	else addDisabledButton(2, "Give Food", "Give Food", "You don't have any food to give Pippa.");
	
	if (flags["PIPPA_FLIRTED"] == 1)
	{
		if (pc.lust() >= 33) addButton(3, "Sex", pippaSexMenu, pippaMainMenu);
		else addDisabledButton(3, "Sex", "Sex", "You're not currently aroused enough for sex.");
	}
	else
	{
		if (pc.lust() >= 33) addButton(3, "Flirt", pippaFlirt);
		else addDisabledButton(3, "Flirt", "Flirt", "You're not currently aroused enough for sex.");
	}
	
	addButton(5, "Massage", pippaStandardMassage, undefined, "Standard Massage", "Get a massage from Pippa\n\nCost: " + pippaStandardMassageCost() + " Credits");
	
	if (MailManager.isEntryViewed("pippa_nuru") && !pc.isTaur()) addButton(6, "Nuru Massage", pippaSpecialMassage, undefined, "Nuru Massage", "Get a full, body-to-body massage from Pippa\n\nCost: " + pippaSpecialMassageCost() + " Credits");
	else addDisabledButton(6, "Locked", "Locked", "You'll have to get to know Pippa better for this and not be a taur.");
	
	addButton(14, "Leave", mainGameMenu);
}

// Bend Pippa over and fuck her in the ass
public function pippaFuckAss():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("At the moment, you can't keep your focus off of Pippa's gigantic ass.  ");
	
	if (pc.isTaur())
	{
		output("You'd love to grab hold of it, but, unable to reach it, you tell her to turn around and bend over.  You'll have to let your [pc.cocks] do all of the feeling.");
		
		output("\n\nShe smiles and giggles, <i>“You want my ass, huh?”</i>");
	}
	else
	{
		output("You move toward her and embrace her, your hands immediately going for her [pippa.ass].  She grabs the sides of your face and forces her tongue into your mouth as you squeeze and knead her ass.  As you make out with her and play with her butt, you feel your [pc.cocks] stiffening");
		
		if (pc.hasVagina())
		{
			output(" and your [pc.cunts] getting wet.");
		}
		
		output("  Her ass is as soft as it is huge.  It's easy to imagine getting lost in it.  You're so caught up in just feeling up her ass that you temporarily forget your plans to fuck it, but suddenly she breaks off the kissing and giggles, <i>“You really like my ass, huh?”</i>");
		
		output("\n\nNot even waiting for you to respond, Pippa places one hand in the middle of your [pc.chest] and pushes you back.");
	}
	
	output("  She turns her back to you and, as she bends over, slowly peels down her tight yoga pants and her skimpy thong.  Her ass pops free from her pants, even larger than you'd realized.  She lightly sways it back and forth like a pendulum, and right above, her curly little tail twirls in a complementing hypnotic spiral.  You can only stand mesmerized");
	
	if (pc.isTaur())
	{
		output(" as your [pc.cocks] stiffen");
		if (pc.cocks.length == 1) output("s");
		if (pc.hasVagina())
		{
			output(" and your [pc.cunts]");
			
			if (pc.vaginas.length == 1) output(" is");
			else output(" are");
			
			output(" soaked.");
		}
	}
	else
	{
		output(".");
	}
	
	var longestCockIndex:int = pc.longestCockIndex();
	
	output("  She picks up her panties, throws them at you and says, <i>“What are you waiting for, " + pippaCallsSteele() + "?”</i>  She bends back over, places her hands on the back of a chair and says, without looking at you, <i>“Take me.”</i>");
	
	output("\n\nYou quickly oblige, taking off your ");
	
	if(pc.isCrotchGarbed()) output("clothes");
	else output("gear");
	
	output(" and positioning yourself ");
	
	if (pc.isTaur()) output("over");
	else output("behind");
	
	output(" her.  For just a brief moment you rub your [pc.cock " + longestCockIndex + "] in between her [pippa.buttcheeks].  Then you start pushing through her cheeks and line your [pc.cock " + longestCockIndex + "] up with her [pippa.asshole].  Her asscheeks squeezing you already feels good enough that your precum is dripping and lubing up her hole.  You push further, spreading her hole around your [pc.cock " + longestCockIndex + "] and eliciting a lusty moan.  You slowly push in as far as you can, ");
	
	if (pc.balls > 0) output("your balls coming to rest on her ass.");
	else output("penetrating her up to the hilt of your [pc.cock " + longestCockIndex + ".");
	
	output("  Pippa's [pippa.buttcheeks] have swallowed up so much of the length of your [pc.cock " + longestCockIndex + "] that even hilted, ");
	
	if (pc.cocks[longestCockIndex].cLength() < 12) output("less than half of your length is actually in her asshole.");
	else if (pc.cocks[longestCockIndex].cLength() <= 15) output("hardly over half of your length is actually in her asshole.");
	else if (pc.cocks[longestCockIndex].cLength() <= 30) output("a large stretch of your length isn't even actually in her asshole.");
	else output("a noticeable stretch of your length isn't even actually in her asshole.");
	pc.cockChange();
	
	output("\n\nYou begin to move, pulling out till just your [pc.cockhead] remains in her asshole, before thrusting back in on repeat.  The substantial valley that is her ass crack provides a unique sensation, almost like getting a titjob and fucking an ass at the same time.  Meanwhile, Pippa is moaning and panting heavily.  You're pretty sure you even heard a few snorts.  ");
	
	if (pc.isTaur()) output("Thanks to a conveniently placed mirror on her wall, you're able to see her even though she's beneath you.  ");
	
	output("Through her tank top, you can tell her back is beginning to sweat.  ");
	
	if (pc.isTaur())
	{
		output("You ask her to remove her shirt, and she wordlessly does so.  Her [pippa.tits] and her [pippa.belly] fall free, swinging and jiggling  as you roughly fuck her ass.  Her back is flushed, a darker, redder shade of pink.");
		
		if (pc.biggestTitSize() >= 1)
		{
			output("  Unable to grab her ass, you find your hands moving up to your [pc.chest], squeezing them");
			
			if (pc.hasNipples()) output(" and pinching your [pc.nipples].");
			else output(".");
		}
		
		output("  Her flushed, jiggling body ");
		
		if (pc.biggestTitSize() >= 1) output("and the feeling of your hands groping at your [pc.chest] ");
		
		output("urges you on to fuck her harder.");
	}
	else
	{
		output("You yank her shirt up causing her [pippa.tits] and her [pippa.stomach] to fall free, swinging and jiggling as you fuck her ass.  Her back is flushed, a darker, redder shade of pink.  You give her a sharp spank on the ass, eliciting a squeal and a contracting asshole.  Her squeezing asshole and flushed, jiggling body urges you to squeeze her ass as you did earlier and fuck her harder.");
	}
	
	output("\n\nPippa's moaning and panting picks up before turning into full on squealing and snorting.  <i>“I'm so close, " + pippaCallsSteele() + "!  Feed my asshole with your cum!”</i>  Right as she finishes yelling, both her asshole and her cheeks squeeze on your [pc.cock].  Already barely hanging on, you give in and cum.  Your [pc.cum] squirts into her asshole, pushing her over the edge.  Her body quivers and her ass tightens even further, her hungry asshole milking your cock dry and painting her bowels with your [pc.cum].  After it's eaten every last drop, you pull your [pc.cock " + longestCockIndex + "] out till it plops free.");
	
	output("\n\nPippa slowly stands back upright and leans on you for a second, catching her breath.  ");
	
	if (pippaSexed() == 1)
	{
		output("<i>“You're really something, " + pippaCallsSteele() + ".  I hope that you'll stop by again sometime.  But for now, I need to get cleaned up.  Bye bye, for now.”</i>");
	}
	else
	{
		output("<i>“As good as always, " + pippaCallsSteele() + ".  I've gotta clean up, but I'll seeya later.”</i>  She walks off, but not before blowing you a kiss.");
	}
	
	pippaAffection(2);
	processTime(15);
	flags["PIPPA_ASS_FUCKED"] = 1;
	pc.orgasm();
	pippaDominance(-1);
	
	addButton(0, "Next", mainGameMenu);
}

// Use Pippa's ass cheeks to get yourself off
public function pippaHotDog():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("Pippa moves as close to you as can be and brings her [pippa.face] right up to yours, before stopping just short of kissing you.  You can feel her hot breath on your face as she whispers, <i>“I bet you want my ass again.”</i>  You respond with action and begin to reach around her body and grope her ass, but she stops you.  <i>“Now wait just a second.”</i>  She quickly removes her tight clothing, letting her jiggling curves free, then she removes your ");
	
	if(pc.isCrotchGarbed()) output("clothes");
	else output("gear");
	
	output(" as well.");
	
	var smallestCockIndex:int = pc.smallestCockIndex();
	
	output("\n\nHaving removed both of your clothes, Pippa again moves close to you, this time, turning her backside toward you.  She presses her [pippa.ass] into your crotch and begins to gently grind into you.  Your [pc.cocks] stiffen");
	
	if (pc.cocks.length == 1) output("s and becomes lodged firmly between her [pippa.buttcheeks].");
	else output(", especially your smallest [pc.cock " + smallestCockIndex + "], which has become lodged firmly between her [pippa.buttcheeks].");
	
	output("  As she continues to grind, you kiss her neck and reach around to play with her [pippa.tits].  Her large, normally inverted nipples emerge under the touch of your probing fingers, coming to stand at an inch in length and you feel her light moaning through your lips on her neck.  ");
	
	if (pc.biggestTitSize() >= 6)
	{
		output("Her back is arched, but still, it presses up against your [pc.chest]");
		
		if (pc.hasNipples()) output(", rubbing your [pc.nipples]");
		if (pc.isLactating()) output(", causing your [pc.milk] to dribble down her back");
		
		output(".");
	}
	
	output("\n\nYou feel strangely relaxed, locked together as you are with Pippa, almost like you could stand forever, lips on her neck, hands on her tits, and cock lodged in her ass crack, but she seems to be getting inpatient, pressing her ass harder into your crotch.  You reluctantly withdraw your hands from her [pippa.tits] and place one hand in the middle of her back, pushing her to bend her over a table.  You're treated to a view of her [pippa.ass], and before you know it, you've placed a hand on each cheek, groping at her ass like you were her tits.  You squeeze her [pippa.buttcheeks] around your [pc.cock " + smallestCockIndex + "], fucking it like a pair of massive tits.  Her ass is so large that ");
	
	if (pc.cocks[smallestCockIndex].cLength() < 14) output("your cock is completely lost in her ass.");
	else if (pc.cocks[smallestCockIndex].cLength() < 16) output("the head of your cock barely pops out the top of her ass crack.");
	else if (pc.cocks[smallestCockIndex].cLength() < 28) output("more than half of your length is wedged in her ass.");
	else output("a substantial length of your cock is wedged in her ass.");
	
	output("\n\nYou're completely lost in running your cock through Pippa's ass cheeks, fucking her cock-devouring, wobbling ass like it's nothing more than your sex toy when she looks over her shoulder at you and flatly asks, <i>“Now you're not thinking about my pleasure at all, are you?”</i>  ");
	
	if (pc.isAss())
	{
		output("You respond with a sharp smack on her ass, sending ripples across the surface.  She inhales sharply and moans,");
	}
	else
	{
		output("You feel a twinge of guilt and your [pc.cock " + smallestCockIndex + "] starts to soften, till she makes a noise almost like whining and says, <i>“Don't stop, please. ”</i>");
	}
	
	output(" <i>“To be honest, it turns me on.  Fuck my ass like it's your property, " + pippaCallsSteele() + "!  Get yourself off!”</i>  Having said that, one of her hands snakes between her legs and begins playing with her pussy.  From the squishing sound, you gather that she's soaked.  Spurred on, you fuck her ass cheeks with renewed vigor.  You manhandle her ass, wrapping it around your [pc.cock " + smallestCockIndex + "], roughly squeezing it, occasionally slapping it, and even pinching it");
	
	output("\n\nYou feel an all-too-familiar tightening in your loins, and as before, Pippa's moaning and breathing devolves into animalistic squealing and snorting.  You wrap her [pippa.buttcheeks] around your cock with all of your strength and climax, ");
	
	if (pc.cocks[smallestCockIndex].cLength() < 14) output("filling the valley of her ass with your [pc.cum].");
	else output("shooting your [pc.cum] all over her back and into the air, much of it coming back down onto her ass.");
	
	output("  Your climax dies down and you remove your cock from between Pippa's ass cheeks.  She collapses onto the table, still rubbing her pussy.  A bit of your [pc.cum] drips down onto her pussy and, perhaps, coincidentally, she shudders and reachers her own climax.  She sits quietly for a bit before almost whispering, <i>“I ");
	
	if (flags["PIPPA_HOTDOGGED"] == 1) output("still ");
	
	output("can't believe getting my ass used like that feels so good.  I'm just going to lay here for a bit, " + pippaCallsSteele() + ".  You can go ahead and get going.  I'll seeya later.”</i>");
	
	flags["PIPPA_HOTDOGGED"] = 1;
	pippaSexed();
	pippaAffection(2);
	processTime(20);
	pc.orgasm();
	pippaDominance(-2)
	
	addButton(0, "Next", mainGameMenu);
}

// Select a dick or hardlight strapon to fuck Pippa's pussy
public function pippaChooseCockToFuckPussy():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("Which cock do you want to fuck Pippa's pussy with?\n");
	
	var x:int;
	
	for(x = 0; x < pc.cockTotal(); x++)
	{
		output("\n" + (x + 1) + ": " + StringUtil.capitalize(pc.cockNounComplex(x)));
		addButton(x, StringUtil.toDisplayCase(num2Text(x + 1)), pippaFuckPussy, x);
	}
	
	if (pc.hasHardLightEquipped())
	{
		output("\n" + (x + 1) + ": Hardlight Strapon");
		addButton(x, StringUtil.toDisplayCase(num2Text(x + 1)), pippaFuckPussy, -1);
	}
}

// Let Pippa climb on top of you and ride your cock (or hardlight strapon) with her pussy
public function pippaFuckPussy(cockOrStraponIndex:int):void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("Pippa places one hand between her legs, gently rubs her pussy through her tight yoga pants, and says, <i>“You know, " + pippaCallsSteele() + ", I love having my ass played with, but sometimes my pussy needs some love too.  You think you can handle that?”</i>  You respond by moving closer to her and placing your [pc.hand] over hers.  She lightly kisses you and whispers, <i>“Good.”</i>  She guides you to her bed and has you lay down, but not before removing your ");
	
	if(pc.isCrotchGarbed()) output("clothes.");
	else output("gear.");
	
	output("\n\nWhile you get comfortably settled into Pippa's bed, she puts on a little show, slowly stripping out of her tight clothes.  First, facing toward you, she pulls her tank top up over her head, letting her [pippa.tits] and [pippa.belly] fall free.  She crosses her arms under her tits, cradling them.  Her big nipples are already erect, standing in the middle of her wide, brown-pink areola.  Next, still facing you, she bends over, and pulls down her yoga pants.  She shakes back and forth a bit, setting her giant boobs swinging.  Finally, she turns around while spreading her legs, treating you to an eyeful of her [pippa.ass] and her spread [pippa.pussyNoun], adorned with a tuft of blonde hair.");
	
	output("\n\nFinished with her show, Pippa climbs into bed after you, straddling you, before kissing you down your body.  She starts with a passionate kiss on your [pc.lips], followed by your neck, your [pc.chest], your navel, your inner thigh, and finally, ");
	
	if (cockOrStraponIndex == -1) output("she presses the activation for your hardlight cock, and plants a kiss right on its head");
	else output("she plants a kiss right on the [pc.cockHead " + cockOrStraponIndex + "] of your [pc.cock " + cockOrStraponIndex + "]");
	
	var cockLength:int =  cockOrStraponIndex == -1 ? -1 : pc.cocks[cockOrStraponIndex].cLength(); // cockLength only used if PC is fucking Pippa with cock
	
	output(".  She gently massages your shaft with her hands till you're fully erect.  She then moves back up your body, positioning her waiting, dripping [pippa.pussyNoun] above your [pc.cockOrStrapon " + cockOrStraponIndex + "].  You hold it in place for her, and give her a grin.  She returns your grin and slides her pussy down over you");
	
	if (cockOrStraponIndex == -1 || cockLength <= 10)
	{
		output(", completely enveloping your [pc.cockOrStrapon " + cockOrStraponIndex + "] inside of her, and bringing her full weight to bear on your hips.  ");
		
		if (cockOrStraponIndex >= 0) pc.cockChange(false, true);
		
		if (pc.tone <= 33)
		{
			output("Pippa is so heavy that you feel practically crushed beneath her, but the inside of her pussy is so warm and tight, that you can get past it");
		}
		else if (pc.tone <= 66)
		{
			output("You barely have the physique to support Pippa's wait on your hips, but the warm, tight pussy wrapping around your [pc.cockOrStrapon " + cockOrStraponIndex + "] makes it worth it");
		}
		else
		{
			output("Despite Pippa's weight, you can easily support her and fully enjoy the embrace of her warm, tight pussy");
		}
		
		output(".  She sits still for a moment, letting you both enjoy the feeling of you inside her");
		
		if (cockOrStraponIndex >= 0 && pc.cocks[cockOrStraponIndex].cType == GLOBAL.TYPE_SWINE)
		{
			output(".  It's almost like her pussy and your cock were made for each other; considering your current genetic makeup, maybe that's not so far from the truth.  She looks at you with ravenous eyes and begins moving, grinding");
		}
		else output(", before she begins moving.  She looks at you with ravenous eyes and grinds");
		
		output(" her hips into you, alternately increasing and decreasing the weight pressing on you.  The corkscrew - patterned ridges in Pippa's [pippa.pussyNoun] would feel amazing even if she weren't particularly talented, but she knows how to use more than just her hands to massage, squeezing and milking your cock with her tight pussy as she grinds; she's definitely been doing pelvic-focused exercises with those yoga pants of hers.  As she grinds on you, she gropes at her [pippa.tits], pinching and pulling on her [pippa.nipples].  She suddenly seizes up and shudders, squeezing your [pc.cockOrStrapon " + cockOrStraponIndex + "] like a vice.  You barely hold on.  Did she just orgasm?");
		
		output("\n\n<i>“I did,”</i> she answers your question.  <i>“Most would've been done after that, but I'm glad you held on, because I'm ready for round two, " + pippaCallsSteele() + ".”</i>  She plants her hands firmly on your [pc.chest] and, this time, begins bouncing up and down.  She massages your shaft with her pussy as she did before, but it's now even wetter, increasing the pleasure you feel.  As she bounces, her tits bounce with her, so much so they almost look as if they'll fly off any second now.  You reach around behind her to grab her ass, squeezing it, of course, but also using it as a grip to help spur on her bouncing.  You run one finger around her asshole and find it's opening up slightly like the good fuckhole it is.  You slip your [pc.finger] inside and she squeals in pleasure, digging her fingers into your [pc.chest]");
		
		if (pc.isLactating()) output(", and prompting [pc.milk] to dribble down your body");
		
		output(".  She's obviously nearing her second orgasm.  She leans down and begins kissing you, sloppily, almost like she's trying to devour your face.  You return her kiss, and up the intensity, probing her ass with your finger and bouncing her harder.  Her second orgasm hits sure enough, her ass squeezing your finger and her hot pussy clamping down on your [pc.cockOrStrapon " + cockOrStraponIndex + "].  This time, you join her, your own orgasm crashing over you like a wave.");
	}
	else
	{
		output(" as far as she can, devouring about 10 inches of your [pc.cock " + cockOrStraponIndex + "] before she reaches her limit.  You grab her thighs to help hold her up above your hips.  ");
		
		pc.cockChange(false, true);
		
		if (pc.tone <= 33)
		{
			output("Pippa is so heavy that you can only hope that you're actually contributing to holding her up.");
		}
		else if (pc.tone <= 66)
		{
			output("Pippa is quite heavy, but you're doing your part in helping to hold her up");
		}
		else
		{
			output("Despite Pippa's weight, you don't have much trouble helping to hold her up");
		}
		
		output(".  She immeditely begins moving up and down, slowly at first.  She runs her wet, corkscrew-ridged pussy up and down all 10 inches that she can fit inside her, just barely keeping your [pc.cockhead " + cockOrStraponIndex + "] inside at the peak of her movement before sliding back down.  As she slides, she squeezes and milks your [pc.cock " + cockOrStraponIndex + "] with her vaginal walls with skills befitting one who would call herself a masseuse.  As she slides along, massaging your shaft, she also massage her [pippa.tits], squeezing and twisting her pippa.nipples.  At the peak of one of her motions, she suddenly shudders and nearly falls on you, squeezing your [pc.cock " + cockOrStraponIndex + "] so hard that it pops out.  You almost lose it right there.  Did she just orgasm?");
		
		output("\n\n<i>“I did,”</i> she answers your question, <i>“but I'm sure glad you didn't.  I want to go again, " + pippaCallsSteele() + ".”</i>  She lifts herself back up and again impales herself on your [pc.cock " + cockOrStraponIndex + "].  She slides up and down even faster this time, leaving her slick pussy juice running down your shaft.  She takes advantage of her own juices, reaching beneath her to the portion of your cock not inside her, and massaging it with her hands.  Her surprising flexibility makes you think she's been putting those yoga pants of hers to good use.  With your hands occupied with holding her thighs for support, there's nothing you can do but sit back and enjoy the feeling, and sink your fingers further into her soft, plentiful thigh flesh.  The combination of both her hands and pussy stroking and massaging your shaft  brings you to the brink of climax, and you can tell that Pippa is nearing her second orgasm by her heavy breathing and her flushed, sweating chest.  Sure enough, she pushes herself down on your [pc.cock " + cockOrStraponIndex + "] as far as she can, releasing it from her grip, and barely placing her hands over yours for support before she climaxes again.  Her hot pussy rippling over 10, or perhaps more, inches of your cock pushes you over the edge and you join her, orgasm hitting you like a train.");
	}
	
	output("  Your ");
	
	if (cockOrStraponIndex >= 0)
	{
		output("[pc.cum] floods her womb, ");
		
		if (pc.cumQ() >= 200) output("most of it flowing right back out");
		else if (pc.cumQ() >= 75) output("much of it dripping right back out");
		else output("only a little bit dripping back out");
	}
	
	if (cockOrStraponIndex >= 0 && pc.hasVagina()) output(", and your ");
	
	if (pc.hasVagina())
	{
		output("pussy sprays [pc.girlcum] over her bed");
	}
	
	output(".");
	
	output("\n\nPippa slowly lifts herself off of your [pc.cockOrStrapon " + cockOrStraponIndex + "] and lowers herself to lay next to you, one arm draped across your chest.  <i>“That was good, " + pippaCallsSteele() + ".  I'm going to shower, so feel free to let yourself out.”</i>  She plants a kiss on your cheek and climbs out of the bed.  Big ass swaying, she walks away to the shower.");
	
	pippaSexed();
	pippaAffection(2);
	processTime(25);
	pc.orgasm();
	applyPussyDrenched(pc);
	pippaDominance(1)
	
	addButton(0, "Next", mainGameMenu);
}

// Let Pippa sit on your face (Part 1)
public function pippaGetSatOn():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("Pippa looks you up and down and emphatically states, <i>“Today, I'm going to use you for my pleasure");
	
	if (flags["PIPPA_HOTDOGGED"] == 1) output(", just as you've done with my ass");
	
	output(".  Understand?”</i>  You nod.  She grabs your hand and leads you to her massage table.  <i>“Take off your ");
	
	if (pc.isCrotchGarbed()) output("clothes");
	else output("gear");
	
	output(",”</i> she orders.  As you comply she lowers the massage table to a height that would allow her to comfortably sit on it.  <i>“Now lay down.”</i>  You again do as you're told.  She stands, looming over you, and, with no fanfare, quickly takes off her clothing.  She slightly bends over you and runs a finger around your [pc.lips].  She removes her finger and, without a word, takes a seat on your face such that she can look at you face to face.");
	
	output("\n\nPippa begins grinding her [pippa.pussy] into your face, but not before ordering, <i>“Lick.”</i>  You comply, though you imagine the grinding would feel good even without your active contribution.  Her pussy is already soaked, filling your mouth with ");
	
	if (silly) output("the taste of...is that bacon?!  <i>“I hope you like bacon grease.”</i>  Well, there goes your figure.");
	else output("her juices.  The taste is quite sweet, but you're pretty sure it isn't modded.");
	
	output("  She grabs the sides of your head and picks up her grinding a bit, moaning lightly.  <i>“Look at me with those " + pc.mf("handsome", "pretty") + " [pc.eyes], " + pippaCallsSteele() + ".”</i>  She holds your gaze, looking intently into your eyes.  The rest of your face is completely smothered by her.  She grinds her [pippa.pussyNoun] from your nose, all the way down to your chin, where you barely have time to breathe, smearing your face with her ");
	
	if (silly) output("bacon grease");
	else output("girl cum");
	
	output(".  You can barely see her eyes over her [pippa.tits], flushed with pleasure and beginning to lightly sweat.");
	
	output("\n\nYour senses are completely overwhelmed with Pippa.  Her jiggling body fills your field of vision.  You feel nothing but her warmth and wetness.  All you hear are her moans.  Her ");
	
	if (silly) output("smokey");
	else output("sweet");
	
	output(", intoxicating scent and taste flood your nose and mouth.");
	
	if (pc.hasGenitals())
	{
		output("  Actually, you do feel ");
		
		
		if (pc.isHerm()) output(" two");
		else output(" one");
		
		output(" other thing")
		
		if (pc.isHerm()) output("s");
		
		output(": your ");
		
		if (pc.hasCock()) output("[pc.cocks] stiffening");
		if (pc.isHerm()) output(" and your ");
		if (pc.hasVagina()) output("[pc.pussies] getting wet");
		
		output(".  It's tempting to reach down and pleasure yourself, but perhaps you should focus your efforts on Pippa.");
		
		addButton(0, "Focus", pippaGetSatOnFocus, undefined, "Focus on Pippa", "Put all of your focus into pleasing Pippa.");
		addButton(1, "Masturbate", pippaGetSatOnMasturbate, undefined, "Masturbate", "Attempt to pleasure yourself while Pippa rides your face.");
	}
	else
	{
		addButton(0, "Next", pippaGetSatOnFocus, undefined);
	}
	
	pippaSexed();
	pippaAffection(2);
	processTime(5);
	pc.lust(15);
	pippaDominance(1)
}

// Focus on pleasing Pippa while she sits on your face
public function pippaGetSatOnFocus():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("You decide to focus all of your efforts on Pippa, wrapping your arms around her thighs to pull her further into your face and intently driving your [pc.tongue] into her [pippa.pussy].  She squeals, and then coos, <i>“That's a good " + pc.mf("boy", "girl") + ", just like that.”</i>  With you pulling her into your face, she lets go of your head and begins to knead her [pippa.tits].  Rhythmically grinding into your face and playing with her breasts, Pippa shudders and soaks your face with her ");
	
	if (silly) output("grease");
	else output("pussy juice");
	
	output(".  Having climaxed, she removes your arms from her thighs and stands up, only to then reposition herself and again sit on your face, now facing the other direction.  <i>“I'm not done using you yet, " + pippaCallsSteele() + ",”</i> she explains.");
	
	output("\n\nThe way Pippa has positioned herself, your vision is completely obscured by her [pippa.ass], your nose is buried in the base of her [pippa.pussyNoun], and you're in the perfect position to lick her [pippa.clit].  You reach up around in front of her to grope at her breasts, eliciting a moan.  ");
	
	if (pc.hasGenitals() || (pc.hasBreasts() && pc.hasNipples()))
	{
		output("She softly speaks, <i>“I was thinking I should reward you for doing such a good job.”</i>  No sooner than the words have left her mouth, she reaches down and ");
		
		if (pc.hasGenitals())
		{
			if (pc.hasCock()) output("wraps one hand around your [pc.cock]");
			else output("places her hand on your [pc.pussy]");
			
			output(", placing the other on your [pc.chest] for support.  As she grinds, ");
			
			if (pc.hasCock()) output("she gently strokes your [pc.cock], using her fingers like she's trying to feel up every square inch");
			else output("she gently rubs your [pc.pussy] before sticking a few fingers inside and tenderly finger fucking you");
		}
		else
		{
			output("places her hands on your [pc.breasts].  She gently massages and squeezes them");
			
			if (pc.nippleLength() >= 5 || pc.hasNippleCocks() || pc.hasTentacleNipples())
			{
				output(" before wrapping her hands around your [pc.nipples] and softly stroking them up and down");
			}
			else
			{
				output(", softly pulling on and rubbing your [pc.nipples]");
			}
			
			if (pc.isLactating()) output(" and causing your [pc.milk] to dribble over her hands");
			
			output(".");
		}
		
		output(".  You leave your pleasure completely to her, and continue your efforts to make her cum again.  Following her lead, you");
	}
	else
	{
		output("She softly speaks, <i>“I'd like to reward you for doing such a good job, but...”</i>  You don't have a cock or a pussy of any sort, or even a sexy set of tits.  No matter; you're here to please her today.  You continue to");
	}
	
	output(" gently play with her nipples, and alternate between licking her clit and making out with her nether lips.");
	
	output("\n\nCompletely lost in Pippa's rhythm, you nearly forget to breathe.  Of course, her [pippa.ass] smothering your face doesn't help with the breathing.  If you weren't smothered, you'd doubtlessly be " + RandomInCollection("grunting", "panting", "moaning") + " along with Pippa's moaning.  You can't see her, but you imagine that she's more flushed than before, and you can feel the sweat in her cleavage.  You're not even sure how much time has passed, but what feels like too soon, your orgasms hit simultaneously, subdued, but powerful.  Pippa, once again slathers your face with her ");
	
	if (silly) output("savory grease");
	else output("sweet juices");
	
	if (pc.hasGenitals())
	{
		output(", while you ");
		
		if (pc.hasCock()) output("squirt [pc.cum] onto your body");
		if (pc.isHerm()) output(" and ");
		if (pc.hasVagina()) output(" spray [pc.girlcum] onto her massage table");
	}
	
	output(".");
	
	output("\n\nPippa climbs off of you and sighs, <i>“I'm already looking forward to the next time I get to use you, " + pippaCallsSteele() + ".”</i>  She leans down and kisses your cheek.  She winks at you and says, <i>“Be sure to clean yourself up,”</i> before leaving you to do just that.");
	
	pc.orgasm();
	applyPussyDrenched(pc);
	pc.girlCumInMouth(pippa);
	if (silly) output(pc.modThickness(10, true));
	processTime(10);
	pippaDominance(1)
	
	addButton(0, "Next", mainGameMenu);
}

// Attempt to masturbate while Pippa sits on your face
public function pippaGetSatOnMasturbate():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("You're so turned on you can't resist.  You reach past Pippa, down to ");
	
	if (pc.hasCock()) output("stroke your [pc.cockNoun]");
	else output("rub your [pc.pussyNoun]");
	
	output(" and in doing so, briefly let up on your licking.  Pippa doesn't let your lapse pass by unnoticed.  <i>“Now just what do you think you're doing?”</i>  She stands up and turns around to face you.  Looming over you, she chides you, <i>“So inpatient.  What a bad " + pc.mf("boy", "girl") + ".");
	
	if (pc.isAss()) output("  I suppose I shouldn't be surprised.");
	
	output("”</i>  She grabs your arms and moves them to your sides.  Then she quickly climbs back on top of you, now facing toward your [pc.legOrLegs], and uses her legs to pin your arms by your side.  <i>“Now let's try this again.”</i>");
	
	output("\n\nHaving sealed your movement, Pippa begins grinding on your face again, rougher than before.  If the massage table weren't soft, your head might be hurting.  You lick and suck on her [pippa.pussyNoun] as best as you can, but the rough movements make it difficult.  Unable to see anything beyond her [pippa.ass], you're startled when ");
	
	var gasped:Boolean = false;
	var gaspedString:String = "You lightly groan into Pippa's pussy, but the sound is muffled and you don't end up doing much more than vibrate your [pc.lips] and prompt her to speak, <i>“Did that hurt, " + pippaCallsSteele() + "?  I guess your vibrating mouth feels good either way.”</i>";
	
	if (pc.hasBreasts()) {
		output("you feel a sharp slap on your [pc.breasts], not enough to seriously hurt you, but enough to sting.  ");
		
		output(gaspedString);
		gasped = true;
		
		output("  She rains a few more light slaps on your breasts, moaning and grinding into your face all the while.");
	}
	
	if (pc.hasNipples()) {
		if (!gasped)
		{
			output("you feel fingers roughly grab your nipples and painfully pull on them.  ");
			
			output(gaspedString);
			gasped = true;
		}
		else
		{
			output("  Next she moves onto your nipples, roughly grabbing and pulling on them.");
		}
		
		output("  She continues to abuse your [pc.nipples], pinching and twisting them, and even flicking them a few times.  Judging by her ");
		
		if (silly) output("salty grease");
		else output("sweet pussy juice");
		
		output(" flooding your face, she's really getting off on this.");
	}
	
	if (pc.hasCock()) {
		if (!gasped)
		{
			output("she roughly grabs your [pc.cock] and strokes up and down, almost mashing it.  You can't deny that it feels a little good, but it also hurts.  ");
			
			output(gaspedString);
			gasped = true;
		}
		else
		{
			output("  Her next victim is your [pc.cock], which she roughly grabs and strokes, inducing both pleasure and pain.");
		}
		
		output("  She asks, <i>“You wanted to cum, didn't you?  Now's your chance.”</i>  She intently yanks her hand up and down your shaft, not getting any gentler.  You hear her spit and feel it land right in the path of her hand.  Lubed up from her saliva, the scale tips just enough toward pleasure that you pathetically cum.  As you do, she reacts quickly, squeezing on your cock and causing your [pc.cum] to dribble out over her hand.  You hear her clean her hand with her mouth after she removes it from your [pc.cockNoun].");
	}
	else
	{
		if (!gasped)
		{
			output("you feel a stinging slap on your [pc.pussy]");
			
			output(gaspedString);
			gasped = true;
		}
		else
		{
			output("  Her next victim is your [pc.pussy], to which she delivers a stinging slap.");
		}
		
		output("  She lightly slaps it one more time, before jamming her fingers inside and roughly finger fucking you.  She asks, <i>“You wanted to cum, didn't you?  Now's your chance.”</i>  She continues fucking you with her hooked fingers, causing both pleasure and pain.  As she fucks you, she roughly rubs your [pc.clit] with her palm.  Unable to help your self, you orgasm, spraying both her massage table and her hand with your [pc.girlcum].  You hear her clean her hand with her mouth after she removes it from your [pc.pussyNoun].");
	}
	
	output("\n\nSeemingly satisfied with punishing you, Pippa returns her focus to her pleasure.  She's already moaning and panting, and, clearly having enjoyed the punishment, it doesn't take much more of her grinding and your licking before she reaches a powerful climax and floods your face.  She continues to sit on your face while catching her breath.  She finally climbs off of you, freeing your arms and letting you see again.  She's sweating, and her whole body is deeply flushed.  ");
	
	if (flags["PIPPA_ABUSIVE_SAT_ON"] == undefined)
	{
		output("From the embarrased look on her face, you can't help but think the flush is from more than sexual pleasure.  She, almost sheepishly, speaks, <i>“Sorry about that, " + pippaCallsSteele() + ".  I might have gotten a bit carried away there.  But I won't deny I enjoyed it.  And you did cum.  Are we good?”</i>  Too tired to speak, you just nod.  <i>“Good.  I'll let you clean yourself up.”</i>  She leaves you to it.");
	}
	else
	{
		output("She pokes fun at you, <i>“You really enjoy being punished, don't you, " + pippaCallsSteele() + "?  If we do this too much, I might end up on a real mean streak.”</i>  She winks before continuing, <i>“I'll leave you to clean yourself up.”</i>  She gives you a quick peck on the cheek before leaving you to it.");
	}
	
	
	flags["PIPPA_ABUSIVE_SAT_ON"] = 1;
	pc.orgasm();
	applyPussyDrenched(pc);
	pc.girlCumInMouth(pippa);
	if (silly) output(pc.modThickness(10, true));
	processTime(10);
	pippaDominance(2)
	
	addButton(0, "Next", mainGameMenu);
}

// Feed Pippa milk straight from your breasts (Part 1)
public function pippaFeedMilk():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("Pippa hungrily eyes your [pc.tits] and speaks, <i>“");
	
	if (pippaFed(0) > 0) output("You know, " + pippaCallsSteele() + ", I appreciate when you feed me normal food, but I have a special request today.");
	else if (pippaAffection() >= PIPPA_AFFECTION_NAME) output("You never feed me any normal food, but maybe I could make a special request today?");
	else output("Could I maybe ask you to feed me?");
	
	output("”</i>  As if you didn't already know what she was getting at, she reaches for your chest and runs a finger around your [pc.nipplesNoun]");
	
	if (pc.isChestCovered()) output(" through your clothing");
	
	output(".  You grant her request, <i>“");
	
	if (pc.isBimbo()) output("If there's stuff that I love, it's totally fucking and getting drinken!");
	else output("I could certainly use a milking.");
	
	output("”</i>  She smiles excitedly and leads you to her bed, pulling off her tight clothes ");
	
	if (!pc.isNude()) output("and quickly pulling off your gear ");
	
	output("in the process. Once you're by her bed, she places a hand on your [pc.breastsNoun] and gives a soft, tentative squeeze, drawing just a little of your [pc.milk].  Her eyes, now positively voracious, follow the [pc.milkNoun] as it flows down your body and she licks her lips, leaving a visible sheen of saliva.  Nonetheless, she withdraws her hand and sits down on the edge of the bed, patting her lap.  <i>“Sit.”</i>");
	
	output("\n\nYou take a seat on Pippa's comfy lap, straddling her and bringing your [pc.breasts] level with her face.  Pippa slowly brings her mouth to your right [pc.nippleNoun] and pauses for a moment, letting you feel her hot, heavy breathing.  She wraps her plump lips around the nipple and gently runs her wet tongue around it, savoring the moment like some kind of breastfeeding connoisseur.  After what seems like an eternity of teasing, she sucks, drawing a stream of [pc.milk] down her throat.  And then she lets go again and looks you in the eyes.  <i>“Mmm, your [pc.milkNoun] is so delicious, " + pippaCallsSteele() + ".");
	
	if (pc.isTreatedCow()) output("  Especially since it's treated.");
	
	output("”</i>  Tired of her teasing, you grab the back of her head and push her face into your [pc.breastNoun].  She giggles and finally, really digs in.  Her lips and tongue slide all around your [pc.nippleNoun], drawing a torrent of [pc.milk] from your [pc.breasts], and the insatiable pig slut greedily swallows every last drop.");
	
	output("\n\nYou notice that, while feeding from you, Pippa has snaked a hand down between her legs and is rubbing her pussy.  She, of course, isn't the only one who's turned on.  ");
	
	if (pc.hasCock())
	{
		output("Your [pc.cock] is sandwiched between your bodies");
		
		if (pc.cocks[0].cLength() >= 12) output(" and nestled into her [pippa.tits]");
		
		output(".  ");
	}
	if (pc.hasVagina())
	{
		output("Your [pc.pussy] is soaked, your [pc.girlcum] surely mixing with Pippa's as she masturbates.  ");
	}
	
	output("The position you're in is great for feeding, but not so great for getting off at the same time.  From her squirming, you think Pippa might be getting the same idea.  You could take control and set the pace, but she likely will if you don't.");
	
	addButton(0, "Take Control", pippaFeedMilkTakeControl, undefined, "Take Control", "Take control of this feeding.");
	addButton(1, "Let Pippa", pippaFeedMilkHerControl, undefined, "Let Pippa Take Control", "Let Pippa handle this feeding.");
	
	processTime(10);
	pc.lust(15);
}

// Take control of the breastfeeding session with Pippa
public function pippaFeedMilkTakeControl():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("Taking action, you push Pippa down onto the bed and flip your positions so that she's on top.  You sit back up and lay her across your lap in a classic breastfeeding position.  Your [pc.nippleNoun] having slipped from her mouth during the repositioning, she jokes, <i>“I'm a bit big to baby, don't you think?”</i>  With one hand you reach down between her legs and run her [pippa.clit] between your fingers and she moans, <i>“I guess this isn't exactly babying.”</i>  With your right [pc.breastNoun] practically drained already, you take the opportunity to switch, and move Pippa's mouth to your left [pc.nippleNoun].");
	
	output("\n\nPippa latches onto your nipple like her life depends on it.  The way her tongue moves over and around your [pc.nipple], it's like she was born to massage with whatever appendage possible.  Her hands move to your other breast, rubbing, squeezing, and teasing out any [pc.milkNoun] that she may have missed with her mouth.  Despite the fact that Pippa completely gorged herself, your [pc.breasts] are bountiful, and [pc.milk] squirts out, running down your body and Pippa's arms, and splattering her chest.  In response, you can feel her [pippa.pussyNoun] getting even wetter.  You wipe some of your [pc.milkNoun] up with your hand, and rub it into her warm pussy.  Sticking a finger inside, you mix your [pc.milkNoun] and her pussy juices together, finger fucking her to the rhythm of her nursing.  All at once, her pussy clamps down on your finger and her mouth, almost painfully, clamps down on your [pc.nippleNoun].  Shudders run through her body and she moans into your breast, trying not to let go.  She comes down from her orgasmic high, and you pet the side of her head with your cleaner hand, gently rustling her hair.  She looks you in the eyes, and resumes sucking.");
	
	if (pc.hasCock())
	{
		output("\n\nPippa may have orgasmed, but you're harder than ever, your [pc.cock] nestled up against her head.  You lube your [pc.cockNoun] up with the erotic mixture of girl cum and [pc.milkNoun] already coating your hand and begin to masturbate.  Getting both your [pc.cockNoun] and [pc.breastsNoun] milked at the same time, you know you won't last long, but you gently, steadily, run your wet hand up and down your shaft nonetheless.  You feel your loins tightening and your orgasm bubbling up, your hand wrapped around you [pc.cockNoun] and Pippa's plump, soft lips wrapped around your erect [pc.nippleNoun].  You cross the threshold, and your [pc.cum] spurts out, getting in Pippa's hair, and even on her face.  She just ignores it; your [pc.breasts] aren't empty quite yet.");
	}
	else if (pc.hasVagina())
	{
		output("\n\nPippa may have orgasmed, but you're wetter than ever, her hanging hair brushing up against and tickling your [pc.pussy].  You rub the erotic mixture of girl cum and [pc.milkNoun] still coating your hand into your [pc.pussyNoun] and begin to masturbate.  You hand rubbing your [pc.pussyNoun] and Pippa's tongue rubbing around your sensitive [pc.nippleNoun] at the same time, you know you won't last long, but you rub and finger onward.  You feel your loins tightening and your orgasm bubbling up, your fingers probing your wet, warm depths, and Pippa's wet, soft tongue probing at your erect [pc.nippleNoun]  You cross the threshold, and your [pc.girlcum] spurts out, soaking Pippa's bed and a few loose strands of her hanging hair.  She surely felt your shuddering, but continues her sucking, determined to drain your [pc.breasts] and fill her stomach.");
	}
	
	output("\n\nThe rest of the breastfeeding session goes by slowly, but not in a bad way; you're very relaxed as Pippa slowly, rhythmically, drains you.  It's a weird thought, but it almost is like you're babying her.  She even now has her eyes closed, seemingly as relaxed as you.  She, however, really can use that tongue of hers.  It's unclear if she's trying to make you feel good, or if it's simple instinct, but it feels as if she's trying to get you off with just her tongue on your [pc.nipple].  ");
	
	if (pc.hasGenitals())
	{
		output("If you hadn't just brought yourself to orgasm, you're sure that she would have.");
	}
	else
	{
		output("Whether or not it's what she's trying to do, she's succeeding.  As the pressure in your [pc.breasts] drops, the pressure in your loins builds.  Your whole body tightens up, and all at once, releases its tension, shudders running through it.");
	}
	
	output("\n\nFinally, Pippa is either full, or believes she's drained you.  She releases your [pc.nippleNoun], wordlessly sits up and puffs up her cheeks as if to indicate her mouth is full.  You get the idea and open your mouth, and she leans over, locks her lips with yours, and spits some of your [pc.milk] into your mouth.  You savour your own taste shortly, and then swallow.  She just smiles, then leans over again to give you a proper kiss.  <i>“Thanks for the meal, " + pippaCallsSteele() + ".  I need to shower...and probably do laundry.  I'll see you later.”</i>");
	
	pc.orgasm();
	pc.milked(pc.milkFullness);
	processTime(15);
	pippaDominance( -1);
	if (pc.hasVagina()) applyPussyDrenched(pc);
	if (pc.hasCock()) applyCumSoaked(pc);
	
	addButton(0, "Next", mainGameMenu);
	
}

// Let Pippa take control of the breastfeeding session
public function pippaFeedMilkHerControl():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("You do nothing, letting Pippa continue to nurse for a brief time, before she pulls you down onto the bed and flips your positions so that she's on top.  She straddles your [pc.leg] and, having removed your [pc.nippleNoun] from her mouth during the transition, she declares, <i>“Now this, I can work with.”</i>  She lightly wiggles her hips back and forth, and runs her fingers around your [pc.nipples], evidently excited.  Having already drained your right [pc.breastNoun], she takes the opportunity to switch, latching her mouth onto your left [pc.nippleNoun].");
	
	
	output("\n\nPippa sucks almost roughly, like there's no tomorrow.  The way her tongue moves over and around your [pc.nipple], it's like she was born to massage with whatever appendage possible.  Contrasting and alternating with her soft tongue are her teeth, nibbling at your [pc.nippleNoun] not quite enough to hurt, but certainly not gently.  Her hands move to your other breast, twisting, pinching, and teasing out any [pc.milkNoun] that she may have missed with her mouth.  Despite the fact that Pippa completely gorged herself, your [pc.breasts] are bountiful, and [pc.milk] squirts out, running down your body and Pippa's hands.  You can feel Pippa's warm, wet pussy on your [pc.leg], and soon enough, she begins grinding her hips, rubbing herself on your [pc.legNoun].");
	
	output("\n\n");
	
	if (pc.hasGenitals())
	{
		output("As Pippa grinds, her upper thigh, wet with her girl cum, rubs up against your ");
		
		if (pc.hasCock()) output("[pc.cocks]");
		if (pc.isHerm()) output(" and ");
		if (pc.hasVagina()) output("[pc.pussies]");
		
		output(".  ");
		
		if (pc.hasCock())
		{
			output("Her thigh, only barely making contact with your [pc.cocks], isn't doing much for you, till she reaches down and holds ");
			
			if (pc.hasCocks()) output("one of your [pc.cocks]");
			else output("your [pc.cock]");
			
			output(" against her thigh, allowing it to run between them, now getting lubed up with both her pussy juice and the [pc.milkNoun] that was soaking her hand.  ");
			
			if (pc.hasVagina())
			{
				output("Your [pc.pussy], on the other hand, is doing fine without any intervention.  It's not as good as if Pippa were using her hands, but her thigh is firmly pressed up against you, teasing over the whole length of your [pc.pussyNoun].  ");
			}
		}
		else
		{
		output("While her thigh, pressed firmly against your [pc.pussy] as it rubs up and down, feels pretty good, it's no substitute for her hands.  As if reading your mind, she reaches down, sandwiching her [pc.milkNoun] covered hand between her thigh and your [pc.pussyNoun].  She slips her fingers in, using the movement of her thigh to fuck you.  ");
		}
	}
	
	output("Pippa's grinding and sucking become more and more frantic");
	
	if (pc.hasCock()) output(", as does the stroking of the hand-thigh vice wrapped around your [pc.cock]");
	else if (pc.hasVagina()) output(", as does the finger fucking your [pc.pussy]'s getting");
	else output(", as does the motion of her tongue licking and caressing your [pc.nippleNoun]");
	
	output(".  The pressure in your breasts is rapidly dropping, but it's replaced with a growing pressure in your loins.  You both go over the edge at the same time.  Pippa siezes up, coating your [pc.thigh] in her juices and painfully biting down on your [pc.nipple].  This isn't enough to stop your own orgasm, your ");
	
	if (pc.hasGenitals())
	{
		if (pc.hasCock()) output("[pc.cock] ");
		if (pc.isHerm()) output("and ");
		if (pc.hasVagina()) output("[pc.pussy] ");
		
		output("releasing a flood of ");
		
		if (pc.hasCock()) output("[pc.cum] ");
		if (pc.isHerm()) output("and ");
		if (pc.hasVagina()) output("[pc.girlcum] ");
		
		output("to cover the two of you and the bed.");
	}
	else
	{
		output("own body siezing up before descending into shuddering aftershocks."); 
	}
	
	output("\n\nAs you both come down from your orgasmic highs, Pippa finally releases your [pc.nippleNoun] and slides off of you coming to lay next to you.  After resting for a bit, she wordlessly sits up and leans over to kiss you, or so you think.  She locks her lips with yours, and spits some of your [pc.milk] into your mouth.  Caught off guard, you nearly choke, but manage to swallow it, and she giggles, before giving you a proper kiss.  <i>“Thanks for the meal, " + pippaCallsSteele() + ".  I need to shower...and probably do laundry.  I'll see you later.”</i>");
	
	pc.orgasm();
	pc.milked(pc.milkFullness);
	processTime(10);
	pippaDominance(1);
	if (pc.hasVagina()) applyPussyDrenched(pc);
	if (pc.hasCock()) applyCumSoaked(pc);
	
	addButton(0, "Next", mainGameMenu);
	
}

public function pippaAppearance():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("Pippa was born a human, but has currently modded herself into a pig-morph.  She stands about 5.5 feet tall, 1.68 meters in the common metric system.  She's typically clothed in a tight, white tank top that ends just above her belly button and a pair of tight, gray yoga pants that end midway down her calves.  ");
	
	var seenPippaNaked:Boolean = pippaSexed(0) > 0 || pippaSpecialMassagesGiven(0) > 0 ? true : false;
	
	if (seenPippaNaked) output("She typically forgoes undergarments, sometimes made obvious by her pants, ");
	else output("Her pants are ");
	
	output("stretched so tight as to be almost transparent in the right light");
	
	if (!seenPippaNaked) output(", revealing that she at least doesn't wear panties");
	
	output(".");
	
	output("\n\nPippa's face, covered in light pink skin, is mostly human in shape and structure, but where a human's nose would be, she has a pig-like snout.  She has full lips and hazel colored eyes.  Her shoulder-length hair is [pippa.hairColor], and partially tied into two bun pigtails in the back.  Her body is covered in sparse, barely visible hair of the same color.  The hair on her head is parted by two floppy pig ears.");
	
	output("\n\nShe has a humanoid upper body, with normal human arms and torso.  She has [pippa.hips] that sexily sway as she walks, and a [pippa.ass] that's only barely contained by her tight pants.  Above her ass is a curly, little pig's tail.  Growing down from her hips are two thick-thighed, digitigrade pig legs, capped in black, cloven hooves.  She has a " + pippa.bellyDescript(true) + ", unsurprising considering her love of food.  Despite her thick figure, she maintains a curvy body.");
	
	output("\n\nShe has two " + pippa.breastSize(pippa.breastRows[0].breastRatingRaw) + " [pippa.breastsNoun]");
	
	if (seenPippaNaked) output(", capped with brown-pink, inverted nipples.  Her areola are " + pippa.areolaSizeDescript() + ", and when she's aroused, her large, " + pippa.nippleLength() + " inch nipples emerge");
	
	output(".  She could easily fill a [pippa.breastCupSize] bra.");
	
	output("\n\n");
	
	if (seenPippaNaked) output("Her pussy is located at her waist, as you'd expect.  She has a pig pussy with a rather large clit.  Her pussy lips are quite small and featureless until she becomes aroused, and they swell out dramatically.  The inside is ridged with a corkscrew pattern.");
	else output("You can only assume she has sexual equipment located at her waist.");
	
	output("\n\nShe");
	
	if (!seenPippaNaked) output(", presumably,");
	
	output(" has one asshole, placed between her [pippa.buttcheeks] where it belongs.");
	
	addButton(0, "Back", pippaMainMenu);
}

public function pippaTalkMenu(from:Function = undefined):void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("<i>“You wanna talk?  I'd love to.”</i>");
	
	// Talk to her about herself
	if (from != pippaTalkHer) addButton(0, "Her", pippaTalkHer, undefined, "Her", "Ask Pippa about herself.");
	else addDisabledButton(0, "Her", "Her", "You just talked to her about that.");
	
	// Talk to her about you
	if (from != pippaTalkYou) addButton(1, "You", pippaTalkYou, undefined, "You", "Talk to Pippa about yourself.");
	else addDisabledButton(1, "You", "You", "You just talked to her about that.");
	
	// Talk to her about Yammi (if you have recruited Yammi and talked to her about herself)
	if (!yammiRecruited()) addDisabledButton(2, "Locked", "Locked", "You'll need to recruit a certain crew member to talk to her about this.");
	else if (flags["PIPPA_TALKED_HER"] != 1 || !yammiIsCrew()) addDisabledButton(2, "Yammi", "Yammi", "You'll need to talk to her about herself and have Yammi as a crew member.");
	else if (from == pippaTalkYammi) addDisabledButton(2, "Yammi", "Yammi", "You just talked to her about that.");
	else addButton(2, "Yammi", pippaTalkYammi, undefined, "Yammi", "Talk to Pippa about Yammi.");
	
	// Talk to her about Reaha (if Reaha is a treated crew member and you've talked to her about herself)
	/*if (!reahaRecruited()) addDisabledButton(3, "Locked", "Locked", "You'll need to recruit a certain crew member to talk to her about this.");
	else if (flags["PIPPA_TALKED_HER"] != 1 || !reahaIsCrew() || !reaha.isTreated()) addDisabledButton(3, "Reaha", "Reaha", "You'll need to talk to her about herself and have Reaha onboard and treated.");
	else if (from == pippaTalkReaha) addDisabledButton(3, "Reaha", "Reaha", "You just talked to her about that.");
	else addButton(3, "Reaha", pippaTalkReaha, undefined, "Reaha", "Talk to Pippa about Reaha."); // Disabled till Reaha can be Treated */
	
	addButton(14, "Back", pippaMainMenu);
}

public function pippaTalkHer():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("You decide to ask Pippa about herself.  ");
	
	if (pc.isBimbo() || pc.isBro()) output("<i>“So, like, why are you a piggy?”</i>");
	else ("<i>“So, why a pig?”</i>");
	
	output("\n\nShe narrows her eyes at you, ");
	
	if (pc.race() == "pig-morph") output("and asks, <i>“Who are you to ask that?”</i>  She");
	else if (pc.race() != pc.originalRace) output("and says, <i>“You don't see me asking why you're " + indefiniteArticle(pc.race()) + ".”</i>  She");
	else output("but she");
	
	output(" answers the question anyway.  <i>“It's not that interesting of a story.  Growing up, even before I'd modded myself, I was already a rather large girl.  You know how people love rhyme and alliteration in their insults.  Well, it didn't take long before \"Pippa Pig\" became the go-to phrase for those looking to make fun of me.  Joke's on them; it also didn't take long before I started to like the sound of that.”</i>");
	
	output("\n\nThat sounds a bit Stockholm-esque to you, but you decide against saying anything, and instead ask, ");
	
	if (pc.isBimbo() || pc.isBro()) output("<i>“Why aren't you with the other farm animals?”</i>");
	else output("<i>“Why Uveto?”</i>");
	
	output("\n\nAt this question, she smiles and answers, <i>“No particular reason.  That you caught me here is just coincidence.  My plan is to move around from place to place every now and then, seeing new things, eating new foods.  I actually lived in New Texas previously, and I hadn't planned to move on, but...”</i>  She trails off before continuing, <i>“Well, I liked New Texas, and I like sex as much as the next girl, but it got old.  It was so hard to even have a real conversation with someone.  And so, I found myself here.”</i>");
	
	output("\n\nIt sounds a bit like she regrets leaving New Texas.  <i>“Do you miss New Texas?”</i>");
	
	output("\n\n<i>“I do sometimes miss it.  Sex with Treated people is great, of course, and that's not something I can regularly get outside of New Texas.  And as if drinking straight from a New Texas cow-girl's tits wasn't good enough, ice cream made with Treated milk must be one of the greatest desserts in the galaxy.  But still, I'm happy; I don't regret moving on.  It's nice to see and experience new things, and talk with people who aren't total ditzes.");
	
	if (pc.isBimbo() || pc.isBro()) output("”</i>  For some reason, as she speaks her last sentence, she breaks eye contact with you and looks sideways.  <i>“");
	else output("  ");
	
	output("All that said, even though I haven't been here long, I was actually thinking about moving on soon.  I haven't thought about where I'll go next, but this cold is pretty hard to deal with.  Not to mention the severe lack of massage customers.”</i>");
	
	output("\n\nThat line of thinking of thinking prompts your next question, <i>“Speaking of massages, how'd that come about?”</i>");
	
	output("\n\nShe presses her fingers together in front of her chest.  <i>“Well, for some time growing up, I was a flutist.  To be honest, my tone quality was a bit lacking.  What I was good at though, was playing fast parts.  High tempo?  High note division?  No problem.”</i>");
	
	output("\n\nYou interrupt, <i>“What's this have to do with massages?”</i>");
	
	output("\n\n<i>“I'm getting to that, if you'd let me.  The point is, I'm dexterous; I've good fingers.  Now, I wouldn't have considered applying that particular skill to massages, if not for my mom.  Sometimes she'd get sore, particularly in her back.  Dad would typically massage her, but one time when he wasn't around, she asked me.  She claimed that it was good, and helped a lot, but I figured she was just being nice.  That is, at least, until she kept asking me, even when Dad was around.  Eventually, I started selling my services to classmates.");
	
	if (pippaHappyEndingsGiven(0) > 0 || pippaSpecialMassagesGiven(0) > 0) output("  Don't worry, I was no delinquent.  My massages then weren't quite what they've grown to be.");
	
	output("  So, anything else you want to know about me?”</i>  You suppose that's enough for now.");
	
	flags["PIPPA_TALKED_HER"] = 1;
	processTime(5);
	
	addButton(0, "Next", pippaTalkMenu, pippaTalkHer);
}

public function pippaTalkYou():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("You think back to when you first met Pippa, and ask, ");
	
	if (pc.isBimbo() || pc.isBro())
	{
		output("<i>“Do you know me?”</i>");
		
		output("\n\nPippa looks confused.  <i>“ What do you mean?  Of course I know you.”</i>");
		
		output("\n\nYou think, and rephrase your question, <i>“ Did you like, know me already?”</i>");
	}
	else output("<i>“Did you already have some idea of who I was when we first met?”</i>");
	
	output("\n\n<i>“And who are you, exactly?”</i>");
	
	output("\n\n<i>“");
	if (pc.isBimbo()) output("I get to take over Daddy's company!  I hope so, anyway.");
	else if (pc.isBro()) output("I get to take Pop's company...I hope.");
	else output("Victor Steele, the founder of Steele Tech, is my father.  I'm going to succeed him.  Or at least, that's the plan.");
	output("”</i>");
	
	output("\n\nPippa ponders what you've told her for a moment with her hand on her chin.  <i>“");
	
	if (pc.isBimbo() || pc.isBro()) output("I take it Victor Steele's your dad then.  ");
	
	output("I didn't know exactly who you were, but I'd have to be living in quite some bubble to not have some idea.  There's a Steele Tech office right near here, after all.  You're the first rich, famous person I've gotten to know.  Or is it future rich, famous person?  Sounds like it's not a sure thing.”</i>  You tell her about your adventure to reclaim the probes, and about your cousin.  <i>“Victor seems like my kind of guy, being sure you actually know what you're doing and making you earn your place.  Your cousin sounds like a real asshole though, so I hope you're successful.  Maybe keep me in mind when the time comes; free massages would be a great employee benefit, huh?”</i>  She smiles and winks at you.");
	
	processTime(5);
	
	addButton(0, "Next", pippaTalkMenu, pippaTalkYou);
}

public function pippaTalkYammi():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("Pippa previously mentioned that she was a fan of cow-girl ice cream.  <i>“You know, the cashier from a New Texas Iced Teats location is currently on my crew.  She's my chef.”</i>");
	
	output("\n\nHer eyes light up.  <i>“Is that so?  I'll have to keep that in mind.  Maybe I can pay her a visit some time.  Especially if she can get me some ice cream.”</i>");
	
	flags["PIPPA_TALKED_YAMMI"] = 1;
	processTime(1);
	
	addButton(0, "Next", pippaTalkMenu, pippaTalkYammi);
}

// Not needed until Reaha can be Treated
/*public function pippaTalkReaha():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("Talk about Reaha.");
	
	flags["PIPPA_TALKED_REAHA"] = 1;
	addButton(0, "Next", pippaTalkMenu, pippaTalkReaha);
}*/

public function pippaFlirt():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("You turn up your charm to max and approach Pippa, intending to make a move on her.  You flirt briefly, but quickly get to the point.");
	
	if (pc.isTreated())
	{
		output("\n\n<i>“So you went and got Treated, huh?”</i>  She hesitates for a moment before a lusty look spreads across her face.  <i>“Sure.  Let's fuck.”</i>");
	}
	else if (pippaAffection(0) >= PIPPA_AFFECTION_SEX)
	{
		output("\n\n<i>“You have been a pleasure to have around, " + pippaCallsSteele() + ".”</i>  She hesitates for a moment before a lusty look spreads across her face.  <i>“I think I'd enjoy making our relationship a little more personal.”</i>");
	}
	else
	{
		output("\n\n<i>“Listen, " + pippaCallsSteele() + ", I like having you as a customer, but no.  At least not yet.  Give me a little time to get to know you a bit more, warm up to you some.”</i>");
	}
	
	if (pc.isTreated() || pippaAffection(0) >= PIPPA_AFFECTION_SEX)
	{
		flags["PIPPA_FLIRTED"] = 1;
		
		addButton(0, "Sex", pippaSexMenu, pippaMainMenu);
		addButton(14, "Back", mainGameMenu);
	}
	else
	{
		addButton(0, "Next", mainGameMenu);
	}
}

public function pippaNuruEmailGet():void
{
	AddLogEvent("<b>New Email From Pippa (pippa_pig@cmail.com)!</b>", "passive");

	MailManager.unlockEntry("pippa_nuru", GetGameTimestamp());
}