/*
Flags Key:

PIPPA_AFFECTION : Tracks Pippa’s affection for Steele
	undefined - Steele has not met Pippa
	1-100 - Pippa’s affection for Steele on a scale of 1 to 100
PIPPA_RECRUITED : Tracks whether Pippa has been made a crew member
	0/undefined - Pippa has not asked to be made a crew member
	-1 - Pippa has asked to join Steele’s crew, but was turned down
	1 - Pippa has asked to join Steele’s crew, and was welcomed aboard
	2 - Pippa joined the crew, but was kicked off
PIPPA_FED : Tracks how many times Pippa has been given food
	undefined - Steele has not given Pippa any food
PIPPA_STANDARD_MASSAGE_RECIEVED : Tracks how many times Steele has received a standard massage from Pippa
	undefined - Steele has not received a standard massage from Pippa
PIPPA_SPECIAL_MASSAGE_RECIEVED : Tracks how many times Steele has received a special massage from Pippa
	undefined - Steele has not received a special massage from Pippa
PIPPA_HAPPY_ENDINGS - Tracks how many times Steele has gotten a happy ending from Pippa
	undefined - Steele has not gotten any happy endings from Pippa
PIPPA_SEXED - Tracks how many times Steele has had sex with Pippa
	undefined - Steele has not had sex with Pippa
PIPPA_ASS_FUCKED - Tracks whether or not Steele has fucked Pippa in the ass
	undefined/0 - Steele has not fucked Pippa in the ass
	1 - Steele has fucked Pippa in the ass
PIPPA_FUCKED_BY - Tracks whether or not Steele has been fucked by Pippa
	undefined/0 - Steele has not been fucked by Pippa
	1 - Steele has been fucked by Pippa
PIPPA_DOMINANCE - Tracks Pippa’s dominance
	undefined/0 - Steele has not had sex with Pippa
PIPPA_TALKED_HER - Check if Steele has talked to Pippa about herself
	undefined/0 - Have not talked to Pippa about herself
	1 - Have talked to Pippa about herself
PIPPA_TALKED_YOU - Check if you’ve talked with Pippa about yourself
	undefined/0 - Have not
	1 - Have
PIPPA_TALKED_CARBONADO - Check if Steele has talked to Pippa about Carbonado
	undefined/0 - Have not
	1 - Have
PIPPA_TALKED_MONEY - Check if Steele has talked to Pippa about money
	undefined/0 - Have not
	1 - Have
PIPPA_TALKED_YAMMI - Check if Steele has talked to Pippa about Yammi
	undefined/0 - Have not talked to Pippa about Yammi
	1 - Have talked to Pippa about Yammi
PIPPA_TALKED_REAHA - Check if Steele has talked to Pippa about Reaha (treated)
	undefined/0 - Have not talked to Pippa about Reaha
	1 - Have talked to Pippa about Reaha
PIPPA_NURU_TIMER - Timer for Pippa’s email about Nuru massage
	undefined/0 - Affection not high enough to unlock nuru massage
	- Set to game time once affection is high enough
PIPPA_FLIRTED - Check if Steele has flirted with Pippa successfully
	undefined/0 - Have not
	1 - Have
PIPPA_TALKED_COCK - Check if Steele has asked Pippa about cock
	undefined/0 - Have not
	1 - Have
PIPPA_CURRENT_OIL - Track which kind of oil Pippa is currently using
PIPPA_UNLOCKED_COOL - Check if cooling oil has been unlocked
PIPPA_UNLOCKED_NUMB - Check if numbing oil has been unlocked
PIPPA_UNLOCKED_LUST - Check if lust oil has been unlocked
PIPPA_UNLOCKED_SLICK - Check if slippery oil has been unlocked
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

public function pippaKickedOffShip():Boolean
{
	return flags["PIPPA_RECRUITED"] == 2;
}

// Handle displaying Pippa’s name and bust
public function showPippa(naked:Boolean = false, oiled:Boolean = false):void
{
	showName("\n" + (!metPippa() ? "PIG GIRL" : "PIPPA" ));
	showBust(pippaBustDisplay(naked, oiled));
	author("Ascent");
}
public function pippaBustDisplay(naked:Boolean = false, oiled:Boolean = false):String
{
	// if naked false, show normal, clothed bust
	if (!naked && !oiled) return "PIPPA";
	// else if naked true and oiled false, show normal, naked bust
	if (naked && !oiled) return "PIPPA_NUDE";
	// else if oiled true, show oiled, naked bust
	if (naked && oiled) return "PIPPA_NUDE";
	
	return "PIPPA_OILED";
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
	if (addAffection > 0) pippaCheckRecruitment(); // Without the if you get stuck in a never-ending loop of pippaAffection -> pippaCheckRecruitment -> getPippaRecruitmentReasons -> pippaAffection
	
	return flags["PIPPA_AFFECTION"];
}

public const PIPPA_DOMINANCE_MIN:int = 0;
public const PIPPA_DOMINANCE_DEFAULT:int = 50;
public const PIPPA_DOMINANCE_MAX:int = 100;

// Checks and sets Pippa's preference for top/bottom (dominance naming's really a misnomer)
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
	if (pippaAffection() >= PIPPA_AFFECTION_NAME && !pippaRecruitTurnedDown()) return RandomInCollection("Honey", "Pumpkin", "Sweet Pea", "Sugar", "Cupcake", "Dumpling");
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
	return pc.hasItemType(GLOBAL.FOOD);
}

// any non-transformative food items + some drinks
private const GIVE_BBQ:String = "give bbq";
private const GIVE_NECTAR:String = "give nectar";
private const GIVE_KALOCRUNCH:String = "give kalocrunch";
private const GIVE_LARGE_EGG:String = "give large egg";
private const GIVE_MANGO:String = "give mango";
private const GIVE_PEXIGA_SALIVA:String = "give saliva";
private const GIVE_SMALL_EGG:String = "give small egg";
private const GIVE_ZIL_HONEY:String = "give zil honey";
private const GIVE_OTHER_FOOD:String = "give other food";
private const NEVERMIND:String = "nevermind"; // Back out of menu without changing anything using this

// Menu for giving Pippa food
public function givePippaFoodMenu(func:Function):void
{
	clearMenu();
	
	var giveItem:String = NEVERMIND;
	var btnSlot:int = 0;
	var foodList:Array = []; // To avoid dupes of the same food item.
	
	for(var i:int = 0; i < pc.inventory.length; i ++)
	{
		if (btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", func, [NEVERMIND]);
			btnSlot++;
		}
		if (pc.inventory[i].type == GLOBAL.FOOD && pc.inventory[i].quantity >= 1 && foodList.indexOf(pc.inventory[i].shortName) == -1)
		{
			if (pc.inventory[i] is BBQToGo) giveItem = GIVE_BBQ;
			else if (pc.inventory[i] is MyrNectar) giveItem = GIVE_NECTAR;
			else if (pc.inventory[i] is Kalocrunch) giveItem = GIVE_KALOCRUNCH;
			else if ((pc.inventory[i] is LargeEgg) || (pc.inventory[i].longName.indexOf("large") != -1 && pc.inventory[i].longName.indexOf("egg"))) giveItem = GIVE_LARGE_EGG;
			else if (pc.inventory[i] is MhengaMango) giveItem = GIVE_MANGO;
			else if (pc.inventory[i] is PexigaSaliva) giveItem = GIVE_PEXIGA_SALIVA;
			else if ((pc.inventory[i] is SmallEgg) || (pc.inventory[i].longName.indexOf("small") != -1 && pc.inventory[i].longName.indexOf("egg"))) giveItem = GIVE_SMALL_EGG;
			else if (pc.inventory[i] is ZilHoney) giveItem = GIVE_ZIL_HONEY;
			else giveItem = GIVE_OTHER_FOOD;
			
			addButton(btnSlot, (pc.inventory[i].shortName + " x" + pc.inventory[i].quantity), func, [giveItem, pc.inventory[i]], StringUtil.toDisplayCase(pc.inventory[i].longName), ("Give Pippa " + pc.inventory[i].description + "."));
			foodList.push(pc.inventory[i].shortName);
			btnSlot++;
		}
		if (foodList.length > 14 && (i + 1) == pc.inventory.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", func, [NEVERMIND]);
		}
	}
	
	addButton(14, "Back", func, [NEVERMIND]);
}

public function pippaEatFood(food:String, item:ItemSlotClass):String
{
	var response:String = "";
	
	switch(food)
	{
		case GIVE_BBQ:
			response = "Pippa tears open the to-go box, and before you know it, there’s nothing left but bones.";
			break;
		case GIVE_NECTAR:
			response = "Pippa opens the thermos of myr nectar and knocks it back like it’s a mere shot glass.";
			break;
		case GIVE_KALOCRUNCH:
			response = "Pippa eats through the kalocrunch bar in no time, leaving nothing but crumbs.";
			break;
		case GIVE_LARGE_EGG:
			response = "Pippa quickly eats the large egg and licks her lips. She looks quite refreshed.";
			break;
		case GIVE_MANGO:
			response = "Pippa eats the mango so quickly that there’s noticable juice spray. Somehow, she seems sexier.";
			break;
		case GIVE_PEXIGA_SALIVA:
			response = "Pippa looks at the pexiga saliva warily, but upon catching the sweet scent, drinks it in one gulp.";
			break;
		case GIVE_SMALL_EGG:
			response = "Pippa pops the small egg in her mouth whole and swallows it down.";
			break;
		case GIVE_ZIL_HONEY:
			response = "Pippa downs the vial of honey in the blink of an eye. She looks more energetic.";
			break;
		default:
			response = "With a blink of an eye, Pippa eats the food you gave her. She looks very satisfied.";
			break;
	}
	pc.destroyItemByReference(item);
	
	pippaAffection(4);
	pippaFed();
	
	return response;
}

// Handles text description for area outside of Pippa’s house
public function approachingPippasHouse(btnSlot:int = 1):void
{
	if (!metPippa())
	{
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;

		output("\n\nTo the west you notice one of the houses has a sign that reads <i>“Professional Massages Available - Keep Yourself Warm”</i>. The sign doesn’t look very professional, despite its assurance, but you are curious, especially about that last part. Besides, if it turns out to be something shady, you can handle yourself.");

		addButton(btnSlot, "Buzzer", meetPippa, undefined, "Buzzer", "Apparently this house gives massages that will help you keep warm.");
	}
	else if (pippaOnShip())
	{
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;

		output("\n\nTo the west is Pippa’s house, now unoccupied. The sign advertising her massage services is still up, but has been unprofessionaly scrawled over with a large “X”.")
	}
	else if (pippaKickedOffShip())
	{
		flags["NAV_DISABLED"] = undefined;
		
		output("\n\nTo the west is Pippa’s house. Though she’s moved back in, a large <i>“X”</i> is still scrawled over her advertising sign.");
	}
	else
	{
		flags["NAV_DISABLED"] = undefined;
	}
}

// Handles initial meeting with Pippa after pressing her house buzzer
public function meetPippa(arg:Array = null):void
{
	clearMenu();

	var itemGiven:String = (arg != null ? arg[0] : "");
	
	// Blocked for blocked ginas
	if (pc.hasVagina() && pc.blockedVaginas() > 0)
	{
		output("You hit the buzzer, but nobody answers. Maybe try back some other time.");
		if(pc.pluggedVaginas() > 0) output(" Maybe you could get rid of the obstruction in your feminine genitalia in the meantime. A shower would do you some good.");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	// Function initially called
	if (itemGiven == "")
	{
		clearOutput();
		moveTo("PIPPA HOUSE");
		removeUvetoCold();
		pippaAffection(10);
		processTime(3);
		showPippa();
		
		output("Your finger’s hardly left the buzzer when the door swings open. Standing on the other side of the door is a young woman who seems to have modded herself into a pig-morph. Most notably, she has a pig’s nose despite an otherwise human face. She also has pig’s ears and light pink skin. You barely notice, but she also has a soft layer of sparse, [pippa.hairColor] hair covering her body. It matches the color of her shoulder-length hair, which is, perhaps appropriately, partially tied into bun pigtails in the back. She’s a decent height, about five and a half feet tall. She has a chubby body, her stomach poking out over tight, gray yoga pants, so stretched as to be almost transparent in the right light. Despite her pudgy stomach, she maintains a curvy figure, with hips and an ass that are larger still. Her thick, digitigrade legs end in cloven hoofs. She has [pippa.breastCupSize] breasts, barely contained in a tight, white tank top that ends just above her belly button. She has an excited look on her face, but upon taking you in, it quickly turns to disappointment.");
		
		output("\n\n<i>“Oh. I’d been expecting someone bringing me food. You are not here to bring me food.”</i>");
		
		output("\n\nYou give her your reasons for pushing the buzzer, ");
		
		if (pc.isBimbo() || pc.isBro())
		{
			output("<i>“Oh no, sorry! I was just thinkin’ a massage would feel real good.”</i>");
		}
		else
		{
			output("<i>“");
			
			if (pc.isNice())
			{
				output("Sorry. ");
			}
			
			output("Your sign just caught my eye. You give massages?”</i>");
		}
		
		output("\n\n<i>“Right. I do give massages,”</i> she responds, as if she’d forgotten her own profession. <i>“Come on in.”</i>");
		
		output("\n\nAs you follow her in, you see a curly little pig tail poking out of her pants, matching her other features. You sit across from her in a standardly furnished room, but through a doorway you see a room with a massage table. Having gotten in from the cold, she continues, <i>“I don’t usually get much business; I think all of the Huskar around here are afraid of getting oil in their fur.");
		
		if (pc.isAss() && !(pc.isBimbo() || pc.isBro()))
		{
			pippaAffection(-5);
			
			output("”</i>");
			
			output("\n\nYou interject, <i>“Maybe it’s because of your shoddy sign.”</i>");
			
			output("\n\nShe narrows her eyes at you briefly before continuing, ignoring your quip. <i>“");
		}
		else output(" ");
		
		output("Anyway, it is nice to have a customer. My name’s Pippa, by the way. And you are?”</i>");
		
		output("\n\n<i>“I’m [pc.name] Steele.”</i>");
		
		output("\n\nUpon hearing your name, she has a knowing look on her face, but doesn’t say much, <i>“That so? Well, " + pc.mf("Mister", "Miss") + " Steele, about the massage. I use a special oil that will help keep you warm in my massages. My cost is " + pippaStandardMassageCost() + " credits.”</i> ");
		
		if (pc.isTreated())
		{
			output(" Before you can answer, she continues, <i>“But actually... you’re Treated, aren’t you?”</i>");
			
			if (pc.isBimbo() || pc.isBro())
			{
				output("\n\n<i>“Wow, you’re so smart! I totally am!”</i>");
				
				output("\n\nA lusty look begins to form on her face and she responds, <i>“That’s what I thought.”</i>");
			}
			else
			{
				output("\n\n<i>“I am. Is that a problem?”</i>");
				
				output("\n\nA lusty look begins to form on her face and she responds, <i>“Not at all.”</i>");
			}
			
			output(" She stands up and begins to move toward you. <i>“How about we forget the massage for now, and instead, we fuck. It’s been too long since I got to have some fun with a sexy, treated slut.”</i>");
			
			pc.changeLust(10);
			pippaDominance(1);
			flags["PIPPA_FLIRTED"] = 1;
		}
	}
	else if (itemGiven != NEVERMIND) // If a String other than NEVERMIND is passed in, that should mean giving Pippa food
	{
		clearOutput();
		
		if (pc.isBimbo() || pc.isBro())
		{
			output("<i>“I have some food! You want some?”</i>");
		}
		else
		{
			output("<i>“You know, I actually do have food on me, if you’d like some.”</i>");
		}
		
		output("\n\nShe responds excitedly, <i>“Really? That’s so nice, thank you!”</i> " + pippaEatFood(itemGiven, arg[1]) + " <i>“That was delicious. Now then, where were we?”</i>");
		
		pippaAffection(1); // Small boost to normal food affection for initial meeting
	}
	
	if (pippaFed(0) == 0 && hasValidPippaFood()) // PCs with valid food can give her some food on intitial meeting once
	{
		addButton(2, "Give Food", givePippaFoodMenu, meetPippa, "Give Food", "You have some food you could give Pippa");
	}
	
	if (pc.isTreated()) // Treated PCs can fuck her right away
	{
		addButton(0, "Fuck Her", pippaSexMenu, meetPippa, "Fuck Her", "Give Pippa what she wants.");
		addButton(1, "Turn Down", pippaRejectSex, itemGiven, "Turn Down", "Reject Pippa’s proposition.");
	}
	else // And non-treated PCs can pay for a massage
	{
		if (pc.credits >= pippaStandardMassageCost())
		{
			addButton(0, "Massage", pippaStandardMassage, undefined, "Massage", "Try out one of Pippa’s massages.");
		}
		else
		{
			addDisabledButton(0, "Massage", "Massage", "You don’t have enough credits to afford a massage.");
		}
		
		addButton(1, "Turn Down", pippaRejectMassage, itemGiven, "Turn Down", "Don’t get a massage right now.");
	}
}

// Displays the menu for having sex with Pippa
public function pippaSexMenu(func:Function):void
{
	clearMenu();
	
	// Bend her over and fuck her ass. Must have cock greater than or equal to 10 inches
	if (pc.hasCock())
	{
		var longestCockIndex:int = pc.longestCockIndex();
		
		if (pc.cocks[longestCockIndex].cLength() >= 8)
		{
			addButton(0, "Ass Fuck", pippaFuckAss, undefined, "Fuck Her Ass", "Fuck Pippa’s ass.");
		}
		else
		{
			addDisabledButton(0, "Ass Fuck", "Fuck Her Ass", "You don’t have a cock big enough to reach through Pippa’s massive ass.");
		}
	}
	else
	{
		addDisabledButton(0, "Ass Fuck", "Fuck Her Ass", "Fuck Pippa’s ass. (Requires a cock.)");
	}
	
	// Bend her over and hot dog her. Must have cock less than or equal to 4 thickness
	if (pc.hasCock() && !pc.isTaur() && flags["PIPPA_ASS_FUCKED"] == 1)
	{
		var smallestCockIndex:int = pc.smallestCockIndex();
			
		if (pc.cocks[smallestCockIndex].thickness() <= 4)
		{
			addButton(1, "Hot Dog", pippaHotDog, undefined, "Hot Dog", "Bend Pippa over and get off with her ass cheeks.");
		}
		else
		{
			addDisabledButton(1, "Hot Dog", "Hot Dog", "You need a thinner cock to get off with her ass cheeks.");
		}
	}
	else
	{
		addDisabledButton(1, "Hot Dog", "Hot Dog", "Bend Pippa over and get off with her ass cheeks. (Requires a cock and non-tauric body, as well as already having fucked her asshole.)");
	}
	
	// Pippa rides the player with her pussy
	if (pc.hasCock() || pc.hasHardLightEquipped())
	{
		if (!pc.isTaur())
		{
			if(!pc.hasCock() && pc.hasHardLightEquipped()) addButton(2, "Pussy Fuck", pippaFuckPussy, -1, "Pussy Fuck", "Fuck Pippa’s pig pussy.");
			else if(pc.cockTotal() == 1 && !pc.hasHardLightEquipped()) addButton(2, "Pussy Fuck", pippaFuckPussy, 0, "Pussy Fuck", "Fuck Pippa’s pig pussy.");
			else addButton(2, "Pussy Fuck", pippaChooseCockToFuckPussy, undefined, "Pussy Fuck", "Fuck Pippa’s pig pussy.");
		}
		else
		{
			addDisabledButton(2, "Pussy Fuck", "Pussy Fuck", "Fuck Pippa’s pig pussy. (Must not be a taur.)");
		}
	}
	else
	{
		addDisabledButton(2, "Pussy Fuck", "Pussy Fuck", "Fuck Pippa’s pig pussy. (Requires a cock or hardlight-equipped underwear.)");
	}
	
	// Pippa will sit on the PC’s face
	if (!pc.isTaur() && !pc.hasMuzzle() && !pc.hasBeak())
	{
		addButton(3, "Get Sat On", pippaGetSatOn, undefined, "Get Sat On", "Pippa will sit on your face and get herself off.");
	}
	else
	{
		addDisabledButton(3, "Get Sat On", "Get Sat On", "Pippa will sit on your face and get herself off. (Must not be a taur, have a muzzled face, or have a beak.)");
	}
	
	if (pippa.hasHardLightStrapOn())
	{
		addButton(4, "Get Fucked", pippaGetFucked, undefined, "Get Fucked", "Pippa will fuck you with her hardlight strapon.");
	}
	else
	{
		addDisabledButton(4, "Get Fucked", "Get Fucked", "Pippa’s not currently equipped to fuck you.");
	}
	
	// PC straddles Pippa’s lap while she drinks their milk
	if (pc.milkQ() >= 1000 && pc.isLactating() && !pc.isTaur())
	{
		addButton(5, "Feed Milk", pippaFeedMilk, undefined, "Feed Milk", "Feed Pippa with your tits.");
	}
	else
	{
		addDisabledButton(5, "Feed Milk", "Feed Milk", "You’ll need to be a heavily lactating non-taur to give Pippa a personal feeding.");
	}
	
	if (pippaYammiThreesomeCount(0) > 0 && pippaOnShip())
	{
		if (!yammiIsCrew()) addDisabledButton(6, "Yammi", "Yammi", "Yammi must be on your ship to have a threesome with her and Pippa.");
		else if ((pc.hasCock() || pc.hasHardLightEquipped()) && !pc.isTaur()) addButton(6, "Yammi", pippaYammiThreesome, undefined, "Yammi", "Have a threesome with Pippa and Yammi.");
		else addDisabledButton(6, "Yammi", "Yammi", "You must have a cock or hardlight-equipped underwear and not be a taur to have a threesome with Pippa and Yammi.");
	}
	
	addButton(14, "Back", func, [NEVERMIND]);
}

// For rejecting sex during initial meeting if PC is treated
public function pippaRejectSex(itemGiven:String = ""):void
{
	clearOutput();
	clearMenu();
	showPippa();
	pippaAffection( -5);
	pippaDominance(-1);
	
	output("Pippa’s look of lust quickly turns to annoyance. <i>“Seriously? You’re treated and you’re turning down sex?”</i>");
	
	output("\n\nYou explain that you came in for a massage, ");
	
	if (pc.isBimbo() || pc.isBro())
	{
		output("<i>“Well, like, I was just thinkin’ a massage sounded nice.”</i>");
	}
	else
	{
		output("<i>“Well, I came in for a massage.”</i>");
	}
	
	output("\n\nShe stares at you for a second before responding, <i>“You know what? You can have your massage. Another time. For now, out.”</i> She walks over to the door and opens it, gesturing toward the outside.");
	if (itemGiven != "" && itemGiven != NEVERMIND) output(" Her face softens slightly and she says, <i>“Thank you again, for the food.”</i>");
	
	addButton(0, "Next", move, rooms[currentLocation].eastExit);
}

public const OIL_SOURCE_STANDARD_MASSAGE:String = "standard massage";
public const OIL_SOURCE_SPECIAL_MASSAGE:String = "special massage";

public const PIPPA_OIL_WARM:int = 0;
public const PIPPA_OIL_COOL:int = 1;
public const PIPPA_OIL_NUMB:int = 2;
public const PIPPA_OIL_LUST:int = 3;
public const PIPPA_OIL_SLIP:int = 4;

// Gets the current type of oil that Pippa is using, with the default being warming oil
public function pippaCurrentOil(change:int = -1):int
{
	if (change != -1) flags["PIPPA_CURRENT_OIL"] = change;
	else if (flags["PIPPA_CURRENT_OIL"] == undefined) flags["PIPPA_CURRENT_OIL"] = PIPPA_OIL_WARM;
	
	return flags["PIPPA_CURRENT_OIL"];
}

// Apply an oil effect status effect for Pippa’s massages based on currently used oil
public function applyOilEffect(target:Creature, source:String):void
{
	clearOilEffects(target);
	
	var name:String = "";
	var desc:String = "";
	var duration:int;
	var color:uint;
	
	if (source == OIL_SOURCE_STANDARD_MASSAGE) duration = 720;
	else if (source == OIL_SOURCE_SPECIAL_MASSAGE) duration = 1440;
	
	switch (pippaCurrentOil())
	{
		case PIPPA_OIL_COOL:
			name = "Oil Cooled";
			if(target == chars["PC"]) desc = "You’re covered in cool, protective oil!";
			else desc = target.capitalA + target.short + " is covered in cool, protective oil!";
			desc += "\nBurning Resistance: +" + Math.ceil(MathUtil.LinearInterpolate(5, 15, duration / 1440)) + "%";
			color = 0x59C7FF;
			break;
		case PIPPA_OIL_NUMB:
			name = "Oil Numbed";
			if(target == chars["PC"]) desc = "You’re covered in numbing, lust-inhibiting oil!";
			else desc = target.capitalA + target.short + " is covered in numbing, lust-inhibiting oil!";
			desc += "\nLust gains are decreased.";
			color = 0xBCAEC1;
			break;
		case PIPPA_OIL_LUST:
			name = "Oil Aroused";
			if(target == chars["PC"]) desc = "You’re covered in arousing, lust-inducing oil!";
			else desc = target.capitalA + target.short + " is covered in arousing, lust-inducing oil!";
			desc += "\nTeasing is more effective, but arousal comes more easily.";
			color = 0xFF8CD6;
			break;
		case PIPPA_OIL_SLIP:
			name = "Oil Slicked";
			if(target == chars["PC"]) desc = "You’re covered in super slippery oil!";
			else desc = target.capitalA + target.short + " is covered in super slippery oil!";
			desc += "\nIt’s easier to slip away from someone’s grasp.";
			color = 0xB793C4
			break;
		case PIPPA_OIL_WARM:
		default:
			name = "Oil Warmed";
			if (target == chars["PC"]) desc = "You’re covered in warm, protective oil!";
			else desc = target.capitalA + target.short + " is covered in warm, protective oil!";
			desc += "\nFreeze resistance: +" + Math.ceil(MathUtil.LinearInterpolate(5, 15, duration / 1440)) + "%";
			color = 0xFF7A59;
			break;
	}
	
	target.createStatusEffect(name, 0, 0, 0, 0, false, "Icon_Water_Drop", desc, false, duration, color);
}

public const OIL_STATUS_NAMES:Array = [
	"Oil Warmed",
	"Oil Cooled",
	"Oil Numbed",
	"Oil Aroused",
	"Oil Slicked"
];

// Removes all oil effects
public function clearOilEffects(target:Creature):void
{
	for (var i:int = 0; i < OIL_STATUS_NAMES.length; i++)
	{
		target.removeStatusEffect(OIL_STATUS_NAMES[i]);
	}
}

// Pippa’s standard massage scene
public function pippaStandardMassage():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	if (pc.isTaur())
	{
		output("\n\nPippa eyes you up and down and states, <i>“Well, I guess we won’t be needing the massage table. You kneeling will do.”</i>");
	}
	else
	{
		output("Pippa leads you to her massage table.");
	}
	
	output(" <i>“I’m going to go to another room and let you get");
	if (!pc.isNude()) output(" undressed and");
	output(" settled in. Just give me a call when you’re ready.”</i>");
	
	output("It");
	if (pippaSexed(0) > 0) output(" seems weird, considering you’ve seen each other naked, to say the least, but it");
	output(" seems she was serious when she put <i>“Professional”</i> on her sign. With her now out of the room, you");
	
	if (!pc.isNude()) output(" strip completely nude and");
	
	if (pc.isTaur()) output(" kneel down");
	else output(" lay face down on the massage table");
	
	output(" and call her back in. She reappears, now with a bottle of oil strapped to her waist. You close your eyes and let her go to work.");
	
	output("\n\nThe massage is... well, it’s more or less what you expect out of a massage. Pippa starts on your");
	
	if (pc.isTaur())
	{
		output(" [pc.lowerBody], working oil into your [pc.hips] and [pc.legs], and of course, your [pc.ass], before moving onto your"); 
	}
	
	output(" upper body. She works out all of your back muscles");
	
	if (pc.hasWings()) output(", paying special attention to the spots where your wings meet your back");
	
	output(".");
	
	if (!pc.isTaur()) output(" She moves onto your [pc.lowerBody], working oil into your [pc.legs]. Having covered your back, she has you flip over.");
	else output(" Your upper back and [pc.lowerBody] taken care of, she moves around to your front.");
	
	output(" On the front, she starts with your [pc.arms], but quickly moves onto squeezing and working her oil into your [pc.chest]. ");
	
	if (pc.isTaur()) output("Finally, ");
	else output("After, ");
	
	output("she gives some attention to your [pc.belly].");
	
	if (!pc.isTaur())
	{
		output(" Finally, she moves back to your [pc.lowerBody], focusing now on your [pc.thighs].");
		
		if (pc.hasGenitals()) output(" Her hands brush near your genitals, but never make contact.");
	}
	
	output("\n\nWhile the massage is standard in terms of routine, Pippa is quite talented with her fingers. Her fingers are almost magic, dancing over your [pc.skin] and drawing out any and all fatigue and soreness. " + (pippaCurrentOil() == PIPPA_OIL_LUST ? "However, you can’t exactly say the massage was relaxing; thanks to the oil, you’ve been driven into a state of barely contained lust." : "Throughout the massage, you’re driven into a relaxing bliss. And the oil is also worth mentioning. ")); 
	
	switch(pippaCurrentOil())
	{
		case PIPPA_OIL_WARM:
			output("You feel warm and tingly everywhere she touches, as if you’ve been basking in the sun.");
			break;
		case PIPPA_OIL_COOL:
			output("You feel cool, goosebumps rising everywhere she touches, as if a refreshing breeze blows over you.");
			break;
		case PIPPA_OIL_NUMB:
			output("You’re not sure it’s really the best choice for a massage, but it will certainly help you focus.");
			break;
		case PIPPA_OIL_SLIP:
			output("You’re so slick with oil that her hands practically glide over you by the end of the massage.");
	}
	
	
	output(" You’re not even sure how much time has passed when Pippa finally removes her hands from you and states, <i>“Done.”</i>");
	
	output("\n\nYou open your eyes and ");
	
	if (pc.isTaur()) output("slowly stand up.");
	else output("slowly sit up.");
	
	if (pippaCurrentOil() == PIPPA_OIL_LUST) pc.changeLust(40);
	else if (pippaCurrentOil() != PIPPA_OIL_NUMB) pc.changeLust(20);
	
	
	if (pc.lust() >= 33 && pc.hasGenitals() && flags["PIPPA_FLIRTED"] == 1 && pippaCurrentOil() != PIPPA_OIL_NUMB)
	{
		output(" You look at Pippa and she’s smiling, with a lusty twinkle in her eye. <i>“Maybe we aren’t done.”</i> " + (pippaCurrentOil() == PIPPA_OIL_LUST ? "Unsurprisingly, the arousing oil’s drawn a physical reaction from you, leaving " : "You hadn’t even noticed in your state of relaxation, but you’ve become quite aroused, "));
		
		if (pc.hasCock()) output("your [pc.cock] erect");
		if (pc.isHerm()) output(" and ");
		if (pc.hasVagina()) output("your [pc.pussy] wet");
		
		output(". <i>“What do you say we take care of that?”</i>");
		if (pippaHappyEndingsGiven(0) == 0) output(" Well this is new.");
		
		addButton(0, "Turn Down", pippaHappyEndingReject, undefined, "No Happy Ending", "You’re happy enough with just a massage.");
		addButton(1, "Hands", pippaHappyEnding, "hands", "Happy Ending", "Pippa will give you a happy ending using her hands.");
		addButton(2, "Mouth", pippaHappyEnding, "mouth", "Happy Ending", "Pippa will give you a happy ending using her mouth.");
		if (pc.hasCock() && !pc.isTaur()) addButton(3, "Tits", pippaHappyEnding, "tits", "Happy Ending", "Pippa will give you a happy ending using her tits.");
	}
	else
	{
		output("You look at Pippa and she’s smiling. <i>“Hope you enjoyed it, " + pippaCallsSteele() + ". I’ll leave you to get dressed. Please take your time.”</i>");
		
		addButton(0, "Next", mainGameMenu);
	}
	
	processTime(30);
	if(pc.hasStatusEffect("Sore Counter")) soreChange(-4);
	applyOilEffect(pc, OIL_SOURCE_STANDARD_MASSAGE);
	pippaStandardMassagesGiven();
	pippaAffection(1);
	pc.credits -= pippaStandardMassageCost();
	pc.changeHP(pc.HPMax() / 4);
	pc.changeEnergy(pc.energyMax() / 4);
	
	
}

// Handles all variations on Pippa giving the PC a happy ending after a standard massage
public function pippaHappyEnding(type:String = "hands"):void
{
	clearOutput();
	clearMenu();
	showPippa(false, true);
	
	var genitalType:int;
	var penisIndex:int;
	var vaginaIndex:int;
	
	if (type == "tits") genitalType = 0;
	else if (pc.isHerm()) genitalType = rand(2);
	else if (pc.hasCock()) genitalType = 0;
	else genitalType = 1;
	
	if (pc.hasCock()) penisIndex = rand(pc.cocks.length);
	else if (pc.hasVagina()) vaginaIndex = rand(pc.vaginas.length);
	
	output("It’s not exactly your idea of professional, but you certainly aren’t going to turn down extending the massage to other areas of your body. ");
	
	if (type == "hands")
	{
		output("Pippa smiles and rubs some of her massage oil into her hands, then quickly moves ");
		
		if (pc.isTaur())
		{
			if (genitalType == 0) output("under you");
			else output("behind you");
		}
		else output("next to your waist");
		
		output(". She takes her hand and ");
		
		if (genitalType == 0)
		{
			output("slowly rubs oil all over your [pc.cock " + penisIndex + "] before gently wrapping her hand around it and gently stroking up and down.");
			
			if (pc.hasVagina() && !pc.isTaur()) output(" With her other hand, she rubs oil into your [pc.pussy " + vaginaIndex + "], slips some fingers in, and begins finger fucking you.");
		}
		else
		{
			output("slowly rubs oil into your [pc.pussy " + vaginaIndex + "], slips some fingers in, and begins finger fucking you.");
			
			if (pc.hasCock())
			{
				output(" With her other hand, she ");
				if (pc.isTaur()) output("reaches under you and ");
				output("strokes your [pc.cock " + penisIndex + "], rubbing oil into it at the same time.");
			}
		}
	}
	else if (type == "mouth")
	{
		output("Pippa licks her [pippa.lips] and makes her way ");
		
		if (pc.isTaur())
		{
			if (genitalType == 0) output("under you");
			else output("behind you");
		}
		else output("next to your waist");
		
		output(". She tentatively licks your ");
		
		if (genitalType == 0)
		{
			output("[pc.cock " + penisIndex + "] before taking ");
			
			if (pc.cocks[penisIndex].volume() <= 11) output("the whole thing");
			else output("as much as possible");
			
			output(" in her mouth. While her [pippa.lips] stroke up and down your shaft, her tongue swirls around licking at and massaging every square inch it can reach.");
			
			if (pc.hasVagina() && !pc.isTaur()) output(" Though her mouth is wrapped around your [pc.cock " + penisIndex + "], her hands are free, and she uses one to gently rub and fuck your free [pc.pussy " + vaginaIndex + "].");
		}
		else
		{
			output("[pc.pussy " + vaginaIndex + "] before devouring it entirely. She sucks and licks all around, inside and out, getting at every square inch she can reach. If you didn’t know better, you’d think she was trying to literally eat your pussy.");
			
			if (pc.hasCock() && !pc.isTaur()) output(" While she tends to your [pc.pussy " + vaginaIndex + "] with her mouth, she uses her free hand to gently stroke your [pc.cock " + penisIndex + "].");
		}
	}
	else if (type == "tits")
	{
		output("Pippa slips her arms out of her tank top and begins to raise it up, but, rather than removing it, she leaves it wrapped around her [pippa.tits] like a mini tube top. Her [pippa.tits] spill over the top and bottom of her make-shift wrap, creating an inviting passage of soft boob flesh underneath. She takes some of her massage oil and rubs it into her dual cleavage, and, sticking her hand in, all throughout the soft, fleshy passage of cleavage she’s created. She approaches you, holds her [pippa.breasts] up over your [pc.cock " + penisIndex + "], and lowers her [pippa.breasts] down over it. Your [pc.cock " + penisIndex + "] surrounded by warm, soft, breast flesh, she begins moving up and down and wraps her arms around her chest, making the passage even tighter.");
	}
	
	output("\n\nWhether it’s because of the oil, the state of relaxation you’ve been driven into, or some combination of the two, you’re in a heightened state of arousal, and her ");
	
	if (type == "hands") output("hands are just as magical now as they were during the massage");
	else if (type == "mouth") output("tongue is just as magical as her hands were during the massage");
	else if (type == "tits") output("[pippa.breasts] wrapped around your [pc.cock " + penisIndex + "] are as magical as her hands were during the massage");
	
	output(". Already you feel your body tightening up, and, as soon as it comes on, it releases. Orgasmic bliss washes over you, ");
	
	if (type == "hands") output("coating Pippa’s hand in");
	else if (type == "mouth") output("filling Pippa’s mouth with");
	else if (type == "tits") output("flooding the valley of Pippa’s [pippa.breasts] with");
	
	output(" your ");
	
	if (genitalType == 0) output("[pc.cum]");
	else output("[pc.girlcum]");
	
	output(". She just sits up, tilts her head,");
	
	if (type == "mouth") output(" swallows,");
	
	output(" smiles at you, and says, <i>“ I hope you’ll come back again.”</i>");
	
	
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
	
	output("You inform Pippa that you’re happy with just a massage, and she’s fine with that, <i>“Want to keep the massage strictly professional, huh? I can respect that. I’ll leave you to get dressed then. Please take your time.”</i>");
	
	addButton(0, "Next", mainGameMenu);
}

// Pippa’s nuru massage scene part 1
public function pippaSpecialMassage():void
{
	clearOutput();
	clearMenu();
	showPippa(true, true);
	
	output("Pippa smiles and requests, <i>“Give me just a little bit to prepare.”</i> She walks away, but reappears a few minutes later, looking no different. She leads you to her bed, and it’s obvious what she was preparing. Her bed is devoid of pillows or any typical bedding. The mattress has been wrapped in what seems to be some sort of plastic sheet, shining with an oily gloss. Towels are laid out all around the bed, and, rather than the bottle of oil that would be present at a normal massage, a bucket of oil sits on her nightstand. <i>“Now then, let’s get started.”</i>");
	
	output("\n\nPippa removes her clothes, not making a show of it, but not moving quickly either. She first removes her constricting tank top, letting her [pippa.belly] and [pippa.breasts] free, and then pulls her tight yoga pants down over her [pippa.legs], unleashing her [pippa.ass].");
	
	if (!pc.isNude()) output(" Next she turns her attention to you, stripping you of all of your gear, and brushing her hands over your skin at every opportunity.");
	
	output(" With the both of you naked, she dips her hands in the bucket of oil and runs them down the sides of your body. Her hands come to rest on your [pc.hips] and she says, <i>“You do me.”</i> You dip your own hands into the oil and, ");
	
	switch (pippaCurrentOil())
	{
		case PIPPA_OIL_WARM:
			output("its warmth already beginning to seep into you");
			break;
		case PIPPA_OIL_COOL:
			output("its coolness already beginning to seep into you");
			break;
		case PIPPA_OIL_NUMB:
			output("your hands already starting to numb");
			break;
		case PIPPA_OIL_LUST:
			output("your lust already rising");
			break;
		case PIPPA_OIL_SLIP:
			output("your hands already slick as can be");
			break;
	}
	
	output(", you reciprocate, rubbing oil all over Pippa’s body.");
	
	output("\n\nYou start by massaging it into each other’s chests. You run your hands over her [pippa.tits], gently squeezing and running your hands all around them. As you do, a light flush begins to spread through her chest. You stick your oiled up fingers into her inverted nipples, their hidden size obvious to the touch of your probing fingers. As your fingers emerge, so do her nipples, hardening with the further flushing of her chest. You fair about the same as she gives the same attention to you, rubbing the oil into your [pc.chest].");
	
	if (pc.isLactating()) output(" In your case, her massaging causes some of your [pc.milk] to dribble out and mix with the oil.");
	if (pippaCurrentOil() == PIPPA_OIL_NUMB) output(" Even with the numbing properties of the oil, you can only resist so much eroticism.");
	
	output("\n\nYou quickly finish oiling up your upper bodies and move onto your lower bodies. Pippa does you first, running her hands around your thighs");
	
	if (pc.hasGenitals())
	{
		output(" and teasing you, barely brushing by your ");
		
		if (pc.hasCock()) output("[pc.cocks]");
		if (pc.isHerm()) output(" and ");
		if (pc.hasVagina()) output("[pc.vaginas]");
		
		output(", but never really touching them. She leaves you waiting and moves on to oil");
	}
	else output(" before oiling");
	
	output(" up the rest of your [pc.legs]. Then she has you turn around, and grabs your [pc.ass]. But rather than rubbing oil into, she lets go after a moment, and you feel her [pippa.breasts] pressing into you. She wraps her arms around your [pc.hips] and rubs her breasts up and down, dragging her nipples across your [pc.buttcheeks] and rubbing oil into them. Your ass must be sufficiently oiled, because she draws away from you and ");
	
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
		
		output(". Now that she’s oiled you up, not to mention made you ");
		
		if (pc.hasVagina()) output("wet");
		if (pc.isHerm()) output(" and ");
		if (pc.hasCock()) output("hard");
		
		output(", she ");
	}
	
	output("stands up.");
	
	output("\n\nYou kneel down and reciprocrate in full, rubbing oil all over Pippa’s [pippa.legs], but ignoring her [pippa.pussy]. ");
	
	if (pc.hasBreasts())
	{
		if (pc.biggestTitSize() < 19) output("Your [pc.tits] are quite a bit smaller than Pippa’s but you still decide to use them ");
		else output("You use your [pc.tits] ");
		
		output("to rub oil into her [pippa.ass], just as she she did, enjoying it as much as when she did it to you");
		
		if (pc.isLactating()) output(", and leaving a mess of [pc.milk] all over her ass");
	}
	else
	{
		output("With your [pc.chest] lacking in tits, you use your hands to oil up Pippa’s [pippa.ass]. You squeeze, and knead while you’re at it, and even run your hand through her crack, teasing at her [pippa.asshole]");
	}
	
	output(". You finish up, rubbing oil into her [pippa.pussyNoun] and running her [pippa.clit] through your fingers. Now that you’re both oiled up, ");
	
	switch (pippaCurrentOil())
	{
		case PIPPA_OIL_WARM:
			output("heat radiates through you");
			break;
		case PIPPA_OIL_COOL:
			output("goosebumps cover your body");
			break;
		case PIPPA_OIL_NUMB:
			output("your skin’s barely receptive to touch");
			break;
		case PIPPA_OIL_LUST:
			output("you can barely contain your lust");
			break;
		case PIPPA_OIL_SLIP:
			output("you can barely move without slipping");
			break;
	}
	
	output(", and you’re both rather flushed. Pippa has you lay down on the bed face down. ");
	
	if (pippaSpecialMassagesGiven(0) <= 3) output("Between the oil covering your body and the oil covering the bed, you nearly fall onto the floor " + (pippaCurrentOil() == PIPPA_OIL_SLIP ? "three times" : "twice") + " trying to climb on. This will take some getting used to.");
	else if (pippaCurrentOil() == PIPPA_OIL_SLIP) output("Even with your experience in climbing onto an oil-covered bed while covered in oil, you have some trouble climbing on thanks to the extra slippery oil.")
	
	output(" Once you’re settled down on the bed, Pippa" + (pippaCurrentOil() == PIPPA_OIL_SLIP ? "" : " deftly") + " climbs on top of your back.");
	if (pippaCurrentOil() == PIPPA_OIL_SLIP) output(" Given the oil in use, even she struggles a bit to do so.");
	
	pc.credits -= pippaSpecialMassageCost();
	processTime(15);
	if (pippaCurrentOil() == PIPPA_OIL_LUST) pc.changeLust(60);
	else if (pippaCurrentOil() == PIPPA_OIL_NUMB) pc.changeLust(25);
	else pc.changeLust(30);
	
	addButton(0, "Next", pippaSpecialMassageII);
}

// Pippa's nuru massage scene part 2
public function pippaSpecialMassageII():void
{
	clearOutput();
	clearMenu();
	showPippa(true, true);
	
	output("The massage truly starts, as she begins working on your back muscles, but now, the ministrations of her hands alternate with the feeling of her rubbing her [pippa.tits] all up and down your backside. Sometimes she uses her tits and hands at the same time; as her hands work on your shoulders, you feel her [pippa.nipples] pressing into your lower back. To work on your legs, she flips around, resting her [pippa.pussyNoun] on your back and her breasts on your ass.");
	
	output("\n\nTaking advantage of the slipperiness, Pippa easily flips you onto your back beneath her. On your front, she starts with your [pc.arms]. She works on your arm muscles only briefly, relative to a normal massage, and then, in turn, lifts each arm and sticks it into the depths of her cleavage. She runs wraps her [pippa.breasts] around each arm completely, and strokes up and down, breast fucking herself with each of your arms. After she’s done with your arms, she straddles your waist and works on your [pc.chestNoun], working out any and all stress in your pecs");
	
	if (pc.breastRows[0].breastRating() >= 4) output(", even through your large [pc.breastsNoun]");
	
	output(". She slides down and lays flat on top of you, pressing her [pippa.tits] into your [pc.chest], and uses her hands to massage your shoulders. Finished with your upper body, Pippa flips around and massages the fronts of your legs. ");
	
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
			
			output("Pippa rights herself and straddles your hips. She presses down, not letting you penetrate her, but trapping your [pc.cock " + cockIndex + "] flat between your body and her [pippa.pussy]. She grinds her [pippa.pussyNoun] over your [pc.cockNoun], slowly, but steadily. Her aroused pussy lips are swollen up, enveloping your cock in wet, oily, warmth as she grinds");
			
			if (pippaCurrentOil() == PIPPA_OIL_COOL) output(", lusty body heat penetrating the cool oil");
			
			output(". After so much touching and teasing throughout the massage, you’re both already close to your limits, flushed, sweaty, and panting. She climaxes first, coating your cock in her juices. Pushed over the edge, you splatter your [pc.belly] and [pc.chest] with your own [pc.cum].");
		}
		else if (pc.hasVagina())
		{
			output("Pippa rights herself, and locks her legs with yours. She presses herself into your crotch, pressing her [pippa.pussy] into your [pc.pussies]. She begins grinding, slowly but steadily rubbing her [pippa.pussyNoun] against your [pc.pussies]. Her aroused, swollen pussy lips feel as good as you imagine her fingers might. As she tribs, your pussies begin to feel like one wet, oily");
			
			if (pippaCurrentOil() == PIPPA_OIL_COOL) output(" mass of pussy flesh, hot with arousal in spite of the cool oil");
			output(", hot mass of pussy flesh");
			
			output(". After so much touching and teasing throughout the massage, you’re both already close to your limits, flushed, sweaty, and panting. She hugs tight onto your leg, and you climax together, coating each other in the lusty mix of your juices.");
		}
	}
	else
	{
		output("She finishes up with your legs, finishing up with all of your body parts. She doesn’t look done however; she’s flushed and sweating, and her breathing is heavy. This massage may be a paid service, but she has certain expectations of it. She rights herself and locks her legs with yours. She presses her [pippa.pussy] into your bare crotch and, hugging your leg, begins grinding. It doesn’t do anything for you, but you let her have her fun. Her pussy lips are swollen with arousal and you can feel them and her [pippa.clit] dragging over your skin. After the teasing and touching throughout the massage, it doesn’t take long for her to orgasm, coating your featureless crotch in her juices.");
	}
	
	output("\n\nPippa collapses on top of you and just relaxes there for a little bit. Eventually she climbs off and you carefully slide off after her. She looks at you, her eyes tired, and says, <i>“I hope you enjoyed that, " + pippaCallsSteele() + ". I’m going to clean up in here and take a shower. And maybe a nap. I’ll see you later.”</i>");
	
	processTime(30);
	if(pc.hasStatusEffect("Sore Counter")) soreChange(-3);
	applyOilEffect(pc, OIL_SOURCE_SPECIAL_MASSAGE);
	pippaSpecialMassagesGiven();
	pippaAffection(3);
	pc.changeHP(pc.HPMax() / 2);
	pc.changeEnergy(pc.energyMax() / 2);
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
	
	output("Pippa looks a little annoyed. <i>“That’s too bad. I’ll be here if you change your mind at some point.");
	if (itemGiven != "" && itemGiven != NEVERMIND) output(" Thanks again for the food.");
	output("”</i>");
	
	addButton(0, "Next", move, rooms[currentLocation].eastExit);
}

// Description of entering Pippa’s house
public function pippaHouseBonus(arg:String = ""):void
{
	removeUvetoCold();
	author("Ascent");

	output("You stand in Pippa’s house, a welcome reprieve from the cold. There’s nothing too remarkable about the pig girl’s house except for her massage table, visible in another room. At the moment, she is " + RandomInCollection("eating", "eating", "massaging her hands", "reading", "doing yoga", "exercising her fingers", "cleaning") + ".");
	
	addButton(0, "Pippa", pippaMainMenu);
}

// Pippa's main menu that leads to other menus and scenes
public function pippaMainMenu(arg:Array = null):void
{
	if (arg == null || arg[0] != NEVERMIND) clearOutput();
	clearMenu();
	showPippa();
	
	if (arg == null)
	{
		if (pippaOnShip()) output("Pippa playfully greets you, <i>“Hey there, Captain.”</i> She holds up her hands and slowly slowly wiggles her fingers. <i>“Need my hands, or were you hoping for something else?”</i>");
		else output("You approach Pippa and she greets you, <i>“Hey, " + pippaCallsSteele() + ". What’re we getting up to today?”</i>");
	}
	else if (arg[0] != NEVERMIND) output("Pippa’s eyes light up. <i>“Food for me?”</i> " + pippaEatFood(arg[0], arg[1]) + " <i>“Thanks, " + pippaCallsSteele() + ".”</i>");
	
	addButton(0, "Appearance", pippaAppearance);
	
	addButton(1, "Talk", pippaTalkMenu);
	
	if (hasValidPippaFood()) addButton(2, "Give Food", givePippaFoodMenu, pippaMainMenu);
	else addDisabledButton(2, "Give Food", "Give Food", "You don’t have any food to give Pippa.");
	
	if (flags["PIPPA_FLIRTED"] == 1)
	{
		if (pc.lust() >= 33) addButton(3, "Sex", pippaSexMenu, pippaMainMenu);
		else addDisabledButton(3, "Sex", "Sex", "You’re not currently aroused enough for sex.");
	}
	else
	{
		if (pc.lust() >= 33) addButton(3, "Flirt", pippaFlirt);
		else addDisabledButton(3, "Flirt", "Flirt", "You’re not currently aroused enough for sex.");
	}
	
	addButton(5, "Massage", pippaStandardMassage, undefined, "Standard Massage", "Get a massage from Pippa\n\nCost: " + pippaStandardMassageCost() + " Credits");
	
	if (MailManager.isEntryViewed("pippa_nuru") && !pc.isTaur()) addButton(6, "Nuru Massage", pippaSpecialMassage, undefined, "Nuru Massage", "Get a full, body-to-body massage from Pippa\n\nCost: " + pippaSpecialMassageCost() + " Credits");
	else addDisabledButton(6, "Locked", "Locked", "You’ll have to get to know Pippa better for this and not be a taur.");
	
	if (flags["PIPPA_SETTLED_IN"] == 1) addButton(7, "Oil", pippaOilMenu, undefined, "Oil", "Select an oil for Pippa to use in her massages.");
	
	if (pippaOnShip())
	{
		addButton(13, "Evict", pippaAskToLeave, undefined, "Evict", "Potentially kick Pippa off your ship for the time being.");
		addButton(14, "Back", crew);
	}
	else addButton(14, "Leave", mainGameMenu);
}

// Bend Pippa over and fuck her in the ass or with her having a high enough top preference, Pippa may ride Steele's cock with her ass
public function pippaFuckAss():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	var topVariation:Boolean = false;
	
	output("At the moment, you can’t keep your focus off of Pippa’s gigantic ass. ");
	
	if (pc.isTaur())
	{
		output("You’d love to grab hold of it, but, unable to reach it, you tell her to turn around and bend over. You’ll have to let your [pc.cocks] do all of the feeling.");
		
		output("\n\nShe smiles and giggles, <i>“You want my ass, huh?”</i>");
	}
	else
	{
		// no top variation if taur, so do check here
		if (flags["PIPPA_ASS_FUCKED"] == 1 && randInRange(75, 125) < pippaDominance()) topVariation = true;
		
		output("You move toward her and embrace her, your hands immediately going for her [pippa.ass]. She grabs the sides of your face and forces her tongue into your mouth as you squeeze and knead her ass. As your tongues dance, lips pressed together, and your hands roam the expanse of her ass, you feel blood rushing to your [pc.cocks] as they stiffen");
		
		if (pc.hasVagina())
		{
			output(", not to mention a growing wetness in your [pc.cunts].");
		}
		
		output(" Her backside is as soft as it is huge, your hands sinking into her warm flesh as they explore and play with her curvy form, almost lost in carnal exploration. You’re so caught up in your groping, in fact, that you temporarily lose sight of your original intentions. At least until she suddenly breaks off the kissing, looks at you with lust-filled eyes, and giggles, <i>“You really like my ass, huh?”</i>");
		
		output("\n\nNot even waiting for you to respond, Pippa places one hand in the middle of your [pc.chest] and pushes you " + (topVariation ? "roughly" : "gently") + " back.");
		
		if (topVariation) output(" You’ve been positioned in front of a chair, and allow yourself to fall back into a seated position.");
	}
	
	output(" She turns her back to you and, as she bends over, slowly, sensuously peels down her tight yoga pants. Her ass pops free from her pants, even larger than you’d realized. She lightly sways it back and forth like a pendulum, and right above, her curly little tail twirls in a complementing hypnotic spiral. You can only stand mesmerized");
	
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
	
	if (topVariation)
	{
		pippaDominance(1);
		
		if (pc.isCrotchGarbed()) output(" At least until she turns around and walks toward you. <i>“Let’s get you situated.”</i> She again bends over, this time to pull off your pants, giving her a look at your [pc.cocks]");
		else output(" She slowly moves back toward you, still swaying her [pippa.ass], until she’s right in front of you");
		
		if (pc.isChestGarbed()) output(", and while she does, you quickly pull off your top");
		
		if (pc.isCrotchGarbed()) output(". Now that you’re stripped, she turns back around, once again giving you an eyeful of her [pippa.ass]");
		
		output(". You reach forward, placing hands on her [pippa.hips], and she sits on your lap, trapping your [pc.cocks] in the valley of flesh that is her ass. Though your hands are on her hips, they’re merely along for the ride as she presses the full weight of her [pippa.ass] into your lap, grinding and stroking your [pc.cocks] with her [pippa.buttcheeks]. You can feel the warm, soft flesh of her ass wrapped around you begin to feel slick, as your [pc.cocks] already " + (pc.cocks.length > 1 ? "drool" : "drools") + " precum. Before you can get too into it, Pippa stands up again. She reaches back toward you and grabs your " + (pc.cocks.length > 1 ? "longest cock" : "[pc.cock]") + ", before again sitting on your lap. She guides your [pc.cock " + longestCockIndex + "] through her [pippa.buttcheeks] and lines your [pc.cockHead " + longestCockIndex + "] up with her [pippa.asshole]. She pushes down further, and your [pc.cockNoun " + longestCockIndex + "], already lubed with precum, easily slips inside her [pippa.asshole], eliciting a pleasured moan from her [pippa.lips]. She goes down, her inner walls squeezing and massaging your length all the while, until your [pc.cock " + longestCockIndex + "] is bottomed out in her and her [pippa.ass] is fully seated in your lap. Pippa’s [pippa.buttcheeks] have swallowed up so much of the length of your [pc.cock " + longestCockIndex + "] that even hilted, ");
		
		if (pc.cocks[longestCockIndex].cLength() < 12) output("less than half of your length is actually in her asshole.");
		else if (pc.cocks[longestCockIndex].cLength() <= 15) output("hardly over half of your length is actually in her asshole.");
		else if (pc.cocks[longestCockIndex].cLength() <= 30) output("a large stretch of your length isn’t even actually in her asshole.");
		else output("a noticeable stretch of your length isn’t even actually in her asshole.");
		pc.cockChange();
		
		output("\n\nPippa begins to move, bouncing in your lap, dragging her [pippa.asshole] up and down the length of your [pc.cock " + longestCockIndex + "], her inner walls caressing and massaging you all the while. As she moves, your shaft is also squeezed and stroked between her [pippa.buttcheeks], providing a double onslaught of pleasure, and a sensation almost like she’s giving you a tit job while you fuck her. As she grinds her [pippa.ass] into your [pc.cock " + longestCockIndex + "], you reach around, placing a hand on her [pippa.pussyNoun]. She’s soaked, lips swollen with arousal. You run your fingers along her [pippa.pussy], gently stroking her clit and, with every stroke you make, her [pippa.asshole] spasms and contracts along the length of your [pc.cock " + longestCockIndex + "]. Breathing heavy, moaning with arousal, Pippa stops bouncing, presses her torso back into you, and does all of the work with her [pippa.hips].");
		
		output("\n\nYour [pc.chest] pressed into Pippa’s back, you feel her warmth, and yearn to see the whole of her naked body. You remove your hand from her [pippa.pussyNoun], eliciting a slight whine from her [pippa.lips]. You silence her with a sharp upward yank on her tanktop, freeing her [pippa.belly] and [pippa.breasts]. Throwing the shirt aside, you resume stroking her [pippa.pussy] with one hand. The other, you wrap around her torso and fill with one of her [pippa.breasts]. Her [pippa.breastsNoun] are as soft and warm as her [pippa.ass], and just as gropeable. She’s flush with arousal, and they’re slick with light sweat, as is her back. Nonetheless, her [pippa.nipples], normally inverted but long since emerged, are large enough that you’re able to grasp one firmly between your fingers. As you finger her [pippa.pussy] and squeeze her [pippa.nipple], your attention is drawn back to her [pippa.ass], as it spasms around your [pc.cock " + longestCockIndex + "] more and more in response to your ministrations. You hold onto her soft body tightly as her grinding becomes faster and wilder, and she once again begins bouncing in your lap, almost uncontrollably.");
	}
	else
	{
		pippaDominance(-1);
		
		output(" She bends over further, looks through her legs at you and asks, <i>“What are you waiting for, " + pippaCallsSteele() + "?”</i> She stands up slightly, places her hands on the back of a chair and, still swaying her [pippa.ass], without even looking at you now, commands, <i>“Take me.”</i>");
		
		output("\n\nYou quickly oblige, taking off your ");
		
		if(pc.isCrotchGarbed()) output("clothes");
		else output("gear");
		
		output(" and positioning yourself ");
		
		if (pc.isTaur()) output("over");
		else output("behind");
		
		output(" her. For just a brief moment you rub your [pc.cock " + longestCockIndex + "] in between her [pippa.buttcheeks], taking in the feel of a valley of ass flesh caressing your length. However, that’s not what you came for; you start pushing through her [pippa.buttcheeks] and line your [pc.cock " + longestCockIndex + "] up with her [pippa.asshole]. Already, your [pc.cockNoun] has been squeezed and stroked into producing precum, dripping into and lubing up Pippa’s waiting hole. You push further, [pc.cockHead " + longestCockIndex + "] pressing up against her hole, before pushing futher still and spreading her [pippa.asshole] around your [pc.cock " + longestCockIndex + "], eliciting a pleasured moan from the pig girl’s [pippa.lips]. You slowly push in as far as you can. Her inner walls squeeze and massage you all the while, and your progress is finally stopped by her [pippa.ass]");
		
		if (pc.balls > 0) output(", where your balls come to rest.");
		else output("where you finally bottom out to the hilt of your [pc.cock " + longestCockIndex + ".");
		
		output(" Pippa’s [pippa.buttcheeks] have swallowed up so much of the length of your [pc.cock " + longestCockIndex + "] that even hilted, ");
		
		if (pc.cocks[longestCockIndex].cLength() < 12) output("less than half of your length is actually in her asshole.");
		else if (pc.cocks[longestCockIndex].cLength() <= 15) output("hardly over half of your length is actually in her asshole.");
		else if (pc.cocks[longestCockIndex].cLength() <= 30) output("a large stretch of your length isn’t even actually in her asshole.");
		else output("a noticeable stretch of your length isn’t even actually in her asshole.");
		pc.cockChange();
		
		output("\n\nYou begin to move, pulling out until just your [pc.cockhead] remains in her asshole, before thrusting back in on repeat. The substantial valley that is her ass crack provides a unique sensation; your shaft is stroked and massaged by her [pippa.asshole], of course, but it also runs through her [pippa.buttcheeks], warm and wet, and almost like getting a tit job. Meanwhile, Pippa is moaning and panting heavily, unsprising given her [pippa.asshole] contracting and spasming along your length. You’re pretty sure you even heard a few snorts. ");
		
		if (!pc.isTaur()) output("She begins to move some on her own, grinding her [pippa.ass] into you. Feeling less need to have a firm grasp on her [pippa.hips], you snake one hand between her legs, feeling her [pippa.pussy]. As you expected, her lips are swollen with carnal desire. While she drags her [pippa.asshole] along your [pc.cock " + longestCockIndex + "], you finger her, drawing wilder movements from her [pippa.hips] and more spasming from her [pippa.asshole].");
		
		output("\n\nYou yearn to see all of Pippa’s naked body");
		
		if (pc.isTaur()) output(", and, thanks to a conveniently placed mirror, you’re off to a good start");
		
		output(". Through her tank top, you can tell her back is beginning to sweat. ");
		
		if (pc.isTaur())
		{
			output("You request that she remove the shirt; breath too occupied with moaning, she wordless does so. Her [pippa.tits] and her [pippa.belly] fall free, swinging and jiggling as you roughly fuck her ass. Her back is flushed, a darker, redder shade of pink than the rest of her body.");
			
			if (pc.biggestTitSize() >= 1)
			{
				output(" Unable to grab her ass, you find your hands moving up to your [pc.chest], squeezing them");
				
				if (pc.hasNipples())
				{
					output(" and pinching your [pc.nipples]");
					if (pc.isLactating()) output(", causing [pc.milk] to dribble down your torso");
				}
				
				output(".");
			}
			
			output(" Her flushed, jiggling body ");
			
			if (pc.biggestTitSize() >= 1) output("and the feeling of your own hands groping at your [pc.chest] ");
			
			output("urges you on to fuck her harder.");
		}
		else
		{
			output("You yank the shirt off, causing her [pippa.tits] and her [pippa.stomach] to fall free, swinging and jiggling as you fuck her ass. Her back is flushed, a darker, redder shade of pink than the rest of her body. You deliver a sharp spank to her ass, eliciting a squeal and a contracting asshole. You grab at her [pippa.ass], squeezing and groping it rougher than earlier. It’s now slick with light sweat, but your fingers sink into her flesh so deeply that you hold on with ease. The feel and sight of her, spasming asshole and flushed, jiggling body, urges you on to move faster and harder, and in turn you urger her on with the ministrations of your hands and your [pc.cock " + longestCockIndex + "] probing the depths of her [pippa.asshole]. You feed into each other’s lust until you’re nearly out of control.");
		}
	}
	
	output("\n\nPippa’s moaning and panting picks up before turning into full on squealing and snorting, drowning out the sound of your bodies slapping together. <i>“I’m so close, [pc.name]! Feed my asshole with your cum!”</i> Right as she finishes yelling, both her [pippa.asshole] and her [pippa.buttcheeks] squeeze on your [pc.cock " + longestCockIndex + "]. Already barely hanging on, you give in and cum. Your [pc.cum] squirts into her asshole. Having her bowels filled with your [pc.cum] pushes her over the edge. Her body quivers and her ass tightens even further; you couldn’t " + (topVariation ? "lift her off of you" : "pull out") + " even if you wanted to. Her hungry asshole draws from you every last drop of [pc.cum] it can get, milking you dry. Only after it’s eaten every last drop does it finally loosen up");
		
		if (topVariation) output(". She rests in your lap briefly, catching her breath, before slowly standing up, allowing your [pc.cock " + longestCockIndex + "] to plop free and bring with it just a small bit of your [pc.cum].\n\nShe turns around and smiles at you. ");
		else output(", allowing you to pull your [pc.cock " + longestCockIndex + "] out until it plops free, and with it, just a small bit of your [pc.cum].\n\nPippa slowly stands back upright and leans on you for a second, catching her breath. ");
	
	if (flags["PIPPA_ASS_FUCKED"] != 1)
	{
		output("<i>“You’re really something, " + pippaCallsSteele() + ". I hope that you’ll stop by again sometime. But for now, I need to get cleaned up. Bye bye, for now.”</i>");
	}
	else if (topVariation)
	{
		output("<i>“I think I liked that change of pace. Maybe I should be on top more often, " + pippaCallsSteele() + ". Well anyway, I should clean up, but I do hope I’ll see you later.”</i> She winks, and walks off to the shower.");
	}
	else
	{
		output("<i>“As good as always, " + pippaCallsSteele() + ". I’ve gotta clean up, but I’ll seeya later.”</i> She walks off, but not before blowing you a kiss.");
	}
	
	pippaSexed();
	pippaAffection(2);
	processTime(15);
	flags["PIPPA_ASS_FUCKED"] = 1;
	pc.orgasm();
	
	addButton(0, "Next", mainGameMenu);
}

// Use Pippa’s ass cheeks to get yourself off
public function pippaHotDog():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("Pippa moves as close to you as can be and brings her [pippa.face] right up to yours, before stopping just short of kissing you. You can feel her hot breath on your face as she whispers, <i>“I bet you want my ass again.”</i> You respond with action and begin to reach around her body and grope her ass, but she stops you. <i>“Now wait just a second.”</i> She quickly removes her tight clothing, letting her jiggling curves free, then she removes your ");
	
	if (pc.isCrotchGarbed()) output("clothes");
	else output("gear");
	
	output(" as well.");
	
	var smallestCockIndex:int = pc.smallestCockIndex();
	
	output("\n\nHaving stripped the both of you down, Pippa again moves close to you, this time, turning her backside toward you. She presses her [pippa.ass] into your crotch and begins to gently grind into you. Your [pc.cocks] stiffen");
	
	if (pc.cocks.length == 1) output("s and becomes lodged firmly between her [pippa.buttcheeks].");
	else output(", especially your smallest [pc.cock " + smallestCockIndex + "], which has become lodged firmly between her [pippa.buttcheeks].");
	
	output(" Her [pippa.buttcheeks] form a valley of soft, warm ass flesh, envelping your [pc.cock " + smallestCockIndex + "] in pleasure. Precum drools from your [pc.cockhead " + smallestCockIndex + "], spilling into her crack, and allowing her [pippa.ass] to smoothly stroke your shaft along its length. As she continues to grind, you kiss her neck and reach around to play with her [pippa.tits]. Her large, normally inverted nipples emerge under the touch of your probing fingers, coming to stand at an inch in length and you feel her light moaning through your [pc.lips] on her neck. ");
	
	if (pc.biggestTitSize() >= 6)
	{
		output("Her back is arched, but still, it presses up against your [pc.chest]");
		
		if (pc.hasNipples()) output(", rubbing your [pc.nipples]");
		if (pc.isLactating()) output(", causing your [pc.milk] to dribble down her back");
		
		output(".");
	}
	
	output("\n\nYou feel strangely relaxed, locked together as you are with Pippa, almost like you could stand forever, [pc.lips] on her neck, hands on her [pippa.tits], and [pc.cock] lodged in her ass crack, but she seems to be getting impatient, pressing her [pippa.ass] harder into your crotch. You reluctantly withdraw your hands from her [pippa.tits] and place one hand in the middle of her back, pushing her to bend her over a table. You’re treated to a view of her [pippa.ass], and before you know it, you’ve placed a hand on each cheek, groping at her [pippa.ass] as you were her tits. Your fingers sink into her flesh with ease, roaming and exploring her vast behind. You squeeze her [pippa.buttcheeks] around your [pc.cock " + smallestCockIndex + "], fucking it like a pair of massive tits. Her ass is so large that ");
	
	if (pc.cocks[smallestCockIndex].cLength() < 14) output("your cock is completely lost in it.");
	else if (pc.cocks[smallestCockIndex].cLength() < 16) output("the head of your cock barely peeks out from the top of her ass crack.");
	else if (pc.cocks[smallestCockIndex].cLength() < 28) output("more than half of your length is wedged in it.");
	else output(", even with your size, a substantial length of your [pc.cock " + smallestCockIndex + "] is wedged in it.");
	
	output("\n\nYou’re completely lost in Pippa’s [pippa.ass], running your [pc.cock " + smallestCockIndex + "] through her [pippa.buttcheeks], and fucking her cock-devouring, wobbling ass like it’s nothing more than your sex toy when she looks over her shoulder at you and flatly asks, <i>“Now you’re not thinking about my pleasure at all, are you?”</i> ");
	
	if (pc.isAss())
	{
		output("You respond with a sharp smack on her ass, sending ripples across the surface. She inhales sharply and moans, <i>“");
	}
	else
	{
		output("You feel a twinge of guilt and your [pc.cock " + smallestCockIndex + "] starts to soften, until she makes a noise almost like whining and says, <i>“Don’t stop, please. ");
	}
	
	output("To be honest, it turns me on");
	
	if (pippaDominance() > 66) output(", but either way, don’t you worry; I’ll get you back later. For now, go ahead and get");
	else if (pippaDominance() > 33) output(". Go ahead and fuck my ass like it’s your property. Get");
	else output(". Use my ass like it’s no more than your fuck toy, [pc.name]! Get");
	
	output(" yourself off!”</i> Having said that, one of her hands snakes between her legs and begins playing with her [pippa.pussy]. From the squishing sound, you gather that she’s soaked. Spurred on, you fuck her [pippa.buttcheeks] with renewed vigor. You manhandle her [pippa.ass], wrapping it around your [pc.cock " + smallestCockIndex + "], roughly squeezing it, occasionally slapping it, and even pinching it. By now it’s more red than pink, both from your treatment, and from the aroused flush covering the pig-morph’s body. A light sheen of sweat covers her body, and you can only barely keep a grip on her [pippa.ass].");
	
	output("\n\nYou feel an all-too-familiar tightening in your loins, and right on queue, Pippa’s moaning and breathing devolves into animalistic squealing and snorting. You wrap her [pippa.buttcheeks] around your cock with all of your strength and climax, ");
	
	if (pc.cocks[smallestCockIndex].cLength() < 14) output("filling the valley of her [pippa.ass] with your [pc.cum].");
	else output("shooting your [pc.cum] all over her back and into the air, much of it coming back down onto her [pippa.ass] and flowing into her valley of ass flesh.");
	
	output(" Her [pippa.buttcheeks] flex and squeeze along your length, milking out every last drop of [pc.cum] that they can; she certainly has some muscles under all of that soft ass flesh. Her crack is wet and sticky with your [pc.cum] by the time you’re dry. You finally remove your [pc.cock] from her [pippa.buttcheeks], letting go of her as you do. She collapses onto the table, still fingering her [pippa.pussy]. The pig slut pays no attention to you at all, laying there flushed, sweating, and covered in your [pc.cum] as she masturbates. You watch your [pc.cum] flow through the valley of her [pippa.ass] like a [pc.cumColor] river, until a bit drips down onto her [pippa.pussy]. Right as it does, she shudders and reachers her own climax. Her body convulses and her spasming [pippa.pussy] squirts the table with her [pippa.girlcum]. Her shvering finally calms down, and she sits quietly for a bit before almost whispering, <i>“I ");
	
	if (flags["PIPPA_HOTDOGGED"] == 1) output("still ");
	
	output("can’t believe getting my ass used like that feels so good. I’m just going to lay here for a bit before I get cleaned up, " + pippaCallsSteele() + ". You can go ahead and get going. I’ll seeya later.”</i>");
	
	flags["PIPPA_HOTDOGGED"] = 1;
	pippaSexed();
	pippaAffection(2);
	processTime(20);
	pc.orgasm();
	pippaDominance(-2);
	
	addButton(0, "Next", mainGameMenu);
}

// Select a dick or hardlight strapon to fuck Pippa’s pussy
public function pippaChooseCockToFuckPussy():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("Which cock do you want to fuck Pippa’s pussy with?\n");
	
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

// Let Pippa climb on top of you and ride your cock (or hardlight strapon) with her pussy (or, bottom variant, chance to fuck her pussy in missionary position)
public function pippaFuckPussy(cockOrStraponIndex:int):void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("Pippa places one hand between her legs, gently rubs her pussy through her tight yoga pants, and says, ");
	
	if (flags["PIPPA_ASS_FUCKED"] == 1) output("<i>“You know, " + pippaCallsSteele() + ", I love having my ass played with, but sometimes my pussy needs some love too. You think you can handle that?”</i>");
	else output("<i>“You know, " + pippaCallsSteele() + ", I’d really love to feel your cock in my pussy. How ‘bout it?”</i>");
	
	output("You respond by moving closer to her and placing your [pc.hand] over hers, teasing her [pippa.pussyNoun] with her through her pants. She lightly kisses you and whispers, <i>“Good.”</i> She grasps your hand, removing it from her crotch, and guides you to her bed. She quickly removes your ");
	
	if (pc.isCrotchGarbed()) output("clothes");
	else output("gear");
	
	var bottomRand:int = randInRange(-25, 25);
	
	var bottomVariation:Boolean = (cockOrStraponIndex == -1 || pc.cocks[cockOrStraponIndex].cLength() <= 10) && bottomRand > pippaDominance();
	
	if (bottomVariation)
	{
		output(" and climbs onto the bed, settling into a position of sitting on her knees and facing you. She slowly lifts up her tank top, letting her [pippa.belly] free, and stopping right below her [pippa.breasts]. She holds the edge of the shirt tightly below, and continues pulling it up, lifting her [pippa.breasts] with it until they finally fall free of the shirt. She pulls it off fully and throws it aside before rising off of her knees and back down, now onto all fours. She looks up at you, obvious hunger in her eyes, and her [pippa.tits] hang down, still jiggling from the motion. She turns away from you and reaches back to peel her tight yoga pants down to her knees, exposing her [pippa.ass] and her [pippa.pussy], adorned with a tuft of [pippa.hairColor] hair. She sways her [pippa.ass] and twirls her [pippa.tail], enticing you, letting her body do the talking as if to say, <i>“What are you waiting for?”</i>");
		
		output("\n\nYou answer the call of Pippa’s body, quickly climbing atop her, pushing her face down into the bed, and sitting on her legs, pinning her. You grab hold of her [pippa.ass], fingers kneading her soft, warm flesh. Continuing to grope her [pippa.ass], you lean down into her and kiss her neck. Your [pc.chest] and [pc.cocks] are pressed into her as you press your [pc.lips] into her supple neck. You continue kissing down her body as far as you can without changing your position, teasing her. Her breathing’s already heavy, her [pippa.pussy] needy. You scoot up her legs slightly, bringing your [pc.cockOrStrapon " + cockOrStraponIndex + "] right up to her [pippa.pussy], but don’t enter her quite yet. Instead, you continue to play with her [pippa.ass] a bit more, spreading her [pippa.buttcheeks] to get a view of her [pippa.asshole], lifting them to get a better view of her [pippa.pussy], and sometimes delivering them light spanks. Her [pippa.pussyNoun] grows wetter by the second, and the sounds from her [pippa.lips] are nearly whines at this point.");
		
		output("\n\nYou decide you’ve teased the pig slut enough, and by now, you’re getting pretty anxious to feel her [pippa.pussy] around your [pc.cockOrStrapon " + cockOrStraponIndex + "] as well. You slowly part Pippa’s pussy lips, swollen and wet with arousal, pushing your [pc.cockOrStrapon " + cockOrStraponIndex + "] into her. The ridged walls of her [pippa.pussyNoun] twitch and squeeze along your length, just short of impeding your intrusion. You bottom out and briefly sit still, enjoying the feeling of her [pippa.pussy] enveloping your [pc.cockOrStrapon " + cockOrStraponIndex + "]");
		
		if (cockOrStraponIndex >= 0 && pc.cocks[cockOrStraponIndex].cType == GLOBAL.TYPE_SWINE) output("; it’s almost like her pussy and your cock were made for each other, and, considering your current genetic makeup, maybe that’s not so far from the truth");
		
		output(". You again sink your [pc.fingers] into Pippa’s [pippa.ass] and, using it as a grip, begin moving. Her [pippa.pussy] squeezes and ripples along your [pc.cockOrStrapon " + cockOrStraponIndex + "] expertly; the masseuse’s skills clearly aren’t confined to her hands, and you’ve no doubt that her yoga exercies include some that are pelvic-focused. As you thrust, Pippa digs her fingers into her bed, and her [pippa.ass] jiggles and shakes; heavy breaths and moans escape her throat. You spread her [pippa.buttcheeks], intending to finger her [pippa.asshole] as you fuck her, but she suddenly seizes up below you, shudders running through her body. Her [pippa.pussy] squeezes your [pc.cockOrStrapon " + cockOrStraponIndex + "] like a vice, trying to pull you over the edge, and her [pippa.asshole] twitches, winking at you. Did she just orgasm?");
		
		output("\n\n<i>“I did, but....”</i> Pippa answers your question, but stops, grunting and wiggling beneath you. You pull out of her [pippa.pussy] and stand up, unpinning her [pippa.legs], and she flips onto her back, facing you. <i>“But, I’m not done yet.”</i> She lifts and spreads her [pippa.legs]. <i>“Keep going, " + pippaCallsSteele() + ".”</i> You grab her [pippa.thighs] and yank her to the edge of the bed, eliciting a small gasp. Moving your hands down to her [pippa.hips], you move forward and push your [pc.cockOrStrapon " + cockOrStraponIndex + "] back into Pippa’s [pippa.pussy]. Having orgasmed onced already, she’s even wetter, and you practically glide in and out of her [pippa.pussy], even with her powerful squeezing. Continuing to thrust, you bend over her, pressing your [pc.chest] to her [pippa.chest] and your [pc.lips] to her [pippa.lips]. You kiss passionately, a kiss vibrating and barely held together due to moaning and grunting.");
		
		if (pc.isLactating()) output(" As your tongues dance and your hands run along her [pippa.hips], your [pc.milk] dribbles down between your bodies");
		
		output(". She’s obviously nearing her second orgasm, as her [pippa.pussy] convulses along the length of your [pc.cockOrStrapon " + cockOrStraponIndex + "] and her kissing becomes sloppy and out of control, almost like she’s trying to devour your face. You up the intensity of the kiss, pressing your [pc.lips] to hers harder, probing her mouth as deep as you can with your [pc.tongue]. You thrust faster and harder, rapidly drawing both of you toward the edge. Her second orgasm hits sure enough, her body quivering below you, her tongue twitching in your mouth, and her [pippa.pussy] clamping down on your [pc.cockOrStrapon " + cockOrStraponIndex + "] tighter than ever. Her ridges ripple along the length of your [pc.cockOrStrapon " + cockOrStraponIndex + "], and this time, you can’t help but join her climax, your own orgasm crashing over you like a wave.");
		
		pippaDominance(-1);
	}
	else
	{
		output(" and has you lay down on the bed, facing her. While you get comfortably settled into Pippa’s bed, she puts on a little show, slowly stripping out of her tight clothes. First, facing toward you, she pulls her tank top up over her head, letting her [pippa.tits] and [pippa.belly] fall free. She crosses her arms under her tits, cradling them. Her [pippa.nipples] have already emerged, standing firm with arousal in the middle of her wide, brown-pink areola. Next, still facing you, she slowly bends over, and peels down her yoga pants. She sways back and forth a bit, setting her [pippa.tits] swinging. Finally, she turns around while spreading her [pippa.legs], treating you to an eyeful of her [pippa.ass] and her spread [pippa.pussy], adorned with a tuft of [pippa.hairColor] hair.");
		
		output("\n\nFinished with her show, Pippa stands up and climbs into bed after you, straddling you, before kissing you down your body. She starts with a passionate kiss on your [pc.lips], pressing her [pippa.lips] to yours before slipping her tongue into your mouth, playing with your own [pc.tongue]. She pulls back slightly from your mouth and moves briefly to your neck, giving it just a light kiss. Next her [pippa.lips] kiss around your [pc.chest]" + (pc.hasNipples() ? ", brushing over your [pc.nipples]" : "") + ". She moves down the rest of your torso barely lifting her [pippa.lips] from you, dragging them and her tongue down your body, over your navel, and to your [pc.hips]. She moves to your inner thigh, teasing you with light breaths, and finally, ");
		
		if (cockOrStraponIndex == -1) output("she presses the activation for your hardlight cock, and plants a wet kiss right on its head");
		else output("she plants a wet kiss right on the [pc.cockHead " + cockOrStraponIndex + "] of your [pc.cock " + cockOrStraponIndex + "]");
		
		var cockLength:int = cockOrStraponIndex == -1 ? -1 : pc.cocks[cockOrStraponIndex].cLength(); // cockLength only used if PC is fucking Pippa with cock
		
		output(". Continuing to kiss your " + (cockOrStraponIndex == -1 ? "holo-tip" : ("[pc.cockHead " + cockOrStraponIndex + "]")) + ", she gently runs her hand along your shaft, massing you to full erectness. She gives one last kiss, but continues pushing, allowing your [pc.cockOrStrapon " + cockOrStraponIndex + "] to part her [pippa.lips], and swallowing it " + (cockLength == -1 || cockLength >= 6 ? "till it begins to probe into her throat" : "till it’s completely enveloped in her warm, wet mouth") + ". She withdraws her mouth, leaving behind a thin coating of her saliva.");
		
		output("\n\nSatisfied with her work, Pippa moves back up your body, turning around as she does to give you a view of her [pippa.ass]. She positions her [pippa.hips] above your [pc.hips], and her waiting, dripping [pippa.pussyNoun] above your [pc.cockOrStrapon " + cockOrStraponIndex + "]. You use one hand to hold it in place for her, and place the other on her [pippa.hip]. She looks over her shoulder and grins at you and then slides her [pippa.pussy] down over you");
		
		if (cockOrStraponIndex == -1 || cockLength <= 10)
		{
			output(", completely enveloping your [pc.cockOrStrapon " + cockOrStraponIndex + "] inside of her [pippa.pussy], and bringing her full weight to bear on your [pc.hips]. ");
			
			if (cockOrStraponIndex >= 0) pc.cockChange(false, true);
			
			if (pc.tone <= 33)
			{
				output("Pippa is so heavy that you feel practically crushed beneath her, but the inside of her [pippa.pussyNoun] is so warm and tight, that you can get past it");
			}
			else if (pc.tone <= 66)
			{
				output("You barely have the physique to support Pippa’s wait on your hips, but the [pippa.pussy] wrapping around your [pc.cockOrStrapon " + cockOrStraponIndex + "] makes it worth it");
			}
			else
			{
				output("Despite Pippa’s weight, you can easily support her and fully enjoy the embrace of her [pippa.pussy]");
			}
			
			output(". She sits still for a moment, letting you both enjoy the feeling of you inside her");
			
			if (cockOrStraponIndex >= 0 && pc.cocks[cockOrStraponIndex].cType == GLOBAL.TYPE_SWINE)
			{
				output(". It’s almost like her pussy and your cock were made for each other; considering your current genetic makeup, maybe that’s not so far from the truth.");
			}
			else output(", before she begins moving.");
			
			output(" She gives you one last, ravenous look over her shoulder, before she turns away and begins grinding her hips into you, alternately increasing and decreasing the weight pressing on you. The corkscrew-patterned ridges in Pippa’s [pippa.pussyNoun] would feel amazing even if she weren’t particularly talented, but she knows how to use more than just her hands to massage, squeezing and milking your cock with her [pippa.pussy] as she grinds; she’s definitely been doing pelvic-focused exercises with those yoga pants of hers. As she grinds on you, she gropes at her [pippa.tits], pinching and pulling on her [pippa.nipples]. You grope her from the other side, fingers sinking into the soft flesh of her [pippa.ass] as it jiggles and ripples before you. You pull one of her [pippa.buttcheeks] aside and begin to move a finger toward her [pippa.asshole] when she suddenly seizes up and shudders, [pippa.pussy] squeezing your [pc.cockOrStrapon " + cockOrStraponIndex + "] like a vice. You see her [pippa.asshole] twitching, winking at you, and you feel her ridges ripple along your length, attempting to milk you for [pc.cumNoun]" + (cockOrStraponIndex == -1 ? " you can’t give":"") + "; you barely hold on. Did she just orgasm?");
			
			output("\n\n<i>“I did,”</i> she answers your question. <i>“But I’m glad you didn’t, because I’m ready for round two, " + pippaCallsSteele() + ".”</i> She spins herself around on your [pc.cockOrStrapon " + cockOrStraponIndex + "] and plants her hands firmly on your [pc.chest] and, this time, begins bouncing up and down. She massages your [pc.cockOrStrapon " + cockOrStraponIndex + "] with her [pippa.pussy] as she did before, but it’s now even wetter, increasing the pleasure you feel. As she bounces, her [pippa.tits] bounce with her, so much so they almost look as if they’ll fly off any second now. You reach around behind her to grab her [pippa.ass], squeezing it, of course, but also using it as a grip to help spur on her bouncing. Picking up where you left off before, you reach one finger through her valley of ass flesh and run it around her [pippa.asshole], finding that it’s still twitching and opening up slightly like the good fuckhole it is. You slip your [pc.finger] inside and she squeals in pleasure, digging her fingers into your [pc.chest]");
			
			if (pc.isLactating()) output(", and prompting [pc.milk] to dribble down your body");
			
			output(". She’s obviously nearing her second orgasm, as her [pippa.pussy] convulses along the length of your [pc.cockOrStrapon " + cockOrStraponIndex + "] and her [pippa.asshole] squeezes your finger. She leans down and begins kissing you, sloppily, almost like she’s trying to devour your face. You press your [pc.lips] to hers, returning her kiss, and up the intensity, probing all three of her holes with your [pc.tongue], [pc.cockOrStrapon " + cockOrStraponIndex + "], and [pc.finger], and bouncing her harder. Her second orgasm hits sure enough, her tongue twitching in your mouth, her [pippa.asshole] constricting around your finger, and her [pippa.pussy] clamping down on your [pc.cockOrStrapon " + cockOrStraponIndex + "]. Her ridges massage your length once again, and this time, you can’t help but join her, your own orgasm crashing over you like a wave.");
		}
		else
		{
			output(" as far as she can, devouring about 10 inches of your [pc.cock " + cockOrStraponIndex + "] before she reaches her limit. You grab her thick thighs, sinking your fingers into her soft flesh, to help hold her up above your [pc.hips]. ");
			
			pc.cockChange(false, true);
			
			if (pc.tone <= 33)
			{
				output("Pippa is so heavy that you can only hope that you’re actually contributing to holding her up.");
			}
			else if (pc.tone <= 66)
			{
				output("Pippa is quite heavy, but you’re doing your part in helping to hold her up");
			}
			else
			{
				output("Despite Pippa’s weight, you don’t have much trouble helping to hold her up");
			}
			
			output(". She immeditely begins moving up and down, slowly at first. She runs her wet, corkscrew-ridged pussy up and down all 10 inches that she can fit inside her, just barely keeping your [pc.cockhead " + cockOrStraponIndex + "] inside at the peak of her movement before sliding back down. As she slides, she squeezes and milks your [pc.cock " + cockOrStraponIndex + "] with her vaginal walls with skills befitting one who would call herself a masseuse. As she slides along, massaging your shaft, she also massage her [pippa.tits], squeezing and twisting her [pippa.nipples]. At the peak of one of her motions, she suddenly shudders and nearly falls on you, squeezing your [pc.cock " + cockOrStraponIndex + "] so hard that it pops out. You almost lose it right there. Did she just orgasm?");
			
			output("\n\n<i>“I did,”</i> she answers your question, <i>“but I’m sure glad you didn’t. I want to go again, " + pippaCallsSteele() + ".”</i> She lifts herself back up and again impales her [pippa.pussy] on your [pc.cock " + cockOrStraponIndex + "]. She slides up and down even faster this time, leaving her slick pussy juice running down your shaft. She takes advantage of her own juices, reaching beneath her to the portion of your cock not inside her, and massaging it with her hands. Her surprising flexibility makes you think she’s been putting those yoga pants of hers to good use. With your hands occupied with holding her thighs for support, there’s nothing you can do but sit back and enjoy the feeling, and sink your fingers further into her soft, plentiful thigh flesh. The combination of both her hands and [pippa.pussy] stroking and massaging your shaft brings you to the brink of climax, and you can tell that Pippa is nearing her second orgasm by her heavy breathing and her flushed, sweating chest. Sure enough, she pushes herself down on your [pc.cock " + cockOrStraponIndex + "] as far as she can, releasing it from her grip, and barely placing her hands over yours for support before she climaxes again. Her [pippa.pussy] rippling over 10, or perhaps more, inches of your cock pushes you over the edge and you join her, orgasm hitting you like a train.");
		}
		
		pippaDominance(1);
	}
	
	if (pc.hasGenitals())
	{
		output(" Your ");
		
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
		
		output(". Shivers run through your bodies and her [pippa.pussy] won’t stop twitching, ");
		
		if (cockOrStraponIndex >= 0) output("milking your [pc.cock " + cockOrStraponIndex + "] for every last drop of [pc.cum] it’ll give.");
		else output("attempting to milk your fake holo-cock for cum that will never be.");
	}
	else
	{
		output(" Despite having no real genitals, thanks to the hardlight strapon, shudders run through your body right along with her. You feel a tightening in your body and a desperate need to release something, though you have nothing to give. Nonetheless, the feeling passes.");
	}
	
	output(" You embrace each other as your climaxes wind down until finally, your bodies are still.");
	
	if (bottomVariation) output("\n\nYou lift yourself off of Pippa and pull out your [pc.cockOrStrapon " + cockOrStraponIndex + "]. She continues laying on the bed, looking tired");
	else output("\n\nPippa slowly lifts herself off of your [pc.cockOrStrapon " + cockOrStraponIndex + "] and lowers herself to lay next to you, one arm draped across your chest");
	
	output(". <i>“That was good, " + pippaCallsSteele() + ".”</i> She sounds tired. <i>“I’m going to shower, so feel free to let yourself out.”</i> She plants a kiss on your cheek and climbs out of the bed. Her [pippa.hips] swaying, she walks away to the shower.");
	
	pippaSexed();
	pippaAffection(2);
	processTime(25);
	pc.orgasm();
	pc.applyPussyDrenched();
	
	addButton(0, "Next", mainGameMenu);
}

// Let Pippa sit on your face (Part 1)
public function pippaGetSatOn():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("Pippa looks you up and down and emphatically states, <i>“Today, I’m going to use you for my pleasure");
	
	if (flags["PIPPA_HOTDOGGED"] == 1) output(", just as you’ve done with my ass");
	
	output(". Understand?”</i> You nod. She grabs your hand and leads you to her massage table. <i>“Take off your ");
	
	if (pc.isCrotchGarbed()) output("clothes");
	else output("gear");
	
	output(",”</i> she orders. As you comply she lowers the massage table to a height that would allow her to comfortably sit on it. <i>“Now lay down.”</i> You again do as you’re told. She stands, looming over you, and, with no fanfare, quickly takes off her clothing, allowing you to take in her naked form, [pippa.tits], [pippa.belly], and [pippa.hips]. She slightly bends over you and runs a finger around your [pc.lips]. She removes her finger and, without a word, turns around and takes a seat on your face such that she can look into your [pc.eyes].");
	
	output("\n\nPippa begins grinding her [pippa.pussy] into your face, but not before ordering, <i>“Lick.”</i> You comply, though you imagine the grinding would feel good even without your active contribution. Her [pippa.pussy] is already soaked, filling your mouth with ");
	
	if (silly) output("the taste of... is that bacon?! <i>“I hope you like bacon grease, " + pippaCallsSteele() + ".”</i> Well, there goes your figure.");
	else output("her juices. The taste is quite sweet, but you’re pretty sure it isn’t modded.");
	
	output(" She grabs the sides of your head and picks up her grinding a bit, moaning lightly. <i>“Look at me with those " + pc.mf("handsome", "pretty") + " [pc.eyes], " + pippaCallsSteele() + ".”</i> She holds your gaze, looking intently into your eyes. The rest of your face is completely smothered by her [pippa.pussy], [pippa.ass], and [pippa.thighs]. She grinds her [pippa.pussyNoun] from your nose, all the way down to your chin, where you barely have time to breathe, smearing your face with her ");
	
	if (silly) output("bacon grease");
	else output("girl cum");
	
	output(". You can barely see her eyes over her [pippa.tits], flushed with pleasure and beginning to lightly sweat.");
	
	output("\n\nYour senses are completely overwhelmed with Pippa. Her jiggling body fills your field of vision. You feel nothing but her warmth and wetness. All you hear are her moans. Her ");
	
	if (silly) output("smoky");
	else output("sweet");
	
	output(", intoxicating scent and taste flood your nose and mouth.");
	
	if (pc.hasGenitals())
	{
		output(" Actually, you do feel ");
		
		
		if (pc.isHerm()) output(" two");
		else output(" one");
		
		output(" other thing")
		
		if (pc.isHerm()) output("s");
		
		output(": your ");
		
		if (pc.hasCock()) output("[pc.cocks] stiffening");
		if (pc.isHerm()) output(" and your ");
		if (pc.hasVagina()) output("[pc.pussies] getting wet");
		
		output(". It’s tempting to reach down and pleasure yourself, but perhaps you should focus your efforts on Pippa.");
		
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
	pc.changeLust(15);
	pippaDominance(1);
}

// Focus on pleasing Pippa while she sits on your face, softer variation
public function pippaGetSatOnFocus():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("You decide to focus all of your efforts on Pippa, wrapping your arms around her [pippa.thighs] to pull her further into your face and intently driving your [pc.tongue] into her [pippa.pussy]. She squeals, and then coos, <i>“That’s a good " + pc.mf("boy", "girl") + ", just like that.”</i> With you pulling her into your face, she lets go of your head and begins to knead her [pippa.tits], sinking her hands into her soft flesh, and playing with her [pippa.nipples]. Rhythmically grinding into your face and playing with her [pippa.tits], Pippa shudders and soaks your face with her ");
	
	if (silly) output("grease");
	else output("pussy juice");
	
	output(". Having climaxed, she removes your arms from her [pippa.thighs] and stands up, only to then reposition herself and again sit on your face, now facing the other direction. <i>“I’m not done using you yet, " + pippaCallsSteele() + ",”</i> she explains.");
	
	output("\n\nThe way Pippa has positioned herself, your vision is completely obscured by her [pippa.ass], your nose is buried in the base of her [pippa.pussyNoun], and you’re in the perfect position to lick her [pippa.clit]. You reach up around in front of her to grope at her [pippa.tits], eliciting a moan. ");
	
	if (pc.hasGenitals() || (pc.hasBreasts() && pc.hasNipples()))
	{
		output("She softly speaks, <i>“I was thinking I should reward you for doing such a good job.”</i> No sooner than the words have left her mouth, she reaches down and ");
		
		if (pc.hasGenitals())
		{
			if (pc.hasCock()) output("wraps one hand around your [pc.cock]");
			else output("places her hand on your [pc.pussy]");
			
			output(", placing the other on your [pc.chest] for support. As she grinds, ");
			
			if (pc.hasCock()) output("she gently strokes your [pc.cock], using her fingers like she’s trying to feel up every square inch");
			else output("she gently rubs your [pc.pussy] before sticking a few fingers inside and tenderly finger fucking you");
		}
		else
		{
			output("places her hands on your [pc.breasts]. She gently massages and squeezes them");
			
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
		
		output(". You leave your pleasure completely to her, and continue your efforts to make her cum again. Following her lead, you");
	}
	else
	{
		output("She softly speaks, <i>“I’d like to reward you for doing such a good job, but....”</i> You don’t have a cock or a pussy of any sort, or even a sexy set of tits. No matter; you’re here to please her today. You continue to");
	}
	
	output(" gently play with her [pippa.nipples], and alternate between licking her [pippa.clit] and making out with her puffy, aroused nether lips.");
	
	output("\n\nCompletely lost in Pippa’s rhythm, you nearly forget to breathe. Of course, her [pippa.ass] smothering your face doesn’t help with the breathing. If you weren’t smothered, you’d doubtlessly be " + RandomInCollection("grunting", "panting", "moaning") + " along with Pippa’s moaning. You can’t see her, but you imagine that she’s more flushed than before, and you can feel the sweat in her cleavage of her [pippa.tits]. You’re not even sure how much time has passed, ");
	
	if (pc.hasGenitals() || (pc.hasBreasts() && pc.hasNipples()))
	{
		output("but what feels like too soon, your orgasms hit simultaneously, subdued, but powerful. Pippa’s hands work their magic, continuing to "); 
		
		if (pc.hasCock()) output("dance up and down the shaft of your [pc.cock]");
		else if (pc.hasVagina()) output("probe your [pc.pussy]");
		else output("tease your [pc.nipples]");
		
		output(" as you climax");
	}
	else output("but in what feels like no time, Pippa climaxes once again");
	
	output(". Her [pippa.pussy] undulates over your [pc.lips] and, once again, she slathers your face with her ");
	
	if (silly) output("savory grease");
	else output("sweet juices");
	
	if (pc.hasGenitals())
	{
		output(", while you ");
		
		if (pc.hasCock()) output("squirt [pc.cum] onto your body");
		if (pc.isHerm()) output(" and ");
		if (pc.hasVagina()) output(" spray [pc.girlcum] onto her massage table");
	}
	
	output(". You can see her [pippa.ass] jiggle and shiver and feel the rise and fall of her [pippa.chest] as she catches her breath.");
	
	output("\n\nStill coming down from her climax, but not wanting to smother you too much, Pippa climbs off of you and sighs, <i>“I’m already looking forward to the next time I get to use you, " + pippaCallsSteele() + ".”</i> She leans down and kisses your cheek. She winks at you and says, <i>“Be sure to clean yourself up,”</i> before leaving you to do just that.");
	
	pc.orgasm();
	pc.applyPussyDrenched();
	pc.girlCumInMouth(pippa);
	if (silly) output(pc.modThickness(10, true));
	processTime(10);
	pippaDominance(1);
	
	addButton(0, "Next", mainGameMenu);
}

// Attempt to masturbate while Pippa sits on your face and she punishes you
public function pippaGetSatOnMasturbate():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("You’re so turned on you can’t resist. You reach past Pippa, down to ");
	
	if (pc.hasCock()) output("stroke your [pc.cock]");
	else output("rub your [pc.pussy]");
	
	output(" and, in doing so, briefly let up on your licking. Pippa doesn’t let your lapse pass by unnoticed. <i>“Now just what do you think you’re doing?”</i> She stands up and turns around to face you. Looming over you, she chides you, <i>“So impatient. What a bad " + pc.mf("boy", "girl") + ".");
	
	if (pc.isAss()) output(" I suppose I shouldn’t be surprised.");
	
	output("”</i> She grabs your arms and moves them to your sides. Then she quickly climbs back on top of you, now facing toward your [pc.legOrLegs], and using her own [pippa.legs] to pin your arms by your side. <i>“Now let’s try this again.”</i>");
	
	output("\n\nHaving sealed your movement, Pippa begins grinding on your face again, rougher than before. If you weren’t trapped between the soft massage table and Pippa’s soft body, your head might be hurting. You lick and suck on her [pippa.pussy] as best as you can, but the rough movements make it difficult. Unable to see anything beyond her [pippa.ass], you’re startled when ");
	
	var gasped:Boolean = false;
	var gaspedString:String = "You lightly groan into Pippa’s [pippa.pussy], but the sound is muffled and you don’t end up doing much more than vibrate your [pc.lips] and prompt her to speak, <i>“Did that hurt, " + pippaCallsSteele() + "? I guess your vibrating mouth feels good either way.”</i>";
	
	if (pc.hasBreasts()) {
		output("you feel a sharp slap on your [pc.breasts], not enough to seriously hurt you, but enough to sting. ");
		
		output(gaspedString);
		gasped = true;
		
		output(" She rains a few more light slaps on your [pc.breasts], moaning and grinding her [pippa.pussy] into your face all the while.");
	}
	
	if (pc.hasNipples()) {
		if (!gasped)
		{
			output("you feel fingers roughly grab your [pc.nipples] and painfully pull on them. ");
			
			output(gaspedString);
			gasped = true;
		}
		else
		{
			output(" Next she moves onto your [pc.nipples], roughly grabbing and pulling on them.");
		}
		
		output(" She continues to abuse your [pc.nipples], pinching and twisting them, and even flicking them a few times. Judging by her ");
		
		if (silly) output("salty grease");
		else output("sweet pussy juice");
		
		output(" flooding your face, she’s really getting off on this.");
	}
	
	if (pc.hasCock()) {
		if (!gasped)
		{
			output("she roughly grabs your [pc.cock] and strokes up and down, almost mashing it. You can’t deny that it feels a little good, but it also hurts a bit. ");
			
			output(gaspedString);
			gasped = true;
		}
		else
		{
			output(" Her next victim is your [pc.cock], which she roughly grabs and strokes, inducing both pleasure and pain.");
		}
		
		output(" She asks, <i>“You wanted to cum, didn’t you? Now’s your chance.”</i> She intently yanks her hand up and down your shaft, not getting any gentler, a far cry from her typical, gentle work. You hear her spit and feel it land right in the path of her hand. Lubed up from her saliva, the scale tips just enough toward pleasure that you pathetically cum. As you do, she reacts quickly, squeezing on your cock and causing your [pc.cum] to dribble out over her hand. You hear her clean her hand with her mouth after she removes it from your [pc.cock].");
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
			output(" Her next victim is your [pc.pussy], to which she delivers a stinging slap.");
		}
		
		output(" She lightly slaps it one more time, before jamming her fingers inside and roughly finger fucking you, a far cry from her typical, gentle work. She asks, <i>“You wanted to cum, didn’t you? Now’s your chance.”</i> She continues fucking you with her hooked fingers, causing both pleasure and pain. As she fucks you, she roughly rubs your [pc.clit] with her palm. Unable to help your self, you orgasm, spraying both her massage table and her hand with your [pc.girlcum]. You hear her clean her hand with her mouth after she removes it from your [pc.pussy].");
	}
	
	output("\n\nSeemingly satisfied with punishing you, Pippa returns her focus to her pleasure. She’s already moaning and panting, and, clearly having enjoyed the punishment, it doesn’t take much more of her grinding and your licking before she reaches a powerful climax and cums all over your face. Her [pippa.ass] quivers above you and her [pippa.pussy] undulates along your face; your senses are flooded with her " + (silly ? "grease" : "juices") + ", taste, and smell. She continues to sit on your face while catching her breath, leaving you smothered beneath her, struggling to catch yours. She finally climbs off of you, freeing your arms and letting you see again. She’s sweating, and her whole body is deeply flushed. ");
	
	if (flags["PIPPA_ABUSIVE_SAT_ON"] == undefined)
	{
		output("From the embarrased look on her face, you can’t help but think the flush is from more than sexual pleasure. She, almost sheepishly, speaks, <i>“Sorry about that, " + pippaCallsSteele() + ". I might have gotten a bit carried away there. But I won’t deny I enjoyed it. And you did cum. Are we good?”</i> Too tired to speak, you just nod. <i>“Good. I’ll let you clean yourself up.”</i> She leaves you to it.");
	}
	else
	{
		output("She pokes fun at you, <i>“You really enjoy being punished, don’t you, " + pippaCallsSteele() + "? If we do this too much, I might end up on a real mean streak.”</i> She winks before continuing, <i>“I’ll leave you to clean yourself up.”</i> She gives you a quick peck on the cheek before leaving you to it.");
	}
	
	
	flags["PIPPA_ABUSIVE_SAT_ON"] = 1;
	pc.orgasm();
	pc.applyPussyDrenched();
	pc.girlCumInMouth(pippa);
	if (silly) output(pc.modThickness(10, true));
	processTime(10);
	pippaDominance(2);
	
	addButton(0, "Next", mainGameMenu);
}

// Feed Pippa milk straight from your breasts (Part 1)
public function pippaFeedMilk():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("Pippa hungrily eyes your [pc.tits] and speaks, <i>“");
	
	if (pippaFed(0) > 0) output("You know, " + pippaCallsSteele() + ", I appreciate when you give me food, but I have a special request today.”</i>");
	else if (pippaAffection() >= PIPPA_AFFECTION_NAME) output("You never give me any food, but maybe I could make a special request today?”</i>");
	else output("Could I maybe ask you to... feed me?”</i> She looks almost embarassed.");
	
	output(" As if you didn’t already know what she was getting at, she reaches for your [pc.chest] and runs a finger around your [pc.nipples]");
	
	if (pc.isChestCovered()) output(" through your clothing");
	
	output(". You gladly grant her request, <i>“");
	
	if (pc.isBimbo()) output("If there’s stuff that I love, it’s totally fucking and getting drinken!");
	else output("I could certainly use a milking.");
	
	output("”</i> She smiles excitedly and leads you to her bed, pulling off her tight clothes ");
	
	if (!pc.isNude()) output("and quickly pulling off your gear ");
	
	output("in the process. Once you’re by her bed, she places a hand on your [pc.breasts] and gives a soft, tentative squeeze, drawing just a little of your [pc.milk]. Her eyes, now positively voracious, follow the [pc.milkNoun] as it flows down your body and she licks her [pippa.lips], leaving a visible sheen of saliva. Nonetheless, she withdraws her hand and sits down on the edge of the bed, patting her lap. <i>“Sit.”</i>");
	
	output("\n\nYou take a seat on Pippa’s comfy lap, straddling her and bringing your [pc.breasts] level with her face. Pippa slowly brings her [pippa.lips] to your right [pc.nipple] and pauses for a moment, letting you feel her hot, heavy breathing. She wraps her [pippa.lips] around the [pc.nipple] and gently runs her wet tongue around it, savoring the moment like some kind of breastfeeding connoisseur. After what seems like an eternity of teasing, she sucks, drawing a stream of [pc.milk] down her throat. And then she lets go again and looks you in the eyes. <i>“Mmm, your [pc.milkNoun] is so delicious, " + pippaCallsSteele() + ".");
	
	if (pc.isTreatedCow()) output(" And it’s even Treated.");
	
	output("”</i> Tired of her teasing, you grab the back of her head and push her face into your [pc.breast]. She giggles and finally, really digs in. Her [pippa.lips] and tongue slide all around your [pc.nipple], drawing a torrent of [pc.milk] from your [pc.breasts], and the insatiable pig slut greedily swallows every last drop.");
	
	pc.changeLust(30);
	
	output("\n\nYou notice that, while feeding from you, Pippa has snaked a hand down between her legs and is rubbing her [pippa.pussy]. She, of course, isn’t the only one who’s turned on. ");
	
	if (pc.hasCock())
	{
		output("Your [pc.cock] is sandwiched between your bodies");
		
		if (pc.cocks[0].cLength() >= 12) output(" and nestled into her [pippa.tits]");
		else output(", pressed into her [pippa.belly]");
		
		output(". ");
	}
	if (pc.hasVagina())
	{
		output("Your [pc.pussy] is soaked, your [pc.girlcum] surely mixing with Pippa’s as she masturbates. ");
	}
	
	output("The position you’re in is great for feeding, but not so great for getting off at the same time. From her squirming, you think Pippa might be getting the same idea")
	
	if (randInRange(70, 110) < pippaDominance())
	{
		output(", but before you can consider it further, Pippa takes control of the situation.");
		
		addButton(0, "Next", pippaFeedMilkHerControl, false);
	}
	else
	{
		output(". You could take control and set the pace, but she likely will if you don’t.");
		
		addButton(0, "Take Control", pippaFeedMilkTakeControl, undefined, "Take Control", "Take control of this feeding.");
		addButton(1, "Let Pippa", pippaFeedMilkHerControl, true, "Let Pippa Take Control", "Let Pippa handle this feeding.");
	}
	
	processTime(10);
	pippaAffection(5);
	pippaSexed(1);
}

// Take control of the breastfeeding session with Pippa
public function pippaFeedMilkTakeControl():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	output("Taking action, you push Pippa down onto the bed and flip your positions so that she’s on top. You sit back up and lay her across your lap in a classic breastfeeding position. Your [pc.nipple] having slipped from her [pippa.lips] during the repositioning, she jokes, <i>“I’m a bit big to baby, don’t you think?”</i> With one hand you reach down between her legs and run her [pippa.clit] between your fingers and she moans, <i>“I guess this isn’t exactly babying.”</i> With your right [pc.breast] practically drained already, you take the opportunity to switch, and move Pippa’s mouth to your left [pc.nippleNoun].");
	
	output("\n\nPippa latches onto your [pc.nipple] like her life depends on it. The way her tongue moves over and around your [pc.nipple], it’s like she was born to massage with whatever appendage possible. Her hands move to your other breast, rubbing, squeezing, and teasing out any [pc.milkNoun] that she may have missed with her mouth. Despite the fact that Pippa completely gorged herself, your [pc.breasts] are bountiful, and [pc.milk] squirts out, running down your body and Pippa’s arms, and splattering her [pippa.chest]. In response, you can feel her [pippa.pussyNoun] getting even wetter. You wipe some of your [pc.milk] up with your hand, and rub it into her [pippa.pussy]. Sticking a finger inside, you mix your [pc.milk] and her pussy juices together, finger fucking her to the rhythm of her nursing. All at once, her [pippa.pussy] clamps down on your finger and her mouth, almost painfully, clamps down on your [pc.nipple]. Shudders run through her body and she moans into your breast, trying not to let go. She comes down from her orgasmic high, and you pet the side of her head with your cleaner hand, gently rustling her hair. She looks you in the eyes, and resumes sucking.");
	
	if (pc.hasCock())
	{
		output("\n\nPippa may have orgasmed, but you’re harder than ever, your [pc.cock] nestled up against her head. You lube your [pc.cock] up with the erotic mixture of girl cum and [pc.milkNoun] already coating your hand and begin to masturbate. Getting both your [pc.cock] and [pc.breasts] milked at the same time, you know you won’t last long, but you gently, steadily, run your wet hand up and down your shaft nonetheless. You feel your loins tightening and your orgasm bubbling up, your hand wrapped around your [pc.cock] and Pippa’s [pippa.lips] wrapped around your [pc.nipple]. You cross the threshold, and your [pc.cum] spurts out, getting in Pippa’s hair, and even on her face. She just ignores it, having more important matters to attend to; your [pc.breasts] aren’t empty quite yet.");
	}
	else if (pc.hasVagina())
	{
		output("\n\nPippa may have orgasmed, but you’re wetter than ever, her hanging hair brushing up against and tickling your [pc.pussy]. You rub the erotic mixture of girl cum and [pc.milkNoun] still coating your hand into your [pc.pussy] and begin to masturbate. Your hand rubbing your [pc.pussy] and Pippa’s tongue rubbing around your sensitive [pc.nippleNoun] at the same time, you know you won’t last long, but you rub and finger onward. You feel your loins tightening and your orgasm bubbling up, your fingers probing your wet, warm depths, and Pippa’s wet, soft tongue probing at your erect [pc.nippleNoun] You cross the threshold, and your [pc.girlcum] spurts out, soaking Pippa’s bed and a few loose strands of her hanging hair. She surely felt your shuddering, but continues her sucking, determined to drain your [pc.breasts] and fill her stomach.");
	}
	
	output("\n\nThe rest of the breastfeeding session goes by slowly, but not in a bad way; you’re very relaxed as Pippa slowly, rhythmically, drains you. It’s a weird thought, but it almost is like you’re babying her. She even now has her eyes closed, seemingly as relaxed as you. She, however, really can use that tongue of hers. It’s unclear if she’s trying to make you feel good, or if it’s simple instinct, but it feels as if she’s trying to get you off with just her tongue on your [pc.nipple]. ");
	
	if (pc.hasGenitals())
	{
		output("If you hadn’t just brought yourself to orgasm, you’re sure that she’d succeed.");
	}
	else
	{
		output("Whether or not it’s what she’s trying to do, she’s succeeding. As the pressure in your [pc.breasts] drops, the pressure in your loins builds. Your whole body tightens up, and all at once, releases its tension, shudders running through it.");
	}
	
	output("\n\nFinally, Pippa is either full, or believes she’s drained you. She releases your [pc.nipple], wordlessly sits up and puffs up her cheeks as if to indicate her mouth is full. You get the idea and open your mouth, and she leans over, locks her lips with yours, and spits some of your [pc.milk] into your mouth. You savour your own taste shortly, and then swallow. She just smiles, then leans over again to give you a proper kiss. <i>“Thanks for the meal, " + pippaCallsSteele() + ". I need to shower... and probably do laundry. I’ll see you later.”</i>");
	
	pc.orgasm();
	pc.milked(pc.milkFullness);
	processTime(15);
	pippaDominance(-1);
	if (pc.hasVagina()) pc.applyPussyDrenched();
	if (pc.hasCock()) pc.applyCumSoaked();
	
	addButton(0, "Next", mainGameMenu);
	
}

// Let Pippa take control of the breastfeeding session (chance of her taking control automatically)
public function pippaFeedMilkHerControl(gaveControl:Boolean):void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	if (gaveControl) output("You do nothing, letting Pippa continue to nurse for a brief time, before she pulls you down onto the bed and flips");
	else output("Aiming to drink some [pc.milk] and get off too, Pippa takes action, pulling you down onto the bed and flipping");
	
	output(" your positions so that she’s on top. She straddles your [pc.leg] and, having removed your [pc.nipple] from her mouth during the transition, she declares, <i>“Now this, I can work with.”</i> She lightly wiggles her [pippa.hips] back and forth, and runs her fingers around your [pc.nipples], evidently excited. Having already drained your right [pc.breastNoun], she takes the opportunity to switch, latching her mouth onto your left [pc.nippleNoun].");
	
	output("\n\nPippa sucks on your [pc.nipples] almost roughly, like it’s her final meal. The way her tongue moves over and around your [pc.nipple], it’s like she was born to massage with whatever appendage possible. Contrasting and alternating with her soft tongue are her teeth, nibbling at your [pc.nipple] not quite enough to hurt, but certainly not gently. Her hands move to your other breast, twisting, pinching, and teasing out any [pc.milkNoun] that she may have missed with her mouth. Despite the fact that Pippa completely gorged herself, your [pc.breasts] are bountiful, and [pc.milk] squirts out, running down your body and Pippa’s hands. You can feel Pippa’s [pippa.pussy] on your [pc.leg], and soon enough, she begins grinding her hips, rubbing herself on your [pc.legNoun].");
	
	output("\n\n");
	
	if (pc.hasGenitals())
	{
		output("As Pippa grinds, her upper thigh, wet with her girl cum, rubs up against your ");
		
		if (pc.hasCock()) output("[pc.cocks]");
		if (pc.isHerm()) output(" and ");
		if (pc.hasVagina()) output("[pc.pussies]");
		
		output(". ");
		
		if (pc.hasCock())
		{
			output("Her thigh, only barely making contact with your [pc.cocks], isn’t doing much for you, until she reaches down and holds ");
			
			if (pc.hasCocks()) output("one of your [pc.cocks]");
			else output("your [pc.cock]");
			
			output(" against it, allowing it to run between hand and thigh. As it does, it’s lubed up with both the pussy juice running down her thigh and the [pc.milkNoun] soaking her hand. ");
			
			if (pc.hasVagina())
			{
				output("Your [pc.pussy], on the other hand, is doing fine without any intervention. It’s not as good as if Pippa were using her hands, but her thigh is firmly pressed up against you, teasing over the whole length of your [pc.pussyNoun]. ");
			}
		}
		else
		{
		output("While her thigh, pressed firmly against your [pc.pussy] as it rubs up and down, feels pretty good, it’s no substitute for her hands. As if reading your mind, she reaches down, sandwiching her [pc.milkNoun] covered hand between her thigh and your [pc.pussyNoun]. She slips her fingers in, using the movement of her thigh to fuck you. ");
		}
	}
	
	output("Pippa’s grinding and sucking become more and more frantic");
	
	if (pc.hasCock()) output(", as does the stroking of the hand-thigh vice wrapped around your [pc.cock]");
	else if (pc.hasVagina()) output(", as does the finger fucking your [pc.pussy]’s getting");
	else output(", as does the motion of her tongue licking and caressing your [pc.nippleNoun]");
	
	output(". The pressure in your breasts is rapidly dropping, but it’s replaced with a growing pressure in your loins. You both go over the edge at the same time. Pippa seizes up, coating your [pc.thigh] in her juices and painfully biting down on your [pc.nipple]. This, however, isn’t enough to stop your own orgasm, your ");
	
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
	
	output(" Your bodies shudder and shake together, and Pippa’s feeding loses it’s franticness, but doesn’t stop. She continues to suck, getting every drop of [pc.milk] she can as you come down from your orgasmic highs.");
	
	output("\n\nFinally finished, Pippa releases your [pc.nippleNoun] and slides off of you coming to lay next to you. After resting for a bit, she wordlessly sits up and leans over to kiss you, or so you think. She locks her [pippa.lips] with yours, and spits some of your [pc.milk] into your mouth. Caught off guard, you nearly choke, but manage to swallow it, and she giggles, before giving you a proper kiss. <i>“Thanks for the meal, " + pippaCallsSteele() + ". I need to shower... and probably do laundry. I’ll see you later.”</i>");
	
	pc.orgasm();
	pc.milked(pc.milkFullness);
	processTime(10);
	pippaDominance(1);
	if (pc.hasVagina()) pc.applyPussyDrenched();
	if (pc.hasCock()) pc.applyCumSoaked();
	
	addButton(0, "Next", mainGameMenu);
}

// Get bent over and fucked in ass or, if applicable, pussy (random chance) by Pippa
public function pippaGetFucked():void
{
	clearOutput();
	clearMenu();
	showPippa(true);
	
	if (flags["PIPPA_FUCKED_BY"] == 1) output("You ask Pippa to fuck you. She smiles and nods. <i>“Just a sec.”</i> She goes to retrieve her strapon. When she comes back, she’s stripped of her yoga pants and tanktop and now wearing her [pippa.lowerUndergarment] and a salacious smile.");
	else output("Pippa beams. <i>“I’ve been looking forward to trying this thing out.”</i> Strapon already on hand, she quickly strips off her yoga pants and tanktop, and pulls on the [pippa.lowerUndergarment] you bought her.");
	
	output(" She activates the underwear and her [pippa.hardlightCock] flops out into existence");
	
	if (flags["PIPPA_FUCKED_BY"] != 1) output(", a surprised, but pleased gasp escaping her [pippa.lips] in response to the new sensation. She ignores you briefly, gently running her hands along her new holo-cock, gaining a new appreciation for technology. She lets off and brings her attention back to you");
	else output(", a pleased, but subdued moan escaping her [pippa.lips] in response to the now familiar sensation. She brushers her hands over her [pippa.hardlightCock] briefly, but doesn’t take her attention off of you");
	
	output(". <i>“How about, first things first, you get me ready?”</i> You comply, kneeling before her. To start, you gently wrap your hand around her shaft, brushing your [pc.lips] along its length and planting a few soft kisses. With it semi-erect, you slightly firm up your grip and massage her to full erection. As you do, Pippa’s breathing grows heavier, and she gently runs her hands " + (pc.hasHair() ? "through" : "along") + " your [pc.hairDescript]. With her [pippa.hardlightCockNoun] completely erect, you kiss the head, before slipping it through your [pc.lips] and into your mouth. You run your [pc.tongue] and [pc.lips] all around its entire length, getting it nice, wet, and ready. Pippa continues to massage your head as you do, but you can feel her grip tensing up ever so slightly.");
	
	output("\n\nPippa bites her lower lip, and looks down at you, staring into your [pc.eyes], her grip tightening more. <i>“Your mouth is so warm and wet. Are you drooling over this fake cock?”</i> Even if you wanted to answer, you couldn’t; now with a firm grip on your head, she pushes you into her [pippa.hardlightCock]. After " + (pc.canDeepthroat() ? "bottoming out her [pippa.hardlightCockNoun] in your mouth" : "pushing you as far down as possible onto her [pippa.hardlightCockNoun]") + " she holds your head in place and pulls out before thrusting back in. She quickly works up a rhythm, fucking your mouth, heavily breathing and grunting. All you can do is keep your balance and be sure to breathe through your nose as she fucks your mouth like a sex toy, drool escaping from the sides. Soon, she thrusts as far into your mouth as possible, proving into your throat, and doubles over, wrapping her arms around your head. You feel shudders running through her body and her hips buck uncontrollably.");
	
	output("\n\Finally the shudders die down, she stands up, and she lets go of your head, letting her [pippa.hardlightCock] out, and allowing you to breathe in a nice, big breath of air. <i>“That was quite some warm up, " + pippaCallsSteele() + ".”</i> Her [pippa.hardlightCock] is still hard. Well, when you said you wanted to be fucked, you didn’t mean your mouth anyway. She circles around behind you, then grabs you by your [pc.hips], lifing you up");
	
	if (pc.isTaur()) output(" such that you’re kneeling in the front, but your [pc.ass] is up in the air, level with Pippa’s waist.");
	else output(", and then pushing you down into a bent over position.");
	
	var vagOrAss:int;
	
	if (pc.hasVagina())
	{
		vagOrAss = rand(2) - 1;
		
		output(" <i>“Now then....”</i> You feel the head of her [pippa.hardlightCock] brushing along your crotch, between your [pc.asshole] and [pc.vaginas], teasing you. <i>“Which hole do I want to take?”</i>");
	}
	else
	{
		vagOrAss = -1;
		
		output(" <i>“Now then....”</i> You feel the head of her [pippa.hardlightCock] brushing and circling around your [pc.asshole], teasing you. <i>“Your asshole looks so lovely and inviting.”</i>");
	}
	
	if (vagOrAss == 0) vagOrAss == rand(pc.vaginas.length);
	
	output("\n\nThe tip of her [pippa.hardlightCock] comes to rest on your [pc.vagOrAss " + vagOrAss + "] and she slowly pushes in, " + (vagOrAss == -1 ? "spreading your " + RandomInCollection("ring", "rim", "hole") : "parting your " + RandomInCollection("folds", "lips")) + " and burying her length inside of you. ");
	
	pc.holeChange(vagOrAss, pippa.hardLightVolume());
	
	output(" For a short bit, she doesn’t move her [pippa.hips], leaving her [pippa.hardlightCock] buried in you. Her hands, however, she moves, rubbing them along your [pc.hips] and [pc.ass], gently massaging and squeezing as she does. The massaging and the sensation of your filled [pc.vagOrAss " + vagOrAss + "] arouses you");
	
	if (pc.hasGenitals())
	{
		output(", leaving your");
		
		if (pc.hasCock()) output(" [pc.cocks] hard");
		if (pc.isHerm()) output(" and your");
		if (pc.hasVagina()) output(" [pc.pussies] wet");
	}
	
	output(". You impatiently wiggle your [pc.hips], grinding into Pippa. She delivers a sharp smack to your [pc.ass]. <i>“Just wait a second; I wanted to enjoy the feeling of your [pc.vagOrAssNoun " + vagOrAss + "] wrapped around me a bit.");
	
	if (flags["PIPPA_FUCKED_BY"] != 1) output(" It’s my first time feeling this, after all.");
	
	output("”</i>");
	
	output("\n\n");
	
	if (pc.isBimbo() || pc.isBro()) output("<i>“But I really need to get fucked now!”</i>");
	else if (pc.isAss()) output("<i>“That’s great, but hurry up and get on with it.”</i>");
	else if (pc.isMischievous()) output("<i>“I’m sure the feeling’s wonderful, but I can only take so much teasing.”</i>");
	else output("<i>“I think you’ll like the feeling even more once you start moving.”</i>");
	
	output("\n\nShe says nothing more, but gently rubs your [pc.ass] in the same spot she’d just spanked it and begins moving, slowly at first. She draws her smooth hardlight cock out until the tip is just barely held inside you, then pushes back in. She builds up her rhythm, thrusting in rougher and faster than she pulls out. As she does, she rubs, and massages your [pc.hips] and [pc.ass], frequently interjecting with a sharp spank to your [pc.buttcheeks]. You can feel the building pleasure steal some of the dexterity from her fingers, her hands tensing and twitching ever so slightly as she massages you. She draws her hands away from you, and you prepare yourself for a spank that doesn’t come.");
	
	if (pc.hasGenitals())
	{
		output("\n\nInstead, you feel her hand");
		
		if (pc.hasCock() || (pc.hasVagina() && vagOrAss == -1))
		{
			output(" reach " + (pc.genitalLocation() == 0 ? "around" : "down") + " and ");
			
			if (pc.hasCock())
			{
				output("grab your [pc.cock]. Pippa strokes your shaft with the same rhythm of her thrusts, a rough and uncomposed handjob, different from what you’d normally expect from her. Despite the rough motions, her hands are soft and she’s applying just enough pressure. She strokes down as she thrusts into you, fingers playing up and down your shaft as they go down to meet her [pippa.hips] at your body, before separating again.");
			}
			else
			{
				output("begin to rub your [pc.pussy]. Pippa only briefly teases her fingers along the outside, but with it already wet and ready, she quickly slips her fingers inside. She swirls her fingers around a bit, exploring and spreading you from within, before quickly moving on to finger fucking you. She pushes in and out alternately with the thrusting of her hips, pushing fingers in as her [pippa.hips] pull out and vice versa.");
			}
		}
		else
		{
			output("s spreading your [pc.buttcheeks]. Pippa keeps one hand spreading your [pc.ass] open, and begins rubbing the ring of your [pc.asshole] with a finger on her other hand. It feels as though she’s wet her fingers with her mouth, rubbing her spit into your [pc.asshole]. You feel your [pc.asshole] spreading as she pushes one finger in, and then spreading further as a second finger joins in. She hooks her fingers into your ass, pushing in with her fingers when she pulls her [pippa.hardlightCock] out and vice versa.");
		}
		
		output(" With the dual assault of Pippa [pippa.hardlightCock] and fingers, you begin to feel a familiar pressure rising in your loins; she’s cleary feeling the same, as the motion of her fingers becomes more and more frantic and off kilter, eventually losing the rhythm of her thrusting hips.");
		
		output("\n\nPippa hasn’t been going at you with her hand for long, but she suddenly removes her fingers from you entirely and");
	}
	else output("\n\nInstead, Pippa");
	
	output(" leans over you, wrapping her hands around your body, pressing her [pippa.belly] and [pippa.chest] into your back. The thrusting of her [pippa.hips] picks up, becoming faster and wilder. She’s like an animal in heat at this point, her heavy breathing and moaning descending into grunting and squealing. Now only her [pippa.hips] move, thrusting roughly into you as though she’s preparing to spill seed as deep into your " + (vagOrAss == -1 ? "bowels" : "womb") + " as possible. As you’re fucked like a lusty sow at the mercy of a wild boar, pressure " + (pc.hasGenitals() ? "continues to build" : "builds") + "in your loins and, before long, her wild thrusting prompts it to boil over, ");
	
	if (pc.hasGenitals()) {
		if (pc.hasCock()) output("your [pc.cocks] shooting [pc.cum] onto the floor");
		if (pc.isHerm()) output(" and ");
		if (pc.hasVagina()) output("your [pc.pussies] spraying [pc.girlcum] onto " + (vagOrAss == -1 ? "the floor" : "her [pippa.hardlightCock]"));
		
		output(".");
	}
	else output("shudders and twitches running through your body.");
	
	output(" Your [pc.vagOrAss " + vagOrAss + "] clenches and spasms around Pippa’s [pippa.hardlightCock] and you pull her over the edge with you. She thrusts as far into you as she can go and tightens her grip on you, her noises coming to a halt. There’s no feeling of cum shooting into you, but with your bodies pressed together so tightly, you feel her every twitch and shudder.");
	
	output("\n\nPippa’s movements die down, slowly but surely, and you hear her release her breath. She says nothing at first, still holding onto you, and regaining her breath. She finally stands up, pushing herself off of you. Her [pippa.hardlightCock] rapidly disappears from inside of you, as she switches it off. ");
	
	if (flags["PIPPA_FUCKED_BY"] == 1) output("<i>“I don’t know that I’ll ever get tired of this thing. I never thought I’d enjoy being the one doing the fucking so much.”</i>");
	else output("<i>“This thing’s incredible. I should’ve gotten one for myself a long time ago. Thank you, " + pippaCallsSteele() + "”</i>");
	
	output(" She sighs and runs a hand through her hair. It’s disheveled, matching her sheen of sweat and flushed skin. <i>“I should really get myself cleaned up. Please come on by next time you want to get fucked.”</i> She gives you a wink and heads for the shower.");
	
	pc.orgasm();
	processTime(15);
	pippaDominance(2);
	pippaSexed(1);
	pippaAffection(2);
	flags["PIPPA_FUCKED_BY"] = 1;
	
	addButton(0, "Next", mainGameMenu);
}

// Description of Pippa's appearance
public function pippaAppearance():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("Pippa was born a human, but has currently modded herself into a pig-morph. She stands about 5.5 feet tall, 1.68 meters in the common metric system. She’s typically clothed in a tight, white tank top that ends just above her belly button and a pair of tight, gray yoga pants that end midway down her calves. ");
	
	var seenPippaNaked:Boolean = (pippaSexed(0) > 0 || pippaSpecialMassagesGiven(0) > 0);
	
	if (seenPippaNaked) output("She typically forgoes undergarments, sometimes made obvious by her pants, ");
	else output("Her pants are ");
	
	output("stretched so tight as to be almost transparent in the right light");
	
	if (!seenPippaNaked) output(", revealing that she at least doesn’t wear panties");
	
	output(".");
	
	output("\n\nPippa’s face, covered in light pink skin, is mostly human in shape and structure, but where a human’s nose would be, she has a pig-like snout. She has full lips and hazel colored eyes. Her shoulder-length hair is [pippa.hairColor], and partially tied into two bun pigtails in the back. Her body is covered in sparse, barely visible hair of the same color. The hair on her head is parted by two floppy pig ears.");
	
	output("\n\nShe has a humanoid upper body, with normal human arms and torso. She has [pippa.hips] that sexily sway as she walks, and a [pippa.ass] that’s only barely contained by her tight pants. Above her ass is a curly, little pig’s tail. Growing down from her hips are two thick-thighed, digitigrade pig legs, capped in black, cloven hooves. She has a " + pippa.bellyDescript(true) + ", unsurprising considering her love of food. Despite her thick figure, she maintains a curvy body.");
	
	output("\n\nShe has two " + pippa.breastSize(pippa.breastRows[0].breastRatingRaw) + " [pippa.breastsNoun]");
	
	if (seenPippaNaked) output(", capped with brown-pink, inverted nipples. Her areola are " + pippa.areolaSizeDescript() + ", and when she’s aroused, her large, " + pippa.nippleLength() + " inch nipples emerge");
	
	output(". She could easily fill a [pippa.breastCupSize] bra.");
	
	output("\n\n");
	
	if (seenPippaNaked) output("Her pussy is located at her waist, as you’d expect. She has a pig pussy with a rather large clit. Her pussy lips are quite small and featureless until she becomes aroused, and they swell out dramatically. The inside is ridged with a corkscrew pattern.");
	else output("You can only assume she has sexual equipment located at her waist.");
	
	output("\n\nShe");
	
	if (!seenPippaNaked) output(", presumably,");
	
	output(" has one asshole, placed between her [pippa.buttcheeks] where it belongs.");
	
	addButton(0, "Back", pippaMainMenu);
}

// Displays options for talking to Pippa
public function pippaTalkMenu(from:Function = undefined):void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("<i>“You wanna talk? I’d love to.”</i>");
	
	// Talk to her about herself
	if (from != pippaTalkHer) addButton(0, "Her", pippaTalkHer, undefined, "Her", "Ask Pippa about herself.");
	else addDisabledButton(0, "Her", "Her", "You just talked to her about that.");
	
	// Talk to her about you
	if (from != pippaTalkYou) addButton(1, "You", pippaTalkYou, undefined, "You", "Talk to Pippa about yourself.");
	else addDisabledButton(1, "You", "You", "You just talked to her about that.");
	
	if (flags["MET_CFS"] == undefined) addDisabledButton(2, "Carbonado", "Carbonado", "You’ll have to have visited Carbonado to talk to her about it.");
	else if (from == pippaTalkCarbonado) addDisabledButton(2, "Carbonado", "Carbonado", "You just talked to her about that.");
	else addButton(2, "Carbonado", pippaTalkCarbonado, undefined, "Carbonado", "Talk to Pippa about Carbonado.");
	
	if (flags["PIPPA_FLIRTED"] != 1) addDisabledButton(3, "Cock", "Cock", "You should be intimate with Pippa before you talk to her about this.");
	else if (from == pippaTalkHardlight) addDisabledButton(3, "Hardlight", "Hardlight", "You just talked to her about that.");
	else
	{
		if (flags["PIPPA_TALKED_COCK"] != 1) addButton(3, "Cock", pippaTalkCock, undefined, "Cock", "Ask Pippa about getting a cock.");
		else if (!pippa.hasHardLightStrapOn())
		{
			if (pc.hasHardLightStrapOn()) addButton(3, "Hardlight", pippaGiveHardlight, undefined, "Hardlight", "Give Pippa a pair of hardlight underwear.");
			else addDisabledButton(3, "Hardlight", "Hardlight", "You don’t have any hardlight underwear to give to Pippa.");
		}
		else addButton(3, "Hardlight", pippaTalkHardlight, undefined, "Hardlight", "Ask Pippa about her hardlight underwear.");
	}
	
	if (pippaOnShip() && from == pippaTalkParents) addDisabledButton(4, "Parents", "Parents", "You just talked to her about that.");
	else if (pippaOnShip()) addButton(4, "Parents", pippaTalkParents, undefined, "Parents", "Talk to Pippa about her parents.");
	else if (flags["PIPPA_TALKED_HER"] != 1 || flags["PIPPA_TALKED_CARBONADO"] != 1 || flags["PIPPA_TALKED_YOU"] != 1 || pippaAffection(0) < PIPPA_AFFECTION_MASSAGE) addDisabledButton(4, "Money", "Money", "Maybe you should get closer to Pippa better before questioning her finances.");
	else if (from == pippaTalkMoney) addDisabledButton(4, "Money", "Money", "You just talked to her about that.");
	else addButton(4, "Money", pippaTalkMoney, undefined, "Money", "Talk to Pippa about money.");
	
	// Talk to her about Yammi (if you have recruited Yammi and talked to her about herself)
	if (!yammiRecruited()) addDisabledButton(5, "Locked", "Locked", "You’ll need to recruit a certain crew member to talk to her about this.");
	else if (flags["PIPPA_TALKED_HER"] != 1 || !yammiIsCrew()) addDisabledButton(5, "Yammi", "Yammi", "You’ll need to talk to her about herself and have Yammi as a crew member.");
	else if (from == pippaTalkYammi) addDisabledButton(5, "Yammi", "Yammi", "You just talked to her about that.");
	else addButton(5, "Yammi", pippaTalkYammi, undefined, "Yammi", "Talk to Pippa about Yammi.");
	
	// Talk to her about Reaha (if Reaha is a treated crew member and you’ve talked to her about herself)
	/*if (!reahaRecruited()) addDisabledButton(6, "Locked", "Locked", "You’ll need to recruit a certain crew member to talk to her about this.");
	else if (flags["PIPPA_TALKED_HER"] != 1 || !reahaIsCrew() || !reaha.isTreated()) addDisabledButton(6, "Reaha", "Reaha", "You’ll need to talk to her about herself and have Reaha onboard and treated.");
	else if (from == pippaTalkReaha) addDisabledButton(6, "Reaha", "Reaha", "You just talked to her about that.");
	else addButton(6, "Reaha", pippaTalkReaha, undefined, "Reaha", "Talk to Pippa about Reaha."); // Disabled till Reaha can be Treated */
	
	if (MailManager.isEntryViewed("pippa_crew") && flags["PIPPA_RECRUITED"] == undefined) addButton(6, "Request", pippaTalkInitialRecruit, undefined, "Request", "Ask Pippa about the mail she sent you.");
	else if (pippaRecruitTurnedDown()) addButton(6, "Recruit", pippaTalkRecruit, undefined, "Recruit", "Recruit Pippa for your crew.");
	else if (pippaKickedOffShip()) addButton(6, "Recruit", pippaTalkTakeBack, undefined, "Recruit", "Ask Pippa to rejoin your crew.");
	
	addButton(14, "Back", pippaMainMenu);
}

