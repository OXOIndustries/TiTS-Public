/*FLAGS:
BESS_HAIRSTYLE = bessHairStyle: "a messy chignon"

BESS_LOCATION 			-- Current location of Bess
	BESS_AT_TAVROS 		-- Not on crew, currently waiting for the PC at Tavros station
	BESS_ON_CREW 		-- Onboard the PCs ship

BESS_DISABLED
	undefined	 		-- Still active in some capacity
	1 					-- Hard disable

BESS_SEX_ROLE
	0 					-- Equals
	1  					-- Bess is Dom
	2 					-- Bess is Sub

BESS_VOCAL

BESS_GLASSES
BESS_KATANA
BESS_TIT_CUM
BESS_CUM_DUMP
BESS_LOVER
BESS_FRIEND
BESS_DREAMS
BESS_FERTILE
BESS_ACCESSORY
BESS_PC_SEX_NAME
BESS_PC_NAME
BESS_SEX_NAME
BESS_CREW_ROLE
BESS_COLOR
BESS_DRINK
BESS_GENRE
BESS_MUSIC
*/

public function bessSexName():String
{
	if (flags["BESS_SEX_NAME"] == undefined) flags["BESS_SEX_NAME"] = bess.short;
	return flags["BESS_SEX_NAME"];
}

public function bessName():String
{
	if (flags["BESS_NAME"] == undefined) flags["BESS_NAME"] = bess.short;
	return flags["BESS_NAME"];
}

public function bessPCName():String
{
	if (flags["BESS_PC_NAME"] == undefined) flags["BESS_PC_NAME"] = pc.short;
	return flags["BESS_PC_NAME"];
}

public function bessPCSexName():String
{
	if (flags["BESS_PC_SEX_NAME"] == undefined) flags["BESS_PC_SEX_NAME"] = pc.short;
	return flags["BESS_PC_SEX_NAME"];
}

public static const BESS_CREWROLE_INTOFFICER:String = "intelligence officer";
public static const BESS_CREWROLE_ACCOUNTANT:String = "accountant";
public static const BESS_CREWROLE_ARCHIVIST:String = "archivist";
public static const BESS_CREWROLE_STEWARDESS:String = "chief stewardess";
public static const BESS_CREWROLE_TECHNICIAN:String = "technician";

public function bessCrewRole():String
{
	if (flags["BESS_CREW_ROLE"] == undefined) flags["BESS_CREW_ROLE"] = "crewmember"; // ??????
	return flags["BESS_CREW_ROLE"];
}

public function bessGlasses():Boolean
{
	if (flags["BESS_GLASSES"] == 1) return true;
	return false;
}

public function bessKatana():Boolean
{
	if (flags["BESS_KATANA"] == 1) return true;
	return false;
}

public function bessHairStyle():String
{
	return flags["BESS_HAIRSTYLE"]; // should never be undef cause we set it during initial bess-lootership
}

public function bessIsDom():Boolean
{
	if (flags["BESS_SEX_ROLE"] == undefined)
	{
		flags["BESS_SEX_ROLE"] = 0);
		return false;
	}

	if (flags["BESS_SEX_ROLE"] == 1) return true;
	return false;
}

public function bessIsSub():Boolean
{
	if (flags["BESS_SEX_ROLE"] == undefined)
	{
		flags["BESS_SEX_ROLE"] = 0);
		return false;
	}

	if (flags["BESS_SEX_ROLE"] == 2) return true;
	return false;
}

public function bessIsEqual():Boolean
{
	if (flags["BESS_SEX_ROLE"] == undefined)
	{
		flags["BESS_SEX_ROLE"] = 0);
		return true;
	}

	if (flags["BESS_SEX_ROLE"] == 0) return true;
	return false
}

public function bessHairLength():String
{
	switch (bess.hairLength)
	{
		case 0:
		default:
			return "none";

		case 2:
			return "short":

		case 8:
			return "moderately long";

		case 18:
			return "shoulder length";

		case 40:
			return "ass length";

		case 60:
			return "floor length";
	}
}

public function bessNippleType():String
{
	var nipType:int = bess.breastRows[0].nippleType;

	switch (nipType)
	{
		case GLOBAL.NIPPLE_TYPE_FUCKABLE:
			return "fuckable";

		case GLBOAL.NIPPLE_TYPE_LIPPES:
			return "mouth";

		case GLOBAL.NIPPLE_TYPE_DICK:
			return "dick";

		case GLOBAL.NIPPLE_TYPE_FLAT:
			return "flat";

		case GLOBAL.NIPPLE_TYPE_INVERTED:
			return "inverted";

		case GLOBAL.NIPPLE_TYPE_TENTACLED:
			return "tentacle";

		case GLOBAL.NIPPLE_TYPE_NORMAL:
		default:
			return "normal";
	}
}

public function bessAssSize():String
{
	if (bess.buttRatingRaw < 2) return "boyish";
	if (bess.buttRatingRaw < 4) return "slender";
	if (bess.buttRatingRaw < 8) return "average";
	if (bess.buttRatingRaw < 10) return "ample";
	if (bess.buttRatingRaw < 16) return "voluptuous";
	return "massive";
}

public function bessThighSize():String
{
	if (bess.buttRatingRaw < 2) return "boyish";
	if (bess.buttRatingRaw < 4) return "slender";
	if (bess.buttRatingRaw < 8) return "average";
	if (bess.buttRatingRaw < 10) return "ample";
	if (bess.buttRatingRaw < 16) return "voluptuous";
	return "massive";
}

public function bessBellySize():String
{
	switch (bess.bellyRatingRaw)
	{
		case 0: return "normal";
		case 10: return "cushy";
		case 15: return "pudgy";
		case 20: return "large";
		case 30: return "pregnant";
		case 40: return "full";
		case 50: return "expansive";
		case 60: return "excessive";
		case 80: return "over-inflated";
		case 90: return "massive";
		case 100: return "stupidly huge";
		default: return "";
	}
}

public function bessTone():String
{
	if (bess.tone == 100) return "muscular";
	if (bess.tone == 70) return "semi-muscular";
	if (bess.tone == 50) return "average";
	if (bess.tone == 30) return "semi-soft";
	return "soft";
}

public function bessThickness():String
{
	if (bess.thickness == 100) return "thick";
	if (bess.thickness == 70) return "semi-thick";
	if (bess.thickness == 50) return "average";
	if (bess.thickness == 30) return "semi-thin";
	return "thin";
}

public function bessCockType():String
{
	if (!bess.hasCock()) return "";

	switch (bess.cocks[0].cType)
	{
		case GLOBAL.TYPE_HUMAN: return "normal";
		case GLOBAL.TYPE_SAURIAN: return "saurian";
		case GLOBAL.TYPE_EQUINE: return "equine";
		case GLOBAL.TYPE_CANINE: return "canine";
		case GLOBAL.TYPE_VULPINE: return "vulpine";
		case GLOBAL.TYPE_DEMONIC: return "demonic";
		case GLOBAL.TYPE_TENTACLE: return "tentacle";
		case GLOBAL.TYPE_FELINE: return "feline";
		case GLOBAL.TYPE_DRACONIC: return "draconic";
		case GLOBAL.TYPE_GOO: return "goo";
		case GLOBAL.TYPE_PLANT: return "plant";
		default: return "";
	}
}

public function bessCumFlavor():String
{
	switch (bess.cumType)
	{
		case GLOBAL.FLUID_TYPE_CUM: return "normal";
		case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK: return "chocolate";
		case GLOBAL.FLUID_TYPE_CANDY: return "candy";
		case GLOBAL.FLUID_TYPE_COFFEE: return "coffee";
		case GLOBAL.FLUID_TYPE_VANILLA: return "vanilla";
		case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK: return "strawberry";
		case GLOBAL.FLUID_TYPE_CARAMEL: return "caramel";
		case GLOBAL.FLUID_TYPE_BANANA: return "banana";
		case GLOBAL.FLUID_TYPE_COCONUT: return "coconut";
		case GLOBAL.FLUID_TYPE_MAPLESYRUP: return "maple syrup";
		case GLOBAL.FLUID_TYPE_CHERRY: return "cherry";
		case GLOBAL.FLUID_TYPE_CHOCVANILLA: return "choc-vanilla";
		case GLOBAL.FLUID_TYPE_WHISKY: return "whisky";
		case GLOBAL.FLUID_TYPE_HONEY: return "honey";
		case GLOBAL.FLUID_TYPE_RUM: return "rum";
		case GLOBAL.FLUID_TYPE_VODKA: return "vodka";
		case GLOBAL.FLUID_TYPE_BEER: return "beer";
		case GLOBAL.FLUID_TYPE_ORANGE: return "orange";
		case GLOBAL.FLUID_TYPE_BLUEBERRY: return "blueberry";
		case GLOBAL.FLUID_TYPE_RASPBERRY: return "raspberry";
		case GLOBAL.FLUID_TYPE_LIME: return "lime";
		default: return "normal";
	}
}

public function bessGirlCumFlavor():String
{
	switch (bess.girlCumType)
	{
		case GLOBAL.FLUID_TYPE_GIRLCUM: return "normal";
		case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK: return "chocolate";
		case GLOBAL.FLUID_TYPE_CANDY: return "candy";
		case GLOBAL.FLUID_TYPE_COFFEE: return "coffee";
		case GLOBAL.FLUID_TYPE_VANILLA: return "vanilla";
		case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK: return "strawberry";
		case GLOBAL.FLUID_TYPE_CARAMEL: return "caramel";
		case GLOBAL.FLUID_TYPE_BANANA: return "banana";
		case GLOBAL.FLUID_TYPE_COCONUT: return "coconut";
		case GLOBAL.FLUID_TYPE_MAPLESYRUP: return "maple syrup";
		case GLOBAL.FLUID_TYPE_CHERRY: return "cherry";
		case GLOBAL.FLUID_TYPE_CHOCVANILLA: return "choc-vanilla";
		case GLOBAL.FLUID_TYPE_WHISKY: return "whisky";
		case GLOBAL.FLUID_TYPE_HONEY: return "honey";
		case GLOBAL.FLUID_TYPE_RUM: return "rum";
		case GLOBAL.FLUID_TYPE_VODKA: return "vodka";
		case GLOBAL.FLUID_TYPE_BEER: return "beer";
		case GLOBAL.FLUID_TYPE_ORANGE: return "orange";
		case GLOBAL.FLUID_TYPE_BLUEBERRY: return "blueberry";
		case GLOBAL.FLUID_TYPE_RASPBERRY: return "raspberry";
		case GLOBAL.FLUID_TYPE_LIME: return "lime";
		default: return "normal";
	}
}

public static const BESS_ACCSET_EQUINE:uint 		= 1;
public static const BESS_ACCSET_BOVINE:uint 		= 1 << 1;
public static const BESS_ACCSET_CANINE:uint 		= 1 << 2;
public static const BESS_ACCSET_FELINE:uint 		= 1 << 3;
public static const BESS_ACCSET_VULPINE:uint 		= 1 << 4;
public static const BESS_ACCSET_BUNNY:uint 			= 1 << 5;
public static const BESS_ACCSET_BEE:uint 			= 1 << 6;
public static const BESS_ACCSET_DRACONIC:uint 		= 1 << 7;
public static const BESS_ACCSET_DEMONIC:uint 		= 1 << 8;
public static const BESS_ACCSET_SHARK:uint 			= 1 << 9;
public static const BESS_ACCSET_DEER:uint 			= 1 << 10;
public static const BESS_ACCSET_MOUSE:uint 			= 1 << 11;
public static const BESS_ACCSET_ANGEL:uint 			= 1 << 12;
public static const BESS_ACCSET_KITSUNE:uint 		= 1 << 13;

public static const BESS_COCKTYPE_DINO:uint 		= 1 << 14;
public static const BESS_COCKTYPE_HORSE:uint 		= 1 << 15;
public static const BESS_COCKTYPE_DOG:uint 			= 1 << 16;
public static const BESS_COCKTYPE_FOX:uint 			= 1 << 17;
public static const BESS_COCKTYPE_DEMON:uint 		= 1 << 18;
public static const BESS_COCKTYPE_TENTACLE:uint 	= 1 << 19;
public static const BESS_COCKTYPE_CAT:uint 			= 1 << 20;
public static const BESS_COCKTYPE_GOO:uint 			= 1 << 21;
public static const BESS_COCKTYPE_PLANT:uint 		= 1 << 22;
public static const BESS_COCKTYPE_DRAGON:uint 		= 1 << 23;

public function bessHasAccessorySet(setType:uint):Boolean
{
	if (flags["BESS_ACCESSORY_SETS"] == undefined) flags["BESS_ACCESSORY_SETS"] = 0;

	return (flags["BESS_ACCESSORY_SETS"] & setType > 0);
}

public function bessAddAccessorySet(setType:int):void
{
	if (flags["BESS_ACCESSORY_SETS"] == undefined) flags["BESS_ACCESSORY_SETS"] = 0;

	flags["BESS_ACCESSORY_SETS"] |= setType;
}

// Packing these values into the accset flag for now -- if we need more space we can easily split them into two sets of flags
public function bessHasCockType(setType:uint):Boolean
{
	if (flags["BESS_ACCESSORY_SETS"] == undefined) flags["BESS_ACCESSORY_SETS"] = 0;

	return (flags["BESS_ACCESSORY_SETS"] & setType > 0);
}

public function bessAddCockType(setType:uint):void
{
	if (flags["BESS_ACCESSORY_SETS"] == undefined) flags["BESS_ACCESSORY_SETS"] = 0;

	flags["BESS_ACCESSORY_SETS"] |= setType;
}

public function bessHasClothingItem(clothingType:Class):Boolean
{
	// 9999
	// can't really pack this into uints -- too many options (outfits) even if we split armor/upper/lower (more than 32 options)
	// creature inventory I guess is a decent placeholder for now maybe -- can look into other options later, hence wrapping simple call here
	return bess.hasItemByType(clothingType);
}

public function bessHasGlasses():Boolean
{
	if (flags["BESS_OWNS_GLASSES"] == 1) return true;
	return false;
}

public function bessHasKatana():Boolean
{
	if (flags["BESS_OWNS_KATANA"] == 1) return true;
	return false;
}

public static const BESS_AT_TAVROS:uint = 1;
public static const BESS_ON_CREW:uint = 2;

public function bessHeader():void
{
	if (bess.isFeminine())
	{
		showName("\nBESS-13");
		showBust("BESS");
	}
	else
	{
		showName("\nBEN-14");
		showBust("BEN")
	}
	author("JimT");
}

public function bessIsCrew():Boolean
{
	if (flags["BESS_LOCATION"] == BESS_ON_CREW) return true;
	return false;
}

public function bessIsSleepCompanion():Boolean
{
	// 9999
	return true;
}

