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
PIPPA_SEXED - Tracks how many times Steele has had sex with Pippa
	undefined - Steele has not had sex with Pippa
PIPPA_ASS_FUCKED - Tracks whether or not Steele has fucked Pippa in the ass
	undefined/0 - Steele has not fucked Pippa in the ass
	1 - Steele has fucked Pippa in the ass
PIPPA_DOMINANCE - Tracks Pippa's dominance
	undefined/0 - Steele has not had sex with Pippa
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
	var baseCost:int = 100;
	
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
	var baseCost:int = 250;
	
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

public function pippaEatFood(food:String):void
{
	switch(food)
	{
		case GIVE_BBQ:
			pc.destroyItem(new BBQToGo(), 1);
			output("Pippa tears open the to-go box, and before you know it, there's nothing left but bones.");
			break;
		case GIVE_NECTAR:
			pc.destroyItem(new MyrNectar(), 1);
			output("Pippa opens the thermos of myr nectar and knocks it back like it's a mere shot glass.");
			break;
		case GIVE_KALOCRUNCH:
			pc.destroyItem(new Kalocrunch(), 1);
			output("Pippa eats through the kalocrunch bar in no time, leaving nothing but crumbs.");
			break;
		case GIVE_LARGE_EGG:
			pc.destroyItem(new LargeEgg(), 1);
			output("Pippa quickly eats the large egg and licks her lips.  She looks quite refreshed.");
			break;
		case GIVE_MANGO:
			pc.destroyItem(new MhengaMango(), 1);
			output("Pippa eats the mango so quickly that there's noticable juice spray.  Somehow, she seems sexier.");
			break;
		case GIVE_PEXIGA_SALIVA:
			pc.destroyItem(new PexigaSaliva(), 1);
			output("Pippa looks at the pexiga saliva warily, but upon catching the sweet scent, drinks it in one gulp.");
			break;
		case GIVE_SMALL_EGG:
			pc.destroyItem(new SmallEgg(), 1);
			output("Pippa pops the small egg in her mouth whole and swallows it down.");
			break;
		case GIVE_ZIL_HONEY:
			pc.destroyItem(new ZilHoney(), 1);
			output("Pippa downs the vile of honey in the blink of an eye.  She looks more energetic.");
			break;
	}
	
	pippaAffection(4);
	pippaFed();
}