// Talk about Pippa
public function pippaTalkHer():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("You decide to ask Pippa about herself. ");
	
	if (pc.isBimbo() || pc.isBro()) output("<i>“So, like, why are you a piggy?”</i>");
	else output("<i>“So, why a pig?”</i>");
	
	output("\n\nShe narrows her eyes at you, ");
	
	if (pc.raceShort() == "pig") output("and asks, <i>“Who are you to ask that?”</i> She");
	else if (pc.race() != pc.originalRace) output("and says, <i>“You don’t see me asking why you’re " + indefiniteArticle(pc.raceCute(true)) + ".”</i> She");
	else output("but she");
	
	output(" answers the question anyway. <i>“It’s not that interesting of a story. Growing up, even before I’d modded myself, I was already a rather large girl. You know how people love rhyme and alliteration in their insults. Well, it didn’t take long before “Pippa Pig” became the go-to phrase for those looking to make fun of me. Joke’s on them; it also didn’t take long before I started to like the sound of that.”</i>");
	
	output("\n\nThat sounds a bit Stockholm-esque to you, but you decide against saying anything, and instead ask, ");
	
	if (pc.isBimbo() || pc.isBro()) output("<i>“Why aren’t you with the other farm animals?”</i>");
	else output("<i>“Why Uveto?”</i>");
	
	output("\n\nAt this question, she smiles and answers, <i>“No particular reason. That you caught me here is just coincidence. My plan is to move around from place to place every now and then, seeing new things, eating new foods. I actually lived in New Texas previously, and I hadn’t planned to move on, but....”</i> She trails off before continuing, <i>“Well, I liked New Texas, and I like sex as much as the next girl, but it got old. It was so hard to even have a real conversation with someone. And so, I found myself here.”</i>");
	
	output("\n\nIt sounds a bit like she regrets leaving New Texas. <i>“Do you miss New Texas?”</i>");
	
	output("\n\n<i>“I do sometimes miss it. Sex with Treated people is great, of course, and that’s not something I can regularly get outside of New Texas. And as if drinking straight from a New Texas cow-girl’s tits wasn’t good enough, ice cream made with Treated milk must be one of the greatest desserts in the galaxy. But still, I’m happy; I don’t regret moving on. It’s nice to see and experience new things, and talk with people who aren’t total ditzes.");
	
	if (pc.isBimbo() || pc.isBro()) output("”</i> For some reason, as she speaks her last sentence, she breaks eye contact with you and looks sideways. <i>“");
	else output(" ");
	
	output("All that said, even though I haven’t been here long, I was actually thinking about moving on soon. I haven’t thought about where I’ll go next, but this cold is pretty hard to deal with. Not to mention the severe lack of massage customers.”</i>");
	
	output("\n\nThat line of thinking of thinking prompts your next question, <i>“Speaking of massages, how’d that come about?”</i>");
	
	output("\n\nShe presses her fingers together in front of her chest. <i>“Well, for some time growing up, I was a flutist. To be honest, my tone quality was a bit lacking. What I was good at though, was playing fast parts. High tempo? High note division? No problem.”</i>");
	
	output("\n\nYou interrupt, <i>“What’s this have to do with massages?”</i>");
	
	output("\n\n<i>“I’m getting to that, if you’d let me. The point is, I’m dexterous; I’ve good fingers. Now, I wouldn’t have considered applying that particular skill to massages, if not for my mom. Sometimes she’d get sore, particularly in her back. Dad would typically massage her, but one time when he wasn’t around, she asked me. She claimed that it was good, and helped a lot, but I figured she was just being nice. That is, at least, until she kept asking me, even when Dad was around. Eventually, I started selling my services to classmates.");
	
	if (pippaHappyEndingsGiven(0) > 0 || pippaSpecialMassagesGiven(0) > 0) output(" Don’t worry, I was no delinquent. My massages then weren’t quite what they’ve grown to be.");
	
	output(" So, anything else you want to know about me?”</i> You suppose that’s enough for now.");
	
	flags["PIPPA_TALKED_HER"] = 1;
	processTime(5);
	
	addButton(0, "Next", pippaTalkMenu, pippaTalkHer);
}