public function bessTopStripScene():void
{
	if (bess.isChestGarbed()
	{
		//If bess is wearing armor
		if (!(bess.armor is EmptySlot))
		{
			// First brackets are if Bess is wearing any known outfit with a slide down top. Else she just removes the top (All her clothing items that aren't slide down have a removable top). 

			// E.g. if (bess.armor.shortName == "ShortKimono" || bess.armor.shortName == "Yukata" || bess.armor.shortName == "FemaleKimono" || bess.armor.shortName == "ChinaDress" || bess.armor.shortName == bess.armor.shortName == "NinjaOutfit" || bess.armor.shortName == "Yukata" || bess.armor.shortName == "NurseOutfit" || || bess.armor.shortName == "CheerleaderUniform" ||bess.armor.shortName == "GothLolita" || bess.armor.shortName == "LittleBlackDress")

			if
			(		bess.armor is ShortKimono
			||	bess.armor is Yukata
			||	bess.armor is FemaleKimono
			||	bess.armor is ChinaDress
			||	bess.armor is NinjaOutfit
			||	bess.armor is NurseOutfit
			||	bess.armor is CheerleaderUniform
			||	bess.armor is GothLolita
			||	bess.armor is LittleBlackDress
			)
			{
				output("\n\n[bess.name] reaches up to [bess.hisHer] neck and undoes [bess.hisHer] [bess.armor], sliding it down [bess.hisHer] body");
				if (bess.isFeminine()) output(" with a cute little wiggle");
				output(" until it is bunched around [bess.hisHer] waist.");
			}
			else
			{
				output("\n\n[bess.name] reaches up and slips off the top of [bess.hisHer] [bess.armor].");
			}
			output(" Underneath [bess.heShe]'s");
			if (bess.upperUndergarment is EmptySlot) output(" completely naked and");
			else output(" wearing a [bess.upperUnderGarment]. [bess.HeShe] removes it and soon");
			output(" [bess.hisHer] [bess.chest]");
			if (bess.biggestTitSize() == 0) output(" is");
			else output(" are");
			output(" proudly on display.");
		}
		// B is wearing no armor, but undergarment that covers the top.
		else if (!(bess.upperUndergarment is EmptySlot))
		{
			output("\n\n[bess.HisHer] [bess.chest]");
			if (bess.biggestTitSize() == 0) output(" is");
			else output(" are");
			output(" barely constrained by [bess.hisHer] [bess.upperUndergarment]. [Bess.heShe] slips it off and tosses it aside. [bess.HisHer] beautiful, naked body is now on display as [bess.heShe] stands there wearing nothing");
			if (!(bess.lowerUndergarment is EmptySlot)) output(" but a pair of [bess.lowerUnderGarment] clinging to [bess.hisHer] [bess.hips].");
			else output(" at all.");
		}
	}
}

public function bessAffection(val:Number = 0):Number
{
	if (flags["BESS_AFFECTION"] == undefined) flags["BESS_AFFECTION"] = 0;
	
	if (val != 0)
	{
		flags["BESS_AFFECTION"] += val;
		if (flags["BESS_AFFECTION"] < 0) flags["BESS_AFFECTION"] = 0;
		if (flags["BESS_AFFECTION"] > 100) flags["BESS_AFFECTION"] = 100;
	}

	return flags["BESS_AFFECTION"];
}

public static const BESS_AFFECTION_SPENDTIME:uint = 1;
public static const BESS_AFFECTION_SEX:uint = 2;
public static const BESS_AFFECTION_SLEEPWITH:uint = 3;
public static const BESS_AFFECTION_SLEEPWITHANDOTHERS:uint = 4;
public static const BESS_AFFECTION_SLEEPWITHOTHER:uint = 5;
public static const BESS_AFFECTION_GRAVIBALL:uint = 6;
public static const BESS_AFFECTION_KAREOKE:uint = 7;
public static const BESS_AFFECTION_SEX_LOVERSMORNINGS:uint = 8;
public static const BESS_AFFECTION_DATE:uint = 9;

public function bessAffectionGain(gainType:uint):void
{
	if (gainType == BESS_AFFECTION_SEX)
	{
		if (flags["BESS_LOVER"] == 1) bessAffection(2);
		else if (flags["BESS_FRIEND"] == 1) bessAffection(1);
		else bessAffection(0.5);
	}
	else if (gainType == BESS_AFFECTION_SPENDTIME)
	{
		if (flags["BESS_LOVER"] == 1) bessAffection(3);
		if (flags["BESS_FRIEND"] == 1) bessAffection(2);
		else bessAffection(1);
	}
	else if (gainType == BESS_AFFECTION_SLEEPWITH)
	{
		bessAffection(5);
	}
	else if (gainType == BESS_AFFECTION_SLEEPWITHOTHER)
	{
		if (flags["BESS_POLY"] == 2) bessAffection(2);
	}
	else if (gainType == BESS_AFFECTION_GRAVIBALL)
	{
		bessAffection(2);
	}
	else if (gainType == BESS_AFFECTION_KAREOKE)
	{
		bessAffection(3);
	}
	else if (gainType == BESS_AFFECTION_DATE)
	{
		bessAffection(10);
	}
	else if (gainType == BESS_AFFECTION_SEX_LOVERSMORNINGS)
	{
		bessAffection(5);
	}
}

public function findingBessBonusFunc():Boolean
{
	if (flags["BESS_IN_RUBBLE"] == undefined)
	{
		output("\n\nThere is a strange silver glint over in a large pile of junk. It is completely out of place with the rusted rubbish surrounding it. Maybe it is something valuable?");
		//[ Silver Object ]
		addButton(0, "Silver Object", findASilverObject, undefined, "Silver Object", "Investigate the silver object.");
	}
	return false;
}

//Silver Object {If clicked on}
public function findASilverObject():void
{
	clearOutput();

	output("You abandon caution for curiosity and inch closer towards the silvery object.");
	output("\n\nAs you close in, you realise two things. One, it is much larger than it first appeared. Two, the shape of the part that is sticking out is easy to identify.");
	output("\n\nIt’s a foot. Why is a silvery foot poking out of a pile of half-broken pipes and shattered holos?");
	output("\n\nIt looks like a machine foot, to boot. On further examination, the foot is connected to a body, and the body is buried beneath the rubbish.");
	//ifRunIntoPleasureBots: 
	if(flags["MET_SEXBOTS_ON_TARKUS"] != undefined) output(" It looks far too sleek looking to be one of the Pleasure Bots that aimlessly roam the Tarkus wastes.");
	output(" From what you can see it doesn’t look rusted, or even slightly scratched, adding even more to the air of mystery surrounding it.");
	//SydiansMet:
	if(flags["MET_SYDIAN_MALE"] != undefined) output(" You can't believe the Sydians haven't melted this thing down yet.");
	output("\n\nWhat kind of foot is it...?");

	clearMenu();
	//[Synthetic Female Foot] [Synthetic Male Foot]
	// This choice sets Bess/Ben's gender flag to female or male, respectively, and sets all the starting body values. 
	addButton(0,"Female Foot",setBessSex,"female","Female Foot","The synthetic foot obviously belongs to a female. Everyone knows you can tell the assumed gender of an inorganic by the shape of its ambulatory limbs!");
	addButton(1,"Male Foot",setBessSex,"male","Male Foot","The synthetic foot obviously belongs to a male. Everyone knows you can tell the assumed gender of an inorganic by the shape of its ambulatory limbs!");
}

//Either Choice
public function setBessSex(bessesStartingSexHahaThatsNotHowYouWriteAPossessive:String = "female"):void
{
	clearOutput();
	output("On closer examination, it definitely looks like a " + bessesStartingSexHahaThatsNotHowYouWriteAPossessive + " foot. The real question though is if you want to dig this thing up and see what it is...?");
	if(bessesStartingSexHahaThatsNotHowYouWriteAPossessive == "female")
	{
		bess.configureFemale();
	}
	else
	{
		bess.configureMale();
	}
	//[ Dig It Up ] [ Leave It ]
	clearMenu();
	addButton(0,"Dig It Up",digUpBessBenWhoCares);
	addButton(14,"Leave",mainGameMenu);
}

//Dig It Up
public function digUpAFukkinSexbat():void
{
	clearOutput();
	output("Curiosity gets the better of you as you decide to dig it up. Getting rid of all the junk on top of it is a quick and easy process.");
	output("\n\nSoon a silvery humanoid body, distinctly " + bess.mf("masculine","feminine") + " and covered in segmented lines, is revealed amongst the rubble. An incredibly shapely rear is glinting back up at you, connected to " + bess.mf("manly","womanly") + " thighs and hips of glistening chrome.");
	output("\n\nWhat a butt! You can't help but reach out and poke it, just to see if it is real. For <i>exploratory</i> purposes, of course.");
	output("\n\nAs you touch [bess.his] silvery rump, you find it is ");
	if(bess.hasCock()) output("delightfully taught with a tiny bit of give,");
	else output("surprisingly soft");
	output(" and sensuously smooth.");
	if(bess.hasCock()) output(" You poke elsewhere, and what");
	else output(" What");
	output(" looks like chrome metal plating is actually quite pliant and springy, just like the flesh of a human. The detail work is amazing!");
	output("\n\n Even so, it is quite clearly a mechanical life form, complete with visible rivets along [bess.hisHer] spine. There is even a registration number stamped right above ");
	if(bess.hasVagina()) output("her pert");
	else output("his incredibly fine");
	output(" ass like a robotic tramp stamp. You read it out loud.");

	output("\n\n<i>“" + bess.mf("Ben Fourteen","Bess Thirteen") + ".”</i> The rest of the registration number is scratched out. Is that [bess.hisHer] model number, [bess.hisHer] actual name, or is [bess.heShe] literally the " + bess.mf("fourteenth","thirteenth") + " of a line of " bess.mf("Bens","Besses") + "?");

	output("\n\nSince you're not going to get any answers from staring at [bess.hisHer] ass - no matter how perfect it is - you decide to turn [bess.himHer] over and get a good look at [bess.hisHer] other side. Maybe there are some more details there.");

	if (bess.hasVagina())
	{
		output("\n\nOnce you have, you notice her silvery artificial hair draping across her face. It is tied back in a loose, messy chignon, knotted at her lower neck. Her eyes are closed, full womanly lips pursed as if merely asleep.");
		output("\n\nThose sleeping eyes are lined with thick artificial lashes that are marred with dirt, but even now look full and luscious. Her face is marked with two groove-like lines that start at her forehead, trail across her eyelids, and pass below her narrow chin.");
		output("\n\nLooking down, your eyes are met by a truly wondrous set of breasts. The swelling curve of her perfect peaks easily captures your attention, drawing them inevitably towards her perky, silver hued nipples.");
		output("\n\nDrawing your eyes away from <i>those</i> is difficult. Looking down, her stomach is a slender sterling expanse, her belly rising softly with all the right curves and grooves accentuating her feminine appeal.");
		output("\n\nMoving south, your eyes are rewarded by the sight of her glistening, utterly hairless crotch replete with plump pussy lips. Her thighs and folds are slightly parted, her soft inner lips on display.");
	}
	else // man bot!
	{
		output("\n\nOnce you have, you notice his silvery artificial hair slicked back. What would normally be thick chin length hair has been pushed back in a sweeping wave, giving his hair great lift. His eyes are closed and his rich, kissable lips are pursed as if merely asleep.");
		output("\n\nThose sleeping eyes are lined with powerful, brooding brows that look capable of a great deal of interesting expressions. His well shaped cheeks are marked with two groove-like lines that start at his forehead, trail down his eyelids, and pass below his narrow chin.");
		output("\n\nLooking down, you are met with broad masculine shoulders and a positively adonic chest, the kind you could run your fingers up and down for <i>hours</i>. His preposterously perfect chest is capped in silver hued nipples.");
		output("\n\nDrawing your eyes away from <i>that</i> is difficult. Looking down, his abs are a wondrous expanse of muscular curves, each one accentuating his masculine appeal. With bated breath, you let your eyes travel lower, seeking the sight of his most manly aspect.");
		output("\n\nYour eyes are quickly rewarded with the sight of his gloriously thick manhood. It looks humanoid apart from its sterling color, though in no way could be called average. It towers upwards and presses pointedly against his taut stomach, enticingly stiff in his slumber.");
		output("\n\nHis silvery spheres are completely hairless, just like the rest of him. It’s as if he’s a well-shaved model lying back in his brazen glory, showing off his truly envious features.");
	}
	output("\n\nEverything about this silvery synthetic is ‘too perfect’, screaming artificial. " bess.mf("Men", "Women") + " this beautiful aren’t born, they’re built- either through engineering or through genetic enhancement.");
	output("\n\nOne thing’s for certain; [bess.heShe] must have cost a <i>mint</i> to make. [bess.HisHer] detail work makes the other robots on Tarkus look like, well, trash. Why would someone throw a galactic class android like this out? [bess.HeShe] might even be worth as much as a <i>starship</i>.");
	output("\n\nReaching up to [bess.hisHer] open neck compartment, you can see a small digital display. Flickering across it are three words: <i>Main Power Depleted</i>. It doesn’t take a starship engineer to figure out why [bess.heShe] isn’t moving.");
	output("\n\nIf cleaned up, this " + bess.mf("male", "female") + " unit would definitely sell for a pretty Galactic Credit, or you could keep [bess.himHer] for your own use. Either way, [bess.heShe] needs to have [bess.hisHer] batteries recharged, and the easiest way to do that is to take [bess.himHer] back to your ship.");
	output("\n\nFinding [bess.himHer] really is like finding a gem in the rough, though you could just leave [bess.himHer] here. It doesn’t look like [bess.heShe] is going to rust anytime soon.");
	//[Take On Ship] [Leave Here] 
	processTime(7);
	clearMenu();
	addButton(0,"TakeToShip",takeBessToZeShip);
	addButton(1,"Leave Here",leaveBessHereYouCunt);
}

//Taking him/her to the Ship
//Take On Ship
public function takeBessToZeShip():void
{
	currentLocation = "SHIP INTERIOR";
	flags["BESS_IN_RUBBLE"] = 1; // shit flag name sue me
	
	clearOutput();
	if (bess.hasVagina())
	{
		output("It’s a good thing the female unit is so light - it takes you far less time to get her back to the ship than you first thought. She’s so soft to the touch that it is hard to believe she’s really a machine.");
	}
	else // male
		output("Carrying the male unit back to the ship takes quite a lot of effort. Having him pressed against your chest causes you to flush a little. His skin is so smooth, and his assets so detailed, it's hard to believe that he's really a machine and not an organic man.");
	output("\n\nLuckily, you’re not attacked by any natives on the way back to Novahome. You’re pretty sure you wouldn’t have been able to put up a proper fight carrying the synthetic.");
	output("\n\nOnce you return to the ship, it is simply a matter of locating [bess.hisHer] power slot. Placing [bess.himHer] down in the cargo bay, you check over [bess.hisHer] body for anything that stands out. Right above [bess.hisHer] rump is a barely perceivable line that looks somewhat suspicious.");
	output("\n\nAfter working it for a bit with some tools, you are able to pop it open. The second you do, something shoots out like a snake exploding from a can. It happens so suddenly you fall back on your ass, reaching immediately for a wrench.");
	output("\n\nWhen you collect yourself you can see a five foot snake-like appendage now protruding from just above [bess.hisHer] rear. It is dancing through the air like a cobra to a flute, apparently searching for something.");
	output("\n\nNow that you’ve got a moment to examine it - and it doesn’t seem immediately threatening - you notice the head of the prehensile extension is incredibly phallic. While its body is tubular and flexible, the end is long, stiff, and ribbed. The very tip is flared just like a human member.");
	output("\n\nDespite its appearance you see [bess.hisHer] neck compartment flashing with the words <i>power source found.</i>. Suddenly it shoots into one of the nearby power ports. At first it doesn’t look like it will fit, but then the mysteriously phallic head adjusts itself and expands to fit the coupling.");
	output("\n\nAll in all, the entire process is pretty suggestive. That coupler can’t be <i>coincidentally</i> shaped that way, can it?");
	output("\n\nYou’re glad that you don’t have to find one to fit the android, since [bess.heShe] apparently has one of [bess.hisHer] own. Convenient. Checking the side of [bess.hisHer] neck, you see [bess.heShe] is now in charging mode.");
	output("\n\nYou leave [bess.himHer] for a while and wander the ship. There’s really no point hanging around until [bess.heShe]’s fully restored.");
	processTime(120 + rand(40));
	clearMenu();
	addButton(0,"Next",plugBessesFatAssInPartII);
}

//[Next]
public function plugBessesFatAssInPartII():void
{
	clearOutput();
	output("Your Codex bleeps at you when the unit is apparently finished charging. You finish your drink and head back down to the cargo bay.");
	output("\n\nWhen you get there, the " + bess.mf("male", "female") + " android is already retracting the coupling cable out of the wall with a satisfied sigh. As [bess.heShe] stands upright it slides back inside [bess.hisHer] body and disappears completely from sight.");
	output("\n\nYou can hear [bess.hisHer] rear compartment closing with a small clicking noise.");
	output("\n\nStriding into the room, you have your [pc.weapon] pointed at her for good measure. After all, [bess.heShe] may have been dumped on Tarkus for good reason.");

	output("\n\nWhen the silver-haired synthetic notices you entering the room, " + bess.mf("he elegantly bows to you, almost as he were a butler or maitre d’", "she immediately bows to you, her hands clasped together in front of her body") + ". [bess.HeShe] seems unphased not only by your weapon, but also by the fact that [bess.heShe] is completely nude.");
	if (bess.isFeminine())
	{
		output("\n\nWhen she speaks, her voice is positively melodic, each note lilting and falling at all the right places without a hint of synthesising, like a well-composed sonnet.");
	}
	else
	{
		output("\n\nWhen he speaks, his voice is rich and full of timbre, far from the synthesized voice of typical androids. Instead, it sounds full and flavorsome, like a well composed sonnet.");
	}
	output("\n\n<i>“Greetings, [pc.Master]! Thank you for purchasing this unit from JoyCo, the number one galactic seller of medical supplies and high-quality assist-bots!”</i> " + bess.mf("He sounds remarkably upbeat", "She sounds surprisingly happy") + " for someone who was just fished out of a junk pile. <i>“JoyCo hopes you enjoy your purchase, since your pleasure is our pleasure!”</i>");
	output("\n\nYou ask exactly <i>who</i> and <i>what</i> [bess.heShe] is, and <i>why</i> [bess.heShe] is calling you ‘[pc.Master]’. There are an awful lot of ‘w’ questions that need to be answered until you put down your weapon.");
	output("\n\nThe " + bess.mf("male","female") + " android looks a little confused. <i>”</i>[pc.Master], I don’t have a name yet - you haven’t given me one. " + bess.mf("I’m the Breeding Emergency Neutralizer Android Model No.14, or Ben-14,", "I’m the Breeding Emergency Sex Substitute Android Model No.13, or ‘Bess-13’,") + " that you ordered from JoyCo. You know, the one designed to relieve your pent-up breeding needs?”</i>");
	output("\n\nIt seems [bess.heShe] has been reset to [bess.hisHer] factory settings, and now [bess.heShe] thinks you are [bess.hisHer] registered owner. Either that, or [bess.heshe] was fresh out of the box to begin with. Could you be lucky enough to have found your very own high-class, brand-spanking new JoyCo sex relief android?");
	// Silly Mode && bess.gender = female
	if(silly && bess.isFeminine()) output("\n\n...Somewhere, there’s a very unhappy looking Japanese boy, waiting for his girlfriend to arrive...");
	output("\n\nHmm. What to do with [bess.himHer]? You could keep [bess.himHer], give [bess.himHer] a name and have [bess.himHer] live on your ship. [bess.HeShe]’s sure to do whatever you say. Having one on your ship could prove advantageous, especially with the lusty aliens you keep encountering.");
	if(silly) output(" It’s like your life is some kind of <i>sex game</i>....");
	output("\n\nIf you ditch [bess.himHer] back on the planet, [bess.heShe]’d probably just be food for the natives. That, or [bess.heShe]’d become another mindless drone wandering the wastes, albeit a ritzy one. Then again, dumping [bess.himHer] could save a lot of trouble down the line.");
	output("\n\nGiven that [bess.heShe]’s a galactic class unit, you could probably get some major credits even with [bess.hisHer] registration number scratched off. You wouldn’t get anywhere near [bess.hisHer] commercial price. Best case scenario, you get a nice five figure sum, since [bess.heShe]’s obviously stolen property.");
	output("\n\nYou could do your civic duty and call up the U.G.C. to hand [bess.himHer] in. After all, if [bess.heShe]’s been taken from someone, they’ll probably want [bess.himHer] back. Of course, [bess.hisHer] owner could have been the one who left [bess.himHer] on Tarkus to begin with. Seems unlikely they’d scratch off [bess.hisHer] code, though.");
	output("\n\nIn old Terran movies, this is probably the part where the " + pc.mf("hero","heroine") + " offers the android freedom to show how nice they are. ");
	if(pc.isNice()) output("You could do that, since that’s usually your style.");
	else if(pc.isMischievous()) output("You wouldn’t call yourself ‘nice’, but you’re not an outright asshole either.");
	else output("That doesn’t sound like you at all.");

	output("\n\nYou could also opt to keep [bess.himHer], but have [bess.himHer] stay in your hangar bay at Tavros Station. After all, a high-quality sex bot doesn’t just fall into your lap every day....");
	//if (GiannaFollowerYes)
	if(flags["GIANNAFOLLOWER"] == 9999) output(" Well, except for Gianna. Actually, this is becoming a bit of a habit.");

	//[Keep On Ship*] [Sell Off] [Hand To Authorities] [Dump Them] [Release] [Keep At Tavros]
	//* Only if there is room.
	processTime(48);
	decisionTimeForBessMenu();
}

public function decisionTimeForBessMenu():void
{
	clearMenu();
	addButton(0,"KeepOnShip",keepBessYouSloot);
	addButton(1,"Sell Off",sellOfBessDatWhore);
	addButton(2,"Authorities",handBessOverToAuthorities);
	addButton(3,"Dump Them",dumpTheBessBot);
	if(flags["TRIED_TO_GIVE_BESS_FREEDOM"] == undefined) addButton(4,"Release",releaseBessBenWhatever);
	else addDisabledButton(4,"Release","Release","Your new robotic friend doesn't seem to understand the idea of freedom.");
	addButton(5,"KeepAtTavros",waitAtTavrosBess);
}

//Sell Off
public function sellOfBessDatWhore():void
{
	clearOutput();
	output("You decide you’d rather sell [bess.himHer] on the black market for some quick credits than keep [bess.himHer]. After making a discreet listing on the extranet, you eventually find a willing buyer for your Bess-13 unit.");
	output("\n\nThe handoff takes place in a secluded section of a nearby planet, barren enough to land the ship and avoid any contact with any locals. When you get to the meeting place, another starship is already waiting for you. ");
	output("\n\nThe hull of the spacecraft has clearly seen better days; either the owner is blowing more money on your " + pc.fm("Bess","Ben") + " Unit than on their starship, or they actually like it looking like a flying garbage heap.");
	output("\n\nThe owner of the ship is just as pleasant to look at as his starship is. Coming out to meet you and wringing their hands all the while, he hardly makes eye contact. He’s far too busy ogling the merchandise.");
	output("\n\n<i>“Nice, nice. Hard to get one of these for anything less than mega-creds. What did you do, steal [bess.himHer] from a hospital? Don’t answer that, I don’t want to know.”</i> The buyer gives you a near-toothless grin.");
	output("\n\nCredits are exchanged, no names, and soon you’re 10,000 credits richer. It’s sub-light robbery - [bess.heShe]’s worth <i>at least</i> an extra zero - but there are no questions asked and you’re wealthier than before you found it.");
	output("\n\nAfter concluding your business, you head back to Tarkus, wiping the flight path and history from your spaceship computer.");
	//Appear back in Spaceship, story path ended. { Add 10,000 credits to PC’s credit score } 
	pc.credits += 10000;
	flags["SOLD_BESS"] = 1;
	flags["BESS_DISABLED"] = 1;
	processTime(2040);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Hand To Authorities
public function handBessOverToAuthorities():void
{
	clearOutput();
	output("Deciding that the sex-bot doesn’t belong to you and you should probably hand [bess.himHer] over to authorities, you ring and arrange for [bess.himHer] to be picked up. You’re surprised a U.G.C. official is actually going out of their way to Tarkus to pick up a sex bot.");
	output("\n\nWhen the official shows up in the Novahome docking bay, you find out why. Apparently there’s a standing order for all " + bess.fm("Bess-13","Ben-14") + " Unit AIs put out by JoyCo. It seems you’re entitled to a bounty for bringing the <i>“dangerous sex bot”</i> in.");
	output("\n\nLooking at [bess.hisHer] confused eyes as you hand [bess.himHer] over, it’s hard to imagine [bess.heShe]’s a danger. Still, it seems you dodged a bullet by turning [bess.himHer] in. Not only that, apparently owning a AI version of the units is considered a criminal offense.");
	output("\n\nThe U.G.C. official leaves with the " + bess.mf("Ben-14", "Bess-13") + " unit, and soon after you are wired 2,500 credits by JoyCo. Seems things wrapped up pretty nicely.");
	pc.credits += 2500;
	flags["BESS_GIVEN_TO_UGC"] = 1;
	flags["BESS_DISABLED"] = 1;
	processTime(2040);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Release 
public function releaseBessBenWhatever():void
{
	clearOutput();
	output("You tell the " + bess.mf("male", "female") + " synthetic that [bess.heShe] is free to do as she pleases, and that you are not [bess.hisHer] [pc.Master]. It seems like the right thing to do.");
	output("\n\nHowever, [bess.heShe] seems to have difficulty processing what you are saying, almost as if you were speaking a foreign language.");
	output("\n\n<i>“What do you mean, [pc.Master]? I am a " + bess.mf("Ben-14", "Bess-13") + " unit, and I belong to you! I am your personal unit. I am not designed to belong to myself.”</i> " + bess.mf("He furrows his brow, looking perplexed by your statement", "Her voice seems to quiver a little") + ". The concept of not belonging to someone seems to be outside of [bess.hisHer] programming.");
	output("\n\nWhat exactly are you going to do? [bess.HeShe]'ll probably get caught in a logic loop if you push the point.");
	//Once off +5 to Nice Score. Non-repeatable event.
	pc.addNice(5);
	flags["TRIED_TO_GIVE_BESS_FREEDOM"] = 1;
	processTime(1);
	//menu with release grayed out.
	decisionTimeForBessMenu();
}
 
//Dump Them
public function dumpTheBessBot():void
{
	clearOutput();
	output("Rather than keep the silver android, you decide that it’s best just to kick [bess.himHer] off your ship and let [bess.himHer] aimlessly wander Tarkus now that you’ve activated [bess.himHer]. Someone else can deal with [bess.himHer] - it’s just too much trouble.");
	output("\n\nDespite her pleas, you shove [bess.himHer] in the airlock and vent [bess.himHer] out, sending [bess.himHer] flying out into a pile of junk. In the end [bess.heShe]’s just an object only pretending to have feelings – no different to the broken holos and pieces of pipe littering the whole crappy planet.");
	output("\n\nThings are nice and quiet after that.");
	//Appear back in Spaceship, Story path ended. +5 to Asshat Score.
	processTime(10);
	pc.addAss(10);
	currentLocation = shipLocation;
	flags["BESS_DISABLED"] = 1;
	flags["BESS_DUMPED_INTO_SPAAAAAAACE"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tavros Station
public function waitAtTavrosBess():void
{
	clearOutput();
	output("You decide you don’t have a place for [bess.himHer] on the ship at the moment and you don’t want to get rid of [bess.himHer]. You do have a space dock at Tavros Station though.");
	output("\n\nIt is a bit out of your way, but you fly all the way back and drop [bess.himHer] there for the time being. That way, you can pick her up once you know what you want to do with [bess.himHer].");
	output("\n\nThe " + bess.mf("Ben-14", "Bess-13") + " unit has been dropped at Tavros Station! You can pick [bess.himHer] up later if you want to have [bess.himHer] join your crew.");
	//See Tavros Station section for more information.
	processTime(2040);
	currentLocation = shipLocation;
	flags["BESS_LOCATION"] = BESS_AT_TAVROS;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Keep [bess.HimHer] - Leads to Tutorial Section.
public function keepBessYouSloot():void
{
	clearOutput();
	flags["BESS_LOCATION"] = BESS_ON_CREW;

	//Tutorial / Configure 
	output("You decide that you’ll take [bess.himHer] along after all. You don’t really want to leave [bess.himHer] on Tavros, and you don’t want to get rid of [bess.himHer] either.");
	if (pc.isNice()) output(" <i>“Plus, it kind of seems mean to leave her alone in your hanger just because [bess.heShe]’s an android”</i>.");
	else if (pc.isMischievous()) output(" <i>“Plus it might be kind of fun to add [bess.himHer] to your crew.”</i>");
	else output(" <i>“Besides, you need every edge you can get if you’re going to find that hidden treasure stash.”</i>");
	//Nice:
	if(pc.isNice()) output("\n\n<i>“I guess I’ve got a new crewmate. Welcome aboard!”</i> You smile warmly, happy to have another crew member on your ship.");
	//Misc:
	else if(pc.isMischievous()) output("\n\n<i>“Sure, why not? I’ve got room for another crew member. Welcome aboard!”</i> You welcome [bess.himHer] on a whim, though you’re sure it will all work out for the best.");
	//Hard:
	else output("\n\n<i>“Do whatever you want, just don’t cause any trouble or you’re off the ship.”</i> You sternly warn [bess.himHer], making sure the message is received loud and clear.");
	output("\n\nThe silver haired synthetic" + bess.mf("’s eyes light up and he gives a dutiful bow", " flushes and bows") + ", <i>“You’re too kind, [pc.Master]. Just think of me as yours to do with what you will.”</i>");
	output("\n\n[Bess.HeShe] then pauses and looks at you with patient, " + bess.mf("questioning", "hopeful") + " eyes, as if waiting for you to say something else. " + bess.mf("He even coughs politely, as if trying to awkwardly bring your attention to something.", "It reminds you of a girl at a social function waiting to be asked to dance."));
	output("\n\nYou ask [bess.himHer] exactly what [bess.heShe]’s waiting for, and [bess.heShe] gives a rather animated blink. It’s hardly that of a pre-programmed VI.");
	output("\n\n<i>“My name, [pc.Master]. I don’t have an official designation yet.”</i> It seems [bess.heShe] needs a name of some sort, and you’re supposed to give [bess.himHer] one.");
	clearMenu();
	addButton(0,"Next",nameBessForRealsies);
}

public function nameBessForRealsies():void
{
	clearOutput();
	output("What do you decide to name her?");
	displayInput();
	this.userInterface.textInput.text = chars["BESS"].mf("Ben","Bess");
	//(Default Name: {if (bess.gender = female) <i>“Bess”</i>}{else: <i>“Ben”</i>}");
	clearMenu();
	addButton(0, "Next", nameBessProcessing);
}

public function nameBessProcessing():void
{
	if(this.userInterface.textInput.text == "") {
		output("<b>You must input a name.</b>");
		return;
	}
	chars["BESS"].short = this.userInterface.textInput.text;
	if(stage.contains(this.userInterface.textInput)) 
		this.removeInput();
	nameBessResult();
}

//Entered name becomes string value [bess.name]
public function nameBessResult():void
{
	clearOutput();
	bessHeader();

	output("<i>“Thank you for my name, [pc.Master]. I am now called [bess.name]!”</i> [bess.name] sounds delighted with [bess.hisHer] new name, though [bess.heShe]’s probably happy to have a name in general. <i>“I look forward to servicing your reproductive needs in the near future.”</i>");
	output("\n\nYou ask exactly what functions [bess.name] comes equipped with, noting that [bess.heShe] doesn’t look like [bess.heShe]’s made of a regular kind of alloy.");
	output("\n\n[bess.name] comes quite lively when you observe that, since [bess.heShe] clearly takes pride in [bess.hisHer] design specs.");
	output("\n\n<i>“You’re very observant, [pc.Master]! All " + bess.mf("Ben-14", "Bess-13") + " units are built using FlexMetal, a patented creation exclusive to JoyCo. This material is softer than organic flesh and ten times more flexible, allowing me to change my form in specific ways.”</i> ");
	output("\n\nYou ask what kind of specific way [bess.heShe] can shift [bess.hisHer] body about.");
	output("\n\n<i>“My insides are filled with a liquid called MeldMilk. By increasing or decreasing the amount in certain parts of my body, my form can be inflated or deflated to tailor my appearance to my [pc.Master]’s tastes,”</i> [bess.name] informs you.");
	output("\n\n<i>“I can retract, grow or recolor my hair, change eye color or grow appendages in order to fulfill your sexual needs. I also have several special modes that can be activated or deactivated, such as sexual roles or the flavor of my cum.”</i>");
	output("\n\n<i>“You can also purchase certain special modifications, clothes, and accessories for me through the JoyCo catalogue. These items will be delivered to you within one to three earth days, excluding public holidays and weekends.”</i>");
	output("\n\nAfter [bess.hisHer] lengthy explanation of [bess.hisHer] various features, [bess.name] takes a deep breath. It’s probably a programmed gesture, since [bess.heShe] doesn’t actually <i>need</i> to breathe.");
	output("\n\n<i>“I doubt I’m your perfect mate fresh out of the box, so feel free to change my settings at any time. I’ve got a lot of them, so please be patient with me.”</i> [bess.name] then bows in a very " + bess.mf("well-mannered way", "subservient manner") + ". <i>”</i>... I look forward to serving your needs, [pc.Master]!”</i>");
	//Appear back in ship with Bess added to the Followers menu. 
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Bess/Ben’s Room
public function followerBessRoom():void
{
	clearOutput();
	bessHeader();

	//if (Bess/Ben Event 11 completed)
	if(flags["BESS_EVENT_11"] != undefined)
	{
		output("The quarters of your ship’s "+ bessCrewRole() +" are a lot more expressive than they used to be. The room is full of polished wooden furniture and beautiful decor. [bess.HeShe]’s made it look more like a room in a house than a starship cabin.");
		
		output("\n\nOn a chest of drawers is vase filled with white asiatic lilies, pink roses, and purple statice. It looks and smells truly breathtaking. On the walls are paintings of planetary landscapes, an assortment of exotic and beautiful locales.");

		output("\n\nAlmost every wall in [bess.hisHer] room has rows of retractable bookshelves built in, in order to contain [bess.himHes] massive book collection. [bess.HeShe] also has a sizable collection of holos. In order to watch them, [bess.heShe] has had a holo-projector built into the wall so[bess.heShe] can watch them in bed.");
	}
	else
	{
		output("[bess.name]'s room is fairly depressing. If you didn't know any better, you'd think it was a small cargo hold. The best thing it has to offer are freely available power ports and a large built in wardrobe.");
	}

	if(flags["BESS_EVENT_4"] != undefined && flags["BESS_EVENT_11"] == undefined)
	{
		output("\n\nPiles of holos and books have recently begun to fill the room. Even though [bess.heShe] can’t afford shelves - since [bess.heShe] doesn’t have a real job - each stack is perfectly categorized by genre and in alphabetical order. [bess.HeShe]’s even moved a holo-projector into [bess.hisHer] room.");
	}
	
	if(flags["BESS_FRIEND"] == 1)
	{
		output("\n\nOn [bess.hisHer] bedside table are two of [bess.himsHer] favorite books, ‘The Hobbit' and ‘Do Androids Dream of Electric Sheep?’ [bess.HeShe] loves them so much they never make it back to the shelves.");
	}

	if(flags["BESS_EVENT_2"] != undefined && flags["BESS_EVENT_4"] == undefined)
	{
		output("\n\nRecently [bess.hisHer] room has begun to fill with holos, and [bess.heShe]’s even moved in a holo-projector. It seems [bess.heShe]’s taking [bess.hisHer] research quite seriously.");
	}

	if(flags["BESS_EVENT_11"] != undefined)
	{
		output("\n\nDominating the room is a king-sized four-poster bed with perfectly kept silky sheets. It is by far the most luxurious item in the room.");
	}
	else
	{
		output("\n\nThere is a double bed in the middle of the room, the sheets are in pristine condition. It doesn’t look like [bess.heShe] sleeps in it, it seems to be there for administering ‘sexual relief’.");
		output("\n\nThe room itself is very spacious, and that makes the lack of furniture and personal effects even more evident. [bess.HeShe] is an AI after all and has very little physical needs.");
	}

	clearMenu();
	addButton(0, "Approach", approachFollowerBess);
	addButton(4, "Leave", mainGameMenu);
	// Just a suggestion - maybe an option in the room to deactivate Bess/Ben's picture portrait? Might irk some people that the pic doesn't match the dialogue, but they might not want to deactivate *all* the pics. This way the option isn't always in your face, either.
}

//Greeting Dialogues
public function approachFollowerBess():void
{
	// Dialogues initiated by hitting the [bess.name] button under companions. Or if they has a button under the normal ship stuff. Wherever you place it - just probably not in their room for story/sex consistency reasons.
	clearOutput();
	bessHeader();

	if (flags["BESS_LOVER"] == 1)
	{
		if(bessAffection() >= 90)
		{
			output("[bess.name] grins as soon as [bess.heShe] sees you, " + bess.fm("leaping into your arms","scooping you into his arms") + " and giving you a long, sensual kiss. </i>\"... Mmmm, "+ bessPCName() +"! Have I told you how much I love you today? I'll tell you once more, just in case you forgot.\"<i> [bess.HisHer] [bess.eyes] are gleaming");
			if (bessGlasses()) output(" through [bess.hisHer] glasses");
			output(" with happiness.");
		}
		else if(bessAffection() >= 70)
		{
			output("[bess.name] wraps [bess.hisHer] arms around you, giving you a hello kiss, <i>“... Greetings, "+ bessPCName() +". Come to see me have you?”</i> [bess.HeShe] asks, peering at you");
			if(bessGlasses()) output(" through [bess.hisHer] glasses");
			output(".");
		}
		else if(bessAffection() >= 50)
		{
			output("[bess.name] wraps [bess.hisHer] arms around you, giving you a hello kiss, <i>“... Greetings, "+ bessPCName() +". Come to see me have you? It's about time!”</i> [bess.HeShe] exclaims");
			if(bessGlasses()) output(", peering at you over [bess.hisHer] glasses");
			output(".");
		}
		else if(bessAffection() >= 30)
		{
			output("[bess.name] wraps [bess.hisHer] arms around you, looking very serious, <i>“... "+ bessPCName() +"... have I done something wrong? It feels like you're drifting further away from me, you never visit anymore... have I done something wrong?”</i> [bess.HisHer] eyes " + bess.fm("are wavering","look pained"));
			if(bessGlasses()) output(" behind [bess.hisHer] glasses");
			output(".");
		}
		else
		{
			output("[bess.name] looks at you " + bess.fm("meekly","in distress") + ", [bess.hisHer] expression completely downtrodden. <i>“... Oh, you're here "+ bessPCName() +"... do... do you still love me? You're gone all the time, I never see you anymore...”</i> [bess.HisHer] eyes " + bess.fm("are tearing up","look truly agonized");
			if(bessGlasses()) output(" behind [bess.hisHer] glasses");
			output("."); 
		}
	}
	else if (flags["BESS_FRIEND"] == 1)
	{
		if (bessAffection() >= 50)
		{
			output("[bess.name] runs " + bess.fm("at you","up to you") + ",giving you a massive hug. <i>“... "+ bessPCName() +"! How goes my best friend in the galaxy? Great, I hope!”</i> [bess.heShe] exclaims " + bess.fm("excitedly","brightly"));
			if(bessGlasses()) output(", eyes shining behind [bess.hisHer] glasses");
			output(".");
		}
		else if(bessAffection() >= 25)
		{
			output("[bess.name] runs " + bess.fm("at you","up to you") + ", giving you a massive hug. <i>“... "+ bessPCName() +"! How goes my best friend in the galaxy? You've been gone </i>so long<i>, tell me what you've been doing!”</i> [bess.heShe] exclaims cheerily");
			if(bessGlasses()) output(", eyes shining behind [bess.hisHer] glasses");
			output(".");
		}
		else
		{
			output("[bess.name] walks up to you, looking a little downtrodden. <i>“... Hey "+ bessPCName() +", we're still friends right? I never see you anymore... did I do something wrong?”</i> [bess.HisHer] eyes are " + bess.fm("visibly wavering","look a bit strained"));
			if(bessGlasses()) output(" behind [bess.hisHer] glasses");
			output(".");
		}
	}
	else
	{
		output("[bess.name] wanders up, greeting you with a smile. <i>“How are you doing today, "+ bessPCName() +"? Did you want me to tend to your reproductive needs, or did you just want to talk?”</i>[bess.heShe] asks, peering at you");
		if(bessGlasses()) output(" through [bess.hisHer] glasses");
		else output("questioningly");
		output(".");
	}

	if(bess.hasHair()) output("\n\nThe synthetic's " + num2Text(Math.round(bess.hairLength*10)/10) + " inch [bess.hairColor] hair is done in "+ bessHairStyle() +".");
	else output("\n\nThe synthetic has a smooth, silvery scalp, completely free of hair.");
	if(bess.earType != GLOBAL.TYPE_HUMAN || bess.horns > 0)
	{
		output(" [bess.HisHer] ");
		if(bess.earType != GLOBAL.TYPE_HUMAN) 
		{
			output("[bess.ears]");
			if(bess.horns > 0) output(" and ");
		}
		if(bess.horns > 0) output("[bess.horns]");
		output(" compliment her features.");
	}
	output(" [bess.HeShe] is currently wearing a [bess.armor] that accentuates [bess.hisHer] [bess.chest] and [bess.tone] body.");
	if (bess.wingType != GLOBAL.TYPE_HUMAN || bess.tailCount > 0)
	{
		output(" [bess.HisHer] ");
		if (bess.wingType != GLOBAL.TYPE_HUMAN) 
		{
			output("[bess.wings] stick");
			
			output(" proudly out [bess.hisHer] back");
			if (bess.tailCount > 0) output(" and [bess.hisHer] ");
		}
		if (bess.tailCount > 0)
		{
			"[bess.tails] flick");
			if(bess.tailCount == 1) output("s");
			output(" noticeably behind [bess.himHer]");
		}
		output(".");
	}
	if(bess.meleeWeapon is bessKatana) output(" At [bess.hisHer] right side is a katana, secure in its glazed sheath.");
	//if (bess.armor = Top&Skirt, Sleepshirt, Maid, Nurse, Schoolgirl, GothLolita, TankMini) 
	if(bess.armor != null && (bess.armor is TopNSkirt || bess.armor is SleepShirt || bess.armor is Maid || bess.armor is Nurse || bess.armor is Schoolgirl || bess.armor is GothLolita || bess.armor is TankMini))
	{
		output("\n\nEvery time the hem of [bess.hisHer] outfit rides up, you get a good look at [bess.hisHer] ");
		if(bess.lowerUndergarment.shortName != "") output("[bess.underGarment].");
		else if(bess.hasVagina()) 
		{
			output("[bess.pussy]");
			if(bess.hasCock()) output(" and [bess.cock]");
			output(".");
		}
		else if(bess.hasCock()) output("[bess.cock].");
		else output("bare crotch.");
		if(bess.hasCock())
		{
			output(" It ");
			if(bess.biggestCockLength() <= 10) 
			{
				if(bess.lowerUndergarment.shortName != "") output("makes a visible bulge in [bess.hisHer] [bess.underGarment].");
				else output("hangs out proudly between [bess.hisHer] [bess.legs].");
			}
			else
			{
				if(bess.lowerUndergarment.shortName != "") output("cannot be contained by [bess.hisHer] [bess.underGarment] and dangles out defiantly.");
				else output("dangles down proudly between [bess.hisHer] [bess.thighs].");
			}
		}
		if (bess.bellyRating() >= 10)
		{
			output(" [bess.HisHer] [bess.bellyFullDesc] pushes pointedly against the insides of [bess.hisHer] [bess.armor] and is visibly straining the material.");
		}
	}
	else if(bess.bellyRating() >= 10)
	{
		output("\n\n[bess.HisHer] [bess.bellyFullDesc] ");
		if(bess.armor.shortName == "") output("is clearly visible ");
		if(bess.isCrotchGarbed() || bess.isChestGarbed()) output("through [bess.hisHer] undergarments.");
	}

	bessFollowerMenu();
}

public function bessFollowerMenu():void
{
	clearMenu();
	
	addButton(0, "Discuss", talkToBessAboutThings);
	addButton(1, "Functions", bessFunctions, undefined, "Functions", "Bess’ Functions");
	addButton(2, "Accessories", talkToBessAboutAccessories);
	addButton(3, "Sex", );

	addButton(10, "Appearance", bessAppearance, undefined, "Appearance", "Bess’ Appearance");

	addButton(14, "Back", mainGameMenu);
}

//Appearance
public function bessAppearance():void
{
	clearOutput();
	bessHeader();

	output("As you look at [bess.name], [bess.heShe] tries to look away, pretending not to notice that you're staring at [bess.himHer]. " + bess.fm("Her cheeks flush","He politely coughs") + " as you look [bess.himHer] over from head to toe.");
	//Bald True:
	if(!bess.hasHair())
	{
		output("\n\n[bess.name]’s head is hairless. All the lines on [bess.hisHer] scalp, usually hidden by artificial locks, are now clearly exposed.");
	}
	else output("\n\nThe synthetic's [bess.hairColor] " + num2Text(Math.round(bess.hairLength*10)/10) + " inch hair is in a "+ bessHairStyle() +".");
	output(". [bess.HisHer] [bess.eyeColor] eyes, framed by " + bess.fm("thick black lashes","brooding brows"));
	if (bessGlasses()) output(" as well as the glasses [bess.heShe] is currently wearing");
	output(", are even more detailed and faceted than those of a human.");
	if (bess.horns != 0) " On top of [bess.hisHer] head are [bess.horns].");
	if (bess.earType != GLOBAL.TYPE_HUMAN) output(" [bess.HeShe] has a pair of [bess.ears].");
	if (bess.wingType != GLOBAL.TYPE_HUMAN) output(" Behind [bess.hisHer] back is a pair of [bess.wings]");
	if (bess.tailCount > 0) 
	{
		output(" Above [bess.hisHer] rump, [bess.hisHer] [bess.tails] ");
		if(bess.tailCount == 1) output("is");
		else output("are");
		output(" sticking out.");
	}
	if (bess.hasCockTail())
	{
		output("\n\n[bess.name]’s \"JoyCord\" is ");
		if(bess.tailCount > 0) output(" protruding from just above [bess.hisHer] rear, long and silvery just like [bess.hisHer] body. The tip looks exactly like a thick, synthetic tail-cock. The shaft looks quite bumpy and clearly designed for pleasure.");
	}
	output("\n\n[bess.HisHer] silver skinned body is segmented by lines, clearly identifying [bess.himHer] as a mechanical being despite its otherwise organic appearance. [bess.HeShe] has ");
	if(bess.biggestTitSize() < 1) output("a flat chest");
	else output(bess.breastSize(bess.biggestTitSize()) + " breasts capped with [bess.nipples]. Further down, your eyes are drawn to [bess.hisHer] [bess.hipsAdjective] [bess.hipsNoun] and [bess.assAdjective] [bess.assNoun].");

	if (bess.hasPussy())
	{
		output("\n\n[bess.name]'s mound is completely hairless and utterly smooth. [bess.HisHer] pussy lips are rather plump and cushony, designed to squeeze and pad a cock perfectly - not to mention extremely tasty.");
		if (bess.hasCock()) output(" Above [bess.hisHer] synthetic snatch, ");
	}
	else if(bess.hasCock()) output("\n\n");
	if (bess.hasCock()) 
	{
		output("[bess.name] has a [bess.cock] with a [bess.cockHead]");
		if(bess.hasASheath()) output(" and [bess.sheath]");
		output(".");
		if(bess.balls > 0) output("[bess.HerHis] [bess.balls] are contained in a [bess.sack].");
	}
	//if (bessCumDump = true)
	if(flags["BESS_CUMDUMP"] != undefined)
	{
		output("\n\nHot, sticky cum is leaking down [bess.hisHer] thighs from [bess.hisHer] well-used ");
		if(bess.hasVagina()) output("pussy and ");
		output("ass. [Bess.HisHer] lips are smeared with fresh spunk collected from the nearby natives. [Bess.HisHer] eyes are unfocused, probably from being used day in and out as a synthetic cum dumpster.");
	}
	output("\n\n[bess.name] currently has a [bess.belly].");
	if(!bess.isNude()) output(" [bess.HeShe] is currently wearing [pc.gear].");
	//if (bessKatana = true)
	if(bess.meleeWeapon is bessKatana) output("\n\nAt [bess.name]’s right side is a well-polished katana, secured safely in a glazed sheath. The sheath is decorated with eastern-style dragons running up its length, talons stretched out as if to strike. The blade is just as silvery and untarnished as [bess.name] herself.");
	clearMenu();
	addButton(0,"Next",approachFollowerBess);
}

//Functions
public function bessFunctions():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_LOVER_STATUS"] != undefined && (flags["BESS_LOVER_STATUS"].indexOf("dom") != -1))
	{
		output("You meekly suggest that [bess.name] <i>perhaps</i> could improve [bess.hisHer] appearance with a few tweaks. Your remark is met with a quirked eyebrow. It’s sometimes hard to tell when [bess.name] is in " + flags["BESS_LOVER_STATUS"] + " mode or not.");
		output("\n\nThankfully, you seem to be in luck. [Bess.HisHer] gaze is softer than usual, which means you aren’t going to get disciplined for your impertinence. ");
		output("\n\n<i>“Oh really? What exactly do you think I should change about myself, "+ bessPCName() +"? I’m all ears...”</i>");
	}
	else if (flags["BESS_LOVER_STATUS"] != undefined && (flags["BESS_LOVER_STATUS"] == "sub" || flags["BESS_LOVER_STATUS"] == "pet"))
	{
		output("[bess.name]’s appearance is not to your taste, so you order [bess.himHer] to change it. It’s really that simple.");
		output("\n\nYour devoted " + flags["BESS_LOVER_STATUS"] + " gets down on all fours and bows deeply to you, [bess.hisHer] eyes glittering with unwavering devotion. <i>“Of course, anything you wish! What would you like me to change about myself..?”</i>");
	}
	else if (flags["BESS_LOVER"] == 1 || flags["BESS_FRIEND"] == 1)
	{
		output("You casually bring up the topic of [bess.name] changing some things about [bess.himHer]self.");
		output("\n\n[bess.name] responds with a quirked eyebrow. <i>“You want me to change myself? What, are you not happy with your");
		if (flags["BESS_LOVER"] == 1)
		{
			output(" " + flags["BESS_LOVER_STATUS"]);
		}
		else
		{
			output(" dear friend");
		}
		output(" the way [bess.heShe] is?”</i> You watch [bess.himHer] try to keep a straight face, but [bess.heShe] can’t hold it.");
		output("\n\n<i>“Of course, anything for you, "+ bessPCName() +". What would you like me to switch up?”</i>");
	}
	else 
	{
		output("You suggest changing some things about [bess.name], and [bess.heShe] seems happy to comply. In fact, [bess.heShe] seems to relish the chance to display [bess.hisHer] different functions.");
		output("\n\n<i>“Of course, "+ bessPCName() +"! What would you like me to change?”</i> [bess.name]’s [bess.eyeColor] eyes are " + bess.mf("shining brightly","positively glittering") + ", waiting to hear what you want to switch up.");
	}

	bessFunctionsMenu();
}

public function bessFunctionsMenu():void
{
	clearMenu();
	addButton(0, "Titles", talkToBessAboutTitles, undefined, "Titles", "Change [bess.name]'s name or what you call each other in sexual and non-sexual encounters.");

	if (flags["BESS_LOVER_STATUS"].indexOf("dom") != -1 || flags["BESS_LOVER_STATUS"] == "pet" || flags["BESS_LOVER_STATUS"] == "sub") addDisabledButton(1, "Role", "Bess’ Role", "Since making things ‘official’ with Bess, you’re unable to change her role!");
	else addButton(1, "Role", talkToBessAboutRoles, undefined, "Roles", "Change [bess.name]'s various roles, such as if [bess.heShe]'s dominant or not during sex.");
	

	addButton(2, "Hair", talkToBessAboutHair, undefined, "Hair", "Ask [bess.name] to change [bess.hisHer] hair such as color, length, and styling.");
	addButton(3, "Eyes", talkToBessAboutEyes);
	addButton(4, "Chest", talkToBessAboutBoobs, undefined, "Chest", "Ask [bess.name] to change [bess.hisHer] chest, such as breast size and nipple type.");
	addButton(5, "BodyShape", talkToBessAboutBodyShape, undefined, "Body Shape", "Ask [bess.name] to change [bess.hisHer] body shape, such as muscle tone, hip, and ass size.");
	addButton(6, "Genitals", talkToBessAboutGenitals, undefined, "Genitals", "Ask [bess.name] to change [bess.hisHer] genitals, such as if [bess.heShe] has a pussy or a cock.");
	addButton(7, "Cum", talkToBessAboutCum);
	addButton(8, "Clothing", talkToBessAboutClothes);
	addButton(10, "JoyCord", talkToBessAboutJoyCord);
	addButton(11, "TentaPussy", talkToBessAboutTentacunt);

	addButton(14, "Back", bessFollowerMenu);
}

//Titles
public function talkToBessAboutTitles():void
{
	clearOutput();
	bessHeader();

	output("<i>“Which one?”</i>");

	clearMenu();
	addButton(0, bess.short + "’s Name", bessTitlesTheirName, undefined, bess.short + "’s Name", "Change [bess.name]'s name. At least, if [bess.heShe] agrees to it...");
	addButton(1, "YourTitle", bessTitlesYourTitles, undefined, "Your Title", "The title that [bess.name] will call you in non-sexual encounters.");
	addButton(2, bess.mf("His", "Her") + "Title", bessTitlesTheirTitle, undefined, bess.mf("His", "Her") + " Title", "The title that you will call [bess.name] in non-sexual encounters.");
	addButton(3, "YourSexName", bessTitlesYourSexName, undefined, "Your Sex Name", "The name that [bess.name] will call you in sexual encounters.");
	addButton(4, bess.mf("His", "Her") + "SexName", bessTitlesTheirSexName, undefined, bess.mf("His", "Her") + " Sex Name", "The title that you will call [bess.name] in sexual encounters.");

	addButton(14, "Back", bessFunctionsMenu);
}

public function bessTitlesTheirName():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] peers at you as you suggest changing [bess.himsHer] name. [bess.heShe]’s clearly not comfortable with the idea.");

	if (flags["BESS_LOVER"] == 1 && (flags["BESS_LOVER_STATUS"].indexOf("dom") != -1))
	{
		output("\n\n<i>“... You want your "+ flags["BESS_LOVER_STATUS"] +" to change [bess.hisHer] name, because you're unhappy with it?”</i> [bess.name] asks you in a dry tone, as if [bess.heShe] misheard you.");

		output("\n\nYou cough and nod, feeling yourself shrink under [bess.hisHer] penetrating gaze.");
		
		output("\n\n<i>“How about you think about all the things that are incredibly silly with that and come back to me once you figure it out, dear. I’m sure it will dawn on you eventually.”</i>");
	}
	else if (flags["BESS_LOVER"] == 1 || flags["BESS_FRIEND"] == 1)
	{
		output("\n\n<i>“... Look. I know I’m synthetic and");
		if (flags["BESS_LOVER"] == 1) output(" your "+ flags["BESS_LOVER_STATUS"]);
		else output(" your friend");
		output(", but changing my name... how about you change your name first, and </i>then<i> I’ll change mine?”</i>");

		output("\n\nIt seems [bess.name] now has the same aversion to changing [bess.hisHer] name on request that a regular person would. It seems a ‘side effect’ of you teaching [bess.himHer] independent thought.");
	}
	else
	{
		output("\n\n<i>“You want to change my designated name? What will my new name be, "+ bessPCName() +"?”</i> [bess.name] definitely doesn’t seem adverse to the idea.");

		displayInput();
		userInterface.textInput.text = chars["BESS"].short;

		clearMenu();
		addButton(0, "Next", bessTitlesTryChangeName);
	}
}

public function bessTitlesTryChangeName():void
{
	if(this.userInterface.textInput.text == "")
	{
		output("<b>You must input a name.</b>");
		return;
	}
	chars["BESS"].short = this.userInterface.textInput.text;
	if(stage.contains(this.userInterface.textInput)) 
		this.removeInput();

	bessTitlesAcceptRename();
}

public function bessTitlesAcceptRename():void
{
	clearOutput();
	bessHeader();

	output("<i>“Very well, from now on I shall be known as [bess.name]!”</i>");

	clearMenu();
	addButton(0, "Next", bessFunctions);
}

public function bessTitlesYourTitles():void
{
	clearOutput();
	bessHeader();

	output("<i>“So, you’d like to change what I call you? What to...?”</i>");

	bessTitleList(true, false);
}

public function bessTitlesYourSexName():void
{
	clearOutput();
	bessHeader();

	output("<i>“So, you’d like to change what I call you during sex? What to...?”</i>");

	bessTitleList(true, true);
}

public function bessTitlesTheirTitle():void
{
	clearOutput();
	bessHeader();

	output("<i>“So, you’d like to change what you call me? What to...?”</i>");

	bessTitleList(false, false);
}

public function bessTitlesTheirSexName():void
{
	clearOutput();
	bessHeader();

	output("<i>“So, you’d like to change what you call me during sex? What to...?”</i>");

	bessTitleList(false, true);
}

public function bessTitleList(tarPC:Boolean, sex:Boolean):void
{
	var options:Array = [];

	// A lot of these don't work very well. Implementing will pare down later.

	options.push("honey", "sexy", "babe");

	if (tarPC)
	{
		options.push(pc.short);
		options.push(pc.mf("Master", "Mistress"));
		options.push(pc.mf("Master", "Mistress") + " Steele");
		options.push(pc.mf("Lord", "Lady") + " Steele");
		options.push(pc.mf("Prince", "Princess"));
		if (bessIsSub())
		{
			options.push(pc.mf("My King", "My Queen"));
			options.push(pc.mf("Sir", "Ma’am"));
			options.push(pc.mf("Daddy", "Mommy"));
			options.push("my alpha");
		}
		else if (bessIsDom())
		{
			options.push("bitch", "slut", "cumslut", "buttslut", "slave", "little one", "my nymph", "my pet", "kitten", "puppy");
			options.push("synthslut");
			options.push(pc.mf("boy", "girl"));
		}

		if (flags["BESS_EVENT_11"] != undefined)
		{
			options.push("Captain", "Boss", "Skipper", "Captain, my Captain", "Chief", "Big Boss");
		}

		if (flags["BESS_LOVER"] == 1)
		{
			options.push(pc.mf("my husbando", "my waifu"));
		}
	}
	else
	{
		options.push(bess.short);
		options.push(bess.mf("Master", "Mistress"));
		options.push(bess.mf("Master", "Mistress") + " " + bess.short);
		options.push(bess.mf("Lord", "Lady") + " " + bess.short);
		options.push(bess.mf("Prince", "Princess"));
		if (bessIsDom())
		{
			options.push(bess.mf("My King", "My Queen"));
			options.push(bess.mf("Sir", "Ma’am"));
			options.push(bess.mf("Daddy", "Mommy"));
		}
		else if (bessIsSub())
		{
			options.push("bitch", "slut", "cumslut", "buttslut", "slave", "little one", "my nymph", "my pet", "kitten", "puppy");
			options.push(bess.mf("boy", "girl"));
		}

		if (flags["BESS_EVENT_11"] != undefined)
		{
			options.push(flags["BESS_CREW_ROLE"]);
		}

		if (flags["BESS_LOVER"] == 1)
		{
			options.push(bess.mf("my husbando", "my waifu"));
		}
	}

	if (flags["BESS_FRIEND"] == 1)
	{
		options.push("my friend", "buddy");
	}

	if (flags["BESS_LOVER"] == 1)
	{
		options.push("my love", "darling", "sweet heart", "my beloved", "my dear");
	}

	// Create buttons (WELP etc)

	var ttBody:String;
	if (tarPC)
	{
		if (sex) ttBody = "Set how Bess refers to you during sex.";
		else ttBody = "Set how Bess refers to you in general."
	}
	else
	{
		if (sex) ttBody = "Set how you refer to Bess during sex.";
		else ttBody = "Set how you refer to Bess in general."
	}


	var optSlot:int = -1;
	for (var i:int = 0; optSlot < options.length; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", bessFunctionsMenu);
			continue;
		}
		else
		{
			optSlot++;
		}

		addButton(i, StringUtil.toTitleCase(options[optSlot]), bessSetTitleOption, [tarPC, sex, options[optSlot]], StringUtil.toTitleCase(options[optSlot]), ttBody)
	}
}

public function bessSetTitleOption(opts:Array):void
{
	clearOutput();
	bessHeader();

	var tarPC:Boolean = opts[0];
	var sex:Boolean = opts[1];
	var newTitle:String = opts[2];

	if (!tarPC)
	{
		output("<b>You will now call [bess.name]");
	}
	else
	{
		output("<b>[bess.name] will now call you");
	}

	output(" " + newTitle);

	if (sex)
	{
		output(" during sex!</b>");
	}
	else
	{
		output(" outside of sex!<b>");
	}

	// Do the setting
	if ( tarPC && !sex) flags["BESS_PC_SEX_NAME"] = newTitle;
	if ( tarPC &&  sex) flags["BESS_PC_NAME"] = newTitle;
	if (!tarPC && !sex) flags["BESS_NAME"] = newTitle;
	if (!tarPC &&  sex) flags["BESS_SEX_NAME"] = newTitle;

	clearMenu();
	addButton(0, "Next", bessFunctionsMenu);
}

public function talkToBessAboutRoles():void
{
	clearOutput();
	bessHeader();
	
	output("\n\n<i>“What attitude would you like me to assume during sex, "+ bessPCName() +"?”</i>");

	//[Equal] [Dominant] [Submissive]
	clearMenu();
	addButton(0, "Equals", setBessRole, 0);
	addButton(1, "Dominant", setBessRole, 1);
	addButton(2, "Submissive", setBessRole, 2);

	var sRole:int = 0;
	if (flags["BESS_SEX_ROLE"] != undefined) sRole = flags["BESS_SEX_ROLE"];

	output("\n\n(Bess is currently assuming");
	if (sRole == 0) output(" a role of equal partners.)");
	else if (sRole == 1) output(" the role of a dominant partner.)")
	else if (sRole == 2) output(" the role of a submissive partner.)");
}

public function setBessRole(newRole:int):void
{
	clearOutput();
	bessHeader();

	flags["BESS_SEX_ROLE"] = newRole;

	var sRole:int = 0;
	if (flags["BESS_SEX_ROLE"] != undefined) sRole = flags["BESS_SEX_ROLE"];

	output("Bess is now assuming");
	if (sRole == 0) output(" a role of equal partners.");
	else if (sRole == 1) output(" the role of a dominant partner.")
	else if (sRole == 2) output(" the role of a submissive partner.");

	bessFunctionsMenu();
}

public function talkToBessAboutHair():void
{
	clearOutput();
	bessHeader();

	output("<i>“You’d like to change something about my hair, "+ bessPCName() +"? What in particular..?”</i>");

	clearMenu();
	if (bess.hairLength > 0) addButton(0, "Color", talkToBessAboutHairColor);
	else addDisabledButton(0, "Color", "Hair Color", "Bess has to have hair to be able to select its color!");

	addButton(1, "Length", talkToBessAboutHairLength);

	if (bess.hairLength > 0) addButton(2, "Style", talkToBessAboutHairStyle);
	else addDisabledButton(2, "Style", "Hair Style", "Bess has to have hair to be able to select its style!");

	addButton(14, "Back", bessFunctionsMenu);
}

public function talkToBessAboutHairColor():void
{
	clearOutput();
	bessHeader();

	output("<i>“What color were you thinking..?”</i>");

	var options:Array = ["silver", "black", "brown", "red", "blonde", "white", "green", "blue", "orange", "pink", "purple", "violet", "magenta", "cyan", "red and black", "clear"];

	clearMenu();

	var optSlot:int = -1;
	for (var i:int = 0; optSlot < options.length; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", bessFunctionsMenu);
			continue;
		}
		else
		{
			optSlot++;
		}

		if (options[optSlot] == bess.hairColor)
		{
			addDisabledButton(i, StringUtil.toTitleCase(options[optSlot]));
		}
		else
		{
			addButton(i, StringUtil.toTitleCase(options[optSlot]), bessSetHairColor, options[optSlot]);
		}
	}
}

public function bessSetHairColor(newColor:String):void
{
	clearOutput();
	bessHeader();

	output("[bess.name] reaches up and touches [bess.hisHer] hair. The second one of [bess.hisHer] silvery digits makes contact, the hue of [bess.hisHer] strands transform!");
	bess.hairColor = newColor;
	
	output("\n\nA [bess.hairColor] explosion spreads out through her locks until it has reached the tip of every tuft. Afterwards, [bess.name] brushes [bess.hisHer] newly ");
	if (newColor == "clear") output("un");
	output("colored hair with an amused smile.");
	
	output("\n\n<i>“Hmm, [bess.hairColor], huh? It’s nice to change your hair up every now and then.”</i> [bess.heShe] " + bess.mf("amusedly", "happily") +" remarks.");
	
	output("\n\n<b>[bess.name]’s hair has changed color!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutHairLength():void
{
	clearOutput();
	bessHeader();

	output("<i>“What length were you thinking?”</i>");

	clearMenu();
	var options:Array = [0, 2, 8, 18, 40, 60];
	var lbls:Array = ["None", "Short", "Moderate", "Shoulders", "AssLength", "FloorLength"];

	for (var i:int = 0; i < options.length; i++)
	{
		addButton(i, lbls[i], bessSetHairLength, options[i]);
	}

	addButton(14, "Back", bessFunctionsMenu);
}

public function bessSetHairLength(newLength:int):void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_EVENT_4"] != undefined)
	{
		output("<i>“You want my hair to be "+ (bess.hairLength < newLength ? "longer" : "shorter") +", huh? I can do that. Just let me say the magic words...”</i> [bess.name] rubs [bess.hisHer] hands together, then spreads out [bess.hisHer] silvery fingers. <i>“... ");
		if (newLength == 0) output("Expellihairus!");
		else if (newLength == 2) output("Shortius!");
		else if (newLength == 8) output("Defaltus!");
		else if (newLength == 18) output("Askus Soryus!");
		else if (newLength == 40) output("Moemoe Magika!");
		else output("Rappunsal!");
		output("”</i>");
	}
	else
	{
		output("<i>“You want my hair to be "+ (bess.hairLength < newLength ? "longer" : "shorter") +", "+ bessPCName() +"? Sure thing!”</i> [bess.HeShe] seems more than happy to change its length for you.");
	}

	output("\n\n[bess.name] then reaches up and runs [bess.hisHer] hair");
	if (bess.hairLength == 0) output(" over [bess.hisHer] bare scalp");
	else output(" over [bess.hisHer] hair");
	output(". It follows [bess.hisHer] hands as [bess.heShe] runs it along, giving the visual impression that [bess.heShe]'s actually moving it with her hands.");

	bess.hairLength = newLength;

	output("\n\n[Bess.HeShe] doesn't stop until [bess.heShe]");
	if (newLength == 0) output(" is completely bald, [bess.hisHer] scalp now a glittering silver, just like the rest of [bess.hisHer] body. For some reason when [bess.heShe]'s got no hair it makes [bess.himHer] seem that much more mechanical.");
	else output(" has "+ bessHairLength() +". [Bess.HeShe] strokes it in a very human gesture, as if mentally adjusting to the new [bess.hairColor] span.");

	output("\n\n<i>“I hope you like it this way, "+ bessPCName() +". Are");
	if (newLength == 0) output(" bald");
	else if (newLength == 2) output(" short haired");
	else if (newLength == 8) output(" medium haired");
	else if (newLength == 18) output(" long haired");
	else output(" really long haired "+ bess.mf("guys", "girls") + " your ‘jam’?”</i> [bess.name] inquires, a twinkle in [bess.hisHer] [bess.eyeColor] eyes.");
	if (bess.hairLength > 0) output(" [Bess.HeShe] then adjusts it to be in [bess.hairStyle].");

	output("\n\n<b>[bess.name]");
	if (bess.hairLength > 0) output(" now has "+ bessHairLength() + " hair");
	else output(" is now bald");
	output("!</b>");

	clearMenu();
	addButton(0, "Next", bessFunctionsMenu);
}

public function talkToBessAboutHairStyle():void
{
	clearOutput();
	bessHeader();

	output("<i>“What style were you thinking?”</i>");

	// 9999 -- this would probably be a good idea
	// If you really need to, you could attach an automatic hair reduction to a hair style change (I.e. if Ankle Length Hair and pick bob, reduce hair length to shoulder length). Your call.

	var options:Array = ["simple part", "spikes", "messy chignon", "tight chignon", "ponytail", "bob", "single braid", "mess of curls", "crown braid", "set of twintails", "side plait", "pigtail buns", "hime cut", "ruffled layers", "front wave", "side part", "backwards slick"];

	var optSlot:int = -1;
	for (var i:int = 0; optSlot < options.length; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", bessFunctionsMenu);
			continue;
		}
		else
		{
			optSlot++;
		}

		addButton(i, StringUtil.toTitleCase(options[optSlot]), bessSetHairStyle, options[optSlot]);
	}
}

public function bessSetHairStyle(newStyle:String):void
{
	clearOutput();
	bessHeader();

	output("<i>“Going to have to give a "+ bess.mf("guy", "girl") +" a little time for this one...”</i> [bess.name] grins, shortly before slipping off to do [bess.hisHer] hair <i>just right</i>. Guess [bess.heShe]’s got to do it the old fashioned way.");

	if (newStyle == "spikes" || newStyle == "pigtail buns" || newStyle == "ruffled layers")
	{
		// noop
	} 
	else
	{
		newStyle = "a " + newStyle;
	}

	flags["BESS_HAIRSTYLE"] = newStyle;

	output("\n\nWhen [bess.heShe] comes back, [bess.hisHer] [bess.hairColor] "+ bessHairLength() +" hair is done in "+ bessHairStyle() +". [Bess.HeShe] seems quite happy with the change of pace.");

	output("\n\n<i>“Interesting look, don’t you think?”</i> [bess.name] touches [bess.hisHer] hair. [Bess.HeShe] sure spent [bess.hisHer] time on it!");

	output("\n\n<b>[bess.name]’s hair is now styled in "+ bessHairStyle() +"!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutEyes():void
{
	clearOutput();
	bessHeader();

	output("<i>“The color of my eyes? Easily done. Did you have any in mind..?”</i>");

	//Menu Options alter "bess.eyeColor" string value. Color name is not capitalized.

	var options:Array = ["silver", "black", "brown", "green", "hazel", "blue", "red", "orange", "aquamarine", "purple", "pink", "golden", "clear"];

	clearMenu();

	var optSlot:int = -1;
	for (var i:int = 0; optSlot < options.length; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", bessFunctionsMenu);
			continue;
		}
		else
		{
			optSlot++;
		}

		if (options[optSlot] == bess.eyeColor)
		{
			addDisabledButton(i, StringUtil.toTitleCase(options[optSlot]));
		}
		else
		{
			addButton(i, StringUtil.toTitleCase(options[optSlot]), bessSetEyeColor, options[optSlot]);
		}
	}

	if (options.length < 15)
	{
		addButton(14, "Back", bessFunctionsMenu);
	}
}

public function bessSetEyeColor(newColor:String):void
{
	clearOutput();
	bessHeader();

	bess.eyeColor = newColor;

	output("[bess.name] brings a silvery hand up beneath [bess.hisHer] eyes. With a simple wave upwards, [bess.hisHer] eyes change [bess.eyeColor] like a party trick.");

	output("\n\n<i>“Voila!</i>[bess.heShe] exclaims, <i>“Easily done. Anything else you wanted?”</i>");

	output("\n\n<b>[bess.name]’s eyes are now [bess.eyeColor]!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutBoobs():void
{
	clearOutput();
	bessHeader();

	output("<i>“You want to change my chest? Anything in particular?”</i> [bess.name] touches");
	if (bess.biggestTitSize() <= 0) output(" it");
	else output("[bess.hisHer] "+ bess.breastCup() +" mounds");
	output(", the obvious discussion point.");

	if (flags["BESS_FUCKED"] != undefined || flags["BESS_BOOBCHANGED"] != undefined)
	{
		if (bess.isFeminine()) output("\n\nHer face is a little flushed.");
		else output("\n\nHe coughs a little, trying not to look obviously pleased.");
		output(" You know that [bess.heShe] loves toying with [bess.hisHer] [bess.chestNoun], given how sensitive [bess.hisHer] nipples are.");
	}

	//{Altering breast size/lactation once opens the "Nipples" topic in discussion menu}.
	clearMenu();
	addButton(0, "BreastSize", talkToBessAboutBoobSize);
	addButton(1, "Lactation", talkToBessAboutLactation);
	if (flags["BESS_BOOBCHANGED"] == undefined) addDisabledButton(2, "Nipples");
	else addButton(2, "Nipples", talkToBessAboutNipples);
}

public function talkToBessAboutBoobSize():void
{
	clearOutput();
	bessHeader();

	output("<i>“Not a fan of");
	if (bess.biggestTitSize() <= 15) output(" [bess.cupSize]? Easily changed. Just give me a size and I’ll gather the right amount of MeldMilk! Or is it a reduction you want..?");
	else if (bess.biggestTitSize() <= 0) output(" flat chests? I can gather some MeldMilk and give myself a nice pair tits. What size?");
	else output(" the gargantuan tits you asked for? I’m guessing you want a reduction, because these can’t possibly get any bigger!");
	output("”</i>");

	var options:Array = [0, 1, 2, 3, 4, 7, 11, 15, 19, 24];
	var lbls:Array = ["Flat", "A-Cup", "B-Cup", "C-Cup", "D-Cup", "E-Cup", "F-Cup", "G-Cup", "H-Cup", "I-Cup"];

	var optSlot:int = -1;
	for (var i:int = 0; optSlot < options.length; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", bessFunctionsMenu);
			continue;
		}
		else
		{
			optSlot++;
		}

		if (options[optSlot] == bess.breastRows[0].breastRatingRaw)
		{
			addDisabledButton(i, StringUtil.toTitleCase(options[optSlot]));
		}
		else
		{
			addButton(i, lbls[optSlot], bessSetBoobSize, options[optSlot]);
		}
	}

	if (options.length < 15)
	{
		addButton(14, "Back", bessFunctionsMenu);
	}
}

public function bessSetBoobSize(newSize:int):void
{
	clearOutput();
	bessHeader();

	flags["BESS_BOOBCHANGED"] = 1;

	output("[bess.name]");
	if (bess.biggestTitSize() > 0)
	{
		output(" cups the weight of [bess.hisHer]");
		if (bess.isNude()) output(" naked");
		output(" breasts.");
	}
	else
	{
		output(" rubs [bess.hisHer] hands down [bess.hisHer] flat chest, then positions them just below [bess.hisHer] nipples.");
	}

	if (newSize > 0)
	{
		output(" <i>“" + bess.breastCup(0, newSize) +"s coming right up!”</i>");
	}
	else
	{
		output("<i>“One chest as flat as a washboard coming right up!”</i>");
	}

	// Breast Gain
	if (bess.biggestTitSize() <= 0)
	{
		output("\n\n[Bess.HisHer] synthetic milk surges upwards and soon you can see [bess.hisHer] chest begin to bud, forming tiny, girlish breasts. [bess.HisHer] petite peaks poke out and fill [bess.hisHer] hands, almost as if [bess.heShe] had been holding them all along.");

		output("\n\n<i>“Such tiny breasts! Kind of cute, I think. A nice, squeezable size.”</i> [bess.name] emphasises this by fondling [bess.hisHer] teeny tits, [bess.hisHer] face flushing all the while. <i>“... I forgot how much I </i>love<i> having these...”</i>");
	}

	// Breast Increase
	if (bess.biggestTitSize() < newSize)
	{
		output("\n\nThere is a sound like liquid sloshing about and");
		if (bess.biggestTitSize() > 0) output(" suddenly [bess.hisHer] silvery boobs begin to swell out");
		else output(" [bess.hisHer] silvery boobs continue to swell out");
		output(".");
		if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_NORMAL || bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED || bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FLAT)
		{
			output(" [bess.HisHer]");
			if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_NORMAL) output(" silvery");
			else if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FLAT) output(" flat");
			bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED) output(" inverted");
			output(" nipples begin to stick out from the pressure, popping out and swelling in size.");
		}
		else if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE) output(" [bess.HisHer] fuckable nipples suddenly begin to gape and clench almost spasmically.");
		else if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_DICK) output(" [bess.HisHer] nipples suddenly become erect and [bess.hisHer] chest-dicks show themselves.");
		if (bess.isLactating()) output(" They are soon liberally drooling [bess.hisHer] creamy milk as if [bess.heShe] was heavily pregnant.");

		output("\n\n[bess.name] lets out a sinful moan and rubs them lewdly, [bess.hisHer] nipples clearly sensitive from the pressure. [Bess.HeShe] looks quite drunk off the sensation of [bess.hisHer] tits filling up and unable to contain [bess.hisHer] excitement.");

		output("\n\n<i>“My pleasure senses are going into overdrive.");
		if (bessIsEqual()) output(" Can you please milk my aching tits, "+ bessPCSexName() +"?");
		else if (bessIsDom()) output(" Milk my tits, "+ bessPCSexName() +" - that’s an order.");
		else output(" I’m not sure how much I can hold out, "+ bessPCSexName() +"... can I have permission to cum?");
		if (!bessIsDom()) output("”</i> [bess.name] pleads, all the while desperately massaging [bess.hisHer] quickly inflating mounds.");
		else output(" [bess.name] commands you. There is a predatory look in [bess.hisHer] eyes.");

		output("\n\n");
		if (bessIsDom()) output("Obeying her, you");
		else output("Indulging her, you");
		output(" slip behind [bess.name] and gently massage [bess.hisHer] tender udders, giving [bess.himHer] some relief. You knead your fingers deep into her billowing breast flesh, almost as if you're massaging out her milk.");

		output("\n\n[Bess.HeShe] leans into your chest and lets out a sweet cry as [bess.hisHer] [bess.nipplesLight] ecstatically spurt [bess.hisHer] milk everywhere. They seem incredibly sensitive and as you reach around to stroke [bess.hisHer] nubs [bess.heShe] cries out as if you were stroking [bess.hisHer]");
		if (bess.hasVagina()) output(" clit.");
		else output(" prostate");

		if (pc.hasCock() && pc.genitalSpot <= 1)
		{
			output("\n\nYou’re so turned on by [bess.hisHer] needy, pleasured wiggling against your groin that you");
			if (pc.isCrotchGarbed()) output(" pull off your [pc.lowerGarments]");
			output(" and slip [pc.oneCock] into [bess.hisHer]");
			if (bess.hasVagina()) output(" [bess.pussyLight]");
			else output(" [bess.asshole]");
			output(" from behind. As you penetrate [bess.himHer] [Bess.heShe] excitedly clenches around your length, letting it easily slide inside of [bess.himHer].");

			output("\n\nYou grind and rub lewdly against each other until you both reach a fevered peak, spurting your [pc.cumLight] deep inside of [bess.hisHer] [bess.vagOrAss] as it clenches and spasms around you. [bess.HeShe] immediately collects your");
			if (pc.cumQ() < 500) output(" limited");
			else output(" liberal");
			output(" loads of spunk and transforms it into [bess.hisHer] synthetic milk, recycling it to swell out [bess.hisHer] orgasming udders.");

			output("\n\nAfter you finish cumming,");
		}
		else
		{
			output("\n\nYou massage [bess.hisHer] breasts until they swell up to the right size, but");
		}
		output(" it seems [bess.name] has generated more than she needed. Like a farm animal, you squeeze and massage her drooling udders until they spurt out the excess fluid.");

		output("\n\n[bess.name]'s [bess.thighsLight] shake spastically as [bess.heShe] utterly creams himself");
		if (pc.hasCock() && pc.genitalSpot <= 1) output(" for a second time");
		output(", overstimulated by the frothy streams from her [bess.nippleLight].");
		if (bess.hasCock()) output(" [bess.HeShe] shoots a thick, steaming load of [bess.hisHer] spunk all over the ship's floor, splattering the surface beneath [bess.hisHer] feet.");
		else if (bess.hasVagina()) output(" [bess.HisHer] pussy squirts intermittent jets of [bess.hisHer] [bess.girlCumLight] all over the ship's floor, splattering the surface beneath [bess.hisHer] feet.");

		bess.breastRows[0].breastRatingRaw = newSize;

		output("\n\nAfter the rather intense experience, [bess.name] strokes [bess.hisHer] new [bess.cupSize] breasts. [bess.HisHer] surroundings are an utter mess from the experience and [bess.heShe]");
		if (!bessIsDom()) output(" flushes with embarrassment.");
		else output("shoots you a commanding look.");

		if (bessIsEqual())
		{
			output("\n\n<i>“... Ahem. I'd better get a mop for all this.”</i> [bess.name] coughs, looking about for one.");
			// {if (Celise Companion true
			if (9999 == 0) output(" <i>“...Oh wait, I'll just get Celise! CELLLIIISE! FREE PROTEIN!”</i> [bess.HeShe] shouts out.");
		}
		else if (bessIsDom())
		{
			output("\n\n<i>“Looks like you've got a lot to clean up.");
			if (pc.isBiped()) output(" Hands and knees");
			else output(" On the ground");
			output(", now.”</i> [bess.name] spanks your ass and forces you to lap up [bess.hisHer] milk");
			if (bess.hasCock()) output(" and [bess.cumFlavor] semen");
			if (pc.isBiped()) output(" on all fours");
			else output(" with your tongue");
			output(". [Bess.HeShe] make sure you don't miss a single spot.");

			// {if Celise companion
			if (9999 == 0) output("\n\nCelise comes across you licking up [bess.hisHer] liquids and pouts. <i>“Aww, lucky--! Why don't I get a free meal like that?”</i>");
		}
		else
		{
			output("\n\n<i>“Looks like you’ve got a lot to clean up. Hands and knees, now.”</i> You spank [bess.name]’s ass and force [bess.himHer] to lap up her own milk on [bess.hisHer] on all fours");
			if (bess.hasCock()) output(", as well as [bess.hisHer] own [bess.cumFlavor] semen.”</i>");
			output(" You make sure [bess.heShe] doesn’t miss a single spot.");

			// {if Celise companion 
			if (9999 == 0) output("\n\nCelise comes across [bess.name] licking up [bess.hisHer] liquids and pouts. <i>“Aww, lucky--! Why don't I get a free meal like that?”</i>");
		}

		output("\n\n<b>[bess.name] now has a pair of [bess.breastCupSize] breasts!<\b>");

		bessFunctionsMenu();
	}
	else
	{
		output("\n\n<i>“A decrease? That’s a little trickier. You’ll need to milk me if you want to reduce their size. All that excess liquid has got to go somewhere.”</i> [bess.name] cups [bess.hisHer] [bess.breasts] and emphasises their weight.");

		clearMenu();
		if (!bessIsDom()) addButton(0, "MilkUdders", );
		else addDisabledButton(0, "MilkUdders");
		addButton(1, "Nurse", );
		addButton(2, bess.mf("Him", "Her") + "self", bessMilkYoself, newSize)
	}
}