// Handles text description for area outside of Pippa's house
public function approachingPippasHouse(btnSlot:int = 1):void
{
	if (!metPippa())
	{
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;

		output("\n\nTo the west you notice one of the houses has a sign that reads <i>Professional Massages Available - Keep Yourself Warm</i>.  The sign doesn't look very professional, despite its assurance, but you are curious, especially about that last part.  Besides, if it turns out to be something shady, you can handle yourself.");

		addButton(btnSlot, "Buzzer", meetPippa, undefined, "Buzzer", "Apparently this house gives massages that will help you keep warm.");
	}
	else if (recruitedPippa())
	{
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;

		output("\n\nTo the west is Pippa's house, now unoccupied.  The sign advertising her massage services is still up, but has been unprofessionaly scrawled over with a large <i>X</i>.")
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
		
		output("Your finger's hardly left the buzzer when the door swings open.  Standing on the other side of the door is a young woman who seems to have modded herself into a pig-morph.  Most notably, she has a pig's nose despite an otherwise human face.  She also has pig's ears and light pink skin.  You barely notice, but she also has a soft layer of sparse, light blonde hair covering her body.  It matches the color of her shoulder-length hair, which is, perhaps appropriately, partially tied into fluffy pigtails that frame the sides of her face.  She's a decent height, about five and a half feet tall.  She has a chubby body, her stomach poking out over tight, gray yoga pants, so stretched as to be almost transparent in the right light.  Despite her pudgy stomach, she maintains a curvy figure, with hips and an ass that are larger still.  Her thick, digitigrade legs end in cloven hoofs.  She has huge, J-cup breasts, barely contained in a tight, white tanktop that ends just above her belly button.  She has an excited look on her face, but upon taking you in, it quickly turns to disappointment.");
		
		output("\n\n<i>Oh.  I'd been expecting someone bringing me food.  You are not here to bring me food.</i>");
		
		output("\n\nYou give her your reasons for pushing the buzzer, ");
		
		if (pc.isBimbo() || pc.isBro())
		{
			output("<i>Oh no, sorry!  I was just thinkin' a massage would feel real good.</i>");
		}
		else
		{
			output("<i>");
			
			if (pc.isNice())
			{
				output("Sorry.  ");
			}
			
			output("Your sign just caught my eye.  You give massages?</i>");
		}
		
		output("\n\n<i>Right.  I do give massages,</i> she responds, as if she'd forgotten her own profession.  <i>Come on in.</i>");
		
		output("\n\nAs you follow her in, you see a curly little pig tail poking out of her pants, matching her other features.  You sit across from her in a standardly furnished room, but through a doorway you see a room with a massage table.  Having gotten in from the cold, she continues, <i>I don't usually get much business; I think all of the Huskar around here are afraid of getting oil in their fur.</i>");
		
		if (pc.isAss() && !(pc.isBimbo() || pc.isBro()))
		{
			pippaAffection(-5);
			
			output("\n\nYou interject, <i>Maybe it's because of your shoddy sign.</i>");
			
			output("\n\nShe narrows her eyes at you briefly before continuing, ignoring your quip.");
		}
		
		output("<i>  Anyway, it is nice to have a customer.  My name's Pippa, by the way.  And you are?</i>");
		
		output("\n\n<i>I'm [pc.name] Steele,</I> you inform her.  Upon hearing your name, she has a knowing look on her face, but doesn't say much, <i>That so? Well, anyway, " + pc.mf("Mister", "Miss") + " Steele, about the massage.  I use a special oil that will help keep you warm in my massages.  My cost is 100 credits. </i> ");
		
		if (pc.isTreated())
		{
			output("  Before you can answer, she continues, <i>But actually...you're treated, aren't you?</i>");
			
			if (pc.isBimbo() || pc.isBro())
			{
				output("\n\n<i>Wow, you're so smart!  I totally am!</i>");
				
				output("\n\nA lusty look begins to form on her face and she responds, <i>That's what I thought.</i>");
			}
			else
			{
				output("\n\n<i>I am.  Is that a problem?</i>");
				
				output("\n\nA lusty look begins to form on her face and she responds, <i>Not at all.</i>");
			}
			
			output("  She stands up and begins to move toward you.  <i>How about we forget the massage for now, and instead, we fuck.  It's been too long since I got to have some fun with a sexy, treated slut.");
			
			pc.lust(10);
			pippaDominance(1);
		}
	}
	else if (itemGiven != NEVERMIND) // If a String other than NEVERMIND is passed in, that should mean giving Pippa food
	{
		clearOutput();
		
		if (pc.isBimbo() || pc.isBro())
		{
			output("<i>I have some food!  You want some?</i>");
		}
		else
		{
			output("<i>You know, I actually do have food on me, if you'd like some.</i>");
		}
		
		output("\n\nShe responds excitedly, <i>Really?  That's so nice, thank you!</i>  ");
		pippaEatFood(itemGiven);
		
		output("  <i>That was delicious.  Now then, where were we?</i>");
		
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
	
	output("Pippa's look of lust quickly turns to annoyance.  <i>Seriously?  You're treated and you're turning down sex?</i>");
	
	output("\n\nYou explain that you came in for a massage, ");
	
	if (pc.isBimbo() || pc.isBro())
	{
		output("<i>Well, like, I was just thinkin' a massage sounded nice.</i>");
	}
	else
	{
		output("<i>Well, I came in for a massage.</i>");
	}
	
	output("\n\nShe stares at you for a second before responding, <i>You know what?  You can have your massage.  Another time.  For now, out.</i>  She walks over to the door and opens it, gesturing toward the outside.");
	
	if (pippaFed(0) > 0)
	{
		output("  Her face softens slightly and she says, <i>Thank you, again, for the food.</i>");
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
	
	output("This is where the standard massage scene will be.");
	
	processTime(30);
	applyOilWarmed(pc, OIL_SOURCE_STANDARD_MASSAGE);
	pippaStandardMassagesGiven();
	pippaAffection(1);
	pc.credits -= pippaStandardMassageCost();
	pc.HP(pc.HPMax() / 4);
	pc.energy(pc.energyMax() / 4);
	
	addButton(0, "Next", mainGameMenu);
}

// Pippa's nuru massage scene
public function pippaSpecialMassage():void
{
	clearOutput();
	clearMenu();
	
	output("This is where the nuru massage scene will be.");
	
	applyOilWarmed(pc, OIL_SOURCE_SPECIAL_MASSAGE);
	pippaSpecialMassagesGiven();
	pippaAffection(3);
	pc.credits -= pippaSpecialMassageCost();
	pc.HP(pc.HPMax() / 2);
	pc.energy(pc.energyMax() / 2);
	
	addButton(0, "Next", mainGameMenu);
}

// For rejecting massage during initial meeting if PC is not treated
public function pippaRejectMassage(itemGiven:String = ""):void
{
	clearOutput();
	clearMenu();
	showPippa();
	pippaAffection(-5);
	
	output("Pippa looks a little annoyed.  <i>That's too bad. I'll be here if you change your mind at some point.</i>");
	
	if (pippaFed(0) > 0)
	{
		output("  <i>Thanks again for the food.</i>");
	}
	
	addButton(0, "Leave", move, rooms[currentLocation].eastExit);
}

// Description of entering Pippa's house
public function pippaHouseBonus(arg:String = ""):void
{
	removeUvetoCold();
	author("Ascent");

	output("This is Pippa's house.");
	
	addButton(0, "Pippa", pippaMenu);
}

public function pippaMenu():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	if (pc.lust() >= 33) addButton(0, "Sex", pippaSexMenu, pippaHouseBonus);
	else addDisabledButton(0, "Sex", "Sex", "You're not currently aroused enough for sex.");
	
	addButton(1, "Massage", pippaStandardMassage, undefined, "Standard Massage", "Get a massage from Pippa\n\nCost: " + pippaStandardMassageCost() + " Credits");
	addButton(2, "Nuru Massage", pippaSpecialMassage, undefined, "Nuru Massage", "Get a full, body-to-body massage from Pippa\n\nCost: " + pippaSpecialMassageCost() + " Credits");
	
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
		
		output("\n\nShe smiles and giggles, <i>You want my ass, huh?</i>");
	}
	else
	{
		output("You move toward her and embrace her, your hands immediately going for her [pippa.ass].  She grabs the sides of your face and forces her tongue into your mouth as you squeeze and knead her ass.  As you make out with her and play with her butt, you feel your [pc.cocks] stiffening");
		
		if (pc.hasVagina())
		{
			output(" and your [pc.cunts] getting wet.");
		}
		
		output("  Her ass is as soft as it is huge.  It's easy to imagine getting lost in it.  You're so caught up in just feeling up her ass that you temporarily forget your plans to fuck it, but suddenly she breaks off the kissing and giggles, <i>You really like my ass, huh?</i>");
		
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
	
	output("  She picks up her panties, throws them at you and says, <i>What are you waiting for, " + pippaCallsSteele() + "?</i>  She bends back over, places her hands on the back of a chair and says, without looking at you, <i>Take me.</i>");
	
	output("\n\nYou quickly oblige, taking off your ");
	
	if(pc.isCrotchGarbed()) output("clothes");
	else output("gear");
	
	output(" and positioning yourself ");
	
	if (pc.isTaur()) output("over");
	else output("behind");
	
	output(" her.  For just a brief moment you rub your [pc.cock " + longestCockIndex + "] in between her [pippa.buttcheeks].  Then you start pushing through her cheeks and line your [pc.cock " + longestCockIndex + "] up with her [pippa.asshole].  Her asscheeks squeezing you already feels good enough that your precum is dripping and lubing up her hole.  You push further, spreading her hole around your [pc.cock " + longestCockIndex + " and eliciting a lusty moan.  You slowly push in as far as you can, ");
	
	if (pc.balls > 0) output("your balls coming to rest on her ass.");
	else output("penetrating her up to the hilt of your [pc.cock " + longestCockIndex + ".");
	
	output("  Pippa's [pippa.asscheeks] have swallowed up so much of the length of your [pc.cock " + longestCockIndex + "] that even hilted, ");
	
	if (pc.cocks[longestCockIndex].cLength() < 12) output("less than half of your length is actually in her asshole.");
	else if (pc.cocks[longestCockIndex].cLength() <= 15) output("hardly over half of your length is actually in her asshole.");
	else if (pc.cocks[longestCockIndex].cLength() <= 30) output("a large stretch of your length isn't even actually in her asshole.");
	else output("a noticable stretch of your length isn't even actually in her asshole.");
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
	
	output("\n\nPippa's moaning and panting picks up before turning into full on squealing and snorting.  <i>I'm so close, " + pippaCallsSteele() + "!  Feed my asshole with your cum!</i>  Right as she finishes yelling, both her asshole and her cheeks squeeze on your [pc.cock].  Already barely hanging on, you give in and cum.  Your [pc.cum] squirts into her asshole, pushing her over the edge.  Her body quivers and her ass tightens even further, her hungry asshole milking your cock dry and painting her bowels with your [pc.cum].  After it's eaten every last drop, you pull your [pc.cock " + longestCockIndex + "] out till it plops free.");
	
	output("\n\nPippa slowly stands back upright and leans on you for a second, catching her breath.  ");
	
	if (pippaSexed() == 1)
	{
		output("<i>You're really something, " + pippaCallsSteele() + ".  I hope that you'll stop by again some time.  But for now, I need to get cleaned up.  Bye bye, for now.</i>");
	}
	else
	{
		output("<i>As good as always, " + pippaCallsSteele() + ".  I've gotta clean up, but I'll seeya later.</i>  She walks off, but not before blowing you a kiss.");
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
	
	output("Pippa moves as close to you as can be and brings her [pippa.face] right up to yours, before stopping just short of kissing you.  You can feel her hot breath on your face as she whispers, <i>I bet you want my ass again.</i>  You respond with action and begin to reach around her body and grope her ass, but she stops you.  <i>Now wait just a second.</i>  She quickly removes her tight clothing, letting her jiggling curves free, then she removes your ");
	
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
	
	output("\n\nYou're completely lost in running your cock through Pippa's ass cheeks, fucking her cock-devouring, wobbling ass like it's nothing more than your sex toy when she looks over her shoulder at you and flatly asks, <i>Now you're not thinking about my pleasure at all, are you?</i>  ");
	
	if (pc.isAss())
	{
		output("You respond with a sharp smack on her ass, sending ripples across the surface.  She inhales sharply and moans,");
	}
	else
	{
		output("You feel a twinge of guilt and your [pc.cock " + smallestCockIndex + "] starts to soften, till she makes a noise almost like whining and says, <i>Don't stop, please. </i>");
	}
	
	output(" <i>To be honest, it turns me on.  Fuck my ass like it's your property, " + pippaCallsSteele() + "!  Get yourself off!</i>  Having said that, one of her hands snakes between her legs and begins playing with her pussy.  From the squishing sound, you gather that she's soaked.  Spurred on, you fuck her ass cheeks with renewed vigor.  You manhandle her ass, wrapping it around your [pc.cock " + smallestCockIndex + "], roughly squeezing it, occasionally slapping it, and even pinching it");
	
	output("\n\nYou feel an all-too-familiar tightening in your loins, and as before, Pippa's moaning and breathing devolves into animalistic squealing and snorting.  You wrap her [pippa.buttcheeks] around your cock with all of your strength and climax, ");
	
	if (pc.cocks[smallestCockIndex].cLength() < 14) output("filling the valley of her ass with your [pc.cum].");
	else output("shooting your [pc.cum] all over her back and into the air, much of it coming back down onto her ass.");
	
	output("  Your climax dies down and you remove your cock from between Pippa's ass cheeks.  She collapses onto the table, still rubbing her pussy.  A bit of your [pc.cum] drips down onto her pussy and, perhaps, coincidentally, she shudders and reachers her own climax.  She sits quietly for a bit before almost whispering, <i>I ");
	
	if (flags["PIPPA_HOTDOGGED"] == 1) output("still ");
	
	output("can't believe getting my ass used like that feels so good.  I'm just going to lay here for a bit, " + pippaCallsSteele() + ".  You can go ahead and get going.  I'll seeya later.</i>");
	
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
	showPippa(true);
	
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
	
	output("Pippa places one hand between her legs, gently rubs her pussy through her tight yoga pants, and says, <i>You know, " + pippaCallsSteele() + ", I love having my ass played with, but sometimes my pussy needs some love too.  You think you can handle that?</i>  You respond by moving closer to her and placing your [pc.hand] over hers.  She lightly kisses you and whispers, <i>Good.</i>  She guides you to her bed and has you lay down, but not before removing your ");
	
	if(pc.isCrotchGarbed()) output("clothes.");
	else output("gear.");
	
	output("\n\nWhile you get comfortably settled into Pippa's bed, she puts on a little show, slowly stripping out of her tight clothes.  First, facing toward you, she pulls her tanktop up over her head, letting her [pippa.tits] and [pippa.belly] fall free.  She crosses her arms under her tits, cradling them.  Her big nipples are already erect, standing in the middle of her wide, brown-pink areola.  Next, still facing you, she bends over, and pulls down her yoga pants.  She shakes back and forth a bit, setting her giant boobs swinging.  Finally, she turns around while spreading her legs, treating you to an eyeful of her [pippa.ass] and her spread [pippa.pussyNoun], adorned with a tuft of blonde hair.");
	
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
		
		output(".  She sits still for a moment, letting you both enjoy the feeling of you inside her, before she begins moving.  She looks at you with ravenous eyes and grinds her hips into you, alternately increasing and decreasing the weight pressing on you.  The corkscrew-patterned ridges in Pippa's [pippa.pussyNoun] would feel amazing even if she weren't particularly talented, but she knows how to use more than just her hands to massage, squeezing and milking your cock with her tight pussy as she grinds; she's definitely been doing pelvic-focused exercises with those yoga pants of hers.  As she grinds on you, she gropes at her [pippa.tits], pinching and pulling on her [pippa.nipples].  She suddenly seizes up and shudders, squeezing your [pc.cockOrStrapon " + cockOrStraponIndex + "] like a vice.  You barely hold on.  Did she just orgasm?");
		
		output("\n\n<i>I did,</i> she answers your question.  <i>Most would've been done after that, but I'm glad you held on, because I'm ready for round two, " + pippaCallsSteele() + ".</i>  She plants her hands firmly on your [pc.chest] and, this time, begins bouncing up and down.  She massages your shaft with her pussy as she did before, but it's now even wetter, increasing the pleasure you feel.  As she bounces, her tits bounce with her, so much so they almost look as if they'll fly off any second now.  You reach around behind her to grab her ass, squeezing it, of course, but also using it as a grip to help spur on her bouncing.  You run one finger around her asshole and find it's opening up slightly like the good fuckhole it is.  You slip your [pc.finger] inside and she squeals in pleasure, digging her fingers into your [pc.chest]");
		
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
		
		output(".  She immeditely begins moving up and down, slowly at first.  She runs her wet, corkscrew-ridged pussy up and down all 10 inches that she can fit inside her, just barely keeping your [pc.cockhead " + cockOrStraponIndex + "] inside at the peak of her movement before sliding back down.  As she slides, she squeezes and milks your [pc.cock " + cockOrStraponIndex + "] with her vaginal walls with skills befitting one who would call herself a masseuse.  As she slides along, massasing your shaft, she also massage her [pippa.tits], squeezing and twisting her pippa.nipples.  At the peak of one of her motions, she suddenly shudders and nearly falls on you, squeezing your [pc.cock " + cockOrStraponIndex + "] so hard that it pops out.  You almost lose it right there.  Did she just orgasm?");
		
		output("\n\n<i>I did,</i> she answers your question, <i>but I'm sure glad you didn't.  I want to go again, " + pippaCallsSteele() + ".</i>  She lifts herself back up and again impales herself on your [pc.cock " + cockOrStraponIndex + "].  She slides up and down even faster this time, leaving her slick pussy juice running down your shaft.  She takes advantage of her own juices, reaching beneath her to the portion of your cock not inside her, and massaging it with her hands.  Her surprising flexibility makes you think she's been putting those yoga pants of hers to good use.  With your hands occupied with holding her thighs for support, there's nothing you can do but sit back and enjoy the feeling, and sink your fingers further into her soft, plentiful thigh flesh.  The combination of both her hands and pussy stroking and massaging your shaft  brings you to the brink of climax, and you can tell that Pippa is nearing her second orgasm by her heavy breathing and her flushed, sweating chest.  Sure enough, she pushes herself down on your [pc.cock " + cockOrStraponIndex + "] as far as she can, releasing it from her grip, and barely placing her hands over yours for support before she climaxes again.  Her hot pussy rippling over 10, or perhaps more, inches of your cock pushes you over the edge and you join her, orgasm hitting you like a train.");
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
	
	output("\n\nPippa slowly lifts herself off of your [pc.cockOrStrapon " + cockOrStraponIndex + "] and lowers herself to lay next to you, one arm draped across your chest.  <i>That was good, " + pippaCallsSteele() + ".  I'm going to shower, so feel free to let yourself out.</i>  She plants a kiss on your cheek and climbs out of the bed.  Big ass swaying, she walks away to the shower.");
	
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
	
	output("Pippa looks you up and down and emphatically states, <i>Today, I'm going to use you for my pleasure");
	
	if (flags["PIPPA_HOTDOGGED"] == 1) output(", just as you've done with my ass");
	
	output(".  Understand?</i>  You nod.  She grabs your hand and leads you to her massage table.  <i>Take off your ");
	
	if (pc.isCrotchGarbed()) output("clothes");
	else output("gear");
	
	output(",</i> she orders.  As you comply she lowers the massage table to a height that would allow her to comfortably sit on it.  <i>Now lay down.</i>  You again do as you're told.  She stands, looming over you, and, with no fanfare, quickly takes off her clothing.  She slightly bends over you and runs a finger around your [pc.lips].  She removes her finger and, without a word, takes a seat on your face such that she can look at you face to face.");
	
	output("\n\nPippa begins grinding her [pippa.pussy] into your face, but not before ordering, <i>Lick.</i>  You comply, though you imagine the grinding would feel good even without your active contribution.  Her pussy is already soaked, filling your mouth with ");
	
	if (silly) output("the taste of...is that bacon?!  <i>I hope you like bacon grease.</i>  Well, there goes your figure.");
	else output("her juices.  The taste is quite sweet, but you're pretty sure it isn't modded.");
	
	output("  She grabs the sides of your head and picks up her grinding a bit, moaning lightly.  <i>Look at me with those " + pc.mf("handsome", "pretty") + " [pc.eyes], " + pippaCallsSteele() + ".</i>  She holds your gaze, looking intently into your eyes.  The rest of your face is completely smothered by her.  She grinds her [pippa.pussyNoun] from your nose, all the way down to your chin, where you barely have time to breathe, smearing your face with her ");
	
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
	
	output("You decide to focus all of your efforts on Pippa, wrapping your arms around her thighs to pull her further into your face and intently driving your [pc.tongue] into her [pippa.pussy].  She squeals, and then coos, <i>That's a good " + pc.mf("boy", "girl") + ", just like that.</i>  With you pulling her into your face, she lets go of your head and begins to knead her [pippa.tits].  Rhythmically grinding into your face and playing with her breasts, Pippa shudders and soaks your face with her ");
	
	if (silly) output("grease");
	else output("pussy juice");
	
	output(".  Having climaxed, she removes your arms from her thighs and stands up, only to then reposition herself and again sit on your face, now facing the other direction.  <i>I'm not done using you yet, " + pippaCallsSteele() + ",</i> she explains.");
	
	output("\n\nThe way Pippa has positioned herself, your vision is completely obscured by her [pippa.ass], your nose is buried in the base of her [pippa.pussyNoun], and you're in the perfect position to lick her [pippa.clit].  You reach up around in front of her to grope at her breasts, eliciting a moan.  ");
	
	if (pc.hasGenitals() || (pc.hasBreasts() && pc.hasNipples()))
	{
		output("She softly speaks, <i>I was thinking I should reward you for doing such a good job.</i>  No sooner than the words have left her mouth, she reaches down and ");
		
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
		output("She softly speaks, <i>I'd like to reward you for doing such a good job, but...</i>  You don't have a cock or a pussy of any sort, or even a sexy set of tits.  No matter; you're here to please her today.  You continue to");
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
	
	output("\n\nPippa climbs off of you and sighs, <i>I'm already looking forward to the next time I get to use you, " + pippaCallsSteele() + ".</i>  She leans down and kisses your cheek.  She winks at you and says, <i>Be sure to clean yourself up,</i> before leaving you to do just that.");
	
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
	
	output(" and in doing so, briefly let up on your licking.  Pippa doesn't let your lapse pass by unnoticed.  <i>Now just what do you think you're doing?</i>  She stands up and turns around to face you.  Looming over you, she chides you, <i>So inpatient.  What a bad " + pc.mf("boy", "girl") + ".");
	
	if (pc.isAss()) output("  I suppose I shouldn't be surprised.");
	
	output("</i>  She grabs your arms and moves them to your sides.  Then she quickly climbs back on top of you, now facing toward your [pc.legOrLegs], and uses her legs to pin your arms by your side.  <i>Now let's try this again.</i>");
	
	output("\n\nHaving sealed your movement, Pippa begins grinding on your face again, rougher than before.  If the massage table weren't soft, your head might be hurting.  You lick and suck on her [pippa.pussyNoun] as best as you can, but the rough movements make it difficult.  Unable to see anything beyond her [pippa.ass], you're startled when ");
	
	var gasped:Boolean = false;
	var gaspedString:String = "You lightly groan into Pippa's pussy, but the sound is muffled and you don't end up doing much more than vibrate your [pc.lips] and prompt her to speak, <i>Did that hurt, " + pippaCallsSteele() + "?  I guess your vibrating mouth feels good either way.</i>";
	
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
		
		output("  She asks, <i>You wanted to cum, didn't you?  Now's your chance.</i>  She intently yanks her hand up and down your shaft, not getting any gentler.  You hear her spit and feel it land right in the path of her hand.  Lubed up from her saliva, the scale tips just enough toward pleasure that you pathetically cum.  As you do, she reacts quickly, squeezing on your cock and causing your [pc.cum] to dribble out over her hand.  You hear her clean her hand with her mouth after she removes it from your [pc.cockNoun].");
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
		
		output("  She lightly slaps it one more time, before jamming her fingers inside and roughly finger fucking you.  She asks, <i>You wanted to cum, didn't you?  Now's your chance.</i>  She continues fucking you with her hooked fingers, causing both pleasure and pain.  As she fucks you, she roughly rubs your [pc.clit] with her palm.  Unable to help your self, you orgasm, spraying both her massage table and her hand with your [pc.girlcum].  You hear her clean her hand with her mouth after she removes it from your [pc.pussyNoun].");
	}
	
	output("\n\nSeemingly satisfied with punishing you, Pippa returns her focus to her pleasure.  She's already moaning and panting, and, clearly having enjoyed the punishment, it doesn't take much more of her grinding and your licking before she reaches a powerful climax and floods your face.  She continues to sit on your face while catching her breath.  She finally climbs off of you, freeing your arms and letting you see again.  She's sweating, and her whole body is deeply flushed.  ");
	
	if (flags["PIPPA_ABUSIVE_SAT_ON"] == undefined)
	{
		output("From the embarrased look on her face, you can't help but think the flush is from more than sexual pleasure.  She, almost sheepishly, speaks, <i>Sorry about that, " + pippaCallsSteele() + ".  I might have gotten a bit carried away there.  But I won't deny I enjoyed it.  And you did cum.  Are we good?</i>  Too tired to speak, you just nod.  <i>Good.  I'll let you clean yourself up.</i>  She leaves you to it.");
	}
	else
	{
		output("She pokes fun at you, <i>You really enjoy being punished, don't you, " + pippaCallsSteele() + "?  If we do this too much, I might end up on a real mean streak.</i>  She winks before continuing, <i>I'll leave you to clean yourself up.</i>  She gives you a quick peck on the cheek before leaving you to it.");
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
	
	output("Pippa hungrily eyes your [pc.tits] and speaks, <i>");
	
	if (pippaFed(0) > 0) output("You know, " + pippaCallsSteele() + ", I appreciate when you feed me normal food, but I have a special request today.");
	else if (pippaAffection() >= PIPPA_AFFECTION_NAME) output("You never feed me any normal food, but maybe I could make a special request today?");
	else output("Could I maybe ask you to feed me?");
	
	output("</i>  As if you didn't already know what she was getting at, she reaches for your chest and runs a finger around your [pc.nipplesNoun]");
	
	if (pc.isChestCovered()) output(" through your clothing");
	
	output(".  You grant her request, <i>");
	
	if (pc.isBimbo()) output("If there's stuff that I love, it's totally fucking and getting drinken!");
	else output("I could certainly use a milking.");
	
	output("</i>  She smiles excitedly and leads you to her bed, pulling off her tight clothes ");
	
	if (!pc.isNude()) output("and quickly pulling off your gear ");
	
	output("in the process. Once you're by her bed, she places a hand on your [pc.breastsNoun] and gives a soft, tentative squeeze, drawing just a little of your [pc.milk].  Her eyes, now positively voracious, follow the [pc.milkNoun] as it flows down your body and she licks her lips, leaving a visible sheen of saliva.  Nonetheless, she withdraws her hand and sits down on the edge of the bed, patting her lap.  <i>Sit.</i>");
	
	output("\n\nYou take a seat on Pippa's comfy lap, straddling her and bringing your [pc.breasts] level with her face.  Pippa slowly brings her mouth to your right [pc.nippleNoun] and pauses for a moment, letting you feel her hot, heavy breathing.  She wraps her plump lips around the nipple and gently runs her wet tongue around it, savoring the moment like some kind of breastfeeding connoisseur.  After what seems like an eternity of teasing, she sucks, drawing a stream of [pc.milk] down her throat.  And then she lets go again and looks you in the eyes.  <i>Mmm, your [pc.milkNoun] is so delicious, " + pippaCallsSteele() + ".");
	
	if (pc.isTreatedCow()) output("  Especially since it's treated.");
	
	output("</i>  Tired of her teasing, you grab the back of her head and push her face into your [pc.breastNoun].  She giggles and finally, really digs in.  Her lips and tongue slide all around your [pc.nippleNoun], drawing a torrent of [pc.milk] from your [pc.breasts], and the insatiable pig slut greedily swallows every last drop.");
	
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
	
	output("Taking action, you push Pippa down onto the bed and flip your positions so that she's on top.  You sit back up and lay her across your lap in a classic breastfeeding position.  Your [pc.nippleNoun] having slipped from her mouth during the repositioning, she jokes, <i>I'm a bit big to baby, don't you think?</i>  With one hand you reach down between her legs and run her [pippa.clit] between your fingers and she moans, <i>I guess this isn't exactly babying.</i>  With your right [pc.breastNoun] practically drained already, you take the opportunity to switch, and move Pippa's mouth to your left [pc.nippleNoun].");
	
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
	
	output("\n\nFinally, Pippa is either full, or believes she's drained you.  She releases your [pc.nippleNoun], wordlessly sits up and puffs up her cheeks as if to indicate her mouth is full.  You get the idea and open your mouth, and she leans over, locks her lips with yours, and spits some of your [pc.milk] into your mouth.  You savour your own taste shortly, and then swallow.  She just smiles, then leans over again to give you a proper kiss.  <i>Thanks for the meal, " + pippaCallsSteele() + ".  I need to shower...and probably do laundry.  I'll see you later.</i>");
	
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
	
	output("You do nothing, letting Pippa continue to nurse for a brief time, before she pulls you down onto the bed and flips your positions so that she's on top.  She straddles your [pc.leg] and, having removed your [pc.nippleNoun] from her mouth during the transition, she declares, <i>Now this, I can work with.</i>  She lightly wiggles her hips back and forth, and runs her fingers around your [pc.nipples], evidently excited.  Having already drained your right [pc.breastNoun], she takes the opportunity to switch, latching her mouth onto your left [pc.nippleNoun].");
	
	
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
	
	output("\n\nAs you both come down from your orgasmic highs, Pippa finally releases your [pc.nippleNoun] and slides off of you coming to lay next to you.  After resting for a bit, she wordlessly sits up and leans over to kiss you, or so you think.  She locks her lips with yours, and spits some of your [pc.milk] into your mouth.  Caught off guard, you nearly choke, but manage to swallow it, and she giggles, before giving you a proper kiss.  <i>Thanks for the meal, " + pippaCallsSteele() + ".  I need to shower...and probably do laundry.  I'll see you later.</i>");
	
	pc.orgasm();
	pc.milked(pc.milkFullness);
	processTime(10);
	pippaDominance(1);
	if (pc.hasVagina()) applyPussyDrenched(pc);
	if (pc.hasCock()) applyCumSoaked(pc);
	
	addButton(0, "Next", mainGameMenu);
	
}