// Talk about yourself to Pippa
public function pippaTalkYou():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("You think back to when you first met Pippa, and ask, ");
	
	if (pc.isBimbo() || pc.isBro())
	{
		output("<i>“Do you know me?”</i>");
		
		output("\n\nPippa looks confused. <i>“ What do you mean? Of course I know you.”</i>");
		
		output("\n\nYou think, and rephrase your question, <i>“Did you like, know me already?”</i>");
	}
	else output("<i>“Did you already have some idea of who I was when we first met?”</i>");
	
	output("\n\n<i>“And who are you, exactly?”</i>");
	
	output("\n\n<i>“");
	if (pc.isBimbo()) output("I get to take over Daddy’s company! I hope so, anyway.");
	else if (pc.isBro()) output("I get to take over Pop’s company... I hope.");
	else output("Victor Steele, the founder of Steele Tech, is my father. I’m going to succeed him. Or at least, that’s the plan.");
	output("”</i>");
	
	output("\n\nPippa ponders what you’ve told her for a moment with her hand on her chin. <i>“");
	
	if (pc.isBimbo() || pc.isBro()) output("I take it Victor Steele’s your dad then. ");
	
	output("I didn’t know exactly who you were, but I’d have to be living in quite some bubble to not have some idea. There’s a Steele Tech office right near here, after all. You’re the first rich, famous person I’ve gotten to know. Or is it future rich, famous person? Sounds like it’s not a sure thing.”</i> You tell her about your adventure to reclaim the probes, and about your cousin. <i>“Victor seems like my kind of guy, being sure you actually know what you’re doing and making you earn your place. Your cousin sounds like a real asshole though, so I hope you’re successful. Maybe keep me in mind when the time comes; free massages would be a great employee benefit, huh?”</i> She smiles and winks at you.");
	
	flags["PIPPA_TALKED_YOU"] = 1;
	
	processTime(5);
	
	addButton(0, "Next", pippaTalkMenu, pippaTalkYou);
}