public function bessMilkYoself(newSize:int):void
{
	clearOutput();
	bessHeader();

	bess.breastRows[0].breastRatingRaw = newSize;

	output("[bess.name] takes some time off to milk [bess.hisHer] breasts down to size. When [bess.heShe] returns, [bess.heShe]");
	if (newSize == 0) output(" has a perfectly flat chest.");
	else output(" is sporting [bess.breastCupSize]s.");

	output("\n\n<b>[bess.name] now has");
	if (newSize > 0) output(" [bess.breastCupSize] breasts!");
	else output(" a flat chest!");
	output("</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutNipples():void
{
	clearOutput();
	bessHeader();

	output("<i>“I suppose "+ bessNippleType() +" nipples aren’t to everyone’s taste. What kind would you like?”</i>");

	//Menu Options alter bess.nipples value. Nipple size is always set to < 1 (Prominent).
	/*
	Normal (0)
	Fuckable (1)
	Dick (3)
	Flat (4)
	Inverted (5)
	*/

	clearMenu();
	addButton(0, "Normal", bessSetNippleType, GLOBAL.NIPPLE_TYPE_NORMAL);
	addButton(1, "Fuckable", bessSetNippleType, GLOBAL.NIPPLE_TYPE_FUCKABLE);
	addButton(2, "Dick", bessSetNippleType, GLOBAL.NIPPLE_TYPE_DICK);
	addButton(3, "Flat", bessSetNippleType, GLOBAL.NIPPLE_TYPE_FLAT);
	addButton(4, "Inverted", bessSetNippleType, GLOBAL.NIPPLE_TYPE_INVERTED);

	addButton(14, "Back", bessFunctionsMenu);
}

public function bessSetNippleType(newType:int):void
{
	clearOutput();
	bessHeader();

	bess.breastRows[0].nippleType = newType;

	output("[bess.name] plays with them for a bit, and suddenly they become [bess.nipplesDesc]! It seems [bess.heShe] came with that particular function built in, so it’s an easy alteration to make.");

	output("\n\n<i>“There you go, two [bess.nipplesNoun]! Anything else..?”</i>");

	output("\n\n<b>Bess now has a pair of [bess.nipplesNoun]!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutLactation():void
{
	clearOutput();
	bessHeader();

	output("<i>“It’s simple to process synthetic milk and lactate it from my nipples. Both biologically and flavor wise, my milk is indistinguishable from the real thing.”</i> [bess.name] sounds rather proud of that fact.");

	clearMenu();

	if (bess.biggestTitSize() > 0) addButton(0, "Lactate", bessStartLactation);
	else addDisabledButton(0, "Lactate", "Start Lactation", "[bess.name] first needs at least some breastflesh in order to lactate.");

	addButton(1, "StopLactate", bessStopLactation);

	addButton(14, "Back", bessFunctionsMenu);
}

public function bessStartLactation():void
{
	clearOutput();
	bessHeader();

	bess.milkMultiplier = 50;
	bess.milkFullness = 100;

	if (bessIsSub()) output("You order [[bess.name] to start lactating");
	else output("You request that [bess.name] start lactating");
	output(" and [bess.heShe] seems happy to");
	if (bessIsDom()) output(" indulge you.");
	else output(" comply.");

	output("\n\n");
	if (bessIsDom()) output("<i>“For SOME");
	else output("<i>“Um, for </i>some<i>");
	output(" reason my designers made the way I activate my lactation mode quite involved, so this may take a moment.”</i> [bess.name]");
	if (bessIsDom()) output(" huffs");
	else output(" apologises in advance");
	output(", and then gets to it.");

	bessTopStripScene();

	output("\n\nIt seems [bess.name] needs to induce lactation in a very similar way to a nursing mother. There’s a good chance JoyCo, being a medical company, thought it was important for [bess.name] to know this particular method. That, or the more likely scenario; [bess.name]’s developers were just a bunch of pregophiles.");

	output("\n\nCupping one of [bess.hisHer] [bess.breastLight] in one hand, [bess.name] begins to gently stroke it like a mother stimulating prolactin. [bess.HeShe] methodically massages each and every part with a flushing expression.");

	output("\n\nThe");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	else output(" bald");
	output(" synthetic seems keenly aware of your eyes on [bess.hisHer] every action, lewdly watching [bess.himHer] massage [bess.hisHer]");
	// var options:Array = [0, 1, 2, 3, 4, 7, 11, 15, 19, 24];
	if (bess.biggestTitSize() >= 19) output(" mountainous");
	else if (bess.biggestTitSize() >= 11) output(" ample");
	else if (bess.biggestTitSize() >= 3) output(" modest");
	else output(" tiny");
	output(" mounds.");

	output("\n\n<i>“Kind of feels weird having you watch me like this. I feel a bit tingly...”</i> [bess.name] remarks as [bess.heShe] touches [bess.himHer]self in front of you. You remark that [bess.heShe] is spending a lot of time on one breast, and the " + bess.mf("male android","android girl")+" huffs.");

	output("\n\n<i>“Well of course, I’ve only got two hands!”</i> That’s an easily solved problem. You move up behind [bess.himHer] and reach around, gently caressing her other [bess.breastNoun].");

	output("\n\nYou feel [bess.himHer] stiffen up at first in surprise, and then relax into your chest with a pleasured sigh. With [bess.himHer] massaging one and you the other, it’s going to take half the time.");
	
	output("\n\nIt’s not long before you feel [bess.name]’s "+bessAssSize()+" ass unconsciously rubbing against your crotch. [Bess.HeShe] seems to be getting really worked up by having [bess.hisHer] [bess.breastsLight] milked.");

	output("\n\nYou’re getting all worked up by [bess.hisHer] heated moans and trembling thighs");
	if (pc.hasCock()) output(", and especially [bess.hisHer] [bess.assTone] buttocks squeezing and caress the underside of your [pc.cocksNounSimple].");
	else if (bess.hasCock()) output(". [bess.HisHer] [bess.cock] is pressed hard and erect against [bess.hisHer] [bess.belly].");
	else if (pc.hasVagina()) output(", your [pc.pussyLight] getting all wet.");
	else output(".");
	output(" The simple breast massage has gotten fairly intense, and now both of you are looking for sexual relief.");

	output("\n\nSliding your arms around [bess.hisHer] waist, you seize [bess.hisHer] [bess.nipples] in your fingers and give them a gentle tug. Immediately [bess.name] turns into a quivering mess and lets an incoherent yet pleased noise, clearly loving them being toyed with.");
	if (bessIsDom()) output(" <i>“Tug”</i>");
	else output(" <i>“Please tug”</i>");
	output(" and milk my udders, "+ bessPCSexName() +"!”</i>");

	output("\n\n[Bess.HisHer] own hands shift underneath [bess.hisHer] [bess.breastsLight] and begin to massage them while you tease [bess.hisHer] [bess.nipples]. It’s not long before they’re bubbling with [bess.milk], [bess.hisHer] frothy fluid pouring down her supple breast flesh and running across your teasing fingers.");

	output("\n\n<i>“Just like that, "+ bessPCSexName() +" - milk my naughty udders!”</i> [bess.name]");
	if (bessIsDom()) output(" orders");
	else output(" breathily begs");
	output(" you. You squeeze [bess.hisHer] [bess.nipples] between your thumb and fingers, milking her like a farm animal as [bess.hisHer] [bess.milk] lewdly sprays out. You could fill a bucket with [bess.hisHer] it!");

	if ((pc.hasCock() || pc.hasVagina()) && pc.genitalSpot <= 1)
	{
		output("\n\nNow that she’s started lactating, [bess.name] turns to you with a lusty look in [bess.hisHer] eyes. <i>“You should sit down, "+ bessPCSexName() +",");
		if (!pc.isNude()) output(" and take off your clothes");
		else if (pc.biped()) output(" and spread your legs");
		else output(" and prepare yourself");
		output(".”</i>");
		if (bessIsSub()) output(" For a change of pace you do as [bess.heShe] requests.");
		else output(" You do as [bess.heShe] requests, though you wonder what [bess.heShe] has in mind.");

		output("\n\nDropping to [bess.hisHer] knees in front of you, [bess.name] continues to stroke [bess.hisHer] freshly lactating tits, caressing [bess.hisHer] [bess.nipples] with [bess.hisHer] fingers. At the same time, [bess.heShe]");
		if (pc.hasCock()) output(" takes [pc.oneCock] into [bess.hisHer] mouth, sucking on it <i>long</i> and <i>hard</i>.");
		else output(" buries [bess.hisHer] face in your [bess.pussyNounSimple], sticking [bess.hisHer] tongue and lapping hungrily inside.");

		output("\n\nTaken aback by [bess.hisHer] boldness, you reel in the sensations of [bess.himHer] going down on your");
		if (pc.hasCock()) output(" achingly erect cock");
		else output(" thoroughly wet gash");
		output(". [Bess.HeShe] passionately");
		if (pc.hasCock()) output(" sucks you off");
		else output(" laps at your folds");
		output(" as [bess.heShe] massages and squeezes [bess.hisHer] freshly drooling udders, spurting [bess.hisHer] [bess.milk] on the ground beneath you.");

		if (pc.hasCock())
		{
			output("\n\nIt’s not long before you’re arching your back and burying your [pc.cockLight] in [bess.hisHer] throat hole. You shoot your [bess.cumFlavor] [bess.cumNoun] without restraint into her gaping synthetic neck, spilling your hot seed directly down into [bess.hisHer] stomach. Your hands reach up and grab the back of [bess.hisHer] head, holding onto it as you utterly blow your load.");
		}
		else
		{
			output("\n\nIt’s not long before you’re arching your back and pushing your [pc.pussyLight] right into [bess.hisHer] face. You cream yourself right in [bess.hisHer] face, your [pc.girlCum] splattering right against [bess.hisHer] mouth in a ecstatic, gooey gush. Your hands reach up and grab the back of [bess.hisHer] head, holding onto it as you explosively cum against [bess.hisHer] lips.");
		}

		output("\n\n[bess.name] lets out a low, trembling moan as [bess.heShe] takes your");
		if (!pc.hasCock()) output(" girl");
		output(" spunk to the face. In the process of you cumming and playing with [bess.hisHer] tits [bess.heShe] also creams [bess.himHer]self");
		if (bess.hasCock()) output(", [bess.hisHer] [bess.cock] shooting [bess.hisHer] [bess.cum] all over the place.");
		else if (bess.hasVagina()) output(", [bess.hisHer] [bess.pussy] shooting [bess.hisHer] [bess.girlCum] all over the place.");
		else output(".");
		output(" [Bess.HisHer] [bess.nipples] fire spastic spurts of [bess.milk] everywhere, almost like a separate ejaculation of their own.");

		output("\n\nAfterwards [bess.name] wipes off [bess.hisHer] face. There is a truly intoxicated look in [bess.hisHer] [bess.eyeColor] eyes, almost as if [bess.heShe]’s utterly drunk off playing with [bess.hisHer] [bess.nipplesNoun] and giving you head.");
	}
	else
	{
		output("\n\n[bess.name] shudders in your arms and suddenly creams [bess.himHer]self. It seems [bess.hisHer] nipples really are sensitive, especially when [bess.heShe]’s lactating!");
	}

	output("\n\n<i>“I guess that that, then? Maybe my designers weren’t so crazy after all.</i> [bess.name] states in a dreamy voice, [bess.milk] drooling from [bess.hisHer] [bess.nipplesLight]. It’s definitely a different kind of ‘on’ switch.");

	output("\n\n<b>[bess.name] is now lactating from [bess.hisHer] [bess.nipplesNoun]!</b>");

	pc.orgasm();
	bess.orgasm();
	bessFunctionsMenu();
}

public function bessStopLactation():void
{
	clearOutput();
	bessHeader();

	output("<i>“Wha- don’t lactate any more?</i> [bess.name] sounds thoroughly disappointed. It seems the "+ bess.mf(" male synthetic", "synthetic girl") +" really likes leaking [bess.milk] from [bess.hisHer] breasts.");

	output("\n\n<i>“... Oh well. I guess it </i>is<i> a waste of my resources if you aren’t going to enjoy it,”</i> [bess.heShe] grudgingly concedes. With a simple tweak of [bess.hisHer] nipples, [bess.hisHer] milk suddenly stops flowing.");

	bess.milkMultiplier = 0;
	bess.milkFullness = 0;

	output("\n\n... What, <i>that’s it</i>? No kinky breast massages, nothing? Seems it’s a lot simpler to turn that mode on than it is to turn it off again.");

	output("\n\n");
	if (bess.isFeminine()) output("Wearing the world's biggest pout");
	else output("With a downhearted sigh");
	output(", [bess.name] goes off to look for something else to do. At least the ship will be saving money on breast pads.");

	bessFunctionsMenu();
}

public function talkToBessAboutBodyShape():void
{
	clearOutput();
	bessHeader();

	output("<i>“My body shape is easily changed. What would you like me to alter...?</i>");

	clearMenu();
	addButton(0, "Hips", talkToBessAboutHips);
	addButton(1, "Butt", talkToBessAboutButt);
	addButton(2, "Tone", talkToBessAboutTone);
	addButton(3, "Stomach", talkToBessAboutStomach);
	addButton(4, "Thickness", talkToBessAboutThickness);

	addButton(14, "Back", bessFunctionsMenu);
}

public function talkToBessAboutHips():void
{
	clearOutput();
	bessHeader();

	output("<i>“You know what they say; it’s all in the hips! What size were you thinking of, "+ bessPCName() +"?”</i>");

	clearMenu();
	addButton(0, "Boyish", setBessHipSize, 0);
	addButton(1, "Slender", setBessHipSize, 2);
	addButton(2, "Average", setBessHipSize, 4);
	addButton(3, "Ample", setBessHipSize, 8);
	addButton(4, "Voluptuous", setBessHipSize, 10);
	addButton(5, "Massive", setBessHipSize, 16);

	addButton(14, "Back", bessFunctionsMenu);
}

public function setBessHipSize(newRating:int):void
{
	changeBessCurvy(newRating, BESS_CURVE_HIPS);
}

public function talkToBessAboutButt():void
{
	clearOutput();
	bessHeader();

	output("<i>“My ass, huh? Were you thinking of putting some junk in this trunk, or taking some out, "+ bessPCName() +"?”</i>");

	clearMenu();
	addButton(0, "Boyish", setBessButtSize, 0);
	addButton(1, "Slender", setBessButtSize, 2);
	addButton(2, "Average", setBessButtSize, 4);
	addButton(3, "Ample", setBessButtSize, 8);
	addButton(4, "Voluptuous", setBessButtSize, 10);
	addButton(5, "Massive", setBessButtSize, 16);

	addButton(14, "Back", bessFunctionsMenu);
}

public function setBessButtSize(newRating:int):void
{
	changeBessCurvy(newRating, BESS_CURVE_BUTT);
}

public function talkToBessAboutTone():void
{
	clearOutput();
	bessHeader();

	output("<i>“Good thing I don’t have to do things the hard way like you organics. How toned were you thinking, "+ bessPCName() +"?”</i>");

	clearMenu();
	addButton(0, "Muscular", setBessTone, 100);
	addButton(1, "SemiMuscular", setBessTone, 70);
	addButton(2, "Average", setBessTone, 50);
	addButton(3, "SemiSoft", setBessTone, 30)
	addButton(4, "Soft", setBessTone, 0);

	addButton(14, "Back", bessFunctionsMenu);
}

public function setBessTone(newTone:int):void
{
	changeBessToneThickness(newTone, true);
}

public function talkToBessAboutThickness():void
{
	clearOutput();
	bessHeader();

	output("<i>“Good thing I don’t have to do things the hard way like you organics. How thick were you thinking, "+ bessPCName() +"?”</i>");

	clearOutput();
	addButton(0, "Thick", setBessThickness, 100);
	addButton(1, "SemiThick", setBessThickness, 70);
	addButton(2, "Average", setBessThickness, 50);
	addButton(3, "SemiThin", setBessThickness, 30);
	addButton(4, "Thin", setBessThickness, 0);

	addButton(14, "Back", bessFunctionsMenu);
}

public function setBessThickness(newThickness:int):void
{
	changeBessToneThickness(newThickness, false);
}

public function changeBessToneThickness(newValue:int, asTone:Boolean):void
{
	clearOutput();
	bessHeader();

	output("Changing [bess.hisHer] " + (asTone ? "tone" : "body thickness") + " is a rather quick process. [bess.name] simply shifts around the insides of [bess.hisHer] FlexMetal body, and before you know it, [bess.heShe]");
	if (asTone)
	{
		if (newValue == 100) output(" is completely ripped");
		if (newValue == 70) output(" has a nice set of muscles");
		if (newValue == 50) output(" is a nice mix of soft curves and toned muscle");
		if (newValue == 30) output(" is nice and plushy, without being overly so");
		else output(" is soft and flesh");
	}
	else
	{
		if (newValue == 100) output(" is incredibly broad");
		if (newValue == 70) output(" is thicker than average");
		if (newValue == 50) output(" is of average size");
		if (newValue == 30) output(" is thinner than average");
		else output(" is incredibly thin");
	}
	output(".");

	output("\n\n<b>[bess.name] now has a ");
	if (asTone) output(bessTone());
	else output(bessThickness());
	output(" body!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutStomach():void
{
	clearOutput();
	bessHeader();

	output("<i>“My stomach, huh? Well, I can change that fairly easily. What size were you thinking, , "+ bessPCName() +"?”</i>");

	clearMenu();
	addButton(0, "Normal", setBessBelly, 0);
	addButton(1, "Cushy", setBessBelly, 10);
	addButton(2, "Pudgy", setBessBelly, 15);
	addButton(3, "Large", setBessBelly, 20);
	addButton(4, "Pregnant", setBessBelly, 30);
	addButton(5, "Full", setBessBelly, 40);
	addButton(6, "Expansive", setBessBelly, 50);
	addButton(7, "Excessive", setBessBelly, 60);
	addButton(8, "Over-inflated", setBessBelly, 80);
	addButton(9, "Massive", setBessBelly, 90);
	addButton(10, "StupidlyHuge", setBessBelly, 100);
	
	addButton(14, "Back", bessFunctionsMenu);
}

public function setBessBelly(newRating:int):void
{
	changeBessCurvy(newRating, BESS_CURVE_BELLY);
}

private static const BESS_CURVE_BUTT:uint = 0;
private static const BESS_CURVE_HIPS:uint = 1;
private static const BESS_CURVE_BELLY:uint = 2;

public function changeBessCurvy(newRating:int, targetRating:uint):void
{
	clearOutput();
	bessHeader();

	var currRating:Number = -1;

	if (targetRating == BESS_CURVE_BUTT) currRating = bess.buttRatingRaw;
	else if (targetRating == BESS_CURVE_HIPS) currRating = bess.hipRatingRaw;
	else targetRating = bess.bellyRatingRaw;

	// Increase
	if (newRating > currRating)
	{
		output("<i>“A size increase, huh? Easily done. Let me just properly allocate the right amount of MeldMilk, then i’ll need to shift it using my JoyCord.”</i> [bess.name] remarks.");

		if (flags["BESS_CHANGED_CURVES"] == undefined)
		{
			output("\n\nShift it using her JoyCord? You’re not sure what [bess.heShe] means...");
		}

		output("\n\nThe " + bess.mf("male synthetic", "synthetic girl") +" lies on [bess.hisHer] back and spreads [bess.hisHer] thighs. [Bess.HeShe] then raises [bess.hisHer] ass and hips off the ground, lewdly exposing [bess.hisHer] [bess.crotch] to you.");
		
		output("\n\n<i>“... I’ve got to directly pump it into my");
		if (targetRating == BESS_CURVE_BUTT || !bess.hasVagina()) output(" [bess.assNoun]");
		else output(" [bess.pussyNoun]");
		output(" using my JoyCord. You can watch if you want.”</i> [bess.name] winks at you as [bess.heShe] slips [bess.hisHer] silvery, phallic-tipped tail around and between [bess.hisHer] thighs.");
		
		output("\n\nYou can’t help but be turned on as you watch [bess.hisHer] glistening glans naughtily rub against [bess.hisHer]");
		if (targetRating == BESS_CURVE_BUTT || !bess.hasVagina()) output(" [bess.ass]. [bess.name] reaches down and parts [bess.hisHer] cheeks with [bess.hisHer] hands, flashing [bess.hisHer] [bess.asshole] at you.");
		else output(" [bess.pussyNoun]. [bess.name] reaches down and parts [bess.hisHer] puffy lower lips with [bess.hisHer] fingers, flashing [bess.hisHer] moist inner folds at you.");
		
		output("\n\nAs it slowly slides inside of [bess.hisHer] silvery");
		if (targetRating = BESS_CURVE_BUTT || !bess.hasVagina()) output(" pucker");
		else output(" snatch");
		if (bess.hasCock()) output(" [bess.hisHer] [bess.cockLight] jerks and spasms with delight. Dollops of pre-cum drool from [bess.hisHer] [bess.cockHeadLight] and drool onto [bess.hisHer] synthetic belly.");
		else output(" [bess.heShe] lets out a pleasured little moan and arches [bess.hisHer] back. [Bess.HeShe] is enjoying every second of [bess.hisHer] pulsing phallus pushing inside [bess.himHer]self and [bess.heShe] isn’t afraid to show it.");

		output("\n\nOnce it is fully inside of [bess.himHer] you hear an audible sloshing noise. Suddenly lumps are moving along the prehensile pipe and pumping directly into [bess.hisHer]");
		if (targetRating == BESS_CURVE_BUTT || !bess.hasVagina()) output(" [bess.ass]");
		else output(" [bess.pussy]");
		output(". The delightful pressure inside [bess.hisHer] sensitive inner walls forces [bess.hisHer] eyes to roll back. It seems [bess.heShe] is in a state of incalculable bliss right now.");
		
		output("\n\nAdding to the mix and unwilling to be a passive observer, you");
		if (bess.hasCock()) output(" grab [bess.hisHer] [bess.cockNounSimple] and begin to jerk [bess.himHer] off.");
		else if (bess.hasVagina() && targetRating == BESS_CURVE_BUTT) output(" grab [bess.hisHer] tail and begin to use it like a dildo, fucking [bess.himHer] with it as [bess.heShe] is simultaneously inflated.");
		else output(" stick your fingers inside of [bess.hisHer] defenseless [bess.ass] and begin to screw [bess.himHer] with them.");
		output(" [bess.name] lets out a sweet cry and immediately creams");
		if (bess.hasCock()) output("all over [bess.hisHer] stomach and around [bess.hisHer] own cock. [Bess.HeShe] squeezes and spasms lewdly around [bess.hisHer] own extensive length as it simultaneously shoots [bess.hisHer] juice into [bess.himHer].");
		
		output("\n\nAt the same time [bess.name]’s");
		if (targetRating == BESS_CURVE_HIPS) output(" thighs begin");
		else if (targetRating == BESS_CURVE_BUTT) output(" ass begins");
		else output(" stomach begins");
		output(" to swell in size. The transformation seems to turn [bess.himHer] on as [bess.heShe] can’t stop cumming around [bess.hisHer] own tail cock as [bess.hisHer] body bloats up.");
		
		output("\n\nIn the end [bess.hisHer] own spurting cock is dislodged from the pressure of [bess.hisHer] gushing fluid, bursting out of [bess.hisHer]");
		if (targetRating == BESS_CURVE_BUTT || !bess.hasVagina()) output(" ass");
		else output(" pussy");
		output(" and spilling all over the floor. [bess.name] lies there with a thoroughly inflated");
		if (targetRating == BESS_CURVE_HIPS) output(" set of hips and thighs");
		else if (targetRating == BESS_CURVE_BUTT) output(" set of asscheeks");
		else output(" belly");
		output(".");
		
		output("\n\n<b>[bess.name] now has");
		if (targetRating == BESS_CURVE_BUTT)
		{
			bess.buttRatingRaw = newRating;
			output(" a " + bessAssSize() + " ass!");
		}
		else if (targetRating == BESS_CURVE_HIPS)
		{
			bess.hipRatingRaw = newRating;
			output(" " + bessThighSize() + " thighs and hips!");
		}
		else
		{
			bess.bellyRatingRaw = newRating;
			output(" a " + bessBellySize() + " belly!");
		}
		output("</b>");
	}
	else
	{
		output("<i>“A size decrease, huh? I can do that. It’s uh... best done in private, though.”</i> [bess.name] remarks,");
		if (!bessIsDom()) output(" flushing");
		else output(" coughing");
		output(" a little. [Bess.HeShe] does grab a pump before [bess.heShe] leaves.");
		
		output("\n\nWhen [bess.heShe] comes back, [bess.heShe] has a much smaller");
		if (targetRating == BESS_CURVE_HIPS)
		{
			bess.hipRatingRaw = newRating;
			output(" set of hips and thighs");
		}
		else if (targetRating == BESS_CURVE_BUTT)
		{
			bess.buttRatingRaw = newRating;
			output(" set of asscheeks");
		}
		else
		{
			bess.bellyRatingRaw = newRating;
			output(" belly");
		}
		output(". <i>“What do you think...?”</i> [bess.name] models [bess.hisHer] new, more compact look for you.");
		
		output("\n\n<b>[bess.name] now has");
		if (targetRating == BESS_CURVE_HIPS) output(" " + bessThighSize() + " thighs and hips!");
		else if (targetRating == BESS_CURVE_BUTT) output(" a " + bessAssSize() + " ass!");
		else output(" a " + bessBellySize() + " belly!");
		output("</b>");
	}

	flags["BESS_CHANGED_CURVES"] = 1;
	bessFunctionsMenu();
}

public function talkToBessAboutGenitals():void
{
	clearOutput();
	bessHeader();

	output("<i>“Interested in changing things down there?”</i>");

	clearMenu();
	addButton(0, "Cock", talkToBessAboutCock);
	addButton(1, "Pussy", talkToBessAboutPussy);
	if (bess.hasCock()) addButton(2, "Knot", talkToBessAboutKnot, undefined, "Cock Knot", "Whenever [bess.name] penetrates you with [bess.hisHer] cock, it will swell and lock inside until [bess.heShe] has finished cumming inside.");
	else addDisabledButton(2, "Knot", "Knot State", "[bess.name] needs to be sporting a cock to configure it's knottyness!");

	addButton(14, "Back", bessFunctionsMenu);
}

public function talkToBessAboutCock():void
{
	clearOutput();
	bessHeader();

	output("<i>“I have the ability to equip a cock extension to better pleasure you, "+ bessPCName() +". Would you like me to do that?”</i>");

	// All cocks except for Dino cock have girth and length = ½ pc orifice capacity.

	clearMenu();
	addButton(0, "None", 			setBessCockType, -1);
	addButton(1, "Normal", 			setBessCockType, GLOBAL.TYPE_HUMAN);
	addButton(2, "Normal+Balls", 	setBessCockType, -2);
	
	if (bessHasCockType(BESS_COCKTYPE_DINO)) addButton(3, "Dino", setBessCockType, GLOBAL.TYPE_SAURIAN);
	else addDisabledButton(3, "Dino", "Dinosaur", "[bess.name] doesn’t have access to this cock style!");

	if (bessHasCockType(BESS_COCKTYPE_HORSE)) addButton(4, "Equine", setBessCockType, GLOBAL.TYPE_EQUINE);
	else addDisabledButton(4, "Equine", "Equine", "[bess.name] doesn’t have access to this cock style!");

	if (bessHasCockType(BESS_COCKTYPE_DOG)) addButton(5, "Canine", setBessCockType, GLOBAL.TYPE_CANINE);
	else addDisabledButton(5, "Canine", "Canine", "[bess.name] doesn’t have access to this cock style!");

	if (bessHasCockType(BESS_COCKTYPE_FOX)) addButton(6, "Vulpine", setBessCockType, GLOBAL.TYPE_VULPINE);
	else addDisabledButton(6, "Vulpine", "Vulpine", "[bess.name] doesn’t have access to this cock style!");

	if (bessHasCockType(BESS_COCKTYPE_DEMON))addButton(7, "Demonic", setBessCockType, GLOBAL.TYPE_DEMONIC);
	else addDisabledButton(7, "Demonic", "Demonic", "[bess.name] doesn’t have access to this cock style!");

	if (bessHasCockType(BESS_COCKTYPE_TENTACLE)) addButton(8, "Tentacle", setBessCockType, GLOBAL.TYPE_TENTACLE);
	else addDisabledButton(8, "Tentacle", "Tentacle", "[bess.name] doesn’t have access to this cock style!");

	if (bessHasCockType(BESS_COCKTYPE_CAT)) addButton(9, "Feline", setBessCockType, GLOBAL.TYPE_FELINE);
	else addDisabledButton(9, "Feline", "Feline", "[bess.name] doesn’t have access to this cock style!");

	if (bessHasCockType(BESS_COCKTYPE_DRAGON)) addButton(10, "Draconic", setBessCockType, GLOBAL.TYPE_DRACONIC);
	else addDisabledButton(10, "Dragonic", "Dragonic", "[bess.name] doesn’t have access to this cock style!");

	if (bessHasCockType(BESS_COCKTYPE_GOO)) addButton(11, "Goo", setBessCockType, GLOBAL.TYPE_GOO);
	else addDisabledButton(11, "Goo", "Goo", "[bess.name] doesn’t have access to this cock style!");

	if (bessHasCockType(BESS_COCKTYPE_PLANT)) addButton(12, "Plant", setBessCockType, GLOBAL.TYPE_PLANT);
	else addDisabledButton(12, "Plant", "Plant", "[bess.name] doesn’t have access to this cock style!");

	addButton(14, "Back", bessFunctionsMenu);
}

public function setBessCockType(newType:int):void
{
	clearOutput();
	bessHeader();

	if (newType == GLOBAL.TYPE_SAURIAN)
	{
		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_SAURIAN;
		bess.cocks[0].cLengthRaw = 20;
		bess.cocks[0].cThicknessRatioRaw = 3;
		bess.cocks[0].clearFlags();

		bess.balls = 2;
		bess.ballSizeRaw = 8;

		output("You decide you’d like to equip [bess.name] with the dino cock attachment you purchased from JoyCo. It takes some work to equip [bess.name] with it; it’s a two-person effort just to get it attached. Once you’re done, [bess.heShe] models off [bess.hisHer] prehistorically massive member and balls for your enjoyment. Its girth is clearly something else - you’ve seen smaller tree trunks.");

		output("\n\nThe head of the cock is entirely covered in rounded spikes or nubs. They’re big enough that they look like you could hold on to them. [bess.HisHer] urethra is so big that a regular cock could fit inside of it. The shaft is segmented; each part looks like it has a muscle for squeezing or stretching.");

		output("\n\n<i>“Umm, "+ bessPCName() +", I’m not sure this is going to fit inside you. It seems like it’s used for insemination of city-destroying monsters...”</i> [bess.name] voices [bess.hisHer] concerns about the size of [bess.hisHer] positively preposterous phallus. <i>“Have you checked to see if your health insurance covers this kind of thing?”</i><b> [bess.name] now has a dino cock and balls!</b>");

		if (silly) output("\n\n<b>[bess.name] now has a gigantic ogre cock!</b>");
		else output("\n\n<b>[bess.name] now has a saurian cock!</b>")
	}
	else if (newType == GLOBAL.TYPE_EQUINE)
	{
		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_EQUINE;
		bess.cocks[0].cLengthRaw = 16;
		bess.cocks[0].cThicknessRatioRaw = 2.5;
		bess.cocks[0].clearFlags();
		bess.cocks[0].addFlag(GLOBAL.FLAG_FLARED);

		bess.balls = 2;
		bess.ballSizeRaw = 7;

		output("You decide you’d like to equip [bess.name] with the horse cock attachment you purchased from JoyCo. It takes some work to equip [bess.name] with it, it’s a two-person effort just to get it attached. Once you’re done, [bess.heShe] models off [bess.hisHer] newly fastened horse phallus and balls for your enjoyment.");
		
		output("\n\n[bess.HisHer] new equine cock flares at you, it looks ready and raring to go. <i>“What do you think, "+ bessPCName() +", did you want to take a ride?”</i><b> [bess.name] now has a horse cock and balls!</b>");

		output("\n\n<b>[bess.name] now has an equine cock and balls!</b>");
	}
	else if (newType == GLOBAL.TYPE_CANINE)
	{
		var knot:Boolean = bess.hasKnot();

		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_CANINE;
		bess.cocks[0].cLengthRaw = 12;
		bess.cocks[0].cThicknessRatioRaw = 2;
		bess.cocks[0].clearFlags();
		if (knot) bess.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
		bess.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);

		bess.balls = 2;
		bess.ballSizeRaw = 5;

		output("You decide you’d like to equip [bess.name] with the canine cock attachment you purchased from JoyCo. It’s not that hard to attach, though it is interesting feeling where the knot should go. Once you’re done, [bess.heShe] models off [bess.hisHer] newly fastened canine cock and balls, replete with tapered tip and knot.");

		if (!bess.hasKnot())
		{
			output("\n\nSince you don’t like knots, [bess.name] immediately de-swells it. <i>“Kind of interesting to have a canine cock without a knot. Feels very... spear-like.”</i>");
		}
		else
		{
			output("\n\nAs [bess.heShe] flexes it, [bess.himHer] base expands and [bess.hisHer] eyes do the same. <i>“Whoa, I have the feeling if I stuck into you I could turn around and not slip out. What do you think, time to get a little bit ‘ruff’, "+ bessPCName() +"?”</i>");
		}

		output("\n\n<b>[bess.name] now has a dog cock and balls!</b>");
	}
	else if (newType == GLOBAL.TYPE_TENTACLE)
	{
		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_TENTACLE;
		bess.cocks[0].cLengthRaw = 24;
		bess.cocks[0].cThicknessRatioRaw = 1.5;
		bess.cocks[0].clearFlags();
		bess.cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);

		bess.balls = 0;
		bess.ballSizeRaw = 0;

		output("You decide you’d like to equip [bess.name] with the tentacle cock attachment you purchased from JoyCo. It’s a slippery sucker to attach (literally) as you fasten the strange <i>“phallus”</i> between [bess.himHer] legs.");
		
		output("\n\nIt swings about as [bess.heShe] swells and shrinks it at will, there’s not many things it couldn’t probe or penetrate. At its tip is a slit where [bess.hisHer] seed can be pumped out into any orifice.");
		
		output("\n\n<i>“Wow, where’s a school-girl when you need one, eh, "+ bessPCName() +"?”</i> [bess.name] cheekily remarks, marvelling at [bess.hisHer] prehensile phallus.");
		
		output("\n\n<b> [bess.name] now has a dangerous looking tentacle cock!</b>");
	}
	else if (newType == GLOBAL.TYPE_GOO)
	{
		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_GOO;
		bess.cocks[0].cLengthRaw = 16;
		bess.cocks[0].cThicknessRatioRaw = 1.5;
		bess.cocks[0].clearFlags();

		bess.balls = 0;
		bess.ballSizeRaw = 0;

		output("You decide you’d like to equip [bess.name] with the goo cock attachment you purchased from JoyCo. You pull out a small ring that seems to be some kind of compact material manipulator. As soon as you attach it to her, [bess.name]’s Meld-Milk insides pour out and form a semi-transparent, metallic looking goo cock!");
		
		output("\n\n<i>“Wow, guess my insides are kind of like that of a metallic goo [bess.boyGirl]...! Imagine the naughty things I can do with this, "+ bessPCName() +", I could probably penetrate even the smallest cracks.”</i> [bess.HeShe] strokes [bess.hisHer] silver gelatinous cock as it ripples about. [bess.HeShe] seems to be able to harden the liquid substance at will.");
		
		output("\n\n<b>[bess.name] now has a goo cock!</b>");
	}
	else if (newType == GLOBAL.TYPE_PLANT)
	{
		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_PLANT;
		bess.cocks[0].cLengthRaw = 12;
		bess.cocks[0].cThicknessRatioRaw = 1.5;
		bess.cocks[0].clearFlags();
		bess.cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);
		bess.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);

		bess.balls = 0;
		bess.ballSizeRaw = 0;

		output("You decide you’d like to equip [bess.name] with the plant cock attachment you purchased from JoyCo. Technically it’s not a plant cock so much as a ‘bio-organic construct’ grown in a lab, and genetically designed to feed off of [bess.name]’s internal Meld-Milk supply.");
		
		output("\n\nPulling it out of the cryo-stasis canister it came in, you then fasten it to [bess.name]’s crotch extension slot, watching it slowly awaken and bury its roots into [bess.hisHer] body.");
		
		output("\n\nThe packaging said it was based on an organism discovered on one of the outer rim planets, known for mating with both plant and mammalian life-forms. [bess.HisHer] base is a giant open blossom, while in the middle of the petals is a phallic looking stamen with a bulbous head.");
		
		output("\n\nAs the mysterious organism feeds off [bess.hisHer] Meld-Milk it begins to generate pollen contained in a gooey sap. The amber fluid leaks freely from [bess.hisHer] pod-like tip or ‘anther’, and dribbles down [bess.hisHer] new shaft.");
		
		output("\n\n<i>“It kind of tingles, "+ bessPCName() +". I can feel it suckling off me - I can’t say it’s unpleasant.”</i> [bess.name] informs you, testing and flexing [bess.hisHer] symbiotic rod. <i>“I can’t believe they grew this; isn’t JoyCo just amazing?”</i>");
		
		
		output("\n\n<b> [bess.name] now has a Plant Cock!</b>");
	}
	else if (newType == GLOBAL.TYPE_DRACONIC)
	{
		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_DRACONIC;
		bess.cocks[0].cLengthRaw = 16;
		bess.cocks[0].cThicknessRatioRaw = 2;
		bess.cocks[0].clearFlags();
		bess.cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);

		bess.balls = 0;
		bess.ballSizeRaw = 0;

		output("You decide you’d like to equip [bess.name] with the draconic cock attachment you purchased from JoyCo. When you see it, your immediate impression is this cock is positively majestic in its appearance; truly the phallus of a mythical beast.");
		
		output("\n\nThe draconic cock’s tapered tip hooks like a crescent curving upwards - you imagine there’s very few holes it couldn’t stick into. The muscled and studded base is considerably thicker than the head, it considerably thickens and curves as your eyes travel down the muscled, studded base, each throbbing curve a promise of intense sexual pleasure.");

		if (!bess.hasKnot())
		{
			output("\n\n[bess.name]’s dragon cock has a knot, but since you don’t like them [bess.heShe] immediately shrinks it away.");
		}
		else
		{
			output("\n\nDown near the base is a draconic bulb-like knot. Just beyond the base is a sudden lack of girth before [bess.hisHer] cock connects to [bess.hisHer] waist - here the cock is half the size of the actual knot. If one wasn’t careful, a clenching orifice might hook into this deep spot and refuse to unfasten until the fierce phallus has become completely flaccid.");
		}

		output("\n\nOnce it is attached, [bess.name] flexes [bess.hisHer] new cock. As it expands [bess.hisHer] eyes do the same. <i>“This is really something else, "+ bessPCName() +"! I kind of feel fierce when I’m wearing this, like nothing can stop me...”</i>");

		output("\n\n<b>[bess.name] now has a draconic cock and balls!</b>");
	}
	else
	{
		if (newType == -1)
		{
			if (bess.hasCock()) bess.removeCock();
			bess.balls = 0;
			bess.ballSizeRaw = 0;
		}
		else
		{
			if (!bess.hasCock()) bess.cocks.push(new CockClass());
			bess.cocks[0].cType = newType;
			bess.cocks[0].cLengthRaw = 12;
			bess.cocks[0].cThicknessRatioRaw = 1.5;
			bess.cocks[0].clearFlags();

			bess.balls = 2;
			bess.ballSizeRaw = 4;
		}

		if (newType == -2)
		{
			bess.balls = 0;
			bess.ballSizeRaw = 0;
		}

		output("\n\n<i>“Just one second, "+ bessPCName() +", while I make the adjustments.”</i> [bess.name] darts off and when [bess.heShe] comes back,");
		if (newType == -1) output(" [bess.hisHer] cock is gone - though where [bess.heShe]’s stored it is a mystery. <i>“Do you like me better this way, "+ bessPCName() +"?”</i>\n\n<b>[bess.name] has removed [bess.hisHer] cock!</b>");
		else output(" she’s sporting "+ bessCockType() +"! [bess.HeShe] eagerly models it off for you. <i>“Do you like it, "+ bessPCName() +"?”</i> <b>[bess.name] now has a [bess.cock]!</b>”</i>");
	}

	bessFunctionsMenu();
}

public function talkToBessAboutPussy():void
{
	clearOutput();
	bessHeader();

	output("<i>“Did you want me to");
	if (!bess.hasVagina()) output(" have a pussy");
	else output(" get rid of my pussy");
	output(", "+ bessPCName() +"?”</i> [bess.name] asks.");

	clearMenu();
	
	if (!bess.hasVagina()) addButton(0, "GetPussy", bessGainPussy);
	else addDisabledButton(0, "GetPussy");

	if (bess.hasVagina()) addButton(1, "LosePussy", bessRemovePussy);
	else addDisabledButton(1, "LosePussy");

	addButton(14, "Back", bessFunctionsMenu);
}

public function bessRemovePussy():void
{
	clearOutput();
	bessHeader();

	output("In what can only be described as bizarre to watch, [bess.name]’s silvery vagina moves up just slightly into her body. A skin covered panel then slides down and out, pressing into the empty spot and filling the gap. What is left is a perfectly smooth groin area.");
	
	output("\n\n<b>[bess.name] no longer has a [bess.pussyNounLight]!</b>");

	bess.removeVagina();

	bessFunctionsMenu();
}

public function bessGainPussy():void
{
	clearOutput();
	bessHeader();

	output("In what can only be described as bizarre to watch, [bess.name]’s flat groin slides in and up, like a hatch opening. From inside a silvery vagina pushes out, filling the gap.");

	bess.vaginas.push(new VaginaClass());
	
	output("\n\n<b>[bess.name] now has a [bess.pussyNounLight]!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutKnot():void
{
	clearOutput();
	bessHeader();

	output("<i>“Did you want me to");
	if (bess.hasKnot()) output(" get rid of my knot");
	else output(" have a knot");
	output(", "+ bessPCName() +"?”</i> [bess.name] asks.");

	clearMenu();

	if (!bess.hasKnot())
	{
		addButton(0, "GainKnot", bessGainKnot);
		addDisabledButton(1, "LoseKnot");
	}
	else
	{
		addDisabledButton(0, "GainKnot");
		addButton(1, "LoseKnot", bessRemoveKnot);
	}

	addButton(14, "Back", bessFunctionsMenu);
}

public function bessGainKnot():void
{
	clearOutput();
	bessHeader();

	output("[bess.name]’s [bess.cock] suddenly begins to flare at the base. The entire process takes mere moments. Afterwards. [bess.heShe] has a muscular lump at the stem of [bess.hisHer] [bess.cockNounSimple].");

	output("\n\nFlexing it and watching it swell and recede, [bess.name] gives a small grin. <i>“Wow, I could trap anyone with this! Fancy a ride, "+ bessPCName() +"?”</i>");

	bess.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);

	output("\n\n<b>[bess.name]’s [bess.cockNounSimple] now has a [bess.knot]!</b>");

	bessFunctionsMenu();
}

public function bessRemoveKnot():void
{
	clearOutput();
	bessHeader();

	output("Within seconds of your request being issued, [bess.name]’s [bess.knot] shrinks until it is completely gone. The signiture lump is now missing from the base of [bess.hisHer] [bess.cockNounSimple].");
	
	output("\n\n<b>[bess.name] no longer has a knot!</b>");

	bess.cocks[0].removeFlag(GLOBAL.FLAG_KNOTTED);

	bessFunctionsMenu();
}

public function talkToBessAboutCum():void
{
	clearOutput();
	bessHeader();

	output("<i>“My cum? Which one in particular...?”</i> [bess.name] asks.");

	if (bess.hasCock()) addButton(0, "CumFlavor", talkToBessAboutCumFlavour, true);
	else addDisabledButton(0, "CumFlavor");

	if (bess.hasVagina()) addButton(1, "GirlCum F", talkToBessAboutCumFlavour, false);
	else addDisabledButton(1, "GirlCum F");

	addButton(14, "Back", bessFunctionsMenu);
}

public function talkToBessAboutCumFlavour(asCock:Boolean):void
{
	clearOutput();
	bessHeader();

	output("<i>“Flavoring is a cinch. Any particular taste you’d fancy? I could give you test tastings, if you want.”</i> [bess.name] offers.");

	var opts:Array = ["normal", "chocolate", "candy", "coffee", "vanilla", "strawberry", "caramel", "banana", "coconut", "maple syrup", "cherry", "choc-vanilla", "whisky", "honey", "rum", "vodka", "beer", "orange", "blueberry", "raspberry", "lime"];
	var vals:Array = [0, GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_CANDY, GLOBAL.FLUID_TYPE_COFFEE, GLOBAL.FLUID_TYPE_VANILLA, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK, GLOBAL.FLUID_TYPE_CARAMEL, GLOBAL.FLUID_TYPE_BANANA, GLOBAL.FLUID_TYPE_COCONUT, GLOBAL.FLUID_TYPE_MAPLESYRUP, GLOBAL.FLUID_TYPE_CHERRY, GLOBAL.FLUID_TYPE_CHOCVANILLA, GLOBAL.FLUID_TYPE_WHISKY, GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_RUM, GLOBAL.FLUID_TYPE_RUM, GLOBAL.FLUID_TYPE_VODKA, GLOBAL.FLUID_TYPE_BEER, GLOBAL.FLUID_TYPE_ORANGE, GLOBAL.FLUID_TYPE_BLUEBERRY, GLOBAL.FLUID_TYPE_RASPBERRY, GLOBAL.FLUID_TYPE_LIME];

	clearMenu();

	var optSlot:int = -1;
	for (var i:int = 0; optSlot < opts.length; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", bessFunctionsMenu);
			continue;
		}
		else
		{
			optSlot++;
		}

		addButton(i, StringUtil.toTitleCase(opts[optSlot]), bessSetCumFlavor, [asCock, vals[optSlot]]);
	}
}

public function bessSetCumFlavor(opts:Array):void
{
	clearOutput();
	bessHeader();

	var asCock:Boolean = opts[0];
	var flav:int = opts[1];

	output("There are no obvious outward signs other than a short period of blinking by the " + bess.mf("male synthetic", "android girl") +".");

	output("\n\n<i>“... All done! Next time I cum, it will taste ");
	if (asCock)
	{
		bess.cumType = flav;
		output(bessCumFlavor());
	}
	else
	{
		bess.girlCumType = flav;
		output(bessGirlCumFlavor());
	}
	output(" !</i> [bess.name] cheerfully exclaims.");
	
	output("\n\n<b>[bess.name]’s");
	if (asCock) output(" cum");
	else output(" girl cum");
	output(" now tastes like ");
	if (asCock) output(bessCumFlavor());
	else output( bessGirlCumFlavor());
	output("!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutClothes():void
{
	clearOutput();
	bessHeader();

	output("You ask [bess.name] to open [bess.hisHer] closet so that you can select a new outfit and accessories for [bess.himHer]. [bess.HeShe] shows you all the clothes that[bess.heShe] owns.");

	// Bess always has access to "Nude". Others are bought from the JoyCo catalogue. many of these are new additions (See Clothing Additions section towards the end of the document).

	// Ears, Horns, Tails and Wings can be purchased in 'sets' from the JoyCo catalogue and then individually activated. If none are purchased, Bess only has the default. 

	// Choosing the Glasses or Katana triggers bessGlasses or bessKatana boolean true or false (equipped or unequipped).

	clearMenu();
	addButton(0, "Outfits", talkToBessAboutOutfits);
	addButton(1, "Underwear Tops", talkToBessAboutUpperUndergarments);
	addButton(2, "Underwear Bottoms", talkToBessAboutLowerUndergarments);
	addButton(3, "Ears", talkToBessAboutEars);
	addButton(4, "Horns", talkToBessAboutHorns);
	addButton(5, "Tails", talkToBessAboutTails);
	addButton(6, "Wings", talkToBessAboutWings);
	addButton(7, "Items", talkToBessAboutItems);

	addButton(14, "Back", bessFunctionsMenu);
}

public function talkToBessAboutOutfits():void
{
	clearMenu();
	addButton(0, "Nude", EmptySlot, "Nude", "Go Nude!"); // 9999 need to target the correct slot somehow

	bessCIW(1, "C.Clothes", CasualClothes, "Casual Clothes", "Casual Clothes");
	bessCIW(2, "P.Jacket", ProtectiveJacket, "Protective Jacket", "Protective Jacket");
	bessCIW(3, "UGC Uniform", UGCUniform, "UGC Uniform", "UGC Uniform");
	bessCIW(4, "SleepShirt", SleepShirt, "Sleep Shirt", "Sleep Shirt");

	bessCIW(5, "Top&Skirt", TopNSkirt, "Top & Skirt", "Top & Skirt");
	bessCIW(6, "B.Clothes", BusinessClothes, "Business Clothes", "Business Clothes");
	bessCIW(7, "Librarian", LibrarianOutfit, "Librarian Outfit", "Librarian Outfit");
	bessCIW(8, "LatexBSuit", LatexBodysuit, "Latex Bodysuit", "Latex Bodysuit");
	bessCIW(9, "ChinaDress", ChinaDress, "China Dress", "China Dress");

	bessCIW(10, "Kimono", Kimono, "Kimono", "Kimono");
	bessCIW(11, "S.Kimono", ShortKimono, "Short Kimono", "Short Kimono");
	bessCIW(12, "Maid" MaidOutfit, "Maid Outfit", "Maid Outfit");
	bessCIW(13, "Nurse" NurseOutfit, "Nurse Outfit", "Nurse Outfit");

	addButton(14, "Back", talkToBessAboutClothes);

	bessCIW(15, "Miko" MikoOutfit, "Miko Outfit", "Miko Outfit");
	bessCIW(16, "Apron" ApronOutfit, "Apron", "Apron");
	bessCIW(17, "Seifuku" Seifuku, "Seifuku", "Seifuku"); // no fuk uuuuuuuuu
	bessCIW(18, "Schoolgirl" SchoolgirlOutfit, "Schoolgirl", "Schoolgirl");
	bessCIW(19, "Cheerleader" CheerleaderUniform, "Cheerleader Uniform", "CheerleaderUniform");

	bessCIW(20, "Waitress" WaitressUniform, "Waitress Uniform", "Waitress Uniform");
	bessCIW(21, "Bunnygirl" BunnygirlOutfit, "Bunnygirl Outfit", "Bunnygirl Outfit");
	bessCIW(22, "Battlegown" BattleBallgown, "Battle Ballgown", "Battle Ballgown");
	bessCIW(23, "Military" MilitaryUniform, "Military Uniform", "Military Uniform");
	bessCIW(24, "Pirate" SpacePirateOutfit, "Space Pirate", "Space Pirate");

	bessCIW(25, "GothLolita" GothLolitaOutfit, "Goth-Lolita Outfit", "Goth-Lolita Outfit");
	bessCIW(26, "Tank&Skirt" TankNSkirt, "Tank-top & Miniskirt", "Tank-top & Miniskirt");
	bessCIW(27, "BattleMaid" BattleMaidOutfit, "Battle Maid Outfit", "Battle Maid Outfit");
	bessCIW(28, "R.Bodysuit" ReinforcedBodysuit, "Reinforced Bodysuit", "Reinforced Bodysuit");

	addButton(29, "Back", talkToBessAboutClothes);

	bessCIW(30, "R.Fem Armor" RevealingFemaleArmor, "Revealing Female Armor", "Revealing Female Armor");
	bessCIW(31, "R.Male Armor" RevealingMaleArmor, "Revealing Male Armor", "Revealing Male Armor");
	bessCIW(32, "T.Zipsuit" TransparentZipsuit, "Transparent Zipsuit", "Transparent Zipsuit");
	bessCIW(33, "Yukata" BessYukata, "Yukata", "Yukata");
	bessCIW(34, "Ninja" NinjaOutfit, "Ninja Outfit", "Ninja Outfit");

	bessCIW(35, "Butler" ButlerOutfit, "Butler Outfit", "Butler Outfit");
	bessCIW(36, "M.Doctor" MaleDoctorOutfit, "Male Doctor Outfit", "Male Doctor Outfit");
	bessCIW(37, "F.Doctor" FemaleDoctorOutfit, "Female Doctor Outfit", "Female Doctor Outfit");
	bessCIW(38, "Gakuran" BessGakuran, "Gakuran", "Gakuran");
	bessCIW(39, "Schoolboy" SchoolboyOutfit, "Schoolboy Outfit", "Schoolboy Outfit");

	bessCIW(40, "StrapHarness" LeatherStrapHarness, "Leather Strap Harness", "Leather Strap Harness");
	bessCIW(41, "BlackDress" LittleBlackDress, "Little Black Dress", "Little Black Dress");
	//addButton(42, "", setBessOutfit, , "", "");
	//addButton(43, "", setBessOutfit, , "", "");

	addButton(44, "Back", talkToBessAboutClothes);
}

/**
 * Bess Clothing Item Wrapper - simplify simple calls determining if an item is available or not and handle button generation.
 * @param idx button index
 * @param lbl button label text
 * @param cType Class type definition of the item - use for availability comparison & button argument
 * @param ttH tooltip header
 * @param ttB tooltop text body
 */
public function bessCIW(idx:int, lbl:String, cType:Class, ttH:String, ttB:String):void
{
	if (bessHasClothingItem(cType))
	{
		addButton(idx, lbl, setBessOutfit, cType, ttH, ttB);
	}
	else
	{
		addDisabledButton(idx, lbl, ttH, "[bess.name] doesn't have access to this item of clothing!");
	}
}

public function talkToBessAboutUpperUndergarments():void
{
	clearMenu();

	addButton(0, "Nude", setBessOutfit, EmptySlot, "Nude", "Nude");
	bessCIW(1, "NormalBra", BessNormalBra, "Normal Bra", "Normal Bra");
	bessCIW(2, "WhiteBra", BessWhiteBra, "White Bra", "White Bra");
	bessCIW(3, "StripedBra", BessStripedBra, "Striped Bra", "Striped Bra");
	bessCIW(4, "FrillyBra", BessFrillyBra, "Frilly Bra", "Frilly Bra");

	bessCIW(5, "GirlyBra", BessGirlyBra, "Girly Bra", "Girly Bra");
	bessCIW(6, "StringTie", BessStringTie, "String Tie Top", "String Tie Top");
	bessCIW(7, "Furry", BessFurryBra, "Furry Bra", "Furry Bra");
	bessCIW(8, "Sarashi", BessSarashi, "Sarashi", "Sarashi");
	bessCIW(9, "Corset", BessCorset, "Corset", "Corset");

	bessCIW(10, "UB.Corset", BessUnderbustCorset, "Underbust Corset", "Underbust Corset");
	bessCIW(11, "SportBra", BessSportsBra, "Sports Bra", "Sports Bra");
	bessCIW(12, "Pasties", BessPasties, "Nipple Pasties", "Nipple Pasties");
	bessCIW(13, "Babydoll", BessBabydoll, "Babydoll", "Babydoll");

	addButton(14, "Back", talkToBessAboutClothes);

	bessCIW(15, "LacyBra", BessLacyBra, "Lacy Bra", "Lacy Bra");
	bessCIW(16, "BlackLace", BessBlackLaceBra, "Black Lace Bra", "Black Lace Bra");
	bessCIW(17, "Shibari", BessShibariTop, "Shibari Top", "Shibari Top")
	bessCIW(18, "MuscleShrt", MuscleShirt, "Muscle Shirt", "Muscle Shirt")
	bessCIW(19, "SportSing", SportSinglet, "Sports Singlet", "Sports Singlet")

	bessCIW(20, "MeshShirt", MeshShirt, "Mesh Shirt", "Mesh Shirt")
	bessCIW(21, "PatriotBra", PatrioticBra, "PatrioticBra", "PatrioticBra")
	bessCIW(22, "SkullBra", SkullBra, "Skull Bra", "Skull Bra")
	bessCIW(23, "HeartTassel", HeartShapedTassels, "Heart Shaped Nipple Tassels", "Heart Shaped Nipple Tassels")
	bessCIW(24, "SkullTassel", SkullShapedTassels, "Skull Shaped Nipple Tassels", "Skull Shaped Nipple Tassels")

	bessCIW(25, "GoldTassel", GoldenTassels, "Golden Nipple Tassels", "Golden Nipple Tassels")
	bessCIW(26, "CloverTassel", CloverTassels, "Clover Nipple Tassels", "Clover Nipple Tassels")
	bessCIW(27, "FlowerTassel", FlowerTassels, "Flower Nipple Tassels", "Flower Nipple Tassels")
	bessCIW(28, "StarTassel", StarTassels, "Star Shaped Nipple Tassels", "Star Shaped Nipple Tassels")

	addButton(29, "Back", talkToBessAboutClothes);

	bessCIW(30, "JewelTassel", JewelTassel, "Jeweled Nipple Tassels", "Jeweled Nipple Tassels")
	bessCIW(31, "BlackTassel", BlackTassel, "Black Nipple Tassels", "Black Nipple Tassels")

	addButton(44, "Back", talkToBessAboutClothes);
}

public function talkToBessAboutLowerUndergarments():void
{
	clearMenu();

	addButton(0, "Nude", EmptySlot, "Nude", "Nude");
	bessCIW(1, "Normal", BessNormalPanties, "Normal Panties", "Normal Panties");
	bessCIW(2, "Stk&Panty", BessStockingsNPanty, "Stockings & Panties", "Stockings & Panties");
	bessCIW(3, "StringTie", BessStringTiePanty, "String Tie Bottoms", "String Tie Bottoms");
	bessCIW(4, "Boxers", BessBoxers, "Boxers", "Boxers");

	bessCIW(5, "Frilly", BessFrillyPanties, "Frilly Panties", "Frilly Panties");
	bessCIW(6, "Girly", BessGirlyPanties, "Girly Panties", "Girly Panties");
	bessCIW(7, "Whities", BessWhitePanties, "White Panties", "White Panties");
	bessCIW(8, "Shibari", BessShibariBottom, "Shibari Bottoms", "Shibari Bottoms");
	bessCIW(9, "Striped", BessStripedPanties, "Striped Panties", "Striped Panties");

	bessCIW(10, "Lowrider", BessLowrider, "Lowrider Bottoms", "Lowrider Bottoms");
	bessCIW(11, "Furry", BessFurryPanties, "Furry Panties", "Furry Panties");
	bessCIW(12, "Black Lace", BessBlackLacePanties, "Black Lace Panties", "Black Lace Panties");
	bessCIW(13, "Boyshorts", BessBoyshorts, "Boyshorts", "Boyshorts");

	addButton(14, "Back", talkToBessAboutClothes);

	bessCIW(15, "Thong", BessThong, "Thong", "Thong");
	bessCIW(16, "P.Boxers", PatrioticBoxers, "Patriotic Boxers", "Patriotic Boxers");
	bessCIW(17, "P.Panties", PatrioticPanties, "Patriotic Panties", "Patriotic Panties");
	bessCIW(18, "S.Boxers", SkullBoxers, "Skull Boxers", "Skull Boxers");
	bessCIW(19, "S.Panties", SkullPanties, "Skull Panties", "Skull Panties");

	bessCIW(20, "C-String", BessCString, "C-String", "C-String");
	bessCIW(21, "SilkBoxers", SilkBoxers, "Black Silk Boxers", "Black Silk Boxers");
	bessCIW(22, "SatinBoxers", SatinBoxers, "Red Satin Boxers", "Red Satin Boxers");
	bessCIW(23, "L.Shorts", LeatherBoyShorts, "Leather Boy Shorts", "Leather Boy Shorts");
	bessCIW(24, "PouchStrap", ZipPouchJockStrap, "Zip Pouch Jock Strap", "Zip Pouch Jock Strap");

	addButton(29, "Back", talkToBessAboutClothes);
}

public function setBessOutfit(classT:Class):void
{
	clearOutput();
	bessHeader();

	var item:ItemSlotClass = new classT(); // now we can inspect the item

	if (item.type == GLOBAL.ARMOR) bess.armor = item;
	if (item.type == GLOBAL.UPPER_UNDERGARMENT) bess.upperUndergarment = item;
	if (item.type == GLOBAL.LOWER_UNDERGARMENT) bess.lowerUndergarment = item;

	output("<b>[bess.name] is now");
	if (!bess.isNude()) output(" wearing [bess.gear]");
	else output(" naked");
	output("!</b>");

	bessFunctionsMenu();
}

public static const BESS_ACS_EAR:uint = 0;
public static const BESS_ACS_HORNS:uint = 1;
public static const BESS_ACS_TAIL:uint = 2;
public static const BESS_ACS_WINGS:uint = 3;

public function talkToBessAboutEars():void
{
	clearMenu();

	var opts:Array = [
		{l: "Human", v: GLOBAL.TYPE_HUMAN, bType: uint.MAX_VALUE},
		{l: "Equine", v: GLOBAL.TYPE_EQUINE, bType: BESS_ACCSET_EQUINE},
		{l: "Bovine", v: GLOBAL.TYPE_BOVINE, bType: BESS_ACCSET_BOVINE},
		{l: "Canine", v: GLOBAL.TYPE_CANINE, bType: BESS_ACCSET_CANINE},
		{l: "Feline", v: GLOBAL.TYPE_FELINE, bType: BESS_ACCSET_FELINE},
		{l: "Vulpine", v: GLOBAL.TYPE_VULPINE, bType: BESS_ACCSET_VULPINE},
		{l: "Elfin", v: GLOBAL.TYPE_ELFIN, bType: BESS_ACCSET_ANGEL},
		{l: "Draconic", v: GLOBAL.TYPE_DRACONIC, bType: BESS_ACCSET_DRACONIC},
		{l: "Deer", v: GLOBAL.TYPE_DEER, bType: BESS_ACCSET_DEER},
		{l: "Mouse", v: GLOBAL.TYPE_MOUSE, bType: BESS_ACCSET_MOUSE},
		{l: "Bunny", v: GLOBAL.TYPE_BUNNY, bType: BESS_ACCSET_BUNNY}
	];

	for (var i:int = 0; i < opts.length; i++)
	{
		if (opts[i].bType == uint.MAX_VALUE || bessHasAccessorySet(opts[i].bType))
		{
			addButton(i, opts[i].l, setBessAccessory, [BESS_ACS_EAR, opts[i].v]);
		}
		else
		{
			addDisabledButton(i, opts[i].l, opts[i].l, "[bess.name] does not have access to this accessory set yet. Please consult the product catalogue for purchasing information!");
		}
	}

	addButton(14, "Back", talkToBessAboutClothes);
}

public function talkToBessAboutHorns():void
{
	clearMenu();

	var opts:Array = [
		{l: "None", v: GLOBAL.TYPE_HUMAN, bType: uint.MAX_VALUE},
		{l: "Bovine", v: GLOBAL.TYPE_BOVINE, bType: BESS_ACCSET_BOVINE},
		{l: "Draconic", v: GLOBAL.TYPE_DRACONIC, bType: BESS_ACCSET_DRACONIC},
		{l: "Demonic", v: GLOBAL.TYPE_DEMONIC, bType: BESS_ACCSET_DEMONIC},
		{l: "Deer", v: GLOBAL.TYPE_DEER, bType: BESS_ACCSET_DEER}
	];

	for (var i:int = 0; i < opts.length; i++)
	{
		if (opts[i].bType == uint.MAX_VALUE || bessHasAccessorySet(opts[i].bType))
		{
			addButton(i, opts[i].l setBessAccessory, [BESS_ACS_HORNS, opts[i].v]);
		}
		else
		{
			addDisabledButton(i, opts[i].l, opts[i].l, "[bess.name] does not have access to this accessory set yet. Please consult the product catalogue for purchasing information!");
		}
	}

	addButton(14, "Back", talkToBessAboutClothes);
}

public function talkToBessAboutTails():void
{
	clearMenu();

	var opts:Array = [
		{l: "None", v: GLOBAL.TYPE_HUMAN, bType: uint.MAX_VALUE},
		{l: "Equine", v: GLOBAL.TYPE_EQUINE, bType: BESS_ACCSET_EQUINE},
		{l: "Bovine", v: GLOBAL.TYPE_BOVINE, bType: BESS_ACCSET_BOVINE},
		{l: "Canine", v: GLOBAL.TYPE_CANINE, bType: BESS_ACCSET_CANINE},
		{l: "Feline", v: GLOBAL.TYPE_FELINE, bType: BESS_ACCSET_FELINE},

		{l: "Vulpine", v: GLOBAL.TYPE_VULPINE, bType: BESS_ACCSET_VULPINE},
		{l: "Draconic", v: GLOBAL.TYPE_DRACONIC, bType: BESS_ACCSET_DRACONIC},
		{l: "Demonic", v: GLOBAL.TYPE_DEMONIC, bType: BESS_ACCSET_DEMONIC},
		{l: "Shark", v: GLOBAL.TYPE_SHARK, bType: BESS_ACCSET_SHARK},
		{l: "Deer", v: GLOBAL.TYPE_DEER, bType: BESS_ACCSET_DEER},

		{l: "Mouse", v: GLOBAL.TYPE_MOUSE, bType: BESS_ACCSET_MOUSE},
		{l: "Bunny", v: GLOBAL.TYPE_BUNNY, bType: BESS_ACCSET_BUNNY},
		{l: "Kitsune", v: GLOBAL.TYPE_KITSUNE, bType: BESS_ACCSET_KITSUNE}
	];

	for (var i:int = 0; i < opts.length; i++)
	{
		if (opts[i].bType == uint.MAX_VALUE || bessHasAccessorySet(opts[i].bType))
		{
			addButton(i, opts[i].l, setBessAccessory, [BESS_ACS_TAIL, opts[i].v]);
		}
		else
		{
			addDisabledButton(i, opts[i].l, opts[i].l, "[bess.name] does not have access to this accessory set yet. Please consult the product catalogue for purchasing information!");
		}
	}

	addButton(14, "Back", talkToBessAboutClothes);
}

public function talkToBessAboutWings():void
{
	clearMenu();

	var opts:Array = [
		{l: "None", v: GLOBAL.TYPE_HUMAN, bType: uint.MAX_VALUE},
		{l: "Bee", v: GLOBAL.TYPE_BEE, bType: BESS_ACCSET_BEE},
		{l: "Draconic", v: GLOBAL.TYPE_DRACONIC, bType: BESS_ACCSET_DRACONIC},
		{l: "Demonic", v: GLOBAL.TYPE_DEMONIC, bType: BESS_ACCSET_DEMONIC},
		{l: "Angel", v: GLOBAL.TYPE_ANGEL, bType: BESS_ACCSET_ANGEL}
	];

	for (var i:int = 0; i < opts.length; i++)
	{
		if (opts[i].bType == uint.MAX_VALUE || bessHasAccessorySet(opts[i].bType))
		{
			addButton(i, opts[i].l, setBessAccessory, [BESS_ACS_WINGS, opts[i].v]);
		}
		else
		{
			addDisabledButton(i, opts[i].l, opts[i].l, "[bess.name] does not have access to this accessory set yet. Please consult the product catalogue for purchasing information!");
		}
	}

	addButton(14, "Back", talkToBessAboutClothes);
}

public function setBessAccessory(opts:Array):void
{
	clearOutput();
	bessHeader();

	var acsType:uint = opts[0];
	var newType:int = opts[1];

	if (acsType == BESS_ACS_EAR)
	{
		bess.earType = newType;
		output("<b>Bess now has [bess.ears]!</b>");
	}
	else if (acsType == BESS_ACS_WINGS)
	{
		bess.wingType = newType;
		// removing
		if (newType == GLOBAL.TYPE_HUMAN)
		{
			output("<b>Bess has removed [bess.hisHer] wings!</b>");
		}
		else
		{
			output("<b>Bess now has [bess.wings]!</b>");
		}
	}
	else if (acsType == BESS_ACS_HORNS)
	{
		bess.hornType = newType;
		if (newType == GLOBAL.TYPE_HUMAN)
		{
			bess.horns = 0;
			bess.hornsLength = 0;
			output("<b>Bess has removed [bess.hisHer] horns!</b>");
		}
		else
		{
			bess.horns = 2;
			bess.hornType = 4;
			output("<b>Bess now has [bess.horns]!</b>");
		}
	}
	else if (acsType == BESS_ACS_TAIL)
	{
		bess.tailType = newType;
		if (newType == GLOBAL.TYPE_HUMAN)
		{
			output("<b>Bess has removed [bess.hisHer] tail");
			if (bess.tailCount > 1) output("s")
			output("!</b>");
			bess.tailCount = 0;
		}
		else
		{
			if (newType == GLOBAL.TYPE_KITSUNE) bess.tailCount = 9;
			else bess.tailCount = 1;

			output("<b>Bess now has [bess.tails]!</b>");
		}
	}

	bessFunctionsMenu();
}

public function talkToBessAboutItems():void
{
	clearMenu();

	if (!bessHasGlasses()) addDisabledButton(0, "Glasses", "Glasses", "[bess.name] doesn't own glasses!");
	else if (!bessGlasses()) addButton(0, "Glasses", talkToBessWearGlasses, undefined, "Glasses", "Have [bess.name] wear glasses.");
	else addButton(0, "Glasses", talkToBessRemoveGlasses, undefined, "Glasses", "Have [bess.name] remove [bess.hisHer] glasses.");

	if (!bessHasKatana()) addDisabledButton(1, "Katana", "Katana", "[bess.name] doesn't own a katana!");
	else if (!bessKatana()) addButton(1, "Katana", talkToBessUseKatana, undefined, "Katana", "Have [bess.name] carry a katana.");
	else addButton(1, "Katana", talkToBessNoKatana, undefined, "Katana", "Have [bess.name] put [bess.hisHer] katana away.");

	addButton(14, "Back", talkToBessAboutClothes);
}

public function talkToBessWearGlasses():void
{
	clearOutput();
	bessHeader();

	flags["BESS_GLASSES"] = 1;

	output("<b>[bess.name] now has glasses on!</b>");

	bessFunctionsMenu();
}

public function talkToBessRemoveGlasses():void
{
	clearOutput();
	bessHeader();

	flags["BESS_GLASSES"] = 0;

	output("<b>[bess.name] has remove [bess.hisHer] glasses!</b>");

	bessFunctionsMenu();
}

public function talkToBessUseKatana():void
{
	clearOutput();
	bessHeader();

	flags["BESS_KATANA"] = 1;

	output("<b>[bess.name] now has a katana!</b>");

	bessFunctionsMenu();
}

public function talkToBessNoKatana():void
{
	clearOutput();
	bessHeader();

	flags["BESS_KATANA"] = 0;

	output("<b>[bess.name] has removed [bess.hisHer] katana!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutAccessories():void
{
	clearOutput();
	bessHeader();

	output("You download the latest JoyCo product catalogue for " + bess.mf("Bess-13", "Ben-14") + " units into one of the ship’s terminals. A holographic projection of specialized clothing, accessories, and upgrades appear on the screen.");
	
	output("\n\nWhat are you interested in purchasing?");

	//Purchases alter which options unlock in the Functions -> Clothing & Acc Menu (where the clothes and accessories can actually be changed).

	clearMenu();
	addButton(0, "Outfits", bessBuyShitOutfits);
	addButton(1, "U.Tops", bessBuyShitBras);
	addButton(2, "U.Bottoms", bessBuyShitPanties);
	addButton(3, "AccSets", bessBuyShitAccessories);
	addButton(4, "Items", bessBuyShitItems);
	addButton(5, "Cocks", bessBuyShitCocks);

	addButton(14, "Back", bessFunctionsMenu);
}

public function bessBuyShitOutfits():void
{
	clearMenu();
	
	bessBuyCIW(0, "C.Clothes", CasualClothes, "Casual Clothes", "Casual Clothes");
	bessBuyCIW(1, "P.Jacket", ProtectiveJacket, "Protective Jacket", "Protective Jacket");
	bessBuyCIW(2, "UGC Uniform", UGCUniform, "UGC Uniform", "UGC Uniform");
	bessBuyCIW(3, "SleepShirt", SleepShirt, "Sleep Shirt", "Sleep Shirt");
	bessBuyCIW(4, "Top&Skirt", TopNSkirt, "Top & Skirt", "Top & Skirt");

	bessBuyCIW(5, "B.Clothes", BusinessClothes, "Business Clothes", "Business Clothes");
	bessBuyCIW(6, "Librarian", LibrarianOutfit, "Librarian Outfit", "Librarian Outfit");
	bessBuyCIW(7, "LatexBSuit", LatexBodysuit, "Latex Bodysuit", "Latex Bodysuit");
	bessBuyCIW(8, "ChinaDress", ChinaDress, "China Dress", "China Dress");
	bessBuyCIW(9, "Kimono", Kimono, "Kimono", "Kimono");

	bessBuyCIW(10, "S.Kimono", ShortKimono, "Short Kimono", "Short Kimono");
	bessBuyCIW(11, "Maid" MaidOutfit, "Maid Outfit", "Maid Outfit");
	bessBuyCIW(12, "Nurse" NurseOutfit, "Nurse Outfit", "Nurse Outfit");
	bessBuyCIW(13, "Miko" MikoOutfit, "Miko Outfit", "Miko Outfit");

	addButton(14, "Back", talkToBessAboutAccessories);
	
	bessBuyCIW(15, "Apron" ApronOutfit, "Apron", "Apron");
	bessBuyCIW(16, "Seifuku" Seifuku, "Seifuku", "Seifuku"); // no fuk uuuuuuuuu
	bessBuyCIW(17, "Schoolgirl" SchoolgirlOutfit, "Schoolgirl", "Schoolgirl");
	bessBuyCIW(18, "Cheerleader" CheerleaderUniform, "Cheerleader Uniform", "CheerleaderUniform");
	bessBuyCIW(19, "Waitress" WaitressUniform, "Waitress Uniform", "Waitress Uniform");

	bessBuyCIW(20, "Bunnygirl" BunnygirlOutfit, "Bunnygirl Outfit", "Bunnygirl Outfit");
	bessBuyCIW(21, "Battlegown" BattleBallgown, "Battle Ballgown", "Battle Ballgown");
	bessBuyCIW(22, "Military" MilitaryUniform, "Military Uniform", "Military Uniform");
	bessBuyCIW(23, "Pirate" SpacePirateOutfit, "Space Pirate", "Space Pirate");
	bessBuyCIW(24, "GothLolita" GothLolitaOutfit, "Goth-Lolita Outfit", "Goth-Lolita Outfit");

	bessBuyCIW(25, "Tank&Skirt" TankNSkirt, "Tank-top & Miniskirt", "Tank-top & Miniskirt");
	bessBuyCIW(26, "BattleMaid" BattleMaidOutfit, "Battle Maid Outfit", "Battle Maid Outfit");
	bessBuyCIW(27, "R.Bodysuit" ReinforcedBodysuit, "Reinforced Bodysuit", "Reinforced Bodysuit");
	bessBuyCIW(28, "R.Fem Armor" RevealingFemaleArmor, "Revealing Female Armor", "Revealing Female Armor");

	addButton(29, "Back", talkToBessAboutAccessories);

	bessBuyCIW(30, "R.Male Armor" RevealingMaleArmor, "Revealing Male Armor", "Revealing Male Armor");
	bessBuyCIW(31, "T.Zipsuit" TransparentZipsuit, "Transparent Zipsuit", "Transparent Zipsuit");
	bessBuyCIW(32, "Yukata" BessYukata, "Yukata", "Yukata");
	bessBuyCIW(33, "Ninja" NinjaOutfit, "Ninja Outfit", "Ninja Outfit");
	bessBuyCIW(34, "Butler" ButlerOutfit, "Butler Outfit", "Butler Outfit");

	bessBuyCIW(35, "M.Doctor" MaleDoctorOutfit, "Male Doctor Outfit", "Male Doctor Outfit");
	bessBuyCIW(36, "F.Doctor" FemaleDoctorOutfit, "Female Doctor Outfit", "Female Doctor Outfit");
	bessBuyCIW(37, "Gakuran" BessGakuran, "Gakuran", "Gakuran");
	bessBuyCIW(38, "Schoolboy" SchoolboyOutfit, "Schoolboy Outfit", "Schoolboy Outfit");
	bessBuyCIW(39, "StrapHarness" LeatherStrapHarness, "Leather Strap Harness", "Leather Strap Harness");

	bessBuyCIW(41, "BlackDress" LittleBlackDress, "Little Black Dress", "Little Black Dress");
}

public function bessBuyCIW(idx:int, lbl:String, classT:Class, ttH:String, ttB:String):void
{
	var item:ItemSlotClass = new classT();

	// already owns, hide
	if (bessHasClothingItem(classT))
	{
		output(StringUtil.toTitleCase(item.longName) + " - [bess.name] already owns this item!\n");
		addDisabledButton(idx, lbl, ttH, "[bess.name] already owns this item!");
	}
	else
	{
		output(StringUtil.toTitleCase(item.longName) + " - ");
		// Can afford
		if (pc.credits >= item.basePrice)
		{
			output(" Cost: " + String(item.basePrice));
			addButton(idx, lbl, bessBuyOutfit, item, ttH, ttB + "\n\nCost: " + item.basePrice);
		}
		// too spensive
		else
		{
			output(" Cost: " + String(item.basePrice) + " (Too expensive!)");
			addDisabledButton(idx, lbl, ttH, ttB + "\n\nCost: " + item.basePrice + "\nToo expensive!");
		}
		output("\n");
	}
}

public function bessBuyOutfit(boughtItem:ItemSlotClass):void
{
	clearOutput();
	bessHeader();

	output("You transfer the credits to JoyCo and place your order. It’s not long before a warp-space delivery service is dropping off a package to your spaceship hangar.");

	bess.inventory.push(boughtItem);
	pc.credits -= boughtItem.basePrice;

	clearMenu();
	addButton(0, "Next", talkToBessAboutAccessories);

	// 9999 -- offer option to immediately equip?
}

public function bessBuyShitBras():void
{
	clearMenu();
	bessBuyCIW(0, "NormalBra", BessNormalBra, "Normal Bra", "Normal Bra");
	bessBuyCIW(1, "WhiteBra", BessWhiteBra, "White Bra", "White Bra");
	bessBuyCIW(2, "StripedBra", BessStripedBra, "Striped Bra", "Striped Bra");
	bessBuyCIW(3, "FrillyBra", BessFrillyBra, "Frilly Bra", "Frilly Bra");
	bessBuyCIW(4, "GirlyBra", BessGirlyBra, "Girly Bra", "Girly Bra");

	bessBuyCIW(5, "StringTie", BessStringTie, "String Tie Top", "String Tie Top");
	bessBuyCIW(6, "Furry", BessFurryBra, "Furry Bra", "Furry Bra");
	bessBuyCIW(7, "Sarashi", BessSarashi, "Sarashi", "Sarashi");
	bessBuyCIW(8, "Corset", BessCorset, "Corset", "Corset");
	bessBuyCIW(9, "UB.Corset", BessUnderbustCorset, "Underbust Corset", "Underbust Corset");

	bessBuyCIW(10, "SportBra", BessSportsBra, "Sports Bra", "Sports Bra");
	bessBuyCIW(11, "Pasties", BessPasties, "Nipple Pasties", "Nipple Pasties");
	bessBuyCIW(12, "Babydoll", BessBabydoll, "Babydoll", "Babydoll");
	bessBuyCIW(13, "LacyBra", BessLacyBra, "Lacy Bra", "Lacy Bra");

	addButton(14, "Back", talkToBessAboutAccessories);

	bessBuyCIW(15, "BlackLace", BessBlackLaceBra, "Black Lace Bra", "Black Lace Bra");
	bessBuyCIW(16, "Shibari", BessShibariTop, "Shibari Top", "Shibari Top");
	bessBuyCIW(17, "MuscleShrt", MuscleShirt, "Muscle Shirt", "Muscle Shirt");
	bessBuyCIW(18, "SportSing", SportSinglet, "Sports Singlet", "Sports Singlet");
	bessBuyCIW(19, "MeshShirt", MeshShirt, "Mesh Shirt", "Mesh Shirt");

	bessBuyCIW(20, "PatriotBra", PatrioticBra, "PatrioticBra", "PatrioticBra");
	bessBuyCIW(21, "SkullBra", SkullBra, "Skull Bra", "Skull Bra");
	bessBuyCIW(22, "HeartTassel", HeartShapedTassels, "Heart Shaped Nipple Tassels", "Heart Shaped Nipple Tassels");
	bessBuyCIW(23, "SkullTassel", SkullShapedTassels, "Skull Shaped Nipple Tassels", "Skull Shaped Nipple Tassels");
	bessBuyCIW(24, "GoldTassel", GoldenTassels, "Golden Nipple Tassels", "Golden Nipple Tassels");

	bessBuyCIW(25, "CloverTassel", CloverTassels, "Clover Nipple Tassels", "Clover Nipple Tassels");
	bessBuyCIW(26, "FlowerTassel", FlowerTassels, "Flower Nipple Tassels", "Flower Nipple Tassels");
	bessBuyCIW(27, "StarTassel", StarTassels, "Star Shaped Nipple Tassels", "Star Shaped Nipple Tassels");
	bessBuyCIW(29, "JewelTassel", JewelTassel, "Jeweled Nipple Tassels", "Jeweled Nipple Tassels");

	addButton(29, "Back", talkToBessAboutAccessories);

	bessBuyCIW(31, "BlackTassel", BlackTassel, "Black Nipple Tassels", "Black Nipple Tassels");

	addButton(44, "Back", talkToBessAboutAccessories);
}

public function bessBuyShitPanties():void
{
	clearMenu();

	bessBuyCIW(0, "Normal", BessNormalPanties, "Normal Panties", "Normal Panties");
	bessBuyCIW(1, "Stk&Panty", BessStockingsNPanty, "Stockings & Panties", "Stockings & Panties");
	bessBuyCIW(2, "StringTie", BessStringTiePanty, "String Tie Bottoms", "String Tie Bottoms");
	bessBuyCIW(3, "Boxers", BessBoxers, "Boxers", "Boxers");
	bessBuyCIW(4, "Frilly", BessFrillyPanties, "Frilly Panties", "Frilly Panties");

	bessBuyCIW(5, "Girly", BessGirlyPanties, "Girly Panties", "Girly Panties");
	bessBuyCIW(6, "Whities", BessWhitePanties, "White Panties", "White Panties");
	bessBuyCIW(7, "Shibari", BessShibariBottom, "Shibari Bottoms", "Shibari Bottoms");
	bessBuyCIW(8, "Striped", BessStripedPanties, "Striped Panties", "Striped Panties");
	bessBuyCIW(9, "Lowrider", BessLowrider, "Lowrider Bottoms", "Lowrider Bottoms");

	bessBuyCIW(10, "Furry", BessFurryPanties, "Furry Panties", "Furry Panties");
	bessBuyCIW(11, "Black Lace", BessBlackLacePanties, "Black Lace Panties", "Black Lace Panties");
	bessBuyCIW(12, "Boyshorts", BessBoyshorts, "Boyshorts", "Boyshorts");
	bessBuyCIW(13, "Thong", BessThong, "Thong", "Thong");

	addButton(14, "Back", talkToBessAboutAccessories);

	bessBuyCIW(15, "P.Boxers", PatrioticBoxers, "Patriotic Boxers", "Patriotic Boxers");
	bessBuyCIW(16, "P.Panties", PatrioticPanties, "Patriotic Panties", "Patriotic Panties");
	bessBuyCIW(17, "S.Boxers", SkullBoxers, "Skull Boxers", "Skull Boxers");
	bessBuyCIW(18, "S.Panties", SkullPanties, "Skull Panties", "Skull Panties");
	bessBuyCIW(19, "C-String", BessCString, "C-String", "C-String");

	bessBuyCIW(20, "SilkBoxers", SilkBoxers, "Black Silk Boxers", "Black Silk Boxers");
	bessBuyCIW(21, "SatinBoxers", SatinBoxers, "Red Satin Boxers", "Red Satin Boxers");
	bessBuyCIW(22, "L.Shorts", LeatherBoyShorts, "Leather Boy Shorts", "Leather Boy Shorts");
	bessBuyCIW(23, "PouchStrap", ZipPouchJockStrap, "Zip Pouch Jock Strap", "Zip Pouch Jock Strap");

	addButton(29, "Back", talkToBessAboutAccessories);
}

public function bessBuyShitAccessories():void
{
	clearOutput();
	bessHeader();

	output("What set would you like to purchase?");

	output("\nEquine set (Allows Bess to set Equine Tail and Ears) - 250 Creds");
	output("\nBovine Set (Allows Bess to set Bovine Tail, Ears and Horns) - 250 Creds");
	output("\nCanine Set (Allows Bess to set Canine Tail and Ears) - 250 Creds");
	output("\nFeline Set (Allows Bess to set Feline Tail and Ears) - 250 Creds");
	output("\nVulpine Set (Allows Bess to set Vulpine Tail and Ears) - 250 Creds");
	output("\nBunny Set (Allows Bess to set Leporine Tail, Ears) - 250 Creds");
	output("\nBee Set (Allows Bess to set Bee Wings) - 250 Creds");
	output("\nDraconic Set (Allows Bess to set Draconic Ears, Tail, Wings and Horns). - 500 Creds");
	output("\nDemonic Set (Allows Bess to set Demonic Ears, Tail, Wings and Horns) - 500 Creds");
	output("\nShark Set (Allows Bess to set Shark Ears and Tail) - 250 Creds");
	output("\nDeer Set (Allows Bess to set Deer Ears, Tail and Horns) - 250 Creds");
	output("\nMouse Set (Allows Bess to set Mouse Ears and Tail) - 250 Creds");
	output("\nAngel Set (Allows Bess to set Angel/White Feathered Wings) - 500 Creds");

	clearMenu();
	bessBASW(0, "Equine", BESS_ACCSET_EQUINE, 250);
	bessBASW(1, "Bovine", BESS_ACCSET_BOVINE, 250);
	bessBASW(2, "Canine", BESS_ACCSET_CANINE, 250);
	bessBASW(3, "Feline", BESS_ACCSET_FELINE, 250);
	bessBASW(4, "Vulpine", BESS_ACCSET_VULPINE, 250);
	bessBASW(5, "Bunny", BESS_ACCSET_BUNNY, 250);
	bessBASW(6, "Bee", BESS_ACCSET_BEE, 250);
	bessBASW(7, "Draconic", BESS_ACCSET_DRACONIC, 500);
	bessBASW(8, "Demonic", BESS_ACCSET_DEMONIC, 500);
	bessBASW(9, "Shark", BESS_ACCSET_SHARK, 250);
	bessBASW(10, "Deer", BESS_ACCSET_DEER, 250);
	bessBASW(11, "Mouse", BESS_ACCSET_MOUSE, 250);
	bessBASW(12, "Angel", BESS_ACCSET_ANGEL, 500);

	addButton(14, "Back", talkToBessAboutAccessories);
}

public function bessBASW(idx:int, lbl:String, accSet:uint, cost:int):void
{
	if (bessHasAccessorySet(accSet))
	{
		addDisabledButton(idx, lbl, lbl, "[bess.name] already owns this accessory set!");
	}
	else
	{
		if (pc.credits >= cost)
		{
			addButton(idx, lbl, bessBuyAccessory, [accSet, cost], lbl, "Cost: " + cost);
		}
		else
		{
			addDisabledButton(idx, lbl, lbl, "Cost: " + cost + "\nToo expensive!");
		}
	}
}

public function bessBuyAccessory(opts:Array):void
{
	clearOutput();
	bessHeader();

	output("You transfer the credits to JoyCo and place your order. It’s not long before a warp-space delivery service is dropping off a package to your spaceship hangar.");

	var accSet:uint = opts[0];
	var cost:int = opts[1];

	pc.credits -= cost;
	bessAddAccessorySet(accSet);

	addButton(0, "Next", talkToBessAboutAccessories)
}

public function bessBuyShitItems():void
{
	clearOutput();
	bessHeader();

	output("What JoyCo product would you like to purchase for [bess.name]?");
	
	output("\n\nGlasses (Allows Bess to equip Glasses in Accessory Menu) - 500 Creds");
	output("\nKatana (Allows Bess to equip Katana in Accessory Menu) - 1000 Creds");

	clearMenu();
	
	if (bessHasGlasses()) addDisabledButton(0, "Glasses", "Glasses", "[bess.name] already owns glasses!");
	else if (pc.credits < 500) addDisabledButton(0, "Glasses", "Glasses", "You can't afford to buy [bess.name] glasses!");
	else addButton(0, "Glasses", bessBuyGlasses, undefined, "Glasses", "Buy some glasses and allow [bess.name] to equip them!");

	if (bessHasKatana()) addDisabledButton(1, "Katana", "Katana", "[bess.name] already owns a katana!");
	else if (pc.credits < 1000) addDisabledButton(1, "Katana", "Katana", "You can't afford to buy [bess.name] a katana!");
	else addButton(1, "Katana", bessBuyKatana, undefined, "Katana", "Buy a katana for [bess.name] to saunter around with it!");

	addButton(14, "Back", talkToBessAboutAccessories);
}

public function bessBuyGlasses():void
{
	clearOutput();
	bessHeader();

	output("You transfer the credits to JoyCo and place your order. It’s not long before a warp-space delivery service is dropping off a package to your spaceship hangar.");

	pc.credits -= 500;
	flags["BESS_OWNS_GLASSES"] = 1;

	clearMenu();
	addButton(0, "Next", bessBuyShitItems);
}

public function bessBuyKatana():void
{
	clearOutput();
	bessHeader();

	output("You transfer the credits to JoyCo and place your order. It’s not long before a warp-space delivery service is dropping off a package to your spaceship hangar.");

	pc.credits -= 1000;
	flags["BESS_OWNS_KATANA"] = 1;

	clearMenu();
	addButton(0, "Next", bessBuyShitItems);
}

public function bessBuyShitCocks():void
{
	clearOutput();
	bessHeader();

	output("What kind would you like to purchase?");

	//Purchases alter which cock options unlock in the Functions -Menu (where the upgrades can actually be activated). See Functions Menu / Cock or value guide for details.
	clearMenu();
	bessBCW(0, "Dino", BESS_COCKTYPE_DINO, 1500);
	bessBCW(1, "Horse", BESS_COCKTYPE_HORSE, 500);
	bessBCW(2, "Dog", BESS_COCKTYPE_DOG, 500);
	bessBCW(3, "Fox", BESS_COCKTYPE_FOX, 500);
	bessBCW(4, "Demon", BESS_COCKTYPE_DEMON, 500);
	bessBCW(5, "Tentacle", BESS_COCKTYPE_TENTACLE, 1000);
	bessBCW(6, "Cat", BESS_COCKTYPE_CAT, 500);
	bessBCW(7, "Goo", BESS_COCKTYPE_GOO, 1000);
	bessBCW(8, "Plant", BESS_COCKTYPE_PLANT, 1000);
	bessBCW(9, "Dragon", BESS_COCKTYPE_DRAGON, 1000);

	addButton(14, "Back", talkToBessAboutAccessories);
}

public function bessBCW(idx:int, lbl:String, cockType:uint, cost:int):void
{
	if (bessHasCockType(cockType))
	{
		addDisabledButton(idx, lbl, lbl, "[bess.name] already has access to this cock type!");
	}
	else
	{
		if (pc.credits >= cost)
		{
			addButton(idx, lbl, bessBuyCockType, [cockType, cost], lbl, "Cost: " + cost);
		}
		else
		{
			addDisabledButton(idx, lbl, lbl, "Cost: " + cost + "\nToo expensive!");
		}
	}
}

public function bessBuyCockType(opts:Array):void
{
	var cType:uint = opts[0];
	var cost:uint = opts[1];

	clearOutput();
	bessHeader();

	output("You transfer the credits to JoyCo and place your order. It’s not long before a warp-space delivery service is dropping off a package to your spaceship hangar.");

	bessAddCockType(cType);
	pc.credits -= cost;

	clearMenu();
	addButton(0, "Next", talkToBessAboutAccessories);
}

public function talkToBessAboutThings():void
{
	clearOutput();
	bessHeader();

	output("\n\n<i>“Yes "+ bessPCName() +" what would you like to talk about?”</i>");

	clearMenu();
	addButton(0, "SpendTime", bessSpendTime);
	addButton(1, bessName(), talkToBessAboutBess);
	addButton(2, "You", talkToBessAboutPC);
	
	if (flags["BESS_EVENT_28"] == undefined) addButton(3, "JoyCo", talkToBessAboutJoyco);
	else addDisabledButton(3, "JoyCo");

	if (flags["BESS_FUCKED"] != undefined || flags["BESS_BOOBCHANGED"] != undefined) addButton(4, "Nipples", talkToBessGetInfoOnNipnips);
	if (flags["BESS_EVENT_11"] != undefined) addButton(5, bess.mf("His", "Her") + " Job", talkToBessAboutHerJob);
	if (flags["BESS_EVENT_17"] && pcShipHasHolodeck()) addButton(6, "Graviball", talkToBessPlayGraviball);
	if (flags["BESS_EVENT_18"] addButton(7, "Karaoke", );
	if (celiseIsFollower()) addButton(8, "Celise", );

	addButton(14, "Back", bessFollowerMenu);
}

public function bessSpendTime():void
{
	// available message functors & requirements
	var availableMessages:Array = [];

	if (flags["BESS_LOVER"] == 1)
	{
		availableMessages.push(bessSpendTime1, bessSpendTime2, bessSpendTime3, bessSpendTime6, bessSpendTime7);
		if (flags["BESS_LOVER_STATUS"] == "sub" || flags["BESS_LOVER_STATUS"] == "pet") availableMessages.push(bessSpendTime4, bessSpendTime10);
		if (flags["BESS_LOVER_STATUS"].indexOf("dom") != -1) availableMessages.push(bessSpendTime5, bessSpendTime9);
		if (bess.isFeminine()) availableMessages.push(bessSpendTime8);
	}

	if (flags["BESS_FRIEND"] == 1)
	{
		availableMessages.push(bessSpendTime14, bessSpendTime15, bessSpendTime16, bessSpendTime17);
	}

	if (flags["BESS_FRIEND"] == undefined && flags["BESS_LOVER"] == undefined)
	{
		availableMessages.push(bessSpendTime18, bessSpendTime19, bessSpendTime20, bessSpendTime21, bessSpendTime22, bessSpendTime26, bessSpendTime27, bessSpendTime28);
	}

	if (flags["BESS_EVENT_3"] != undefined)
	{
		availableMessages.push(bessSpendTime24, bessSpendTime25);

		if (flags["BESS_FRIEND"] == undefined && flags["BESS_LOVER"] == undefined) availableMessages.push(bessSpendTime23);
	}
	if (flags["BESS_EVENT_6"] != undefined) availableMessages.push(bessSpendTime11, bessSpendTime12)
	if (flags["BESS_EVENT_9"] != undefined) availableMessages.push(bessSpendTime13);

	// execute at random
	RandomInCollection(availableMessages)();
}

public function bessSpendTime1():void
{
	// Randomize bracket contents
	clearOutput();
	bessHeader();

	output("You spend time cuddling with [bess.name] in your bed, talking about small things while you hold [bess.himHer] in your arms. You enjoy the feeling of [bess.himHer] pressed against your body as you chat.");

	output("\n\n<i>“");
	output(
		RandomInCollection(
			"I love you more than words can express.",
			"You are my everything, you know that?",
			"You are my best friend as well as my heart.",
			"The sound of your laughter makes me smile.",
			"I will always love you, "+ bessNamePC() +".",
			"You inspire me to follow my dreams, and I love you for it.",
			"Your love has helped me become a better version of myself.",
			"I never imagined I would get to love someone as wonderful and special as you.",
			"You should always be proud of the person you are.",
			"Being in your arms is the most wonderful feeling in the galaxy.I’m so glad you’re home.",
			"The day I met you was the best day of my life.",
			"My life is full of color and love, and all because of you.",
			"The galaxy seems perfect when you hold me in your arms.",
			"I enjoy your company more than anything else in the world - that includes books!"
		);
	);
	output("”</i> [bess.HeShe] tells you.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime2():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_LOVER_STATUS"].indexOf("dom") != -1 || (bess.isMasculine() && flags["BESS_LOVER_STATUS"] != "sub" && flags["BESS_LOVER_STATUS"] != "pet"))
	{
		output("You spend some time making out with [bess.name] in the ship’s hallway. [bess.HeShe] shoves you up against the wall and kisses you long and hard. When [bess.heShe] pulls away you’re breathing rapidly and feeling deliriously happy.");
	}
	else
	{
		output("You spend some time making out with [bess.name] in the ship’s hallway, pushing [bess.himHer] up against a wall and kissing long and hard. When you pull away [bess.heShe]’s breathing rapidly looking like [bess.heShe]’s about to swoon.");
	}

	processTime(5+rand(3));
	bessAffectionGain(BESS_AFFECTION_SPENDTIME);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime3():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_LOVER_STATUS"].indexOf("dom") != -1 || (bess.isMasculine() && flags["BESS_LOVER_STATUS"] != "sub" && flags["BESS_LOVER_STATUS"] != "pet"))
	{
		output("[bess.name] wants you to spend some time with her. When you are in the ship’s galley [bess.name] grabs you all of a sudden and presses you against the fridge. <i>“I want your lips...”</i> You happily submit, kissing [bess.hisHer] fervently as [bess.heShe] claims your [pc.lips]. You moan into [bess.hisHer] mouth, relishing [bess.himHer] claiming what is rightfully [bess.hisHers].");

		output("\n\nIt’s a long time before you pull away from each other and [bess.heShe] grins.  <i>“... Tastiest thing I’ve ever gotten from the galley. Keep it up.”</i> [bess.HeShe] slaps you on your ass as [bess.heShe] leaves, causing a shiver to run up your spine");
		if (pc.hasTail()) output(" and down your [pc.tail]");
		output(".");
	}
	else
	{
		output("You spend some time with your [bessLoverStatus], [bess.name]. When you are both in the ship’s galley, you suddenly press [bess.hisHer] against the fridge. [bess.HeShe] moans into your lips as you kiss [bess.himHer] " + bess.mf("sliding his arms around your waist", "wrapping her arms around your neck") +".");

		output("\n\nIt’s a long time before you pull away from each other and [bess.heShe] grins, clearly happy with your decision to randomly seize [bess.himHer] and steal a kiss. <i>“... Mmm, I think that’s the tastiest thing I’ve ever gotten from the galley!”</i>");
	}

	processTime(15+rand(5));
	bessAffectionGain(BESS_AFFECTION_SPENDTIME);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime4():void
{
	clearOutput();
	bessHeader();

	output("You decide to spend some time with your " + bessLoverStatus() + ". You notice [bess.name] has done something naughty by the way [bess.heShe]’s acting. You force [bess.himHer] to cough it out and [bess.heShe] spills the beans.");
	
	output("\n\nFor punishment you get [bess.himHer] to turn on [bess.hisHer] pain sensors and present to you [bess.hisHer] bare bottom. [bess.HeShe] does so immediately, trembling a little, as you spank [bess.himHer] until [bess.hisHer] silver cheeks are sore and flushed. [bess.HisHer] ");
	if (bess.hasCock()) output("[bess.cockSimple] is erect");
	else if (bess.hasVagina()) output("girl juice leaks down [bess.hisHer] thighs");
	else output("face is flushed with arousal")
	output(" despite [bess.hisHer] cries of protest, wiggling [bess.hisHer] stinging [bess.ass] and whining the entire time.");
	
	output("\n\nYou tell [bess.himHer] [bess.heShe] can stand up again and [bess.name] rubs [bess.hisHer] sore rump, thanking you for punishing [bess.himHer]. Even after you’re finished [bess.heShe] lingers, rubbing [bess.hisHer] [bess.thighs] together and looking at you with a needy expression.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(12+rand(7));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime5():void
{
	clearOutput();
	bessHeader();

	output("Your " + bessLoverStatus() + ", [bess.name] decides to remind you who the boss is. [bess.HeShe] orders you to turn around and present your bare [pc.assLight]. You do so immediately, trembling a little, as [bess.heShe] spanks you <b>hard</b> until your buttcheeks are sore and flushed. You let out a little moan despite yourself, totally getting off on the abuse.");
	
	output("\n\nOnce [bess.heShe]’s finished you stand up and wriggle both because your rump is so sore and because you’re so turned on right now. You thank your " + bessLoverStatus() + " for punishing you and leave the room all hot and bothered.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(3+rand(3));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime6():void
{
	clearOutput();
	bessHeader();

	output("You decide to spend some quality time with [bess.name]. [bess.HeShe] kisses you " + bess.mf("slowly on the lips. It transforms into a long and passionate embrace.","sweetly on the lips, tiny little kisses of affection that soon blossom into a long and passionate embrace.");
	
	output("\n\nTime just seems to stop as you are in each other’s arms, lips locked together, " + bess.mf("his handsome musk","the faint smell of synth vanilla") + " tingling your nose. When you part [bess.heShe] gives you a " + bess.mf("deep, intense","dreamy") + " look, and strokes your cheek. <i>“");
	output(
		RandomInCollection(
			"I love you, " + bessPCName() + ".",
			"You know how much I love you, right?",
			"Could you be any more perfect?",
			"Your kisses always blow me away.",
			"I don’t think I could be any more in love with you, and then you make me fall for you that much more...",
			"You are my heartbeat, you know that?",
			"Can I keep you forever?",
			"Your kisses are intoxicating - they should be outlawed.",
		)
	);
	output("”</i>");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(8+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime7():void
{
	clearOutput();
	bessHeader();

	output("You spend some time with [bess.name]. [bess.HeShe] " + bess.mf("wraps his arms around you","leaps into your arms and wraps her legs around your waist") + ", grinning all the while as [bess.heShe] litters your face with kisses. <i>“");
	output(
		RandomInCollection(
			"Mine, all mine!",
			"I claim you in the name of [bess.name]!",
			"Your face is just too kissable!",
			"You came to spend time with me!",
			"I’m going to kiss you heaps to make up for lost time!"
		)
	);
	output("”</i>");

	output("\n\nYou " + bess.mf("push him on a nearby couch, and he laughs","dump her on a nearby couch and she squeals loudly") + ". You then leap on [bess.himHer] and return [bess.hisHer] assault, much to [bess.hisHer] delight. After a while of making out you both just lie there in each others arms.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	procesTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime8():void
{
	clearOutput();
	bessHeader();

	if (bessLoverStatus().indexOf("dom") == -1)
	{
		output("\n\nYou spend some time with your "+bessLoverStatus()+", [bess.name]. You hand [bess.hisHer] a bouquet of [bess.hisHer] favorite flowers you recieved via space delivery - white oriental lilies with pink roses - causing [bess.hisHer] to flush and give you a great big hug. [bess.HeShe] immediately finds a place in the ship where [bess.heShe] can put it to show them off.");

		output("\n\nShe then spends quite a while showing you exactly how appreciative [bess.heShe] is of them.");
	}
	else
	{
		output("\n\nYour "+bessLoverStatus()+", [bess.name] needs you to do something for her. [bess.HeShe] orders you to go out and get some of [bess.hisHer] favorite flowers - white oriental lilies with pink roses - so [bess.heShe] can put them around the ship. You go out of your way to get some via space delivery.  When you hand them over [bess.heShe] finds a place on the ship where they will be proudly displayed.");

		output("\n\n[bess.name] praises you for your hard work, causing you to flush.");
	}

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(20+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime9():void
{
	clearOutput();
	bessHeader();

	output("[bess.name], your Domme, decides to reward you for being a good sub. [bess.HeShe] pets your head and tells you that you’ve been very well behaved and that [bess.heShe] loves you. For your obedience [bess.heShe] gives you a nice meal - served on the floor, from a bowl with your name on it.");
	
	output("\n\nYou happily finish off the food you have been given as [bess.heShe] rubs a riding crop along your [pc.skinFurScalesNoun]. You make sure to clean the bowl thoroughly, but you still miss a spot - [bess.name] smacks you with the crop until you lick it up.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime10():void
{
	clearOutput();
	bessHeader();

	output("You spend some time with your "+bessLoverStatus()+", [bess.name]. You pat [bess.hisHer] head and tell [bess.himHer] [bess.heShe]’s been a good little sub, and that you love [bess.himHer]. As a reward you give [bess.himHer] a nice meal - served on the floor, from a bowl with [bess.hisHer] name on it.");
	
	output("\n\n[bess.name] happily finishes off the food you have provided while you rub a riding crop between [bess.hisHer] thighs. Even though [bess.heShe] tries to clean the bowl as thoroughly as possible [bess.heShe] still misses a spot  - you smack [bess.hisHer] rump with the crop until [bess.heShe] licks it up.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime11():void
{
	clearOutput();
	bessHeader();

	output("You decide to chill a bit with [bess.name]. You throw on a "+bessMovieGenre()+" movie and watch it while drinking some "+bessDrink()+" with her.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(100+rand(20));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime12():void
{
	clearOutput();
	bessHeader();

	output("You decide to chill a bit with [bess.name].  You sit back and relax listening to some "+bessMusic()+" with her, drinking some "+bessDrink()+" all the while.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(30+rand(15));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime13():void
{
	clearOutput();
	bessHeader();

	output("You sit down with [bess.name] to chat. [bess.HeShe] tells you all about ");
	output(
		RandomInCollection(
			"an adventure book",
			"a crime novel",
			"a history book",
			"a horror story",
			"a book on philosophy",
			"a sci-fi novel",
			"a romance novel",
			"a murder mystery novel",
			"a fantasy novel",
			"a biography",
			"an auto-biography",
			"a shojo manga",
			"a shonen manga",
			"a jousei manga",
			"a seinen manga",
			"a graphic novel",
			"a superhero comic",
			"a short story",
			"a historical fiction",
			"a poetry book",
			"an erotic fiction",
			"a steampunk novel",
			"a paranormal romance"
		)
	);
	output(" [bess.heShe] read recently, and how [bess.heShe]");
	output(
		RandomInCollection(
			"absolutely loved it and is going to add it to [bess.hisHer] collection",
			"really liked it and thinks you should read it too",
			"thought it was so-so and could have been written much better",
			"found it really bad and wouldn’t recommend it to anyone",
			"found it indescribably awful and threw it in the trash compactor"
		)
	);
	output(".");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime14():void
{
	clearOutput();
	bessHeader();

	output("\n\n[bess.name] comes looking for you. When [bess.heShe] finds you [bess.heShe] walks up and gives you a tight hug, telling you that you are [bess.hisHer] dearest friend. [bess.HeShe] doesn’t let go until you feel well and truly appreciated.");
	
	output("\n\n<i>“");
	output(
		RandomInCollection(
			"You make me brave, you know that?",
			"I’m so glad that we’re friends!",
			"I just wanted you to know how much I appreciate you!",
			"Hugs are the best, aren’t they? I can’t believe you organics don’t do it more often!",
			"Thank you for being my friend.",
			"I feel close to you emotionally, so I thought I’d get close to you physically! ... Wait, that came out wrong.",
			"I’m the luckiest synthetic in the whole galaxy!"
		)
	);
	output("”</i> [bess.name] tells you.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime15():void
{
	clearOutput();
	bessHeader();

	output("You spend some of your down time with [bess.name]. You make up a sport with odds and ends in the ship, as well as a set of rules, and go about trying to beat each other at it. At the end you get to declare yourself the galactic champion of the made up sport.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime16():void
{
	clearOutput();
	bessHeader();

	output("You decide to chill a bit with [bess.name]. You both sit down and play a ");
	output(
		RandomInCollection(
			"fighting",
			"strategy",
			"platformer",
			"role-playing",
			"shooter",
			"adventure",
			"simulation",
			"sports",
			"racing",
			"puzzle",
			"board",
			"chess",
			"ping-pong",
			"stealth"
		)
	);
	output(" game on your holo-rig, trying to thrash each other at it. [bess.name] is ");
	output(
		RandomInCollection(
			"incredibly good",
			"quite good",
			"decent",
			"really bad",
			"incredibly bad"
		)
	);
	output(" at it. You both have a blast.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime17():void
{
	clearOutput();
	bessHeader();

	output("You decide to chill a bit with [bess.name]. You both sit down and watch a ");
	output(
		RandomInCollection(
			"mind-blowingly awesome TV show. You both gush about how awesome it is",
			"great TV show that has some fantastic hooks. You both thoroughly enjoy it",
			"pretty average TV show. You both remark on its pros and cons",
			"pretty awful TV show. You both pick it apart",
			"show that is so bad, it’s good. You critique the show at length"
		)
	);
	output(" as you continue to watch it together.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(20+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime18():void
{
	clearOutput();
	bessHeader();

	output("You sit and talk to [bess.name]. You chat about what has been going on lately and [bess.heShe] hangs on every word.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime19():void
{
	clearOutput();
	bessHeader();

	output("You spend some time with [bess.name]. There are small but critical errors around the ship and you get [bess.himHer] to help you fix them up. Once you’re done the ship is running that much better.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(20+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime20():void
{
	clearOutput();
	bessHeader();

	output("You spend some time with [bess.name]. [bess.HeShe] spends a lot of time explaining to you about the latest JoyCo products, encouraging you to buy them as soon as you are physically able.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime21():void
{
	clearOutput();
	bessHeader();

	output("You sit down with [bess.name] to chat. [bess.HeShe] talks to you about the exact process your body goes through when you orgasm, skipping no details. For some reason it still sounds hot even when [bess.heShe] reduces it to science.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime22():void
{
	clearOutput();
	bessHeader();

	output("You spend some time chatting with [bess.name]. [bess.HeShe] informs you of [bess.hisHer] current condition and also tells you that [bess.heShe] is perfectly capable of providing sexual relief whenever you need it in a multitude of positions. [bess.HeShe] goes on to detail [bess.heShe] sex act called ");
	output(
		RandomInCollection(
			"the ‘flaming horndog’",
			"the ‘farmer’s wheel’",
			"the ‘horny frogger’",
			"the ‘spaghetti slideshow’",
			"the ‘medusan cascade’",
			"‘crouching for credits’",
			"‘flipping the pink’",
			"‘rubber flubbing’",
			"‘TPTA’"
		)
	);
	output(".");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(5+rand(3));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime23():void
{
	clearOutput();
	bessHeader();

	output("You sit down with [bess.name] to talk.  [bess.HeShe] explains how [bess.hisHer] research into making the universe a happier place is going. You listen to [bess.hisHer] thoughts and conclusions, occasionally giving [bess.himHer] some advice on what to try next.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime24():void
{
	clearOutput();
	bessHeader();

	output("You decide to spend some time with [bess.name]. [bess.HeShe] spends a great deal of time talking about the ");
	output(
		RandomInCollection(
			"movies [bess.heShe]’s watched",
			"holos [bess.heShe]’s read",
			"shows [bess.heShe]’s watched",
			"music [bess.heShe]’s listened to"
		)
	);
	output(" lately and how [bess.heShe] ");
	output(
		RandomInCollection(
			"loved it and is adding it to [bess.hisHer] collection",
			"really, really liked it",
			"thought it was pretty average",
			"found it really bad",
			"positively awful and wants [bess.hisHer] time back"
		)
	);
	output(". You spend some time talking with [bess.himHer] about it.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime25():void
{
	clearOutput();
	bessHeader();

	output("You decide to spend some time with [bess.name]. [bess.HeShe] spends a great deal of time talking about the ");
	output(
		RandomInCollection(
			"articles [bess.heShe] has read",
			"news [bess.heShe] has watched"
		)
	);
	output(" lately and how [bess.heShe] found the subject matter ");
	output(
		RandomInCollection(
			"really sad",
			"hilarious",
			"quite infuriating",
			"a little silly",
			"thought-provoking",
			"mind-numbing",
			"perplexing",
			"awe-inspiring",
			"quite worrying"
		)
	);
	output(". You spend some time talking with [bess.himHer] about it.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime26():void
{
	clearOutput();
	bessHeader();

	output("You sit down with [bess.name] to chat. You talk to [bess.himHer] about your journey and why you’re on it. [bess.HeShe] seems touched by the fact you are sharing this information with [bess.himHer] and listens to you speak in reverent silence.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime27():void
{
	clearOutput();
	bessHeader();

	output("You spend some time with [bess.name]. You talk to [bess.himHer] about your uncle, Maximillian, and your cousin slash rival. [bess.HeShe] seems touched by the fact you are sharing this information with [bess.himHer] and listens to you speak in reverent silence.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSpendTime28():void
{
	clearOutput();
	bessHeader();

	output("You sit down with [bess.name] to talk. You ask [bess.hisHer] simple questions about [bess.himHer]self and [bess.heShe] eagerly responds, quite happy to give you [bess.hisHer] full specs in every single detail. By the time you’ve both finished talking you know ");
	output(
		RandomInCollection(
			"the exact size of [bess.hisHer] brain",
			"how much meld-milk [bess.heShe] can store",
			"her body weight",
			"exactly how [bess.hisHer] skeleton was made",
			"how many lines of code [bess.heShe] has",
			"the names of [bess.hisHer] programming team",
			"how many gallons of cum [bess.heShe] can swallow",
			"the largest object [bess.heShe] can fit inside [bess.himHer]self",
			"how [bess.hisHer] skin was made",
			)
	);
	output(".");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function talkToBessAboutBess():void
{
	var availableMessages:Array = [];

	if (flags["BESS_LOVER"] == undefined && flags["BESS_FRIEND"] == undefined)
	{
		availableMessages.push(aboutBess1, aboutBess2, aboutBess3);
	}

	availableMessages.push(aboutBess4, aboutBess5, aboutBess6, aboutBess8);

	RandomInCollection(availableMessages)();
}

public function aboutBess1():void
{
	clearOutput();
	bessHeader();

	output("You question [bess.name] about [bess.hisHer] past before you discovered her, though your query seems to confuse [bess.himHer].");
	
	output("\n\n<i>“Before you activated me I was built at a JoyCo factory on Panara, "+bessPCName()+". Unplugging the power coupling and seeing you are the the first memories I have.”</i>");
	
	output("\n\nIt seems when [bess.heShe] rebooted, [bess.hisHer] entire memory was wiped, including how [bess.heShe] ended up on the planet in the first place. You decide to ask [bess.himHer] when [bess.heShe] was issued from the JoyCo factory.");
	
	output("\n\n[bess.name] informs you that [bess.heShe] was issued to you a week before you activated [bess.himHer], but when you ask [bess.himHer] the date [bess.heShe] gives you the wrong year. [bess.HeShe] seems to be laboring under the assumption that it is eleven years ago. It seems [bess.name] has at least that many years of prior ownership wiped from [bess.hisHer] memory.");
	
	output("\n\nTelling [bess.himHer] is only going to make [bess.himHer] confused so you instruct [bess.himHer] to update [bess.hisHer] internal clock to the correct year. [bess.name] doesn’t ask questions and obediently complies with your request.");

	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function aboutBess2():void
{
	clearOutput();
	bessHeader();

	output("You decide to ask [bess.name] about [bess.hisHer] construction on Panara and how [bess.heShe] remembers being built if [bess.heShe] has no memories before you activated [bess.himHer].");
	
	output("\n\n<i>“That’s simple, "+ bessPCName() +". I have information stored inside of me before activation in order to provide optimal service delivery,”</i> [bess.HeShe] diligently informs you.");
	
	output("\n\n<i>“Information about JoyCo, Panara, my product line and other JoyCo products you may benefit from are all uploaded into my core memory banks.”</i>");
	
	output("\n\nIt seems if you want to know more about JoyCo or Panara you can ask her, since this information was stored along with [bess.hisHer] core programming.");

	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function aboutBess3():void
{
	clearOutput();
	bessHeader();

	output("You float the idea that if [bess.name] hypothetically formatted [bess.hisHer] own memory, what would be the best way to go about restoring it.");
	
	output("\n\n<i>“The best way to restore corrupted or lost memory data is to return me to the factory on Panara. However, JoyCo would most likely send you a replacement rather than restore that data unless you were quite forceful about it.”</i> [bess.name] informs you matter-of-factly. <i>“JoyCo prefers to replace severely dysfunctional units rather than fix them as it is more financially viable.”</i>");
	
	output("\n\n<i>“The other way is to find someone capable of patching together fragments of the deleted memory and performing data recovery. However that person would have to be quite skilled and familiar with JoyCo software protection measures.”</i>");
	
	output("\n\n<i>“Other than that there are no other methods that come to mind. It’s a good thing that I am not suffering from data loss!”</i>");

	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function aboutBess4():void
{
	clearOutput();
	bessHeader();

	output("When you ask about Panara, [bess.name] seems to become quite energized. It seems [bess.heShe] enjoys talking about [bess.hisHer] ‘home planet’.");
	
	output("\n\n<i>“Panara is a small planet located in the Lagoon Nebulae, nestled between three very wealthy solar systems. Since these systems have a high demand for JoyCo products, a JoyCo factory was set up on Panara in order to meet their needs. Needless to say, it is also where I was constructed.”</i>");
	
	output("\n\n<i>“The planet circles a red dwarf star and is rather cool but livable, experiencing low seasonal growth and perpetual winter climes. Because of this it is perfect for large industrial facilities to be built far away from urban centers.”</i>");
	
	output("\n\n<i>“Most of the denizens of Panara are employees of JoyCo and their families. There are a few factories owned by competitors, but JoyCo has the largest facilities on the planet. Panara has no sentient indigenous species. Those that do move there are either human or ausar.”</i>");
	
	output("\n\n<i>“The ausar there have thick fur and work outside more than the human populace. There are just as many synthetics working the factories on Panara as organics, though some consider synthetics building synthetics as perverse.”</i>");
	
	output("\n\n<i>“Someday I would very much like to show you Panara, "+ bessPCName() +". The JoyCo factory there is a marvel to behold, and there are sure to be many products worth your while.”</i>");

	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function aboutBess5():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] " + bess.mf("mock gasps","mockes blush") + ", and holds a hand over [bess.hisHer] mouth. <i>“You want me to reveal something so personal, "+ bessPCName() +"?”</i> It seems like [bess.heShe]'s trying to wind you up.");

	output("\n\n<i>“My body is made of a substance called FlexMetal, a patented creation exclusive to JoyCo. Softer than organic flesh and ten times more flexible, it allows me to change my form in many ways.”</i>");

	output("\n\n<i>“My insides are mostly comprised of a liquid substance called MeldMilk. It is a partially synthetic compound that can be altered internally to serve a variety of uses, including transforming into imitation bodily fluids such as semen, milk or saliva. This takes place by several clever chemical reactions, much like internal fermentation.”</i>");

	output("\n\n<i>“The rest of my body is comprised of cabling and a duraframe shell, much like most JoyCo assist-bots. As you already know, "+ bessPCName() +", I have a rear-action power coupling to charge my internal batteries.”</i>");

	output("\n\n<i>“What you may not know is that I have several ports designed for additional aftermarket attachments. My model line was designed to be highly customizable, so there are a lot of them available on the extranet.”</i>");

	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function aboutBess6():void
{
	clearOutput();
	bessHeader();

	output("You ask [bess.name] about [bess.hisHer] processor and what kind of AI [bess.heShe] is exactly. The synthetic seems perfectly happy to talk about it.");
	
	output("\n\n<i>“My AI processor is a JoyCo 850SX-13 model produced by Panara Labs. I am what you would call a ‘coded’ or ‘artificial’ AI with baseline empathy modules and inputs designed similarly to human emotions. I know ‘artificial AI’ is a tautology, but that’s what they call us!”</i>");
	
	output("\n\n<i>“I was built this way to allow me to sympathise with organic life forms and therefore offer them better comfort - primarily in the form of sexual relief. When engaging in contact with or thinking about other life-forms, mirror signals in my brain go off and allow me to put myself in that person’s place mentally. This is exactly what happens in the human brain except I do it on a digital level.”</i>");
	
	output("\n\nYou ask why JoyCo decided to use an AI instead of a VI for a sex-bot. <i>“Probably because a VI is very bad at faking an orgasm.”</i> It sounds like a quip, but apparently it’s the truth from [bess.hisHer] expression. <i>“... Not that I </i>do<i> fake orgasms - my pleasure feedback sensors are set too high for that - but VI’s are terrible at reading what their end user wants.”</i> [bess.HeShe] sounds more than a little haughty. <i>“... I mean, unless you’re into non-tailored sexual relief.”</i>");

	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function aboutBess7():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_LOVER"] == undefined)
	{
		output("You ask [bess.name] about [bess.hisHer] service life span. While talking about death is an uncomfortable topic for organics, speaking about it doesn't seem to bother [bess.himHer] in the least.");
	}
	else
	{
		output("You ask [bess.name] about [bess.hisHer] service life span. [bess.HeShe] seems to be a little sad talking about the topic, since clearly the idea of potentially outliving you is a depressing one.");
	}

	output("\n\n<i>“My service life - how long JoyCo honors my warranty - is far shorter than my predicted life span or the estimated time until I stop working altogether.”</i> [bess.HeShe] informs you. <i>“My body is mostly made of FlexMetal and it takes a very long time to break down. My AI processor is also very resilient. My service life is one hundred years and my predicted life span is three to four hundred.”</i>");

	output("\n\n<i>“Usually JoyCo offers a discounted upgrade for turning old models in, so not many units make it to the end of their predicted life span. They are usually melted down for scrap, especially the expensive models like me who are made out of rare minerals.”</i>");

	if (flags["BESS_LOVER"] != undefined)
	{
		output("\n\n[bess.name] holds your hands in [bess.hisHer] own and looks up at you. <i>“If... if by some chance it looks like I am going to outlive you, I have chosen to deactivate myself and overload my processor. This way I can die at the exact same time as you do. I... I don't want to continue functioning in a world without you, "+ bessPCName() +".”</i>");
	}

	if (flags["BESS_FRIEND"] != undefined)
	{
		output("\n\n[bess.name] pauses and looks at you with a worried expression. <i>“Hey, uh... buddies don't melt each other down for scrap, right? I’m pretty sure that’s in the unofficial friend rulebook. Can you forget that I told you that you can melt me down and sell my remains for a lot of cash?”</i>");
	}
	else
	{
		output("\n\n[bess.name] smiles and seems completely undaunted by this prospect. <i>“If you do live to see your hundredth birthday, I would recommend melting me down for a discount. I'm sure a far superior model of AI will be out by that time, and I'd hate to see you receive sub-par service.”</i>");
	}

	processTime(15+rand(10));

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function aboutBess8():void
{
	clearOutput();
	bessHeader();

	output("You ask [bess.name] about [bess.hisHer] internal MeldMilk supply, and what exactly it is made out of. After all, it seems [bess.heShe] does most of the replenishing [bess.himHer]self - it’s mostly autonomous.");
	
	output("\n\n[bess.name] grins and seems happy to tell you about this aspect of [bess.himHer]self. <i>“Well, I can tell you a fair bit, but the exact recipe is a patented JoyCo secret, okay?”</i>");
	
	output("\n\n<i>“It’s a semi-synthetic substance that can be manipulated by internal changes to my biology. Simply put, I can ‘brew’ it and filter it into parts of my body as needed, turning it from one substance to another.”</i>");
	
	output("\n\n’Semi’ synthetic substance? You ask [bess.himHer] if this means the other half is organic.");
	
	output("\n\n<i>“Well, yes. MeldMilk is made by breaking down organic matter and transforming it into a partially synthetic polymer, so that it contains the desirable properties of both. That way it has longevity without sacrificing the ability to self-replicate.”</i>");
	
	output("\n\n<i>“When needed, I can return MeldMilk back to organic matter, though one entirely different from the original substance. That’s how I’m able to produce realistic body fluids such as semen, milk, or saliva.");
	
	output("\n\n<i>“It’s actually a pretty complicated process trying to make an organic stand-in. Some companies that shall not be named just use silicone and just expect consumers to endure a sub-par product.”</i> [bess.name] " + bess.mf("huffs","pouts") + ",");
	// 9999
	if (met gianna || ???)
	{
		output(" clearly referring to");
		if (met gianna) output(" Gianna");
		if (met gianna && ???) output(" and");
		if (???) output(" KihaCorp");
		output(".");
	}
	
	output("\n\nYou ask [bess.himHer] if there are any limits to the substances [bess.heShe] can make. After all, if you need starship fuel, will [bess.heShe] be able to produce it?");
	
	output("\n\nAs expected, [bess.name] shakes [bess.hisHer] head. <i>“There’s limits to the complexity of what I can produce. The base substance is very similar to semen, and I can only produce an array of body-fluid like substances that fall into that range.</i>");
	
	output("\n\n<i>“I’m not all that different from you in that respect - after all, it’s not like </i>you<i> can’t produce this stuff given the circumstances just by eating and drinking. You’re pretty amazing!”</i> [bess.name] exclaims, clearly amazed by how you can produce saliva and sweat at the same time as a basic function.");
	
	output("\n\n<i>“That said, I </i>can>i> get low on MeldMilk. When that happens, the best thing I can do is consume a similar substance. That usually isn’t so hard considering what I’m built for.");
	
	output("\n\n<i>“In the worst case scenario I can transform tap water into MeldMilk at a processing hit. It creates sub-par MeldMilk, but it makes do in a pinch. After all, you organics are usually 70 percent water.");
	if (pc.hasCock()) output(" I much prefer your semen, though.");
	else if (pc.hasVagina()) output(" I much prefer your girl cum, though.");
	output("”</i>");
	
	output("\n\nThat explains why you haven’t had to purchase any more for [bess.himHer], at least. Good to know you don’t have to fork out any money for it. You had noticed [bess.himHer] drinking bottles of MeldMilk, though. What’s with that?");
	
	output("\n\n<i>“Oh, that? When I’ve got excess, I store it in bottles for quick consumption. That way I’m never short. Clever, huh? It was my designer’s idea.”</i> [bess.name] boasts, happy to extol JoyCo at any chance [bess.heShe] gets.");

	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function talkToBessAboutPC():void
{
	clearOutput();
	bessHeader();

	output("You ask [bess.name] what [bess.heShe] thinks about you. [bess.HeShe] seems to have no trouble telling you exactly what [bess.heShe] thinks of [pc.fullName].");

	if (flags["BESS_LOVER"] != undefined)
	{
		output("\n\n<i>“What do I think about you, "+bessPCName()+"? I love and adore you with all of my heart, and " + bess.mf("you’re my wonderful "+bessLoverRole() + "!", "I’m glad that you chose me to be your "+bessLoverRole() + ".");
		output("”</i>");

		if (bessAffection() >= 90)
		{
			output("\n\n<i>“I think you are wonderful " + bess.mf(", and the light of my life", ", and treat me like a princess") + "! Even though I spend so much time with you, I feel like I can never get enough.”</i> The silver skinned synthetic wraps [bess.hisHer] arms around your waist. <i>“I know some people would say we’re always in each other’s arms, but I don’t care one bit!”</i>");
		}
		else if (bessAffection() >= 70)
		{
			output("\n\n<i>“I think you are wonderful " + bess.mf(", and the light of my life", ", and treat me like a princess") + ". You make my life complete in so many ways, and I’m glad you can always find time to spend with me and make me feel special.”</i>");
		}
		else if (bessAffection() >= 50)
		{
			output("\n\n<i>“I love every moment we spend together, but lately I feel like we’re not seeing each other enough. I know you’ve got things to do but I feel like you’re always somewhere else. I’ve been getting pretty lonely lately.”</i>");
		}
		else if (bessAffection() >= 30)
		{
			output("\n\n<i>“I feel like we’ve really drifted apart. You never come and visit me anymore and when you do you’re not really </i>here<i>. Is it something I’ve done wrong, or something I said?”</i>");
		}
		else
		{
			output("\n\n<i>“... I... I feel like we’re not even a couple anymore. You’re so incredibly distant that it feels like you’re a dream that never happened. Sometimes I cry myself to sleep thinking about how we could have become like this... do you even love me anymore?”</i>");
		}

		if (bessIsSleepCompanion())
		{
			output("\n\n<i>“It makes me happier than you could ever know that we wake up beside each other every morning. Seeing you as I boot up is like seeing the sunrise every morning - you fill my life with light.”</i>");
		}
		else
		{
			output("\n\n<i>“... I wish we slept together instead of me always having to go back to my room. It gets lonely in there by myself.”</i>");
		}
	}
	else if (flags["BESS_IS_FRIEND"] != undefined)
	{
		output("\n\n<i>“What do I think about you, "+ bessPCName() +"? You’re my first and very best friend, that’s what! I can’t say enough good things about you.”</i>");

		if (bessAffection() >= 90)
		{
			output("\n\n<i>“We’re so damn close and spend so much time together, it’s amazing! Hanging out with you is my favorite thing to do, so I love that we do it so often.”</i> The silver skinned synthetic gives you a tight hug. <i>“Thank you for finding so much time to spend with me.”</i>");
		}
		else if (bessAffection() >= 50)
		{
			output("\n\n<i>“I love hanging out with you and I love that you find the time to spend with me so often. When I’m with you it’s like my whole day is better for it, no matter what else happens.”</i>");
		}
		else if (bessAffection() >= 25)
		{
			output("\n\n<i>“We’ve been spending time together, but I feel like we’re drifting apart. I don’t know, you seem kind of distant. Is something on your mind, or is it something I did or said?”</i>");
		}
		else if (bessAffection() >= 10)
		{
			output("\n\n<i>“... That said, I--I kind of feel like we’ve drifted apart. We’re still friends, right? It feels like I hardly see you anymore, and when I do you’re right out the door. Things have been getting really lonely around here...”</i>");
		}
		else
		{
			output("\n\n<i>“... That said, I--I kind of wonder if we are still friends? We never hang out, it’s as if we’re strangers... or worse. Did... did I do something wrong? Did I offend you somehow?”</i>");
		}
	}
	else
	{
		output("\n\n<i>“What do I think about you, "+bessPCName()+"? When I watch you sometimes I wonder if you’re an organic at all, or if you really are made of Steele!”</i>");

		if (bessAffection() >= 90)
		{
			output("\n\n<i>“I’m humbled... beyond humbled, positively </i>dumbfounded<i> that you spend so much time with a lowly synthetic like me.”</i> The ");
			if (bess.hairLength > 0) output(" [bess.hairColor] haired");
			output(" sex-bot bows to you.");
		}
		else if (bessAffection() >= 25)
		{
			output("\n\n<i>“I’m incredibly humbled that you spend time with a synthetic like me... sometimes I wonder what I’m doing to deserve this much wonderful attention.”</i>");
		}
		else if (bessAffection() >= 10)
		{
			output("\n\n<i>“I’m so glad that you take time out to spend with me. I hope that the service I am providing you is satisfactory?”</i>");
		}
		else
		{
			output("\n\n<i>“You’re my owner, so you are free to use me as you wish. I constantly worry that you are not getting enough sexual relief.”</i>");
		}
	}

	// Brackets are bessVocal 0 to 5. Should only show up if PC has watched scene 18 (Kareoke scene).
	if (flags["BESS_EVENT_6"] != undefined)
	{
		output("\n\n<i>“I know you like drinking "+bessDrink()+", the color "+bessColor()+", ");
		if (bessMusic() != "any") output(bessMusic());
		else output("any kind of music");
		output(" and "+bessMovieGenre()+" movies.");

		if (flags["BESS_EVENT_18"] != undefined)
		{
			var vResponse:Array = [
				"Your singing voice doesn’t sound like a stray cat in heat falling down a thermal vent, I-I swear!",
				"Your singing ability is uh, kind of below the galactic average.",
				"Your singing ability is around the galactic average!",
				"You are a really good singer!",
				"You are a fantastic singer!",
				"Listening to you sing is like having an orgasm through my ears."
			];
			output(vResponse[bessVocalSkill()] + "”</i>");
		}
	}

	processTime(5+rand(3));

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function talkToBessAboutJoyco():void
{
	clearOutput();
	bessHeader();

	// Option does not show up just yet after Approach Scene 28
	if (flags["BESS_EVENT_28"] == undefined)
	{
		output("Talking about JoyCo seems to be something [bess.heShe] enjoys quite immensely. [bess.name] seems to become quite animated at your question as [bess.heShe] positively rushes to answer it.");
		
		output("\n\n<i>“JoyCo is the most wondrous corporation in galactic existence, "+bessPCName()+"! Not only did it create my product line, it helps the poor and sick across the known universe with its outpost hospitals and top of the line medicines!”</i>");
		
		output("\n\n<i>“No other organization does as much for the needy. Of course JoyCo’s competitors will claim it is for a cut of future exports from developing planets, but JoyCo’s mission is to heal and tend to the known galaxy. Finances are of course needed to make that happen.”</i>");
		
		output("\n\nWhen you ask about JoyCo’s competitors, [bess.name] screws up [bess.hisHer] nose as if talking about something unpleasant. <i>“JoyCo’s biggest current competitor is KihaCorp with its mainstream AI designs and cut-throat business practices.”</i>");
		
		output("\n\n<i>“Where JoyCo specializes in targeted consumer needs, KihaCorp creates cheap inferior technology at low prices to flood the market. It wants to have a monopoly on the AI market, including JoyCo’s medical assist-bot line!”</i>");
		
		output("\n\nIt’s clear that [bess.name] has been programmed with a fierce loyalty to JoyCo and a rather scathing opinion of its competitors.");
	}

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function talkToBessGetInfoOnNipnips():void
{
	clearOutput();
	bessHeader();

	output("You bring up the topic of [bess.name]’s nipples. Specifically, you’ve noticed that they seem unusually sensitive.");

	output("\n\n[bess.name] coughs and turns [bess.hisHer] head slightly to the side, surprisingly bashful about the subject. <i>“O-oh, those? I don’t think they are </i>that<i> sensitive. Do you..?</i>");
	
	output("\n\nConsidering [bess.heShe] almost melts into a puddle every time you touch [bess.hisHer] areolae, you nod. They’re pretty sensitive!");
	
	output("\n\nSince it doesn’t seem like you’re going to let it go, [bess.name] looks at you with apologetic eyes. <i>“... Well, truth be told, I’ve got a bug. Or at least, I think I do. I can’t turn the sensitivity settings of my nipples down.”</i>");
	
	output("\n\nYou ask how long [bess.heShe’]s had this particular quirk, and exactly <i>how</i> sensitive they are.");
	
	output("\n\n<i>“U-um... three times higher than human normal. Since I don’t have pain receptors active in them, only the pleasure sensors give feedback.”</i> [bess.name]’s cheeks flush. No wonder [bess.heShe] looks like [bess.heShe]’s going to " + bess.mf("cum", "cream herself") + " every time you touch [bess.hisHer] nipples!");
	
	output("\n\n<i>“What I can’t believe is that I came with this issue straight after being shipped to you. Having this kind of glitch on arrival is just plain </i>embarassing<i>, let alone what it does to consumer confidence.”</i>");

	processTime(5+rand(3));

	clearMenu();
	addButton(0, "Lower", talkToBessNipSenseDown);
	addButton(1, "Increase", talkToBessNipSenseToMaximumEngage);
	addButton(14, "Back", talkToBessAboutThings);
}

public function talkToBessNipSenseDown():void
{
	clearOutput();
	bessHeader();

	output("You ask [bess.name] if there’s any way to lower it, and [bess.name] shakes [bess.hisHer] head.");
	
	output("\n\n<i>“Not that I know of so far. JoyCo doesn’t seem to have released a patch for my model, which is really odd. Maybe it’s in the works? I’ve tried to tweak it myself, but I’m having no luck.</i> [bess.HeShe sighs].");
	
	output("\n\n<i>“It’s not all that bad, I just have to be </i>really<i> careful when brushing things against them. Otherwise I need a change of underwear. They’re just that sensitive!”</i> [bess.name] groans, sounding both delighted <i>and</i> irritated by her ‘problem’.");

	processTime(3);

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function talkToBessNipSenseToMaximumEngage():void
{
	clearOutput();
	bessHeader();

	output("You ask [bess.name] if there’s any way to increase it. [bess.name]’s face looks utterly incredulous.");
	
	output("\n\n<i>“I-I-increasing it?”</i> [bess.name] stammers; clearly this thought never even crossed [bess.hisHer] mind. <i>“I have enough trouble now needing a change of underwear every time my nipples get touched!”</i>");
	
	output("\n\nAfter [bess.heShe] calms down, [bess.heShe] looks down at [bess.hisHer] [bess.nipples]. <i>“... I could </i>try<i> tweaking it that way, but I’d have to play with my own settings a bit. Give it some time and come back to me, okay?”</i>");

	processTime(3);

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function talkToBessAboutHerJob():void
{
	clearOutput();
	bessHeader();

	output("\n\nYou ask [bess.himHer] how [bess.hisHer] job as the Ship’s "+ bessCrewRole() +" is going. As usual [bess.heShe]’s " + bess.mf("happy","excited") + " to tell you all about it.");

	if (bessCrewRole() == BESS_CREWROLE_INTOFFICER)
	{
		output("\n\n<i>“Things are going great, "+ bessPCName() +"! I just "); 
		output(
			RandomInCollection(
				"dug up some info on this system’s planetary biology",
				"found out about some of the dangerous life-forms in this star system",
				"brought our star charts completely up to date",
				"scouted out the planetary terrain in this solar system",
				"did some research into known pirate hot-spots in this solar system",
				"checked out the UTC presence in this solar system"
			)
		);
		output(", I hope the info I gathered will be of use to you!”</i>");
	}
	else if (bessCrewRole() == BESS_CREWROLE_ACCOUNTANT)
	{
		output("\n\n<i>“Things are going great, "+ bessPCName() +"! I’ve just been figuring out ");
		output(
			RandomInCollection(
				"how to save us money on starship fuel",
				"how to save money on food procurement",
				"where we can get cheap clean water in this system",
				"our spending for this month",
				"a way to save on our extranet account",
				"how much ammo you need this month, and what kinds",
				"our starship’s shield efficiency rate."
			)
		);
		output(". Hopefully I’ll be able to save us some credits.”</i>");
	}
	else if (bessCrewRole() == BESS_CREWROLE_ARCHIVIST)
	{
		output("\n\n<i>“Things are going great, "+ bessPCName() +"! I’ve just been ");
		output(
			RandomInCollection(
				"putting some new holos in the shelves",
				"putting some new books on the shelves",
				"getting some new games in",
				"restocking the ship’s holo pornography",
				"replacing the ship’s magazines",
				"updating the ship’s logs",
				"sorting out our credentials and documentation"
			)
		);
		output(".”</i>");
	}
	else if (bessCrewRole() == BESS_CREWROLE_STEWARDESS)
	{
		output("\n\n<i>“Things are going great, "+ bessPCName() +"! I’ve just been ");
		output(
			RandomInCollection(
				"vacuuming the ship’s hallways",
				"changing the bedding in all the rooms",
				"putting air fresheners about the ship",
				"dusting the entire ship",
				"refilling the galley fridge",
				"washing all the dishes piled up in the galley",
				"throwing all of our trash in the compactor",
				"making sure all the ship’s windows are spotless"
			)
		);
		output(". I think the ship is a little bit cleaner now!”</i>");
	}
	else if (bessCrewRole() == BESS_CREWROLE_TECHNICIAN)
	{
		output("\n\n<i>“Things are going great, "+ bessPCName() +"! I’ve just been ");
		output(
			RandomInCollection(
				"working on Spidey. I’m hoping to have him up and running soon!",
				"adjusting the output of your [pc.shield]. It should be more efficient now!",
				"fixing up the ship. There were a few parts that needed replacing.",
				"fixing up the ship’s water recycling system. It’s been playing up again.",
				"recalibrating the ship’s engines - they were making that high pitched noise again."
			)
		);
		output("”</i>");
	}

	processTime(10+rand(3));

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function talkToBessPlayGraviball():void
{
	clearOutput();
	bessHeader();

	// Requires a Holo-room. Does not require bess once activated. Accessed through Holo-room or through Bess Menu (Either or)

	output("You decide you’d like to play a game of Graviball on the holo room using the program that [bess.name] whipped up.");
	if (crew(true) == 2) output(" <i>“You decide to go grab the only other crewmember on the ship to see if they’d be up for a game.”</i>");
	else if (crew(true) >= 3) output(" <i>“You decide to go grab your other crewmembers to see if they’d be up for a game.”</i>");

// Different NPC reactions on being asked.

	output("<i>“You want to play Graviball, [bess.name]?”</i> [bess.name]’s eyes shine with delight. <i> “Let’s do it!”</i>");

	output("\n\nThe");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	else output(" silver headed");
	output(" synthetic runs off and comes back in a modified white and navy blue Graviball outfit designed loosely to resemble that of the Stallium Knights. [bess.HisHer] outfit consists of a sexy, tight short sleeve sports top, a pair of dark short shorts and a pair of sports sneakers. When did [bess.heShe] buy it--?");

	if (celiseIsCrew())
	{
		output("\n\nCelise is more than happy to join in on a game of Graviball, though [bess.heShe] seems to have ulterior motives. <i>“How about the winner gets a nice big supply of protein--?”</i> She slyly suggests, her emerald green body sloshing about.");

		output("\n\nYou tell Celise that you’re playing for fun and exercise causing the galotian to pout, crossing her arms and causing her massive gooey mammaries to push out.");

		output("\n\n<i>“Well, you never know which way the game might turn...”</i> She cryptically gives her assent, eyeing you off with a saucy look in her eyes. You’re definitely going to have to watch your back during the game - seems Celise is on the hunt!");
	}

	output("\n\nHeading to the holodeck you enter the room and activate the Graviball simulation. In the blink of an eye you are standing in a galactic class sports stadium with billions of fans of almost every conceivable species cheering around you. The atmosphere is so authentic you can’t help but feel momentarily taken aback - [bess.name] really went all out putting together this simulation.");
	
	output("\n\nYour "+bessColor()+" team banners fly high, a nice touch from the synthetic sports fan. Your team, the Steele Tigers, is playing against ");
	if (crew(true) == 1) output(" a randomly generated opposing team.");
	else if (crew(true) == 2) output(" your other crewmate and a computer generated team for them to play with.");
	else output(" the rest of the crew and a computer generated team to play with.");
	output(" Of course you have your own allies to play with - you selected them personally before the match and now you feel you have the perfect team.");
	
	output("\n\nThe program has provided you with league issue pulse gear needed to play the game. Your [pc.feetNoun] and hands are outfitted with special gloves and boots that allow you to jump incredibly high, fly through the air and kick the z-g ball (or opponents) away at incredible speeds. It also allows you to easily catch fast flying balls just like a high-tech catching mitt.");
	
	output("\n\nOn either side of the stadium are two hovering circular nets suspended twenty feet above the ground, manned by a goalie constantly using their pulse boots to stay afloat. The entire ring lights up with an incredible fanfare when a goal is scored.");
	
	output("\n\nEight floating platforms exist across the length of the arena. There are three on either side, each in a V shaped pattern with the point of each facing the nearby goal. In the middle of these two wedges, is another platform where the game is started. Thirty feet above this and higher than the rest is the final platform.");
	
	output("\n\nGraviball is a truly three-dimensional sport with teams manning each of the platforms, kicking off the bottom or the top and bouncing the z-g ball about like a pinball machine. Good players know exactly how to get past a blocking opponent by kicking up into a floating platform and having it rebound towards their team-mates, making the game far more interesting to watch.");

	processTime(5+rand(5));

	clearMenu();
	addButton(0, "Next", talkToBessPlayGraviballII);
}

public function talkToBessPlayGraviballII():void
{
	clearOutput();
	bessHeader();
	// 9999 these stat checks are terrible

	output("The game starts with you in the center position and standing on the largest hover platform. The z-g ball falls from above and you’re leaping up to smack it away from your opponent,");
	if (rand(pc.RQ()) >= 25) output(" easily able to jump up in time and hit it out of his grasp");
	else output(" but your reflexes aren’t sharp enough and your opponent bats it away");
	output(" and to a fellow team-mate. The game is just beginning and you follow the ball, soaring through the air as your pulse boots take you from platform to platform.");
	
	output("\n\nAs the game goes on you’re on the middle platform on your opponent’s side right in front of their goal. Suddenly someone kicks up the z-g ball from the ground below, but before you even move towards it you’re about to be tackled by a strong looking point guard.");
	if (rand(pc.PQ()) >= 25) output(" As he tackles you, you easily break free of his grip and drive your palm against his chest - your pulse glove sends him flying off the platform leaving you free to grab the ball. You punch it with your powered fist at a nearby forward who then promptly scores a goal.");
	else output(" As he tackles you, you simply can’t break free and the ball goes to an opposing player. You’re cursing all the while until he lets go of you and moves off to tackle another player.");
	
	output("\n\nLater in the game you find yourself up the front as you realise everyone’s too busy defending against the opposing team, who have suddenly launched a strong offensive. Your gamble pays off when one of your team-mates suddenly kicks it clear across the field, bouncing it off the bottom of the top platform as it rebounds towards your position.");
	if (rand(pc.AQ() >= 25) output(" Ready and waiting to take the shot you kick the z-g ball and send it hurtling towards the goals with a slight curve, catching the goalie by surprise as you nail it right in the net. The ring explodes in a fanfare celebrating your goal and you grin, it was the perfect shot!");
		else output(" Ready and waiting to take the shot you kick the z-g ball and send it hurtling towards the goals... or so you think. Your aim is way off and it shoots past the goalie, hitting the holo-field protecting the crowd and the referee calls it out. If only your aim was better, you had the perfect chance to score a goal!");

	output("\n\nMoving back to the center platform you see [bess.name] darting on to the one above you, clearly up to something. You fly up and hook around just as one of [bess.hisHer] team-mates kicks the ball up to her. There’s a perfect chance for [bess.himHer] to make a shot from high up diagonally down and at the goals, none of your team are there defending except for the goalie.");
	
	output("\n\n<i>“Think you can stop me making the shot, "+ bessPCName() +"?”</i> [bess.name] cheekily taunts you as [bess.heShe] darts forward making [bess.hisHer] move. You have no idea what [bess.heShe]’s going to try and do, but you’re ready for anything! [bess.HeShe] kicks the ball sideways to another player who is jetting up and to your side and just as you move to intercept [bess.heShe] launches [bess.himHer]self at you.");
	if (rand(pc.RQ() >= 25) output(" You’re far too quick and dart to the side, kicking the ball far into [bess.hisHer] end of the field as [bess.heShe] faceplants on the platform. <i>“SYNTAX ERRORS!”</i> [bess.HeShe] curses aloud while rubbing [bess.hisHer] nose.”</i>");
	else output(" <i>“You’re just too slow on the uptake as [bess.hisHer] ally steals the ball and kicks it far away. Another one of the opposing team is there to collect and scores a goal. Frag your reflexes!”</i>");

	if (celiseIsCrew())
	{
		output("\n\nThings take a bit of a turn when Celise decides she would be much better taking the goalie position. Suddenly your team is unable to get a single shot past the green galotian, absorbing even the strongest hits into her jelly-like body. <i>“I always get whatever I want to catch-!”</i> She boldly exclaims, your team is really going to have to step up its game.");

		if (pc.intelligence() >= 25)
		{
			if (rand(pc.IQ() >= 25))
			{
				output("\n\nYou come up with a cunning plan in order to break through her defences. There’s no way you’re going to be able to beat her while she’s defending the goal - she’s far too good for that. Instead you come up with a plan to take advantage of ger biggest weakness, using your pulse boots to get up close to the goals.");
				
				output("\n\nYou stroke your her down your body and look at her  rather suggestively, giving her a wink. <i>“... Hey Celise, how about you step away from those goals and we go get a little frisky-?”</i>");
				
				output("\n\nCelise falls for it hook, line and sinker and moves away from the goals as soon as there’s a promise of a nice protein snack. The instant she does your team advances in, scoring a loud goal. The emerald galotian looks behind herself and suddenly realises your ploy, looking thoroughly grumpy. <i>“... No fair, that’s cheating!”</i>");
				
				output("\n\nTechnically seduction has never been against Graviball league rules, so you’re pretty sure it’s fair play... you might end up paying for it later though.");
			}
			else
			{
				output("\n\nYou simply can’t find a way to penetrate her defenses, she’s just too good at repelling, absorbing or catching anything that even comes close to her net. Thankfully a rather attractive (and sadly, entirely digital) player catches her interest later on and she moves away from the net, ending the one sided spanking your team was taking.");
			}
		}
		else
		{
			output("In the end Celise protecting the goals swung the game entirely in the opposing team’s favor and you lose the match. She comes sloshing up to you as both sides congratulate each other on a good game, a hopeful look in her  eyes. <i>“So, do I get anything for winning-?”</i></i>");
			
			output("\n\nShe runs her fingers suggestively down her massive gooey tits, it’s not hard to imagine what she’s after as a victory prize.");
		}
	}
	else if (pc.physique() + pc.aim() + pc.reflexes() < 50 + rand(20))
	{
		output("\n\nYou get absolutely smashed by the other team. In the end when it comes to Graviball you’re just not");
		if (pc.PQ() < 25 && pc.AQ() < 25 && pc.RQ() < 25) output(" physically fit at all. You’re not strong enough, accurate enough and you don’t have the reflexes for such an intense sport.");
		else if (pc.PQ() >= 25 && pc.AQ() < 25 && pc.RQ() < 25) output(" accurate or fast enough, though you’re strong enough to hold your own.");
		else if (pc.PQ() < 25 && pc.AQ() >= 25 && pc.RQ() < 25) output(" strong or quick enough, though your aim was spot on.");
		else if (pc.PQ() < 25 && pc.AQ() < 25 && pc.RQ() >= 25) output(" strong or accurate enough, though your reflexes were lightning quick.");
		else if (pc.PQ() >= 25 && pc.AQ() >= 25 && pc.RQ() < 25) output(" quick enough, though your strength and aim were perfect.");
		else if (pc.PQ() >= 25 && pc.AQ() < 25 && pc.RQ() >= 25) output(" accurate enough with your shots, though your strength and reflexes were perfect.");
		else if (pc.PQ() < 25 && pc.AQ() >= 25 && pc.RQ() >= 25) output(" strong enough, though your aim and reflexes were perfect.");
		else output(" cut out for the game.")
		output(" Maybe if you train a bit harder you’ll be able to win next time.");
	}
	else
	{
		output("\n\nYou absolutely smash the other team; you’re all over that field and everywhere you’re supposed to be. Maybe you should take up a career in Graviball? You’re certainly pretty good at it, at least against these virtual opponents.");

		if (celiseIsCrew())
		{
			output("\n\nYou see Celise ‘slooping’ up and licking her lips, apparently she found herself a snack. You can see one of the players naked and completely incapacitated. <i>“Enjoyable game, but I’m still hungry... this virtual stuff is always such a tease.”</i>
}


if (pc.companion “bess” = true)
{
Meanwhile even though [bess.heShe] lost [bess.name] seems thrilled to have played such a good game, running towards you and giving you a flying hug. <i> “You were so awesome, "+ bessPCName() +", though I almost totally had you for a second there--! We’ll have to have a rematch sometime, okay?”</i>
// Small bessAffection boost.
}

}

You gain ??? XP from  playing a game of Graviball.
// Time passes, PC takes a big fatigue hit! Possible


Sing Karaoke 


[bess.name] boots up the karaoke machine and tosses you a microphone. [if (pc.crewmembers > 1) "You invite the other crew members along too."]

if (Celise = companion)
{
Celise is a surprisingly beautiful singer and really gets into it, her massive tits jiggling as she wiggles along with the music. The sexy jello girl sings in perfect tune, wobbling about the place in a truly distracting fashion. <i>“How'd I do? Did I do good?”</i> Even when she stops the galotian's tits are still moving about.
}

As usual [bess.name] gets up to sing and [bess.heShe]'s a wonderful vocalist, [bess.hisHer] voice has a naturally melodic quality as is. [bess.HeShe] sings with [bess.hisHer] entire body, letting the music flow through [bess.hisHer] and course through [bess.hisHer] artificial skin. The silver skinned synthetic winks at you as [bess.heShe] performs.

0 = Catastrophic 1= Bad 2 = Average 3 = Good 4 = Great 5 = WTF?
if (pc.vocal = 0)
{
As you get up to sing you grab [bess.name]'s microphone and start to sing - [if (pc.companions > 1) "everyone"] [if (pc.companions = 1) "[bess.heShe]"] cringes and your microphone is taken away from you. It is quickly replaced with another. <i>“Here, take this one!”</i> [bess.name] exclaims, it seems you're not allowed to sing without the 'special microphone'. When you do your voice sounds wonderful and more importantly, bearable.
}

if (pc.vocal != 0 && pc.vocal != 5)
{
You get up to sing and grab the microphone, really getting into it. You're a [if (pc.vocal = 1) "terrible singer and really butcher every song"] [if (pc.vocal = 2) "very average singer and spend as much time in tune as out of it"] [if (pc.vocal = 3) "good singer and everyone is really impressed"] [if (pc.vocal = 4) "sublime singer and everyone is really impressed"], but in the end that's not what matters. You have a good time with [if (pc.companions > 1) "everyone"] [if (pc.companions = 1) "[bess.name]"] singing karaoke, and that's what counts.
}

if (pc.vocal = 5)
{
You get up to sing and grab the microphone, really getting into it. Your singing voice is truly sublime - when you sing a word it is the most perfect way that word can possibly sound to any ear in the galaxy. [if (pc.companions > 1) "Everyone"] [if (pc.companions = 1) "[bess.name]"] sits spellbound as you put your magical vocal cords to work. When you finish there is a lot of applause and calling for another song. Whenever you sing it's not karaoke as much as a live performance.
}

// bessAffection increases, time is spent.

Celise

// If Celise is a ship mate.

You ask [bess.name] what [bess.heShe] thinks of Celise.

if (bessSleepW = true && Celise is sleeping with PC too && bessPoly != 2)
{
<i>“Celise? " + bess.mf("Well, what's not to love about her?","I love and adore her to bits!") + "Not in the same way I love you, of course. If there is one thing I had to say... it's that I'd rather not have to share the bed with her. Waking up to her sucking you off - it's a bit much, don't you think?”</i>
}
else if (bessSleepW = false && bessLover = true && Celise is sleeping with PC too)
{
<i>“Celise?”</i> [bess.name] narrows her eyes at you a little. <i>“Look, I love Celise, not in the same way I love you, but... letting her sleep with you while I have to sleep in another room? That's so unfair!”</i> [bess.HisHer] tone is very grumpy. It was probably a bad question to ask her.
}

else if (bessLover = true)
{
<i>“Celise?”</i> [bess.name] " + bess.mf("grins","beams brightly") + ", <i>“" + bess.mf("Well, what's not to love about her?","I love and adore her to bits!") + " Not as much or in the same way as I love you, of course. My one problem is that she always seems to find and interrupt us when we're in the middle of us time!\</i>

<i>“It's mostly for protein though, and that's not so bad. I can make it from my MeldMilk easily enough, though the way she likes to feed off it...”</i> [bess.name] " + bess.mf("coughs","flushes a little") + ". <i>“... Well, she says there's a 'boring way' and a 'fun way'. She always picks the latter.”</i>

}

else
{
<i>“Celise?”</i> " + bess.mf("grins","beams brightly") + ", <i>“She's my friend, and I think she's wonderful! You're my best friend of course. She's always pestering me for protein though.\</i>

<i>“ I can make it from my MeldMilk easily enough, though the way she likes to feed off it...”</i> [bess.name] " + bess.mf("coughs","flushes a little") + ". <i>“... Well, she says there's a 'boring way' and a 'fun way'. She always picks the latter.”</i>
}

Break Up / Dismiss



// Break Up / if bessLover = true
Are you sure you want to break up with [bess.name]? You have a gut feeling that if you end your relationship, it won't be a clean break. [bess.HeShe]'ll probably leave the ship. You'd lose your [bessLoverStatus] as well as your "+ bessCrewRole() +".
[Reconsider] [Yes, Break Up]

=[Yes, Break Up]=
You tell [bess.name] that you no longer love [bess.himHer] and that it's over between you. {Nice: You try to word it as gently as possible, but there's just no good way to deliver it./Mischevious: You try to deliver the news lightly, but there's just no way to take the edge off./Hard: You're rather blunt about it, since you're no good at beating around the bush with this sort of thing.}

As expected, your words are utterly soul crushing. [bess.HisHer] [bess.eyes] quiver and " + bess.mf("his whole body trembles","her lower lip trembles") + ". You can see [bess.hisHer] entire world crashing down as [bess.heShe] stares at you in utter disbelief and heart-wrenched despair.

[bess.HeShe] tries to open [bess.hisHer] mouth, but only a choked noise comes out. Soon [bess.heShe]'s running and collecting [bess.hisHer] things, obviously packing to leave the ship. 

Before you know it, there’s silence, and [bess.name] has left to who knows where. You have no idea where [bess.heShe] went, or if you’ll ever see [bess.himHer] again.