// Talk about Carbonado
public function pippaTalkCarbonado():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("It seems strange to you that Pippa would be on the surface working from her home when Carbonado exists. <i>“");
	
	if (pc.isBimbo() || pc.isBro()) output("So like, why aren’t you with the other massagers?”</i>");
	else output("You know there’s a spa with massage services on the station?”</i>");
	
	output("\n\n<i>“You mean Carbonado. I know it.”</i>");
	
	output("\n\n<i>“So why not work there?”</i>");
	
	output("\n\nPippa pauses and places a finger on her lower lip, thinking briefly, and answers, <i>“Well, it’s a nice place, and they’re nice people, I’m sure, but... I guess I just like working for myself. Not to mention, working from home is great. If I worked there, I’d have to venture through the cold, and spend an hour and a half of my day riding a space elevator.”</i> As she speaks the last part, her face twists into a grimace, somewhere between annoyance and fear. <i>“I’m happy to just stay here on the surface, when I can.”</i>");
	
	if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“But wouldn’t it be the best workin’ together?”</i>");
	else output("\n\n<i>“Maybe you’d be more successful if you worked there instead of trying to freelance.”</i>");
	
	output("\n\nShe smiles, a bit ruefully. <i>“Maybe a huskar aversion to oil isn’t the reason for my business performance on Uveto. Don’t get me wrong; I’m not completely opposed to working with or for someone else, but it’d have to be a pretty unique opportunity. It’s not like I’m in financial trouble. And a little competition’s fun, don’t you think? I’ve got my advantages down here, but maybe that beautiful amazon’s too much to overcome.”</i> She smiles at you. <i>“At least I’ve got one customer.”</i>"); 
	
	flags["PIPPA_TALKED_CARBONADO"] = 1;
	
	processTime(5);
	
	addButton(0, "Next", pippaTalkMenu, pippaTalkCarbonado);
}

// Talk about Pippa getting a cock (unlocks option to get her a hardlight strapon)
public function pippaTalkCock():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	if (pc.isBimbo() || pc.isBro())
	{
		output("<i>“You should totally get a cock");
		
		if (pc.isFeminine() && pc.hasCock()) output(", like me");
		
		output("!”</i>");
	}
	else
	{
		output("<i>“Have you ever considered getting yourself a cock?”</i>");
		
		if (pc.hasCock() && !pc.genitalLocation() <= 1) output(" You lightly brush your hand across your crotch. <i>“Having one is pretty nice.”</i>");
	}
	
	output("\n\nPippa smiles. <i>“I’d be lying if I said I never considered it. That said, if I wanted a cock, I’d have one right now. I’m happy with how I am, but....”</i> She closes the distance between you and leans in, bringing her lips close to your ear. <i>“Why the interest in me having a cock? You want me to fuck you?”</i> You blush, but say nothing. She backs off and giggles. <i>“I’ll tell you what. I’m not going to get a cock, but you bring me some hardlight underwear, and I’ll happily ");
	
	if (pc.isTaur()) output("mount you");
	else output( "bend you over");
	
	output(".”</i>");
	
	flags["PIPPA_TALKED_COCK"] = 1;
	
	processTime(2);
	
	addButton(0, "Next", pippaTalkMenu, pippaTalkCock);
}

// Talk to Pippa about her hardlight strapon
public function pippaTalkHardlight():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	if (flags["PIPPA_FUCKED_BY"] >= 1) output("<i>“These things are really something. I should’ve gotten myself a pair a long time ago. Thanks, " + pippaCallsSteele() + ".”</i> She leans in and kisses you on the cheek.");
	else output("Pippa looks at you with a bit of annoyance. <i>“Maybe you should let me give these things a try before you go chatting me up about them.”</i>");
	
	processTime(1);
	
	addButton(0, "Next", pippaTalkMenu, pippaTalkHardlight);
}

// If PC has any hardlight-equipped underwear in their inventory, can give them to Pippa
public function pippaGiveHardlight():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	var buttonCount:int = 0;
	var inventoryHardlights:Array = new Array();
	
	for (var i:int = 0; i < pc.inventory.length; i++)
	{
		if (buttonCount >= 14 && (buttonCount + 1) % 15 == 0)
		{
			addButton(buttonCount++, "Back", pippaTalkMenu);
		}
		
		if (pc.inventory[i].hardLightEquipped)
		{
			addButton(buttonCount++, pc.inventory[i].shortName, pippaGiveHardlightII, i, pc.inventory[i].shortName, pc.inventory[i].tooltip);
			inventoryHardlights.push(pc.inventory[i]);
		}
		
		if(pc.inventory.length > 14 && (i + 1) == pc.inventory.length)
		{
			while((buttonCount + 1) % 15 != 0) { buttonCount++; }
			addButton(buttonCount++, "Back", pippaTalkMenu);
		}
	}
	
	if (inventoryHardlights.length > 0) output("Which pair of hardlight equipped underwear do you want to give to Pippa?");
	else if (pc.hasHardLightEquipped()) output("You don’t have any hardlight equipped underwear in your inventory. You’ll have to take off the ones you’re wearing to give them to Pippa.");
	else output("You don’t have any hardlight equipped underwear to give to Pippa."); // Don’t think it should be possible to get to this else, but it’s here just in case
	
	addButton(14, "Back", pippaTalkMenu);
}

// Give Pippa selected HL underwear
public function pippaGiveHardlightII(i:int):void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	var undies:ItemSlotClass = pc.inventory[i];
	// Give Pippa undies
	pippa.lowerUndergarment = undies;
	// Remove undies from PC inventory
	pc.inventory[i].quantity--;
	if(pc.inventory[i].quantity <= 0) pc.inventory.splice(i, 1);
	
	output("You give Pippa the " + undies.longName + ". She holds them up and examines them. <i>“");
	
	if (undies is PlainPanties) output("Plain and simple. They should do just fine.");
	else if (undies is Thong) output("I’m not a fan of thongs, honestly, but I’ll only need to wear them sometimes I guess.");
	else if (undies is Boyshorts) output("These look comfy.");
	else if (undies is Stockings) output("Sexy, if not really my style.");
	else output("They don’t really look much different from normal underwear.");
	
	output(" So, you going to let me try them?”</i>");
	
	addButton(0, "Get Fucked", pippaGetFucked, undefined, "Get Fucked", "Pippa will fuck you with her hardlight strapon.");
	addButton(14, "Back", pippaTalkMenu);
}

// Talk about Pippa's financial situation
public function pippaTalkMoney():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	if (pippaKickedOffShip())
	{
		output("You ask Pippa about her money situation now that she’s not currently part of your crew.");
		
		output("\n\nShe glares slightly at you. <i>“I’m not taking money from my parents again, if that’s what you’re asking. I’ve got enough saved up to live on it for a while, even with few customers.”</i> Her expression softens and she sighs. <i>“You know I love you, " + pippaCallsSteele() + ", but I’m not too happy about being left back on Uveto. I do hope you’ll let me join you again soon.”</i>");
		
		processTime(1);
		
		addButton(1, "Recruit", pippaTalkTakeBack, undefined, "Recruit", "Ask Pippa to rejoin your crew");
	}
	else
	{
		if (pc.isBimbo() || pc.isBro()) output("<i>“So you fly all over the place and can’t give massages. How do you have money?”</i>");
		else output("<i>“So you’ve a planet hopping lifestyle, and you’ve mentioned your lack of customers multiple times. Yet, you don’t seem too concerned with your financial situation.”</i>");
		
		output("\n\nPippa looks around like she doesn’t really want to talk about it. Maybe you shouldn’t have asked; money can be a sensitive topic. Finally, she sighs before speaking, <i>“Well, here’s the thing. She was no Victor Steele, but I had a grandmother who managed to make quite a bit of money during the last Planet Rush. I never met her, unfortunately, but she was very generous with her money.”</i> She hardens her expression slightly and continues, <i>“And to be clear, I’ve gotten plenty of customers on planets besides this one.”</i>");
		
		output("\n\nYou’re surprised to hear that. You wouldn’t guess she was a rich girl, but it does explain a lot. <i>“Is this grandmother anybody I’d recognize?”</i>");
		
		output("\n\n<i>“No. She was all money, no fame. Anyway, my parents don’t fully approve of my life right now. They don’t understand why I’d mod myself like I have and run around from planet to planet working a job like this. Still, they support me.”</i> She looks down, a slightly sad smile forming on her face, and looks back up. <i>“You know, " + pippaCallsSteele() + ", I actually envy you a bit. I appreciate my parents’ support, and I like not having to worry about money, but it must be nice to set out into the unknown, prove yourself, and earn what’s yours. Not that you started with nothing, I’m sure. As much as the idea appeals to me though, I’ll admit it’s a bit scary.”</i>");
		
		output("\n\n<i>“")
		
		if (pc.isBimbo() || pc.isBro()) output("You can totally do it!");
		else if (pc.isNice()) output("I think you could do it. You’re smart and driven.");
		else if (pc.isMischievous()) output("Well you’ll never know if you could do it unless you try.");
		else output("You know sitting around whining isn’t going to get you anywhere.");
		
		output("”</i>");
		
		output("\n\nShe perks up a bit and smiles at you. ");
		
		if (pc.isAss() || pc.isMischievous()) output("<i>“Yeah, I suppose you’re right.");
		else output("<i>“I appreciate the vote of confidence.");
		
		output(" It’s something to think about at least. Maybe it’s about time I cut my parents off. Thanks for the talk, " + pippaCallsSteele() + ".”</i>");
		
		if (flags["PIPPA_TALKED_MONEY"] != 1)
		{
			flags["PIPPA_TALKED_MONEY"] = 1;
			pippaAffection(5);
		}
		
		processTime(5);
		pippaCheckRecruitment();
	}
	
	addButton(0, "Next", pippaTalkMenu, pippaTalkMoney);
}

// Talk to Pippa about Yammi
public function pippaTalkYammi():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	if (recruitedPippa())
	{
		output("Pippa’s eyes light up. <i>“Yammi’s great, isn’t she? I can sit and chat with her while she cooks and it’s like having a personal chef.");
		if (pippaYammiThreesomeCount(0) > 0) output("”</i> She grins at you salaciously. <i>“And of course, she sure is a sexy little thing. I can’t get enough of the two of you.");
		output(" Joining your crew might just be the best decision I’ve ever made.");
		if (pippaKickedOffShip()) output("... Now if only you’d let me back on the ship.");
		output("”</i>");
	}
	else
	{
		output("Pippa previously mentioned that she was a fan of cow-girl ice cream. <i>“You know, the cashier from a New Texas Iced Teats location is currently on my crew. She’s my chef.”</i>");
		output("\n\nHer eyes light up. <i>“Is that so? I’ll have to keep that in mind. Maybe I can pay her a visit some time. Especially if she can get me some ice cream.”</i>");
	}
	
	flags["PIPPA_TALKED_YAMMI"] = 1;
	processTime(1);
	pippaCheckRecruitment();
	
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
	pippaCheckRecruitment();
	
	addButton(0, "Next", pippaTalkMenu, pippaTalkReaha);
}*/

// Flirt with Pippa (unlock sex given her affection level's high enough or you're Treated
public function pippaFlirt():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("You turn up your charm to max and approach Pippa, intending to make a move on her. You flirt briefly, but quickly get to the point.");
	
	if (pc.isTreated())
	{
		output("\n\n<i>“So you went and got Treated, huh?”</i> She hesitates for a moment before a lusty look spreads across her face. <i>“Sure. Let’s fuck.”</i>");
	}
	else if (pippaAffection(0) >= PIPPA_AFFECTION_SEX)
	{
		output("\n\n<i>“You have been a pleasure to have around, " + pippaCallsSteele() + "....”</i> She hesitates for a moment before a lusty look spreads across her face. <i>“I think I’d enjoy making our relationship a little more personal.”</i>");
	}
	else
	{
		output("\n\n<i>“Listen, " + pippaCallsSteele() + ", I like having you as a customer, but no. At least not yet. Give me a little time to get to know you a bit more, warm up to you some.”</i>");
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

/*
public function pippaNuruEmailGet():void
{
	AddLogEvent("<b>New Email From Pippa (pippa_pig@cmail.com)!</b>", "passive");

	MailManager.unlockEntry("pippa_nuru", GetGameTimestamp());
}
*/

public function pippaTalkParents():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("Now that Pippa’s settled aboard your ship, you ask her if things have changed at all with her parents and her financial situation.");
	
	output("\n\nShe crosses her arms and gives you a half-hearted smile. <i>“Well, I told them I got a, as they put it, real job and asked them to stop sending me money. They’re happy about that, if nothing else, and I am too. But you know what, " + pippaCallsSteele() + "? In a lot of ways, this isn’t much different from what I was doing before. I’m still traveling around the universe, and giving massages. This is just faster paced and with steady pay.”</i>");
	
	output("\n\n");
	
	if (pc.isNice()) output("<i>“And we get to see each other every day.”</i>");
	else if (pc.isAss()) output("<i>“And you get to see me every day.”</i>");
	else output("<i>“And you get a great boss.”</i>");
	
	output("\n\nShe giggles softly and smiles genuinely. <i>“That certainly is a nice change.”</i> She shifts her crossed arms to a position under her breasts and subtly bites her lower lip. <i>“I really am glad to be here. Thank you, " + pippaCallsSteele() + ".”</i> There’s a brief moment of silence and her smile fades into a contemplative look. She sighs and uncrosses her arms. <i>“I guess my parents don’t have to like or understand everything about me. I’m happy and they care about me, so that’s good enough.”</i> She steps in and gives you a peck on the cheek. <i>“Thanks for checking in on me, " + pippaCallsSteele() + ". I’m happy to talk whenever you like.”</i>");
	
	processTime(3);
	
	addButton(0, "Next", pippaTalkMenu, pippaTalkParents);
}