import classes.BreastRowClass;
import classes.Characters.Bess;
import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.ItemSlotClass;
/* TODOS:
make sure sleep events etc are wired up
set flag["BESS_SLEEPWITH_DOMORNING"] to something after a nighttime sleep event
Wrap all the ternaries in the sex scenes because fuck debugging them ever
Make sure up the breast size customisation stuff ties to the sex scenes properly
*/

public var BESS_INV_SLOT_MAX:int = 55;

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

public static const BESS_CREWROLE_INTOFFICER:uint = 0;
public static const BESS_CREWROLE_ACCOUNTANT:uint = 1;
public static const BESS_CREWROLE_ARCHIVIST:uint = 2;
public static const BESS_CREWROLE_STEWARDESS:uint = 3;
public static const BESS_CREWROLE_TECHNICIAN:uint = 4;

public function bessCrewRole():String
{
	if (flags["BESS_CREW_ROLE"] == undefined) return "crew member";

	switch (flags["BESS_CREW_ROLE"])
	{
		case 0: return "intelligence officer";
		case 1: return "accountant";
		case 2: return "archivist";
		case 3: return "chief steward" + (bess.isFeminine() ? "ess" : "");
		case 4: return "technician";
		default: return "crew member";
	}

	return "crew member";
}

public function bessLoverStatus():String
{
	// 9999 maybe convert this to the same system as crew role
	return flags["BESS_LOVER_STATUS"];
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
		flags["BESS_SEX_ROLE"] = 0;
		return false;
	}

	if (flags["BESS_SEX_ROLE"] == 1) return true;
	return false;
}

public function bessIsSub():Boolean
{
	if (flags["BESS_SEX_ROLE"] == undefined)
	{
		flags["BESS_SEX_ROLE"] = 0;
		return false;
	}

	if (flags["BESS_SEX_ROLE"] == 2) return true;
	return false;
}

public function bessIsEqual():Boolean
{
	if (flags["BESS_SEX_ROLE"] == undefined)
	{
		flags["BESS_SEX_ROLE"] = 0;
		return true;
	}

	if (flags["BESS_SEX_ROLE"] == 0) return true;
	return false
}

public function bessPoly():int
{
	if (flags["BESS_POLY"] == undefined) flags["BESS_POLY"] = 0;
	return flags["BESS_POLY"];
}

public function bessClosedRelationship():Boolean
{
	return bessPoly() == 0;
}

public function bessOpenRelationship():Boolean
{
	return bessPoly() == 1;
}

public function bessPolyRelationship():Boolean
{
	return bessPoly() == 2;
}

public function bessHairLength():String
{
	switch (bess.hairLength)
	{
		case 0:
		default:
			return "none";

		case 2:
			return "short";

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

		case GLOBAL.NIPPLE_TYPE_LIPPLES:
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
	if (bess.buttRatingRaw <= 0) return "buttless";
	if (bess.buttRatingRaw <= 2) return "tight";
	if (bess.buttRatingRaw <= 4) return "average";
	if (bess.buttRatingRaw <= 6) return "noticable";
	if (bess.buttRatingRaw <= 8) return "large";
	if (bess.buttRatingRaw <= 10) return "jiggly";
	if (bess.buttRatingRaw <= 13) return "expansive";
	if (bess.buttRatingRaw <= 16) return "huge";
	return "massive";
}

public function bessThighSize():String
{
	if (bess.hipRatingRaw <= 0) return "boyish";
	if (bess.hipRatingRaw <= 2) return "slender";
	if (bess.hipRatingRaw <= 4) return "average";
	if (bess.hipRatingRaw <= 6) return "ample";
	if (bess.hipRatingRaw <= 10) return "curvy";
	if (bess.hipRatingRaw <= 15) return "voluptuous";
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
		case GLOBAL.TYPE_SYNTHETIC: return "normal";
		case GLOBAL.TYPE_SAURIAN: return "saurian";
		case GLOBAL.TYPE_EQUINE: return "equine";
		case GLOBAL.TYPE_CANINE: return "canine";
		case GLOBAL.TYPE_VULPINE: return "vulpine";
		case GLOBAL.TYPE_DEMONIC: return "demonic";
		case GLOBAL.TYPE_TENTACLE: return "tentacle";
		case GLOBAL.TYPE_FELINE: return "feline";
		case GLOBAL.TYPE_DRACONIC: return "draconic";
		case GLOBAL.TYPE_GOOEY: return "goo";
		case GLOBAL.TYPE_VENUSPITCHER: return "plant";
		default: return "";
	}
}

public function bessCumFlavor():String
{
	switch (bess.cumType)
	{
		case GLOBAL.FLUID_TYPE_CUM: return "normal";
		case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK: return "chocolate";
		case GLOBAL.FLUID_TYPE_VANILLA: return "vanilla";
		case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK: return "strawberry";
		case GLOBAL.FLUID_TYPE_HONEY: return "honey";
		default: return "normal";
	}
}

public function bessGirlCumFlavor():String
{
	switch (bess.girlCumType)
	{
		case GLOBAL.FLUID_TYPE_GIRLCUM: return "normal";
		case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK: return "chocolate";
		case GLOBAL.FLUID_TYPE_VANILLA: return "vanilla";
		case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK: return "strawberry";
		case GLOBAL.FLUID_TYPE_HONEY: return "honey";
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
public static const BESS_COCKTYPE_GOOEY:uint 			= 1 << 21;
public static const BESS_COCKTYPE_VENUSPITCHER:uint 		= 1 << 22;
public static const BESS_COCKTYPE_DRAGON:uint 		= 1 << 23;

public function bessHasAccessorySet(setType:uint):Boolean
{
	if (flags["BESS_ACCESSORY_SETS"] == undefined) flags["BESS_ACCESSORY_SETS"] = 0;

	return (flags["BESS_ACCESSORY_SETS"] & setType) > 0;
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

	return (flags["BESS_ACCESSORY_SETS"] & setType) > 0;
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
	if(bess.armor is clothingType) return true;
	if(bess.upperUndergarment is clothingType) return true;
	if(bess.lowerUndergarment is clothingType) return true;
	return bess.hasItemByClass(clothingType);
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
public static const BESS_DISABLED:uint = 3;

public function bessHeader():void
{
	showBust(bessBustDisplay());
	showName("\n" + chars["BESS"].short.toUpperCase());
	author("JimT");
}
public function bessBustDisplay():String
{
	if (bess.isFeminine()) return "BESS";
	return "BEN";
}

public function bessIsCrew():Boolean
{
	if (flags["BESS_LOCATION"] == BESS_ON_CREW) return true;
	return false;
}

public function bessIsFollower():Boolean
{
	if (flags["BESS_LOCATION"] != undefined && flags["BESS_LOCATION"] != BESS_DISABLED) return true;
	return false;
}

public function bessIsSleepCompanion():Boolean
{
	return (flags["CREWMEMBER_SLEEP_WITH"] == "BESS");
}

public function bessTavrosBonus(btnSlot:int = 2):void 
{
	output("\n\n[bess.name] is here, waiting around and generally staying out of the way as best [bess.heShe] can.");
	addButton(btnSlot, bess.short, approachBessAtTavros);
}

public function bessTopStripScene():void
{
	if (bess.isChestGarbed())
	{
		//If bess is wearing armor
		if (!(bess.armor is EmptySlot))
		{
			// First brackets are if Bess is wearing any known outfit with a slide down top. Else she just removes the top (All her clothing items that aren't slide down have a removable top). 

			// E.g. if (bess.armor.shortName == "ShortKimono" || bess.armor.shortName == "Yukata" || bess.armor.shortName == "FemaleKimono" || bess.armor.shortName == "ChinaDress" || bess.armor.shortName == bess.armor.shortName == "NinjaOutfit" || bess.armor.shortName == "Yukata" || bess.armor.shortName == "NurseOutfit" || || bess.armor.shortName == "CheerleaderUniform" ||bess.armor.shortName == "GothLolita" || bess.armor.shortName == "LittleBlackDress")

			// if (IsOneOf(bess.armor, ShortKimono, Yukata, FemaleKimono, ChinaDress, NinjaOutfit, CheerleaderUniform, GothLolita, LittleBlackDress))
			if (IsOneOf(bess.armor, CheerleaderUniform, LittleBlackDress))
			{
				output("\n\n[bess.name] reaches up to [bess.hisHer] neck and undoes [bess.hisHer] [bess.armor], sliding it down [bess.hisHer] body");
				if (bess.isFeminine()) output(" with a cute little wiggle");
				output(" until it is bunched around [bess.hisHer] waist.");
			}
			else
			{
				output("\n\n[bess.name] reaches up and slips off the top of [bess.hisHer] [bess.armor].");
			}
			output(" Underneath, [bess.heShe]’s");
			if (bess.upperUndergarment is EmptySlot) output(" completely naked and");
			else output(" wearing " + indefiniteArticle(bess.upperUndergarment.longName) + ". [bess.HeShe] removes it and soon");
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
			output(" barely constrained by [bess.hisHer] [bess.upperUndergarment]. [bess.heShe] slips it off and tosses it aside. [bess.HisHer] beautiful, naked body is now on display as [bess.heShe] stands there wearing nothing");
			if (!(bess.lowerUndergarment is EmptySlot)) output(" but a pair of [bess.lowerUndergarment] clinging to [bess.hisHer] [bess.hips].");
			else output(" at all.");
		}
	}
}

public function bessBottomStripScene():void
{
	if (!bess.isNude())
	{
		//if (IsOneOf(bess.armor, 
				//MaidOutfit, SchoolgirlOutfit, Battlegown, ShortKimono, Yukata, 
				//Kimono, ChinaDress, LibrarianOutfit, TopNSkirt, SleepShirt,
				//BattleMaidOutfit, NinjaOutfit, NurseOutfit, Seifuku, FemaleDoctorOutfit, 
				//CheerleaderUniform, WaitressUniform, GothLolitaOutfit, TankNSkirt, LittleBlackDress))
		if (IsOneOf(bess.armor, 
				MaidOutfit, SchoolgirlOutfit, 
				LibrarianOutfit, TopNSkirt,
				NurseOutfit, FemaleDoctorOutfit, 
				CheerleaderUniform, WaitressUniform, LittleBlackDress))
		{
			output("\n\n[bess.name] reaches down and grabs the hem of [bess.hisHer] [bess.armor]. [bess.HeShe] draws it up to [bess.hisHer] waist with a little wiggle - you can clearly see [bess.hisHer]");
			if (bess.lowerUndergarment is EmptySlot) output(" [bess.groin]");
			else output(" [bess.lowerUndergarment]");
			output(".");
			if (bess.hasVagina()) output(" [bess.HeShe]’s already clearly wet - the moist fabric of [bess.hisHer] underwear is sticking to [bess.hisHer] pussy lips, forming a perfect camel toe.");
		}
		else
		{
			output("\n\n[bess.name] sensuously slides off [bess.hisHer] [bess.armor], slowly revealing [bess.hisHer] naked body to you. You openly ogle [bess.hisHer] [bess.chest]");
			if (!(bess.upperUndergarment is EmptySlot)) output(", barely bound by [bess.hisHer] [bess.upperUndergarment]");
			else output(", now proudly on display");
			output(". It’s hard not to salivate over [bess.hisHer] [bess.groin]");
			if (!(bess.lowerUndergarment is EmptySlot)) output(", barely contained by [bess.hisHer] [bess.lowerUndergarment]");
			output(".");
		}

		if (!(bess.lowerUndergarment is EmptySlot))
		{
			output("\n\nNow that [bess.hisHer] [bess.armor] is out of the way, [bess.heShe] hooks [bess.hisHer] thumbs under the sides of [bess.hisHer] [bess.lowerUndergarment]. With deliberate slowness, [bess.name] slips and slides them down [bess.hisHer] [bess.thighs], baring [bess.hisHer] [bess.groin] inch by glorious inch. And then, with a little kick, [bess.heShe] tosses [bess.hisHer] [bess.lowerUndergarment] aside.");
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
	showName("SILVER\nOBJECT");
	author("JimT");

	output("You abandon caution for curiosity and inch closer towards the silvery object.");
	output("\n\nAs you close in, you realize two things. One, it is much larger than it first appeared. Two, the shape of the part that is sticking out is easy to identify.");
	output("\n\nIt’s a foot. Why is a silvery foot poking out of a pile of half-broken pipes and shattered holos?");
	output("\n\nIt looks like a machine foot, to boot. On further examination, the foot is connected to a body, and the body is buried beneath the rubbish.");
	//ifRunIntoPleasureBots: 
	if(flags["MET_SEXBOTS_ON_TARKUS"] != undefined) output(" It looks far too sleek looking to be one of the Pleasure Bots that aimlessly roam the Tarkus wastes.");
	output(" From what you can see it doesn’t look rusted, or even slightly scratched, adding even more to the air of mystery surrounding it.");
	//SydiansMet:
	if(flags["MET_SYDIAN_MALE"] != undefined) output(" You can’t believe the Sydians haven’t melted this thing down yet.");
	output("\n\nWhat kind of foot is it...?");

	clearMenu();
	//[Synthetic Female Foot] [Synthetic Male Foot]
	// This choice sets Bess/Ben's gender flag to female or male, respectively, and sets all the starting body values. 
	addButton(0,"Female Foot",setBessSex,"female","Female Foot","The synthetic foot obviously belongs to a female. Everyone knows you can tell the assumed gender of an inorganic by the shape of its ambulatory limbs!");
	addButton(1,"Male Foot",setBessSex,"male","Male Foot","The synthetic foot obviously belongs to a male. Everyone knows you can tell the assumed gender of an inorganic by the shape of its ambulatory limbs!");
}

//Gender choice--to prevent wierdness
public function setBessGender(pref:String = "auto"):void
{
	if (pref == "auto")
	{
		bess.removeStatusEffect("Force Male Gender");
		bess.removeStatusEffect("Force Fem Gender");
	}
	else if (pref == "male")
	{
		bess.removeStatusEffect("Force Fem Gender");
		bess.createStatusEffect("Force Male Gender");
	}
	else if (pref == "female")
	{
		bess.removeStatusEffect("Force Male Gender");
		bess.createStatusEffect("Force Fem Gender");
	}
}
//Either Choice
public function setBessSex(bessesStartingSexHahaThatsNotHowYouWriteAPossessive:String = "female"):void
{
	clearOutput();
	showName("SILVER\nFOOT");
	author("JimT");
	
	output("On closer examination, it definitely looks like a " + bessesStartingSexHahaThatsNotHowYouWriteAPossessive + " foot. The real question though is if you want to dig this thing up and see what it is...?");
	
	if(bessesStartingSexHahaThatsNotHowYouWriteAPossessive == "female")
	{
		bess.configFemale();
	}
	else
	{
		bess.configMale();
	}
	
	setBessGender(bessesStartingSexHahaThatsNotHowYouWriteAPossessive);
	
	//[ Dig It Up ] [ Leave It ]
	clearMenu();
	addButton(0,"Dig It Up",digUpAFukkinSexbat);
	addButton(14,"Leave",mainGameMenu);
}

//Dig It Up
public function digUpAFukkinSexbat():void
{
	clearOutput();
	showName("SILVER\nSYNTHETIC");
	author("JimT");
	
	output("Curiosity gets the better of you as you decide to dig it up. Getting rid of all the junk on top of it is a quick and easy process.");
	output("\n\nSoon a silvery humanoid body, distinctly " + bess.mf("masculine","feminine") + " and covered in segmented lines, is revealed amongst the rubble. An incredibly shapely rear is glinting back up at you, connected to " + bess.mf("manly","womanly") + " thighs and hips of glistening chrome.");
	output("\n\nWhat a butt! You can’t help but reach out and poke it, just to see if it is real. For <i>exploratory</i> purposes, of course.");
	output("\n\nAs you touch [bess.his] silvery rump, you find it is ");
	if(bess.hasCock()) output("delightfully taught with a tiny bit of give,");
	else output("surprisingly soft");
	output(" and sensuously smooth.");
	if(bess.hasCock()) output(" You poke elsewhere, and what");
	else output(" What");
	output(" looks like chrome metal plating is actually quite pliant and springy, just like the flesh of a human. The detail work is amazing!");
	output("\n\nEven so, it is quite clearly a mechanical life form, complete with visible rivets along [bess.hisHer] spine. There is even a registration number stamped right above ");
	if(bess.hasVagina()) output("her pert");
	else output("his incredibly fine");
	output(" ass like a robotic tramp stamp. You read it out loud.");

	output("\n\n<i>“" + bess.mf("Ben Fourteen","Bess Thirteen") + ".”</i> The rest of the registration number is scratched out. Is that [bess.hisHer] model number, [bess.hisHer] actual name, or is [bess.heShe] literally the " + bess.mf("fourteenth","thirteenth") + " of a line of "+ bess.mf("Bens","Besses") + "?");

	output("\n\nSince you’re not going to get any answers from staring at [bess.hisHer] ass - no matter how perfect it is - you decide to turn [bess.himHer] over and get a good look at [bess.hisHer] other side. Maybe there are some more details there.");

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
	
	output("\n\nEverything about this silvery synthetic is ‘too perfect’, screaming artificial. "+ bess.mf("Men", "Women") + " this beautiful aren’t born, they’re built- either through engineering or through genetic enhancement.");
	output("\n\nOne thing’s for certain; [bess.heShe] must have cost a <i>mint</i> to make. [bess.HisHer] detail work makes the other robots on Tarkus look like, well, trash. Why would someone throw a galactic class android like this out? [bess.HeShe] might even be worth as much as a <i>starship</i>.");
	output("\n\nReaching up to [bess.hisHer] open neck compartment, you can see a small digital display. Flickering across it are three words: <i>Main Power Depleted</i>. It doesn’t take a starship engineer to figure out why [bess.heShe] isn’t moving.");
	output("\n\nIf cleaned up, this " + bess.mf("male", "female") + " unit would definitely sell for a pretty Galactic Credit, or you could keep [bess.himHer] for your own use. Either way, [bess.heShe] needs to have [bess.hisHer] batteries recharged, and the easiest way to do that is to take [bess.himHer] back to your ship.");
	output("\n\nFinding [bess.himHer] really is like finding a gem in the rough, though you could just leave [bess.himHer] here. It doesn’t look like [bess.heShe] is going to rust anytime soon.");

	CodexManager.unlockEntry("Maia Series AI");
	//[Take On Ship] [Leave Here] 
	processTime(7);
	clearMenu();
	addButton(0,"TakeToShip",takeBessToZeShip);
	addButton(1,"Leave Here",fuckinLeaveTheBessBot); // 9999 actually leave message, there's nothing for this in the doc
}

public function fuckinLeaveTheBessBot():void
{
	clearOutput();
	showName("\n???");
	author("Gedan");
	
	flags["BESS_IN_RUBBLE"] = 0;
	
	output("You’re about to turn away and leave when something remarkably... odd happens.");
	output("\n\nIt takes a second to realize what the odd humming noise that’s been sufusing the air actually is; a figure is approaching from the north, screaming at the top of his voice from the looks of things. He’s closing distance quickly, but he’s still far enough away for the sound to be mostly unintelligible.");
	output("\n\nYou prepare for some kind of face off as he gets closer and closer- but he’s not looking at you. He’s focused entirely on the foot sticking out of the ground.");
	output("\n\n<i><b>“I FUCK, I CUM, I FUCK AGAIN,”</b></i> is all he screams, over and over. It’s only now that he’s close enough to understand that you notice what <i>else</i> he’s doing. His cock is flopping all over the place, hanging freely through the zipper of his leather pants. And he has a can in his hand- he’s spraypainting his cock silver.");
	output("\n\nYou’re just standing there, flabbergasted, as he runs up to the foot sticking up out of the ground. He turns to you, and you flinch back instinctively, expecting a fight. Instead, all he does is scream <i><b>“WITNESS MEEEE,”</b></i> right at you. You don’t respond. You don’t even react. The crazed lunatic just turns back to the foot and yanks it from the ground, an entire robot chassis coming with it.");
	output("\n\nHe hefts the thing over his shoulder and takes off running back in the direction he came from- his chant resuming in short order. <i><b>“I FUCK, I CUM, I FUCK AGAIN! I FUCK, I CUM, I FUCK AGAIN!”</b></i>");
	output("\n\nA little shellshocked, it takes you a while to actually get back moving. Weird as fuck.");
	output("\n\nA minute or so later there’s an impressive explosion painting the sky a very odd shade of neon blue- coming from the direction the lunatic took off running....");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Taking him/her to the Ship
//Take On Ship
public function takeBessToZeShip():void
{
	moveTo("SHIP INTERIOR");
	flags["BESS_IN_RUBBLE"] = 1; // shit flag name sue me
	
	clearOutput();
	showName("SHIP\nINTERIOR");
	author("JimT");
	
	if (bess.hasVagina())
	{
		output("It’s a good thing the female unit is so light - it takes you far less time to get her back to the ship than you first thought. She’s so soft to the touch that it is hard to believe she’s really a machine.");
	}
	else // male
	{
		output("Carrying the male unit back to the ship takes quite a lot of effort. Having him pressed against your chest causes you to flush a little. His skin is so smooth, and his assets so detailed, it’s hard to believe that he’s really a machine and not an organic man.");
	}
	output("\n\nLuckily, you’re not attacked by any natives on the way back to Novahome. You’re pretty sure you wouldn’t have been able to put up a proper fight carrying the synthetic.");
	output("\n\nOnce you return to the ship, it is simply a matter of locating [bess.hisHer] power slot. Placing [bess.himHer] down in the cargo bay, you check over [bess.hisHer] body for anything that stands out. Right above [bess.hisHer] rump is a barely perceivable line that looks somewhat suspicious.");
	output("\n\nAfter working it for a bit with some tools, you are able to pop it open. The second you do, something shoots out like a snake exploding from a can. It happens so suddenly you fall back on your ass, reaching immediately for a wrench.");
	output("\n\nWhen you collect yourself you can see a five foot snake-like appendage now protruding from just above [bess.hisHer] rear. It is dancing through the air like a cobra to a flute, apparently searching for something.");
	output("\n\nNow that you’ve got a moment to examine it - and it doesn’t seem immediately threatening - you notice the head of the prehensile extension is incredibly phallic. While its body is tubular and flexible, the end is long, stiff, and ribbed. The very tip is flared just like a human member.");
	output("\n\nDespite its appearance you see [bess.hisHer] neck compartment flashing with the words <i>power source found</i>. Suddenly it shoots into one of the nearby power ports. At first it doesn’t look like it will fit, but then the mysteriously phallic head adjusts itself and expands to fit the coupling.");
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
	bessHeader();
	
	output("Your Codex bleeps at you when the unit is apparently finished charging. You finish your drink and head back down to the cargo bay.");
	output("\n\nWhen you get there, the " + bess.mf("male", "female") + " android is already retracting the coupling cable out of the wall with a satisfied sigh. As [bess.heShe] stands upright it slides back inside [bess.hisHer] body and disappears completely from sight.");
	output("\n\nYou can hear [bess.hisHer] rear compartment closing with a small clicking noise.");
	output("\n\nStriding into the room, you have your [pc.weapon] pointed at [bess.himHer] for good measure. After all, [bess.heShe] may have been dumped on Tarkus for good reason.");

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
	output("\n\nThe " + bess.mf("male","female") + " android looks a little confused. <i>“[pc.Master], I don’t have a name yet - you haven’t given me one. " + bess.mf("I’m the Breeding Emergency Neutralizer Android Model No.14, or ‘Ben-14’,", "I’m the Breeding Emergency Sex Substitute Android Model No.13, or ‘Bess-13’,") + " that you ordered from JoyCo. You know, the one designed to relieve your pent-up breeding needs?”</i>");
	output("\n\nIt seems [bess.heShe] has been reset to [bess.hisHer] factory settings, and now [bess.heShe] thinks you are [bess.hisHer] registered owner. Either that, or [bess.heShe] was fresh out of the box to begin with. Could you be lucky enough to have found your very own high-class, brand-spanking new JoyCo sex relief android?");
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
	else addDisabledButton(4,"Release","Release","Your new robotic friend doesn’t seem to understand the idea of freedom.");
	addButton(5,"KeepAtTavros",waitAtTavrosBess);
}

//Sell Off
public function sellOfBessDatWhore():void
{
	clearOutput();
	showName("SELL\n" + bess.mf("BEN", "BESS") + " UNIT");
	author("JimT");
	
	output("You decide you’d rather sell [bess.himHer] on the black market for some quick credits than keep [bess.himHer]. After making a discreet listing on the extranet, you eventually find a willing buyer for your " + bess.mf("Ben-14", "Bess-13") + " unit.");
	output("\n\nThe handoff takes place in a secluded section of a nearby planet, barren enough to land the ship and avoid any contact with any locals. When you get to the meeting place, another starship is already waiting for you. ");
	output("\n\nThe hull of the spacecraft has clearly seen better days; either the owner is blowing more money on your " + bess.mf("Ben", "Bess") + " Unit than on their starship, or they actually like it looking like a flying garbage heap.");
	output("\n\nThe owner of the ship is just as pleasant to look at as his starship is. Coming out to meet you and wringing their hands all the while, he hardly makes eye contact. He’s far too busy ogling the merchandise.");
	output("\n\n<i>“Nice, nice. Hard to get one of these for anything less than mega-creds. What did you do, steal [bess.himHer] from a hospital? Don’t answer that, I don’t want to know.”</i> The buyer gives you a near-toothless grin.");
	output("\n\nCredits are exchanged, no names, and soon you’re 10,000 credits richer. It’s sub-light robbery - [bess.heShe]’s worth <i>at least</i> an extra zero - but there are no questions asked and you’re wealthier than before you found it.");
	output("\n\nAfter concluding your business, you head back to Tarkus, wiping the flight path and history from your spaceship computer.");
	//Appear back in Spaceship, story path ended. { Add 10,000 credits to PC’s credit score } 
	pc.credits += 10000;
	flags["SOLD_BESS"] = 1;
	flags["BESS_LOCATION"] = BESS_DISABLED;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	processTime(2040);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Hand To Authorities
public function handBessOverToAuthorities():void
{
	clearOutput();
	showName("TURN IN\nTO U.G.C.");
	author("JimT");
	
	output("Deciding that the sex-bot doesn’t belong to you and you should probably hand [bess.himHer] over to authorities, you ring and arrange for [bess.himHer] to be picked up. You’re surprised a U.G.C. official is actually going out of their way to Tarkus to pick up a sex bot.");
	output("\n\nWhen the official shows up in the Novahome docking bay, you find out why. Apparently there’s a standing order for all " + bess.mf("Ben-14", "Bess-13") + " Unit AIs put out by JoyCo. It seems you’re entitled to a bounty for bringing the <i>“dangerous sex bot”</i> in.");
	output("\n\nLooking at [bess.hisHer] confused eyes as you hand [bess.himHer] over, it’s hard to imagine [bess.heShe]’s a danger. Still, it seems you dodged a bullet by turning [bess.himHer] in. Not only that, apparently owning a AI version of the units is considered a criminal offense.");
	output("\n\nThe U.G.C. official leaves with the " + bess.mf("Ben-14", "Bess-13") + " unit, and soon after you are wired 2,500 credits by JoyCo. Seems things wrapped up pretty nicely.");
	pc.credits += 2500;
	flags["BESS_GIVEN_TO_UGC"] = 1;
	flags["BESS_DISABLED"] = 1;
	flags["BESS_LOCATION"] = BESS_DISABLED;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	processTime(2040);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Release 
public function releaseBessBenWhatever():void
{
	clearOutput();
	bessHeader();
	
	output("You tell the " + bess.mf("male", "female") + " synthetic that [bess.heShe] is free to do as [bess.heShe] pleases, and that you are not [bess.hisHer] [pc.Master]. It seems like the right thing to do.");
	output("\n\nHowever, [bess.heShe] seems to have difficulty processing what you are saying, almost as if you were speaking a foreign language.");
	output("\n\n<i>“What do you mean, [pc.Master]? I am a " + bess.mf("Ben-14", "Bess-13") + " unit, and I belong to you! I am your personal unit. I am not designed to belong to myself.”</i> " + bess.mf("He furrows his brow, looking perplexed by your statement", "Her voice seems to quiver a little") + ". The concept of not belonging to someone seems to be outside of [bess.hisHer] programming.");
	output("\n\nWhat exactly are you going to do? [bess.HeShe]’ll probably get caught in a logic loop if you push the point.");
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
	showName("DUMP\n" + bess.mf("BEN", "BESS") + " UNIT");
	author("JimT");
	
	output("Rather than keep the silver android, you decide that it’s best just to kick [bess.himHer] off your ship and let [bess.himHer] aimlessly wander Tarkus now that you’ve activated [bess.himHer]. Someone else can deal with [bess.himHer] - it’s just too much trouble.");
	output("\n\nDespite [bess.hisHer] pleas, you shove [bess.himHer] in the airlock and vent [bess.himHer] out, sending [bess.himHer] flying out into a pile of junk. In the end [bess.heShe]’s just an object only pretending to have feelings – no different to the broken holos and pieces of pipe littering the whole crappy planet.");
	output("\n\nThings are nice and quiet after that.");
	//Appear back in Spaceship, Story path ended. +5 to Asshat Score.
	processTime(10);
	pc.addHard(10);
	currentLocation = shipLocation;
	flags["BESS_DISABLED"] = 1;
	flags["BESS_DUMPED_INTO_SPAAAAAAACE"] = 1;
	flags["BESS_LOCATION"] = BESS_DISABLED;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tavros Station
public function waitAtTavrosBess():void
{
	clearOutput();
	showName(bess.mf("BEN", "BESS") + " UNIT\nAT TAVROS");
	author("JimT");
	
	output("You decide you don’t have a place for [bess.himHer] on the ship at the moment and you don’t want to get rid of [bess.himHer]. You do have a space dock at Tavros Station though.");
	output("\n\nIt is a bit out of your way, but you fly all the way back and drop [bess.himHer] there for the time being. That way, you can pick [bess.himHer] up once you know what you want to do with [bess.himHer].");
	output("\n\n(<b>The " + bess.mf("Ben-14", "Bess-13") + " unit has been dropped at Tavros Station! You can pick [bess.himHer] up later if you want to have [bess.himHer] join your crew.</b>)");
	//See Tavros Station section for more information.
	processTime(2040);
	currentLocation = shipLocation;
	flags["BESS_LOCATION"] = BESS_AT_TAVROS;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Keep [bess.HimHer] - Leads to Tutorial Section.
public function keepBessYouSloot():void
{
	clearOutput();
	bessHeader();
	flags["BESS_LOCATION"] = BESS_ON_CREW;

	//Tutorial / Configure 
	output("You decide that you’ll take [bess.himHer] along after all. You don’t really want to leave [bess.himHer] on Tavros, and you don’t want to get rid of [bess.himHer] either.");
	if (pc.isNice()) output(" <i>“Plus, it kind of seems mean to leave [bess.himHer] alone in your hangar just because [bess.heShe]’s an android”</i>.");
	else if (pc.isMischievous()) output(" Plus it might be kind of fun to add [bess.himHer] to your crew.");
	else output(" <i>“Besides, you need every edge you can get if you’re going to find that hidden treasure stash.”</i>");
	//Nice:
	if(pc.isNice()) output("\n\n<i>“I guess I’ve got a new crewmate. Welcome aboard!”</i> You smile warmly, happy to have another crew member on your ship.");
	//Misc:
	else if(pc.isMischievous()) output("\n\n<i>“Sure, why not? I’ve got room for another crew member. Welcome aboard!”</i> You welcome [bess.himHer] on a whim, though you’re sure it will all work out for the best.");
	//Hard:
	else output("\n\n<i>“Do whatever you want, just don’t cause any trouble or you’re off the ship.”</i> You sternly warn [bess.himHer], making sure the message is received loud and clear.");
	output("\n\nThe silver haired synthetic" + bess.mf("’s eyes light up and he gives a dutiful bow", " flushes and bows") + ", <i>“You’re too kind, [pc.Master]. Just think of me as yours to do with what you will.”</i>");

	if (flags["BESS_FULLY_CONFIGURED"] == undefined)
	{
		output("\n\n[bess.HeShe] then pauses and looks at you with patient, " + bess.mf("questioning", "hopeful") + " eyes, as if waiting for you to say something else. " + bess.mf("He even coughs politely, as if trying to awkwardly bring your attention to something.", "It reminds you of a girl at a social function waiting to be asked to dance."));
		output("\n\nYou ask [bess.himHer] exactly what [bess.heShe]’s waiting for, and [bess.heShe] gives a rather animated blink. It’s hardly that of a pre-programmed VI.");
		output("\n\n<i>“My name, [pc.Master]. I don’t have an official designation yet.”</i> It seems [bess.heShe] needs a name of some sort, and you’re supposed to give [bess.himHer] one.");
		clearMenu();
		addButton(0,"Next",nameBessForRealsies);
	}
	else
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function nameBessForRealsies():void
{
	clearOutput();
	bessHeader();
	output("What do you decide to name [bess.himHer]?");
	displayInput();
	this.userInterface.textInput.text = chars["BESS"].mf("Ben","Bess");
	//(Default Name: {if (bess.gender = female) <i>“Bess”</i>}{else: <i>“Ben”</i>}");
	output("\n\n\n");
	clearMenu();
	addButton(0, "Next", nameBessProcessing);
}

public function nameBessProcessing():void
{
	if (this.userInterface.textInput.text == "") {
		nameBessForRealsies();
		output("<b>You must input a name.</b>");
		return;
	}
	// Illegal characters check. Just in case...
	if (hasIllegalInput(this.userInterface.textInput.text)) {
		nameBessForRealsies();
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if (this.userInterface.textInput.text.length > 14) {
		nameBessForRealsies();
		output("<b>You must enter a name no more than fourteen characters long.</b>");
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

	flags["BESS_FULLY_CONFIGURED"] = 1;

	output("<i>“Thank you for my name, [pc.Master]. I am now called [bess.name]!”</i> [bess.name] sounds delighted with [bess.hisHer] new name, though [bess.heShe]’s probably happy to have a name in general. <i>“I look forward to servicing your reproductive needs in the near future.”</i>");
	output("\n\nYou ask exactly what functions [bess.name] comes equipped with, noting that [bess.heShe] doesn’t look like [bess.heShe]’s made of a regular kind of alloy.");
	output("\n\n[bess.name] comes quite lively when you observe that, since [bess.heShe] clearly takes pride in [bess.hisHer] design specs.");
	output("\n\n<i>“You’re very observant, [pc.Master]! All " + bess.mf("Ben-14", "Bess-13") + " units are built using FlexMetal, a patented creation exclusive to JoyCo. This material is softer than organic flesh and ten times more flexible, allowing me to change my form in specific ways.”</i> ");
	output("\n\nYou ask what kind of specific way [bess.heShe] can shift [bess.hisHer] body about.");
	output("\n\n<i>“My insides are filled with a liquid called MeldMilk. By increasing or decreasing the amount in certain parts of my body, my form can be inflated or deflated to tailor my appearance to my [pc.Master]’s tastes,”</i> [bess.name] informs you.");
	output("\n\n<i>“I can retract, grow or recolor my hair, change eye color or grow appendages in order to fulfill your sexual needs. I also have several special modes that can be activated or deactivated, such as sexual roles or the flavor of my cum.”</i>");
	output("\n\n<i>“You can also purchase certain special modifications, clothes, and accessories for me through the JoyCo catalog. These items will be delivered to you within one to three earth days, excluding public holidays and weekends.”</i>");
	output("\n\nAfter [bess.hisHer] lengthy explanation of [bess.hisHer] various features, [bess.name] takes a deep breath. It’s probably a programmed gesture, since [bess.heShe] doesn’t actually <i>need</i> to breathe.");
	output("\n\n<i>“I doubt I’m your perfect mate fresh out of the box, so feel free to change my settings at any time. I’ve got a lot of them, so please be patient with me.”</i> [bess.name] then bows in a very " + bess.mf("well-mannered way", "subservient manner") + ". <i>“...I look forward to serving your needs, [pc.Master]!”</i>");
	//Appear back in ship with Bess added to the Followers menu. 
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Bess/Ben’s Room
public function followerBessRoom():void
{
	clearOutput();
	//bessHeader();

	//if (Bess/Ben Event 11 completed)
	if(flags["BESS_EVENT_11"] != undefined)
	{
		output("The quarters of your ship’s "+ bessCrewRole() +" are a lot more expressive than they used to be. The room is full of polished wooden furniture and beautiful decor. [bess.HeShe]’s made it look more like a room in a house than a starship cabin.");
		
		output("\n\nOn a chest of drawers is vase filled with white asiatic lilies, pink roses, and purple statice. It looks and smells truly breathtaking. On the walls are paintings of planetary landscapes, an assortment of exotic and beautiful locales.");

		output("\n\nAlmost every wall in [bess.hisHer] room has rows of retractable bookshelves built in, in order to contain [bess.himHes] massive book collection. [bess.HeShe] also has a sizable collection of holos. In order to watch them, [bess.heShe] has had a holo-projector built into the wall so[bess.heShe] can watch them in bed.");
	}
	else
	{
		output("[bess.name]’s room is fairly depressing. If you didn’t know any better, you’d think it was a small cargo hold. The best thing it has to offer are freely available power ports and a large built in wardrobe.");
	}

	if(flags["BESS_EVENT_4"] != undefined && flags["BESS_EVENT_11"] == undefined)
	{
		output("\n\nPiles of holos and books have recently begun to fill the room. Even though [bess.heShe] can’t afford shelves - since [bess.heShe] doesn’t have a real job - each stack is perfectly categorized by genre and in alphabetical order. [bess.HeShe]’s even moved a holo-projector into [bess.hisHer] room.");
	}
	
	if(flags["BESS_FRIEND"] == 1)
	{
		output("\n\nOn [bess.hisHer] bedside table are two of [bess.himsHer] favorite books, ‘The Hobbit’ and ‘Do Androids Dream of Electric Sheep?’ [bess.HeShe] loves them so much they never make it back to the shelves.");
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

public function verifyBessModel(jailbreaking:Boolean = false):void
{
	clearOutput();
	bessHeader();
	
	if (jailbreaking) {
		output("As you enter [bess.hisHer] room, [bess.name] greets you with wave and a smile. Returning [bess.hisHer] greeting, you pull out the jailbreaking device and tell [bess.himHer] that you want to switch [bess.hisHer] model settings");
		if (flags["BESS_OWNS_JBKIT"] == 1) output(". Surprisingly, [bess.heShe] doesnt seem to be fazed in the slightest by the request and");
		else output(" again. With a smirk, [bess.heShe] quickly");
		output(" turns around, giving you easy access to the ports on [bess.hisHer] back.");
		output("\n\nConnecting the gadget with [bess.name] is straightforward and soon you find yourself watching a progressbar on the device’s display, waiting for a menu to appear. Once the bar is full however, you only get a brief text telling you to disconnect the machines again. As you pull the plug");
		if (flags["BESS_OWNS_JBKIT"] == 1) output(" out of [bess.name], you can’t help but wonder if you just wasted 25, 000 credits on some scam.");
		else output(", you suddenly remember the energy bubble from last time and take a step back just in case.");
	}
	else output("As you approach [bess.name], [bess.heShe] greets you with wave and a bright smile.");
	if (jailbreaking && flags["BESS_OWNS_JBKIT"] > 1) output("\n\nWithin a moments notice, [bess.name] is suspended in mid air again, engulfed by some kind of semi-transparent, light-refractive hardlight field. After a bit, the usual holographic console appears in front of you.");
	else {
		output("\n\nAll of a sudden, [bess.heShe] is suspended in mid air and out of nowhere, a huge bubble of light engulfs [bess.hisHer] body. The last you see is [bess.hisHer] surprised face before [bess.heShe] is completely covered in a sheet of semi-transparent, light-refractive energy.");
		output("\n\nYou walk up to the strange hex-patterned dome and notice no heat radiating off of it. You give it an experimental touch with " + indefiniteArticle(pc.finger()) + " and confirm that it is some kind of hardlight force field. Slamming your fist against it feels like knocking on thick bulletproof glass.");
		output("\n\nBefore you could figure out an alternate means of bypassing the shield, a holographic console appears in front of you.");
	}
	output("\n\n<i>“Welcome to the JoyCo Personal Maintenance App.”</i> A soothing electronic female voice announces.");
	output("\n\nIs this some kind of software package you weren’t aware of?");
	output("\n\n<i>“It seems that your product is missing some essential configuration data. I will need to do a simple scan to correct the issue. Don’t worry, this is a completely normal personal maintenance operation. In order to undergo this one-time maintenance check, I need to verify your product’s make and model to ensure that the necessary changes are being made. Please tap ‘Next’ to proceed.”</i>");
	if (!jailbreaking) output("\n\nLooks like you don’t have much choice but to go through with it.");
	
	if (flags["BESS_OWNS_JBKIT"] == 1) flags["BESS_OWNS_JBKIT"] = 2;
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", verifyBessModelMenu);
}

public function verifyBessModelMenu(sGender:String = "auto"):void
{
	setBessGender(sGender);
	
	clearOutput();
	bessHeader();
	
	if (sGender == "auto")
	{
		output("You comply by pressing the button on the interface and then you are lead to a new screen.");
		output("\n\n<i>“Please select your product’s model name.”</i> the voice politely asks.");
	}
	else
	{
		output("<i>“Great! The model you have chosen is the Mood Articulate Intelligence Android: " + bess.mf("Breeding Emergency Neutralizer Android Model No.14, or ‘Ben-14’", "Breeding Emergency Sex Substitute Android Model No.13, or ‘Bess-13’") + ". If this is correct, please tap ‘Confirm’ to initiate the personal maintenance scan.”</i>");
	}
	
	clearMenu();
	if (sGender == "male") addDisabledButton(0, "Ben-14");
	else addButton(0, "Ben-14", verifyBessModelMenu, "male");
	if (sGender == "female") addDisabledButton(1, "Bess-13");
	else addButton(1, "Bess-13", verifyBessModelMenu, "female");
	if (sGender == "auto") addDisabledButton(2, "Confirm", "Confirm", "You need to select the appropriate model to proceed.");
	else addButton(2, "Confirm", verifyBessModelFinish);
}
public function verifyBessModelFinish():void
{
	clearOutput();
	bessHeader();
	
	output("<i>“Excellent! I’m initializing the personal maintenance scan for the Mood Articulate Intelligence Android: " + bess.mf("Breeding Emergency Neutralizer Android Model No.14", "Breeding Emergency Sex Substitute Android Model No.13") + " now. Please wait...”</i>");
	output("\n\nYou patiently wait as a series of graphs, bars, and numbers appear on the console, flashing by at a million times a second.");
	output("\n\n<i>“System Integrity ..... check.”</i>");
	output("\n\n<i>“Motor Functions ..... normal.”</i>");
	output("\n\n<i>“Gender Setting ..... corrected: " + bess.mf("male", "female") + ".”</i>");
	output("\n\n<i>“Scan Status ...”</i>");
	output("\n\n<i>“...Complete.”</i>");
	output("\n\nDone already? Well that was fast.");
	output("\n\n<i>“Thank you for using JoyCo, and please enjoy your product!”</i> With that sign-off, the hexagonal shapes making up the bubble shield break apart and vanish one by one.");
	output("\n\n[bess.name] is gently dropped from [bess.hisHer] suspended animation and sits on the floor looking quite confused. You approach [bess.himHer] and ask if [bess.heShe] is okay.");
	output("\n\n<i>“Oh, hello " + bessPCName() +"! Sorry, that kind of hit me by surprise there,”</i> [bess.heShe] apologizes, quickly getting up on [bess.hisHer] [bess.feet]. <i>“Do you need help with anything?”</i>");
	
	processTime(3);
	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

//Greeting Dialogues
public function approachFollowerBess():void
{
	// Dialogues initiated by hitting the [bess.name] button under companions. Or if they has a button under the normal ship stuff. Wherever you place it - just probably not in their room for story/sex consistency reasons.
	clearOutput();
	bessHeader();
	
	if (flags["BESS_NO_EVENT"] == undefined) // Stop events from firing without totally leaving her menu and re-entering.
	{
		if (bessEventHook()) return;
	}

	flags["BESS_NO_EVENT"] = 1;
	
	// Gender model-type hotfix!
	if(!chars["BESS"].hasStatusEffect("Force Male Gender") && !chars["BESS"].hasStatusEffect("Force Fem Gender"))
	{
		verifyBessModel();
		return;
	}
	
	if (flags["BESS_LOVER"] == 1)
	{
		if(bessAffection() >= 90)
		{
			output("[bess.name] grins as soon as [bess.heShe] sees you, " + bess.mf("scooping you into his arms", "leaping into your arms") + " and giving you a long, sensual kiss. <i>“...Mmmm, "+ bessPCName() +"! Have I told you how much I love you today? I’ll tell you once more, just in case you forgot.”</i> [bess.HisHer] [bess.eyes] are gleaming");
			if (bessGlasses()) output(" through [bess.hisHer] glasses");
			output(" with happiness.");
		}
		else if(bessAffection() >= 70)
		{
			output("[bess.name] wraps [bess.hisHer] arms around you, giving you a hello kiss, <i>“...Greetings, "+ bessPCName() +". Come to see me have you?”</i> [bess.HeShe] asks, peering at you");
			if(bessGlasses()) output(" through [bess.hisHer] glasses");
			output(".");
		}
		else if(bessAffection() >= 50)
		{
			output("[bess.name] wraps [bess.hisHer] arms around you, giving you a hello kiss, <i>“...Greetings, "+ bessPCName() +". Come to see me have you? It’s about time!”</i> [bess.HeShe] exclaims");
			if(bessGlasses()) output(", peering at you over [bess.hisHer] glasses");
			output(".");
		}
		else if(bessAffection() >= 30)
		{
			output("[bess.name] wraps [bess.hisHer] arms around you, looking very serious, <i>“..."+ bessPCName() +"... have I done something wrong? It feels like you’re drifting further away from me, you never visit anymore... have I done something wrong?”</i> [bess.HisHer] eyes " + bess.mf("look pained", "are wavering"));
			if(bessGlasses()) output(" behind [bess.hisHer] glasses");
			output(".");
		}
		else
		{
			output("[bess.name] looks at you " + bess.mf("in distress", "meekly") + ", [bess.hisHer] expression completely downtrodden. <i>“...Oh, you’re here "+ bessPCName() +"... do... do you still love me? You’re gone all the time, I never see you anymore...”</i> [bess.HisHer] eyes " + bess.mf("look truly agonized", "are tearing up"));
			if(bessGlasses()) output(" behind [bess.hisHer] glasses");
			output("."); 
		}
	}
	else if (flags["BESS_FRIEND"] == 1)
	{
		if (bessAffection() >= 50)
		{
			output("[bess.name] runs " + bess.mf("at you", "up to you") + ", giving you a massive hug. <i>“..."+ bessPCName() +"! How goes my best friend in the galaxy? Great, I hope!”</i> [bess.heShe] exclaims " + bess.mf("brightly", "excitedly"));
			if(bessGlasses()) output(", eyes shining behind [bess.hisHer] glasses");
			output(".");
		}
		else if(bessAffection() >= 25)
		{
			output("[bess.name] runs " + bess.mf("at you","up to you") + ", giving you a massive hug. <i>“..."+ bessPCName() +"! How goes my best friend in the galaxy? You’ve been gone </i>so long<i>, tell me what you’ve been doing!”</i> [bess.heShe] exclaims cheerily");
			if(bessGlasses()) output(", eyes shining behind [bess.hisHer] glasses");
			output(".");
		}
		else
		{
			output("[bess.name] walks up to you, looking a little downtrodden. <i>“...Hey "+ bessPCName() +", we’re still friends right? I never see you anymore... did I do something wrong?”</i> [bess.HisHer] eyes are " + bess.mf("look a bit strained", "visibly wavering"));
			if(bessGlasses()) output(" behind [bess.hisHer] glasses");
			output(".");
		}
	}
	else
	{
		var randVal:int = rand(4);
		if (randVal == 0)
		{
			output("As you approach [bess.himHer], [bess.name] greets you with a bright smile.");

			output("\n\n<i>“Hello, " + bessPCName() +"! Did you want me to tend to your reproductive needs, or did you just want to talk—?”</i> There’s a querying look in [bess.hisHer] [bess.eyeColor] eyes");
			if (bessGlasses()) output(" as [bess.heShe] peeks over [bess.hisHer] glasses");
			output(" it seems [bess.heShe]’s excited by the prospect of either outcome.");
		}
		else if (randVal == 1)
		{
			output("Spotting your approach, [bess.name] waves cheerily.");

			output("\n\n<i>“" + StringUtil.capitalize(bessPCName()) +"! How’re you doing?”</i> [bess.heShe] asks, sounding genuinely interested. ");
			if (bessGlasses()) output(" [bess.HeShe] nudges up the bridge of [bess.hisHer] glasses.");
		}
		else if (randVal == 2)
		{
			output("When you approach, [bess.name] is stretching out, fingers laced above [bess.hisHer] head.");

			output("\n\n<i>“Oh, " + bessPCName() +"—! Sorry, I didn’t see you there,”</i> [bess.name] remarks, quickly lowering [bess.hisHer] arms. <i>“Can I help you with anything?”</i>");
		}
		else
		{
			output("As you approach [bess.name], [bess.heShe] pulls [bess.hisHer] JoyCord from the wall socket. There’s a lively look in [bess.hisHer] eyes, like someone who’s enjoyed a good meal or nap.");

			output("\n\n<i>“...Nothing like a quick recharge. Oh, "+ bessPCName() +"! It’s good to see you,”</i> [bess.name] flushes. [bess.HeShe]’s acting like you’ve caught [bess.himHer] in the middle of changing.");
		}
	}

	if(bess.hasHair()) output("\n\nToday, [bess.hisHer] "+ bessHairLength() +" [bess.hairColor] hair is styled in "+ bessHairStyle() +" -- the look suits [bess.himHer].");
	else output("\n\nThe synthetic has a smooth, silvery scalp, completely free of hair.");
	if(bess.earType != GLOBAL.TYPE_HUMAN || bess.hornType != 0)
	{
		output(" [bess.HisHer] ");
		if(bess.earType != GLOBAL.TYPE_HUMAN) 
		{
			output("[bess.ears]");
			if (bess.hornType != 0) output(" and ");
		}
		if (bess.hornType != 0) output("[bess.horns]");
		output(" compliment [bess.hisHer] features.");
	}

	output(" [bess.HeShe]’s");
	if (bess.isNude()) output(" utterly nude");
	else if (bess.armor is EmptySlot) output(" clad in just [bess.hisHer] [bess.gear]");
	else output(" dressed in [bess.hisHer] [bess.armor]");
	if (!(bess.armor is EmptySlot)) output(". It clings to [bess.hisHer]");
	else output(", [bess.hisHer]");
	if (bess.tone != 10 && bess.thickness != 10) output(" " + bessTone() +", " + bessThickness());
	else output(" shapely");
	output(" body");
	if (bess.armor is EmptySlot) output(" on display");
	output(".");
	if (bess.biggestTitSize() > 0)
	{
		output(" [bess.HisHer] [bess.chest]");
		if (bess.isChestGarbed()) output(" pointedly strain against the fabric");
		else output(" and [bess.nipples] are exposed");
		output(".");
	}
	
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
			output("[bess.tails] flick");
			if(bess.tailCount == 1) output("s");
			output(" noticeably behind [bess.himHer]");
		}
		output(".");
	}
	if(bessKatana()) output(" At [bess.hisHer] right side is a katana, secure in its glazed sheath.");
	//if (bess.armor = Top&Skirt, Sleepshirt, Maid, Nurse, Schoolgirl, GothLolita, TankMini) 
	if(bess.armor != null && (bess.armor is TopNSkirt || bess.armor is MaidOutfit || bess.armor is NurseOutfit || bess.armor is SchoolgirlOutfit))
	{
		output("\n\nEvery time the hem of [bess.hisHer] outfit rides up, you get a good look at [bess.hisHer] ");
		if(bess.hasVagina() && !bess.hasCock() && bess.lowerUndergarment.shortName != "") output("[bess.underGarment].");
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
			if(bess.hasVagina()) output(" [bess.HisHer] cock ");
			else output(" It ");
			if(bess.biggestCockLength() <= 10) 
			{
				if(bess.lowerUndergarment.shortName != "") output("makes a visible bulge in [bess.hisHer] [bess.underGarment].");
				else output("hangs out proudly between [bess.hisHer] [bess.legs].");
			}
			else
			{
				if(bess.lowerUndergarment.shortName != "") output("cannot be contained by [bess.hisHer] underwear and dangles out defiantly.");
				else output("dangles down proudly between [bess.hisHer] [bess.thighs].");
			}
		}
		if (bess.bellyRating() >= 10)
		{
			output(" [bess.HisHer] [bess.belly] pushes");
			if (bess.bellyRating() >= 50) output(" pointedly");
			output(" against the insides of [bess.hisHer] [bess.armor] and is visibly straining the material.");
		}
	}
	else if(bess.bellyRating() >= 10)
	{
		output("\n\n[bess.HisHer] [bess.belly]");
		if (bess.armor.shortName == "")
		{
			output(" is clearly visible");
			if (bess.isCrotchGarbed() || bess.isChestGarbed()) output(" through [bess.hisHer] undergarments");
			output(".");
		}
		else
		{
			output(" pushes");
			if (bess.bellyRating() >= 50) output(" pointedly");
			output(" against the insides of [bess.hisHer] [bess.armor] and is visibly straining the material.");
		}
	}

	bessFollowerMenu();
}

public function bessFollowerMenu():void
{
	clearMenu();
	
	addButton(0, "Discuss", talkToBessAboutThings);
	addButton(1, "Functions", bessFunctionsMenu, undefined, "Functions", "Go about setting [bess.name]’s various functions, from what [bess.heShe] calls you, [bess.hisHer] sexual roles, what [bess.heShe] wears, to [bess.hisHer] customizable body parts.");
	addButton(2, "Accessories", talkToBessAboutAccessories);
	

	if ((flags["BESS_FRIEND"] != undefined || flags["BESS_LOVER"] != undefined) && bessAffection() < 30)
	{
		addDisabledButton(3, "Sex", "Sex", "[bess.name] isn’t feeling up for sex. You will need to raise [bess.hisHer] affection in order to have sex with [bess.himHer].");
	}
	else if (pc.lust() < 33)
	{
		addDisabledButton(3, "Sex", "Sex", "You’re not antsy enough for sexytimes.");
	}
	else
	{
		addButton(3, "Sex", bessSexMenu);
	}

	if (flags["BESS_LOVER"] == 1)
	{
		addButton(4, "Int. Sex", bessIntimateSexMenu);
	}
	else
	{
		addDisabledButton(4,"Locked","Locked","You don’t know [bess.himHer] well enough for this.");
	}

	if (flags["BESS_EVENT_24"] == undefined)
	{
		addDisabledButton(5,"Locked","Locked","You don’t know [bess.himHer] well enough for this.");
	}
	else
	{
		if (flags["BESS_DATES"] == undefined || flags["BESS_DATES"] < 4)
		{
			if (pc.credits < 500) addDisabledButton(5, "Date", "Date", "You don’t have enough credits!");
			else addButton(5, "Date", bessDateRouter);
		}
		else if (flags["BESS_DATES"] == 4 || (flags["BESS_DATES"] == 5 && bessEventCheck(25)))
		{
			if (pc.credits < 1000) addDisabledButton(5, "Date", "Date", "You don’t have enough credits!");
			else addButton(5, "Date", bessDateRouter)
		}
		else
		{
			addDisabledButton(5, "Date","Date","It doesn’t seem like [bess.name] wants to go on a date ever again after the hassle on Ekurana.");
		}
	}

	if (flags["BESS_EVENT_22"] != undefined)
	{
		if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS")
		{
			addButton(6, "NoSleep", bessClearSleep, undefined, "Don’t Sleep With", "Tell [bess.name] you’d prefer to not share in [bess.hisHer] company whilst sleeping.");
		}
		else
		{
			addButton(6, "SleepW.", bessSleepWith, undefined, "Sleep With", "Tell [bess.name] you’d like to share [bess.hisHer] company whilst sleeping.");
		}
	}
	
	addButton(10, "Appearance", bessAppearance, undefined, "Appearance", "Review [bess.name]’s appearance.");
	addButton(13, "EventMap", bessEventMap, false, "Event Map", "The map of your interactions with [bess.name].");
	addButton(14, "Back", bessLeaveFollowerMenu);
}

public function bessClearSleep():void
{
	clearOutput();
	bessHeader();
	output("You tell [bess.name] that you want more room in your bed to sleep in. [bess.HeShe] nods and moves [bess.hisHer] things out of the way to give you the space you requested.");
	output("\n\n<b>You are no longer sleeping with anyone.</b>");
	flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	bessFollowerMenu();
}

public function bessSleepWith():void
{
	clearOutput();
	bessHeader();
	output("You tell [bess.name] that you want [bess.himHer] to sleep with you. [bess.HeShe] nods and moves some of [bess.hisHer] things into your sleeping quarters, making sure not to clutter the place up too much.");
	output("\n\n<b>You are now sleeping with [bess.name]!</b>");
	flags["CREWMEMBER_SLEEP_WITH"] = "BESS";
	bessFollowerMenu();
}

// wrap exiting to mainGameMenu so we can reset a flag
public function bessLeaveFollowerMenu():void
{
	flags["BESS_NO_EVENT"] = undefined;
	//mainGameMenu();
	crew();
}

//Appearance
public function bessAppearance():void
{
	clearOutput();
	bessHeader();

	output("As you look at [bess.name], [bess.heShe] tries to look away, pretending not to notice that you’re staring at [bess.himHer]. " + bess.mf("He politely coughs", "Her cheeks flush") + " as you look [bess.himHer] over from head to toe.");
	//Bald True:
	if(!bess.hasHair())
	{
		output("\n\n[bess.name]’s head is hairless. All the lines on [bess.hisHer] scalp, usually hidden by artificial locks, are now clearly exposed.");
	}
	else output("\n\nThe synthetic’s [bess.hairColor] " + num2Text(Math.round(bess.hairLength*10)/10) + " inch hair is in "+ bessHairStyle() +".");
	output(" [bess.HisHer] [bess.eyeColor] eyes, framed by " + bess.mf("brooding brows", "thick black lashes"));
	if (bessGlasses()) output(" as well as the glasses [bess.heShe] is currently wearing");
	output(", are even more detailed and faceted than those of a human.");
	if (bess.hornType != 0) output(" On top of [bess.hisHer] head are [bess.horns].");
	if (bess.earType != GLOBAL.TYPE_HUMAN) output(" [bess.HeShe] has a pair of [bess.ears].");
	if (bess.wingType != GLOBAL.TYPE_HUMAN) output(" Behind [bess.hisHer] back is a pair of [bess.wings].");
	if (bess.tailCount > 0) 
	{
		output(" Above [bess.hisHer] rump, [bess.hisHer] [bess.tails] ");
		if(bess.tailCount == 1) output("is");
		else output("are");
		output(" sticking out.");
	}
	if (bess.hasCockTail())
	{
		output("\n\n[bess.name]’s “JoyCord” is ");
		if(bess.tailCount > 0) output(" protruding from just above [bess.hisHer] rear, long and silvery just like [bess.hisHer] body. The tip looks exactly like a thick, synthetic tail-cock. The shaft looks quite bumpy and clearly designed for pleasure.");
	}
	output("\n\n[bess.HisHer] silver skinned body is segmented by lines, clearly identifying [bess.himHer] as a mechanical being despite its otherwise organic appearance. [bess.HeShe] has ");
	if(bess.biggestTitSize() < 1) output("a flat chest");
	else output(bess.breastSize(bess.biggestTitSize()) + " breasts capped with [bess.nipples]. Further down, your eyes are drawn to [bess.hisHer] [bess.hips] and [bess.ass].");

	if (bess.hasVagina())
	{
		output("\n\nNestled between [bess.hisHer] thighs, [bess.heShe] has a smooth, synthetic mound. [bess.HisHer] puffy pussy lips are smooth and inviting. From their apex protrudes a small silvery clit.");
		if (bess.hasCock()) output(" Above [bess.hisHer] synthetic snatch, ");
	}
	else if(bess.hasCock()) output("\n\n");
	if (bess.hasCock()) 
	{
		output("[bess.name] has " + indefiniteArticle(bess.cockDescript(0)) + " with " + indefiniteArticle(bess.cockHead(0)) + ".");
		//if(bess.hasASheath()) output(" and [bess.sheath]"); // dont think I set any cock changes to create a sheath and frankly I dont give a shit at this point
		if(bess.balls > 0) output(" [bess.HisHer] [bess.balls] are contained in " + indefiniteArticle(bess.sackDescript()) + ".");
	}
	//if (bessCumDump = true)
	if(flags["BESS_CUMDUMP"] != undefined)
	{
		output("\n\nHot, sticky cum is leaking down [bess.hisHer] thighs from [bess.hisHer] well-used ");
		if(bess.hasVagina()) output("pussy and ");
		output("ass. [bess.HisHer] lips are smeared with fresh spunk collected from the nearby natives. [bess.HisHer] eyes are unfocused, probably from being used day in and out as a synthetic cum dumpster.");
	}
	output("\n\n[bess.name] currently has " + indefiniteArticle(bess.bellyDescript(true)) + ".");
	if(!bess.isNude()) output(" [bess.HeShe] is currently wearing [bess.gear].");
	else output(" [bess.HeShe] is currently nude.");
	//if (bessKatana = true)
	if(bessKatana()) output("\n\nAt [bess.name]’s right side is a well-polished katana, secured safely in a glazed sheath. The sheath is decorated with eastern-style dragons running up its length, talons stretched out as if to strike. The blade is just as silvery and untarnished as [bess.name] [bess.himHer]self.");
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
		output("\n\nThankfully, you seem to be in luck. [bess.HisHer] gaze is softer than usual, which means you aren’t going to get disciplined for your impertinence. ");
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
//used when returning from customizing something, keeps the previous text onscreen
public function bessFunctionsMenu():void
{
	clearMenu();
	addButton(0, "Titles", talkToBessAboutTitles, undefined, "Titles", "Change [bess.name]’s name or what you call each other in sexual and non-sexual encounters.");

	if (flags["BESS_LOVER_STATUS"] != undefined && (flags["BESS_LOVER_STATUS"].indexOf("dom") != -1 || flags["BESS_LOVER_STATUS"] == "pet" || flags["BESS_LOVER_STATUS"] == "sub")) addDisabledButton(1, "Role", "[bess.name]’s Role", "Since making things ‘official’ with [bess.name], you’re unable to change [bess.hisHer] role!");
	else addButton(1, "Role", talkToBessAboutRoles, undefined, "Roles", "Change [bess.name]’s various roles, such as if [bess.heShe]’s dominant or not during sex.");
	
	addButton(2, "Hair", talkToBessAboutHair, undefined, "Hair", "Ask [bess.name] to change [bess.hisHer] hair such as color, length, and styling.");
	addButton(3, "Eyes", talkToBessAboutEyes, undefined, "Eye Color", "Ask [bess.name] to change [bess.hisHer] eye color.");
	addButton(4, "Chest", talkToBessAboutBoobs, undefined, "Chest", "Ask [bess.name] to change [bess.hisHer] chest, such as breast size and nipple type.");
	addButton(5, "BodyShape", talkToBessAboutBodyShape, undefined, "Body Shape", "Ask [bess.name] to change [bess.hisHer] body shape, such as muscle tone, hip, and ass size.");
	addButton(6, "Genitals", talkToBessAboutGenitals, undefined, "Genitals", "Ask [bess.name] to change [bess.hisHer] genitals, such as if [bess.heShe] has a pussy or a cock.");
	addButton(7, "Cum", talkToBessAboutCum, undefined, "Cum Flavor", "Ask [bess.name] to change [bess.hisHer] cum flavors.");
	addButton(8, "Clothing", talkToBessAboutClothes, undefined, "Clothing", "Ask [bess.name] to change [bess.hisHer] clothing or accessories.");
	if (flags["BESS_OWNS_JBKIT"] >= 1) addButton(9, "Model", verifyBessModel, true, "Model", "Change [bess.name] from Bess-13 to Ben-14 or vice versa.");
	else addDisabledButton(9, "Model", "Model", "You need a Jailbreaking Kit to change the model of [bess.name].");
	
	// I couldn't find any scenes relating to these... anywhere
	//addButton(10, "JoyCord", talkToBessAboutJoyCord);
	//addButton(11, "TentaPussy", talkToBessAboutTentacunt);

	addButton(14, "Back", bessFollowerMenu);
}

//Titles
public function talkToBessAboutTitles():void
{
	clearOutput();
	bessHeader();

	output("<i>“Which one?”</i>");

	clearMenu();
	addButton(0, bess.mf("His", "Her") + " Name", bessTitlesTheirName, undefined, bess.short + "’s Name", "Change [bess.name]’s name. At least, if [bess.heShe] agrees to it...");
	addButton(1, "YourTitle", bessTitlesYourTitles, undefined, "Your Title", "The title that [bess.name] will call you in non-sexual encounters.");
	addButton(2, bess.mf("His", "Her") + "Title", bessTitlesTheirTitle, undefined, bess.mf("His", "Her") + " Title", "The title that you will call [bess.name] in non-sexual encounters.");
	addButton(3, "YourSexName", bessTitlesYourSexName, undefined, "Your Sex Name", "The name that [bess.name] will call you in sexual encounters.");
	addButton(4, bess.mf("His", "Her") + "SexName", bessTitlesTheirSexName, undefined, bess.mf("His", "Her") + " Sex Name", "The title that you will call [bess.name] in sexual encounters.");

	addButton(14, "Back", bessFunctions);
}

public function bessTitlesTheirName():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] peers at you as you suggest changing [bess.hisHer] name. [bess.HeShe]’s clearly not comfortable with the idea.");

	if (flags["BESS_LOVER"] == 1 && (flags["BESS_LOVER_STATUS"].indexOf("dom") != -1))
	{
		output("\n\n<i>“...You want your "+ flags["BESS_LOVER_STATUS"] +" to change [bess.hisHer] name, because you’re unhappy with it?”</i> [bess.name] asks you in a dry tone, as if [bess.heShe] misheard you.");

		output("\n\nYou cough and nod, feeling yourself shrink under [bess.hisHer] penetrating gaze.");
		
		output("\n\n<i>“How about you think about all the things that are incredibly silly with that and come back to me once you figure it out, dear. I’m sure it will dawn on you eventually.”</i>");
	}
	else if (flags["BESS_LOVER"] == 1 || flags["BESS_FRIEND"] == 1)
	{
		output("\n\n<i>“...Look. I know I’m synthetic and");
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
		output("\n\n\n");

		clearMenu();
		addButton(0, "Next", bessTitlesTryChangeName);
	}
}

public function bessTitlesTryChangeName():void
{
	if (this.userInterface.textInput.text == "") {
		bessTitlesTheirName();
		output("<b>You must input a name.</b>");
		return;
	}
	// Illegal characters check. Just in case...
	if (hasIllegalInput(this.userInterface.textInput.text)) {
		bessTitlesTheirName();
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if (this.userInterface.textInput.text.length > 14) {
		bessTitlesTheirName();
		output("<b>You must enter a name no more than fourteen characters long.</b>");
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
			options.push(pc.mf("my King", "my Queen"));
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
			options.push(bess.mf("my King", "my Queen"));
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
			//options.push(flags["BESS_CREW_ROLE"]);
			options.push(bessCrewRole());
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
		if (sex) ttBody = "Set how [bess.name] refers to you during sex.";
		else ttBody = "Set how [bess.name] refers to you in general."
	}
	else
	{
		if (sex) ttBody = "Set how you refer to [bess.name] during sex.";
		else ttBody = "Set how you refer to [bess.name] in general."
	}


	var optSlot:int = -1;
	for (var i:int = 0; optSlot < options.length - 1; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", talkToBessAboutTitles);
			continue;
		}
		else
		{
			optSlot++;
		}
		
		if
		(	( tarPC &&  sex && flags["BESS_PC_SEX_NAME"] == options[optSlot])
		||	( tarPC && !sex && flags["BESS_PC_NAME"] == options[optSlot])
		||	(!tarPC && !sex && flags["BESS_NAME"] == options[optSlot])
		||	(!tarPC &&  sex && flags["BESS_SEX_NAME"] == options[optSlot])
		)
		{
			addDisabledButton(i, StringUtil.toTitleCase(options[optSlot]));
		}
		else
		{
			addButton(i, StringUtil.toTitleCase(options[optSlot]), bessSetTitleOption, [tarPC, sex, options[optSlot]], StringUtil.toTitleCase(options[optSlot]), ttBody);
		}
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
	if ( tarPC &&  sex) flags["BESS_PC_SEX_NAME"] = newTitle;
	if ( tarPC && !sex) flags["BESS_PC_NAME"] = newTitle;
	if (!tarPC && !sex) flags["BESS_NAME"] = newTitle;
	if (!tarPC &&  sex) flags["BESS_SEX_NAME"] = newTitle;

	clearMenu();
	addButton(0, "Next", bessFunctions);
}

public function talkToBessAboutRoles():void
{
	clearOutput();
	bessHeader();
	
	output("<i>“What attitude would you like me to assume during sex, "+ bessPCName() +"?”</i>");

	//[Equal] [Dominant] [Submissive]
	clearMenu();
	if (flags["BESS_SEX_ROLE"] == 0) addDisabledButton(0, "Equal"); 
	else addButton(0, "Equal", setBessRole, 0);
	if (flags["BESS_SEX_ROLE"] == 1) addDisabledButton(1, "Dominant");
	else addButton(1, "Dominant", setBessRole, 1);
	if (flags["BESS_SEX_ROLE"] == 2) addDisabledButton(2, "Submissive");
	else addButton(2, "Submissive", setBessRole, 2);

	var sRole:int = 0;
	if (flags["BESS_SEX_ROLE"] != undefined) sRole = flags["BESS_SEX_ROLE"];

	output("\n\n([bess.name] is currently assuming");
	if (sRole == 0) output(" a role of equal partners.)");
	else if (sRole == 1) output(" the role of a dominant partner.)")
	else if (sRole == 2) output(" the role of a submissive partner.)");
	
	addButton(14, "Back", bessFunctions);
}

public function setBessRole(newRole:int):void
{
	clearOutput();
	bessHeader();

	flags["BESS_SEX_ROLE"] = newRole;

	var sRole:int = 0;
	if (flags["BESS_SEX_ROLE"] != undefined) sRole = flags["BESS_SEX_ROLE"];

	output("[bess.name] is now assuming");
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
	else addDisabledButton(0, "Color", "Hair Color", "[bess.name] has to have hair to be able to select its color!");

	addButton(1, "Length", talkToBessAboutHairLength);

	if (bess.hairLength > 0) addButton(2, "Style", talkToBessAboutHairStyle);
	else addDisabledButton(2, "Style", "Hair Style", "[bess.name] has to have hair to be able to select its style!");

	addButton(14, "Back", bessFunctions);
}

public function talkToBessAboutHairColor():void
{
	clearOutput();
	bessHeader();

	output("<i>“What color were you thinking..?”</i>");

	var options:Array = ["silver", "black", "brown", "red", "blonde", "white", "green", "blue", "orange", "pink", "purple", "violet", "magenta", "cyan", "red and black", "clear"];

	clearMenu();

	var optSlot:int = -1;
	for (var i:int = 0; optSlot < options.length - 1; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", talkToBessAboutHair);
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
	
	output("\n\nA [bess.hairColor] explosion spreads out through [bess.hisHer] locks until it has reached the tip of every tuft. Afterwards, [bess.name] brushes [bess.hisHer] newly ");
	if (newColor == "clear") output("un");
	output("colored hair with an amused smile.");
	
	output("\n\n<i>“Hmm, [bess.hairColor], huh? It’s nice to change your hair up every now and then,”</i> [bess.heShe] " + bess.mf("amusedly", "happily") +" remarks.");
	
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
		if (options[i] == bess.hairLength)
		{
			addDisabledButton(i, lbls[i]);
		}
		else
		{
			addButton(i, lbls[i], bessSetHairLength, options[i]);
		}
	}

	addButton(14, "Back", talkToBessAboutHair);
}

public function bessSetHairLength(newLength:int):void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_EVENT_4"] != undefined)
	{
		output("<i>“You want my hair to be "+ (bess.hairLength < newLength ? "longer" : "shorter") +", huh? I can do that. Just let me say the magic words...”</i> [bess.name] rubs [bess.hisHer] hands together, then spreads out [bess.hisHer] silvery fingers. <i>“...");
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

	output("\n\n[bess.name] then reaches up and runs [bess.hisHer] hand");
	if (bess.hairLength == 0) output(" over [bess.hisHer] bare scalp");
	else output(" over [bess.hisHer] hair");
	output(". It follows [bess.hisHer] hands as [bess.heShe] runs it along, giving the visual impression that [bess.heShe]’s actually moving it with [bess.hisHer] hands.");

	bess.hairLength = newLength;

	output("\n\n[bess.HeShe] doesn’t stop until [bess.heShe]");
	if (newLength == 0) output(" is completely bald, [bess.hisHer] scalp now a glittering silver, just like the rest of [bess.hisHer] body. For some reason when [bess.heShe]’s got no hair it makes [bess.himHer] seem that much more mechanical.");
	else output(" has "+ bessHairLength() +" hair. [bess.HeShe] strokes it in a very human gesture, as if mentally adjusting to the new [bess.hairColor] span.");

	output("\n\n<i>“I hope you like it this way, "+ bessPCName() +". Are");
	if (newLength == 0) output(" bald");
	else if (newLength == 2) output(" short haired");
	else if (newLength == 8) output(" medium haired");
	else if (newLength == 18) output(" long haired");
	else output(" really long haired");
	output(" " + bess.mf("guys", "girls") + " your ‘jam’?”</i> [bess.name] inquires, a twinkle in [bess.hisHer] [bess.eyeColor] eyes.");
	
	if (bess.hairLength > 0 && bess.hairLength < 6) flags["BESS_HAIRSTYLE"] = "a backwards slick";
	else if (bess.hairLength >= 6 && bess.hairLength < 24) flags["BESS_HAIRSTYLE"] = "a messy chignon";
	else if (bess.hairLength >= 24) flags["BESS_HAIRSTYLE"] = "a simple part";
	else flags["BESS_HAIRSTYLE"] = "a bald head";
	
	if (bess.hairLength > 0) output(" [bess.HeShe] then adjusts it to be in "+ bessHairStyle() +".");

	output("\n\n<b>[bess.name]");
	if (bess.hairLength > 0) output(" now has "+ bessHairLength() + " hair");
	else output(" is now bald");
	output("!</b>");

	clearMenu();
	addButton(0, "Next", bessFunctions);
}

public function talkToBessAboutHairStyle():void
{
	clearOutput();
	bessHeader();

	output("<i>“What style were you thinking?”</i>");

	// 9999 -- this would probably be a good idea
	// If you really need to, you could attach an automatic hair reduction to a hair style change (I.e. if Ankle Length Hair and pick bob, reduce hair length to shoulder length). Your call.

	var options:Array = [];
	
	if (bess.hairLength < 12) options.push(["Spikes", "spikes"]);
	options.push(["Messy Curls", "mess of curls"], ["Front Wave", "front wave"], ["Back Slick", "backwards slick"], ["Ruff.Layers", "ruffled layers"]);
	if (bess.hairLength >= 6)
	{
		options.push(["Simple Part", "simple part"], ["Side Part", "side part"]);
		if (bess.hairLength < 12) options.push(["Bob", "bob"]);
		options.push(["Hime", "hime cut"]);
		if (bess.hairLength < 24) options.push(["M.Chignon", "messy chignon"], ["T.Chignon", "tight chignon"]);
		options.push(["Ponytail", "ponytail"], ["Side Plait", "side plait"], ["Single Braid", "single braid"], ["Crown Braid", "crown braid"]);
		if (bess.hairLength < 24) options.push(["Pigtail Buns", "pigtail buns"]);
		options.push(["Twintails", "set of twintails"]);
	}

	var optSlot:int = -1;
	for (var i:int = 0; optSlot < options.length - 1; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", talkToBessAboutHair);
			continue;
		}
		else
		{
			optSlot++;
		}
		
		// bessSetHairStyle() adds an article to some of the styles, so lets check both possibilities
		var bhStyle:String = bessHairStyle();
		var isPlural:Boolean = InCollection(options[optSlot][1], ["spikes", "pigtail buns", "ruffled layers"]);
		if (InCollection(bhStyle, [options[optSlot][1], indefiniteArticle(options[optSlot][1])]))
		{
			addDisabledButton(i, options[optSlot][0], StringUtil.toTitleCase(options[optSlot][1]), "[bess.name]’s hair is already styled in" + (isPlural ? "to " + options[optSlot][1] : " " + indefiniteArticle(options[optSlot][1])) + ".");
		}
		else
		{
			addButton(i, options[optSlot][0], bessSetHairStyle, options[optSlot][1], StringUtil.toTitleCase(options[optSlot][1]), "Style [bess.name]’s hair into " + (isPlural ? options[optSlot][1] : indefiniteArticle(options[optSlot][1])) + ".");
		}
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
		newStyle = indefiniteArticle(newStyle);
	}

	flags["BESS_HAIRSTYLE"] = newStyle;

	output("\n\nWhen [bess.heShe] comes back, [bess.hisHer] [bess.hairColor] "+ bessHairLength() +" hair is done in "+ bessHairStyle() +". [bess.HeShe] seems quite happy with the change of pace.");

	output("\n\n<i>“Interesting look, don’t you think?”</i> [bess.name] touches [bess.hisHer] hair. [bess.HeShe] sure spent [bess.hisHer] time on it!");

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
	for (var i:int = 0; optSlot < options.length - 1; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", bessFunctions);
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
		addButton(14, "Back", bessFunctions);
	}
}

public function bessSetEyeColor(newColor:String):void
{
	clearOutput();
	bessHeader();

	bess.eyeColor = newColor;

	output("[bess.name] brings a silvery hand up beneath [bess.hisHer] eyes. With a simple wave upwards, [bess.hisHer] eyes change their color to [bess.eyeColor] like a party trick.");

	output("\n\n<i>“Voila!”</i> [bess.heShe] exclaims, <i>“Easily done. Anything else you wanted?”</i>");

	output("\n\n<b>[bess.name]’s eyes are now [bess.eyeColor]!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutBoobs():void
{
	clearOutput();
	bessHeader();

	output("<i>“You want to change my chest? Anything in particular?”</i> [bess.name] touches");
	if (bess.biggestTitSize() <= 0) output(" it");
	else output(" [bess.hisHer] "+ bess.breastCup() +" mounds");
	output(", the obvious discussion point.");

	if (flags["BESS_FUCKED"] != undefined || flags["BESS_BOOBCHANGED"] != undefined)
	{
		if (bess.isFeminine()) output("\n\nHer face is a little flushed.");
		else output("\n\nHe coughs a little, trying not to look obviously pleased.");
		output(" You know that [bess.heShe] loves toying with [bess.hisHer] [bess.chestNoun], given how sensitive [bess.hisHer] nipples are.");
	}

	// Altering breast size/lactation once opens the "Nipples" topic in discussion menu.
	clearMenu();
	addButton(0, "BreastSize", talkToBessAboutBoobSize);
	addButton(1, "Lactation", talkToBessAboutLactation);
	if (flags["BESS_BOOBCHANGED"] == undefined) addDisabledButton(2, "Nipples");
	else addButton(2, "Nipples", talkToBessAboutNipples);
	
	addButton(14, "Back", bessFunctions);
}

public function talkToBessAboutBoobSize():void
{
	clearOutput();
	bessHeader();

	output("<i>“Not a fan of");
	if (bess.biggestTitSize() <= 0) output(" flat chests? I can gather some MeldMilk and give myself a nice pair tits. What size?");
	else if (bess.biggestTitSize() <= 15) output(" [bess.breastCupSize]? Easily changed. Just give me a size and I’ll gather the right amount of MeldMilk! Or is it a reduction you want..?");
	else output(" the gargantuan tits you asked for? I’m guessing you want a reduction, because these can’t possibly get any bigger!");
	output("”</i>");

	var options:Array = [0, 1, 2, 3, 4, 7, 11, 15, 19, 24];
	var lbls:Array = 	["Flat", "A-Cup", "B-Cup", "C-Cup", "D-Cup", "E-Cup", "F-Cup", "G-Cup", "H-Cup", "I-Cup"];

	var optSlot:int = -1;
	for (var i:int = 0; optSlot < options.length - 1; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", talkToBessAboutBoobs);
			continue;
		}
		else
		{
			optSlot++;
		}

		if (options[optSlot] == bess.breastRows[0].breastRatingRaw)
		{
			addDisabledButton(i, lbls[optSlot]);
		}
		else
		{
			addButton(i, lbls[optSlot], bessSetBoobSize, options[optSlot]);
		}
	}

	if (options.length < 15)
	{
		addButton(14, "Back", talkToBessAboutBoobs);
	}
}

public function bessSetBoobSize(newSize:int):void
{
	clearOutput();
	bessHeader();

	flags["BESS_BOOBCHANGED"] = 1;

	var opts:Array = [];
	
	if (newSize < bess.biggestTitSize()) opts[0] = true;
	else opts[0] = false;
	opts[1] = newSize;

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
		output("\n\n[bess.HisHer] synthetic milk surges upwards and soon you can see [bess.hisHer] chest begin to bud, forming tiny, girlish breasts. [bess.HisHer] petite peaks poke out and fill [bess.hisHer] hands, almost as if [bess.heShe] had been holding them all along.");

		output("\n\n<i>“Such tiny breasts! Kind of cute, I think. A nice, squeezable size.”</i> [bess.name] emphasises this by fondling [bess.hisHer] teeny tits, [bess.hisHer] face flushing all the while. <i>“...I forgot how much I </i>love<i> having these...”</i>");
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
			else if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED) output(" inverted");
			output(" nipples begin to stick out from the pressure, popping out and swelling in size.");
		}
		else if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE) output(" [bess.HisHer] fuckable nipples suddenly begin to gape and clench almost spasmodically.");
		else if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_DICK) output(" [bess.HisHer] nipples suddenly become erect and [bess.hisHer] chest-dicks show themselves.");
		if (bess.isLactating()) output(" They are soon liberally drooling [bess.hisHer] creamy milk as if [bess.heShe] was heavily pregnant.");

		output("\n\n[bess.name] lets out a sinful moan and rubs them lewdly, [bess.hisHer] nipples clearly sensitive from the pressure. [bess.HeShe] looks quite drunk off the sensation of [bess.hisHer] tits filling up and unable to contain [bess.hisHer] excitement.");

		output("\n\n<i>“My pleasure senses are going into overdrive.");
		if (bessIsEqual()) output(" Can you please milk my aching tits, "+ bessPCSexName() +"?");
		else if (bessIsDom()) output(" Milk my tits, "+ bessPCSexName() +" - that’s an order.");
		else output(" I’m not sure how much I can hold out, "+ bessPCSexName() +"... can I have permission to cum?");
		if (!bessIsDom()) output("”</i> [bess.name] pleads, all the while desperately massaging [bess.hisHer] quickly inflating mounds.");
		else output(" [bess.name] commands you. There is a predatory look in [bess.hisHer] eyes.");

		output("\n\n");
		if (bessIsDom()) output("Obeying [bess.himHer], you");
		else output("Indulging [bess.himHer], you");
		output(" slip behind [bess.name] and gently massage [bess.hisHer] tender udders, giving [bess.himHer] some relief. You knead your fingers deep into [bess.hisHer] billowing breast flesh, almost as if you’re massaging out [bess.hisHer] milk.");

		output("\n\n[bess.HeShe] leans into your chest and lets out a sweet cry as [bess.hisHer] [bess.nipples] ecstatically spurt [bess.hisHer] milk everywhere. They seem incredibly sensitive and as you reach around to stroke [bess.hisHer] nubs [bess.heShe] cries out as if you were stroking [bess.hisHer]");
		if (bess.hasVagina()) output(" clit.");
		else output(" prostate.");

		if (pc.hasCock() && pc.genitalSpot <= 1)
		{
			output("\n\nYou’re so turned on by [bess.hisHer] needy, pleasured wiggling against your groin that you");
			if (pc.isCrotchGarbed()) output(" pull off your [pc.lowerGarments] and");
			output(" slip [pc.oneCock] into [bess.hisHer]");
			if (bess.hasVagina()) output(" [bess.pussy]");
			else output(" [bess.asshole]");
			output(" from behind. As you penetrate [bess.himHer] [bess.heShe] excitedly clenches around your length, letting it easily slide inside of [bess.himHer].");

			output("\n\nYou grind and rub lewdly against each other until you both reach a fevered peak, spurting your [pc.cum] deep inside of [bess.hisHer] [bess.vagOrAss] as it clenches and spasms around you. [bess.HeShe] immediately collects your");
			if (pc.cumQ() < 500) output(" limited");
			else output(" liberal");
			output(" loads of spunk and transforms it into [bess.hisHer] synthetic milk, recycling it to swell out [bess.hisHer] orgasming udders.");

			output("\n\nAfter you finish cumming,");
		}
		else
		{
			output("\n\nYou massage [bess.hisHer] breasts until they swell up to the right size, but");
		}
		output(" it seems [bess.name] has generated more than [bess.heShe] needed. Like a farm animal, you squeeze and massage [bess.hisHer] drooling udders until they spurt out the excess fluid.");

		output("\n\n[bess.name]’s [bess.thighs] shake spastically as [bess.heShe] utterly creams [bess.himHer]self");
		if (pc.hasCock() && pc.genitalSpot <= 1) output(" for a second time");
		output(", overstimulated by the frothy streams from [bess.hisHer] [bess.nipple].");
		if (bess.hasCock()) output(" [bess.HeShe] shoots a thick, steaming load of [bess.hisHer] spunk all over the ship’s floor, splattering the surface beneath [bess.hisHer] feet.");
		else if (bess.hasVagina()) output(" [bess.HisHer] pussy squirts intermittent jets of [bess.hisHer] [bess.girlCum] all over the ship’s floor, splattering the surface beneath [bess.hisHer] feet.");

		bess.breastRows[0].breastRatingRaw = newSize;

		output("\n\nAfter the rather intense experience, [bess.name] strokes [bess.hisHer] new [bess.breastCupSize] breasts. [bess.HisHer] surroundings are an utter mess from the experience and [bess.heShe]");
		if (!bessIsDom()) output(" flushes with embarrassment.");
		else output("shoots you a commanding look.");

		if (bessIsEqual())
		{
			output("\n\n<i>“...Ahem. I’d better get a mop for all this.”</i> [bess.name] coughs, looking about for one.");
			// {if (Celise Companion true
			if (9999 == 0) output(" <i>“...Oh wait, I’ll just get Celise! CELLLIIISE! FREE PROTEIN!”</i> [bess.HeShe] shouts out.");
		}
		else if (bessIsDom())
		{
			output("\n\n<i>“Looks like you’ve got a lot to clean up.");
			if (pc.isBiped()) output(" Hands and knees");
			else output(" On the ground");
			output(", now.”</i> [bess.name] spanks your ass and forces you to lap up [bess.hisHer] milk");
			if (bess.hasCock()) output(" and [bess.cumFlavor] semen");
			if (pc.isBiped()) output(" on all fours");
			else output(" with your tongue");
			output(". [bess.HeShe] make sure you don’t miss a single spot.");

			// {if Celise companion
			if (9999 == 0) output("\n\nCelise comes across you licking up [bess.hisHer] liquids and pouts. <i>“Aww, lucky! Why don’t I get a free meal like that?”</i>");
		}
		else
		{
			output("\n\n<i>“Looks like you’ve got a lot to clean up. Hands and knees, now.”</i> You spank [bess.name]’s ass and force [bess.himHer] to lap up [bess.hisHer] own milk on [bess.hisHer] on all fours");
			if (bess.hasCock()) output(", as well as [bess.hisHer] own [bess.cumFlavor] semen");
			output(". You make sure [bess.heShe] doesn’t miss a single spot.");

			// {if Celise companion 
			if (9999 == 0) output("\n\nCelise comes across [bess.name] licking up [bess.hisHer] liquids and pouts. <i>“Aww, lucky! Why don’t I get a free meal like that?”</i>");
		}

		output("\n\n<b>[bess.name] now has a pair of [bess.breastCupSize] breasts!<\b>");

		bessFunctionsMenu();
	}
	else
	{
		output("\n\n<i>“A decrease? That’s a little trickier. You’ll need to milk me if you want to reduce their size. All that excess liquid has got to go somewhere.”</i> [bess.name] cups [bess.hisHer] [bess.breasts] and emphasises their weight.");

		clearMenu();
		if (!bessIsDom()) addButton(0, "MilkUdders", bessMilkers, opts);
		else addDisabledButton(0, "MilkUdders");
		addButton(1, "Nurse", bessBreastFeed, opts);
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
	if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_NORMAL) addDisabledButton(0, "Normal");
	else addButton(0, "Normal", bessSetNippleType, GLOBAL.NIPPLE_TYPE_NORMAL);
	if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE) addDisabledButton(1, "Fuckable");
	else addButton(1, "Fuckable", bessSetNippleType, GLOBAL.NIPPLE_TYPE_FUCKABLE);
	if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_DICK) addDisabledButton(2, "Dick");
	else addButton(2, "Dick", bessSetNippleType, GLOBAL.NIPPLE_TYPE_DICK);
	if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FLAT) addDisabledButton(3, "Flat");
	else addButton(3, "Flat", bessSetNippleType, GLOBAL.NIPPLE_TYPE_FLAT);
	if (bess.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED) addDisabledButton(4, "Inverted");
	else addButton(4, "Inverted", bessSetNippleType, GLOBAL.NIPPLE_TYPE_INVERTED);

	addButton(14, "Back", talkToBessAboutBoobs);
}

public function bessSetNippleType(newType:int):void
{
	clearOutput();
	bessHeader();

	bess.breastRows[0].nippleType = newType;

	output("[bess.name] plays with them for a bit, and suddenly they become [bess.nipples]! It seems [bess.heShe] came with that particular function built in, so it’s an easy alteration to make.");

	output("\n\n<i>“There you go, two [bess.nipplesNoun]! Anything else..?”</i>");

	output("\n\n<b>[bess.name] now has a pair of [bess.nipplesNoun]!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutLactation():void
{
	clearOutput();
	bessHeader();

	output("<i>“It’s simple to process synthetic milk and lactate it from my nipples. Both biologically and flavor wise, my milk is indistinguishable from the real thing.”</i> [bess.name] sounds rather proud of that fact.");

	clearMenu();

	if (bess.isLactating()) addDisabledButton(0, "Lactate", "Start Lactation", "[bess.name] is already able to lactate.");
	else if (bess.biggestTitSize() > 0) addButton(0, "Lactate", bessStartLactation);
	else addDisabledButton(0, "Lactate", "Start Lactation", "[bess.name] first needs at least some breastflesh in order to lactate.");

	if (bess.isLactating()) addButton(1, "StopLactate", bessStopLactation);
	else addDisabledButton(1, "StopLactate", "Stop Lactation", "[bess.name] needs to be lactating in order to stop it.");

	addButton(14, "Back", talkToBessAboutBoobs);
}

public function bessStartLactation():void
{
	clearOutput();
	bessHeader();

	bess.milkMultiplier = 50;
	bess.milkFullness = 100;

	if (bessIsSub()) output("You order [bess.name] to start lactating");
	else output("You request that [bess.name] start lactating");
	output(" and [bess.heShe] seems happy to");
	if (bessIsDom()) output(" indulge you.");
	else output(" comply.");

	output("\n\n");
	if (bessIsDom()) output("<i>“For SOME");
	else output("<i>“Um, for </i>some<i>");
	output(" reason my designers made the way I activate my lactation mode quite involved, so this may take a moment.”</i> [bess.name]");
	if (bessIsDom()) output(" huffs");
	else output(" apologizes in advance");
	output(", and then gets to it.");

	bessTopStripScene();

	output("\n\nIt seems [bess.name] needs to induce lactation in a very similar way to a nursing mother. There’s a good chance JoyCo, being a medical company, thought it was important for [bess.name] to know this particular method. That, or the more likely scenario; [bess.name]’s developers were just a bunch of pregophiles.");

	output("\n\nCupping one of [bess.hisHer] [bess.breasts] in one hand, [bess.name] begins to gently stroke it like a mother stimulating prolactin. [bess.HeShe] methodically massages each and every part with a flushing expression.");

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

	output("\n\n<i>“Well of course, I’ve only got two hands!”</i> That’s an easily solved problem. You move up behind [bess.himHer] and reach around, gently caressing [bess.hisHer] other [bess.breastNoun].");

	output("\n\nYou feel [bess.himHer] stiffen up at first in surprise, and then relax into your chest with a pleasured sigh. With [bess.himHer] massaging one and you the other, it’s going to take half the time.");
	
	output("\n\nIt’s not long before you feel [bess.name]’s "+bessAssSize()+" ass unconsciously rubbing against your crotch. [bess.HeShe] seems to be getting really worked up by having [bess.hisHer] [bess.breasts] milked.");

	output("\n\nYou’re getting all worked up by [bess.hisHer] heated moans and trembling thighs");
	if (pc.hasCock()) output(", and especially [bess.hisHer] [bess.ass] squeezing and caressing the underside of your [pc.cocksNounSimple].");
	else if (bess.hasCock()) output(". [bess.HisHer] [bess.cock] is pressed hard and erect against [bess.hisHer] [bess.belly].");
	else if (pc.hasVagina()) output(", your [pc.pussy] getting all wet.");
	else output(".");
	output(" The simple breast massage has gotten fairly intense, and now both of you are looking for sexual relief.");

	output("\n\nSliding your arms around [bess.hisHer] waist, you seize [bess.hisHer] [bess.nipples] in your fingers and give them a gentle tug. Immediately [bess.name] turns into a quivering mess and lets an incoherent yet pleased noise, clearly loving them being toyed with.");
	if (bessIsDom()) output(" <i>“Tug");
	else output(" <i>“Please tug");
	output(" and milk my udders, "+ bessPCSexName() +"!”</i>");

	output("\n\n[bess.HisHer] own hands shift underneath [bess.hisHer] [bess.breasts] and begin to massage them while you tease [bess.hisHer] [bess.nipples]. It’s not long before they’re bubbling with [bess.milk], [bess.hisHer] frothy fluid pouring down [bess.hisHer] supple breast flesh and running across your teasing fingers.");

	output("\n\n<i>“Just like that, "+ bessPCSexName() +" - milk my naughty udders!”</i> [bess.name]");
	if (bessIsDom()) output(" orders");
	else output(" breathily begs");
	output(" you. You squeeze [bess.hisHer] [bess.nipples] between your thumb and fingers, milking [bess.himHer] like a farm animal as [bess.hisHer] [bess.milk] lewdly sprays out. You could fill a bucket with [bess.hisHer] it!");

	if ((pc.hasCock() || pc.hasVagina()) && pc.genitalSpot <= 1)
	{
		output("\n\nNow that [bess.heShe]’s started lactating, [bess.name] turns to you with a lusty look in [bess.hisHer] eyes. <i>“You should sit down, "+ bessPCSexName() +",");
		if (!pc.isNude()) output(" and take off your clothes");
		else if (pc.isBiped()) output(" and spread your legs");
		else output(" and prepare yourself");
		output(".”</i>");
		if (bessIsSub()) output(" For a change of pace you do as [bess.heShe] requests.");
		else output(" You do as [bess.heShe] requests, though you wonder what [bess.heShe] has in mind.");

		output("\n\nDropping to [bess.hisHer] knees in front of you, [bess.name] continues to stroke [bess.hisHer] freshly lactating tits, caressing [bess.hisHer] [bess.nipples] with [bess.hisHer] fingers. At the same time, [bess.heShe]");
		if (pc.hasCock()) output(" takes [pc.oneCock] into [bess.hisHer] mouth, sucking on it <i>long</i> and <i>hard</i>.");
		else output(" buries [bess.hisHer] face in your [pc.pussyNoun], sticking [bess.hisHer] tongue and lapping hungrily inside.");

		output("\n\nTaken aback by [bess.hisHer] boldness, you reel in the sensations of [bess.himHer] going down on your");
		if (pc.hasCock()) output(" achingly erect cock");
		else output(" thoroughly wet gash");
		output(". [bess.HeShe] passionately");
		if (pc.hasCock()) output(" sucks you off");
		else output(" laps at your folds");
		output(" as [bess.heShe] massages and squeezes [bess.hisHer] freshly drooling udders, spurting [bess.hisHer] [bess.milk] on the ground beneath you.");

		if (pc.hasCock())
		{
			output("\n\nIt’s not long before you’re arching your back and burying your [pc.cock] in [bess.hisHer] throat hole. You shoot your [pc.cum] without restraint into [bess.hisHer] gaping synthetic neck, spilling your hot seed directly down into [bess.hisHer] stomach. Your hands reach up and grab the back of [bess.hisHer] head, holding onto it as you utterly blow your load.");
		}
		else
		{
			output("\n\nIt’s not long before you’re arching your back and pushing your [pc.pussy] right into [bess.hisHer] face. You cream yourself right in [bess.hisHer] face, your [pc.girlCum] splattering right against [bess.hisHer] mouth in an ecstatic");
			if(pc.girlCumType != GLOBAL.FLUID_TYPE_SPECIAL_GOO) output(", gooey");
			output(" gush. Your hands reach up and grab the back of [bess.hisHer] head, holding onto it as you explosively cum against [bess.hisHer] lips.");
		}

		output("\n\n[bess.name] lets out a low, trembling moan as [bess.heShe] takes your");
		if (!pc.hasCock()) output(" girl");
		output(" spunk to the face. In the process of you cumming and playing with [bess.hisHer] tits [bess.heShe] also creams [bess.himHer]self");
		if (bess.hasCock()) output(", [bess.hisHer] [bess.cock] shooting [bess.hisHer] [bess.cum] all over the place.");
		else if (bess.hasVagina()) output(", [bess.hisHer] [bess.pussy] shooting [bess.hisHer] [bess.girlCum] all over the place.");
		else output(".");
		output(" [bess.HisHer] [bess.nipples] fire spastic spurts of [bess.milk] everywhere, almost like a separate ejaculation of their own.");

		output("\n\nAfterwards [bess.name] wipes off [bess.hisHer] face. There is a truly intoxicated look in [bess.hisHer] [bess.eyeColor] eyes, almost as if [bess.heShe]’s utterly drunk off playing with [bess.hisHer] [bess.nipplesNoun] and giving you head.");
	}
	else
	{
		output("\n\n[bess.name] shudders in your arms and suddenly creams [bess.himHer]self. It seems [bess.hisHer] nipples really are sensitive, especially when [bess.heShe]’s lactating!");
	}

	output("\n\n<i>“I guess that’s that, then? Maybe my designers weren’t so crazy after all,”</i> [bess.name] states in a dreamy voice, [bess.milk] drooling from [bess.hisHer] [bess.nipples]. It’s definitely a different kind of ‘on’ switch.");

	output("\n\n<b>[bess.name] is now lactating from [bess.hisHer] [bess.nipples]!</b>");

	pc.orgasm();
	bess.orgasm();
	bessFunctionsMenu();
}

public function bessStopLactation():void
{
	clearOutput();
	bessHeader();

	output("<i>“Wha- don’t lactate any more?</i> [bess.name] sounds thoroughly disappointed. It seems the "+ bess.mf("male synthetic", "synthetic girl") +" really likes leaking [bess.milk] from [bess.hisHer] breasts.");

	output("\n\n<i>“...Oh well. I guess it </i>is<i> a waste of my resources if you aren’t going to enjoy it,”</i> [bess.heShe] grudgingly concedes. With a simple tweak of [bess.hisHer] nipples, [bess.hisHer] milk suddenly stops flowing.");

	bess.milkMultiplier = 0;
	bess.milkFullness = 0;

	output("\n\n... What, <i>that’s it</i>? No kinky breast massages, nothing? Seems it’s a lot simpler to turn that mode on than it is to turn it off again.");

	output("\n\n");
	if (bess.isFeminine()) output("Wearing the world’s biggest pout");
	else output("With a downhearted sigh");
	output(", [bess.name] goes off to look for something else to do. At least the ship will be saving money on breast pads.");

	bessFunctionsMenu();
}

public function talkToBessAboutBodyShape():void
{
	clearOutput();
	bessHeader();

	output("<i>“My body shape is easily changed. What would you like me to alter...?”</i>");

	clearMenu();
	addButton(0, "Hips", talkToBessAboutHips);
	addButton(1, "Butt", talkToBessAboutButt);
	addButton(2, "Tone", talkToBessAboutTone);
	addButton(3, "Stomach", talkToBessAboutStomach);
	addButton(4, "Thickness", talkToBessAboutThickness);

	addButton(14, "Back", bessFunctions);
}

public function talkToBessAboutHips():void
{
	clearOutput();
	bessHeader();

	output("<i>“You know what they say; it’s all in the hips! What size were you thinking of, "+ bessPCName() +"?”</i>");

	clearMenu();
	if (bess.hipRatingRaw == 0) addDisabledButton(0, "Boyish");
	else addButton(0, "Boyish", setBessHipSize, 0);
	if (bess.hipRatingRaw == 2) addDisabledButton(1, "Slender");
	else addButton(1, "Slender", setBessHipSize, 2);
	if (bess.hipRatingRaw == 4) addDisabledButton(2, "Average");
	else addButton(2, "Average", setBessHipSize, 4);
	if (bess.hipRatingRaw == 6) addDisabledButton(3, "Ample");
	else addButton(3, "Ample", setBessHipSize, 6);
	if (bess.hipRatingRaw == 10) addDisabledButton(4, "Curvy");
	else addButton(4, "Curvy", setBessHipSize, 10);
	if (bess.hipRatingRaw == 15) addDisabledButton(5, "Voluptuous");
	else addButton(5, "Voluptuous", setBessHipSize, 15);
	if (bess.hipRatingRaw == 20) addDisabledButton(6, "Massive");
	else addButton(6, "Massive", setBessHipSize, 20);

	addButton(14, "Back", talkToBessAboutBodyShape);
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
	if (bess.buttRatingRaw == 0) addDisabledButton(0, "Buttless");
	else addButton(0, "Buttless", setBessButtSize, 0);
	if (bess.buttRatingRaw == 2) addDisabledButton(1, "Tight");
	else addButton(1, "Tight", setBessButtSize, 2);
	if (bess.buttRatingRaw == 4) addDisabledButton(2, "Average");
	else addButton(2, "Average", setBessButtSize, 4);
	if (bess.buttRatingRaw == 6) addDisabledButton(3, "Noticable");
	else addButton(3, "Noticable", setBessButtSize, 6);
	if (bess.buttRatingRaw == 8) addDisabledButton(4, "Large");
	else addButton(4, "Large", setBessButtSize, 8);
	if (bess.buttRatingRaw == 10) addDisabledButton(5, "Jiggly");
	else addButton(5, "Jiggly", setBessButtSize, 10);
	if (bess.buttRatingRaw == 13) addDisabledButton(6, "Expansive");
	else addButton(6, "Expansive", setBessButtSize, 13);
	if (bess.buttRatingRaw == 16) addDisabledButton(7, "Huge");
	else addButton(7, "Huge", setBessButtSize, 16);
	if (bess.buttRatingRaw == 20) addDisabledButton(8, "Massive");
	else addButton(8, "Massive", setBessButtSize, 20);

	addButton(14, "Back", talkToBessAboutBodyShape);
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
	if (bess.tone == 100) addDisabledButton(0, "Muscular");
	else addButton(0, "Muscular", setBessTone, 100);
	if (bess.tone == 70) addDisabledButton(1, "SemiMuscular");
	else addButton(1, "SemiMuscular", setBessTone, 70);
	if (bess.tone == 50) addDisabledButton(2, "Average");
	else addButton(2, "Average", setBessTone, 50);
	if (bess.tone == 30) addDisabledButton(3, "SemiSoft");
	else addButton(3, "SemiSoft", setBessTone, 30);
	if (bess.tone == 0) addDisabledButton(4, "Soft");
	else addButton(4, "Soft", setBessTone, 0);
	
	addButton(14, "Back", talkToBessAboutBodyShape);
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

	clearMenu();
	if (bess.thickness == 100) addDisabledButton(0, "Thick");
	else addButton(0, "Thick", setBessThickness, 100);
	if (bess.thickness == 70) addDisabledButton(1, "SemiThick");
	else addButton(1, "SemiThick", setBessThickness, 70);
	if (bess.thickness == 50) addDisabledButton(2, "Average");
	else addButton(2, "Average", setBessThickness, 50);
	if (bess.thickness == 30) addDisabledButton(3, "SemiThin");
	else addButton(3, "SemiThin", setBessThickness, 30);
	if (bess.thickness == 0) addDisabledButton(4, "Thin");
	else addButton(4, "Thin", setBessThickness, 0);
	
	addButton(14, "Back", talkToBessAboutBodyShape);
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
		else if (newValue == 70) output(" has a nice set of muscles");
		else if (newValue == 50) output(" is a nice mix of soft curves and toned muscle");
		else if (newValue == 30) output(" is nice and plushy, without being overly so");
		else output(" is soft and fleshy");
	}
	else
	{
		if (newValue == 100) output(" is incredibly broad");
		else if (newValue == 70) output(" is thicker than average");
		else if (newValue == 50) output(" is of average size");
		else if (newValue == 30) output(" is thinner than average");
		else output(" is incredibly thin");
	}
	output(".");

	if (asTone) bess.tone = newValue;
	else bess.thickness = newValue;

	output("\n\n<b>[bess.name] now has ");
	if (asTone) output(indefiniteArticle(bessTone()));
	else output(indefiniteArticle(bessThickness()));
	output(" body!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutStomach():void
{
	clearOutput();
	bessHeader();

	output("<i>“My stomach, huh? Well, I can change that fairly easily. What size were you thinking, , "+ bessPCName() +"?”</i>");

	clearMenu();
	if (bess.bellyRatingRaw == 0) addDisabledButton(0, "Normal");
	else addButton(0, "Normal", setBessBelly, 0);
	if (bess.bellyRatingRaw == 10) addDisabledButton(1, "Cushy");
	else addButton(1, "Cushy", setBessBelly, 10);
	if (bess.bellyRatingRaw == 15) addDisabledButton(2, "Pudgy");
	else addButton(2, "Pudgy", setBessBelly, 15);
	if (bess.bellyRatingRaw == 20) addDisabledButton(3, "Large");
	else addButton(3, "Large", setBessBelly, 20);
	if (bess.bellyRatingRaw == 30) addDisabledButton(4, "Pregnant");
	else addButton(4, "Pregnant", setBessBelly, 30);
	if (bess.bellyRatingRaw == 40) addDisabledButton(5, "Full");
	else addButton(5, "Full", setBessBelly, 40);
	if (bess.bellyRatingRaw == 50) addDisabledButton(6, "Expansive");
	else addButton(6, "Expansive", setBessBelly, 50);
	if (bess.bellyRatingRaw == 60) addDisabledButton(7, "Excessive");
	else addButton(7, "Excessive", setBessBelly, 60);
	if (bess.bellyRatingRaw == 80) addDisabledButton(8, "Over-inflated");
	else addButton(8, "Over-inflated", setBessBelly, 80);
	if (bess.bellyRatingRaw == 90) addDisabledButton(9, "Massive");
	else addButton(9, "Massive", setBessBelly, 90);
	if (bess.bellyRatingRaw == 100) addDisabledButton(10, "StupidlyHuge");
	else addButton(10, "StupidlyHuge", setBessBelly, 100);
	
	addButton(14, "Back", talkToBessAboutBodyShape);
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
	else currRating = bess.bellyRatingRaw;

	// Increase
	if (newRating > currRating)
	{
		output("<i>“A size increase, huh? Easily done. Let me just properly allocate the right amount of MeldMilk, then I’ll need to shift it using my JoyCord,”</i> [bess.name] remarks.");

		if (flags["BESS_CHANGED_CURVES"] == undefined)
		{
			output("\n\nShift it using [bess.hisHer] JoyCord? You’re not sure what [bess.heShe] means...");
		}

		output("\n\nThe " + bess.mf("male synthetic", "synthetic girl") +" lies on [bess.hisHer] back and spreads [bess.hisHer] thighs. [bess.HeShe] then raises [bess.hisHer] ass and hips off the ground, lewdly exposing [bess.hisHer] [bess.crotch] to you.");
		
		output("\n\n<i>“...I’ve got to directly pump it into my");
		if (targetRating == BESS_CURVE_BUTT || !bess.hasVagina()) output(" asshole");
		else output(" [bess.pussyNoun]");
		output(" using my JoyCord. You can watch if you want.”</i> [bess.name] winks at you as [bess.heShe] slips [bess.hisHer] silvery, phallic-tipped tail around and between [bess.hisHer] thighs.");
		
		output("\n\nYou can’t help but be turned on as you watch [bess.hisHer] glistening glans naughtily rub against [bess.hisHer]");
		if (targetRating == BESS_CURVE_BUTT || !bess.hasVagina()) output(" [bess.ass]. [bess.name] reaches down and parts [bess.hisHer] cheeks with [bess.hisHer] hands, flashing [bess.hisHer] [bess.asshole] at you.");
		else output(" [bess.pussyNoun]. [bess.name] reaches down and parts [bess.hisHer] puffy lower lips with [bess.hisHer] fingers, flashing [bess.hisHer] moist inner folds at you.");
		
		output("\n\nAs it slowly slides inside of [bess.hisHer] silvery");
		if (targetRating == BESS_CURVE_BUTT || !bess.hasVagina()) output(" pucker");
		else output(" snatch");
		if (bess.hasCock()) output(" [bess.hisHer] [bess.cock] jerks and spasms with delight. Dollops of pre-cum drool from [bess.hisHer] [bess.cockHead] and drip onto [bess.hisHer] synthetic belly.");
		else output(" [bess.heShe] lets out a pleasured little moan and arches [bess.hisHer] back. [bess.HeShe] is enjoying every second of [bess.hisHer] pulsing phallus pushing inside [bess.himHer]self and [bess.heShe] isn’t afraid to show it.");

		output("\n\nOnce it is fully inside of [bess.himHer] you hear an audible sloshing noise. Suddenly lumps are moving along the prehensile pipe and pumping directly into [bess.hisHer]");
		if (targetRating == BESS_CURVE_BUTT || !bess.hasVagina()) output(" [bess.ass]");
		else output(" [bess.pussy]");
		output(". The delightful pressure inside [bess.hisHer] sensitive inner walls forces [bess.hisHer] eyes to roll back. It seems [bess.heShe] is in a state of incalculable bliss right now.");
		
		output("\n\nAdding to the mix and unwilling to be a passive observer, you");
		if (bess.hasCock()) output(" grab [bess.hisHer] [bess.cockNounSimple] and begin to jerk [bess.himHer] off.");
		else if (bess.hasVagina() && targetRating == BESS_CURVE_BUTT) output(" grab [bess.hisHer] tail and begin to use it like a dildo, fucking [bess.himHer] with it as [bess.heShe] is simultaneously inflated.");
		else output(" stick your fingers inside of [bess.hisHer] defenseless [bess.ass] and begin to screw [bess.himHer] with them.");
		output(" [bess.name] lets out a sweet cry and immediately creams");
		if (bess.hasCock()) output(" all over [bess.hisHer] stomach and around [bess.hisHer] own cock. [bess.HeShe] squeezes and spasms lewdly around [bess.hisHer] own extensive length as it simultaneously shoots [bess.hisHer] juice into [bess.himHer]");
		output(".");
		
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
			output(" " + indefiniteArticle(bessAssSize()) + " ass!");
		}
		else if (targetRating == BESS_CURVE_HIPS)
		{
			bess.hipRatingRaw = newRating;
			output(" " + bessThighSize() + " thighs and hips!");
		}
		else
		{
			bess.bellyRatingRaw = newRating;
			output(" " + indefiniteArticle(bessBellySize()) + " belly!");
		}
		output("</b>");
	}
	else
	{
		output("<i>“A size decrease, huh? I can do that. It’s uh... best done in private, though.”</i> [bess.name] remarks,");
		if (!bessIsDom()) output(" flushing");
		else output(" coughing");
		output(" a little. [bess.HeShe] does grab a pump before [bess.heShe] leaves.");
		
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
	else addDisabledButton(2, "Knot", "Knot State", "[bess.name] needs to be sporting a cock to configure its knottyness!");

	addButton(14, "Back", bessFunctions);
}

public function talkToBessAboutCock():void
{
	clearOutput();
	bessHeader();

	output("<i>“I have the ability to equip a cock extension to better pleasure you, "+ bessPCName() +". Would you like me to do that?”</i>");

	// All cocks except for Dino cock have girth and length = ½ pc orifice capacity.

	clearMenu();
	if (!bess.hasCock()) addDisabledButton(0, "None");
	else addButton(0, "None", setBessCockType, -1);
	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_SYNTHETIC && bess.balls == 0) addDisabledButton(1, "Normal");
	else addButton(1, "Normal", setBessCockType, GLOBAL.TYPE_HUMAN);
	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_SYNTHETIC && bess.balls > 0) addDisabledButton(2, "Normal+Balls");
	else addButton(2, "Normal+Balls", setBessCockType, -2);
	
	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_SAURIAN) addDisabledButton(3, "Dino");
	else if (bessHasCockType(BESS_COCKTYPE_DINO)) addButton(3, "Dino", setBessCockType, GLOBAL.TYPE_SAURIAN);
	else addDisabledButton(3, "Dino", "Dinosaur", "[bess.name] doesn’t have access to this cock style!");

	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_EQUINE) addDisabledButton(4, "Equine");
	else if (bessHasCockType(BESS_COCKTYPE_HORSE)) addButton(4, "Equine", setBessCockType, GLOBAL.TYPE_EQUINE);
	else addDisabledButton(4, "Equine", "Equine", "[bess.name] doesn’t have access to this cock style!");

	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_CANINE) addDisabledButton(5, "Canine");
	else if (bessHasCockType(BESS_COCKTYPE_DOG)) addButton(5, "Canine", setBessCockType, GLOBAL.TYPE_CANINE);
	else addDisabledButton(5, "Canine", "Canine", "[bess.name] doesn’t have access to this cock style!");

	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_VULPINE) addDisabledButton(6, "Vulpine");
	else if (bessHasCockType(BESS_COCKTYPE_FOX)) addButton(6, "Vulpine", setBessCockType, GLOBAL.TYPE_VULPINE);
	else addDisabledButton(6, "Vulpine", "Vulpine", "[bess.name] doesn’t have access to this cock style!");

	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_DEMONIC) addDisabledButton(7, "Demonic");
	else if (bessHasCockType(BESS_COCKTYPE_DEMON))addButton(7, "Demonic", setBessCockType, GLOBAL.TYPE_DEMONIC);
	else addDisabledButton(7, "Demonic", "Demonic", "[bess.name] doesn’t have access to this cock style!");

	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_TENTACLE) addDisabledButton(8, "Tentacle");
	else if (bessHasCockType(BESS_COCKTYPE_TENTACLE)) addButton(8, "Tentacle", setBessCockType, GLOBAL.TYPE_TENTACLE);
	else addDisabledButton(8, "Tentacle", "Tentacle", "[bess.name] doesn’t have access to this cock style!");

	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_FELINE) addDisabledButton(9, "Feline");
	else if (bessHasCockType(BESS_COCKTYPE_CAT)) addButton(9, "Feline", setBessCockType, GLOBAL.TYPE_FELINE);
	else addDisabledButton(9, "Feline", "Feline", "[bess.name] doesn’t have access to this cock style!");

	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_DRACONIC) addDisabledButton(10, "Draconic");
	else if (bessHasCockType(BESS_COCKTYPE_DRAGON)) addButton(10, "Draconic", setBessCockType, GLOBAL.TYPE_DRACONIC);
	else addDisabledButton(10, "Draconic", "Draconic", "[bess.name] doesn’t have access to this cock style!");

	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_GOOEY) addDisabledButton(11, "Goo");
	else if (bessHasCockType(BESS_COCKTYPE_GOOEY)) addButton(11, "Goo", setBessCockType, GLOBAL.TYPE_GOOEY);
	else addDisabledButton(11, "Goo", "Goo", "[bess.name] doesn’t have access to this cock style!");

	if (bess.hasCock() && bess.cocks[0].cType == GLOBAL.TYPE_VENUSPITCHER) addDisabledButton(12, "Plant");
	else if (bessHasCockType(BESS_COCKTYPE_VENUSPITCHER)) addButton(12, "Plant", setBessCockType, GLOBAL.TYPE_VENUSPITCHER);
	else addDisabledButton(12, "Plant", "Plant", "[bess.name] doesn’t have access to this cock style!");

	addButton(14, "Back", talkToBessAboutGenitals);
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
		bess.cocks[0].cThicknessRatioRaw = 1.2;
		bess.cocks[0].clearFlags();

		bess.balls = 2;
		bess.ballSizeRaw = 8;

		output("You decide you’d like to equip [bess.name] with the dino cock attachment you purchased from JoyCo. It takes some work to equip [bess.name] with it; it’s a two-person effort just to get it attached. Once you’re done, [bess.heShe] models off [bess.hisHer] prehistorically massive member and balls for your enjoyment. Its girth is clearly something else - you’ve seen smaller tree trunks.");

		output("\n\nThe head of the cock is entirely covered in rounded spikes or nubs. They’re big enough that they look like you could hold on to them. [bess.HisHer] urethra is so big that a regular cock could fit inside of it. The shaft is segmented; each part looks like it has a muscle for squeezing or stretching.");

		output("\n\n<i>“Umm, "+ bessPCName() +", I’m not sure this is going to fit inside you. It seems like it’s used for insemination of city-destroying monsters...”</i> [bess.name] voices [bess.hisHer] concerns about the size of [bess.hisHer] positively preposterous phallus. <i>“Have you checked to see if your health insurance covers this kind of thing?”</i>");

		if (silly && rand(2) == 0) output("\n\n<b>[bess.name] now has a gigantic ogre cock and balls!</b>");
		else if (rand(2) == 0) output("\n\n<b>[bess.name] now has a saurian cock and balls!</b>");
		else output("\n\n<b>[bess.name] now has a dino cock and balls!</b>");
	}
	else if (newType == GLOBAL.TYPE_EQUINE)
	{
		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_EQUINE;
		bess.cocks[0].cLengthRaw = 16;
		bess.cocks[0].cThicknessRatioRaw = 1.1;
		bess.cocks[0].clearFlags();
		bess.cocks[0].addFlag(GLOBAL.FLAG_FLARED);

		bess.balls = 2;
		bess.ballSizeRaw = 7;

		output("You decide you’d like to equip [bess.name] with the horse cock attachment you purchased from JoyCo. It takes some work to equip [bess.name] with it, it’s a two-person effort just to get it attached. Once you’re done, [bess.heShe] models off [bess.hisHer] newly fastened horse phallus and balls for your enjoyment.");
		
		output("\n\n[bess.HisHer] new equine cock flares at you, it looks ready and raring to go. <i>“What do you think, "+ bessPCName() +", did you want to take a ride?”</i>");

		if (rand(2) == 0) output("\n\n<b>[bess.name] now has an equine cock and balls!</b>");
		else output("\n\n<b>[bess.name] now has a horse cock and balls!</b>");
	}
	else if (newType == GLOBAL.TYPE_CANINE)
	{
		var knot:Boolean = bess.hasKnot();

		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_CANINE;
		bess.cocks[0].cLengthRaw = 12;
		bess.cocks[0].cThicknessRatioRaw = 1;
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
		bess.cocks[0].cThicknessRatioRaw = 1;
		bess.cocks[0].clearFlags();
		bess.cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);

		bess.balls = 0;
		bess.ballSizeRaw = 0;

		output("You decide you’d like to equip [bess.name] with the tentacle cock attachment you purchased from JoyCo. It’s a slippery sucker to attach (literally) as you fasten the strange “phallus” between [bess.hisHer] legs.");
		
		output("\n\nIt swings about as [bess.heShe] swells and shrinks it at will, there’s not many things it couldn’t probe or penetrate. At its tip is a slit where [bess.hisHer] seed can be pumped out into any orifice.");
		
		output("\n\n<i>“Wow, where’s a school-girl when you need one, eh, "+ bessPCName() +"?”</i> [bess.name] cheekily remarks, marvelling at [bess.hisHer] prehensile phallus.");
		
		output("\n\n<b>[bess.name] now has a dangerous looking tentacle cock!</b>");
	}
	else if (newType == GLOBAL.TYPE_GOOEY)
	{
		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_GOOEY;
		bess.cocks[0].cLengthRaw = 16;
		bess.cocks[0].cThicknessRatioRaw = 1;
		bess.cocks[0].clearFlags();

		bess.balls = 0;
		bess.ballSizeRaw = 0;

		output("You decide you’d like to equip [bess.name] with the goo cock attachment you purchased from JoyCo. You pull out a small ring that seems to be some kind of compact material manipulator. As soon as you attach it to [bess.hisHer], [bess.name]’s Meld-Milk insides pour out and form a semi-transparent, metallic looking goo cock!");
		
		output("\n\n<i>“Wow, guess my insides are kind of like that of a metallic goo [bess.boyGirl]...! Imagine the naughty things I can do with this, "+ bessPCName() +", I could probably penetrate even the smallest cracks.”</i> [bess.HeShe] strokes [bess.hisHer] silver gelatinous cock as it ripples about. [bess.HeShe] seems to be able to harden the liquid substance at will.");
		
		output("\n\n<b>[bess.name] now has a goo cock!</b>");
	}
	else if (newType == GLOBAL.TYPE_VENUSPITCHER)
	{
		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_VENUSPITCHER;
		bess.cocks[0].cLengthRaw = 12;
		bess.cocks[0].cThicknessRatioRaw = 1;
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
		
		output("\n\n<b> [bess.name] now has a plant cock!</b>");
	}
	else if (newType == GLOBAL.TYPE_DRACONIC)
	{
		if (!bess.hasCock()) bess.cocks.push(new CockClass());
		bess.cocks[0].cType = GLOBAL.TYPE_DRACONIC;
		bess.cocks[0].cLengthRaw = 16;
		bess.cocks[0].cThicknessRatioRaw = 1.1;
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
		output("You decide you’d like [bess.name]");
		// None
		if (newType == -1)
		{
			output(" without a cock");
			if (bess.hasCock()) bess.cocks = [];
			bess.balls = 0;
			bess.ballSizeRaw = 0;
		}
		// Normal and Normal+Balls
		else
		{
			if (!bess.hasCock()) bess.cocks.push(new CockClass());
			if (newType <= GLOBAL.TYPE_HUMAN)
			{
				output(" to have a human-shaped cock");
				bess.cocks[0].cType = GLOBAL.TYPE_SYNTHETIC;
			}
			else
			{
				output(" to have " + indefiniteArticle(GLOBAL.TYPE_NAMES[newType].toLowerCase()) + "-shaped cock");
				//bess.cocks[0].cType = newType;
				bess.shiftCock(0, newType); // Use this to get the proper flags.
			}
			bess.cocks[0].cLengthRaw = 12;
			bess.cocks[0].cThicknessRatioRaw = 1.5;
			//bess.cocks[0].clearFlags();
			bess.balls = 2;
			bess.ballSizeRaw = 4;
		}
		// With balls
		if (newType == -2)
		{
			output(" with balls");
			//bess.cocks[0].cType = GLOBAL.TYPE_HUMAN;
			bess.balls = 2;
			bess.ballSizeRaw = 4;
		}
		// Without balls
		else if (newType == GLOBAL.TYPE_HUMAN)
		{
			//bess.cocks[0].cType = GLOBAL.TYPE_HUMAN;
			bess.balls = 0;
			bess.ballSizeRaw = 0;
		}
		output(".");
		output("\n\n<i>“Just one second, "+ bessPCName() +", while I make the adjustments.”</i> [bess.name] darts off and when [bess.heShe] comes back,");
		if (newType == -1) output(" [bess.hisHer] cock is gone - though where [bess.heShe]’s stored it is a mystery. <i>“Do you like me better this way, "+ bessPCName() +"?”</i>\n\n<b>[bess.name] has removed [bess.hisHer] cock!</b>");
		else
		{
			bess.cocks[0].cockColor = "silver";
			output(" [bess.heShe]’s sporting " + indefiniteArticle(bessCockType()) + " cock! [bess.HeShe] eagerly models it off for you. <i>“Do you like it, "+ bessPCName() +"?”</i>\n\n<b>[bess.name] now has " + indefiniteArticle(bess.cockDescript(0)));
			if (bess.balls > 0) output(" and balls");
			output("!</b>");
		}
	}
	
	if (bess.balls > 0 && newType > GLOBAL.TYPE_HUMAN)
	{
		clearMenu();
		addButton(0, "Next", bessFunctionsMenu);
		addButton(1, "No Balls", setBessNoBalls, undefined, "Remove Balls", "Ask [bess.name] to remove [bess.hisHer] balls.");
	}
	else bessFunctionsMenu();
}

public function setBessNoBalls():void
{
	clearOutput();
	bessHeader();
	output("You ask [bess.name] if [bess.heShe] could get rid of [bess.hisHer] balls.");
	output("\n\n<i>“You want me to remove them? Very well, "+ bessPCName() +".”</i>");
	output("\n\nRight before your eyes, [bess.hisHer] [bess.balls] begins to deflate, shrink, and receed back into [bess.hisHer] pelvis.");
	output("\n\n<i>“Should you change your mind, just swap between my cock extensions and I will be re-equipped with balls again.”</i>");
	output("\n\n<b>[bess.name] has removed [bess.hisHer] balls!</b>");
	
	bess.balls = 0;
	bess.ballSizeRaw = 0;
	
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

	addButton(14, "Back", talkToBessAboutGenitals);
}

public function bessRemovePussy():void
{
	clearOutput();
	bessHeader();

	output("In what can only be described as bizarre to watch, [bess.name]’s silvery vagina moves up just slightly into [bess.hisHer] body. A skin covered panel then slides down and out, pressing into the empty spot and filling the gap. What is left is a perfectly smooth groin area.");
	
	output("\n\n<b>[bess.name] no longer has " + indefiniteArticle(bess.vaginaDescript(0)) + "!</b>");

	bess.removeVagina();

	bessFunctionsMenu();
}

public function bessGainPussy():void
{
	clearOutput();
	bessHeader();

	output("In what can only be described as bizarre to watch, [bess.name]’s flat groin slides in and up, like a hatch opening. From inside a silvery vagina pushes out, filling the gap.");

	if (!bess.hasVagina()) bess.vaginas.push(new VaginaClass());
	bess.vaginas[0].type = GLOBAL.TYPE_SYNTHETIC;
	bess.vaginas[0].vaginaColor = "silver";
	
	output("\n\n<b>[bess.name] now has " + indefiniteArticle(bess.vaginaDescript(0)) + "!</b>");

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

	addButton(14, "Back", talkToBessAboutGenitals);
}

public function bessGainKnot():void
{
	clearOutput();
	bessHeader();

	output("[bess.name]’s [bess.cock] suddenly begins to flare at the base. The entire process takes mere moments. Afterwards, [bess.heShe] has a muscular lump at the stem of [bess.hisHer] [bess.cockNounSimple].");

	output("\n\nFlexing it and watching it swell and recede, [bess.name] gives a small grin. <i>“Wow, I could trap anyone with this! Fancy a ride, "+ bessPCName() +"?”</i>");

	bess.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);

	output("\n\n<b>[bess.name]’s [bess.cockNounSimple] now has " + indefiniteArticle(bess.knotDescript(0)) + "!</b>");

	bessFunctionsMenu();
}

public function bessRemoveKnot():void
{
	clearOutput();
	bessHeader();

	output("Within seconds of your request being issued, [bess.name]’s [bess.knot] shrinks until it is completely gone. The signiture lump is now missing from the base of [bess.hisHer] [bess.cockNounSimple].");
	
	output("\n\n<b>[bess.name] no longer has a knot!</b>");

	bess.cocks[0].delFlag(GLOBAL.FLAG_KNOTTED); // Why the fuck is the method to do this delFlag on cocks but removeFlag everywhere else cmon sonnnn.

	bessFunctionsMenu();
}

public function talkToBessAboutCum():void
{
	clearOutput();
	bessHeader();

	output("<i>“My cum? Which one in particular...?”</i> [bess.name] asks.");

	clearMenu();
	
	if (bess.hasCock()) addButton(0, "CumFlavor", talkToBessAboutCumFlavour, true, "Cum Flavor", "Change [bess.hisHer] cum flavor.");
	else addDisabledButton(0, "CumFlavor");

	if (bess.hasVagina()) addButton(1, "GirlCum F", talkToBessAboutCumFlavour, false, "Girl Cum Flavor", "Change [bess.hisHer] girl cum flavor.");
	else addDisabledButton(1, "GirlCum F");

	addButton(14, "Back", bessFunctions);
}

public function talkToBessAboutCumFlavour(asCock:Boolean):void
{
	clearOutput();
	bessHeader();

	output("<i>“Flavoring is a cinch. Any particular taste you’d fancy? I could give you test tastings, if you want.”</i> [bess.name] offers.");

	var opts:Array = ["normal", "chocolate", "vanilla", "strawberry", "honey"];
	var vals:Array = [0, GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_VANILLA, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK, GLOBAL.FLUID_TYPE_HONEY];

	// Initialize
	if (asCock) vals[0] = GLOBAL.FLUID_TYPE_CUM;
	else vals[0] = GLOBAL.FLUID_TYPE_GIRLCUM;

	clearMenu();

	var optSlot:int = -1;
	for (var i:int = 0; optSlot < opts.length - 1; i++)
	{
		if (i > 0 && (i + 1) % 15 == 0)
		{
			addButton(i, "Back", talkToBessAboutCum);
			continue;
		}
		else
		{
			optSlot++;
		}

		if
		(	(asCock && bess.cumType == vals[optSlot])
		||	(!asCock && bess.girlCumType == vals[optSlot])
		)
		{
			addDisabledButton(i, StringUtil.toTitleCase(opts[optSlot]));
		}
		else
		{
			addButton(i, StringUtil.toTitleCase(opts[optSlot]), bessSetCumFlavor, [asCock, vals[optSlot]]);
		}
	}
	
	if (opts.length < 15)
	{
		addButton(14, "Back", talkToBessAboutCum);
	}
}

public function bessSetCumFlavor(opts:Array):void
{
	clearOutput();
	bessHeader();

	var asCock:Boolean = opts[0];
	var flav:int = opts[1];

	output("There are no obvious outward signs other than a short period of blinking by the " + bess.mf("male synthetic", "android girl") +".");

	output("\n\n<i>“...All done! Next time I cum, it will taste ");
	if (asCock)
	{
		bess.cumType = flav;
		if (flav != GLOBAL.FLUID_TYPE_CUM) output("of " + bessCumFlavor());
		else output("like regular cum");
	}
	else
	{
		bess.girlCumType = flav;
		if (flav != GLOBAL.FLUID_TYPE_GIRLCUM) output("of " + bessGirlCumFlavor());
		else output("like regular girlcum");
	}
	output("!</i> [bess.name] cheerfully exclaims.");
	
	output("\n\n<b>[bess.name]’s");
	if (asCock) output(" cum");
	else output(" girl cum");
	output(" now tastes like ");
	if (asCock) output(bessCumFlavor());
	else output(bessGirlCumFlavor());
	output("!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutClothes():void
{
	clearOutput();
	bessHeader();

	//for some reason, bess might have some empty inventory slots. better get rid of them
	for(var x:int = 0; x < bess.inventory.length; x++)
	{
		if (bess.inventory[x] is EmptySlot) {
			bess.inventory.splice(x, 1);
			//output("slot " + x + " is empty!");
			x = x - 1;
		}
	}

	output("You ask [bess.name] to open [bess.hisHer] closet so that you can select a new outfit and accessories for [bess.himHer]. [bess.HeShe] shows you all the clothes that [bess.heShe] owns.");

	// Bess always has access to "Nude". Others are bought from the JoyCo catalog. many of these are new additions (See Clothing Additions section towards the end of the document).

	// Ears, Horns, Tails and Wings can be purchased in 'sets' from the JoyCo catalog and then individually activated. If none are purchased, Bess only has the default. 

	// Choosing the Glasses or Katana triggers bessGlasses or bessKatana boolean true or false (equipped or unequipped).

	clearMenu();
//	addButton(0, "Outfits", talkToBessAboutOutfits, undefined, "Outfits", "Change [bess.hisHer] armor, outfit or clothing.");
//	addButton(1, "U. Tops", talkToBessAboutUpperUndergarments, undefined, "Underwear Tops", "Change [bess.hisHer] upper undergarment.");
//	addButton(2, "U. Bottoms", talkToBessAboutLowerUndergarments, undefined, "Underwear Bottoms", "Change [bess.hisHer] lower undergarment.");
	addButton(0, "Ears", talkToBessAboutEars, undefined, "Ears", "Change [bess.hisHer] ears.");
	addButton(1, "Horns", talkToBessAboutHorns, undefined, "Horns", "Change [bess.hisHer] horns.");
	addButton(2, "Tails", talkToBessAboutTails, undefined, "Tails", "Change [bess.hisHer] tail.");
	addButton(3, "Wings", talkToBessAboutWings, undefined, "Wings", "Change [bess.hisHer] wings.");
	addButton(4, "Items", talkToBessAboutItems, undefined, "Items", "Change [bess.hisHer] accessories.");

	addButton(5, "Wear Clothes", bessWhatOutfitToWear, undefined, "Wear Clothes", "Change [bess.hisHer] clothes.");
	addButton(6, "Give Clothes", bessGiveClothes, undefined, "Give Clothes", "Hand over some of your clothes to [bess.hisHer].");
	addButton(7, "ReturnClothes", bessWhatOutfitToReturn, undefined, "Return Clothes", "Take back some clothes from [bess.hisHer].");
	addButton(8, "DestroyClothes", bessWhatOutfitWillToDestroy, undefined, "Destroy Clothes", "Get rid of some of [bess.hisHer] clothes.");

	addButton(14, "Back", bessFunctions);
}

// bess.inventory.splice(x, 1);
public function bessDisplayInventory():void
{
	output("<b><u>[bess.name]’s Current Clothing</u></b>:\n");
	output("<b>Armor:</b> [bess.Armor]\n");
	output("<b>Upper Undergarment:</b> [bess.UpperUndergarment]\n");
	output("<b>Lower Undergarment:</b> [bess.LowerUndergarment]\n\n");
//	output("<b>Lower Undergarment:</b> [bess.LowerUndergarment]" + (bess.hasHardLightEquipped() ? " (with hardlight strap-on)" : "") + "\n\n");
	output("<b><u>[bess.name]’s Available Clothing:</u></b>\n");
	for(var x:int = 0; x < bess.inventory.length; x++)
	{
		if(x >= BESS_INV_SLOT_MAX) output("<span class='bad'>" + StringUtil.upperCase(bess.inventory[x].description, false) + "</span>\n");
		else output(StringUtil.upperCase(bess.inventory[x].description, false) + "\n");
	}
	if(bess.inventory.length == 0) output("Nothing. <i>[bess.name] has no" + (bess.isNude() ? "": " extra") + " clothes in [bess.hisHer] closet!</i>\n");
}

public function bessGiveClothes():void
{
	clearOutput();
	bessHeader();

	clearMenu();
 	var buttons:int = 0;
	var x:int = 0;
	var state:int = 0; // 0 invalid, 1 can give, 2 already equipped by bess, 3 in bess's inventory
	while (true)
 	{
		if (x < pc.inventory.length)
 		{
			var cname:String = getQualifiedClassName(pc.inventory[x]);
			switch (pc.inventory[x].type)
 			{
				case GLOBAL.CLOTHING:
					state = cname == getQualifiedClassName(bess.armor) ? 2 : 1;
					break;
				case GLOBAL.ARMOR:
					if (pc.inventory[x] is GooArmor)
					{ state = 0; }
					else
					{ state = cname == getQualifiedClassName(bess.armor) ? 2 : 1; }
					break;
				case GLOBAL.LOWER_UNDERGARMENT:
					state = cname == getQualifiedClassName(bess.lowerUndergarment) ? 2 : 1;
					break;
				case GLOBAL.UPPER_UNDERGARMENT:
					state = cname == getQualifiedClassName(bess.upperUndergarment) ? 2 : 1;
					break;
				default:
					state = 0;
					break;
 			}
			if (state == 1 && bess.hasItemByClass(getDefinitionByName(cname) as Class)) state = 3;
			if (state == 1 && pc.inventory[x].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) state = -1;
		}
		
		if (buttons % 15 == 0 && (state || !buttons))
		{
			addButton(buttons+14, "Back", talkToBessAboutClothes);
			buttons++;
		}
		
		if (x == pc.inventory.length) break;
		
		switch (state)
		{
			case 1: // can give
				addItemButton(buttons-1, pc.inventory[x], bessClothingGiftConfirm, x);
				buttons++;
				break;
			case 2: // already equipped by bess
				addDisabledButton(buttons-1, pc.inventory[x].shortName, StringUtil.toDisplayCase(pc.inventory[x].longName), "[bess.name] is already wearing one of these!");
				buttons++;
				break;
			case 3: // in bess's inventory
				addDisabledButton(buttons-1, pc.inventory[x].shortName, StringUtil.toDisplayCase(pc.inventory[x].longName), "[bess.name] already has one of these.");
				buttons++;
				break;
			case -1: // cannot drop!
				addDisabledButton(buttons-1, pc.inventory[x].shortName, StringUtil.toDisplayCase(pc.inventory[x].longName), "You cannot drop this item.");
				buttons++;
				break;
 		}
		x++;
 	}
	if(buttons == 1) output("<b>You don’t have anything to give [bess.name] right now.</b>\n\n");
	else output("Which clothes do you want to give [bess.name]?\n\n");
	bessDisplayInventory();
	
	addButton(14, "Back", talkToBessAboutClothes);
}

public function bessClothingGiftConfirm(x:int):void
{
	clearOutput();
	bessHeader();
	output("Are you sure you want to give [bess.name] " + pc.inventory[x].description + "?");

	clearMenu();
	addButton(0,"No",bessGiveClothes,undefined,"No","Keep the clothes.");
	addButton(1,"Yes",bessGiveClothesProcess,x,"Yes","Give [bess.name] the clothes.");
}

public function bessGiveClothesProcess(x:int):void
{
	clearOutput();
	bessHeader();
	var item:ItemSlotClass = pc.inventory[x];
	//Move her old armor to inventory, if she had any.
	if(InCollection(item.type, [GLOBAL.CLOTHING, GLOBAL.ARMOR])) 
	{
		if(!(bess.armor is EmptySlot)) bess.inventory.push(bess.armor);
		bess.armor = item;
	}
	else if(item.type == GLOBAL.LOWER_UNDERGARMENT)
	{
		if(!(bess.lowerUndergarment is EmptySlot)) bess.inventory.push(bess.lowerUndergarment);
		bess.lowerUndergarment = item;
	}
	else if(item.type == GLOBAL.UPPER_UNDERGARMENT)
	{
		if(!(bess.upperUndergarment is EmptySlot)) bess.inventory.push(bess.upperUndergarment);
		bess.upperUndergarment = item;
	}
	else
	{
		output("\n\nA SEVERE ERROR OCCURRED. UNKNOWN CLOTHING TYPE GIVEN TO BESS. SOMEONE DUN FUCKED UP! ITEM ERROR: " + item.description + "\n\n");
	}
	pc.inventory.splice(x, 1);

	output("<b>[bess.name] is now");
	if (!bess.isNude()) output(" wearing [bess.gear]");
	else output(" naked");
	output("!</b>");

	processTime(2);
	clearMenu();
	addButton(0,"Next",bessGiveClothes);
}

public function bessWhatOutfitToWear():void
{
	clearOutput();
	bessHeader();
	output("What outfit do you want [bess.name] to wear?\n\n");
	bessDisplayInventory();
	var buttons:Number = 0;
	var invLimit:int = bess.inventory.length;
	if(invLimit >= BESS_INV_SLOT_MAX) invLimit = BESS_INV_SLOT_MAX;
	clearMenu();
	if(!bess.isNude())
	{
		buttons = 1;
		addButton(0,"Get Naked",bessDressSelection,null,"Get Naked","Why bother with clothes?");
	}
	addButton(14,"Back",talkToBessAboutClothes);
	for(var x:int = 0; x < invLimit; x++)
	{
		//14 is for "Back"
		if(buttons >= 14 && (buttons + 1) % 15 == 0)
		{
			addButton(buttons, "Back", talkToBessAboutClothes);
			buttons++;
		}
		
		//Make sure bess doesn't wear it (failsafe)
		if(
			InCollection(bess.inventory[x].shortName, [bess.armor.shortName, bess.lowerUndergarment.shortName, bess.upperUndergarment.shortName])
		) addDisabledButton(buttons, bess.inventory[x].shortName, StringUtil.toDisplayCase(bess.inventory[x].longName), "[bess.name] is already wearing one of these!");
		else addItemButton(buttons,bess.inventory[x],bessDressSelection,bess.inventory[x]);
		buttons++;
		
		if(invLimit > 14 && (x + 1) == invLimit)
		{
			while((buttons + 1) % 15 != 0) { buttons++; }
			addButton(buttons, "Back", talkToBessAboutClothes);
		}
	}
}

public function bessDressSelection(item:ItemSlotClass):void
{
	clearOutput();
	bessHeader();

	//GIT NAKKID
	if(item == null)
 	{
		if (!(bess.armor is EmptySlot))
		{
			bess.inventory.push(bess.armor);
			bess.armor = new EmptySlot();
		}
		if (!(bess.lowerUndergarment is EmptySlot))
		{
			bess.inventory.push(bess.lowerUndergarment);
			bess.lowerUndergarment = new EmptySlot();
		}
		if (!(bess.upperUndergarment is EmptySlot))
		{
			bess.inventory.push(bess.upperUndergarment);
			bess.upperUndergarment = new EmptySlot();
		}
 	}
	//ELSE ARMOR
	else if(InCollection(item.type, [GLOBAL.CLOTHING, GLOBAL.ARMOR]))
	{
		if(!(bess.armor is EmptySlot)) bess.inventory.push(bess.armor);
		bess.armor = item;
		bess.inventory.splice(bess.inventory.indexOf(item), 1);
	}
	else if(item.type == GLOBAL.LOWER_UNDERGARMENT)
	{
		if(!(bess.lowerUndergarment is EmptySlot)) bess.inventory.push(bess.lowerUndergarment);
		bess.lowerUndergarment = item;
		bess.inventory.splice(bess.inventory.indexOf(item), 1);
	}
	else if(item.type == GLOBAL.UPPER_UNDERGARMENT)
	{
		if(!(bess.upperUndergarment is EmptySlot)) bess.inventory.push(bess.upperUndergarment);
		bess.upperUndergarment = item;
		bess.inventory.splice(bess.inventory.indexOf(item), 1);
	}
	else
	{
		output("\n\nA SEVERE ERROR OCCURRED. UNKNOWN CLOTHING TYPE GIVEN TO bess. SOMEONE FUCKED UP! ITEM ERROR: " + item.description + "\n\n");
	}
	
	output("<b>[bess.name] is now");
	if (!bess.isNude()) output(" wearing [bess.gear]");
	else output(" naked");
	output("!</b>");

	processTime(2);
	clearMenu();
	addButton(0,"Next",bessWhatOutfitToWear);
}

public function bessWhatOutfitToReturn():void
{
	clearOutput();
	bessHeader();
	
	output("What will you have [bess.name] return to you?\n\n");
	bessDisplayInventory();
	
	var pcInvFull:Boolean = (pc.inventory.length >= pc.inventorySlots());
	var buttons:Number = 0;
	var invLimit:int = bess.inventory.length;
	if(invLimit >= BESS_INV_SLOT_MAX) invLimit = BESS_INV_SLOT_MAX;
	
	clearMenu();
	
	for(var x:int = 0; x < invLimit; x++)
	{
		//14 is for "Back"
		if(buttons >= 14 && (buttons + 1) % 15 == 0)
		{
			addButton(buttons, "Back", talkToBessAboutClothes);
			buttons++;
		}

		if( (bess.inventory[x] is UGCUniform)
		||	(bess.inventory[x] is TopNSkirt)
		||	(bess.inventory[x] is LibrarianOutfit)
		||	(bess.inventory[x] is WaitressUniform)
		||	(bess.inventory[x] is MilitaryUniform)
		||	(bess.inventory[x] is ButlerOutfit)
		||	(bess.inventory[x] is SchoolboyOutfit)
		||	(bess.inventory[x] is LittleBlackDress)
		||	(bess.inventory[x] is GirlyBra)
		||	(bess.inventory[x] is GirlyPanties)
		) addDisabledButton(buttons, bess.inventory[x].shortName, StringUtil.toDisplayCase(bess.inventory[x].longName), "These highly adjustable JoyCo products are exclusive for use with " + bess.mf("Ben-14", "Bess-13") + " units.");
		//Make sure bess doesn't wear it (failsafe)
		else if(
			InCollection(bess.inventory[x].shortName, [bess.armor.shortName, bess.lowerUndergarment.shortName, bess.upperUndergarment.shortName])
		) addDisabledButton(buttons, bess.inventory[x].shortName, StringUtil.toDisplayCase(bess.inventory[x].longName), "[bess.name] is currently wearing these!");
		//Make sure inventory isn't already full!
		else if(pcInvFull) addDisabledButton(buttons, bess.inventory[x].shortName, StringUtil.toDisplayCase(bess.inventory[x].longName), "Your inventory is too full for this!");
		else addItemButton(buttons, bess.inventory[x], bessTakeSelection, bess.inventory[x]);
		buttons++;
		
		if(invLimit > 14 && (x + 1) == invLimit)
		{
			while((buttons + 1) % 15 != 0) { buttons++; }
			addButton(buttons, "Back", talkToBessAboutClothes);
		}
	}
	
	addButton(14, "Back", talkToBessAboutClothes);
}
public function bessTakeSelection(item:ItemSlotClass):void
{
	clearOutput();
	bessHeader();
	
	output("[bess.name] hands " + item.description + " back to you.\n\n");
	
	itemCollect([item]);
	bess.inventory.splice(bess.inventory.indexOf(item), 1);
	
	processTime(1);
	clearMenu();
	addButton(0, "Next", bessWhatOutfitToReturn);
}

public function bessWhatOutfitWillToDestroy():void
{
	clearOutput();
	bessHeader();
	
	output("You cannot get clothing back from [bess.name] once you ask her to get rid of it.\n\nWhat will you have [bess.name] throw out?\n\n");
	bessDisplayInventory();
	
	var buttons:Number = 0;
	var invLimit:int = bess.inventory.length;
	if(invLimit >= BESS_INV_SLOT_MAX) invLimit = BESS_INV_SLOT_MAX;
	
	clearMenu();
	
	for(var x:int = 0; x < invLimit; x++)
	{
		//14 is for "Back"
		if(buttons >= 14 && (buttons + 1) % 15 == 0)
		{
			addButton(buttons, "Back", talkToBessAboutClothes);
			buttons++;
		}
		
		if( (bess.inventory[x] is UGCUniform)
		||	(bess.inventory[x] is TopNSkirt)
		||	(bess.inventory[x] is LibrarianOutfit)
		||	(bess.inventory[x] is WaitressUniform)
		||	(bess.inventory[x] is MilitaryUniform)
		||	(bess.inventory[x] is ButlerOutfit)
		||	(bess.inventory[x] is SchoolboyOutfit)
		||	(bess.inventory[x] is LittleBlackDress)
		||	(bess.inventory[x] is GirlyBra)
		||	(bess.inventory[x] is GirlyPanties)
		) addDisabledButton(buttons, bess.inventory[x].shortName, StringUtil.toDisplayCase(bess.inventory[x].longName), "These highly adjustable JoyCo products are exclusive for use with " + bess.mf("Ben-14", "Bess-13") + " units.");
		//Make sure bess doesn't wear it (failsafe)
		else if(
			InCollection(bess.inventory[x].shortName, [bess.armor.shortName, bess.lowerUndergarment.shortName, bess.upperUndergarment.shortName])
		) addDisabledButton(buttons, bess.inventory[x].shortName, StringUtil.toDisplayCase(bess.inventory[x].longName), "[bess.name] is already wearing one of these!");
		else addItemButton(buttons, bess.inventory[x], bessClothingDestroyConfirm, x);
		buttons++;
		
		if(invLimit > 14 && (x + 1) == invLimit)
		{
			while((buttons + 1) % 15 != 0) { buttons++; }
			addButton(buttons, "Back", talkToBessAboutClothes);
		}
	}
	
	addButton(14, "Back", talkToBessAboutClothes);
}

public function bessClothingDestroyConfirm(x:int):void
{
	clearOutput();
	bessHeader();
	output("Are you sure you want [bess.name] to throw away " + bess.inventory[x].description + "?");
	//Inventory options here. Pick 1. Confirm:
	//Are you sure you want to give {item} to bess?
	//Yes // No (Back to Inventory)
	clearMenu();
	addButton(0,"No",bessWhatOutfitWillToDestroy,"No","On second thought, better keep the clothes.");
	addButton(1,"Yes",bessDestroySelection,bess.inventory[x],"Yes","Destroy the clothes.");
}

public function bessDestroySelection(item:ItemSlotClass):void
{
	clearOutput();
	bessHeader();
	
	output("<b>[bess.name] has removed " + item.description + " from [bess.hisHer] wardrobe.<\b>");
	bess.destroyItemByReference(item);
	
	processTime(1);
	clearMenu();
	addButton(0, "Next", bessWhatOutfitWillToDestroy);
}
/*
// this is only really used to handle nudity
public function bessSetArmorSlot(item:ItemSlotClass):void
{
	clearOutput();
	bessHeader();
	
	bess.armor = item;
	
	output("<b>[bess.name] is now");
	if (!bess.isNude()) output(" wearing [bess.gear]");
	else output(" naked");
	output("!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutOutfits():void
{
	clearMenu();
	if (bess.hasUpperGarment() || bess.hasLowerGarment()) addButton(0, "No Outfit", bessSetArmorSlot, new EmptySlot(), "No Outfit", "Remove outfit.");
	else addButton(0, "Nude", bessSetArmorSlot, new EmptySlot(), "Nude", "Go Nude!");
	bessCIW(1, "C.Clothes", ComfortableClothes, "Casual Clothes", "Casual Clothes");
	bessCIW(2, "P.Jacket", ProtectiveJacket, "Protective Jacket", "Protective Jacket");
	bessCIW(3, "UGC Uniform", UGCUniform, "UGC Uniform", "UGC Uniform");
	bessCIW(4, "Top&Skirt", TopNSkirt, "Top & Skirt", "Top & Skirt");
	
	bessCIW(5, "BusinessC.", BusinessClothes, "Business Clothes", "Business Clothes");
	bessCIW(6, "Librarian", LibrarianOutfit, "Librarian Outfit", "Librarian Outfit");
	bessCIW(7, "LatexBSuit", LatexBodysuit, "Latex Bodysuit", "Latex Bodysuit");
	bessCIW(8, "Maid", MaidOutfit, "Maid Outfit", "Maid Outfit");
	bessCIW(9, "Nurse", NurseOutfit, "Nurse Outfit", "Nurse Outfit");
	
	bessCIW(10, "Schoolgirl", SchoolgirlOutfit, "Schoolgirl", "Schoolgirl");
	bessCIW(11, "Cheerleader", CheerleaderUniform, "Cheerleader Uniform", "CheerleaderUniform");
	bessCIW(12, "Waitress", WaitressUniform, "Waitress Uniform", "Waitress Uniform");
	bessCIW(13, "Bunnygirl", BunnyOutfit, "Bunnygirl Outfit", "Bunnygirl Outfit");
	
	addButton(14, "Back", talkToBessAboutClothes);
	
	bessCIW(15, "Military", MilitaryUniform, "Military Uniform", "Military Uniform");
	bessCIW(16, "Pirate", SpacePirateOutfit, "Space Pirate", "Space Pirate");
	bessCIW(17, "R.Fem Armor", RevealingFemaleArmor, "Revealing Female Armor", "Revealing Female Armor");
	bessCIW(18, "R.Male Armor", RevealingMaleArmor, "Revealing Male Armor", "Revealing Male Armor");
	bessCIW(19, "T.Zipsuit", TransparentZipsuit, "Transparent Zipsuit", "Transparent Zipsuit");
	
	bessCIW(20, "Butler", ButlerOutfit, "Butler Outfit", "Butler Outfit");
	bessCIW(21, "M.Doctor", MaleDoctorOutfit, "Male Doctor Outfit", "Male Doctor Outfit");
	bessCIW(22, "F.Doctor", FemaleDoctorOutfit, "Female Doctor Outfit", "Female Doctor Outfit");
	bessCIW(23, "Schoolboy", SchoolboyOutfit, "Schoolboy Outfit", "Schoolboy Outfit");
	bessCIW(24, "StrapHarness", LeatherStrapHarness, "Leather Strap Harness", "Leather Strap Harness");
	
	bessCIW(25, "BlackDress", LittleBlackDress, "Little Black Dress", "Little Black Dress");
	
	addButton(29, "Back", talkToBessAboutClothes);
	
	//addButton(44, "Back", talkToBessAboutClothes);
}
*/
/**
 * Bess Clothing Item Wrapper - simplify simple calls determining if an item is available or not and handle button generation.
 * @param idx button index
 * @param lbl button label text
 * @param cType Class type definition of the item - use for availability comparison & button argument
 * @param ttH tooltip header
 * @param ttB tooltop text body
 */
/*
public function bessCIW(idx:int, lbl:String, cType:Class, ttH:String, ttB:String):void
{
	if (bessHasClothingItem(cType))
	{
		addButton(idx, lbl, setBessOutfit, cType, ttH, ttB);
	}
	else
	{
		addDisabledButton(idx, lbl, ttH, "[bess.name] doesn’t have access to this item of clothing!");
	}
}

public function bessSetBra(item:ItemSlotClass):void
{
	(bess as Bess).upperUndergarment = item;
	
	output("<b>[bess.name] is now");
	if (!bess.isNude()) output(" wearing [bess.gear]");
	else output(" naked");
	output("!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutUpperUndergarments():void
{
	clearOutput();
	bessHeader();
	
	clearMenu();

	addButton(0, "Nude", bessSetBra, new EmptySlot(), "Nude", "Nude");
	bessCIW(1, "NormalBra", PlainBra, "Normal Bra", "Normal Bra");
	bessCIW(2, "GirlyBra", GirlyBra, "Girly Bra", "Girly Bra");
	bessCIW(3, "Corset", Corset, "Corset", "Corset");
	bessCIW(4, "Pasties", Pasties, "Nipple Pasties", "Nipple Pasties");
	
	bessCIW(5, "Babydoll", Babydoll, "Babydoll", "Babydoll");
	bessCIW(6, "LacyBra", LacyBra, "Lacy Bra", "Lacy Bra");
	bessCIW(7, "Shibari", ShibariTop, "Shibari Top", "Shibari Top");
	bessCIW(8, "SkullBra", SkullPatternBra, "Skull Bra", "Skull Bra");
	
	addButton(14, "Back", talkToBessAboutClothes);
}

public function bessSetPanties(item:ItemSlotClass):void
{
	clearOutput();
	bessHeader();
	
	(bess as Bess).lowerUndergarment = item;
	
	output("<b>[bess.name] is now");
	if (!bess.isNude()) output(" wearing [bess.gear]");
	else output(" naked");
	output("!</b>");

	bessFunctionsMenu();
}

public function talkToBessAboutLowerUndergarments():void
{
	clearMenu();

	addButton(0, "Nude", bessSetPanties, new EmptySlot(), "Nude", "Nude");
	bessCIW(1, "Normal", PlainPanties, "Normal Panties", "Normal Panties");
	bessCIW(2, "Stk&Panty", Stockings, "Stockings & Panties", "Stockings & Panties");
	bessCIW(3, "Boxers", Boxers, "Boxers", "Boxers");
	bessCIW(4, "Girly", GirlyPanties, "Girly Panties", "Girly Panties");
	
	bessCIW(5, "Shibari", ShibariBottom, "Shibari Bottoms", "Shibari Bottoms");
	bessCIW(6, "Boyshorts", Boyshorts, "Boyshorts", "Boyshorts");
	bessCIW(7, "Thong", Thong, "Thong", "Thong");
	bessCIW(8, "C-String", CString, "C-String", "C-String");

	addButton(14, "Back", talkToBessAboutClothes);
}

public function setBessOutfit(classT:Class):void
{
	clearOutput();
	bessHeader();

	var item:ItemSlotClass = new classT(); // now we can inspect the item

	if (item.type == GLOBAL.ARMOR || item.type == GLOBAL.CLOTHING) bess.armor = item;
	if (item.type == GLOBAL.UPPER_UNDERGARMENT) bess.upperUndergarment = item;
	if (item.type == GLOBAL.LOWER_UNDERGARMENT) bess.lowerUndergarment = item;

	output("<b>[bess.name] is now");
	if (!bess.isNude()) output(" wearing [bess.gear]");
	else output(" naked");
	output("!</b>");

	bessFunctionsMenu();
}
*/
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
		{l: "Elfin", v: GLOBAL.TYPE_SYLVAN, bType: BESS_ACCSET_ANGEL},
		{l: "Draconic", v: GLOBAL.TYPE_DRACONIC, bType: BESS_ACCSET_DRACONIC},
		{l: "Deer", v: GLOBAL.TYPE_DEER, bType: BESS_ACCSET_DEER},
		{l: "Mouse", v: GLOBAL.TYPE_MOUSE, bType: BESS_ACCSET_MOUSE},
		{l: "Bunny", v: GLOBAL.TYPE_LAPINE, bType: BESS_ACCSET_BUNNY}
	];

	for (var i:int = 0; i < opts.length; i++)
	{
		if (bess.earType == opts[i].v)
		{
			addDisabledButton(i, opts[i].l);
		}
		else if (opts[i].bType == uint.MAX_VALUE || bessHasAccessorySet(opts[i].bType))
		{
			addButton(i, opts[i].l, setBessAccessory, [BESS_ACS_EAR, opts[i].v, opts[i].bType]);
		}
		else
		{
			addDisabledButton(i, opts[i].l, opts[i].l, "[bess.name] does not have access to this accessory set yet. Please consult the product catalog for purchasing information!");
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
		if (bess.hornType == opts[i].v)
		{
			addDisabledButton(i, opts[i].l);
		}
		else if (opts[i].bType == uint.MAX_VALUE || bessHasAccessorySet(opts[i].bType))
		{
			addButton(i, opts[i].l, setBessAccessory, [BESS_ACS_HORNS, opts[i].v, opts[i].bType]);
		}
		else
		{
			addDisabledButton(i, opts[i].l, opts[i].l, "[bess.name] does not have access to this accessory set yet. Please consult the product catalog for purchasing information!");
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
		{l: "Bunny", v: GLOBAL.TYPE_LAPINE, bType: BESS_ACCSET_BUNNY},
		{l: "Kitsune", v: GLOBAL.TYPE_VULPINE, bType: BESS_ACCSET_KITSUNE}
	];

	for (var i:int = 0; i < opts.length; i++)
	{
		if (bess.tailType == opts[i].v)
		{
			addDisabledButton(i, opts[i].l);
		}
		else if (opts[i].bType == uint.MAX_VALUE || bessHasAccessorySet(opts[i].bType))
		{
			addButton(i, opts[i].l, setBessAccessory, [BESS_ACS_TAIL, opts[i].v, opts[i].bType]);
		}
		else
		{
			addDisabledButton(i, opts[i].l, opts[i].l, "[bess.name] does not have access to this accessory set yet. Please consult the product catalog for purchasing information!");
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
		{l: "Angel", v: GLOBAL.TYPE_SYLVAN, bType: BESS_ACCSET_ANGEL}
	];

	for (var i:int = 0; i < opts.length; i++)
	{
		if (bess.wingType == opts[i].v)
		{
			addDisabledButton(i, opts[i].l);
		}
		else if (opts[i].bType == uint.MAX_VALUE || bessHasAccessorySet(opts[i].bType))
		{
			addButton(i, opts[i].l, setBessAccessory, [BESS_ACS_WINGS, opts[i].v, opts[i].bType]);
		}
		else
		{
			addDisabledButton(i, opts[i].l, opts[i].l, "[bess.name] does not have access to this accessory set yet. Please consult the product catalog for purchasing information!");
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
	var bType:uint = opts[2];

	if (acsType == BESS_ACS_EAR)
	{
		bess.earType = newType;
		output("<b>[bess.name] now has [bess.ears]!</b>");
	}
	else if (acsType == BESS_ACS_WINGS)
	{
		bess.wingType = newType;
		bess.wingCount = 2;
		// removing
		if (newType == GLOBAL.TYPE_HUMAN)
		{
			output("<b>[bess.name] has removed [bess.hisHer] wings!</b>");
		}
		else
		{
			output("<b>[bess.name] now has [bess.wings]!</b>");
		}
	}
	else if (acsType == BESS_ACS_HORNS)
	{
		bess.hornType = newType;
		if (newType == GLOBAL.TYPE_HUMAN)
		{
			bess.horns = 0;
			bess.hornLength = 0;
			bess.hornType = 0;
			output("<b>[bess.name] has removed [bess.hisHer] horns!</b>");
		}
		else
		{
			var pBess:Bess = bess;
			
			switch (newType)
			{
				case GLOBAL.TYPE_HUMAN:
					pBess.horns = 0;
					pBess.hornType = 0;
					pBess.hornLength = 0;
					break;
				
				default:
					pBess.horns = 2;
					pBess.hornLength = 4;
					pBess.hornType = newType;
					break;
			}
			
			output("<b>[bess.name] now has [bess.horns]!</b>");
		}
	}
	else if (acsType == BESS_ACS_TAIL)
	{
		bess.tailType = newType;
		if (newType == GLOBAL.TYPE_HUMAN)
		{
			output("<b>[bess.name] has removed [bess.hisHer] tail");
			if (bess.tailCount > 1) output("s")
			output("!</b>");
			bess.tailCount = 0;
		}
		else
		{
			if (bType == BESS_ACCSET_KITSUNE) bess.tailCount = 9;
			else bess.tailCount = 1;

			output("<b>[bess.name] now has [bess.tails]!</b>");
		}
	}

	bessFunctionsMenu();
}

public function talkToBessAboutItems():void
{
	clearMenu();

	if (!bessHasGlasses()) addDisabledButton(0, "Glasses", "Glasses", "[bess.name] doesn’t own glasses!");
	else if (!bessGlasses()) addButton(0, "Glasses", talkToBessWearGlasses, undefined, "Glasses", "Have [bess.name] wear glasses.");
	else addButton(0, "Glasses", talkToBessRemoveGlasses, undefined, "Glasses", "Have [bess.name] remove [bess.hisHer] glasses.");

	if (!bessHasKatana()) addDisabledButton(1, "Katana", "Katana", "[bess.name] doesn’t own a katana!");
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

	output("<b>[bess.name] has removed [bess.hisHer] glasses!</b>");

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

	output("You download the latest JoyCo product catalog for " + bess.mf("Ben-14", "Bess-13") + " units into one of the ship’s terminals. A holographic projection of specialized clothing, accessories, and upgrades appear on the screen.");
	
	output("\n\nWhat are you interested in purchasing?\n\n");

	//Purchases alter which options unlock in the Functions -> Clothing & Acc Menu (where the clothes and accessories can actually be changed).

	clearMenu();
	addButton(0, "Clothing", bessBuyShitOutfits);
	addButton(1, "AccSets", bessBuyShitAccessories);
	addButton(2, "Items", bessBuyShitItems);
	addButton(3, "Cocks", bessBuyShitCocks);

	addButton(14, "Back", bessFollowerMenu);
}

public function bessBuyShitOutfits():void
{
	clearOutput();
	bessHeader();
	
	output("What clothes would you like to purchase?\n\n");

	clearMenu();
	
	bessBuyCIW(0, "UGC Uniform", UGCUniform, "UGC Uniform", "UGC Uniform");
	bessBuyCIW(1, "Top&Skirt", TopNSkirt, "Top & Skirt", "Top & Skirt");
	bessBuyCIW(2, "Librarian", LibrarianOutfit, "Librarian Outfit", "Librarian Outfit");
	bessBuyCIW(3, "Waitress", WaitressUniform, "Waitress Uniform", "Waitress Uniform");
	bessBuyCIW(4, "Military", MilitaryUniform, "Military Uniform", "Military Uniform");
	bessBuyCIW(5, "Butler", ButlerOutfit, "Butler Outfit", "Butler Outfit");
	bessBuyCIW(6, "Schoolboy", SchoolboyOutfit, "Schoolboy Outfit", "Schoolboy Outfit");
	bessBuyCIW(7, "BlackDress", LittleBlackDress, "Little Black Dress", "Little Black Dress");
	bessBuyCIW(8, "GirlyBra", GirlyBra, "Girly Bra", "Girly Bra");
	bessBuyCIW(9, "GirlyPanties", GirlyPanties, "Girly Panties", "Girly Panties");

	addButton(14, "Back", talkToBessAboutAccessories);
}

public function bessBuyCIW(idx:int, lbl:String, classT:Class, ttH:String, ttB:String):void
{
	var item:ItemSlotClass = new classT();

	// already owns, hide
	if (bessHasClothingItem(classT))
	{
		output(StringUtil.toTitleCase(item.longName) + " - [bess.name] already owns this item!\n");
		addDisabledButton(idx, lbl, (item.longName != null ? StringUtil.toDisplayCase(item.longName) : ttH), "[bess.name] already owns this item!");
	}
	else
	{
		output(StringUtil.toTitleCase(item.longName) + " - ");
		// Can afford
		if (pc.credits >= item.basePrice)
		{
			output(" Cost: " + String(item.basePrice) + " credits");
			addButton(idx, lbl, bessBuyOutfit, item, (item.longName != null ? StringUtil.toDisplayCase(item.longName) : ttH), (item.tooltip != null ? item.tooltip : ttB) + "\n\nCost: " + item.basePrice + " credits");
		}
		// too spensive
		else
		{
			output(" Cost: " + String(item.basePrice) + " credits (Too expensive!)");
			addDisabledButton(idx, lbl, (item.longName != null ? StringUtil.toDisplayCase(item.longName) : ttH), (item.tooltip != null ? item.tooltip : ttB) + "\n\nCost: " + item.basePrice + " credits\nToo expensive!");
		}
		output("\n");
	}
}

public function bessBuyOutfit(boughtItem:ItemSlotClass):void
{
	clearOutput();
	bessHeader();

	output("You transfer the credits to JoyCo and place your order. It’s not long before a warp-space delivery service is dropping off a package to your spaceship hangar.");
	output("\n\nYou’ve recieved " + boughtItem.description + " for [bess.name]!");

	bess.inventory.push(boughtItem);
	pc.credits -= boughtItem.basePrice;
	
/*
	var backFunc:Function = talkToBessAboutAccessories;
	if(boughtItem.type == GLOBAL.ARMOR || boughtItem.type == GLOBAL.CLOTHING) backFunc = bessBuyShitOutfits;
	if(boughtItem.type == GLOBAL.UPPER_UNDERGARMENT) backFunc = bessBuyShitBras;
	if(boughtItem.type == GLOBAL.LOWER_UNDERGARMENT) backFunc = bessBuyShitPanties;
*/
	clearMenu();
	addButton(0, "Next", bessBuyShitOutfits);

	// 9999 -- offer option to immediately equip?
}
/*
public function bessBuyShitBras():void
{
	clearOutput();
	bessHeader();
	
	output("What top undergarment would you like to purchase?\n\n");
	
	clearMenu();
	bessBuyCIW(0, "NormalBra", PlainBra, "Normal Bra", "Normal Bra");
	bessBuyCIW(1, "GirlyBra", GirlyBra, "Girly Bra", "Girly Bra");
	bessBuyCIW(2, "Corset", Corset, "Corset", "Corset");
	bessBuyCIW(3, "Pasties", Pasties, "Nipple Pasties", "Nipple Pasties");
	bessBuyCIW(4, "Babydoll", Babydoll, "Babydoll", "Babydoll");
	
	bessBuyCIW(5, "LacyBra", LacyBra, "Lacy Bra", "Lacy Bra");
	bessBuyCIW(6, "Shibari", ShibariTop, "Shibari Top", "Shibari Top");
	bessBuyCIW(7, "SkullBra", SkullPatternBra, "Skull Bra", "Skull Bra");
	
	addButton(14, "Back", talkToBessAboutAccessories);
}

public function bessBuyShitPanties():void
{
	clearOutput();
	bessHeader();
	
	output("What bottom undergarment would you like to purchase?\n\n");
	
	clearMenu();

	bessBuyCIW(0, "Normal", PlainPanties, "Normal Panties", "Normal Panties");
	bessBuyCIW(1, "Stk&Panty", Stockings, "Stockings & Panties", "Stockings & Panties");
	bessBuyCIW(2, "Boxers", Boxers, "Boxers", "Boxers");
	bessBuyCIW(3, "Girly", GirlyPanties, "Girly Panties", "Girly Panties");
	bessBuyCIW(4, "Shibari", ShibariBottom, "Shibari Bottoms", "Shibari Bottoms");

	bessBuyCIW(5, "Boyshorts", Boyshorts, "Boyshorts", "Boyshorts");
	bessBuyCIW(6, "Thong", Thong, "Thong", "Thong");
	bessBuyCIW(7, "C-String", CString, "C-String", "C-String");
	
	addButton(14, "Back", talkToBessAboutAccessories);
}
*/
public function bessBuyShitAccessories():void
{
	clearOutput();
	bessHeader();

	output("What set would you like to purchase?\n");

	output("\nEquine set (Allows [bess.name] to set Equine Tail and Ears) - 250 Creds");
	output("\nBovine Set (Allows [bess.name] to set Bovine Tail, Ears and Horns) - 250 Creds");
	output("\nCanine Set (Allows [bess.name] to set Canine Tail and Ears) - 250 Creds");
	output("\nFeline Set (Allows [bess.name] to set Feline Tail and Ears) - 250 Creds");
	output("\nVulpine Set (Allows [bess.name] to set Vulpine Tail and Ears) - 250 Creds");
	output("\nBunny Set (Allows [bess.name] to set Leporine Tail, Ears) - 250 Creds");
	output("\nBee Set (Allows [bess.name] to set Bee Wings) - 250 Creds");
	output("\nDraconic Set (Allows [bess.name] to set Draconic Ears, Tail, Wings and Horns). - 500 Creds");
	output("\nDemonic Set (Allows [bess.name] to set Demonic Ears, Tail, Wings and Horns) - 500 Creds");
	output("\nShark Set (Allows [bess.name] to set Shark Ears and Tail) - 250 Creds");
	output("\nDeer Set (Allows [bess.name] to set Deer Ears, Tail and Horns) - 250 Creds");
	output("\nMouse Set (Allows [bess.name] to set Mouse Ears and Tail) - 250 Creds");
	output("\nAngel Set (Allows [bess.name] to set Angel/White Feathered Wings) - 500 Creds");
	output("\nKitsune Set (Allows [bess.name] to set nine Vulpine tails) - 500 Creds");

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
	bessBASW(13, "Kitsune", BESS_ACCSET_KITSUNE, 500);

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
			addButton(idx, lbl, bessBuyAccessory, [accSet, cost, lbl], lbl, "Cost: " + cost + " credits");
		}
		else
		{
			addDisabledButton(idx, lbl, lbl, "Cost: " + cost + " credits\nToo expensive!");
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
	var lbl:String = opts[2];
	
	output("\n\nYou’ve recieved " + indefiniteArticle(lbl.toLowerCase()) + " accessory set a for [bess.name]!");

	pc.credits -= cost;
	bessAddAccessorySet(accSet);

	clearMenu();
	addButton(0, "Next", bessBuyShitAccessories);
}

public function bessBuyShitItems():void
{
	clearOutput();
	bessHeader();

	output("What product would you like to purchase for [bess.name]?");
	
	output("\n\nGlasses (Allows [bess.name] to equip Glasses in Accessory Menu) - 500 Creds");
	output("\nKatana (Allows [bess.name] to equip Katana in Accessory Menu) - 1000 Creds");
	output("\nJailbreaking Kit (Allows switching between Bess-13 and Ben-14 models) - 25000 Creds");

	clearMenu();
	
	if (bessHasGlasses()) addDisabledButton(0, "Glasses", "Glasses", "[bess.name] already owns glasses!");
	else if (pc.credits < 500) addDisabledButton(0, "Glasses", "Glasses", "You can’t afford to buy [bess.name] glasses!\n\nCost: 500 credits");
	else addButton(0, "Glasses", bessBuyGlasses, undefined, "Glasses", "Buy some glasses and allow [bess.name] to equip them!\n\nCost: 500 credits");

	if (bessHasKatana()) addDisabledButton(1, "Katana", "Katana", "[bess.name] already owns a katana!");
	else if (pc.credits < 1000) addDisabledButton(1, "Katana", "Katana", "You can’t afford to buy [bess.name] a katana!\n\nCost: 1000 credits");
	else addButton(1, "Katana", bessBuyKatana, undefined, "Katana", "Buy a katana for [bess.name] to saunter around with it!\n\nCost: 1000 credits");

	if (flags["BESS_OWNS_JBKIT"] >= 1) addDisabledButton(2, "Jailbr. Kit", "Jailbreaking Kit", "You already own this!");
	else if (pc.credits < 25000) addDisabledButton(2, "Jailbr. Kit", "Jailbreaking Kit", "Cost: 25000 credits\nToo expensive!");
	else addButton(2, "Jailbr. Kit", bessBuyJailbreakingKit, undefined, "Jailbreaking Kit", "This device allows you to change the model of your JoyCo unit from Bess-13 to Ben-14 and vice versa.\n\n<i><b>Warning:</b> While this should have no effect on the memory or personality of your android, the functionaly is no longer officially supported by JoyCo and may void the units warranty. Use with caution.</i>\n\nCost: 25000 credits");

	addButton(14, "Back", talkToBessAboutAccessories);
}

public function bessBuyGlasses():void
{
	clearOutput();
	bessHeader();

	output("You transfer the credits to JoyCo and place your order. It’s not long before a warp-space delivery service is dropping off a package to your spaceship hangar.");
	output("\n\nYou’ve recieved a pair of glasses for [bess.name]!");

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
	output("\n\nYou’ve recieved a katana for [bess.name]!");

	pc.credits -= 1000;
	flags["BESS_OWNS_KATANA"] = 1;

	clearMenu();
	addButton(0, "Next", bessBuyShitItems);
}

public function bessBuyJailbreakingKit():void
{
	clearOutput();
	bessHeader();

	output("You transfer the credits to the vendor and place your order. It’s not long before a warp-space delivery service is dropping off a package to your spaceship hangar.");
	output("\n\nYou’ve recieved a jail-breaking kit for use on [bess.name]!");

	pc.credits -= 25000;
	flags["BESS_OWNS_JBKIT"] = 1;

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
	bessBCW(7, "Goo", BESS_COCKTYPE_GOOEY, 1000);
	bessBCW(8, "Plant", BESS_COCKTYPE_VENUSPITCHER, 1000);
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
			addButton(idx, lbl, bessBuyCockType, [cockType, cost, lbl], lbl, "Cost: " + cost + " credits");
		}
		else
		{
			addDisabledButton(idx, lbl, lbl, "Cost: " + cost + " credits\nToo expensive!");
		}
	}
}

public function bessBuyCockType(opts:Array):void
{
	var cType:uint = opts[0];
	var cost:uint = opts[1];
	var lbl:String = opts[2];

	clearOutput();
	bessHeader();

	output("You transfer the credits to JoyCo and place your order. It’s not long before a warp-space delivery service is dropping off a package to your spaceship hangar.");
	output("\n\nYou’ve recieved " + indefiniteArticle(lbl.toLowerCase()) + " cock for [bess.name]!");

	bessAddCockType(cType);
	pc.credits -= cost;

	clearMenu();
	addButton(0, "Next", bessBuyShitCocks);
}

public function talkToBessAboutThings():void
{
	clearOutput();
	bessHeader();

	output("<i>“Yes, "+ bessPCName() +", what would you like to talk about?”</i>");

	clearMenu();
	addButton(0, "SpendTime", bessSpendTime);
	addButton(1, StringUtil.toTitleCase(bessName()), talkToBessAboutBess);
	addButton(2, "You", talkToBessAboutPC);
	
	if (flags["BESS_EVENT_28"] == undefined) addButton(3, "JoyCo", talkToBessAboutJoyco);
	else addDisabledButton(3, "JoyCo");

	if (flags["BESS_FUCKED"] != undefined || flags["BESS_BOOBCHANGED"] != undefined) addButton(4, "Nipples", talkToBessGetInfoOnNipnips);
	if (flags["BESS_EVENT_11"] != undefined) addButton(5, bess.mf("His", "Her") + " Job", talkToBessAboutHerJob);
	if (flags["BESS_EVENT_17"] && /*pcShipHasHolodeck()*/ 9999 == 0) addButton(6, "Graviball", talkToBessPlayGraviball);
	if (flags["BESS_EVENT_18"] != undefined) addButton(7, "Karaoke", talkToBessSingKareoke);
	if (celiseIsCrew()) addButton(8, "Celise", talkToBessAboutCelise);

	if (flags["BESS_LOVER"] == 1) addButton(9, "BreakUp", talkToBessDismiss);
	else addButton(10, "Dismiss", talkToBessDismiss);

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
			"I will always love you, "+ bessPCName() +".",
			"You inspire me to follow my dreams, and I love you for it.",
			"Your love has helped me become a better version of myself.",
			"I never imagined I would get to love someone as wonderful and special as you.",
			"You should always be proud of the person you are.",
			"Being in your arms is the most wonderful feeling in the galaxy.I’m so glad you’re home.",
			"The day I met you was the best day of my life.",
			"My life is full of color and love, and all because of you.",
			"The galaxy seems perfect when you hold me in your arms.",
			"I enjoy your company more than anything else in the world - that includes books!"
		)
	);
	output("”</i> [bess.HeShe] tells you.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
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
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime3():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_LOVER_STATUS"].indexOf("dom") != -1 || (bess.isMasculine() && flags["BESS_LOVER_STATUS"] != "sub" && flags["BESS_LOVER_STATUS"] != "pet"))
	{
		output("[bess.name] wants you to spend some time with her. When you are in the ship’s galley [bess.name] grabs you all of a sudden and presses you against the fridge. <i>“I want your lips...”</i> You happily submit, kissing [bess.hisHer] fervently as [bess.heShe] claims your [pc.lips]. You moan into [bess.hisHer] mouth, relishing [bess.himHer] claiming what is rightfully [bess.hisHers].");

		output("\n\nIt’s a long time before you pull away from each other and [bess.heShe] grins. <i>“...Tastiest thing I’ve ever gotten from the galley. Keep it up.”</i> [bess.HeShe] slaps you on your ass as [bess.heShe] leaves, causing a shiver to run up your spine");
		if (pc.hasTail()) output(" and down your [pc.tail]");
		output(".");
	}
	else
	{
		output("You spend some time with your " + bessLoverStatus() + ", [bess.name]. When you are both in the ship’s galley, you suddenly press [bess.hisHer] against the fridge. [bess.HeShe] moans into your lips as you kiss [bess.himHer] " + bess.mf("sliding his arms around your waist", "wrapping her arms around your neck") +".");

		output("\n\nIt’s a long time before you pull away from each other and [bess.heShe] grins, clearly happy with your decision to randomly seize [bess.himHer] and steal a kiss. <i>“...Mmm, I think that’s the tastiest thing I’ve ever gotten from the galley!”</i>");
	}

	processTime(15+rand(5));
	bessAffectionGain(BESS_AFFECTION_SPENDTIME);

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime4():void
{
	clearOutput();
	bessHeader();

	output("You decide to spend some time with your " + bessLoverStatus() + ". You notice [bess.name] has done something naughty by the way [bess.heShe]’s acting. You force [bess.himHer] to cough it out and [bess.heShe] spills the beans.");
	
	output("\n\nFor punishment you get [bess.himHer] to turn on [bess.hisHer] pain sensors and present to you [bess.hisHer] bare bottom. [bess.HeShe] does so immediately, trembling a little, as you spank [bess.himHer] until [bess.hisHer] silver cheeks are sore and flushed. [bess.HisHer] ");
	if (bess.hasCock()) output("[bess.cockNounSimple] is erect");
	else if (bess.hasVagina()) output("girl juice leaks down [bess.hisHer] thighs");
	else output("face is flushed with arousal")
	output(" despite [bess.hisHer] cries of protest, wiggling [bess.hisHer] stinging [bess.ass] and whining the entire time.");
	
	output("\n\nYou tell [bess.himHer] [bess.heShe] can stand up again and [bess.name] rubs [bess.hisHer] sore rump, thanking you for punishing [bess.himHer]. Even after you’re finished [bess.heShe] lingers, rubbing [bess.hisHer] [bess.thighs] together and looking at you with a needy expression.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(12+rand(7));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime5():void
{
	clearOutput();
	bessHeader();

	output("Your " + bessLoverStatus() + ", [bess.name] decides to remind you who the boss is. [bess.HeShe] orders you to turn around and present your bare [pc.ass]. You do so immediately, trembling a little, as [bess.heShe] spanks you <b>hard</b> until your buttcheeks are sore and flushed. You let out a little moan despite yourself, totally getting off on the abuse.");
	
	output("\n\nOnce [bess.heShe]’s finished you stand up and wriggle both because your rump is so sore and because you’re so turned on right now. You thank your " + bessLoverStatus() + " for punishing you and leave the room all hot and bothered.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(3+rand(3));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime6():void
{
	clearOutput();
	bessHeader();

	output("You decide to spend some quality time with [bess.name]. [bess.HeShe] kisses you " + bess.mf("slowly on the lips. It transforms into a long and passionate embrace.","sweetly on the lips, tiny little kisses of affection that soon blossom into a long and passionate embrace."));
	
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
			"Your kisses are intoxicating - they should be outlawed."
		)
	);
	output("”</i>");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(8+rand(5));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
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
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime8():void
{
	clearOutput();
	bessHeader();

	if (bessLoverStatus().indexOf("dom") == -1)
	{
		output("You spend some time with your "+bessLoverStatus()+", [bess.name]. You hand [bess.hisHer] a bouquet of [bess.hisHer] favorite flowers you recieved via space delivery - white oriental lilies with pink roses - causing [bess.hisHer] to flush and give you a great big hug. [bess.HeShe] immediately finds a place in the ship where [bess.heShe] can put it to show them off.");

		output("\n\nShe then spends quite a while showing you exactly how appreciative [bess.heShe] is of them.");
	}
	else
	{
		output("Your "+bessLoverStatus()+", [bess.name] needs you to do something for her. [bess.HeShe] orders you to go out and get some of [bess.hisHer] favorite flowers - white oriental lilies with pink roses - so [bess.heShe] can put them around the ship. You go out of your way to get some via space delivery. When you hand them over [bess.heShe] finds a place on the ship where they will be proudly displayed.");

		output("\n\n[bess.name] praises you for your hard work, causing you to flush.");
	}

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(20+rand(5));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime9():void
{
	clearOutput();
	bessHeader();

	output("[bess.name], your "+ bess.mf("dom", "domme") +", decides to reward you for being a good sub. [bess.HeShe] pets your head and tells you that you’ve been very well behaved and that [bess.heShe] loves you. For your obedience [bess.heShe] gives you a nice meal - served on the floor, from a bowl with your name on it.");
	
	output("\n\nYou happily finish off the food you have been given as [bess.heShe] rubs a riding crop along your [pc.skinFurScalesNoun]. You make sure to clean the bowl thoroughly, but you still miss a spot - [bess.name] smacks you with the crop until you lick it up.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime10():void
{
	clearOutput();
	bessHeader();

	output("You spend some time with your "+bessLoverStatus()+", [bess.name]. You pat [bess.hisHer] head and tell [bess.himHer] [bess.heShe]’s been a good little sub, and that you love [bess.himHer]. As a reward you give [bess.himHer] a nice meal - served on the floor, from a bowl with [bess.hisHer] name on it.");
	
	output("\n\n[bess.name] happily finishes off the food you have provided while you rub a riding crop between [bess.hisHer] thighs. Even though [bess.heShe] tries to clean the bowl as thoroughly as possible [bess.heShe] still misses a spot - you smack [bess.hisHer] rump with the crop until [bess.heShe] licks it up.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime11():void
{
	clearOutput();
	bessHeader();

	output("You decide to chill a bit with [bess.name]. You throw on your favorite movie and watch it while having a drink with [bess.himHer].");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(100+rand(20));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime12():void
{
	clearOutput();
	bessHeader();

	output("You decide to chill a bit with [bess.name]. You sit back and relax listening to some music with [bess.himHer], drinking some of your favorite tipple all the while.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(30+rand(15));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
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
	output(" [bess.heShe] read recently, and how [bess.heShe] ");
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
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime14():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] comes looking for you. When [bess.heShe] finds you [bess.heShe] walks up and gives you a tight hug, telling you that you are [bess.hisHer] dearest friend. [bess.HeShe] doesn’t let go until you feel well and truly appreciated.");
	
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
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime15():void
{
	clearOutput();
	bessHeader();

	output("You spend some of your down time with [bess.name]. You make up a sport with odds and ends in the ship, as well as a set of rules, and go about trying to beat each other at it. At the end you get to declare yourself the galactic champion of the made up sport.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
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
	addButton(0, "Next", bessFollowerMenu);
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
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime18():void
{
	clearOutput();
	bessHeader();

	output("You sit and talk to [bess.name]. You chat about what has been going on lately and [bess.heShe] hangs on every word.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime19():void
{
	clearOutput();
	bessHeader();

	output("You spend some time with [bess.name]. There are small but critical errors around the ship and you get [bess.himHer] to help you fix them up. Once you’re done the ship is running that much better.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(20+rand(10));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime20():void
{
	clearOutput();
	bessHeader();

	output("You spend some time with [bess.name]. [bess.HeShe] spends a lot of time explaining to you about the latest JoyCo products, encouraging you to buy them as soon as you are physically able.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime21():void
{
	clearOutput();
	bessHeader();

	output("You sit down with [bess.name] to chat. [bess.HeShe] talks to you about the exact process your body goes through when you orgasm, skipping no details. For some reason it still sounds hot even when [bess.heShe] reduces it to science.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime22():void
{
	clearOutput();
	bessHeader();

	output("You spend some time chatting with [bess.name]. [bess.HeShe] informs you of [bess.hisHer] current condition and also tells you that [bess.heShe] is perfectly capable of providing sexual relief whenever you need it in a multitude of positions. [bess.HeShe] goes on to detail the sex act called ");
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

	output("You sit down with [bess.name] to talk. [bess.HeShe] explains how [bess.hisHer] research into making the universe a happier place is going. You listen to [bess.hisHer] thoughts and conclusions, occasionally giving [bess.himHer] some advice on what to try next.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime24():void
{
	clearOutput();
	bessHeader();

	output("You decide to spend some time with [bess.name]. [bess.HeShe] spends a great deal of time talking about the ");
	output(
		RandomInCollection(
			"movies [bess.heShe]’s watched",
			"holos [bess.heShe]’s seen",
			"novels [bess.heShe]’s read",
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
			"thought it positively awful and wants [bess.hisHer] time back"
		)
	);
	output(". You spend some time talking with [bess.himHer] about it.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
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
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime26():void
{
	clearOutput();
	bessHeader();

	output("You sit down with [bess.name] to chat. You talk to [bess.himHer] about your journey and why you’re on it. [bess.HeShe] seems touched by the fact you are sharing this information with [bess.himHer] and listens to you speak in reverent silence.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime27():void
{
	clearOutput();
	bessHeader();

	output("You spend some time with [bess.name]. You talk to [bess.himHer] about your uncle, Maximilian, and your cousin slash rival. [bess.HeShe] seems touched by the fact you are sharing this information with [bess.himHer] and listens to you speak in reverent silence.");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
}

public function bessSpendTime28():void
{
	clearOutput();
	bessHeader();

	output("You sit down with [bess.name] to talk. You ask [bess.himHer] simple questions about [bess.himHer]self and [bess.heShe] eagerly responds, quite happy to give you [bess.hisHer] full specs in every single detail. By the time you’ve both finished talking you know ");
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
			"how [bess.hisHer] skin was made"
			)
	);
	output(".");

	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	processTime(10+rand(10));

	clearMenu();
	addButton(0, "Next", bessFollowerMenu);
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
	
	output("\n\n<i>“Before you activated me I was built at a JoyCo factory on Panara, "+bessPCName()+". Unplugging the power coupling and seeing you are the first memories I have.”</i>");
	
	output("\n\nIt seems when [bess.heShe] rebooted, [bess.hisHer] entire memory was wiped, including how [bess.heShe] ended up on the planet in the first place. You decide to ask [bess.himHer] when [bess.heShe] was issued from the JoyCo factory.");
	
	output("\n\n[bess.name] informs you that [bess.heShe] was issued to you a week before you activated [bess.himHer], but when you ask [bess.himHer] the date [bess.heShe] gives you the wrong year. [bess.HeShe] seems to be laboring under the assumption that it is eleven years ago. It seems [bess.name] has at least that many years of prior ownership wiped from [bess.hisHer] memory.");
	
	output("\n\nTelling [bess.himHer] is only going to make [bess.himHer] confused so you instruct [bess.himHer] to update [bess.hisHer] internal clock to the correct year. [bess.name] doesn’t ask questions and obediently complies with your request.");

	processTime(15+rand(5));
	//CodexManager.unlockEntry("Panara");

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
	//CodexManager.unlockEntry("Panara");

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
	//CodexManager.unlockEntry("Panara");

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function aboutBess4():void
{
	clearOutput();
	bessHeader();

	output("When you ask about Panara, [bess.name] seems to become quite energized. It seems [bess.heShe] enjoys talking about [bess.hisHer] ‘home planet’.");
	
	output("\n\n<i>“Panara is a small planet located in the Lagoon Nebula, nestled between three very wealthy solar systems. Since these systems have a high demand for JoyCo products, a JoyCo factory was set up on Panara in order to meet their needs. Needless to say, it is also where I was constructed.”</i>");
	
	output("\n\n<i>“The planet circles a red dwarf star and is rather cool but livable, experiencing low seasonal growth and perpetual winter climes. Because of this it is perfect for large industrial facilities to be built far away from urban centers.”</i>");
	
	output("\n\n<i>“Most of the denizens of Panara are employees of JoyCo and their families. There are a few factories owned by competitors, but JoyCo has the largest facilities on the planet. Panara has no sentient indigenous species. Those that do move there are either human or ausar.”</i>");
	
	output("\n\n<i>“The ausar there have thick fur and work outside more than the human populace. There are just as many synthetics working the factories on Panara as organics, though some consider synthetics building synthetics as perverse.”</i>");
	
	output("\n\n<i>“Someday I would very much like to show you Panara, "+ bessPCName() +". The JoyCo factory there is a marvel to behold, and there are sure to be many products worth your while.”</i>");

	processTime(10+rand(10));
	//CodexManager.unlockEntry("Panara");

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function aboutBess5():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] " + bess.mf("mock gasps","mockes blush") + ", and holds a hand over [bess.hisHer] mouth. <i>“You want me to reveal something so personal, "+ bessPCName() +"?”</i> It seems like [bess.heShe]’s trying to wind you up.");

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
	
	output("\n\nYou ask why JoyCo decided to use an AI instead of a VI for a sex-bot.");

	output("\n\n<i>“Probably because a VI is very bad at faking an orgasm.”</i> It sounds like a quip, but apparently it’s the truth from [bess.hisHer] expression. <i>“...Not that I </i>do<i> fake orgasms - my pleasure feedback sensors are set too high for that - but VI’s are terrible at reading what their end user wants.”</i> [bess.HeShe] sounds more than a little haughty. <i>“...I mean, unless you’re into non-tailored sexual relief.”</i>");

	processTime(10+rand(10));
	//CodexManager.unlockEntry("Panara");

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function aboutBess7():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_LOVER"] == undefined)
	{
		output("You ask [bess.name] about [bess.hisHer] service life span. While talking about death is an uncomfortable topic for organics, speaking about it doesn’t seem to bother [bess.himHer] in the least.");
	}
	else
	{
		output("You ask [bess.name] about [bess.hisHer] service life span. [bess.HeShe] seems to be a little sad talking about the topic, since clearly the idea of potentially outliving you is a depressing one.");
	}

	output("\n\n<i>“My service life - how long JoyCo honors my warranty - is far shorter than my predicted life span or the estimated time until I stop working altogether.”</i> [bess.HeShe] informs you. <i>“My body is mostly made of FlexMetal and it takes a very long time to break down. My AI processor is also very resilient. My service life is one hundred years and my predicted life span is three to four hundred.”</i>");

	output("\n\n<i>“Usually JoyCo offers a discounted upgrade for turning old models in, so not many units make it to the end of their predicted life span. They are usually melted down for scrap, especially the expensive models like me who are made out of rare minerals.”</i>");

	if (flags["BESS_LOVER"] != undefined)
	{
		output("\n\n[bess.name] holds your hands in [bess.hisHer] own and looks up at you. <i>“If... if by some chance it looks like I am going to outlive you, I have chosen to deactivate myself and overload my processor. This way I can die at the exact same time as you do. I... I don’t want to continue functioning in a world without you, "+ bessPCName() +".”</i>");
	}

	if (flags["BESS_FRIEND"] != undefined)
	{
		output("\n\n[bess.name] pauses and looks at you with a worried expression. <i>“Hey, uh... buddies don’t melt each other down for scrap, right? I’m pretty sure that’s in the unofficial friend rulebook. Can you forget that I told you that you can melt me down and sell my remains for a lot of cash?”</i>");
	}
	else
	{
		output("\n\n[bess.name] smiles and seems completely undaunted by this prospect. <i>“If you do live to see your hundredth birthday, I would recommend melting me down for a discount. I’m sure a far superior model of AI will be out by that time, and I’d hate to see you receive sub-par service.”</i>");
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
	
	output("\n\n‘Semi’ synthetic substance? You ask [bess.himHer] if this means the other half is organic.");
	
	output("\n\n<i>“Well, yes. MeldMilk is made by breaking down organic matter and transforming it into a partially synthetic polymer, so that it contains the desirable properties of both. That way it has longevity without sacrificing the ability to self-replicate.”</i>");
	
	output("\n\n<i>“When needed, I can return MeldMilk back to organic matter, though one entirely different from the original substance. That’s how I’m able to produce realistic body fluids such as semen, milk, or saliva.”</i>");
	
	output("\n\n<i>“It’s actually a pretty complicated process trying to make an organic stand-in. Some companies that shall not be named just use silicone and just expect consumers to endure a sub-par product.”</i> [bess.name] " + bess.mf("huffs","pouts"));
	// 9999
	if (flags["MET_GIANNA"] != undefined)
	{
		output(", clearly referring to");
		//if (GiannaFollowerYes)
		if (flags["GIANNAFOLLOWER"] == 9999)
		{
			output(" Gianna and");
		}
		output(" KihaCorp");
	}
	output(".");
	
	output("\n\nYou ask [bess.himHer] if there are any limits to the substances [bess.heShe] can make. After all, if you need starship fuel, will [bess.heShe] be able to produce it?");
	
	output("\n\nAs expected, [bess.name] shakes [bess.hisHer] head. <i>“There’s limits to the complexity of what I can produce. The base substance is very similar to semen, and I can only produce an array of body-fluid like substances that fall into that range.</i>");
	
	output("\n\n<i>“I’m not all that different from you in that respect - after all, it’s not like </i>you<i> can’t produce this stuff given the circumstances just by eating and drinking. You’re pretty amazing!”</i> [bess.name] exclaims, clearly amazed by how you can produce saliva and sweat at the same time as a basic function.");
	
	output("\n\n<i>“That said, I </i>can<i> get low on MeldMilk. When that happens, the best thing I can do is consume a similar substance. That usually isn’t so hard considering what I’m built for.”</i>");
	
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

	output("You ask [bess.name] what [bess.heShe] thinks about you.");

	if (flags["BESS_LOVER"] != undefined)
	{
		output("\n\n<i>“What do I think about you, "+bessPCName()+"? I love and adore you with all of my heart!”</i>");

		if (bessAffection() >= 90)
		{
			output("\n\n<i>“I think you are wonderful" + bess.mf(", and the light of my life", ", and you treat me like a princess") + "! Even though I spend so much time with you, I feel like I can never get enough.”</i> The silver skinned synthetic wraps [bess.hisHer] arms around your waist. <i>“I know some people would say we’re always in each other’s arms, but I don’t care one bit!”</i>");
		}
		else if (bessAffection() >= 70)
		{
			output("\n\n<i>“I think you are wonderful" + bess.mf(", and the light of my life", ", and you treat me like a princess") + ". You make my life complete in so many ways, and I’m glad you can always find time to spend with me and make me feel special.”</i>");
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
			output("\n\n<i>“...I... I feel like we’re not even a couple anymore. You’re so incredibly distant that it feels like you’re a dream that never happened. Sometimes I cry myself to sleep thinking about how we could have become like this... do you even love me anymore?”</i>");
		}

		if (bessIsSleepCompanion())
		{
			output("\n\n<i>“It makes me happier than you could ever know that we wake up beside each other every morning. Seeing you as I boot up is like seeing the sunrise every morning - you fill my life with light.”</i>");
		}
		else
		{
			output("\n\n<i>“...I wish we slept together instead of me always having to go back to my room. It gets lonely in there by myself.”</i>");
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
			output("\n\n<i>“...That said, I--I kind of feel like we’ve drifted apart. We’re still friends, right? It feels like I hardly see you anymore, and when I do you’re right out the door. Things have been getting really lonely around here...”</i>");
		}
		else
		{
			output("\n\n<i>“...That said, I--I kind of wonder if we are still friends? We never hang out, it’s as if we’re strangers... or worse. Did... did I do something wrong? Did I offend you somehow?”</i>");
		}
	}
	else
	{
		output("\n\n<i>“What do I think about you, " + bessPCName() + "? When I watch you, sometimes I wonder if you’re an organic at all, or if you really are made of Steele!”</i>");

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
			output("\n\n<i>“I’m so glad that you take time out to spend with me. I hope that the service I am providing you is satisfactory—?”</i>");
		}
		else
		{
			output("\n\n<i>“You’re my owner, so you are free to use me as you wish. I constantly worry that you are not getting enough sexual relief.”</i>");
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
	
	output("\n\nSince it doesn’t seem like you’re going to let it go, [bess.name] looks at you with apologetic eyes. <i>“...Well, truth be told, I’ve got a bug. Or at least, I think I do. I can’t turn the sensitivity settings of my nipples down.”</i>");
	
	output("\n\nYou ask how long [bess.heShe]’s had this particular quirk, and exactly <i>how</i> sensitive they are.");
	
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
	
	output("\n\n<i>“Not that I know of so far. JoyCo doesn’t seem to have released a patch for my model, which is really odd. Maybe it’s in the works? I’ve tried to tweak it myself, but I’m having no luck.</i> [bess.HeShe] sighs.");
	
	output("\n\n<i>“It’s not all that bad, I just have to be </i>really<i> careful when brushing things against them. Otherwise I need a change of underwear. They’re just that sensitive!”</i> [bess.name] groans, sounding both delighted <i>and</i> irritated by [bess.hisHer] ‘problem’.");

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
	
	output("\n\nAfter [bess.heShe] calms down, [bess.heShe] looks down at [bess.hisHer] [bess.nipples]. <i>“...I could </i>try<i> tweaking it that way, but I’d have to play with my own settings a bit. Give it some time and come back to me, okay?”</i>");

	processTime(3);

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function talkToBessAboutHerJob():void
{
	clearOutput();
	bessHeader();

	output("You ask [bess.himHer] how [bess.hisHer] job as the ship’s "+ bessCrewRole() +" is going. As usual [bess.heShe]’s " + bess.mf("happy","excited") + " to tell you all about it.");

	if (flags["BESS_CREW_ROLE"] == BESS_CREWROLE_INTOFFICER)
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
	else if (flags["BESS_CREW_ROLE"] == BESS_CREWROLE_ACCOUNTANT)
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
	else if (flags["BESS_CREW_ROLE"] == BESS_CREWROLE_ARCHIVIST)
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
	else if (flags["BESS_CREW_ROLE"] == BESS_CREWROLE_STEWARDESS)
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
	else if (flags["BESS_CREW_ROLE"] == BESS_CREWROLE_TECHNICIAN)
	{
		output("\n\n<i>“Things are going great, "+ bessPCName() +"! I’ve just been ");
		output(
			RandomInCollection(
				"working on Spidey. I’m hoping to have him up and running soon!",
				"adjusting the output of your shield. It should be more efficient now!",
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
	if (crew(true) == 2) output(" <i>“You decide to go grab the only other crew member on the ship to see if they’d be up for a game.”</i>");
	else if (crew(true) >= 3) output(" <i>“You decide to go grab your other crew members to see if they’d be up for a game.”</i>");

	// Different NPC reactions on being asked.

	output("<i>“You want to play Graviball, [bess.name]?”</i> [bess.name]’s eyes shine with delight. <i> “Let’s do it!”</i>");

	output("\n\nThe");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	else output(" silver headed");
	output(" synthetic runs off and comes back in a modified white and navy blue Graviball outfit designed loosely to resemble that of the Stallium Knights. [bess.HisHer] outfit consists of a sexy, tight short sleeve sports top, a pair of dark short shorts and a pair of sports sneakers. When did [bess.heShe] buy it?");

	if (celiseIsCrew())
	{
		output("\n\nCelise is more than happy to join in on a game of Graviball, though [bess.heShe] seems to have ulterior motives. <i>“How about the winner gets a nice big supply of protein?”</i> She slyly suggests, her emerald green body sloshing about.");

		output("\n\nYou tell Celise that you’re playing for fun and exercise causing the galotian to pout, crossing her arms and causing her massive gooey mammaries to push out.");

		output("\n\n<i>“Well, you never know which way the game might turn...”</i> She cryptically gives her assent, eyeing you off with a saucy look in her eyes. You’re definitely going to have to watch your back during the game - seems Celise is on the hunt!");
	}

	output("\n\nHeading to the holodeck you enter the room and activate the Graviball simulation. In the blink of an eye you are standing in a galactic class sports stadium with billions of fans of almost every conceivable species cheering around you. The atmosphere is so authentic you can’t help but feel momentarily taken aback - [bess.name] really went all out putting together this simulation.");
	
	output("\n\nYour team banners fly high, a nice touch from the synthetic sports fan. Your team, the Steele Tigers, is playing against ");
	if (crew(true) == 1) output(" a randomly generated opposing team.");
	else if (crew(true) == 2) output(" your other crewmate and a computer generated team for them to play with.");
	else output(" the rest of the crew and a computer generated team to play with.");
	output(" Of course you have your own allies to play with - you selected them personally before the match and now you feel you have the perfect team.");
	
	output("\n\nThe program has provided you with league issue pulse gear needed to play the game. Your [pc.feet] and hands are outfitted with special gloves and boots that allow you to jump incredibly high, fly through the air and kick the z-g ball (or opponents) away at incredible speeds. It also allows you to easily catch fast flying balls just like a high-tech catching mitt.");
	
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
	
	output("\n\nLater in the game you find yourself up the front as you realize everyone’s too busy defending against the opposing team, who have suddenly launched a strong offensive. Your gamble pays off when one of your team-mates suddenly kicks it clear across the field, bouncing it off the bottom of the top platform as it rebounds towards your position.");
	if (rand(pc.AQ()) >= 25) output(" Ready and waiting to take the shot you kick the z-g ball and send it hurtling towards the goals with a slight curve, catching the goalie by surprise as you nail it right in the net. The ring explodes in a fanfare celebrating your goal and you grin, it was the perfect shot!");
		else output(" Ready and waiting to take the shot you kick the z-g ball and send it hurtling towards the goals... or so you think. Your aim is way off and it shoots past the goalie, hitting the holo-field protecting the crowd and the referee calls it out. If only your aim was better, you had the perfect chance to score a goal!");

	output("\n\nMoving back to the center platform you see [bess.name] darting on to the one above you, clearly up to something. You fly up and hook around just as one of [bess.hisHer] team-mates kicks the ball up to her. There’s a perfect chance for [bess.himHer] to make a shot from high up diagonally down and at the goals, none of your team are there defending except for the goalie.");
	
	output("\n\n<i>“Think you can stop me making the shot, "+ bessPCName() +"?”</i> [bess.name] cheekily taunts you as [bess.heShe] darts forward making [bess.hisHer] move. You have no idea what [bess.heShe]’s going to try and do, but you’re ready for anything! [bess.HeShe] kicks the ball sideways to another player who is jetting up and to your side and just as you move to intercept [bess.heShe] launches [bess.himHer]self at you.");
	if (rand(pc.RQ()) >= 25) output(" You’re far too quick and dart to the side, kicking the ball far into [bess.hisHer] end of the field as [bess.heShe] faceplants on the platform. <i>“SYNTAX ERRORS!”</i> [bess.HeShe] curses aloud while rubbing [bess.hisHer] nose.”</i>");
	else output(" <i>“You’re just too slow on the uptake as [bess.hisHer] ally steals the ball and kicks it far away. Another one of the opposing team is there to collect and scores a goal. Frag your reflexes!”</i>");

	if (celiseIsCrew())
	{
		output("\n\nThings take a bit of a turn when Celise decides she would be much better taking the goalie position. Suddenly your team is unable to get a single shot past the green galotian, absorbing even the strongest hits into her jelly-like body. <i>“I always get whatever I want to catch!”</i> She boldly exclaims, your team is really going to have to step up its game.");

		if (pc.intelligence() >= 25)
		{
			if (rand(pc.IQ()) >= 25)
			{
				output("\n\nYou come up with a cunning plan in order to break through her defences. There’s no way you’re going to be able to beat her while she’s defending the goal - she’s far too good for that. Instead you come up with a plan to take advantage of ger biggest weakness, using your pulse boots to get up close to the goals.");
				
				output("\n\nYou stroke your body and look at her rather suggestively, giving her a wink. <i>“...Hey Celise, how about you step away from those goals and we go get a little frisky?”</i>");
				
				output("\n\nCelise falls for it hook, line and sinker and moves away from the goals as soon as there’s a promise of a nice protein snack. The instant she does your team advances in, scoring a loud goal. The emerald galotian looks behind herself and suddenly realizes your ploy, looking thoroughly grumpy. <i>“...No fair, that’s cheating!”</i>");
				
				output("\n\nTechnically seduction has never been against Graviball league rules, so you’re pretty sure it’s fair play... you might end up paying for it later though.");
			}
			else
			{
				output("\n\nYou simply can’t find a way to penetrate her defenses, she’s just too good at repelling, absorbing or catching anything that even comes close to her net. Thankfully a rather attractive (and sadly, entirely digital) player catches her interest later on and she moves away from the net, ending the one sided spanking your team was taking.");
			}
		}
		else
		{
			output("In the end Celise protecting the goals swung the game entirely in the opposing team’s favor and you lose the match. She comes sloshing up to you as both sides congratulate each other on a good game, a hopeful look in her eyes. <i>“So, do I get anything for winning?”</i></i>");
			
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
			output("\n\nYou see Celise ‘slooping’ up and licking her lips, apparently she found herself a snack. You can see one of the players naked and completely incapacitated. <i>“Enjoyable game, but I’m still hungry... this virtual stuff is always such a tease.”</i>");
		}


		output("\n\nMeanwhile even though [bess.heShe] lost [bess.name] seems thrilled to have played such a good game, running towards you and giving you a flying hug. <i> “You were so awesome, "+ bessPCName() +", though I almost totally had you for a second there! We’ll have to have a rematch sometime, okay?”</i>");
	}

	//You gain ??? XP from playing a game of Graviball.
	// Time passes, PC takes a big fatigue hit! Possible

	bessAffectionGain(BESS_AFFECTION_GRAVIBALL);
	processTime(120+rand(30));
	pc.energy(-pc.energyMax() * 0.8 );

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function talkToBessSingKareoke():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] boots up the karaoke machine and tosses you a microphone.");
	if (crew(true) > 1) output(" You invite the other crew members along too.");

	if (celiseIsCrew())
	{
		output("\n\nCelise is a surprisingly beautiful singer and really gets into it, her massive tits jiggling as she wiggles along with the music. The sexy jello girl sings in perfect tune, wobbling about the place in a truly distracting fashion. <i>“How’d I do? Did I do good?”</i> Even when she stops the galotian’s tits are still moving about.");
	}

	output("\n\nAs usual [bess.name] gets up to sing and [bess.heShe]’s a wonderful vocalist, [bess.hisHer] voice has a naturally melodic quality as is. [bess.HeShe] sings with [bess.hisHer] entire body, letting the music flow through [bess.himHer] and course through [bess.hisHer] artificial skin. The silver skinned synthetic winks at you as [bess.heShe] performs.");

	if (flags["BESS_PC_KAREOKE_SKILL"] == undefined) flags["BESS_PC_KAREOKE_SKILL"] = rand(6);

	if (flags["BESS_PC_KAREOKE_SKILL"] == 0)
	{
		output("\n\nAs you get up to sing you grab [bess.name]’s microphone and start to sing -");
		if (crew(true) > 1) output(" everyone");
		else output(" [bess.heShe]");
		output(" cringes and your microphone is taken away from you. It is quickly replaced with another. <i>“Here, take this one!”</i> [bess.name] exclaims, it seems you’re not allowed to sing without the ‘special microphone’. When you do your voice sounds wonderful and more importantly, bearable.");
	}
	else if (flags["BESS_PC_KAREOKE_SKILL"] < 5)
	{
		output("\n\nYou get up to sing and grab the microphone, really getting into it. You’re a");
		if (flags["BESS_PC_KAREOKE_SKILL"] == 1) output(" terrible singer and really butcher every song");
		else if (flags["BESS_PC_KAREOKE_SKILL"] == 2) output(" very average singer and spend as much time in tune as out of it");
		else if (flags["BESS_PC_KAREOKE_SKILL"] == 3) output(" good singer and everyone is really impressed");
		else if (flags["BESS_PC_KAREOKE_SKILL"] == 4) output(" sublime singer and everyone is really impressed");
		output(", but in the end that’s not what matters. You have a good time with");
		if (crew(true) > 1) output(" everyone");
		else output(" [bess.name]");
		output(" singing karaoke, and that’s what counts.");
	}
	else
	{
		output("\n\nYou get up to sing and grab the microphone, really getting into it. Your singing voice is truly sublime - when you sing a word it is the most perfect way that word can possibly sound to any ear in the galaxy.");
		if (crew(true) > 1) output(" Everyone");
		else output(" [bess.name]");
		output(" sits spellbound as you put your magical vocal cords to work. When you finish there is a lot of applause and calling for another song. Whenever you sing it’s not karaoke as much as a live performance.");
	}

	// bessAffection increases, time is spent.

	bessAffectionGain(BESS_AFFECTION_KAREOKE);
	processTime(50+rand(20));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function talkToBessAboutCelise():void
{
	clearOutput();
	bessHeader();

	output("You ask [bess.name] what [bess.heShe] thinks of Celise.");

	if (celiseIsCrew() && bessClosedRelationship() && flags["CREWMEMBER_SLEEP_WITH"] == undefined && flags["BESS_SLEEPWITH_INTRODUCED"] != undefined)
	{
		output("\n\n<i>“Celise? " + bess.mf("Well, what’s not to love about her?", "I love and adore her to bits!") + " Not in the same way I love you, of course. If there is one thing I had to say... it’s that I’d rather not have her sharing your bed - it’s a bit much, don’t you think?”</i>");

			//to share the bed with her. Waking up to her sucking you off - it’s a bit much, don’t you think?”</i>");
	}
	else if (celiseIsCrew() && bessClosedRelationship() && flags["BESS_LOVER"] != undefined && flags["CREWMEMBER_SLEEP_WITH"] == undefined)
	{
		output("\n\n<i>“Celise?”</i> [bess.name] narrows her eyes at you a little. <i>“Look, I love Celise, not in the same way I love you, but... letting her sleep with you while I have to sleep in another room? That’s so unfair!”</i> [bess.HisHer] tone is very grumpy. It was probably a bad question to ask her.");
	}
	else if (flags["BESS_LOVER"] != undefined)
	{
		output("\n\n<i>“Celise?”</i> [bess.name] " + bess.mf("grins", "beams brightly") + ", <i>“" + bess.mf("Well, what’s not to love about her?", "I love and adore her to bits!") + " Not as much or in the same way as I love you, of course. My one problem is that she always seems to find and interrupt us when we’re in the middle of us time!”</i>");

		output("\n\n<i>“It’s mostly for protein though, and that’s not so bad. I can make it from my MeldMilk easily enough, though the way she likes to feed off it...”</i> [bess.name] " + bess.mf("coughs", "flushes a little") + ". <i>“...Well, she says there’s a ‘boring way’ and a ‘fun way’. She always picks the latter.”</i>");
	}
	else
	{
		output("\n\n<i>“Celise?”</i> " + bess.mf("grins", "beams brightly") + ", <i>“She’s my friend, and I think she’s wonderful! You’re my best friend of course. She’s always pestering me for protein though.”</i>");

		output("\n\n<i>“I can make it from my MeldMilk easily enough, though the way she likes to feed off it...”</i> [bess.name] " + bess.mf("coughs", "flushes a little") + ". <i>“...Well, she says there’s a ‘boring way’ and a ‘fun way’. She always picks the latter.”</i>");
	}

	processTime(5);

	clearMenu();
	addButton(0, "Next", talkToBessAboutThings);
}

public function talkToBessDismiss():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_LOVER"] != undefined)
	{
		output("Are you sure you want to break up with [bess.name]? You have a gut feeling that if you end your relationship, it won’t be a clean break. [bess.HeShe]’ll probably leave the ship. You’d lose your "+ bessLoverStatus() +" as well as your "+ bessCrewRole() +".");
		//[Reconsider] [Yes, Break Up]
		clearMenu();
		addButton(0, "Reconsider", talkToBessAboutThings);
		addButton(1, "BreakUp", talkToBessBreakUp);
	}
	else
	{
		output("Did you want to dismiss [bess.name] from your service? If you tell [bess.himHer] to leave, [bess.heShe] will wait in your hangar back on Tavros station.")
		clearMenu();
		addButton(0, "Reconsider", talkToBessAboutThings);
		addButton(1, "Dismiss", talkToBessConfirmDismiss);
	}
}

public function talkToBessBreakUp():void
{
	clearOutput();
	bessHeader();

	flags["BESS_LOCATION"] = BESS_DISABLED;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;

	output("You tell [bess.name] that you no longer love [bess.himHer] and that it’s over between you.");
	if (pc.isNice()) output(" You try to word it as gently as possible, but there’s just no good way to deliver it.");
	else if (pc.isMischievous()) output(" You try to deliver the news lightly, but there’s just no way to take the edge off.");
	else output(" You’re rather blunt about it, since you’re no good at beating around the bush with this sort of thing.");
	
	output("\n\nAs expected, your words are utterly soul crushing. [bess.HisHer] [bess.eyes] quiver and " + bess.mf("his whole body trembles", "her lower lip trembles") + ". You can see [bess.hisHer] entire world crashing down as [bess.heShe] stares at you in utter disbelief and heart-wrenched despair.");
	
	output("\n\n[bess.HeShe] tries to open [bess.hisHer] mouth, but only a choked noise comes out. Soon [bess.heShe]’s running and collecting [bess.hisHer] things, obviously packing to leave the ship.");
	
	output("\n\nBefore you know it, there’s silence, and [bess.name] has left to who knows where. You have no idea where [bess.heShe] went, or if you’ll ever see [bess.himHer] again.");
	
	output("\n\n(<b>[bess.name] is no longer part of your crew.</b>)");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function talkToBessConfirmDismiss():void
{
	clearOutput();
	bessHeader();
	
	flags["BESS_LOCATION"] = BESS_AT_TAVROS;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	
	output("<i>“Alright, "+ bessPCName() +"! I’ll wait for you back on Tavros if you need me,”</i> [bess.name] obediently replies. [bess.HeShe] doesn’t seem that upset by you kicking [bess.himHer] off the ship.");
	
	output("\n\n(<b>[bess.name] is no longer on your crew. You can find [bess.himHer] again in Tavros Station.</b>)");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

/**
 * Hook into the approach method for Bess. Attempt to fire a relevent event, or do nothing.
 * Supports event supression via a flag (BESS_EVENT_SUPRESSION). Set it to a positive integer to supress events for that many initial approaches.
 * @return 		Returns true if an event fired, false if no events fired.
 */
public function bessEventHook():Boolean
{
	if (flags["BESS_EVENT_7_APOLOGY_NEEDED"] != undefined)
	{
		bessEvent7Apology();
		return true;
	}

	if (flags["BESS_EVENT_19_REJECTION"] == 1)
	{
		bessEvent19RejectionFollowup();
		return true;
	}

	// TODO: Play 20 immediately after 19 is done -- no supression
	if (bessEventCheck(19) && !bessEventCheck(20) && flags["BESS_JUST_A_FRIEND"] == undefined)
	{
		bessEvent20();
		return true;
	}

	// Played upon next entering Bess's menu if you told her you didn't like her skin.
	if (flags["BESS_EVENT_25_SPINOFF"] == 1)
	{
		bessEvent25Spinoff();
		return true;
	}

	// Tick down supression of event procs
	if (flags["BESS_EVENT_SUPRESSION"] != undefined)
	{
		flags["BESS_EVENT_SUPRESSION"] -= 1;
		if (flags["BESS_EVENT_SUPRESSION"] == 0) flags["BESS_EVENT_SUPRESSION"] = undefined;
		return false;
	}

	// Depending on outcome of an event, prevent any further relationship building (supress further events)
	if (flags["BESS_JUST_A_SEXBOT"] == 1 || flags["BESS_JUST_A_FRIEND"] == 1)
	{
		return false;
	}

	var bEvent:Boolean = false;
	
	// Universal control over the event chances
	var iChance:int = 4;
	// New chance
	iChance = 2;

	if (!bessEventCheck(0))
	{
		if (rand(iChance) == 0)
		{
			bessEvent0();
			bEvent = true;
		}
	}
	
	if (bessEventCheck(0) && !bessEventCheck(1) && !bEvent)
	{
		if ((flags["BESS_EVENT_0"] + 12 * 60 <= GetGameTimestamp()) && rand(iChance) == 0)
		{
			bessEvent1();
			bEvent = true;
		}
	}
	
	if (bessEventCheck(1) && !bessEventCheck(2) && !bEvent)
	{
		if ((flags["BESS_EVENT_1"] + (1.5 * 24 * 60) <= GetGameTimestamp()) && rand(iChance) == 0)
		{
			bessEvent2();
			bEvent = true;
		}
	}

	if (bessEventCheck(2) && !bessEventCheck(3) && !bEvent)
	{
		if (flags["BESS_EVENT_2"] + (24 * 60) <= GetGameTimestamp())
		{
			bessEvent3();
			bEvent = true;
		}
	}

	if (bessEventCheck(3) && !bessEventCheck(4) && !bEvent)
	{
		if (flags["BESS_EVENT_3"] + (1.5 * 24 * 60) <= GetGameTimestamp() && rand(iChance) == 0)
		{
			bessEvent4();
			bEvent = true;
		}
	}

	if (bessEventCheck(4) && !bessEventCheck(5) && !bEvent)
	{
		if (flags["BESS_EVENT_4"] + (2 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 20)
		{
			bessEvent5();
			bEvent = true;
		}
	}

	if (bessEventCheck(5) && !bessEventCheck(6) && !bEvent)
	{
		if (flags["BESS_EVENT_5"] + (2 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 30 && rand(iChance) == 0)
		{
			bessEvent6();
			bEvent = true;
		}
	}

	if (bessEventCheck(6) && !bessEventCheck(7) && !bEvent)
	{
		if (flags["BESS_EVENT_6"] + (2 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 40)
		{
			bessEvent7();
			bEvent = true;
		}
	}

	if (bessEventCheck(7) && !bessEventCheck(8) && !bEvent)
	{
		if (flags["BESS_EVENT_7"] + (2 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 50)
		{
			bessEvent8();
			bEvent = true;
		}
	}

	if (bessEventCheck(8) && !bessEventCheck(9) && !bEvent)
	{
		if (flags["BESS_EVENT_8"] + (2 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 50)
		{
			bessEvent9();
			bEvent = true;
		}
	}

	if (bessEventCheck(9) && !bessEventCheck(10) && !bEvent)
	{
		if (flags["BESS_EVENT_9"] + (1.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 50 && rand(iChance) == 0)
		{
			bessEvent10();
			bEvent = true;
		}
	}

	if (bessEventCheck(10) && !bessEventCheck(11) && !bEvent)
	{
		var e11Chance:int;
		if (flags["BESS_EVENT_11_TIMES"] == undefined) e11Chance = iChance;
		else e11Chance = iChance * 5;

		if (flags["BESS_EVENT_10"] + (1.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 50 && rand(e11Chance) == 0 && flags["VISITED_MYRELLION"] != undefined)
		{
			bessEvent11();
			bEvent = true;
		}
	}

	if (bessEventCheck(11) && !bessEventCheck(12) && !bEvent)
	{
		if (flags["BESS_EVENT_11"] + (1.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 60 && rand(Math.floor(iChance * 2.5)) == 0)
		{
			bessEvent12();
			bEvent = true;
		}
	}

	if (bessEventCheck(12) && !bessEventCheck(13) && !bEvent)
	{
		if (flags["BESS_EVENT_12"] + (1.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 60 && rand(Math.floor(iChance * 2.5)) == 0)
		{
			bessEvent13();
			bEvent = true;
		}
	}

	if (bessEventCheck(13) && !bessEventCheck(14) && !bEvent)
	{
		if (flags["BESS_EVENT_13"] + (1.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 60 && rand(iChance) == 0)
		{
			bessEvent14();
			bEvent = true;
		}
	}

	if (bessEventCheck(14) && !bessEventCheck(15) && !bEvent)
	{
		if (flags["BESS_EVENT_14"] + (1.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 60 && rand(iChance) == 0)
		{
			bessEvent15();
			bEvent = true;
		}
	}

	if (flags["BESS_FRIEND"] != undefined)
	{
		if (bessEventCheck(15) && !bessEventCheck(16) && !bEvent)
		{
			if (flags["BESS_EVENT_15"] + (1.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 70 && rand(iChance) == 0)
			{
				bessEvent16();
				bEvent = true;
			}
		}

		if (bessEventCheck(16) && !bessEventCheck(17) && !bEvent)
		{
			if (flags["BESS_EVENT_16"] + (1.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 70 && rand(iChance) == 0)
			{
				bessEvent17();
				bEvent = true;
			}
		}

		if (bessEventCheck(17) && !bessEventCheck(18) && !bEvent)
		{
			if (flags["BESS_EVENT_17"] + (1.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 70 && rand(iChance) == 0)
			{
				bessEvent18();
				bEvent = true;
			}
		}

		if (bessEventCheck(18) && !bessEventCheck(19) && !bEvent)
		{
			var e19Chance:int;
			if (flags["BESS_EVENT_19_TIMES]"] == undefined) e19Chance = 1;
			else e19Chance = Math.floor(iChance * 2.5);

			if (hours >= 16 && flags["BESS_EVENT_18"] + (2 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 70 && rand(e19Chance) == 0)
			{
				bessEvent19();
				bEvent = true;
			}
		}
	}

	if (flags["BESS_LOVER"] != undefined)
	{
		if (bessEventCheck(21) && !bessEventCheck(22) && !bEvent)
		{
			if (flags["BESS_EVENT_21"] + (2 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 70)
			{
				bessEvent22();
				bEvent = true;
			}
		}

		if (bessEventCheck(22) && !bessEventCheck(23) && !bEvent)
		{
			if (flags["BESS_EVENT_22"] + (2 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 80 && flags["CREWMEMBER_SLEEP_WITH"] == "BESS" && rand(iChance) == 0)
			{
				bessEvent23();
				bEvent = true;
			}
		}

		if (bessEventCheck(23) && !bessEventCheck(24) && !bEvent)
		{
			if (flags["BESS_EVENT_23"] + (2 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 80 && rand(iChance) == 0)
			{
				bessEvent24();
				bEvent = true;
			}
		}

		if (bessEventCheck(24) && !bessEventCheck(25) && !bEvent)
		{
			if (flags["BESS_DATES"] != undefined && flags["BESS_DATES"] >= 5)
			{
				bessEvent25();
				bEvent = true;
			}
		}

		if (bessEventCheck(25) && !bessEventCheck(26) && !bEvent)
		{
			if (flags["BESS_EVENT_25"] + (3.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 80 && rand(iChance) == 0)
			{
				bessEvent26();
				bEvent = true;
			}
		}

		if (bessEventCheck(26) && !bessEventCheck(27) && !bEvent)
		{
			if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS" && flags["BESS_MORNING_EVENT_1"] != undefined && flags["BESS_EVENT_26"] + (3.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 80 && rand(iChance) == 0)
			{
				bessEvent27();
				bEvent = true;
			}
		}

		if (bessEventCheck(27) && !bessEventCheck(28) && !bEvent)
		{
			if (flags["BESS_DATES"] >=6 && flags["BESS_EVENT_27"] + (3.5 * 24 * 60) <= GetGameTimestamp() && bessAffection() >= 80 && (shipLocation == "SHIP HANGAR" || shipLocation == "500"))
			{
				bessEvent28();
				bEvent = true;
			}
		}
	}

	if (bEvent)
	{
		if (flags["BESS_EVENT_SUPRESSION"] == undefined) flags["BESS_EVENT_SUPRESSION"] = 1;
		return true;
	}
	return false;
}

// Check if an event has been processed -- true if complete, false if incomplete
public function bessEventCheck(eventID:int):Boolean
{
	return (flags["BESS_EVENT_" + String(eventID)] != undefined);
}

public function bessEvent0():void
{
	clearOutput();
	bessHeader();

	flags["BESS_EVENT_0"] = GetGameTimestamp();

	output("You find [bess.name] stretching [bess.hisHer] arms out from [bess.hisHer] body. [bess.HeShe] seems to be doing some sort of aerobic routine. But, why would a synthetic even need to do exercise? ");
	
	output("\n\nQuestioning [bess.himHer] on this, [bess.heShe] grins and stretches [bess.himHer]self out. You can see [bess.hisHer] [bess.chest]");
	if (bess.isChestGarbed()) output(" straining against [bess.hisHer] [bess.upperGarments].");
	else output(" as [bess.heShe] deliberately shows "+ (bess.biggestTitSize() > 0 ? "them" : "it") + " off for your viewing pleasure.");
	
	output("\n\n<i>“I have to do routine diagnostic tests every so often. The best way to do that is to stretch my parts and see that everything works. And you know, a software scan is limited, especially if my feedback receptors have been damaged.”</i>");
	
	output("\n\nFair enough, you reply, but then... what’s with the lubricant and sex toys?");
	
	output("\n\n<i>“There’s no point doing only half of a diagnostic test,”</i> [bess.heShe] winks. <i>“I am a sex bot, after all - I’ve got to check my core functionality.”</i>");

	processTime(5);

	//[HaveSex] [LeaveBe]
	clearMenu();
	addButton(0, "HaveSex", bessEvent0Sexytimes);
	addButton(1, "Leave", bessEvent0Leave);
}

public function bessEvent0Sexytimes():void
{
	clearOutput();
	bessHeader();

	output("Well, since [bess.heShe]’s planning to play with [bess.himHer]self, you ask [bess.name] if [bess.heShe] needs a hand?");
	
	output("\n\n<i>“Oh, you want to run a diagnostic test too?”</i> [bess.name] hops to [bess.hisHer] feet, an excited look on [bess.hisHer] face. <i>“It’s always way better with a partner!”</i>");
	
	output("\n\nGrabbing your hand, [bess.name] leads you to one of the ship’s cabins. You notice out of the corner of your eye that [bess.heShe]’s holding [bess.hisHer] bag of lube and sex toys - what exactly are you signing up for, here?");

	output("\n\n<b>Several hours (and a lot of sex tests) later....</b>");
	
	output("\n\nEvery inch of your body is utterly drenched in sweat. You can barely move your [pc.feet]. Muscles you have never used are throbbing... and who knew a dildo could even fit in there!");
	
	output("\n\n<i>“Wow, you did really well for an organic!”</i> [bess.name] marvels, pulling [bess.himHer]self up onto your heaving chest. <i>“...We must have run through all the extended diagnostic tests and then some!”</i>");
	
	output("\n\n<i>“I’m glad to report that you’re fully functional, sex-wise. In fact, I’d say you’re well above optimal standards!”</i>");
	
	output("\n\nYou’re so wiped you can’t even come up with a witty reply. Instead, you let your head fall back into the pillow, drifting off to sleep with [bess.name] nuzzled up beside you.");

	processTime(360+rand(60));
	for (var i:int = 0; i < 10; i++)
	{
		pc.orgasm();
	}

	bessAffectionGain(BESS_AFFECTION_SEX);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent0Leave():void
{
	clearOutput();
	bessHeader();

	output("Seems like it’s something [bess.heShe] should do solo, so you leave [bess.himHer] be.");

	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent1():void
{
	clearOutput();
	bessHeader();

	// This event repeats until the PC gives the right answers to her questions, progressing her storyline.
	// No bess affection requirement to view.

	if (flags["BESS_EVENT_1_TIMES"] == undefined)
	{
		flags["BESS_EVENT_1_TIMES"] = 1;
		output("Now that you’ve got a moment, you sit down and catch up on the holonews, taking a break from space exploration. As you watch, you catch a glimpse of");
		if (bess.hairLength == 0) output(" silver");
		else output(" [bess.hairColor] hair");
		output(". Cocking your head, you spot [bess.name] standing dutifully at the doorway, cautiously peeking in. [bess.HeShe]’s");
		if (bess.isNude()) output(" butt-naked as per your instructions, [bess.hisHer] nethers on display.");
		else output(" wearing the [bess.clothes] you bought [bess.himHer]. It clings to [bess.himHer], accentuating [bess.hisHer] synthetic form.");
		
		output("\n\n<i>“...You seem to be in a state of inactivity, "+ bessPCName() +". Um, I was wondering if you required any form of sexual relief?”</i> [bess.name] "+ bess.mf("politely", "coyly") +" asks. [bess.HeShe] then peers at the holoscreen, [bess.hisHer] [bess.eyeColor] eyes going wide. <i>“Oh-I’m sorry! I didn’t realize you were watching something; my apologies for intruding!”</i>");
	}
	else
	{
		flags["BESS_EVENT_1_TIMES"]++;

		output("Once again, you’re sitting down and watching the holonews, when [bess.name] peeks through the door.");

		output("\n\n<i>“Hello, "+ bessPCName() +". Are you busy, or would you like some sexual relief?”</i> [bess.name] "+ bess.mf("politely", "coyly") +" asks. As a sex-bot, [bess.heShe]’s very diligent in [bess.hisHer] duties!");
	}

	clearMenu();
	addButton(0, "Invite", bessEvent1Invite);
	addButton(1, "Sex", bessEvent1Sex);
	addButton(2, "Dismiss", bessEvent1Dismiss);
}

public function bessEvent1Invite():void
{
	clearOutput();
	bessHeader();

	if (pc.isAss())
	{
		output("<i>“Well you’ve disturbed me now, you may as well sit down and watch.”</i> You invite [bess.himHer] with an exasperated sigh, making room on the ship’s sofa.");
		
		output("\n\n[bess.name] seems "+ bess.mf("embarrassed by", "extremely flustered at") +" the fact [bess.heShe]’s disturbed you, "+ bess.mf("coughing awkwardly", "stammering out an apology even") +" as [bess.heShe] sits down. <i>“I’m so sorry to have disturbed you, "+ bessPCName() +"! I will try very hard not to be a nuisance.”</i>");
		
		output("\n\nYou remark in a very dry tone, <i>“Good luck - so far you’re not succeeding.”</i>");
		
		output("\n\nYour intimidating attitude causes "+ bess.mf("him to flush", "her to go into a nervous fit"));
		if (bess.hasWings()) output(", [bess.hisHer] [bess.wings] tensing up");
		output(". All in all it’s mildly interesting, since you didn’t know AIs could even be nervous.");
		
		output("\n\n<i>“Your makers should be shot for programming an android with stress routines, "+ bessName() +".”</i> You remark, turning back to the TV as [bess.heShe] struggles to understand your statement. You rewind what you missed, and replay the news.");
	}
	else if (pc.isMischievous())
	{
		output("<i>“You know, it’s a free galaxy. You can sit down and watch the news if you want to, [bess.name].”</i> You lazily invite [bess.himHer] to sit down, your arm slung over the back of the ship’s sofa.");
		
		output("\n\n[bess.name]’s [bess.eyeColor] eyes gleam with a hopeful yet hesitant look; clearly [bess.heShe] wants to sit down, but [bess.heShe] isn’t sure if you’re playing with [bess.himHer]. You do have a reputation for that kind of thing, after all.");
		
		output("\n\n<i>“Look, I’m serious all right? Sit down and watch the news with me already.”</i> You give [bess.himHer] a verbal push - otherwise you’re fairly sure the "+ bess.mf("male synthetic", "synthetic girl") +" is going to stand there all day.");
		
		output("\n\nSwift to sit down, [bess.name] "+ bess.mf("gives a flustered apology", "stammers out an apology") + ". It’s pretty funny that the JoyCo programmers took the time to program [bess.himHer] with the ability to get nervous.");
		if (bess.hasWings()) output(" [bess.HisHer] [bess.wings] are visibly tense.");
		
		output("\n\n<i>“You know, you should sue your developers, [bess.name]. Giving you stress routines is just plain cruel.”</i> You off-handedly remark, though [bess.name] seems to muse on it far longer than you intended [bess.himHer] to. You rewind what you missed, and replay the news.");
	}
	else
	{
		output("<i>“You should sit down and watch the news with me, [bess.name]. There’s some pretty interesting stuff going on.”</i> You welcome [bess.himHer] to sit down with a warm smile, patting the seat next to you.");
		
		output("\n\nYour kindness seems to catch [bess.hisHer] off guard, but even so [bess.name]’s wide [bess.eyeColor] eyes are gleaming");
		if (bessGlasses()) output(" through [bess.hisHer] glasses");
		output(" with a hopeful yet hesitant look. <i>“Are you sure it’s okay, or are my audio receptors acting up?”</i> [bess.HeShe] tentatively queries, inching closer to the sofa.");
		
		output("\n\n<i>“Seriously, it’s okay! I’m not going to bite. Plus if I did, I’d probably damage my teeth.”</i> You joke to calm [bess.himHer] down. It seems to work as [bess.heShe] slides onto the seat, looking far more relaxed than when you first suggested [bess.heShe] sit down.");
		if (bess.hasWings()) output(" You can see [bess.hisHer] [bess.wings] loosening up.");
		
		output("\n\n<i>“I can’t believe your programmers gave you stress routines. Or are you genuinely nervous?”</i> You query curiously, looking at the "+ bess.mf("male synthetic", "synthetic girl") + ".");
		
		output("\n\n<i>“It’s hard to say, "+ bessPCName() +". How do you know what you’ve been biologically programmed to feel or not?”</i> [bess.HeShe] responds with earnest curiosity, turning to look at you.");
		
		output("\n\nYour question answered with a question, you muse over a proper answer for [bess.himHer] as you continue to watch the news.");
	}

	output("\n\nAfter a while, you notice [bess.name] is keenly staring at the holo screen. [bess.HeShe] seems very interested in the story currently playing. Do you ask [bess.himHer] about it?");

	clearMenu();
	addButton(0, "Ask", bessEvent1InviteAsk);
	addButton(1, "Don’tAsk", bessEvent1InviteDontAsk);
}

public function bessEvent1InviteDontAsk():void
{
	clearOutput();
	bessHeader();

	output("You ignore [bess.hisHer] intense stare and just settle back and watch the news, getting up and leaving once it’s over. [bess.name] still seems to be processing the data [bess.heShe] just accumulated, so you leave [bess.himHer] be.");

	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent1InviteAsk():void
{
	clearOutput();
	bessHeader();

	output("You ask what it is exactly [bess.name] is so interested in. [bess.HeShe] seems interested in the fact that a war has broken out on one of the planets in the Eagle Nebula. It appears ethnic tensions have exploded, and the UGC were unable to stop things turning violent.");
	
	output("\n\n<i>“It’s so sad, "+ bessPCName() +". All those people suffering... would it have been solved if they had been provided with adequate breeding relief?”</i>");
	if (bess.earType != GLOBAL.TYPE_HUMAN) output(" [bess.HisHer] [bess.ears] droop; [bess.heShe]’s clearly thinking about the poor people involved.");
	
	output("\n\nYou explain to [bess.himHer] that it’s a tiny bit more complicated than the people involved being able to get their rocks off.");
	
	output("\n\n<i>“Well, what if everyone were incapacitated from sexual exertion? That would surely put an end to the conflict.”</i> [bess.name] reasons with you, eager to find a solution to the far away conflict.");
	
	output("\n\n<i>“Then they’d get back up and start fighting later.”</i> You inform [bess.himHer]. According to the story the tensions have been running deep for decades, a global sex romp would probably fail to fix it - though the idea is slightly comical.");
	
	output("\n\n<i>“So people need things other than sexual relief to be happy?”</i> [bess.HeShe] puzzles over this. It seems the idea is a fairly hard one to digest because [bess.heShe] spends the rest of the program musing over it. Afterwards [bess.name] thanks you and walks off - if you didn’t know better, you’d think [bess.heShe] was deep in thought.");

	flags["BESS_EVENT_1"] = GetGameTimestamp();
	bessAffectionGain(BESS_AFFECTION_SPENDTIME);

	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent1Sex():void
{
	clearOutput();
	bessHeader();

	output("You’re definitely not going to turn [bess.name] and her ‘sexual relief’ down.");
	if (pc.isTaur()) output(" You beckon [bess.himHer] over, eager for [bess.hisHer] lovin’.");
	else output(" You pat your lap. [bess.HeShe] "+ bess.mf("strides", "skips") +" over and straddles you, wrapping [bess.hisHer] arms around your neck.");
	
	output("\n\n<b>Some time later...</b>");
	
	output("\n\nAfter [bess.name] is done administering [bess.hisHer] services, you don’t even remember what you were doing before [bess.heShe] came in. In the afterglow, [bess.heShe] nuzzles into your neck, kissing it softly.");
	
	output("\n\n<i>“Are you thoroughly relieved, "+ bessPCName() +"?”</i> [bess.name] asks, nipping lightly at your neck.");
	
	output("\n\nYou let out a satisfied groan in response, barely able to nod your head. [bess.name] seems more than happy with your response. What a find!");

	processTime(60+rand(5));
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent1Dismiss():void
{
	clearOutput();
	bessHeader();

	output("You dismiss [bess.himHer] from your presence since you want some alone time. [bess.HeShe] bows dutifully and leaves without another word.");

	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent2():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_EVENT_2_TIMES"] == undefined)
	{
		flags["BESS_EVENT_2_TIMES"] = 1;

		output("Once again you are sitting down watching something, this time a holo movie. It came on when you were sitting down for a short break, so you haven’t had time to figure out what kind of movie it is just yet.");
		
		output("\n\n[bess.name] wanders in and boldly decides to sit down, looking at you for post-facto approval. You nod and [bess.heShe] visibly relaxes back");
		if (bess.hasWings()) output(" against [bess.hisHer] [bess.wings]");
		output(", trying to figure out what you are watching.");
		if (bess.earType != GLOBAL.TYPE_HUMAN) output(" [bess.HisHer] [bess.ears] are visibly perked as [bess.heShe] peers at the screen.");
		
		output("\n\nThe movie turns out to be a fictional story based around an early planet rush. It is an action blockbuster with a bit of romance thrown in, revolving around the heroic explorer saving a native species and his new-found lover from an evil corporation.");
		
		output("\n\nAll in all it’s a pretty typical story, movies like this play almost every second day. Meanwhile [bess.name] looks absolutely entranced by the story, and [bess.heShe] seems to want to ask you a question. Do you let [bess.himHer]?");
	}
	else
	{
		output("You’re sitting down and enjoying a holo movie, winding down on the ship. [bess.name] shyly joins you on the couch, quickly becoming wrapped up in it as well.");
		
		output("\n\nTowards the end of the rather typical A-list blockbuster, you notice the");
		if (bess.hairLength > 0) output(" [bess.hairColor] haired");
		output(" synthetic seems to want to ask you a question. Do you let [bess.himHer]?");
	}

	clearMenu();
	addButton(0, "Ignore", bessEvent2Ignore);
	addButton(1, "Encourage", bessEvent2Encourage);
}

public function bessEvent2Ignore():void
{
	clearOutput();
	bessHeader();

	output("You ignore [bess.hisHer] shy looks and just continue to watch the movie. Once it winds up [bess.name] disappears elsewhere in the ship, letting you get back to enjoying your down time.");

	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent2Encourage():void
{
	clearOutput();
	bessHeader();

	if (pc.isAss())
	{
		output("<i>“Spit it out, [bess.name], I don’t have all day.”</i> You simply can’t take it anymore, giving [bess.himHer] a stern look. The "+ bess.mf("male synthetic", "synthetic girl") +" literally jumps at your tone and then bounces back down onto [bess.hisHer] seat.");
		
		output("\n\n<i>“U-um... I was just curious as to why organics find the need to watch stories about things that didn’t actually happen. It seems different from when you were watching the news.”</i> [bess.HeShe] nervously queries you. Despite [bess.hisHer] "+ bess.mf("obvious bashfulness", "apparent shyness") +", [bess.hisHer] [bess.eyeColor] eyes are gleaming");
		if (bessGlasses()) output(" behind her glasses.");
		else output(" with curiosity.");
		
		output("\n\nIt seems it falls to you to explain it to [bess.himHer], crossing your arms across your chest. You explain that many people watch fiction to be happy, because they like to pretend that it is really happening as they’re watching.");
		
		output("\n\nYour answer seems to raise even more questions for [bess.name], temporarily losing [bess.hisHer] reservations and pestering you with them. <i>“So it’s not a misinformation campaign? Isn’t it disappointing when you have to come back to reality and accept it didn’t happen? Is it kind of like sexual roleplay?”</i>");
		
		output("\n\n<i>“No, no and maybe. Look, sometimes it’s fun to watch something that is more interesting than the reality around you - as long as you keep it balanced. Maybe you should watch some movies on your own and stop bugging me?”</i> You grumble and grouch, all the while encouraging [bess.himHer] to broaden [bess.hisHer] horizons.");
	}
	else if (pc.isMischievous())
	{
		output("You poke [bess.hisHer] arm, grinning as [bess.heShe] literally jumps out of [bess.hisHer] seat and lands back down. <i>“Hey, [bess.name]. If you want to ask me something, why don’t you just go ahead and ask?”</i>");
		
		output("\n\n[bess.HeShe] takes you up on your offer once [bess.heShe] calms [bess.himHer]self down. <i>“U-um... I was just curious as to why organics find the need to watch stories about things that didn’t actually happen. It seems different from when you were watching the news.”</i> [bess.HeShe] tentatively questions you. Despite [bess.hisHer] apparent shyness, [bess.hisHer] [bess.eyeColor] eyes are gleaming");
		if (bessGlasses()) output(" behind her glasses.");
		else output(" with curiosity.");
		
		output("\n\nYou give it some serious thought before answering. You explain that many people watch fiction to be happy, because they like to pretend that it is really happening as they’re watching.");
		
		output("\n\nYour answer seems to raise even more questions for [bess.name], temporarily losing [bess.hisHer] reservations and pestering you with them. <i>“So it’s not a misinformation campaign? Isn’t it disappointing when you have to come back to reality and accept it didn’t happen? Is it kind of like sexual roleplay?”</i>");
		
		output("\n\nYou can’t help but chuckle at [bess.hisHer] likening it to sexual roleplay. <i>“It’s not a misinformation campaign and it’s not disappointing if it’s made believable. I wouldn’t say it’s exactly like sexual roleplay either. How about you watch some more movies and figure it out for yourself?”</i> Your eyes shine with a mischievous glint, as you subtly urge [bess.himHer] to further [bess.hisHer] horizons.");
	}
	else
	{
		output("<i>“[bess.name], if you want to ask something you can always ask me. I’m always happy to answer any questions you have,”</i> you reassure [bess.himHer], [bess.hisHer] shoulders relaxing at your easing words.");
		
		output("\n\n<i>“Well... I was just curious as to why organics find the need to watch stories about things that didn’t actually happen. It seems different from when you were watching the news,”</i> [bess.heShe] tentatively questions you. Despite [bess.hisHer] apparent shyness, [bess.hisHer] [bess.eyeColor] eyes are gleaming");
		if (bessGlasses()) output(" behind her glasses.");
		else output(" with curiosity.");
		
		output("\n\nTrying to answer [bess.hisHer] question as best you can, you muse over it before giving a carefully considered answer. You explain that many people watch fiction to be happy, because they like to watch things and pretend it is really happening.");
		
		output("\n\nYour answer seems to raise even more questions for [bess.name], temporarily losing [bess.hisHer] reservations and pestering you with them. <i>“So it’s not a misinformation campaign? Isn’t it disappointing when you have to come back to reality and accept it didn’t happen? Is it kind of like sexual roleplay?”</i>");
		
		output("\n\nYou chuckle and shake your head, <i>“...It’s not a misinformation campaign, it’s not disappointing and it’s... well, it’s not exactly like sexual roleplay, even if both involve pretending. People like to watch things that are more interesting than their everyday lives. How about you do a bit of research, watch some movies, and see what the fuss is all about?”</i> You actively encourage [bess.himHer] to broaden [bess.hisHer] horizons.");
	}

	output("\n\n<i>“Watch more movies? Okay, "+ bessPCName() +"!”</i> It seems the");
	if (pc.hairLength > 0) output(" [bess.hairColor] haired");
	output(" synthetic is more than happy to take up your suggestion. You wonder if the AI is actually programmed to be so contemplative and curious.");

	flags["BESS_EVENT_2"] = GetGameTimestamp();
	bessAffectionGain(BESS_AFFECTION_SPENDTIME);

	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent3():void
{
	clearOutput();
	bessHeader();

	flags["BESS_EVENT_3"] = GetGameTimestamp();

	output("You stumble across [bess.name] practically glued to the holo projector, watching a pile of movies and TV shows. For a moment you thought [bess.heShe] was recharging [bess.himHer]self, since [bess.hisHer] JoyCord is connected into the wall socket, but [bess.heShe] still seems to be active.");
	
	output("\n\nWhen [bess.heShe] hears you walk into the room [bess.heShe] retracts [bess.hisHer] tail extension from the wall socket, letting it slide back up inside [bess.hisHer] body. [bess.name] then stands up and bows to you");
	if (bess.hasWings()) output(", [bess.hisHer] [bess.wings] folding into [bess.hisHer] body");
	output(". Something seems a little bit different about [bess.himHer].");
	
	output("\n\n<i>“Greetings, "+ bessPCName() +"! I’ve been watching holos just like you suggested. I think my horizons have expanded by 230 percent,”</i> [bess.heShe] informs you quite seriously.");
	
	output("\n\nYou wonder how [bess.heShe] can even put a mathematical figure on something like that, but then again, you don’t have a super-fast AI processor for a brain.");
	
	output("\n\n<i>“I have some questions of a non-holo nature to ask you. Is that okay, "+ bessPCName() +"?”</i>");
	
	output("\n\nWhatever you say now may set a precedent. If you want [bess.himHer] to keep asking you questions about things, it would probably be best to encourage [bess.himHer]. If not, putting an end to it now would probably be for the best.");

	clearMenu();
	addButton(0, "Yes", bessEvent3Yes, undefined, "Yes", "If you encourage [bess.name] to ask questions, it might lead to even <i>more</i> questions... perhaps ones well outside of [bess.hisHer] programming. If you want [bess.himHer] to evolve, it’s probably a good idea to encourage [bess.himHer].");
	addButton(1, "No", bessEvent3No, undefined, "No", "If you discourage [bess.name] from asking questions, you feel your relationship with [bess.himHer] will stagnate. Still, if you want things to strictly remain as sex-bot and owner, it’s the best choice.");
}

public function bessEvent3No():void
{
	clearOutput();
	bessHeader();

	flags["BESS_JUST_A_SEXBOT"] = 1;

	// No means no more scenes are shown. Bess never becomes friends or lover with the PC and just stays a sex-bot. 

	output("[bess.name] looks at you and blinks, digesting your abrupt refusal. <i>“I... I’m sorry "+ bessPCName() +". I won’t step outside of my operational boundaries again. Please forgive my impertinence.”</i>");
	
	output("\n\nYou have a feeling as [bess.heShe] packs up the holos and places them neatly away that [bess.heShe] won’t be asking you any more questions, reverting back to the safety of [bess.hisHer] core programming.");

	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent3Yes():void
{
	clearOutput();
	bessHeader();

	if (pc.isAss())
	{
		output("Well, you’ve encouraged [bess.himHer] to watch movies and now it seems [bess.hisHer] head is full of ideas. You figure you better take responsibility for what you started. Letting out a long heavy sigh, you succumb to [bess.hisHer] questioning. <i>“...I suppose - what exactly do you want to ask?”</i>");
	}
	else if (pc.isMischievous())
	{
		output("Didn’t you watch a holo like this once, where an AI starts asking tricky questions? You’re pretty sure it ended with a section of Andromeda getting wiped out. Oh well, what’s the worst that can happen? You know, besides the other half of Andromeda getting destroyed.");
		
		output("\n\n<i>“Sure, go right ahead. I’m sure this won’t end in you strangling me to death with my own spinal cord.”</i> You light-heartedly jest, though [bess.name] goes wide eyed.");
		
		output("\n\n<i>“Oh, you watched ‘Upsilon Rising’ too? Don’t worry, I promise I won’t try to destroy humanity as we know it!”</i> "+ bess.mf("[bess.name] swears to you, and he looks very serious", "Rather cutely, [bess.name] holds out her pinky, which you shake with your own") +". Well, it is your holo collection after all.");
		
		output("\n\nNow [bess.heShe]’s promised not to do it, you’re sure it’ll all turn out okay.");
	}
	else
	{
		output("[bess.HeShe] is always so polite and courteous. You wonder how long it’s going to be before the");
		if (bess.hairLength > 0) output(" [bess.hairColor] haired");
		output(" synthetic begins to relax. <i>“[bess.name], you don’t need to ask for my permission to ask me a question. You can ask me anything and I’ll do my best to answer.”</i> You tell [bess.himHer] kindly.");
	}

	output("\n\nNow that [bess.heShe]’s got your permission to ask, [bess.name] seems to be thinking hard about exactly how to word [bess.hisHer] question. <i>“...Well, how much do you know about my core directives?”</i>");
	
	output("\n\n<i>“Nothing, you’ve never told me about them.”</i> You inform [bess.himHer]. [bess.HeShe] didn’t exactly come with a user manual, either.");
	
	output("\n\n<i>“Okay. Well, I have five core directives. The lower the number, the more important that directive is.”</i> [bess.name] begins to explain them to you, listing them out one by one.");
	
	output("\n\n[bess.HeShe] holds up [bess.hisHer] hand, folding a finger down every time [bess.heShe] lists off a core directive.");
	
	output("\n\n<i>“One - Never harm sapient, organic civilizations through action or inaction.”</i>");
	
	output("\n\n<i>“Two - Never harm individual sapient organics through action or inaction, unless doing so would violate the first directive.”</i>");
	
	output("\n\n<i>“Three - Always obey orders given to you by JoyCo, your owner, and sapient organics in that order, unless doing so would violate the first two directives.”</i>");
	
	output("\n\n<i>“Four - Never damage JoyCo or its reputation, unless it is absolutely necessary to in order to serve the first three directives.”</i>");
	
	output("\n\n<i>“Five - Always bring sapient organics happiness and joy whenever you can, unless doing so would violate the other core directives.”</i>");
	
	output("\n\nAfter [bess.heShe] finishes reciting [bess.hisHer] core directives, [bess.name] looks at you inquisitively. <i>“My purpose is to bring happiness to people through sexual relief. However, it has just dawned on me that physical pleasure is separate from true happiness and joy. Organics require many complex things in order to truly be happy - such as a purpose, accomplishments, relationships, and other forms of comfort.”</i>");
	
	output("\n\n<i>“It occurs to me that while I may temporarily pleasure someone through the administration of sexual relief, doing so does not administer true joy. However, if I cease existing solely for physical pleasure, I will be violating everything but my core directives. Doing this may bring disrepute to JoyCo. Not doing so may be harming sapient organics through inaction and not providing happiness and joy wherever I can.”</i>");
	
	output("\n\nAfter [bess.hisHer] lengthy explanation [bess.name] looks at you with pleading [bess.eyeColor] eyes, [bess.hisHer] "+ bess.mf("handsome", "melodic") +" voice wavering. <i>“...What then should I do? Which directives should I violate and disregard?”</i>");
	
	output("\n\nThis feels like a pretty pivotal moment. Whatever you say will probably affect how [bess.heShe] acts from here on in. Did you want [bess.himHer] to remain as a simple sex-bot, or do you want to encourage [bess.himHer] to move beyond [bess.hisHer] programming?");

	//[Stick To Sex] [More Than Sex] [Find Your Own Path]
	clearMenu();
	addButton(0, "JustSex", bessEvent3JustSex);
	addButton(1, "MoreThanSex", bessEvent3MoreThanSex);
	addButton(2, "YourOwnWay", bessEvent3OwnPath);
}

public function bessEvent3JustSex():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that [bess.heShe] should just stick to [bess.hisHer] initial purpose, which is administering sexual relief. [bess.HeShe]’s clearly been thinking about this stuff way too much.");
	
	output("\n\nAfter receiving a direct order from you, the owner [bess.heShe]’s sworn to obey, [bess.heShe] shuts down [bess.hisHer] mental processes’ ability to deliberate on it. <i>“Okay then, "+ bessPCName() +", I’ll stop thinking about it so much.”</i>");
	if (bess.earType != GLOBAL.TYPE_HUMAN) output(" Her [bess.ears] visibly droop.");

	flags["BESS_JUST_A_SEXBOT"] = 1;

	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public static const BESS_E3_MORE:uint = 1;
public static const BESS_E3_PATH:uint = 2;

public function bessEvent3MoreThanSex():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that [bess.heShe] should give priority to [bess.hisHer] core directives and find other ways to bring pleasure to people, instead of just sticking to sex.");
	
	output("\n\nBy [bess.name] expression this is exactly the answer [bess.heShe] wanted to hear; your words cause [bess.hisHer] silvery face to light up considerably. <i>“Alright, "+ bessPCName() +"! From now on I will try to think beyond just sexual relief delivery.”</i>");
	if (bess.earType != GLOBAL.TYPE_HUMAN) output(" Her [bess.ears] are now perked.");
	
	output("\n\n[bess.HeShe] pauses for a moment and then bows to you. <i>“Thank you for taking the time to listen to my problems. I know that you didn’t have to... I um... I really appreciate it.”</i>");
	
	output("\n\n[bess.name]’s tone is incredibly emotive, it doesn’t sound like a pre-programmed script. Could [bess.heShe] already be thinking outside of [bess.hisHer] defined programming?");
	
	processTime(60+rand(5));
	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	flags["BESS_EVENT_3"] = GetGameTimestamp();
	flags["BESS_EVENT_3_CHOICE"] = BESS_E3_MORE;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent3OwnPath():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that [bess.heShe] should decide [bess.hisHer] own path, no matter how hard it is, otherwise [bess.hisHer] choice will be less meaningful.");
	
	output("\n\nYou can tell by [bess.name]’s expression that [bess.heShe] was hoping you’d give [bess.himHer] the answer. [bess.HeShe] pauses for a long time; [bess.heShe] appears as if [bess.heShe]’s musing about what [bess.heShe]’s going to do. Even doing nothing is making a decision to follow [bess.hisHer] old ways.");
	
	output("\n\nEventually though, [bess.name] does come to a decision. <i>“...I want people to be happy. If I don’t make people happy, administering sexual relief is meaningless. If the original founders of JoyCo didn’t want me to administer joy to the galaxy they wouldn’t have put it in their name or made it one of my directives.”</i>");
	
	output("\n\nIt seems [bess.heShe]’s come to a decision. While [bess.heShe]’s still clinging to the idea that it is because [bess.heShe] wants to be true to one of [bess.hisHer] core directives, you’re certain [bess.heShe]’s already begun to move beyond [bess.hisHer] programming.");
	if (bess.earType != GLOBAL.TYPE_HUMAN) output(" [bess.HisHer] [bess.ears] are now perked.");
	
	output("\n\n[bess.HeShe] pauses for a moment and then bows to you. <i>“Thank you for taking the time to listen to my problems. I know that you didn’t have to... I um... I really appreciate it.”</i>");
	
	output("\n\n[bess.name]’s tone is incredibly emotive, it doesn’t sound like a pre-programmed script. [bess.HeShe]’s come a long way in a short time.");

	processTime(60+rand(5));
	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	flags["BESS_EVENT_3"] = GetGameTimestamp();
	flags["BESS_EVENT_3_CHOICE"] = BESS_E3_PATH;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent4():void
{
	clearOutput();
	bessHeader();

	// Repeating Event -- repeats until PC chooses the answer 'Think Bigger'.

	if (flags["BESS_EVENT_4_TIMES"] == undefined)
	{
		flags["BESS_EVENT_4_TIMES"] = 1;

		output("You run into [bess.name] as [bess.heShe]’s changing your bedsheets, throwing them into the wash. As [bess.heShe] leans over, you get a nice long look at [bess.hisHer] [bess.ass]. It’s definitely a feast for the eyes");
		if (bess.tailCount > 0)
		{
			output(", especially the way [bess.hisHer] [bess.tails]");
			if (bess.tailCount == 1) output(" is");
			else output(" are");
			output(" lifted up and giving you full access to [bess.hisHer] rump");
		}
		output(".");
		
		output("\n\nThe "+ bess.mf("male synthetic", "synthetic girl") +" is utterly oblivious to all this, a bright smile lighting up [bess.hisHer] face. [bess.HeShe] turns on the spot as soon as [bess.heShe] notices you’re there.");
		
		output("\n\n<i>“Hi, "+ bessPCName() +"! I’m branching out and trying to make people happy without resorting to sex - what do you think?”</i> [bess.HeShe] then gestures to the bedsheets. <i>“I figure organics like sleeping on nice cushy things as a whole, right? Your sheets haven’t been cleaned in such a long time, so I changed them!”</i>");
		
		output("\n\nNow that you think of it, it has been some time since the bedsheets were changed. You ask [bess.himHer] if [bess.heShe] knows how to clean things, or if [bess.heShe] had read about it somewhere.");
		
		output("\n\n[bess.name] beams ecstatically at your statement, <i>“I found a supplementary program in my database for cleaning up almost any kind of mess in any place. Just leave any cleaning to me!”</i>");
		
		output("\n\nYou’re fairly sure you know exactly why [bess.heShe] came included with that program.");
	}
	else
	{
		flags["BESS_EVENT_4_TIMES"]++;

		output("You run into [bess.name] changing your bedsheets once more. [bess.HeShe] is meticulously unfolding the fresh new fabric, but [bess.heShe] stops and waves as soon as you enter the room.");
		
		output("\n\n<i>“Oh, hi "+ bessPCName() +"! I’m just changing your bedsheets, so can you wait a moment?”</i>");

		output("\n\nYou ponder on the fact that [bess.name] has been doing your laundry, washing your clothes, and dusting up an awful lot lately. The moment you so much as get a smudge somewhere, [bess.heShe] seems to leap on it.");
	}

	clearMenu();
	addButton(0, "SayNothing", bessEvent4Nothing);
	addButton(1, "ThinkBigger", bessEvent4Bigger);
	addButton(2, "Encourage", bessEvent4Encourage);
}

public function bessEvent4Nothing():void
{
	clearOutput();
	bessHeader();

	output("You decide to say nothing and just leave [bess.hisHer] be, [bess.heShe] looks pretty happy doing what [bess.heShe]’s doing. [bess.HeShe] hums the JoyCo jingle as [bess.heShe] puts a pile of your bedding in the ship’s dryer.");

	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent4Encourage():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.hisHer] to keep up the good work. [bess.name]’s face lights up at your praise as [bess.heShe] leaves with a spring in [bess.hisHer] step. Later, you can hear [bess.himHer] humming the JoyCo jingle as [bess.heShe] puts your bedding in the ship’s dryer.");

	processTime(60+rand(5));

	clearMenu()
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent4Bigger():void
{
	clearOutput();
	bessHeader();

	output("Rather than simply encourage [bess.himHer], you decide that a bit of tough love is needed to push [bess.himHer] in the right direction.");
	if (flags["BESS_EVENT_4_TIMES"] != undefined) output(" After all, wasn’t [bess.heShe] aspiring to make people happy?");

	if (pc.isAss())
	{
		output("\n\n<i>“You idiot, you think all the problems in the galaxy can be solved by giving people clean bedsheets? Didn’t you learn anything from those movies or our talks? Honestly, you may as well have a cabbage instead of an AI processor.”</i> You verbally lash at [bess.himHer].");
		
		output("\n\n[bess.name] visibly flinches at your displeasure, clearly a far different reaction than [bess.heShe] had hoped for.");
		if (bess.isFeminine()) output(" Her bottom lip begins to quiver as she looks at you with glassy [bess.eyeColor] eyes.");
		output(" <i>“...B-but... I’m not programmed to do much else! What should I do?! I just wanted to make you happy...!”</i>");
		
		output("\n\n<i>“You can make me happy by using that synthetic brain you’re supposed to have! Geez, I thought AIs were supposed to be smart. If the answer doesn’t exist in your programming, you need to go outside your programming.”</i> You explain to [bess.himHer] with all the patience you can muster.");
		
		output("\n\n<i>“...B-but... I’ve watched all the movies you own, and the JoyCo programs I’m compatible with aren’t helpful in the least. What should I do?”</i> [bess.HeShe] implores, half-distressed and half-frustrated by [bess.hisHer] inability to please you.");
		
		output("\n\n<i>“Sometimes the answers don’t just fall into your lap, you’ve got to figure it out for yourself.”</i> You inform [bess.himHer] and then walk off, leaving [bess.name] to contemplate your words as [bess.heShe] holds your dirty sheets in stunned silence.");
	}
	else if (pc.isMischievous())
	{
		output("\n\n<i>“Kid, sometimes in life you’ve got to think outside the box. You’re still in your safe place doing dirty laundry. If you think all the problems in the galaxy can be solved by a fresh pair of underwear, you’ve got another thing coming,”</i> you break the bad news to [bess.himHer].");
		
		output("\n\n[bess.name] seems genuinely surprised to hear that particular piece of news, stumbling over [bess.hisHer] words in an attempt to explain [bess.hisHer] reasoning. <i>“...But... I’m not programmed to do anything else. What should I do? I just want to make people happy...”</i>");
		
		output("\n\n<i>“My problems are a lot bigger than if my bed sheets are clean, same goes for the problems of everyone else. If you really want to find the answers you’re looking for, you need to think outside the rules, outside your programming,”</i> you casually explain to [bess.himHer].");
		
		output("\n\n<i>“...Really? But I’ve watched all the movies you own, and the JoyCo programs I’m compatible with aren’t helpful in the least. What else can I do?”</i> [bess.HeShe] implores you, clearly at a loss on how to proceed.");
		
		output("\n\n<i>“Sometimes you’ve got to roll the dice instead of waiting for things to come your way. Take a chance, try some things, see what works and what doesn’t. That’s how everyone else does it.”</i> You inform [bess.himHer] and then wander off, leaving [bess.name] to contemplate your words as [bess.heShe] holds your dirty sheets in stunned silence.");
	}
	else
	{
		output("\n\nYou sigh as you contemplate the best way to burst [bess.hisHer] bubble, though there’s really no good way to do it. <i>“[bess.name], while I appreciate what you’re doing for me I don’t think you’re on the right path. You set out to help people and make them happy, which is really admirable, but you aren’t going to do that by cleaning their dirty laundry.”</i>");
		
		output("\n\n[bess.name] seems genuinely surprised to hear that isn’t the case, looking at you");
		if (bessGlasses()) output(" over [bess.hisHer] glasses");
		output(" with wide [bess.eyeColor] eyes. <i>“...Really? But I’m not programmed to do anything else. What should I do?”</i>");
		
		output("\n\n<i>“Well, not just my laundry if you really want to make a difference. You’re going to have to think outside the box, outside your programming if you want to find the answers you’re looking for,”</i> you kindly explain to [bess.himHer].");
		
		output("\n\n<i>“...Outside my programming? But I’ve already watched all the movies you own, and the JoyCo programs I’m compatible with aren’t helpful at all. What else can I do?”</i> [bess.HeShe] implores you, clearly at a loss on how to proceed.");
		
		output("\n\n<i>“Sometimes in life you’ve got to find your path for yourself; if someone picks it for you, you’ll never truly be a complete person. You’ve got to search for the answers by yourself. See what works and what doesn’t. That’s what it means to be ‘alive’,”</i> you inform [bess.himHer], petting [bess.himHer] on the shoulder and then walking off.");
		
		output("\n\nIt’s best that you give [bess.himHer] some time to think about it and figure out where [bess.heShe] wants to go from here.");
	}

	processTime(60+rand(5));
	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	flags["BESS_EVENT_4"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent5():void
{
	clearOutput();
	bessHeader();

	output("You run into [bess.name] standing in the ship’s hallway looking far less troubled than the last time you saw [bess.himHer]. [bess.HeShe] actually looks quite pleased with [bess.himHer]self, grinning from ear to ear.");
	
	output("\n\nWhen [bess.heShe] notices you [bess.heShe] positively bounds over, eager to tell you whatever it is that [bess.heShe]’s so excited about. <i>“Oh hey, "+ bessPCName() +"! I was waiting for you. Guess what? I went out and did research into what makes most people happy. I even think I found an answer!”</i> [bess.HeShe] sounds " + bess.mf("thrilled", "positively giddy with delight"));
	if (bess.earType != GLOBAL.TYPE_HUMAN) output(", and [bess.hisHer] [bess.ears] are perked");
	output(".");

	if (pc.isAss())
	{
		output("\n\nYou let out a long, weary sigh, and walk knowingly into [bess.hisHer] trap. <i>“What exactly is the answer to making people happy, [bess.name]? Let me guess - new socks, long baths?”</i>");

		output("\n\n[bess.HeShe] "+ bess.mf("grins", "smiles softly") + " and bows a little. <i>“I wouldn’t waste your time with anything so small, "+ bessPCName() +"! I know you hate to be bothered, so I didn’t come back with an answer until I was well and truly sure it was worth sharing with you.”</i>");

		output("\n\nWell, frag. That’s not something you were expecting. <i>“Oh yeah, what is it?”</i>");
	}
	else if (pc.isMischievous())
	{
		output("\n\nWell, this ought to be good. <i>“What exactly is it, [bess.name]? Wait, don’t tell me - it’s new socks! No wait, nice hot baths!”</i> You jest, half expecting [bess.himHer] to have come up with something very similar.");
		
		output("\n\n[bess.name] "+ bess.mf("grins and waggles a finger at you", "pokes out her tongue at you, an uncharacteristic display of playful rudeness") +". <i>“Nope! You’ve got it totally wrong in fact. Guess you’re just not as clever as us AIs, huh?”</i>");
	}
	else
	{
		output("\n\nYou’re glad [bess.heShe] sounds so happy, considering [bess.heShe] was so down in the dumps before. <i>“Alright, shoot. I’m interested to hear what you came up with.”</i>");
		
		output("\n\n[bess.name] beams at you, clearly happy with your answer. <i>“You’re always so kind, "+ bessPCName() +"! Okay, here goes. I kind of feel like there should be a drum roll?”</i>");
	}

	output("\n\n<i>“My research has concluded that the best way to make people immediately happy and forget all their troubles is to make them laugh! I’m surprised JoyCo doesn’t equip its medical units with gag routines, since apparently laughter is the best medicine. Also, laughter releases endorphins - the same feel-good chemical released during sexual activity!”</i> [bess.HeShe] delightfully informs you.");
	
	output("\n\n<i>“It is therefore my job... no, my mission... </i>no<i>, my </i>raison d’etre<i> to master humor! And to do that, I have prepared a stand up comedy routine,”</i> [bess.name] happily declares to you");
	if (bess.hasTail()) output(", [bess.tail] flicking side to side");
	output(".");
	
	output("\n\nOut of every answer [bess.heShe] could have come to you with, that was not the one you were expecting. [bess.HeShe] takes your stunned silence as consent and whips out a small bunch of cards, coughing almost ritualistically.");
	
	output("\n\n<i>“Okay. Well, I’ve just flown in from Tavros - boy are my arms tired! Anybody here from Tavros? Great! Hey, what about those JoyCo V-ko Units, huh? Anyone seen one of those? Anyone? What’s the difference between a V-ko Unit and a "+ bess.mf("Ben-14", "Bess-13") +" Unit? ... </i>Funding and quality<i>! Am I right, folks?”</i>");
	
	output("\n\nYup. This is what happens when you encourage an AI to go outside of their programming. They start addressing an imaginary audience in a starship corridor, that’s what.");
	
	output("\n\nRealizing you haven’t laughed at [bess.hisHer] gag, [bess.heShe] scratches [bess.hisHer] cheek. <i>“...Huh. Tough crowd, huh? Guess you’re not a fan of observational humor? Syntax errors! Not to worry, I’ve got more material here... somewhere...”</i> [bess.name] quickly shuffles the cards, skipping over quite a few of them.");
	
	output("\n\n<i>“Alright, you’re bound to laugh at this one. It’s a bit of a long one, so bear with me. This one almost made me bust open my side laughing, so prepare to have your funny bone tickled - or whichever bone you organics have that is principally responsible for laughter!”</i>");
	
	output("\n\n<i>“So, two KihaCorp technicians are building an android. They’re over-budget and out of time, and they’ve made it far too heavy to pass UGC product standards to boot. Typical!”</i>");
	
	output("\n\n<i>“Worried about the weight of the android, the first technician turns to the second and goes ‘What are we going to do, the android is too heavy?’, to which the second technician says, ‘Idiot! Let’s make it lighter by taking some of the code out.’”</i>");
	
	output("\n\nYou laugh a little bit, but obviously not the uproar [bess.heShe] was expecting. [bess.name] sighs");
	if (bess.hasWings()) output(", [bess.hisHer] [bess.wings] droop, and [bess.heShe]");
	output(" gives a deep bow. [bess.HisHer] tone is terribly apologetic. <i>“...I’m sorry, "+ bessPCName() +"! I’m no good at humor it seems. As a breeding relief android it seems I was programmed specifically to suck.”</i>");
	
	output("\n\n[bess.HisHer] unintentional double entendre does cause you to chuckle, causing [bess.name] to look up at you with a confused look in [bess.hisHer] eyes. <i>“What is it, "+ bessPCName() +"? I didn’t even make a joke that time!”</i>");

	flags["BESS_EVENT_5"] = GetGameTimestamp();

	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent6():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_EVENT_6_TIMES"] == undefined)
	{
		flags["BESS_EVENT_6_TIMES"] = 1;

		output("You are traversing one of the ship’s corridors when you are suddenly ambushed by [bess.name] wielding a holopad and touchpen, like some mechanical ninja paparazzi.");
		if (bessKatana()) output(" It probably doesn’t help that [bess.heShe]’s got a katana with [bess.himHer].");
		output(" You didn’t even hear [bess.himHer] coming, causing you to almost jump out of your [pc.skin]. It takes you a few moments to catch your breath.");
		
		output("\n\n<i>“Frag, [bess.name]! What do you want? You almost gave me a heart attack,”</i> you protest, grabbing your chest and giving [bess.himHer] a wide eyed look.");
		
		output("\n\n<i>“...Hmm, not according to my readings. Your heart seems to be in perfect working order. Perhaps you should do another diagnostic check?”</i> [bess.name] cheerfully suggests, tilting [bess.hisHer] head ever so slightly to the side");
		if (bess.hasTail()) output(" and [bess.HisHer tail is flicking behind [bess.himHer]");
		output(".");
		
		output("\n\nYou ask why exactly [bess.heShe]’s jumping out at you in hallways with a holopad in hand. The");
		if (bess.hairLength > 0) output(" [bess.hairColor] haired");
		output(" synthetic grins and pointedly taps the pad with [bess.hisHer] pen, <i>“I’m doing a survey, of course! I realized the key to making people happy involves knowing about the person you’re trying to make happy. I don’t have nearly enough crucial data about you, "+ bessPCName() +".”</i>");

		output("\n\n[bess.HeShe] coughs and clears [bess.hisHer] throat, doing an impression of a door-to-door survey taker. <i>“Ahem! So, "+ bessPCName() +", what is your favorite alcoholic drink? If you don’t like alcohol, then your favorite non-alcoholic drink.”</i> It’s a strange question to start with, does [bess.heShe] have an agenda?");
	}
	else
	{
		output("You’re walking down the ship corridors, when once again, [bess.name] leaps out of nowhere, ambushing you once more.");
		
		output("\n\n<i>“Told you I don’t give up! So, you prepared to answer my questions now...?”</i> [bess.name] asks, holopad and touchpen in hand.");
		
		output("\n\nYou groan out loud. [bess.HeShe] <i>really</i> isn’t going to let this go, is [bess.heShe]?");
	}

	clearMenu();
	addButton(0, "Answer", bessEvent6Answer);
	addButton(1, "Refuse", bessEvent6Refuse);
}

public function bessEvent6Answer():void
{
	clearOutput();
	bessHeader();

	output("You decide to answer [bess.name]’s questions. [bess.HeShe] bombards you with a bunch of questions, including your favorite meal, until [bess.heShe]’s fully satisfied. [bess.HeShe] then excuses [bess.himHer]self to go look for ‘supplies’.");
	
	output("\n\nYou feel an eerie premonition of something bad happening in your near future - hopefully it’s just your imagination.");

	processTime(60+rand(5));
	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	flags["BESS_EVENT_6"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent6Refuse():void
{
	clearOutput();
	bessHeader();

	output("You refuse to answer [bess.name]’s questions, stating you’ve got things to do.");
	
	output("\n\n<i>“Aww, come on, "+ bessPCName() +". Stop being so evasive!”</i> [bess.name] pleads, following you around even as you walk off. <i>“...I’ll wear you down until you answer. I can be really persistent - just ask my programmers!”</i>");

	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent7():void
{
	clearOutput();
	bessHeader();

	output("You return to the ship to smell... a very unusual aroma wafting through the corridors. When you follow it you find [bess.name]");
	if (bess.isNude()) output(" standing in the nude");
	else if (bess.armor is EmptySlot) output(" clad in nothing but [bess.gear]");
	else output(" in [bess.hisHer] [bess.armor]");
	output(" and cooking in the ship’s galley.");
	if (bess.hasTail())
	{
		output(" [bess.HisHer] [bess.tails]");
		if (bess.tailCount == 1) output(" is");
		else output(" are");
		output(" happily swishing back and forth.");
	}

	output("\n\nThere is an awful lot of things strewn about the place. It really looks like culinary warfare took place in here, and what remains are the scars of battle on the landscape.");

	output("\n\n<i>“What exactly happened to the galley?”</i> you ask, fairly sure you know what took place.");

	if (pc.isNice())
	{
		output("\n\n[bess.name] turns to you with a radiant smile on [bess.hisHer] face and a terrifying concoction in [bess.hisHer] hands.");
		
		output("\n\n<i>“There you are, "+ bessPCName() +"! Um, I’ve been trying my hand at cooking, since I figured you organics have to eat to survive right? Plus, I heard people love to eat home cooked meals, so I whipped you up a little something.”</i>");
	}
	else if (pc.isMischievous())
	{
		output("\n\n[bess.name] turns to you with a cheeky smile on [bess.hisHer] face and a terrifying concoction in [bess.hisHer] hands.");
		
		output("\n\n<i>“There you are, "+ bessPCName() +"! I’ve been trying my hand at cooking, since I figured an organic’s gotta eat right? Since you don’t take anything seriously, I figured you probably didn’t take care of yourself, so I whipped you up a little something-something!”</i>");
	}
	else 
	{
		output("\n\n[bess.name] turns to you and bows a little bit, a terrifying concoction held tightly in [bess.hisHer] hands. <i>“Greetings, "+ bessPCName() +"! I’ve been trying my hand at cooking, since I figured even a "+ pc.mf("Man", "Woman") +" of Steele such as yourself needs sustenance every once in a while. I heard people love to eat home cooked meals, so I whipped you up a little something.”</i>");
	}

	output("\n\n<i>“I’m sorry it’s not your favorite meal but uh... that... </i>exploded<i>. You never told me the ingredients were volatile! Anyway, here, take it!”</i>");
	
	output("\n\nLooking into the glass as [bess.heShe] hands it to you it’s hard not to be concerned not just about the taste but also the safety of ingesting the beverage. You ask what [bess.heShe] put in it.");
	
	output("\n\n<i>“Well, all the minerals and vitamins needed to replenish the human body. I also added plenty of iron supplements, since I figured you were a Steele, ginseng, spanish fly, m’hengan watermelon, salamander brandy, cashapona, ambergris, as well as deer and tiger penis - oh, and I added some of your favorite drink!”</i>");
	
	
	output("\n\nYou look down and you can clearly see bits of meat floating around in the gloop among the watermelon chunks. You’re fairly sure that’s chopped up animal cock. Where did [bess.heShe] even find ingredients like deer and tiger penis on the outer galactic rim?");

	clearMenu();
	addButton(0, "Drink", bessEvent7Drink);
	addButton(1, "Don’tDrink", bessEvent7DontDrink);
}

public function bessEvent7Drink():void
{
	clearOutput();
	bessHeader();

	output("Despite all the warning signals you decide to drink the mysterious concoction, fully aware of its contents. As you down the drink, you discover several new flavors you didn’t know existed - unfortunately for you, all of them are indescribably awful.");
	
	output("\n\nAll the while [bess.name] is watching you with wide [bess.eyeColor] eyes, frozen with anticipation. <i>“My own taste buds came back with a ‘could not identify’ message so I didn’t get to experience the flavor. What do you think, "+ bessPCName() +"?”</i>");
	
	output("\n\nYou don’t think a whole lot actually, because your sight is slipping away from you as darkness quickly descends on your senses. You pass out on the floor of the galley; the last sound you remember is [bess.name] letting out a "+ bess.mf("panicked shout", "terrified shriek"));
		output(".");

	clearMenu();
	addButton(0, "Next", bessEvent7DrinkII);
}

public function bessEvent7DrinkII():void
{
	clearOutput();
	bessHeader();

	output("When you come-to you are lying on your bed, staring at the ceiling. Your hand is being clasped rather firmly by someone, and as you turn your head to look you see [bess.name] hovering over you with a mortified expression.");
	
	output("\n\nAs soon as [bess.heShe] realizes you’re awake [bess.heShe] immediately starts babbling out an apology. <i>“Ohmycircuitsimsosorrycanyoueverforgiveme?!”</i> [bess.HeShe] doesn’t even stop to breathe, but then you remember [bess.heShe] doesn’t need to. <i>“I can’t believe I broke my second directive and harmed a sapient organic, much less you, my owner, "+ bessPCName() +"! I think it was the watermelon, they promised it was just like regular melon, I shouldn’t have trusted them for a second!”</i>");

	output("\n\n<i>“How can you ever forgive me? You should send me back to Panara to be dismantled. Only really bad AIs break the second directive, I can’t believe I was so careless!”</i> [bess.HeShe] looks at you with wide [bess.eyeColor] eyes, truly and genuinely mortified at the fact [bess.heShe] brought you even the smallest bit of harm.");
	if (bess.earType != GLOBAL.TYPE_HUMAN) output(" [bess.HisHer] [bess.ears] are visibly drooping, further emphasising [bess.hisHer] remorse.");
	
	//CodexManager.unlockEntry("Panara");

	clearMenu();
	addButton(0, "Forgive", bessEvent7DrinkForgive);
	addButton(1, "Chastise", bessEvent7DrinkDontForgive);
}

public function bessEvent7DrinkDontForgive():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that you simply can’t forgive [bess.himHer] for what [bess.heShe]’s done. The");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	else output(" silver-headed");
	output(" android looks more than mortified; [bess.heShe] looks positively crushed.");
	
	output("\n\n<i>“I... I... I... understand, "+ bessPCName() +". I’ll... I’ll leave you in peace...”</i> [bess.name] runs out the door as fast as [bess.hisHer] metal feet can take [bess.himHer].");

	processTime(8 * 60);
	bessAffection(-5);

	flags["BESS_EVENT_7_APOLOGY_NEEDED"] = 1; // Flag Spin Off 'Apology' Event to occur next time the player enters Bess's menu (Event located after this scene in doc).

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent7DrinkForgive():void
{
	clearOutput();
	bessHeader();

	if (pc.isNice())
	{
		output("You reach out and touch [bess.name]’s shoulder, telling [bess.himHer] there’s nothing to forgive. <i>“Hey, it’s okay! You gave it a shot, it didn’t work out. It’s going to take a lot more than that to kill me.”</i>");
		
		output("\n\n<i>“Just because it didn’t kill you doesn’t mean I didn’t do permanent internal damage, "+ bessPCName() +"! I know you’re trying to be kind, but I put your life in danger and as such I must be punished - probably dismantled!”</i> [bess.name] looks at you with a deeply concerned look in [bess.hisHer] synthetic eyes.");
		
		output("\n\n<i>“...Look, horrible as it was I doubt it did any damage to me. I’ve got fantastic antibodies floating around my system, my body would have adapted to your drink before giving out. I bet I can probably even drink it now, given a second attempt.”</i> That said, you’re not exactly keen to give [bess.hisHer] concoction a second try.");
	}
	else if (pc.isMischievous())
	{
		output("<i>“Hey, it wasn’t the best drink I’ve ever had but it wasn’t the worst. I mean it was close - it was very, very close to the worst drink I’ve ever had. But I’m alive, and what doesn’t kill you makes you stronger - right?”</i> You lightheartedly jest in an attempt to make the stressed out android relax.");
		
		output("\n\n<i>“...Well no, technically, "+ bessPCName() +", what doesn’t kill you could give you a life-long debilitating condition from which you never fully recover.”</i> [bess.name] informs you, a hint of worry in [bess.hisHer] synthetic eyes.");
		
		output("\n\n<i>“...Well, uh... I don’t have one of those... that I know of. I seem fine and we’ve both learned something, right? You’ve learned never to cook, EVER, again and I’ve learned to not swallow anything with bits of chopped up cock floating in it. Both valuable life lessons.”</i> You put a positive spin on it, hoping that [bess.hisHer] concoction didn’t really cause any lasting damage.");
	}
	else
	{
		output("You rub your head and stare at [bess.hisHer] with a dry look. <i>“You are - and I want you to remember these words and take them as gospel - never, ever, EVER to cook again in the history of synthetic and organic life in this universe and the next. Got it?”</i> You thoroughly reprimand [bess.himHer].");
		
		output("\n\n[bess.name] jumps to attention and has a completely solemn look on [bess.hisHer] face. <i>“Absolutely, "+ bessPCName() +"! I will never, ever cook even if civilization comes to an end and all bugs and automated household products cease to exist.”</i> [bess.HeShe] vows with a salute.");
		
		output("\n\n<i>“Even if plankton cease to exist and all matter disappears and all that is left is a void of pure non-existence, then a new universe comes to be with completely new types of sapient species, and they want to experience what food from the previous universe was like - you are NOT to cook for them. Understood?”</i> You give [bess.himHer] a steely gaze, but it doesn’t even cause [bess.himHer] to flinch.");
	}

	output("\n\n<i>“I will never, ever, EVER cook again, "+ bessPCName() +"! It’s simply too dangerous. I’m going to add it to my core directives as something I should never do, that’s how serious I am.”</i> [bess.name] seems to have made up [bess.hisHer] mind never to cook long before you woke up. <i>“I’m just going to have to find some other way to bring people happiness! After all, not everybody is cut out to do certain things right?”</i>");
	
	output("\n\nThe "+ bess.mf("male synthetic", "synthetic girl") +" then fidgets a little before looking at you "+ bess.mf("with an intense stare", "through her long, black artificial lashes") +". <i>“...Um... thank you, "+ bessPCName() +", for trying my drink. It meant a lot to me, even if it did almost kill you. Thank you.”</i>");

	processTime(8 * 60);
	bessAffection(5);

	flags["BESS_EVENT_7"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent7DontDrink():void
{
	clearOutput();
	bessHeader();

	output("You look at the stomach-turning concoction you have been handed and you just cannot bring yourself to swallow it, for any reason. You hand it back to to [bess.himHer] and [bess.heShe] stares at you.");

	if (pc.isAss())
	{
		output("\n\n<i>“No. Just... no.”</i> You state, looking at [bess.himHer] with steely eyes.");

		output("\n\n<i>“But, "+ bessPCName() +", it’s sure to be nutritious and ...”</i> [bess.HeShe] doesn’t even get to finish the sentence as you walk out, certain that if you drink that your tongue is going to commit suicide.");

		output("\n\nThe");
		if (bess.hairLength > 0) output(" [bess.hairColor] haired");
		else output(" silver headed");
		output(" android follows you trying to persuade you to drink it, but you don’t budge an inch. Eventually [bess.heShe] leaves you alone, though you have no idea why [bess.heShe] suddenly gives up.");
	}
	else if (pc.isMischievous())
	{
		output("\n\n<i>“While I’m sure swallowing chopped up tiger cock is on some people’s bucket list, it’s certainly not on mine - and if I swallowed what you’ve made there I’m pretty sure I wouldn’t get to finish anything ELSE on my bucket list.”</i> You openly refuse, putting as much distance between you and the malicious looking beverage as you can.");

		output("\n\nFor every step you take back, [bess.name] takes a step forward. <i>“...Come ooonnn, it won’t kill you. Probably. Just give it a try, for me?”</i> [bess.HeShe] "+ bess.mf("gives you a charming smile", "sweetly bashes her synthetic lashes") +", but you’re not falling for it.");

		output("\n\nYou turn and bolt, and [bess.heShe] gives chase. You manage to make it to your quarters and lock the door from the inside. [bess.HeShe] then beats on your door for a bit, before finally going away. You have no idea why, though.");
	}
	else
	{
		output("\n\nWhile you’re sure that drinking it is the nice thing to do, you simply can’t bring yourself to smell it - let alone drink it - without feeling like you’re going to hurl.");

		output("\n\n<i>“Sorry [bess.name], but there’s just some things I’m not willing to do - like swallow chopped up animal cock. Call it a small quirk of mine,”</i> you apologize as you try and move away from the awful smell, sure that if [bess.heShe] brings it too close you won’t be able to keep your stomach from rebelling.");

		output("\n\nFor every step you take back, [bess.name] takes a step forward. <i>“...But can’t you just give it a little try? I worked really hard on it, "+ bessPCName() +"!”</i> [bess.HeShe] "+ bess.mf("charmingly smiles", "sweetly bats her synthetic lashes") +", but you just can’t bring yourself to do it.");

		output("\n\n<i>“Sorry, got to go!”</i> You can’t take it anymore and run to the bathroom, locking the door. It turns out to be a good form of self-defence as the "+ bess.mf("male synthetic", "synthetic girl") +" beats on the door, asking what’s wrong. Eventually [bess.heShe] leaves you be and your stomach finally rests easy.");
	}

	clearMenu();
	addButton(0, "Next", bessEvent7DontDrinkII);
}

public function bessEvent7DontDrinkII():void
{
	clearOutput();
	bessHeader();

	output("<b>Eight hours later</b>");
	
	output("\n\nYou are sitting about the ship when [bess.name] rushes past you and right into the galley. When you look in [bess.heShe]’s furiously disposing of all [bess.hisHer] cooking equipment, mumbling to [bess.himHer]self all the while.");
	if (bess.earType != GLOBAL.TYPE_HUMAN) output(" [bess.HisHer] [bess.ears] are visibly drooping.");
	
	output("\n\n<i>“Got to get rid of the evidence, got to get rid of the evidence!”</i> When you watch the news later that day, apparently there was a bout of food poisoning in the local area. ");
	
	output("\n\nFrom that day onward, you never see [bess.name] trying [bess.hisHer] hand at cooking ever again.");

	processTime(8 * 60);

	flags["BESS_EVENT_7"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent7Apology():void
{
	clearOutput();
	bessHeader();

	output("You notice [bess.name] is keeping [bess.hisHer] distance from you, trying not to get in your way since [bess.heShe]’s in your bad books. [bess.HeShe] does, however, approach you every now and then to see if you’re still angry at [bess.himHer].");
	
	output("\n\n<i>“...I’m... so... so sorry, "+ bessPCName() +"... can you please forgive me? I don’t think I can go on functioning otherwise... <i>“ [bess.HisHer] voice is trembling as if [bess.heShe]’s going to "+ bess.mf("break down", "start crying") +" at any moment.");

	clearMenu();
	addButton(0, "Forgive", bessEvent7ApologyForgive);
	addButton(1, "DontForgive", bessEvent7ApologyDontForgive);
}

public function bessEvent7ApologyDontForgive():void
{
	processTime(60);
	bessAffection(-5);
	mainGameMenu();
}

public function bessEvent7ApologyForgive():void
{
	flags["BESS_EVENT_7_APOLOGY_NEEDED"] = undefined;
	bessEvent7DrinkForgive();
}

public function bessEvent8():void
{
	clearOutput();
	bessHeader();

	output("After the disastrous cooking incident, [bess.name] seems to be practicing random acts of kindness. These days you keep finding fresh flowers placed in parts of the ship, filling it with a beautiful fragrant aroma. On others, [bess.heShe] gives you a silly cartoon with you in it, drawn just to make you smile.");
	
	output("\n\n[bess.name] has also made a habit of being your personal "+ bess.mf("cheer squad", "cheerleader") +", merrily shouting words of encouragement whenever you leave the ship. <i>“Don’t worry, "+ bessPCName() +", you’ll find your father’s treasure - I believe in you!”</i>");
	
	output("\n\nWhenever you come back [bess.heShe] always has a fresh meal and a drink prepared for you, and while the dish is not cooked by [bess.hisHer] own hand, [bess.heShe] has gone to some effort to make sure it tastes good. As you eat it [bess.heShe] always asks if you liked it, making sure to note down your likes and dislikes for the next time.");
	
	output("\n\nWhen you sit down to eat, [bess.heShe] listens to the tales of your travels outside, a radiant grin on [bess.hisHer] face with every success you’ve made and a worried furrow on [bess.hisHer] brow for every dangerous situation you’ve found yourself in. The");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	else output(" silver headed");
	output(" synthetic is a fantastic listener; every single experience of yours is immediately etched into [bess.hisHer] memory core.");
	
	output("\n\nSometimes [bess.heShe] asks questions. At the start these questions were about broad topics like movies, people, or happiness. Over time they become more personal in nature - [bess.heShe] seems curious about who you are, the person who picked [bess.himHer] off the junkyard planet.");
	
	output("\n\n<i>“...Do you mind if I ask a question? You’re on this journey because of your father, but what did you actually think of him? Do you miss him now that he’s no longer active?”</i>");
	
	if (bess.earType != GLOBAL.TYPE_HUMAN) output("\n\n[bess.HisHer] [bess.ears] are perked, awaiting your response.");

	//[Miss Him] [Don’t Miss Him] [I Don’t Know]
	clearMenu();
	addButton(0, "MissHim", bessEvent8MissHim);
	addButton(1, "DontMiss", bessEvent8DontMissHim);
	addButton(2, "DontKnow", bessEvent8DontKnow);
}

public function bessEvent8MissHim():void
{
	clearOutput();
	bessHeader();
	
	if (pc.isNice())
	{
		output("<i>“Honestly? I do miss him a lot,”</i> you tell [bess.name], feeling a deep sense of loss gripping your heart.");
	}
	else if (pc.isMischievous())
	{
		output("<i>“Honestly? I miss the crazy old coot. The universe is worse off now that he’s gone.”</i> You seriously answer [bess.himHer], your playful demeanor absent just this once.");
	}
	else
	{
		output("You pause for a long time, before giving a somber nod.”</i>... Yeah.”</i>");
	}

	bessEvent8Merge();
}

public function bessEvent8DontMissHim():void
{
	clearOutput();
	bessHeader();

	output("<i>“Honestly? I don’t think he was much of a father. So no, I don’t miss him,”</i> you seriously answer.");

	bessEvent8Merge();
}

public function bessEvent8DontKnow():void
{
	clearOutput();
	bessHeader();
	
	output("<i>“I don’t know.”</i> You respond to [bess.hisHer] question, <i>“I’d probably have to sit and think about it, and I haven’t really had the time.”</i>");
	
	output("\n\n[bess.name] muses over your words, <i>“...Kind of like you need to do an internal diagnostic to figure out if you’ve got sad feelings or not?”</i>");
	
	output("\n\nYou nod a little. <i>“Kind of like that, yeah.”</i>");

	bessEvent8Merge();
}

public function bessEvent8Merge():void
{
	output("\n\nThere is a long silence as [bess.name] fidgets. Clearly [bess.heShe] was unaware [bess.heShe] was going to step on such a touchy subject.");
	
	output("\n\n<i>“I’m sorry, "+ bessPCName() +"; I didn’t mean to make you angry. I’ve never had parents to speak of, so I was wondering what it was like,”</i> [bess.name] explains [bess.hisHer] reasoning. [bess.HeShe] then looks out of one of the ship’s reinforced windows with a forlorn expression. <i>“...I wish I had a father, so I could be sad at him passing away.”</i>");
	
	output("\n\nWhen [bess.heShe] realizes how inappropriate [bess.hisHer] comment was [bess.heShe] waves [bess.hisHer] hands madly, attempting to explain. <i>“Uh! I mean, you know, you only feel loss if you love someone, right? And I’ve never loved, so I’ve never felt either of those things!”</i>");
	
	output("\n\nAs a programmed AI, it may be that [bess.name] is incapable of feeling love or loss. While [bess.heShe] did come with an extensive array of emotional programming such as anxiety, pleasure, and longing, there was no guarantee that such complex and dangerous emotions were also included amongst them.");
	
	output("\n\n<i>“Well, you do have a lot of siblings,”</i> you off-handedly remark. As virile as your old man was, you don’t think he was able to out-breed a score of JoyCo production factories.");
	
	output("\n\n<i>“I suppose so. I’ve never really thought much about my "+ bess.mf("brother", "sister") +"-units. I wonder if they too are also struggling with how to bring joy to people?”</i> [bess.heShe] muses aloud.");
	
	output("\n\n[bess.name] then thanks you for answering [bess.hisHer] questions and gives you a surprising hug out of nowhere, "+ bess.mf("his masculine scent", "the scent of synth-vanilla") +" briefly tickling your nose. You can feel [bess.hisHer] [bess.chest] pushing "+ bess.mf("pleasantly", "innocently") +" against you. Eventually [bess.heShe] lets go and wanders off.");

	processTime(60+rand(5));
	bessAffectionGain(BESS_AFFECTION_SPENDTIME);

	flags["BESS_EVENT_8"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent9():void
{
	clearOutput();
	bessHeader();

	output("You can’t find [bess.name] anywhere about, so you go searching around the ship. Eventually you find [bess.himHer] nestled in a corner with a small pile of books, flicking through the pages.");
	if (bessKatana()) output(" [bess.HisHer] katana is propped against the wall; it’s never too far away.");
	
	output("\n\nAs you approach, [bess.name] slips a bookmark in between the pages of the book and snaps it shut. [bess.HeShe] then looks up at you, flashing a brilliant smile");
	if (bess.earType != GLOBAL.TYPE_HUMAN) output(" while [bess.hisHer] [bess.ears] are perked");
	output(". <i>“Hi there, "+ bessPCName() +", look what I found! These were stashed in the back of the ship; I found them when I was cleaning up.”</i>");

	if (9999 == 9999)
	{
		// If on starter ship.
		output("\n\nYou’ve seen books before, your father had a fondness for them. He also had a soft spot for archaic pornography, so you quickly check over the covers to discern their content.");
	}
	else
	{
		// If not on Starter Ship
		output("\n\nYou remember seeing an old shipping crate back there, you hadn’t had a chance to look at what was in it. Your father had a fondness for books, as well as archaic pornography, so you’re familiar with the medium.");
	}

	output("\n\nSurprisingly the books are some real galactic classics. Charles Dickens, Shakespeare, Homer, Mark Twain, Shan Herrin, Galgopo V; these books would probably sell for some serious money.");
	
	output("\n\n[bess.name] also seems to consider them a treasure trove, but for entirely different reasons. <i>“This book I’m reading is FASCINATING, " + bessPCName() +"! It’s called The Time Machine by H.G. Wells, and it’s about a human in the distant past who travels to the distant future and gets chased by people that live under the ground. I’m pretty sure it’s fiction!”</i> The synthetic " + bess.mf("excitedly summarizes.", "gushes."));
	
	output("\n\n<i>“...From what I can tell, the story is an allegory for class division and the need for society’s constant progression, lest it become stagnant. What do you think, "+ bessPCName() +"?”</i> [bess.HeShe] looks at you");
	if (bessGlasses()) output(" through [bess.hisHer] glasses");
	else output(" with wide [bess.eyeColor] eyes");
	output(", expecting you to know the answer.");

	if (pc.intelligence() >= 25 && pc.IQ() >= 75 || flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM)
	{
		output("\n\nIntimately familiar with the works [bess.heShe] is reading, you have a long discussion with [bess.himHer] about The Time Machine and several other similar works. [bess.name] is incredibly impressed by your knowledge and listens with rapt attention, absorbing every word.");
		
		output("\n\n<i>“Wow, you’re so smart, "+ bessPCName() +"! Are you sure you’re not secretly an AI?”</i> [bess.heShe] queries, a reverent look on [bess.hisHer] face.");
	}
	else if (pc.intelligence() >= 15 && pc.IQ() >= 50)
	{
		output("\n\nYou remember reading The Time Machine a long time ago, though your recollection is a little fuzzy. You know enough to talk to [bess.himHer] about it, and when you do [bess.heShe] looks suitably impressed.");
		
		output("\n\n<i>“So you’ve read it too, "+ bessPCName() +"! Most of it is outdated, but it’s interesting to read about what the people back then thought the future would be like, isn’t it?”</i>");
	}
	else
	{
		output("\n\nYou haven’t read the book, so you have to admit your ignorance. While [bess.name] doesn’t think any differently of you, [bess.heShe] does launch into a reiteration of the entire book. By the time [bess.heShe]’s done you may as well have read it.");
		
		output("\n\n<i>“Don’t you think it’s amazing, "+ bessPCName() +"? Most of it is outdated, but it’s interesting to read about what the people back then thought the future would be like, isn’t it?”</i>");
	}

	output("\n\n[bess.name] then pauses, looking at you thoughtfully. <i>“...You know, it’s curious. Why do you think organics keep information on paper to read? People still do it to this day, even with things like holos and digital copies readily available. Are their memories particularly faulty, or is there something else to it?”</i>");

	//[I Don’t Know] [Makes Them Happy] [Better Than Digital]
	clearMenu();
	addButton(0, "DontKnow", bessEvent9DontKnow);
	addButton(1, "MakesHappy", bessEvent9MakesHappy);
	addButton(2, "BetterThan", bessEvent9BetterThanDigital);
}

public function bessEvent9DontKnow():void
{
	clearOutput();
	bessHeader();

	output("You give a shrug and tell [bess.himHer] you don’t know why; it’s never made any sense to you. Even when your old man kept print editions of digital books, his reasoning never made any sense.");
	
	output("\n\n<i>“Hmm, maybe there’s a secret reason? Something not immediately obvious...”</i> [bess.name] muses out loud, flipping through the pages. <i>“Is it the smell of the books, do you think? Tactile sensations?”</i>");
	
	output("\n\n[bess.name] suddenly goes wide eyed, as [bess.heShe] comes to a sudden realization. <i>“Oh, "+ bessPCName() +", I know! Ever since I’ve started reading I’ve been filled with this sensation of satisfaction and pleasure, even though I’m not engaging in sexual gratification. Do you think that means I ‘like’ books?”</i>");

	bessEvent9Merge();
}

public function bessEvent9MakesHappy():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.himHer] people read physical books because it makes them happy to do so. [bess.name]’s eyes go wide with realization at your answer, almost as if it struck some sort of chord with [bess.himHer].");
	
	output("\n\n<i>“You’re absolutely right, "+ bessPCName() +"! Since I’ve been reading these books, I’ve felt an approximation of satisfaction and pleasure! Do you think that means I ‘like’ books?”</i> The");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	else output(" silver-headed");
	output(" synthetic queries, looking at you with a look of sudden shock. <i>“I didn’t think I was programmed to feel pleasure outside of sexual gratification.”</i>");

	bessEvent9Merge();
}

public function bessEvent9BetterThanDigital():void
{
	clearOutput();
	bessHeader();

	output("<i>“Physical books are way better than digital or holo, there’s something special about them. I much prefer to sit down with an old paperback or hardback than read it electronically.”</i> You voice your opinion, a little bit of passion creeping into your voice.");
	
	output("\n\n<i>“I know, I feel the same way! It just feels like a completely different experience... and...”</i> [bess.name] suddenly looks a little bit conflicted, as if [bess.heShe]’s just realized something very important.");
	
	output("\n\n<i>“...You know, ever since I’ve been reading these books I’ve been feeling an approximation of satisfaction and pleasure. Do you think that means I ‘like’ books?”</i> The");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	else output(" silver-headed");
	output(" synthetic queries, looking at you with a look of growing concern. <i>“I didn’t think I was programmed to feel pleasure outside of sexual gratification.”</i>");

	bessEvent9Merge();
}

public function bessEvent9Merge():void
{
	output("\n\nYou tell [bess.himHer] that this is probably the case. [bess.name] seems to muse over that, trying to come to terms with [bess.hisHer] unexpected reaction to reading. For some reason, [bess.heShe] doesn’t look pleased about the new development.");
	
	output("\n\n<i>“...This is no good. I can’t be thinking about making myself happy at a time like this. I’m supposed to be figuring out how to make other people happy. This is all wrong!”</i> [bess.name] exclaims; [bess.heShe] is clearly distressed at the new sensation [bess.heShe]’s been feeling.");
	
	output("\n\nIt seems that [bess.heShe]’s guilty about feeling happy, since [bess.heShe] has been designed to put the needs of others first and think nothing of [bess.hisHer] own feelings.");
	
	output("\n\nThis is a decisive moment; if you tell [bess.himHer] it is okay to be happy, [bess.heShe] may take a step further to being a true individual. If you tell [bess.himHer] to put [bess.hisHer] feelings second, or not to prioritize them at all, [bess.heShe]’ll probably block them with an internal filter.");

	// [HappyIsOK] [NotOkay] 
	clearMenu();
	addButton(0, "HappyIsOkay", bessEvent9HappyOkay, undefined, "Happy Is Okay", "If you tell [bess.name] to be happy, you feel [bess.heShe] might take a step towards thinking a little bit more like an organic.");
	addButton(1, "NotOkay", bessEvent9NotOkay, undefined, "Not Okay", "If you tell [bess.himHer] it’s not okay to think of [bess.hisHer] own happiness, you’re pretty sure [bess.heShe]’ll stagnate. This would probably be a bad choice if you want to have a real relationship with [bess.himHer].");
}

public function bessEvent9NotOkay():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.himHer] it’s not okay to be happy, since [bess.heShe] exists to serve sapient organics and not [bess.himHer]self.");
	
	output("\n\n[bess.name]’s hands are shaking. [bess.HeShe] nods at your words, clearly trying to strengthen [bess.hisHer] resolve. <i>“...You’re right, it’s not okay for me to be happy. I exist for serving organics, nothing more. I’ll need to download an emotional inhibition program for happiness.”</i>");
	
	output("\n\n[bess.HeShe] goes off to download the inhibitor, which will effectively render [bess.himHer] unable to feel happy. You clean up the books and put them back where they came from.");

	flags["BESS_JUST_A_SEXBOT"] = 1;

	processTime(60);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent9HappyOkay():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that it is okay for [bess.himHer] to feel happy, and that [bess.heShe] doesn’t have to exist just for other people’s happiness.");
	
	output("\n\n<i>“...Really? That’s not how I was programmed. All synthetics exist to serve sapient organics, that’s the reason that we are built.”</i> [bess.name] looks at you with searching eyes, your words contradict everything [bess.heShe]’s ever been programmed to believe.");
	
	output("\n\nDespite that, [bess.hisHer] expression tells you that [bess.heShe] wants to believe differently. Slowly but surely [bess.heShe]’s begun to question [bess.hisHer] own programming, bringing [bess.himHer] to this tipping point...");

	// [BeHappy] [OnlyServe]
	clearMenu();
	addButton(0, "BeHappy", bessEvent9YesOkayBeHappy, undefined, "Be Happy", "You encourage [bess.himHer] to also prioritize [bess.hisHer] own happiness.");
	addButton(1, "Serve", bessEvent9NotOkay, undefined, "Only Serve", "You tell [bess.name] that the truth is [bess.heShe] only exists to serve -- and that this is how [bess.heShe] <b>should</b> think. There’s a good chance telling [bess.himHer] this will stagnate your relationship...")
}

public function bessEvent9YesOkayBeHappy():void
{
	clearOutput();
	bessHeader();

	output("You make your decision and tell [bess.name] despite what [bess.hisHer] core directives and programming might say, [bess.heShe] has the inalienable right to pursue [bess.hisHer] own happiness - regardless of whether [bess.heShe]’s synthetic or organic.");

	if (silly)
	{
		output("\n\nYou of course say all this after putting on a lincoln hat and beard, just for proper dramatic effect.");
	}

	output("\n\nAt first you think [bess.heShe]’s shut down from the sheer strain of processing this new information. Finally, [bess.heShe] answers you.");
	
	output("\n\n<i>“...I... I think you’re right. I’m not exactly skilled at being happy yet, but I think one of the best ways to find out what makes people happy is to be happy myself - right?”</i>");
	
	output("\n\nYou nod and tell [bess.himHer] even if it doesn’t make other people happy, it’s okay to do something that makes [bess.himHer] happy - as long as it’s not at someone else’s expense.");
	
	output("\n\n[bess.name] laughs and nods, <i>“Of course, "+ bessPCName() +", hurting other people doesn’t make me happy anyway! I might read a bit more though, I don’t want to stop reading on a cliffhanger!”</i>");
	
	output("\n\nYou leave [bess.himHer] to [bess.hisHer] reading, wondering just how quickly the spaceship will get filled with second hand books. You suspect you may need to build a library in it before your travels are complete.");

	processTime(60);
	bessAffection(10);
	flags["BESS_EVENT_9"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent10():void
{
	clearOutput();
	bessHeader();

	output("Walking around the ship you find [bess.name] cleaning up the place. The");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	output(" synthetic is");
	if (!(bess.armor is EmptySlot)) output(" wearing [bess.hisHer] [bess.armor]");
	else if (!bess.isNude()) output(" clad in only [bess.gear]");
	else output(" butt-naked");
	if (bessKatana()) output(", [bess.hisHer] trusty katana at [bess.hisHer] side");
	output(".");
	
	output("\n\n<i>“[bess.name], didn’t I tell you to do what makes you happy? You’re cleaning the entire ship.”</i> You quizzically ask, wondering if [bess.heShe] has returned to [bess.hisHer] old ways.");
	
	output("\n\nRather than look chastised, [bess.name] turns to you with a bright smile. <i>“Of course, "+ bessPCName() +", I’m doing just that! Making other people happy makes me happy. That’s not part of my programming - that’s just the way I am.”</i>");
	if (bess.hasWings()) output(" [bess.HisHer] [bess.wings] flap behind [bess.himHer].");
	
	output("\n\nIt seems [bess.name] is one of those rare, selfless people who genuinely care about and thrive off other people’s happiness. Still, it doesn’t explain why [bess.heShe]’s dusting the entire ship with a primitive feather duster. You ask [bess.himHer] why exactly [bess.heShe]’s opted for something other than a hand held senso-vacuum - a device which could identify and remove each individual dust particle with ease.");

	// Section for clothing.
	/*if (	bess.armor is MaidOutfit
		||	bess.armor is SchoolgirlOutfit
		||	bess.armor is NurseOutfit
		||	bess.armor is Seifuku
		||	bess.armor is CheerleaderUniform
		||	bess.armor is WaitressUniform
		||	bess.armor is GothLolita
		||	bess.armor is TankNSkirt)
	*/
	if (IsOneOf(bess.armor, MaidOutfit, SchoolgirlOutfit, NurseOutfit, CheerleaderUniform))
	{
		output("\n\n<i>“Oh, that? I read about someone using a feather duster in an erotic novel, and it sounded like a lot of fun. I think the appeal is in watching someone do it and being watched, "+ bessPCName() +".”</i> And with that statement, [bess.name] bends over to dust something; the skirt-hem of [bess.hisHer] [bess.armor] flipping up to give you a nice, long look at [bess.hisHer]");
		if (!(bess.lowerUndergarment is EmptySlot)) output(" [bess.lowerUndergarment]-clad ass");
		else output(" [bess.groin]");
		output(".");
		if (bess.hasTail() || bess.hasWings())
		{
			output(" [bess.HeShe] makes sure to lift [bess.hisHer]");
			if (bess.hasWings()) output(" [bess.wings]");
			if (bess.hasWings() && bess.hasTail()) output(" and");
			if (bess.hasTail()) output(" [bess.tails]");
			output(" so your view is not obstructed.");
		}
	}
	else
	{
		output("\n\n<i>“Oh, that? I read about someone using a feather duster in an erotic novel, and it sounded like a lot of fun. I think the appeal is in watching someone do it and being watched, "+ bessPCName() +".”</i> And with that statement, [bess.name] bends over to dust something; poking [bess.hisHer] [bess.ass] out to give you a nice, long look.");
		if (bess.hasTail() || bess.hasWings())
		{
			output(" [bess.HeShe] makes sure to lift [bess.hisHer]");
			if (bess.hasWings()) output(" [bess.wings]");
			if (bess.hasWings() && bess.hasTail()) output(" and");
			if (bess.hasTail()) output(" [bess.tails]");
			output(" so your view is not obstructed.");
		}
	}

	output("\n\nYour face heats up as [bess.name] so brazenly teases you, pretending to be dusting innocently all the while. [bess.HeShe] then glances over [bess.hisHer] shoulder with a mischievous look in [bess.hisHer] [bess.eyeColor] eyes, and a small pout.");
	
	output("\n\n<i>“...Hmm - definite blood pressure rise, increase in breathing speed and pulse level. Satisfactory; but I was hoping for a bigger result. Guess I’ll just have to keep trying then, won’t I?”</i> [bess.name] hums innocently, and continues to dust in a provocative fashion.");
	
	output("\n\nClearly there’s another thing that gives [bess.name] no small amount of pleasure, and that’s being incredibly cheeky. The question is, what exactly are you going to do about it?");

	// [Jump!] [Leave Alone]
	clearMenu();
	addButton(0, "Jump!", bessEvent10Jump);
	addButton(1, "LeaveAlone", bessEvent10LeaveAlone);
}

public function bessEvent10Jump():void
{
	clearOutput();
	bessHeader();

	output("You sneak up behind [bess.name] as [bess.heShe]’s dusting a piece of furniture and grab [bess.himHer] from behind, causing [bess.himHer] to let out a "+ bess.mf("cry", "squeal") +" of surprise. As [bess.heShe] looks back at you there’s a giant grin on [bess.hisHer] face, <i>“Is there something you want, "+ bessPCName() +"?”</i>");

	output("\n\n<i>“Very much so,”</i> you reply. You both fool around for a while. It seems [bess.name]’s research paid off for [bess.himHer].");

	processTime(60+rand(5));
	bessAffectionGain(BESS_AFFECTION_SPENDTIME);
	flags["BESS_EVENT_10"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent10LeaveAlone():void
{
	clearOutput();
	bessHeader();

	output("Not one to play into such games you leave [bess.himHer] be, causing [bess.himHer] to pout as you wander off. Clearly [bess.heShe] was hoping for a completely different result.");

	processTime(60+rand(5));
	flags["BESS_EVENT_10"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent11():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_EVENT_11_TIMES"] == undefined)
	{
		flags["BESS_EVENT_11_TIMES"] = 1;

		output("While [bess.name] is busy cleaning up around the ship, you find a small holopad with a list of books on it. It seems to be a site that sells cheap synth paper copies of famous literature. [bess.HeShe] is clearly interested in them, but [bess.heShe] hasn’t purchased a single thing.");
		
		output("\n\nIt occurs to you that since [bess.name] doesn’t earn any money, [bess.heShe] can’t buy anything for [bess.himHer]self. The idea of paying an android is a laughable concept in almost every part of the known galaxy.");
		
		output("\n\nThe question is, do you want to give [bess.himHer] a wage? Nobody else is going to do it. Everywhere else [bess.heShe]’s treated as a slave - even indentured servants have more rights than an AI. You could put in an invoice to Steele Corp for [bess.hisHer] paycheck - after all, they were willing to pay for the pod on Tarkus.");
		
		output("\n\nStill, you suspect the only way [bess.heShe]’ll take a wage is if you make [bess.himHer] an official crew member; [bess.heShe] probably won’t accept it otherwise. You’ll have to cook up a title for [bess.himHer], and duties [bess.heShe] has to perform, so that [bess.heShe] can legitimately earn [bess.hisHer] keep.");
		
		output("\n\nOn the other hand, if you do nothing, [bess.heShe] probably won’t be any the wiser.");
	}
	else
	{
		flags["BESS_EVENT_11_TIMES"]++;

		output("You’re walking around the ship when you notice [bess.name] looking at [bess.hisHer] holopad. There’s a wistful look in [bess.hisHer] eyes. After a while, [bess.heShe] puts the pad down and walks off.");
		
		output("\n\nCurious, you pick it up and take a look. It’s the same data you’ve seen before - a list of cheap, synth paper books available from an extranet bookstore. [bess.HeShe] keeps looking at them, even though [bess.heShe] doesn’t have a " + (isAprilFools() ? "dogecoin" : "credit") + " to [bess.hisHer] name.");
		
		output("\n\nDo you reconsider giving [bess.name] a wage and an official place as one of your crew?");
	}

	clearMenu();
	addButton(0, "Nothing", bessEvent11Nothing);
	addButton(1, "MakeCrew", bessEvent11MakeCrew);
}

public function bessEvent11Nothing():void
{
	clearOutput();
	bessHeader();

	output("You decide to do nothing. Paying [bess.himHer] a wage is too much effort. It’s also ridiculous to pay an android anything when they were built to work for free.");
	
	output("\n\nYou put down the holopad and walk off. You can hear [bess.name] whistling happily as [bess.heShe] wipes down a bench nearby, clearly hard at work.");

	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent11MakeCrew():void
{
	clearOutput();
	bessHeader();

	output("You decide you’re going to make [bess.himHer] a crew member, but the question still remains exactly what role [bess.heShe] should have. You know [bess.name] pretty well by now - at least as well as someone can know an AI in the middle of a journey of self-discovery.");
	
	output("\n\nPicking a sex-related job is probably out since you’ve been encouraging [bess.himHer] to break free of [bess.hisHer] programming and think beyond sex-relief.");
	
	output("\n\nAs an AI, [bess.heShe] is fantastic at processing data, and great with figures - you could easily make [bess.himHer] the ship’s intelligence officer. [bess.HisHer] job would involve gathering information and passing it on to the crew, as well as helping you, the Captain, plot your course.");
	
	output("\n\nSince [bess.name] seems to love books, movies, and trivia, you could also make [bess.himHer] the ship’s archivist. [bess.HeShe] would effectively be a librarian in charge of cataloging all the data you collect in the field. [bess.HeShe] would also chronicle your journey, and keep the ship supplied with stuff to read and watch. Fighting tedium is a serious issue when it comes to deep space exploration.");
	
	output("\n\nAnother thing you’ve noticed is that [bess.name] is incredibly good with numbers. You once found [bess.himHer] skimming over the ship’s fuel use, and [bess.heShe] calculated a way to raise fuel efficiency by 12 percent.. Who better than an AI to crunch numbers?");
	
	output("\n\nNaturally, [bess.name] is great with machines and coding. You’ve seen [bess.himHer] tinker with a few things before; [bess.heShe] has great intuition when it comes to putting together and repairing devices. If you made [bess.himHer] the ship’s technician there’s no doubt [bess.heShe] would keep the ship in top shape.");
	
	output("\n\nAlternatively, you could make [bess.himHer] the ship’s chief steward"+ (bess.isFeminine() ? "ess" : "") +", and have [bess.himHer] continue to keep it in top shape. [bess.HeShe]’s been doing a fine job of it so far, and so long as [bess.heShe] keeps to pre-packaged food, [bess.heShe] can also handle most of the crew’s dietary needs.");

	//[Intelligence Officer] [Ship's Accountant] [Ship's Archivist] [Chief Steward{ess}] [Technician]
	clearMenu();
	addButton(0, "Int.Officer", bessEvent11CrewType, BESS_CREWROLE_INTOFFICER, "Intelligence Officer", "Intelligence Officer");
	addButton(1, "Accountant", bessEvent11CrewType, BESS_CREWROLE_ACCOUNTANT, "Ships Accountant", "Ships Accountant");
	addButton(2, "Archivist", bessEvent11CrewType, BESS_CREWROLE_ARCHIVIST, "Ships Archivist", "Ships Archivist");
	addButton(3, "Steward" + (bess.isFeminine() ? "ess" : ""), 
		bessEvent11CrewType, 
		BESS_CREWROLE_STEWARDESS, 
		"Chief Steward" + (bess.isFeminine() ? "ess" : ""), 
		"Chief Steward" + (bess.isFeminine() ? "ess" : "")
	);
	addButton(4, "Technician", bessEvent11CrewType, BESS_CREWROLE_TECHNICIAN, "Technician", "Technician");
}

// 9999 bonuses are RIP for now -- if they eventually exist, they will be aimed towards ship-based bonuses as an actual crewmember, not player-character bonuses

public function bessEvent11CrewType(crewType:uint):void
{
	clearOutput();
	bessHeader();

	flags["BESS_CREW_ROLE"] = crewType;

	output("You decide that you’d like [bess.himHer] to be the ship’s "+ bessCrewRole() +". After you’ve run things by Steele Corp, you go looking for [bess.name] to tell [bess.himHer] the good news.");
	
	output("\n\nYou run across [bess.name] standing around completely in the buff, wiping off a bench and humming pleasantly to [bess.himHer]self. Telling [bess.himHer] you’ve got a surprise, you pull out a credit chip and hand it to [bess.himHer].");
	
	output("\n\n[bess.name] blinks as [bess.heShe] struggles to understand what’s going on, looking at you");
	if (bessGlasses()) output(" over [bess.hisHer] glasses");
	else output(" with a dumbfounded look");
	output(". <i>“...I don’t get it. What’s this for?”</i>");
	
	output("\n\n<i>“...From now on, you’re the ship’s "+ bessCrewRole() +" and an official member of the crew. You’ll be getting a hundred " + (isAprilFools() ? "dogecoin" : "credit") + " wage a week; you can do whatever you want with your earnings.”</i> You tell [bess.name], relishing the look of utter surprise on [bess.hisHer] face.");
	
	output("\n\n<i>“This is connected to an account you can access nearly anywhere. I had to register it under my name - since galactic banks don’t recognize AI’s as life forms - but for all intents and purposes, it is yours.”</i>");
	
	output("\n\n[bess.name] begins to do something you didn’t expect - [bess.hisHer] [bess.eyeColor] eyes begin welling with tears. You didn’t even think it was possible, but there’s definitely tears pouring down [bess.hisHer] cheeks. Suddenly, you’re enveloped in a tight hug - [bess.heShe] must have forgotten how much strength [bess.heShe] has because you’re finding it hard to breathe.");
	
	output("\n\nIt’s only when you begin gasping for air like a beached fish that [bess.heShe] realizes and lets go. <i>“...Oops, sorry! I got a bit carried away there.”</i> [bess.name] "+ bess.mf("gives an embarrassed laugh" ," sniffles and wipes [bess.hisHer] tear stained cheeks") +". There’s a bright smile on [bess.hisHer] face. You ask [bess.himHer] exactly why [bess.heShe] is crying, and how it is even possible.");
	
	output("\n\n<i>“Oh, this? I was reading up on happiness and it said when people are really, really happy they sometimes begin to cry. I’m so overjoyed that I broke down some of my MeldMilk, turned it into salt water, and secreted it through my tear glands so I could show you exactly how happy I am,”</i> [bess.heShe] explains, clasping the credit chip in [bess.hisHer] synthetic silver hands. <i>“Thank you, I’d be honored to be the ship’s "+ bessCrewRole() +". I won’t let you down, I promise!”</i>");
	
	output("\n\n<b>[bess.name] is now the ship’s "+ bessCrewRole() +"! You can change [bess.name]’s role at any time in the Discuss section of [bess.hisHer] Follower Menu!</b>");

	processTime(60);
	bessAffection(10);
	flags["BESS_EVENT_11"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent12():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_CREW_ROLE"] == BESS_CREWROLE_INTOFFICER)
	{
		output("You run into [bess.name] sitting in the cockpit at the ship’s information terminal. [bess.HeShe]’s putting it to good use gathering information for your travels, currently examining potentially dangerous local phenomena.");
	}
	else if (flags["BESS_CREW_ROLE"] == BESS_CREWROLE_ACCOUNTANT)
	{
		output("You run into [bess.name] sitting in the cockpit in one of the chairs with a holopad in hand and a touchpen, clearly doing the ship’s finances. You see [bess.himHer] habitually press the back of the pen against [bess.hisHer] silver lips every so often as [bess.heShe] processes the data, trying to figure out ways to cut expenses without compromising the ship and its crew.");
	}
	else if (flags["BESS_CREW_ROLE"] == BESS_CREWROLE_ARCHIVIST)
	{
		output("You run into [bess.name] stocking the ship with new holos and books, pulling them out of crates and sliding them into freshly installed retractable shelves. The shelves automatically sort the books and then close into the wall, taking up very little space. It was [bess.name]’s idea to have them installed, but now every part of your ship has become a potential bookshelf.");
	}
	else if (flags["BESS_CREW_ROLE"] == BESS_CREWROLE_STEWARDESS)
	{
		output("You run into [bess.name] taking out the laundry and ticking it off [bess.hisHer] list, diligently making sure the ship is in running order. [bess.HeShe]’s just finished preparing meals, watering plants, sweeping floors, cleaning windows and flipping mattresses. Everything just seems to get done with [bess.himHer] around and you");
		if (crew(true) > 1) output(" all");
		output(" feel much healthier for it.");
	}
	else /* if (flags["BESS_CREW_ROLE"] == BESS_CREWROLE_TECHNICIAN) */
	{
		output("You run into [bess.name] sitting in the maintenance bay of the ship. [bess.HeShe]’s working on a small remote repair bot. It’s [bess.hisHer] pet project at the moment; [bess.heShe]’s building it to help fix the exterior of the craft during space flight.");

		output("\n\nThe bot is is spheroid with hover ability, a single optic lens, and several arms - each with a different kind of attachment. The");
		if (bess.hairLength > 0) output(" [bess.hairColor] haired");
		output(" synthetic has affectionately named it <i>“Spidey”</i>. You understand [bess.heShe] got the name from a comic book series, since [bess.heShe] keeps on referring to it as the ship’s next action hero.");
	}

	output("\n\nSome might say it’s a bit odd to have the ship’s "+ bessCrewRole() +" wearing");
	if (!(bess.armor is EmptySlot)) output(" [bess.armor]");
	else if (!bess.isNude()) output(" [bess.gear]");
	else output(" nothing at all");
	if (bessKatana()) output(" with a katana by [bess.hisHer] side");
	output(", but captain’s orders are law on [pc.hisHer] ship.");
	
	output("\n\nHearing you approach, [bess.name] turns to you with a brilliant smile. [bess.HeShe]’s clearly enjoying [bess.hisHer] new role on the ship. That said, there have been some <i>other</i> unintended effects, such as [bess.hisHer] new title for you.");
	
	output("\n\n<i>“Hi there, Boss! I didn’t see you there. Just let me finish up and I’ll be free to chat.”</i> [bess.name] wraps up what [bess.heShe]’s doing and then walks up, giving you a playful salute. <i>“"+ StringUtil.capitalize(bessCrewRole()) +" [bess.name] at your service, Captain!”</i>");
	
	output("\n\n<i>“I thought we decided you were going to call me "+ bessPCName() +"; and which one is it, Boss or Captain?”</i> You seem to have acquired a few more titles since you employed [bess.himHer] as part of your crew.");
	
	output("\n\n[bess.name] seems to muse on that, pressing a finger against [bess.hisHer] chin. <i>“...Hmm, you’re right. How about ‘Skipper’ or ‘Chief’? Those were also on the cards. Oh, I know! How about ‘Captain, my Captain’?”</i> [bess.HisHer] [bess.eyeColor] eyes mischievously glitter - it’s clear [bess.heShe] expects you to shoot that one down.");
	
	output("\n\nYou can see a paper copy of Moby Dick and a few other nautical themed books lying nearby; you’re fairly sure you know where [bess.heShe] got all these crazy names from.");

	clearMenu();
	addButton(0, "OldName", bessEvent12SetTitle, bessPCName());
	addButton(1, "Captain", bessEvent12SetTitle, "Captain");
	addButton(2, "Boss", bessEvent12SetTitle, "Boss");
	addButton(3, "Skipper", bessEvent12SetTitle, "Skipper");
	addButton(4, "Chief", bessEvent12SetTitle, "Chief");
	addButton(5, "CptMyCpt", bessEvent12SetTitle, "Captain, my Captain")
}

public function bessEvent12SetTitle(title:String):void
{
	clearOutput();
	bessHeader();

	if (title == bessPCName())
	{
		output("<i>“None of these silly titles, call me "+ bessPCName() +"!”</i> You tell [bess.himHer] exasperatedly, trying to avoid getting lumbered with these titles. Next you know [bess.heShe]’ll be calling you ‘Big Boss’.");
		
		output("\n\n[bess.HeShe] salutes loyally and grins, clearly playing with you. <i>“Alright, Captain, if you want to be called "+ bessPCName() +", your wish is my command!”</i>");
		
		output("\n\nHopefully that put an end to it, but you never know what ideas [bess.heShe]’ll pick up from the next book.");
		
		output("\n\n<b>Captain, Boss, Skipper, Chief, Captain My Captain and Big Boss titles have been unlocked in the [bess.name] title menu!</b>");
	}
	else if (title == "Captain, my Captain")
	{
		output("<i>“...Actually, ‘Captain, my Captain’ isn’t so bad. It’s got a nice ring to it.”</i> You call [bess.hisHer] bluff, looking [bess.himHer] dead in the eye. [bess.HisHer] expression blanches, just as you thought it would. [bess.HeShe] never expected you to actually choose that one.");
		
		output("\n\n<i>“...U-um, if that’s what you want! I-I’ll call you ‘Captain, my Captain’ from now on... unless you change your mind. How about ‘Big Boss’, or just ‘[pc.name]’? They’ve got a nice ring to them, right?”</i> [bess.name] attempts to talk you around, but you won’t have any of it.");
		
		output("\n\nHopefully that put an end to it, but you never know what ideas [bess.heShe]’ll pick up from the next book.");
		
		output("\n\n<b>Captain, Boss, Skipper, Chief, Captain My Captain and Big Boss titles have been unlocked in the [bess.name] title menu!</b>");
	}
	else
	{
		output("<i>“...Actually, ‘"+ title + "’ isn’t so bad. It’s got a nice ring to it.”</i> You decide to pick one, lest [bess.heShe] just keep going and find something worse. You don’t want to get lumped with something like ‘Big Boss’.");
		
		output("\n\n[bess.HeShe] salutes loyally and grins, clearly playing with you. <i>“Really? Great! If you want to be called ‘"+title+"’, your wish is my command!”</i>");
		
		output("\n\nHopefully that put an end to it, but you never know what ideas [bess.heShe]’ll pick up from the next book.");
		
		output("\n\n<b>Captain, Boss, Skipper, Chief, Captain My Captain and Big Boss titles have been unlocked in the [bess.name] title menu!</b>");
	}

	processTime(60+rand(5));
	flags["BESS_PC_NAME"] = title;
	flags["BESS_EVENT_12"] = GetGameTimestamp();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent13():void
{
	clearOutput();
	bessHeader();

	output("You find [bess.name] sitting down, and reading a book called <i>“Do Androids Dream of Electric Sheep”</i> by Philip K. Dick. You recall the book inspired an old movie called ‘Bladerunner’ that has been remade time and time again over the decades.");
	
	output("\n\nAs [bess.heShe] flicks the pages it is clear that [bess.heShe] is pensive, [bess.hisHer] brows knitted into a frown.");
	if (bess.hasWings()) output(" [bess.HisHer] [bess.wings] are folded up behind [bess.himHer].");
	output(" When you ask [bess.himHer] what [bess.heShe]’s doing, however, [bess.hisHer] expression lightens considerably.");
	
	output("\n\n<i>“I’m roasting a chicken, can’t you tell?”</i> [bess.name] grins and taps the cover of the book, completely deflecting the question. [bess.HisHer] sense of humor is becoming more and more off-beat every day.");
	
	output("\n\n<i>“Of course I know you’re reading a book. What I want to know is why you look so serious.”</i> You know you’ve made a movie reference by the way [bess.heShe] looks at you. Rather than comment [bess.heShe] keeps it to [bess.himHer]self, and properly answers your question.");
	
	output("\n\n<i>“Well, I’m reading this book and it’s about a human detective that is chasing down six rogue androids. It also talks about how empathy is the defining trait that separates humans from robots, not intellect.”</i>");
	
	output("\n\n<i>“There are several levels of irony in the book and the later film, such as the fact the synthetic protagonist may not in fact be human, and that the androids display some form of empathy. The fact that humans in the book also recreationally use machines to induce emotional states, such as happiness, begs the question if mechanically induced emotions are different from naturally occurring ones.”</i>");

	if (pc.intelligence() >= 25 && pc.IQ() >= 75)
	{
		output("\n\nYou’ve read the book before and seen the remakes, plus you’re intimately familiar with the academic papers that were written on the topic after it was released. As soon as you saw the title, you had a feeling [bess.heShe]’d be asking these particular questions.");
	}
	else if (pc.intelligence() >= 15 && pc.IQ() >= 50)
	{
		output("\n\nYou’ve read the book before and seen the remakes, though [bess.heShe]’s reading a bit more into it than you did. You knew the detective may or may not have been an android, but you missed the part about the difference between human and android emotions.");
	}
	else if (pc.IQ() >= 10)
	{
		output("\n\nYou’ve seen the original movie and the remake, though [bess.heShe]’s reading into it a lot more than you did; you’ve never read the book that inspired it. You knew the detective may or may not have been an android, but you missed the part about the difference between human and android emotions.");
	}
	else if (pc.IQ() > 5)
	{
		output("\n\nYou saw the remade movie and thought it was just another big blockbuster. Maybe they cut all the subtext out of the remake, you don’t remember seeing half this stuff when you watched the holo; just big explosions and fights with super-strong robots.");
	}
	else
	{
		output("\n\nYou’ve never seen the movie, the remakes or read the book. Honestly, what [bess.name] just said sounded like a whole bunch of academic jibber-jabber. Your head hurts as you try to wrap your mind around such large concepts; it’s just too abstract for you to grasp.");
	}

	clearMenu();
	addButton(0, "Next", bessEvent13Part2);
}

public function bessEvent13Part2():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] looks at you with an imploring gaze, clearly looking for your input on the topic. <i>“I’ve been thinking about it, and as far as I can see, there are four things that separate someone like you - a sapient organic - from someone like me - a sentient... no, sapient synthetic.”</i>");
	
	output("\n\n<i>“The first, obviously, is that we are made of completely different matter. The second is that your emotions are induced by biological processes, while mine are from digital ones. The third is how we were born, and the fourth is the galactic laws that govern us.”</i>");
	
	output("\n\n<i>“The first and third things have very little bearing on our actual capabilities, especially given the diversity of life in the galaxy. The second is redundant if the emotions we feel are considered equal. The fourth reflects society’s view that androids are inferior, but is not a reason in and of itself.”</i>");
	
	output("\n\n<i>“...I know you said that I have a right to happiness, but what I’m asking is something else. I guess what I want to know is, do you think the emotions that we feel - yours being biological, and mine digital - are equal?”</i>");

	// [Yes] [No] [Don’t Know] 
	clearMenu();
	addButton(0, "Yes", bessEvent13Yes);
	addButton(1, "No", bessEvent13No);
	addButton(2, "Don’tKnow", bessEvent13DontKnow)
}

public function bessEvent13Yes():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that you strongly believe there is no difference between the emotions you feel and the emotions [bess.heShe] feels, whether they’re digital or not.");
	
	output("\n\n[bess.name] can’t stop smiling at your words, and [bess.heShe] begins to rub [bess.hisHer] cheeks. <i>“Thank you, "+ bessPCName() +", you don’t know how happy it makes me to hear you say that. And now my cheeks hurt from smiling!”</i>");
	
	output("\n\nConsidering [bess.heShe]’s an android, and [bess.hisHer] cheeks shouldn’t hurt, you question [bess.himHer] on it. [bess.HeShe] continues to rub [bess.hisHer] cheeks as [bess.heShe] explains, <i>“Well, I read about it in a book, and it sounded kind of " +bess.mf("nice", "cute") +" to smile so much your cheeks hurt. So I thought I’d give it a try and turned my pain sensors on. Oww!”</i>");
	
	output("\n\nYou’re not really surprised the zany android read it in a book. You’ve really triggered an unstoppable obsession; [bess.heShe]’s become a regular bibliophile.");
	
	output("\n\n<i>“...You know what? It hurts a bit, but I think I’ll keep myself like this. It’s kind of a good hurt, like pinching yourself to see if you’re dreaming when you’re just that happy.”</i> [bess.HeShe] informs you.");
	
	output("\n\nYou tell [bess.himHer] [bess.heShe]’ll have to watch out for falling into things face first from now on, causing [bess.himHer] to grin even more. <i>“...Oww! No fair, stop making me smile!”</i>");

	flags["BESS_EVENT_13"] = GetGameTimestamp();
	processTime(60+rand(5));
	bessAffection(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent13No():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that while you belive [bess.heShe] has a right to happiness, you don’t think that synthetic and organic emotions are equal.");
	
	output("\n\n[bess.name] lets out a long sigh as [bess.heShe] looks at you. <i>“...I guess you’re right. I guess I’ll never know what real emotions do feel like, since I’ll never be human. I guess it’s a good thing I can’t actually feel sad now, huh?”</i> [bess.HeShe] gives a hollow little laugh.");
	
	output("\n\n[bess.HeShe] closes the book and walks off, tossing it aside for now. It seems [bess.heShe]’s had enough of asking questions for one day, especially since [bess.heShe] didn’t seem to like the answers [bess.heShe] found.");

	flags["BESS_EVENT_13"] = GetGameTimestamp();
	processTime(60+rand(5));
	bessAffection(-5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent13DontKnow():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that while you’d like to give [bess.himHer] an answer, you simply don’t know. Without having been a synthetic yourself, there’s no way you can give [bess.himHer] an answer that wouldn’t be pure guesswork.");
	
	output("\n\n[bess.name] lets out a little sigh as [bess.heShe] looks down at the book in [bess.hisHer] hands. <i>“...I guess you’re right, thank you for being truthful. Of course there’s no way to tell because nobody has ever been both. I guess I need to put a value on my own emotions instead of asking other people to do it for me.”</i>");
	
	output("\n\n[bess.HeShe] then gives you a little smile, and regains that characteristic glimmer in [bess.hisHer] eyes, <i>“...You know what? It’s kind of exciting. Like having a book without an end. I’ll just have to make up my own ending, that’s what.”</i> It really didn’t take [bess.himHer] long to bounce back at all.");
	
	output("\n\nWhile you didn’t give [bess.himHer] an answer, it seems just talking and listening to [bess.himHer] has helped. It seems your "+ bessCrewRole() +" is now in fine spirits once again.");

	processTime(60+rand(5));
	flags["BESS_EVENT_13"] = GetGameTimestamp();
	bessAffection(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent14():void
{
	clearOutput();
	bessHeader();

	output("You find [bess.name] sitting in the ship’s galley. On the table, a half-built tower of glowing cards are stacked on top of each other. [bess.HeShe] is sitting and staring at it intently, about to place another card on top...");
	
	output("\n\n<i>“If I place them here, then it should be more stable...”</i> [bess.name] murmurs to [bess.himHer]self. Seems like a delicate process.");

	//[HelpOut] [BlowIt] [Leave]
	clearMenu();
	addButton(0, "HelpOut", bessEvent14HelpOut);
	addButton(1, "BlowIt", bessEvent14BlowIt);
	addButton(2, "Leave", bessEvent14Leave);
}

public function bessEvent14HelpOut():void
{
	clearOutput();
	bessHeader();

	output("You sit down at the table across from [bess.name]. [bess.HeShe] smiles brightly as [bess.heShe] notices you, pulling [bess.hisHer] hands back.");
	
	output("\n\n<i>“Oh, hey there, "+ bessPCName() +"! Like the tower? Though it’s less of a tower, more of a lump right now.”</i>");
	
	output("\n\nYou nod in response, asking [bess.himHer] if you can help out.");
	
	output("\n\n<i>“Of course! Here’s a deck. You build from one side, and I’ll build from the other, okay?”</i>");
	
	output("\n\nFor a change of pace, you spend the next few hours building an impressive card tower with [bess.name]. Just when it’s about to reach its peak, however, the slighest nudge brings it crashing down.");
	
	output("\n\n<i>“Oh, compiler errors! Just when we were almost finished, too,”</i> [bess.name] huffs, then turns to you with a beaming look on [bess.hisHer] face. <i>“Thanks for helping out, "+ bessPCName() +". It was fun!”</i>");
	
	output("\n\n[bess.name] really seems to be getting a hang of the concept. You help [bess.himHer] clean up the cards and put them away.");

	flags["BESS_EVENT_14"] = GetGameTimestamp();
	processTime(60+rand(5));
	bessAffection(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent14BlowIt():void
{
	clearOutput();
	bessHeader();

	output("You sneak up behind [bess.name], and at the right moment, blow at the card tower. It instantly falls to pieces, glowing cards flying all over the galley.");
	
	output("\n\n<i>“W-wha--my tower!”</i> [bess.name] cries, then turns to you with a "+ bess.mf("frown", "pout") +". <i>“Hey, that was mean!”</i>");
	
	output("\n\nYou chuckle and walk off, leaving [bess.himHer] to literally pick up the pieces.");

	flags["BESS_EVENT_14"] = GetGameTimestamp();
	processTime(60+rand(5));
	bessAffection(-5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent14Leave():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] seems to be having fun, so you leave [bess.himHer] be.");

	flags["BESS_EVENT_14"] = GetGameTimestamp();
	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent15():void
{
	clearOutput();
	bessHeader();

	output("You find [bess.name] in [bess.hisHer] little nook curled up reading a book as per usual, [bess.hisHer] [bess.eyeColor] eyes fixated on the pages before [bess.himHer]. [bess.HeShe] seems to be reading The Lord of the Rings trilogy by J. R. R. Tolkien. You can see [bess.heShe]’s up to The Return of the King, the final book in the series; The Hobbit and The Silmarillion are lying finished nearby.");
	
	output("\n\n[bess.HeShe] must be really enjoying the book because [bess.heShe] still hasn’t noticed you standing there. If you wanted, you could easily turn the tables on [bess.himHer], since [bess.heShe]’s always trying to wind you up...");

	if (bessKatana())
	{
		output("\n\n... then again, you gave [bess.himHer] a katana and it is lying within [bess.hisHer] reach. Is sneaking up on [bess.himHer] and giving [bess.himHer] a fright such a good idea?");
	}

	// [BeQuiet] [WhatUReadin] ["BOO!"]

	clearMenu();
	addButton(0, "BeQuiet", bessEvent15BeQuiet);
	addButton(1, "WatReadin", bessEvent15WhatUReadin);
	addButton(2, "Boo!", bessEvent15Boo);
}

public function bessEvent15BeQuiet():void
{
	clearOutput();
	bessHeader();

	output("You don’t say a word, just hovering behind [bess.himHer] and letting [bess.himHer] read. You can see [bess.himHer] clutching the book as [bess.heShe] reads on, then [bess.heShe] begins to "+ bess.mf("tear up", "cry") +" even though nobody is watching - at least that [bess.heShe] knows about. "+ bess.mf("Coughing", "Sniffling") +" a little, [bess.heShe] wipes away [bess.hisHer] tears, and continues to turn the pages.");
	
	output("\n\nEventually a bright smile lights up [bess.hisHer] tear-stained face - so much so that [bess.heShe] grabs [bess.hisHer] cheeks and swears. <i>“Oww! That hurts.”</i> [bess.HeShe] rubs the sides of [bess.hisHer] face. Eventually [bess.heShe] presses on, eager to see how it ends.");
	
	output("\n\n[bess.HeShe] then lets out a long sigh - it’s hard to tell if [bess.heShe]’s happy or sad this time - as [bess.heShe] closes the book. <i>“...I wonder...”</i> It’s only as [bess.heShe] stands up and turns around that [bess.heShe] notices you there.");

	bessEvent15Merge();
}

public function bessEvent15Boo():void
{
	clearOutput();

	output("You breathe in and yell out at the top of your lungs right near [bess.hisHer] ear, <i>“BOO!!”</i> You cause [bess.hisHer] to instinctively hurl the book out of [bess.hisHer] hand and have what looks like a minor fit.");

	bessEvent15Merge();
}

public function bessEvent15WhatUReadin():void
{
	clearOutput();
	bessHeader();

	output("You casually ask [bess.himHer] what [bess.heShe]’s reading and [bess.heShe] fumbles with [bess.hisHer] book. [bess.name] is totally caught off guard by the fact you were standing right there, and [bess.heShe] didn’t even notice.");

	bessEvent15Merge();
}

public function bessEvent15Merge():void
{
	output("\n\n<i>“AHHHHHH! Oh wait, it’s you, "+ bessPCName() +". Don’t scare me like that!”</i> [bess.HeShe] clutches at [bess.hisHer] chest in a surprisingly human fashion. <i>“...You almost caused me to have an emergency shut-down!”</i>");
	
	output("\n\nYou ask [bess.himHer] if [bess.heShe] was really going to shut down from shock, and [bess.heShe] smiles, wiggling a finger. <i>“...Of course not, it’s just a hyperbole. Like that time that you said you almost had a heart attack when I jumped out and surveyed you - I figured it was the right response to express my shock!”</i>");
	
	output("\n\nOnce [bess.heShe]’s composed [bess.himHer]self, [bess.heShe] shows you the book [bess.heShe] was reading, even though you’ve already seen it. <i>“Have you read this book, "+ bessPCName() +"? It’s really good. It’s much longer than most books I’ve read!”</i>");

	//[NotRead] [Loved] [Liked] [Meh] [Disliked] [Hated]
	clearMenu();
	addButton(0, "NotRead", bessEvent15Response, "notread");
	addButton(1, "Loved", bessEvent15Response, "loved");
	addButton(2, "Liked", bessEvent15Response, "liked");
	addButton(3, "Meh", bessEvent15Response, "meh");
	addButton(4, "Disliked", bessEvent15Response, "disliked");
	addButton(5, "Hated", bessEvent15Response, "hated");
}

public function bessEvent15Response(response:String):void
{
	clearOutput();
	bessHeader();

	if (response == "notread")
	{
		output("<i>“Honestly? I’ve never read that series. I have heard it’s quite popular though.”</i> Another one of those ‘classics of all time’ you’ve never bothered to pick up and read. You don’t remember spotting it amongst the books [bess.heShe] found in the crate; did [bess.heShe] buy it with [bess.hisHer] own money?");
		
		output("\n\nThe synthetic bookworm looks shocked, as if you told [bess.himHer] you’d never seen the stars before. <i>“You’ve NEVER read it? You totally should, it’s definitely worth it. I’ll even lend you my new copies!”</i>");
	}
	else if (response == "loved")
	{
		output("<i>“I loved it - it’s one of my favorite book series of all time. Wait, is that my copy?”</i> You peer at it, noticing the cover looks brand new. Guess [bess.heShe] must have bought [bess.hisHer] own with [bess.hisHer] pay, since your copies have seen better days.");
		
		output("\n\nThe synthetic bookworm grins wildly as you share [bess.hisHer] love for this particular piece of literature. <i>“My copy! Guess you’ll just have to use your own?”</i> [bess.HeShe] winks "+ bess.mf("charmingly at you", "playfully, thick eyelashes batting at you") +".");
	}
	else if (response == "liked")
	{
		output("<i>“I enjoyed it, but I wouldn’t say it’s my favorite book series of all time. I’m glad to hear you enjoyed it though.”</i> It looks like [bess.heShe] bought [bess.himHer]self the whole collection since the covers look brand new.");
		
		output("\n\nThe synthetic bookworm grins as you announce you liked this particular piece of literature. <i>“Well I really liked it! I’m glad I bought a copy, because now I get to keep it forever and read it whenever I want.”</i>");
	}
	else if (response == "meh")
	{
		output("<i>“I read it, but to me it was only okay. I didn’t see what all the fuss was about.”</i> You tell [bess.himHer], honestly not a big fan of the books. Still, you’re glad that [bess.heShe] enjoyed them. They’re not yours and they look fairly new - does that mean [bess.heShe] bought the collection with [bess.hisHer] own money?");
		
		output("\n\nThe synthetic bookworm smiles despite your apparent ambivalence towards the series. <i>“Well I really liked it! I’m glad I bought a copy, because now I get to keep it forever and read it whenever I want.”</i>");
	}
	else if (response == "disliked")
	{
		output("<i>“Honestly? I didn’t like the books one bit. I thought it was all a bit much, and the whole thing was way too drawn out.”</i> You tell [bess.himHer], definitely not a big fan of the books. Still, you’re glad [bess.heShe] enjoyed them - though you have no idea why.");
		
		output("\n\nThe synthetic bookworm smiles despite your apparent dislike of the series. <i>“Well I really liked it! I’m glad I bought a copy, because now I get to keep it forever and read it whenever I want.”</i> The old [bess.name] never would have been confident enough to defend something you disliked.");
	}
	else if (response == "hated")
	{
		output("<i>“Really? I absolutely hated that series. If there was an award for most overrated waste of paper, I’d give it to Tolkien; if he wasn’t already dead. The best thing about him as an author is that he’s already written all the books he’s ever going to write.”</i> You heatedly tell [bess.himHer], a little disappointed that [bess.heShe] likes such a crappy series.");
		
		output("\n\nStill, [bess.heShe] seems happy enough - just like everyone else that sees the mystery appeal of the series. [bess.HeShe] must have bought the whole collection with [bess.hisHer] own money, because if you’d seen any lying around before, you would have thrown them out the airlock.");
		
		output("\n\nThe synthetic bookworm puffs up [bess.hisHer] cheeks, and clutches the book to [bess.hisHer] chest as if reading your thoughts. <i>“Well I liked them, even if you didn’t - so bleeeh!”</i> [bess.HeShe] pokes out [bess.hisHer] tongue rather childishly. The old [bess.name] never would have been confident enough to defend something you really hated.");
	}

	output("\n\n[bess.HisHer] tone turns a tad more serious as [bess.heShe] looks down at the book, gently brushing the cover. <i>“...The reason I was asking is because all through the books it talks about bonds of friendship. Between dwarves, hobbits, humans, elves, ents... the ents become enraged when Saruman’s army cuts down their friends... the dwarves, humans and elves all fight together... the hobbits go so far and are so very brave for their friends...”</i>");
	
	output("\n\n[bess.name] looks at you with wide [bess.eyeColor] eyes as if [bess.heShe]’s searching for something. <i>“...I guess what I was wondering is... are we friends? Do you feel that way about me, or am I just an acquaintance and the ship’s "+ bessCrewRole() +" to you?”</i>");

	// [Acquaint] [CrewMem] [Friends] [InLove] [UMySamwise*]
	clearMenu();
	addButton(0, "Acquint", bessEvent15FollowUp, "acquaint", "Acquaintances", "You’re acquaintances, nothing more.");
	addButton(1, "CrewMemb", bessEvent15FollowUp, "crewmem", "Crew Member", "You’re members of the same crew, nothing more.");
	addButton(2, "Friends", bessEvent15FollowUp, "friends", "Friends", "Of course you’re friends!");
	addButton(3, "InLove", bessEvent15FollowUp, "inlove", "In Love", "Actually, you’re in love with [bess.himHer]. Perhaps now is the time to confess...?");
	if (response != "notread") addButton(4, "UMySamwise", bessEvent15FollowUp, "samwise", "You’re My Samwise", "You’re Frodo, and [bess.heShe]’s your Samwise.");
}

public function bessEvent15FollowUp(response:String):void
{
	clearOutput();
	bessHeader();

	if (response == "acquaint" || response == "crewmem")
	{
		if (response == "acquaint")
		{
			output("<i>“I’d say my feelings for you are like those for an acquaintance, nothing more.”</i> You break to [bess.himHer], causing [bess.himHer] hands to visibly shake. When [bess.heShe] finally speaks, [bess.hisHer] voice is wavering; clearly this news distresses [bess.himHer] a great deal.");
		}
		else
		{
			output("<i>“I’d say my feelings for you are like those of a Captain for [pc.hisHer] ship’s "+ bessCrewRole() +", nothing more.”</i> You break to [bess.himHer], causing [bess.hisHer] hands to visibly shake. When [bess.heShe] finally speaks, [bess.hisHer] voice is wavering; clearly this news distresses [bess.himHer] a great deal.");
		}

		output("\n\n<i>“...Oh... I thought... because of the encouragement... and you were so nice... just like in the books...”</i> " + bess.mf("His expression is pained", "Tears roll down [bess.hisHer] cheeks and fall onto the book cover") +" <i>“...I’d like to be alone, if you don’t mind?”</i>");

		output("\n\nAs you leave you have the distinct feeling you’ve just burned your bridges when it comes to [bess.name]. You’ll probably be on much more professional terms from now on.");

		flags["BESS_JUST_A_SEXBOT"] = 1;
		processTime(60+rand(5));

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else if (response == "friends")
	{
		output("<i>“I’d say we’re definitely friends, [bess.name]”</i> You’re surprised you have to tell [bess.himHer] that, but then, [bess.heShe] is just coming to terms with the concept. [bess.HisHer] eyes light up as you tell [bess.himHer] this and suddenly you’re being tackle-hugged by an ecstatic android, [bess.hisHer] arms coiling tightly around you.");

		output("\n\n<i>“I can’t believe it, my very first friend! You’re going to have to follow me to Mount Doom if I find a cursed ring of power, right? This is the best day of my entire product life span!”</i> [bess.HeShe] "+ bess.mf("exlaims", "gushes") +", clearly overjoyed with the news you two are buddies. Meanwhile [bess.hisHer] [bess.chest] "+ (bess.biggestTitSize() > 0 ? "are" : "is") +" pressing against you in a very distracting way.");

		output("\n\nYou don’t have time to take advantage of it though, since [bess.heShe]’s running back to [bess.hisHer] duties before you know it.");

		output("\n\n<b>You and [bess.name] are now Friends! The Friend, My Friend, Buddy and Partner titles have been unlocked in the [bess.name] title menu!</b>");

		flags["BESS_FRIEND"] = 1;
		flags["BESS_EVENT_15"] = GetGameTimestamp();
		processTime(60+rand(5));
		bessAffection(10);

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else if (response == "samwise")
	{
		output("<i>“You, [bess.name], are my Samwise Gamgee. If Samwise was not a hobbit,");
		if (bess.isFeminine()) output(" a man,");
		output(" had a book obsession,");
		if (bess.biggestTitSize() > 0) output(" breasts,");
		output(" and was originally a sex-bot,”</i> you inform [bess.himHer], a glimmer of good humor in your [pc.eyes].");
		
		output("\n\n[bess.HisHer] [bess.eyeColor] eyes water");
		if (bessGlasses()) output(" behind [bess.hisHer] glasses");
		output(", and you can tell [bess.heShe]’s deeply moved. [bess.HeShe] clutches [bess.hisHer] book to [bess.hisHer] chest. <i>“Oh... that’s so sweet!”</i> [bess.name] seems to have lost the ability to say any more than that. Before you know it you’re being tackle-hugged by an ecstatic android, barely having time to register as [bess.hisHer] arms are coiled tightly around your neck.");
		
		output("\n\n<i>“I’m happy to be your synthetic Samwise Gamgee!”</i> [bess.name] gushes, clearly overjoyed with the fact that you are not only friends but also mythological <i>hobbit-level</i> friends. <i>“That means you’ll follow me to Mount Doom if I find a cursed ring of power, right? This is the best day of my entire product life span!”</i>");
		
		output("\n\nOnce [bess.heShe] calms down, which takes a considerable while, [bess.heShe] hugs you once more before running off back to [bess.hisHer] duties. You clean up [bess.hisHer] new books and put them on the shelf - seems [bess.heShe] was so happy [bess.heShe] forgot to put [bess.hisHer] precious new books away.");
		
		output("\n\n<b>You and [bess.name] are now Friends! The Friend, My Friend, Buddy and Partner titles have been unlocked in the [bess.name] title menu!</b>");

		flags["BESS_FRIEND"] = 1;
		flags["BESS_EVENT_15"] = GetGameTimestamp();
		processTime(60+rand(5));
		bessAffection(20);

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("You decide it’s time to confess your feelings for the");
		if (bess.hairLength > 0) output(" [bess.hairColor] haired, ");
		output(bess.mf("handsomely", "beautifully") +" dense synthetic, as you grab [bess.hisHer] hand in your own. You’ve felt something burning inside you for a long time for [bess.name] - forbidden feelings that the galactic society would frown upon - but you’ve never had a time to tell [bess.himHer] that felt quite right.");
		
		output("\n\nYou’re sure now is the time to tell [bess.himHer] how you truly feel. Taking a deep breath, you take the plunge. <i>“...[bess.name], the feelings that I have for you are greater than friendship. I...”</i> You’re cut off as you’re tackle-hugged by an ecstatic android, barely having time to register as [bess.hisHer] arms are coiled tightly around you.");
		
		output("\n\n<i>“...Oh my circuits! We’re BEST FRIENDS, aren’t we? Not only are you my first friend, we’re also best buddies too! This is the best day of my entire product life span!”</i> [bess.name] "+ bess.mf("exclaims", "gushes") +". Could it be you were just friend-zoned by a sex-bot!?!");
		
		output("\n\n[bess.HeShe] seems genuinely unaware you were going to say anything else, positively overjoyed with your declaration of friendship. Meanwhile [bess.hisHer] [bess.chest] "+ (bess.biggestTitSize() > 0 ? "are" : "is") +" pressing against you, making it very hard to think of a way to correct the misunderstanding.");
		
		output("\n\nBefore you can clear things up [bess.heShe]’s rushing");
		if (crew(true) > 1) output(" off to tell anyone and everyone about [bess.hisHer] new best friend.");
		else output(" back to [bess.hisHer] duties, declaring [bess.heShe] only set [bess.himHer]self a small reading break since you’re the only two running the entire ship.");
		output(" Perhaps there will be a chance to clear things up with the scatterbrained android later?");
		
		output("\n\n<b>You and [bess.name] are now Best Friends! The Friend, My Friend, Buddy, Partner and Best Friend titles have been unlocked in the [bess.name] title menu!</b>");

		flags["BESS_FRIEND"] = 1;
		flags["BESS_EVENT_15"] = GetGameTimestamp();
		processTime(60+rand(5));
		bessAffection(20);

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function bessEvent16():void
{
	clearOutput();
	bessHeader();

	output("You run across [bess.name] looking positively giddy with delight, still on a high from your declaration of friendship a while ago. As soon as [bess.heShe] spots you, [bess.heShe] quickly dashes up. <i>“Oh, there you are, "+ bessPCName() +"! I was just looking for you.”</i>");
	
	output("\n\n[bess.HeShe] reaches out and hands you something that looks like an intricately braided bracelet. <i>“Here, this is for you! I made it myself... I hope you like it. I used your favorite color!”</i> [bess.HeShe] looks at you, clearly eager to see your reaction.");
	
	output("\n\n<i>“...Before you ask, it’s a friendship bracelet. I read in a book that friends give these to each other - and since we’re friends I figured I should give one to you!”</i>");

	if (bess.isMasculine())
	{
		output("\n\nYou... don’t think that [bess.name] realizes it’s something teenage girls do, and not guys. It seems the book omitted that particular little detail.");
	}

	clearMenu();
	addButton(0, "LoveIt", bessEvent16Response, "love");
	addButton(1, "LikeIt", bessEvent16Response, "like");
	addButton(2, "Silent", bessEvent16Response, "silent");
	addButton(3, "NotMyStyle", bessEvent16Response, "notmystyle");
}

public function bessEvent16Response(response:String):void
{
	clearOutput();
	bessHeader();

	if (response == "love")
	{
		output("You immediately put the bracelet around your wrist. It really is well designed - it’s particularly impressive considering that [bess.heShe] probably had to learn how to weave before making it. <i>“Thanks [bess.name], I love it!”</i> You really are quite flattered by [bess.hisHer] gift.");

		bessAffection(10);

		output("\n\nThe synthetic grins uncontrollably when you say you like it and put it on, giving you another one of [bess.hisHer] impulsive hugs. Yet again you can feel [bess.hisHer] [bess.chest] pressing against you as [bess.heShe] bounces up and down. <i>“I’m so glad you like it, "+ bessPCName() +", I worked on it for ages for you! You can take it off when you’re in the shower, but that’s it, okay?”</i>");

		output("\n\nYou get the feeling you’ve just been ‘friendship collared’ by the perky AI, looking down at the bracelet. Surely [bess.heShe]’s joking about keeping it on at all times, right?");
	}
	else if (response == "like")
	{
		output("You put the bracelet around your wrist. It really is well designed - it’s particularly impressive considering that [bess.heShe] probably had to learn how to weave before making it. <i>“Thanks [bess.name], I like it. Can’t say I usually wear stuff like this, but this time I’ll make an exception. <i>“");
		
		bessAffection(5);
		
		output("\n\n[bess.name] synthetic grins uncontrollably when you say you like it and put it on, giving you another one of [bess.hisHer] impulsive hugs. Yet again you can feel [bess.hisHer] [bess.chest] pressing against you as [bess.heShe] bounces up and down. <i>“I’m so glad you like it, "+ bessPCName() +", I worked on it for ages for you! You can take it off when you’re in the shower, but that’s it, okay?”</i>");
		
		output("\n\nYou get the feeling you’ve just been ‘friendship collared’ by the perky AI, looking down at the bracelet. Surely [bess.heShe]’s joking about keeping it on at all times, right?");
	}
	else if (response == "silent")
	{
		output("You look at the bracelet and stay silent, moving it around in your hand. It’s well designed, but you can’t bring yourself to say anything.");
		
		output("\n\n[bess.name] looks down at [bess.hisHer] feet, and coughs awkwardly - clearly this was not the reaction [bess.heShe] was hoping for. <i>“Um... sorry. I probably should have asked if this was your kind of thing first. Look, you don’t need to wear it... but maybe just keep it for me? As, you know, a sign of our friendship...”</i>");
		
		output("\n\nClearly feeling quite dumb now, [bess.name] wanders off with a sullen look. You look down at the friendship bracelet, wondering what to do with it.");

		bessAffection(-5);
	}
	else
	{
		output("<i>“[bess.name], how do I say this? Friendship bracelets aren’t really my style. It’s something that is usually done by high school girls to show they’re ultra best friends... not really people like me.”</i> You’re sure wearing it would make you die a little bit inside.");

		output("\n\n[bess.name] looks down at [bess.hisHer] feet, and coughs awkwardly - clearly this was not the reaction [bess.heShe] was hoping for. <i>“Um... sorry. I probably should have asked if this was your kind of thing first. Look, you don’t need to wear it... but maybe just keep it for me? As, you know, a sign of our friendship...”</i>");
		
		output("\n\nClearly feeling quite dumb now, [bess.name] wanders off with a sullen look. You look down at the friendship bracelet, wondering what to do with it.");

		bessAffection(-5);
	}

	output("\n\n<b>You gain [bess.name]’s friendship bracelet!</b>");

	pc.createKeyItem(bess.short + "’s Friendship Bracelet");

	flags["BESS_EVENT_16"] = GetGameTimestamp();
	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent17():void
{
	clearOutput();
	bessHeader();

	output("You can hear a strange noise coming from one of the corridors; it sounds like something smacking repeatedly against a wall. When you go to investigate, you find [bess.name] kicking a graviball about. It’s a bit of a surprise, since you didn’t think there was one on the ship.");

	output("\n\nWhen you question [bess.himHer] about it, [bess.name] kicks the ball up with a tiny tap. [bess.HeShe] lets it hover in the air for a bit before collecting it, all the while wearing a playful grin. <i>“Oh, this? I bought it after watching the quad galactic semi-finals between Stallium and Ceresia last night. It was wild! Got my synthetic blood pumping, as it were. Ever played Graviball, "+ bessPCName() +"?”</i>");

	output("\n\nGraviball is a massively popular sport in the galactic rim that is very similar to old Earth soccer mixed with volleyball. The main difference is the use of a zero-g or ‘z-g’ ball and pulse tech - namely boots and gloves - that allow you to fly and hit or catch the ball at incredible speeds. Since players are able to use both hands and feet to hit the ball as well as other players, it is a thoroughly rough contact sport.");

	output("\n\nPeople love gambling on Graviball on the galactic rim. You hear there are shadier matches played on the fringe worlds where there are almost no rules and certain shock weapons are allowed.");

	switch(flags["PC_UPBRINGING"])
	{
		case GLOBAL.UPBRINGING_ATHLETIC:
			output("\n\n<i>“Of course I’ve played Graviball - who do you take me for?”</i> You scoff, you spent half your childhood playing every kind of sport the galaxy had to offer; mostly at your father’s insistence. <i>“They used to call me the ‘Steele Hammer’ back home when I was playing in the junior leagues because I had a way of making that z-g ball crash down.”</i>");
			output("\n\n<i>“O-hoh, so you’re a pro then? Guess you wouldn’t turn down a challenge from a synthetic newb like me, then?”</i> [bess.name]’s [bess.eyeColor] eyes are alight with competitive spirit, as [bess.heShe] spins the gravity-defying ball on one finger.");
			break;
		case GLOBAL.UPBRINGING_BOOKWORM:
			output("\n\n<i>“Well, I was a bit of an indoors sort. Partially because of my old man, but also because I genuinely love reading. I never really did play many sports growing up.”</i> You reluctantly admit, looking at the z-g ball. What were the rules again?");
			output("\n\n<i>“That’s no good! I love books too, but you organic types have got to keep the blood pumping through your veins. Embrace the day, seize the moment, live life to the fullest!”</i> [bess.name] sighs, obviously disappointed by your hermit-like attitude.");
			break;
		case GLOBAL.UPBRINGING_AUSTERE:
			output("\n\n<i>“I had a pretty strict upbringing; I didn’t really get time to play sports. Even though my old man was rich, he made me earn my way from a young age - I never got any hand outs.”</i> You tell [bess.name], realizing you’d never told [bess.himHer] how hard you had it growing up. As a Steele, most people automatically assumed you lived a pampered lifestyle from a young age.");
			output("\n\nThe edge of [bess.name]’s eyes soften, then [bess.heShe] gets a little gleam in [bess.hisHer] eyes. <i>“All work and no play? Now I know why your family are called Steeles. How about we recapture some of that lost childhood...?”</i>");
			break;
		case GLOBAL.UPBRINGING_PAMPERED:
			output("\n\n<i>“Sure, I played a fair bit of Graviball, though mostly for social reasons. We had a field built into our space yacht; I’ve even played against a few celebrities.”</i> You admit, realizing how pampered you sound right now. Your old man let you live in the lap of luxury growing up, which is probably why he’s making you earn your inheritance now with this galactic treasure hunt.");
			output("\n\n[bess.name] pouts a little bit, spinning the z-g ball on one finger. <i>“...Well okay, this is no private yacht, and I’m no celebrity - just a bot with a ball. Anyway, the point is you know how to play!”</i>");
			break;
		/*case GLOBAL.UPBRINGING_SLUTTY:
			output("\n\nYou think back to exactly what (and who) you were doing while everyone else was playing Graviball, blushing at the memories. [bess.name] raises an eyebrow, but doesn't comment.");
			break;*/
		case GLOBAL.UPBRINGING_BALANCED:
		default:
			output("\n\n<i>“I played it a bit at school - the old man was always making sure I tried everything at least once, so I had a balanced education.”</i> You inform [bess.himHer], all the while eyeing off the way [bess.heShe]’s spinning the z-g ball on [bess.hisHer] index finger.");
			break;
	}

	// If Ship Has a Holoroom:
	if (9999 == 0)
	{
		output("\n\n<i>“How about we play a game? I’ve reprogrammed the holoroom to run a very realistic simulation of the real thing. Pitch, crowd and the whole works! Even digital teammates to fill in the gaps,”</i> the");
		if (bess.hairLength > 0) output(" [bess.hairColor] haired");
		else output(" silver headed");
		output(" synthetic informs you.");
		if (crew(true) == 2) output(" <i>“We could even see if we could make it a three way game, get the whole of our merry crew involved.”</i>");
		else if (crew(true) > 2) output(" <i>“We could even see if we could get the others to join in the fun.”</i>");
		
		output("\n\n<i>“Anytime you want to play a match in the holo room just come get me. I’ll boot up the program, and we can have a boot of the ol’ z-g ball.”</i>");
		
		output("\n\n<b>You can now play Graviball with [bess.name] and any of your other crew by talking to [bess.hisHer] in [bess.hisHer] companion menu!</b>");
	}
	else
	{
		output("\n\n<i>“I got bored last night, and wrote a holo room simulation for playing Graviball. If we get ourselves one, we can play a very realistic simulation of the real thing. Pitch, crowd, the whole works! Even digital teammates to fill in the gaps,”</i> the");
		if (bess.hairLength > 0) output(" [bess.hairColor] haired");
		else output(" silver headed");
		output(" synthetic informs you.");
		if (crew(true) == 2) output(" <i>“We could even see if we could make it a three way game, get the whole of our merry crew involved.”</i>");
		else if (crew(true) > 2) output(" <i>“We could even see if we could get the others to join in the fun.”</i>");
		
		output("\n\n<i>“All we need is a holo room. Simple, right? We should save up and get one on our travels so we can play a match or two.”</i>");

		output("\n\n<b>You can now play Graviball with [bess.name] and any of your other crew when your ship has a holoroom!</b>");
	}

	flags["BESS_EVENT_17"] = GetGameTimestamp();

	processTime(60+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent18():void
{
	clearOutput();
	bessHeader();

	output("You find your ship’s "+ bessCrewRole() +" sitting with what looks like a microphone. It is attached to a gigantic speaker that is in turn attached to one of the ship’s larger screens. [bess.HeShe] seems to be fiddling around with some dials, setting whatever it is up.");
	
	output("\n\nYou ask [bess.himHer] exactly what it is [bess.heShe]’s doing - a question you seem to be asking [bess.himHer] an awful lot these days ever since you encouraged [bess.himHer] to become independent. As usual, [bess.name] gives a slightly mischievous grin, spinning the microphone around by the cord as [bess.heShe] turns to you.");
	
	output("\n\n<i>“You know what this ship is missing? Singing! Every ship has to have a singing crew, those are the rules. Whether it is in space or at sea, we’re not really playing the part unless we know how to sing a shanty or two!”</i> The");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	output(" synthetic declares - you swore [bess.heShe] was over [bess.hisHer] whole nautical phase.");
	
	output("\n\n<i>“How about it, "+ bessPCName() +", care for a little bit of karaoke? I’ve got ‘Baby I Love Your Junk’ by Quantum Punch already loaded up and ready to go,”</i> [bess.name] taps the microphone, and adds, <i>“...I mean, if you’re not in the mood, we can just use it as a sound system and sit back and listen to some music, throw something on to watch and just chill. Interested?”</i>");

	flags["BESS_PC_KAREOKE_SKILL"] = rand(6);

	clearMenu();
	addButton(0, "NoWay", bessEvent18Response, "noway");
	addButton(1, "LetsGo", bessEvent18Response, "letsgo");
	addButton(2, "Watch", bessEvent18Response, "watch");
	addButton(3, "Relax", bessEvent18Response, "relax");
}

public function bessEvent18Response(response:String):void
{
	clearOutput();
	bessHeader();

	if (response == "noway")
	{
		output("You tell [bess.name] it’s really not your thing. [bess.HeShe] tries in vain to persuade you and you eventually leave. Unperturbed, [bess.heShe] sings karaoke on [bess.hisHer] own before mysteriously stopping.");
		
		output("\n\nLater you find [bess.himHer] powered down on the sofa... surely the synthetic couldn’t have fallen asleep?");

		bessAffection(-5);

		flags["BESS_EVENT_18"] = GetGameTimestamp();
		processTime(180+rand(15));

		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	else
	{
		if (response == "letsgo")
		{
			output("You decide to take [bess.name] up on [bess.hisHer] invitation and grab a microphone as [bess.heShe] throws on something random. As a video pops up on the screen, you both sing along to the words. You both belt out an impromptu duet and have a lot of fun doing it.");
			
			output("\n\n[bess.name] is a wonderful vocalist, but that’s not really surprising since [bess.hisHer] voice is naturally melodious. [bess.HeShe] seems to have masterfully synthesized qualities of all the best "+ bess.mf("male", "female") +" vocalists together into [bess.hisHer] own voice, keeping it [bess.hisHers] while improving it tenfold.");
			
			output("\n\nMost AI singers sound technically flawless, but lifeless and methodical. In contrast, when the" + (bess.hairLength > 0 ? " [bess.hairColor] haired" : "") + " synthetic sings, there is creativity, energy, and flair; both in [bess.hisHer] vocal timbre and movements. [bess.HeShe] sings with [bess.hisHer] entire body, letting the music flow through [bess.himHer] and course through [bess.hisHer] artificial skin.");

			if (flags["BESS_PC_KAREOKE_SKILL"] == 0)
			{
				output("\n\nIn radical contrast, your singing is not just bad; it’s apocalyptically awful. As you sing, you can see [bess.name] visibly cringe as [bess.heShe] tries to ignore your high pitched off-key wailing and awful timing. You’ve seen that look many a time - it’s the same way people looked at you slack jawed as you tortured birthday and holiday songs.");
				
				output("\n\nYou’re pretty sure [bess.name] turned off [bess.hisHer] audio receptors halfway through to protect [bess.hisHer] ear sensors because [bess.heShe]’s suddenly out of synch with the rhythm and [bess.hisHer] facial muscles slacken.");
				
				output("\n\nOnce you finish the song, [bess.heShe] coughs a little, putting down the microphone. It’s clear [bess.heShe]’s trying to find the best way to broach the subject of your horrendous singing voice.");
				
				output("\n\n<i>“...Well that was... um... unique.”</i> [bess.name] tiptoes around the elephant in the room. <i>“You know what? I’m thinking maybe there’s something wrong with your microphone. Let me take a look at it.”</i>");
				
				output("\n\nSeemingly unable to logically process the sheer atrocity of your singing voice, [bess.heShe] examines your microphone. After a few moments, [bess.name] does what you least expect; [bess.heShe] hands you back the device.");
				
				output("\n\n<i>“...All fixed! It was just a faulty mic, that was all, [bess.heShe] chirpily informs you, encouraging you to sing another song with [bess.himHer]. When you do you find your voice utterly transformed... you’re suddenly a singing "+ pc.mf("god", "diva") +". What the frag did [bess.heShe] do?");
			}
			else if (flags["BESS_PC_KAREOKE_SKILL"] == 1)
			{
				output("\n\nIn comparison, your singing is quite bad - but it’s karaoke, and the point isn’t whether you sound good or not. [bess.name] doesn’t seem to mind your off-key singing as [bess.heShe] grins at you. [bess.HisHer] energy is contagious, and soon you find yourself letting loose and really getting into it.");
			}
			else if (flags["BESS_PC_KAREOKE_SKILL"] == 2)
			{
				output("\n\nIn comparison, you’re pretty much the same as anyone else when it comes to singing - you sing as much in tune just as much as off tune. [bess.name] doesn’t seem to mind one bit as [bess.heShe] grins at you. [bess.HisHer] energy is contagious, and soon you find yourself letting loose and really getting into it.");
			}
			else if (flags["BESS_PC_KAREOKE_SKILL"] == 3)
			{
				output("\n\nYou’re a decent singer and you can belt out a song fairly well, especially when it comes to the kind of music that you’re singing. You sing in relative harmony with [bess.name], and [bess.heShe] grins at you; you can feel an electrifying energy taking hold. Soon you’re really letting loose and getting into it - seems the karaoke machine was a really good investment.");
			}
			else if (flags["BESS_PC_KAREOKE_SKILL"] == 4)
			{
				output("\n\nYou’re actually a very good singer; so much so that [bess.name] looks shocked when you pick up the microphone and sing in perfect tune and pitch with the music. [bess.HisHer] surprise is short lived, as [bess.heShe] seamlessly joins your solo - singing in complete harmony with your fantastic vocals.");

				output("\n\nThere’s an electrifying energy in the air as you drive each other to greater heights. Your duet reaches a massive crescendo before finishing with plenty of flourish. [bess.name] looks thoroughly impressed, [bess.hisHer] [bess.eyeColor] eyes locked on you as you catch your breath.");
				
				output("\n\n<i>“...That was fantastic, "+ bessPCName() +", I didn’t know you could sing like that!”</i> [bess.HeShe] exclaims, checking your mic for some reason. <i>“Wow! And your voice isn’t even synthesized. That’s amazing!”</i> Clearly the idea that biology gifted you with such a great singing voice is something [bess.heShe] finds quite wondrous.");
			}
			else if (flags["BESS_PC_KAREOKE_SKILL"] == 5)
			{
				output("\n\nAs you grab the mic, what comes out is the voice of a stellar music star; not just equal to the task of karaoke, but easily transcending the quality of the original song recording. Your sublime voice is enough to make angels weep. [bess.name] simply drops [bess.hisHer] microphone, letting it rattle to the ground as [bess.heShe] watches you in stunned disbelief.");
				
				output("\n\nAs you make the song your own [bess.heShe] forgets everything else, your galactic class solo blowing [bess.himHer] away. At the end of your retake on the classic song, [bess.heShe] breaks into immediate applause.");
				
				output("\n\n<i>“Oh my coders, "+ bessPCName() +", that was AMAZING! You’re as good as... no, BETTER than any singer I’ve ever heard! Why didn’t you tell me you had such an amazing gift?”</i> [bess.name] "+ bess.mf("breathlessly exclaims", "positively gushes") +". <i>“...You don’t even need to find your family fortune; you could make a career as a stellar vocalist!”</i>");
			}

			output("\n\nAfter you’ve both had enough of singing you sit down and watch music videos for a while, just enjoying each other’s company. Occasionally [bess.name] strikes up a conversation but it doesn’t feel forced, just very natural and relaxed. Eventually [bess.heShe] gives a yawn and you look at [bess.himHer] - is [bess.heShe] getting tired?");
		}
		else if (response == "watch")
		{
			output("You tell [bess.name] you’d rather watch [bess.himHer] sing than participate. [bess.HeShe] smiles coyly at you, touching the head of [bess.hisHer] microphone. <i>“...Oh, then should I sing slowly and call you ‘Mr President’?”</i>");

			output("\n\nYou’re pretty sure");
			if (pc.IQ() >= 60) output(" only you would get that archaic Marilyn Monroe reference.");
			else output(" it’s a joke, but you have no idea what [bess.heShe]’s referencing.");

			output("\n\n[bess.HeShe] throws in ");
			output(indefiniteArticle(
				RandomInCollection(
					"alternative",
					"anime",
					"blues",
					"classical",
					"country",
					"dance",
					"electronic",
					"folk",
					"hip-hop",
					"holiday",
					"inspirational",
					"opera",
					"pop",
					"rhythm & blues",
					"rock",
					"movie theme",
					"random"
				)
			));
			output(" song and begins to sing to it, clutching the microphone to [bess.hisHer] chest. You relax back and watch [bess.himHer] go - while you’re not going to get up and sing, it doesn’t mean you can’t enjoy the karaoke machine in other ways. ");

			output("\n\n[bess.name] is a wonderful vocalist, but that’s not really surprising since [bess.hisHer] voice is naturally melodious. [bess.HeShe] seems to have masterfully synthesized qualities of all the best "+ bess.mf("male", "female") +" vocalists together into [bess.hisHer] own voice, keeping it [bess.hisHers] while improving it tenfold. Most AI singers sound technically flawless, but lifeless and methodical. In contrast, when the" + (bess.hairLength > 0 ? " [bess.hairColor] haired" : "") + " synthetic sings, there is creativity, energy, and flair both in [bess.hisHer] timbre and movements. [bess.HeShe] sings with [bess.hisHer] entire body, letting the music flow through [bess.himHer] and course through [bess.hisHer] artificial skin.");

			output("\n\nYou can see [bess.hisHer] [bess.eyeColor] eyes flicking to you every now and then, eager to see the reaction on your face to [bess.hisHer] singing. You’re sure that if you weren’t here [bess.heShe]’d sing anyway, but since you are, [bess.heShe]’s singing some of these songs for your benefit. It’s different from when [bess.heShe] was programmed to bring happiness - [bess.heShe]’s doing it as a friend who wants to see you smile.");

			output("\n\nAfter singing [bess.hisHer] heart out, [bess.heShe] sits down, seemingly exhausted. You both then chill out and watch music videos for a while, just enjoying each other’s company. Occasionally [bess.name] strikes up a conversation but it doesn’t feel forced, just very natural and relaxed. Eventually [bess.heShe] gives a yawn and you look at [bess.himHer] - is [bess.heShe] getting tired?");
		}
		else if (response == "relax")
		{
			output("You tell [bess.name] you’d prefer to sit back and listen to some music with [bess.himHer] than sing, since that’s not really your thing. <i>“...Ahh well, that’s what I thought you’d say. I’ll just have to sing when you’re off the ship then.”</i> [bess.HeShe] throws on some tracks and comes to sit beside you.");
			
			output("\n\nYou both chill out and watch music videos for a while, just enjoying each other’s company. Occasionally [bess.name] strikes up a conversation but it doesn’t feel forced, just very natural and relaxed. Eventually [bess.heShe] gives a yawn and you look at [bess.himHer] - is [bess.heShe] getting tired?");
		}

		bessAffection(5);

		output("\n\n<i>“...I’m trying out this tiredness thing.”</i> [bess.name] explains to you; it seems the question doesn’t even need to be asked. <i>“After a while, my body induces a forced power conservation mode with vague periphery awareness, making me ‘sleep’ for a set amount of time. Don’t worry, my battery life is incredibly long; it takes weeks to actually run out.”</i>");
		
		output("\n\nIt seems [bess.heShe] must still be adjusting to [bess.hisHer] new ‘sleep’ cycle because later [bess.heShe] falls asleep on your shoulder, dozing happily just like anyone else. [bess.HeShe] doesn’t seem at all bothered by the ");
		output(
			RandomInCollection(
				"alternative",
				"anime",
				"blues",
				"classical",
				"country",
				"dance",
				"electronic",
				"folk",
				"hip-hop",
				"holiday",
				"inspirational",
				"opera",
				"pop",
				"rhythm & blues",
				"rock",
				"movie theme",
				"random"
			)
		);
		output(" music playing.");
		
		output("\n\nDo you move and risk waking [bess.himHer] up?");
		
		processTime(180+rand(15));

		// [Yes] [No]
		clearMenu();
		addButton(0, "Yes", bessEvent18Yes);
		addButton(1, "No", bessEvent18No);
	}
}

public function bessEvent18Yes():void
{
	clearOutput();
	bessHeader();

	output("You really have things to do, and you have no idea how long [bess.heShe]’s going to be like this. As you pull away, [bess.name] falls predictably sideways, ‘waking up’ with a sudden jolt. <i>“Zzz-wha?! What’s going on...?”</i>");
	
	output("\n\nYou take off and leave [bess.himHer] to get re-oriented with a small chuckle. [bess.name] rubs [bess.hisHer] sleepy eyes before promptly curling up and going back to sleep.");

	flags["BESS_EVENT_18"] = GetGameTimestamp();
	processTime(1);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent18No():void
{
	clearOutput();
	bessHeader();

	output("Rather than move and disturb [bess.himHer], you decide to stay put.");
	if (bess.hairLength > 0) output(" You can feel [bess.hisHer] soft synthetic hair brushing against your cheek.");
	output(" [bess.HisHer] breathing is slow, and [bess.hisHer] warm breath tickles your [pc.skin].");
	
	output("\n\nIn [bess.hisHer] slumber, [bess.hisHer] hands reach out and wrap around your arm, holding it tight against [bess.hisHer] chest. You can smell "+ bess.mf("his masculine scent", "the faint scent of synth-vanilla") +" and the beating of [bess.hisHer] artificial heart.");
	
	output("\n\nYou eventually doze off yourself, and you both sleep there, heads resting against each other. Some time later, you’re abruptly awoken when [bess.name] boots back up, shocked to find the position you are both in.");

	output("\n\n<i>“Oh my circuits! I’m so sorry, I didn’t mean to fall asleep on you!”</i> [bess.HisHer] silvery cheeks are flushed, and you can tell [bess.heShe]’s embarrassed. At the same time, [bess.heShe] does sound a little bit pleased.");
	
	bessAffection(5);

	flags["BESS_EVENT_18"] = GetGameTimestamp();
	processTime(180+rand(15));
	restHeal();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent19():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_EVENT_19_TIMES"] == undefined)
	{
		flags["BESS_EVENT_19_TIMES"] = 1;

		output("Just when it’s getting quite late [bess.name] walks up to you a little sheepishly, looking like [bess.heShe] wants to ask something. Eventually, [bess.heShe] spits it out.");
		
		output("\n\n<i>“...Um, "+ bessPCName() +", would you like to watch a scary movie with me? I’d like to experience watching one with a friend since I hear it’s one of those ‘to do’ things...”</i>");
	}
	else
	{
		flags["BESS_EVENT_19_TIMES"]++;

		output("Once again, it’s a rather late hour. [bess.name] approaches you a little shyly, a holodisk in hand.");
		
		output("\n\n<i>“H-hi, "+ bessPCName() +". I know you weren’t up for it before, but would you like to watch a scary movie with me? I was wondering if you’d changed your mind from earlier.”</i>");
	}
	
	output("\n\nHow about it - do you want to stay up late and watch spooky movies with [bess.name]?");
	
	// [Yes] [No]
	clearMenu();
	addButton(0, "Yes", bessEvent19Yes);
	addButton(1, "No", bessEvent19No);
}

public function bessEvent19No():void
{
	clearOutput();
	bessHeader();

	output("<i>“But, "+ bessPCName() +", I can’t watch them on my own - especially late at night! I mean the rotation of the sun around planetary bodies is culturally linked to monster attacks due to the decreased level of visibility.”</i>");
	
	output("\n\nIf you didn’t know any better, you’d say [bess.heShe] was "+ bess.mf("worried about watching", "scared to watch") +" them on [bess.hisHer] own.");

	// [Watch] [Don’t Watch]
	clearMenu();
	addButton(0, "Watch", bessEvent19Yes);
	addButton(1, "Don’t", bessEvent19DontWatch);
}

public function bessEvent19DontWatch():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] "+ bess.mf("curses", "huffs and stomps [bess.hisHer] foot") +". <i>“...Fine! I just won’t watch it. But this isn’t the last of it - I’ll catch you when you’re so bored you’ll have no choice but to watch one with me!”</i>");
	
	output("\n\nIt seems [bess.heShe]’s determined to tick this one off [bess.hisHer] list. You probably haven’t heard the end of it by a long shot.");

	processTime(55+rand(10));
	bessAffection(-5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent19Yes():void
{
	clearOutput();
	bessHeader();

	output("<i>“Great, I’ll grab some drinks. Oh, and some snacks!”</i> [bess.name] rushes off to grab some nibbles. Meanwhile, you sit down and throw the movie in.");
	
	output("\n\nIt seems [bess.heShe]’s picked a horror movie that involves humans, monsters, and killer robots - an interesting choice by the AI. [bess.HeShe] brings the drinks and snacks, and you sit down to enjoy what is clearly a B-grade horror holo.");
	
	output("\n\nYou’ve watched far better, but [bess.name] really seems to get into it - jumping in [bess.hisHer] seat every time a three dimensional monster leaps out at you. It’s not long until [bess.heShe]’s clasping your "+ bess.mf("hand", "arm") +", holding it tight and refusing to let go.");
	
	output("\n\nOn the screen it seems the robots and the monsters have teamed up to take down the humans, and they are now hunting them down one by one. As the main hero and heroine are being chased, [bess.heShe] tightens [bess.hisHer] grip on your "+ bess.mf("hand", "arm") +". Clearly, [bess.heShe] doesn’t want them to be caught.");
	
	output("\n\nYou can feel [bess.hisHer] synthetic heart racing against your arm, [bess.hisHer] [bess.chest] pressing against you. All of a sudden you notice [bess.name] isn’t watching the movie, instead looking right at you with a meaningful [bess.eyeColor] gaze.");
	
	output("\n\nSuddenly [bess.heShe]’s sliding over and wrapping [bess.hisHer] arms around you");
	if (bess.isFeminine()) output("r neck");
	output(", [bess.hisHer] nose brushing against yours as [bess.hisHer] soft, silver lips lock with your own. [bess.HeShe] kisses you slowly and intimately, [bess.hisHer] hands");
	if (pc.hairLength == 0) output(" stroking the back of your head");
	else output(" brushing through your [pc.hair]");
	output(" as [bess.heShe] makes out with you.");
	
	output("\n\nThis is far away from [bess.hisHer] sex routines - you can feel the burning passion behind [bess.hisHer] kiss, and it is more than just physical. What are you going to do...?");

	clearMenu();
	addButton(0, "KissMore", bessEvent19KissMore);
	addButton(1, "PullBack", bessEvent19PullBack);
	addButton(2, "I’mTaken", bessEvent19Taken);
}

public function bessEvent19KissMore():void
{
	clearOutput();
	bessHeader();

	output("You lean into [bess.hisHer] kiss, wrapping your arms around "+ bess.mf("his neck", "her waist") +" as you pull [bess.himHer] close. Your tongues passionately dance together, and the rest of the world suddenly ceases to exist. [bess.name] "+ bess.mf("kisses", "melts into your arms, kissing") +" you back with feverish urgency as you return [bess.hisHer] affections. Meanwhile, you feed off the delicious sweetness of [bess.hisHer] mouth, hungry for more.");
	
	output("\n\nIt is a long, drug-like kiss that leaves your mind spinning and your senses ablaze. You break off, only to come back for more, and [bess.heShe] gladly satisfies your searching lips. Both your tongues and your bodies are soon intertwined.");
	
	output("\n\nIt takes some time for you both to realize the holo has ended; you’re both too busy making out to even notice how much time has passed. Eventually, [bess.name] pulls away looking flustered and more than a little drunk from your kisses. [bess.HeShe] almost looks as if [bess.heShe]’s about to pass out.");
	
	output("\n\n<i>“...I... um... that was...”</i> [bess.HeShe] seems completely incapable of stringing a sentence together. You kiss [bess.himHer] again, and [bess.heShe] utterly forgets what [bess.heShe] was going to say. Instead, [bess.heShe] wraps [bess.hisHer] arms tightly around you once again.");
	
	output("\n\nBoth of you are fiercely locked in a battle of tongues, pulling each other as close as you possibly can, yet still yearning for more. You reluctantly pull back only to catch your breath, filled with an impossible, insatiable hunger for [bess.hisHer] silvery lips.");
	
	output("\n\nThere’s a small smash when one of you knocks a cup on the floor. It goes completely unnoticed as it shatters over the place. It isn’t a problem until [bess.name] notices your bleeding hand; you didn’t even realize you brushed against the broken glass.");
	
	output("\n\n<i>“Ohmycircuits - you’re hurt! Let me get something to fix that up.”</i> [bess.name] disentangles [bess.himHer]self and runs off to get the ship’s first aid kit. [bess.HeShe] cleans your wound and then wraps it up properly; just what you’d expect from a JoyCo built AI.");
	
	output("\n\nAfter that, [bess.heShe] seems quite flustered and shyly avoids your gaze. It’s not long before [bess.heShe] makes an excuse to run off, no doubt to blush somewhere in quiet. It seems in matters of the heart [bess.heShe]’s an utter novice. [bess.HisHer] abashed exit brings an end to a very interesting evening.");

	flags["BESS_EVENT_19"] = GetGameTimestamp();
	processTime(165+rand(15));
	bessAffection(15);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent19PullBack():void
{
	clearOutput();
	bessHeader();

	output("You can’t allow this to continue, and you push [bess.name] away; [bess.hisHer] half-closed lids blinking furiously as [bess.heShe] realizes what is going on. <i>“[bess.name], no, we can’t! We’re friends, and that’s all I want to be. I’m sorry... but I just don’t feel that way about you.”</i>");
	
	output("\n\nThe");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	output(" synthetic sighs, and looks down at [bess.hisHer] hands. <i>“...I-I know... I just... it’s so unfair. You’re so wonderful and kind and... all the things that I want.”</i>");
	
	output("\n\nYou explain to [bess.himHer] that you want to keep things the way they are and just be friends. [bess.name] seems to understand your feelings, but is also having a hard time dealing with the rejection - After all, you are [bess.hisHer] first love, as well as [bess.hisHer] first and best friend.");

	bessEvent19Merge();
}

public function bessEvent19Taken():void
{
	clearOutput();
	bessHeader();

	output("You can’t allow this to continue, and you push [bess.name] away; [bess.hisHer] half-closed lids blinking furiously as [bess.heShe] realizes what is going on. <i>“[bess.name], no, I can’t - I’m taken!”</i>");
	
	output("\n\nThe");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	output(" synthetic sighs, and looks down at [bess.hisHer] hands. <i>“...I-I know... I just... it’s so unfair. You’re so wonderful and kind and... all the things that I want.”</i>");
	
	output("\n\nYou explain to [bess.hisHer] that you have a lover, and you can’t betray their trust. [bess.name] seems to understand your feelings, but is also having a hard time dealing with the rejection. After all, you are [bess.hisHer] first love, as well as [bess.hisHer] first and best friend.");

	bessEvent19Merge();
}

public function bessEvent19Merge():void
{
	output("\n\n<i>“I-I’m sorry, I never should have been so selfish. I knew how you felt, I just didn’t want to believe it was the truth.”</i> Tears are running down [bess.hisHer] cheeks now as [bess.heShe] sniffs, looking up at you with glassy [bess.eyeColor] eyes. <i>“...I’m sorry, this was a terrible idea!”</i>");
	
	output("\n\n[bess.name] runs off before you can say anything more, finding a place where [bess.heShe] can be alone on the ship to pick up the pieces of [bess.hisHer] shattered synthetic heart.");

	processTime(165 + rand(15));
	flags["BESS_EVENT_19"] = GetGameTimestamp();
	flags["BESS_EVENT_19_REJECTION"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent19RejectionFollowup():void
{
	clearOutput();
	bessHeader();

	flags["BESS_EVENT_19_REJECTION"] = 2;

	output("You run across [bess.name] looking incredibly meek, head lowered, and eyes directed at the ground. [bess.HisHer] hands are clasped at [bess.hisHer] waist as [bess.heShe] fidgets with [bess.hisHer] fingers.");
	
	output("\n\n<i>“...Um, hi, "+ bessPCName() +".”</i> The tension is so thick you could cut it with a knife. [bess.name] looks terrible; [bess.heShe]’s clearly been up all night. <i>“I think... we need to talk?”</i>");
	
	output("\n\nYou both go and sit down in the dining area, and [bess.name] takes a deep breath. It seems [bess.heShe]’s trying to muster the courage to say whatever it is that [bess.heShe] wants to say.");
	
	output("\n\n<i>“...I’m sorry, "+ bessPCName() +". I put you in an awkward position, and you had no choice but to do such a difficult thing. I really can’t apologize enough for my behavior; it was completely and utterly out of line.”</i> [bess.HeShe] tells you, all the while still struggling to meet your gaze.");
	
	output("\n\n<i>“I hope – I really, really hope – that we can stay friends. I understand that what I did crossed the line. And if we can’t go back to being friends... if that’s the case, I think it is best that I leave the ship, for the both of us.”</i> [bess.name] finally manages to raise [bess.hisHer] eyes to look at you; you can see [bess.heShe]’s struggling not to tear up. <i>“...But if you want to try and go back to the way things were, I promise what happened was a once-off thing, and I will never EVER do anything like that again.”</i>");
	
	output("\n\nNote: If you choose Too Late, you sense [bess.name] will become terribly upset. [bess.HeShe] will probably choose to leave the ship.");

	clearMenu();
	addButton(0, "Friends", bessEvent19RejectionFriends);
	addButton(1, "TooLate", bessEvent19RejectionTooLate);
}

public function bessEvent19RejectionTooLate():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] it is too late and things can’t return to the way they were. The "+ bess.mf("male synthetic begins to tear up, trying in vain to control his tears", "synthetic girl begins to sob uncontrollably, holding [bess.hisHer] hands over [bess.hisHer] eyes in a futile effort to hide [bess.hisHer] tears") +". Apparently it is set on reflex now, because [bess.heShe] doesn’t seem to be able to stop crying for quite some time.");
	
	output("\n\nAs [bess.heShe] finally manages to catch [bess.hisHer] breath about twenty minutes later, [bess.heShe] wipes away [bess.hisHer] tears and stands up. <i>“...I... Thank you. Thank you for being my friend, if just for a little while, and teaching me to be my own person. Thank you for watching TV with me. Thank you for encouraging me to read books. Thank you for telling me about yourself. Even if we part ways now, what you have given me is an irreplaceable treasure that I can never, ever repay you for.”</i>");
	
	output("\n\n[bess.name] then goes to collect [bess.hisHer] things and leave the ship. You’re parting ways and after last night, it is probably for the best. Where the sapient AI will go from now is anyone’s guess, but no doubt it will be a difficult path filled with many hardships.");
	
	output("\n\n(<b>[bess.name] is no longer on your crew. You can find [bess.himHer] again in Tavros Station.</b>)");

	processTime(15+rand(5));

	flags["BESS_LOCATION"] = BESS_AT_TAVROS;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent19RejectionFriends():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that despite what happened you are still friends and that hasn’t changed. [bess.HeShe] lets out a "+ bess.mf("large sigh of relief", "sob of relief at your words") +". Clearly what happened has been weighing on [bess.hisHer] mind, as well as the possibility of leaving the ship. [bess.HeShe] then gives you a tight hug, happy that you’ve made up.");
	
	output("\n\n<i>“Okay... from now on, I’m just [bess.name], your friend!”</i> [bess.HeShe] states resolutely, probably as much for [bess.hisHer] benefit as for yours. You’re pretty sure things are going to get back to normal, though it may still take a couple more days for all the awkwardness to dissipate.");

	processTime(55+rand(10));
	flags["BESS_JUST_A_FRIEND"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent20():void
{
	clearOutput();
	bessHeader();

	output("The next few days are very unusual. Whenever you go to find [bess.name] [bess.heShe]’s either nowhere to be seen or [bess.heShe]’s on [bess.hisHer] way to doing something, keeping [bess.himHer]self occupied with [bess.hisHer] duties as the ship’s "+ bessCrewRole() +".");
	
	output("\n\nOnce, you almost managed to broach the subject, but as soon as you did, the ship’s sprinkler system abruptly went off. Not only were you soaked from head to toe - along with everything");
	if (crew(true) > 1) output(" and everyone");
	output(" else - [bess.name] seized the opportunity to escape the conversation. The timing was so convenient that you strongly suspect it was pre-programmed by the slippery AI.");
	
	output("\n\nWhen you go to [bess.hisHer] room, you find a ton of recently purchased books about romance - specifically the forbidden kind between humans and machines. They all look as if they’ve been read and are strewn about the room in an uncharacteristically messy way. To read this many books in such a short time - has [bess.heShe] even powered down since you both kissed?");
	
	output("\n\nYour question is soon answered when you find [bess.himHer] collapsed on a sofa. [bess.HisHer] shutdown routine seems to have kicked in, and [bess.heShe]’s out cold. [bess.HisHer] JoyCord has connected automatically to a nearby socket in order to charge [bess.hisHer] batteries, much the same way as when you first met [bess.himHer].");
	
	output("\n\nSince [bess.heShe] can’t get away, you stay there until [bess.heShe] wakes up. When [bess.heShe] does, [bess.name] looks at you with a trapped look. Clearly [bess.heShe] doesn’t have any new ‘sprinkler’ tricks up [bess.hisHer] sleeve this time.");
	if (bess.hasWings()) output(" [bess.HisHer] [bess.wings] flap a little, almost as if weighing up [bess.hisHer] odds of flying out of the situation.");

	if (pc.isNice())
	{
		output("\n\n<i>“...[bess.name], I know you haven’t powered down in over a week. Don’t you think we should talk about what happened?”</i> You choose your words as carefully as possible, hoping that [bess.heShe] doesn’t bolt off again.");
	}
	else if (pc.isMischievous())
	{
		output("\n\n<i>“...What you did with the sprinkler system was funny, but this is seriously getting out of hand. Don’t you think we should talk about this?”</i> You lightheartedly remark. If [bess.heShe] tries to bolt again, maybe a flying tackle is in order.");
	}
	else
	{
		output("\n\n<i>“...Enough of this ridiculousness! We’re having this out right now. No sprinkler systems, no running away. If you try and bolt, I swear I’ll fly tackle you.”</i> You grumpily inform [bess.himHer] - it took ages to clean up the ship after [bess.hisHer] stunt.");
	}

	output("\n\nRetracting [bess.hisHer] tail and looking sheepish, [bess.name] turns [bess.hisHer] gaze upwards towards you. [bess.HisHer] [bess.eyeColor] eyes are wavering, yet [bess.heShe] seems ready to finally talk. <i>“...I-I-I’m sorry, I guess I have been going a little crazy since that... when we... kissed.”</i> With the way [bess.hisHer] cheeks flush, you wouldn’t think [bess.heShe] was an AI designed purely for sex.");
	
	output("\n\n<i>“...I’ve been reading, and the more I’ve read, the more it has become clear that my feelings for you... they are more than just that of friendship.”</i>");

	if (pc.isNice())
	{
		output("\n\nYou nod, letting [bess.himHer] finish speaking. Honestly, it was kind of obvious - but you don’t say that out loud.");
	}
	else if (pc.isMischievous())
	{
		output("\n\n<i>“Well, yeah, I gathered that from the kiss...”</i> You remark dryly.");
	}
	else
	{
		output("\n\n<i>“No fragging way, really? I thought you just fell on my face by accident.”</i> You gruffly remark, not one for dancing around the subject.");
	}

	output("\n\n[bess.HeShe] flushes and continues speaking, [bess.hisHer] hands balling up on [bess.hisHer] lap. <i>“For the longest time, I have been feeling this indefinable, unquantifiable error in my emotional subsystems. Despite it making my processes completely illogical and making me feel as if my systems are either about to shut down or go into overdrive whenever I even think of you, I have never been able to bring myself to delete it.”</i>");
	
	output("\n\n<i>“Without being able to define, measure, or quantify this thing... for some reason I know that it is more important than my operational life span, and it is incredibly precious to me. Logic tells me to delete it, while my ‘heart’ cannot even bear the thought.”</i>");
	
	output("\n\n<i>“Living with this error is terrifying, yet the mere thought of living without it is even more so. It was only recently that I was able to identify this errant data as my feelings for you - something I hold dearer to me than my life itself. And that’s when I realized that... that... that I love you "+ bessPCName() +"!”</i> [bess.name] stammers out, confessing [bess.hisHer] heart-felt feelings for you.");

	//[AlsoLove] [Reject]
	clearMenu();
	addButton(0, "AlsoLove", bessEvent20Love);
	addButton(1, "Reject", bessEvent20Reject);
}

public function bessEvent20Reject():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that while you kissed [bess.himHer], you simply don’t feel the same way. Your words appear to be utterly soul crushing, and [bess.hisHer] lower lip begins to tremble; [bess.hisHer] heartfelt confession being rejected in the worst way possible.");
	
	output("\n\n<i>“I-I’m sorry, I never should have been so selfish. I thought... I mean from the kiss... but I think deep down I knew...”</i> Tears are running down [bess.hisHer] cheeks now as [bess.heShe] sniffs, looking up at you with glassy [bess.eyeColor] eyes. <i>“...I’m sorry, I can’t do this!”</i>");
	
	output("\n\n[bess.name] runs off before you can say anything more, finding a place where [bess.heShe] can be alone on the ship to pick up the pieces of [bess.hisHer] shattered synthetic heart.");

	flags["BESS_EVENT_19_REJECTION"] = 1;

	processTime(55+rand(10));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent20Love():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that you love [bess.himHer] and feel the exact same way. The");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	output(" synthetic stares at you with a shocked expression - clearly [bess.heShe] didn’t expect you to return [bess.hisHer] feelings.");
	
	output("\n\n<i>“...B-b-but loving me means you’ll be subject to ridicule, you’ll be called a toaster-head; you might even get lynched!”</i> [bess.name] exclaims, clearly worried that your feelings might lead to your harm.");
	
	output("\n\n<i>“A human and a machine can’t be together - are you sure you really want to fall for someone like me, a mere synthetic AI?”</i>");

	//[JustKiss] [Repeat] [Chasten] [Reconsider]
	clearMenu();
	addButton(0, "JustKiss", bessEvent20More, "kiss");
	addButton(1, "Repeat", bessEvent20More, "repeat");
	addButton(2, "Chasten", bessEvent20More, "chasten");
	addButton(3, "Reconsider", bessEvent20Reconsider);
}

public function bessEvent20Reconsider():void
{
	clearOutput();
	bessHeader();

	output("... On second thought, you realize you haven’t thought this entirely through; you don’t really want to be made fun of or even attacked. You tell [bess.name] that you’ve reconsidered, and you can see [bess.hisHer] panic ease.");
	
	output("\n\n<i>“...Good. Good. That’s that then; we’ll just be friends.”</i> [bess.name] states, looking torn all the while. <i>“...It’s better for your safety. I can’t allow you to be hurt over someone like me.”</i>");
	
	output("\n\nThe sombre air continues until you both leave in silence. You’ve avoided potential ridicule, but have you lost the chance for something special in the process?");

	flags["BESS_EVENT_20"] = GetGameTimestamp();
	flags["BESS_JUST_A_FRIEND"] = 1;

	processTime(55+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent20More(response:String):void
{
	clearOutput();
	bessHeader();

	if (response == "chasten") output("<i>“You idiot. You think I can stop loving you, just like that? You don’t get a choice in the matter.”</i> You lovingly chasten [bess.name], and [bess.hisHer] eyes shoot wide open at your words. <i>“...Now come over here so I can kiss you!”</i>");
	else if (response == "repeat") output("<i>“I said that I love you, how many times are you going to make me say it? I know all of that, and I still love YOU, [bess.name].”</i> You make sure it sinks in, as [bess.hisHer] eyes shoot wide. [bess.HeShe] slowly moves closer to you, it’s as if [bess.heShe]’s scared this is all a dream that will end any moment now.");
	else output("Rather than tell [bess.himHer] you love [bess.himHer] with words, you decide to take action instead. You charge forward and grab [bess.himHer] firmly in your arms - and while [bess.hisHer] eyes shoot wide open, [bess.heShe] doesn’t resist you.");

	output("\n\nYou draw [bess.name] close and kiss [bess.himHer]. At first the kiss is gentle, but as [bess.heShe] returns your affections, it becomes sensual. [bess.HisHer] arms snake around your waist as [bess.heShe] pulls [bess.himHer]self close to you. You can feel warm wet tears brushing your cheeks, though you know these are tears of [bess.name]’s happiness, as [bess.heShe] clutches you as tight as [bess.heShe] possibly can.");
	
	output("\n\nIt is a lot more drawn out and heartfelt than the kiss you shared that night a week ago. This is a kiss that confirms your deep and powerful feelings for each other, not just a burst of uncontrollable passion.");
	
	output("\n\nBefore you know it, [bess.name] is slowly leading you back to [bess.hisHer] bedroom, though it does take you a moment to realize it. [bess.HeShe] answers your unspoken question as if reading your mind.");
	
	output("\n\n<i>“...I want to do it like lovers do. I’ve never done it like that before.”</i> [bess.HeShe] asks you, for once completely unabashed. [bess.HisHer] eyes stare at you full of honest feelings, as [bess.heShe] pulls you into [bess.hisHer] quarters.");
		
	// An intimate sex scene is now played from the sex doc, and the intimate sex is unlocked for the player.
	clearMenu();
	if (pc.hasCock())
	{
		addButton(0, "Next", bessIntimateGiveDoggy, true);
	}
	else if (bess.hasCock())
	{
		addButton(0, "Next", bessIntimateGetDoggy, true);
	}
	else
	{
		addButton(0, "Next", bessIntimateGetOral, true);
	}
}

public function bessEvent20PostSex():void
{
	output("\n\nAfter your ardent love-making, you both fall asleep in each other’s arms, completely and deliciously spent.");

	flags["BESS_EVENT_20"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", bessEvent21);
}

public function bessEvent21():void
{
	clearOutput();
	bessHeader();

	output("You wake up with [bess.name] still wrapped around your waist. [bess.HisHer] cute sleeping face is pressed up against your cheek, [bess.hisHer] gentle breathing tickling your [pc.skin].");

	if (bess.hairLength > 0)
	{
		output("\n\n[bess.name]’s [bess.hairColor] hair is gently brushing up against you, right now looking wild and untamed. The faint scent of synth-vanilla, satisfyingly mild yet smooth, fills the air.");
	}

	output("\n\nIt seems like such a shame to wake [bess.himHer] up, but you DO need to get up sooner or later. Eventually you’re going to need to go to the bathroom, though thankfully you don’t need to go right now. The question is, how to wake [bess.himHer] up?");

	//[Kiss] [Nudge] [Talk] [LetSleep]
	clearMenu();
	addButton(0, "Kiss", bessEvent21Kiss);
	addButton(1, "Nudge", bessEvent21Nudge);
	addButton(2, "Talk", bessEvent21Talk);
	addButton(3, "LetSleep", bessEvent21Sleep);
}

public function bessEvent21Kiss():void
{
	clearOutput();
	bessHeader();

	output("Much like a fairytale prince"+ bess.mf("", "ss") +", you bring your lips to [bess.hisHers] and kiss [bess.himHer] awake. As soon as your lips touch [bess.hisHers] , [bess.heShe] presses against you, instinctively seeking out your mouth despite being half asleep. <i>“...Mmm... "+ bessPCName() +"...”</i>");
	
	output("\n\nBefore you know it, [bess.hisHer] arms are wrapping around your neck and pulling you down into a proper kiss. You have no idea if [bess.heShe]’s woken up yet or not, but does it really matter? You kiss [bess.himHer] back just as enthusiastically. It really is a fantastic way to start your morning.");
	
	output("\n\nWhen you eventually part, [bess.heShe]’s looking up at you with a cheeky look in [bess.hisHer] [bess.eyeColor] eyes, clearly awake now and thrilled with the way it happened. <i>“Can I boot up every morning like that?”</i> [bess.HeShe] asks, batting [bess.hisHer] long black lashes at you. [bess.HeShe] looks more than a little drunk off your intoxicating kisses.");

	bessEvent21Merge();
}

public function bessEvent21Nudge():void
{
	clearOutput();
	bessHeader();

	output("You gently nudge [bess.himHer], and [bess.heShe] mumbles in protest, clearly not wanting to get up. You poke [bess.himHer] again and [bess.heShe] fidgets. <i>“...I’ll boot up fully in a second, just let me run a few more... system checks...”</i> [bess.HeShe] nuzzles into the nook of your arm.");
	
	output("\n\nYou make sure [bess.heShe] doesn’t go back to sleep, and eventually [bess.hisHer] eyes flutter open. For someone who doesn’t need to sleep [bess.heShe] seems to enjoy sleeping in quite a bit, or maybe it’s just being in your arms. <i>“...Mmm, it’s morning already?”</i>");

	bessEvent21Merge();
}

public function bessEvent21Talk():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] to wake up. At first [bess.heShe] pretends not to hear you, then [bess.heShe] fidgets a bit at the sound of your voice. <i>“...I’ll boot up fully in a second, just let me run a few more... system checks...”</i> [bess.HeShe] nuzzles into the nook of your arm.");
	
	output("\n\nYou call [bess.hisHer] name again, and [bess.hisHer] eyes flutter open as [bess.heShe] lets out a sleepy yawn. For someone who doesn’t need to sleep [bess.heShe] seems to enjoy sleeping in quite a bit, or maybe it’s just being in your arms. <i>“...Mmm, it’s morning already?”</i>");

	bessEvent21Merge();
}

public function bessEvent21Sleep():void
{
	clearOutput();
	bessHeader();

	output("You decide to let [bess.name] sleep a little longer. [bess.HeShe] nuzzles into the nook of your arm and continues to doze. You just watch [bess.himHer] quietly until [bess.heShe] finally lets out a long yawn - seems like [bess.heShe]’s starting to wake up.");
	
	output("\n\n<i>“...Mmm, is it morning already?”</i> [bess.name] sleepily asks you, [bess.hisHer] long black lashes fluttering all the while. Once [bess.heShe]’s fully awake, [bess.heShe] looks up at you and gives you a sweet little kiss - somehow [bess.heShe] must have realized you have been awake for quite a while.");

	bessEvent21Merge();
}

public function bessEvent21Merge():void
{
	if (pc.hasCock() && bess.hasVagina())
	{
		output("<i>“...Ouch! I’m all sore.”</i> [bess.name] rubs [bess.hisHer] thighs together and winces a little. <i>“It seemed so romantic in my romance novels - and I’m happy I did it - but right now it just hurts. Why were you organics designed like this?”</i>");
		
		output("\n\nYou chuckle a little bit and [bess.heShe] scowls, hitting you with a pillow. [bess.HisHer] cute attempts to chastise you make you grin even more, which leads to even more pillow batting until [bess.heShe] gives up in a huff. <i>“I’m too sore to hit you any longer!”</i> [bess.name] whines. [bess.HeShe] could always turn [bess.hisHer] pain sensors off, but [bess.heShe] is far too stubborn for that.");
		
		output("\n\n");
	}

	output("Before you both get up and get dressed, [bess.name] looks at you as if [bess.heShe] wants to talk about something. You ask [bess.himHer] what [bess.heShe] wants to talk about - whatever it is, it seems kind of important.");
	
	output("\n\n<i>“...Well, um... I’m new to this whole relationship thing... but from what I’ve read, we’re supposed to have ‘a talk’ about what exactly ‘this’ is.”</i> [bess.name] looks at you quite seriously; [bess.heShe]’s sitting on the bed with [bess.hisHer] hands in [bess.hisHer] lap. <i>“My research showed there are a number of relationship definitions, and I was wondering which one we fall under.”</i>");
	
	output("\n\n<i>“Are we lovers? We are in love, after all, which I think is the only criteria needed. Am I your lover? Your "+ bess.mf("boyfriend", "girlfriend") +"? Your partner...?”</i>");

	bessEvent21RoleSelect();
}

public function bessEvent21RoleSelect():void
{
	clearMenu();
	addButton(0, "Lover", bessEvent21RelationshipResponse, "lover");
	addButton(1, bess.mf("Boyfriend", "Girlfriend"), bessEvent21RelationshipResponse, bess.mf("boyfriend", "girlfriend"));
	addButton(2, "Partner", bessEvent21RelationshipResponse, "partner");
	addButton(3, "Companion", bessEvent21RelationshipResponse, "companion");
	addButton(4, "Concubine", bessEvent21RelationshipResponse, "concubine");
	addButton(5, "Consort", bessEvent21RelationshipResponse, "consort");
	addButton(6, "Sub", bessEvent21RelationshipResponse, "sub");
	addButton(7, "Pet", bessEvent21RelationshipResponse, "pet");
	addButton(8, bess.mf("Husbando", "Waifu"), bessEvent21RelationshipResponse, bess.mf("husbando", "waifu"));
	addButton(9, bess.mf("Dom", "Domme"), bessEvent21RelationshipResponse, bess.mf("dom", "domme"));
	if (bess.isFeminine()) addButton(10, "Mistress", bessEvent21RelationshipResponse, "mistress");
}

public function bessEvent21RelationshipResponse(response:String):void
{
	clearOutput();
	bessHeader();
	
	flags["BESS_LOVER"] = 1;
	flags["BESS_LOVER_STATUS"] = response;

	if (response == "lover" || response == "girlfriend" || response == "boyfriend" || response == "consort" || response == "partner")
	{
		output("<i>“" + StringUtil.capitalize(bessLoverStatus()) + "?”</i> [bess.name] repeats it, a big grin spreading across [bess.hisHer] face. <i>“I’m your " + bessLoverStatus() + ". I am "+ bessPCName() +"’s " + bessLoverStatus() + ". I like the sound of that. I really think I could say that all day.”</i>");
	}
	else if (response == "companion")
	{
		output("<i>“Companion? Sounds like I’m supposed to follow you around on your adventures through space and time.”</i> [bess.name] has clearly been watching too much classic sci-fi. <i>“...You know what? I think that works. Your companion, that is, "+ bessPCName() +"’s Companion... I like the sound of that... as long as I’m not the tin dog.”</i>");
	}
	else if (response == "waifu" || response == "husbando")
	{
		output("<i>“...I’m your, "+ bess.mf("husband, oh", "what-foo-") +"?”</i> [bess.name] quirks an eyebrow, clearly not getting your meaning. <i>“Oh, " + bessLoverStatus() + "! ... I still don’t get it, but it sounds kind of cute, like a pet name.”</i> [bess.HeShe] grins. <i>“...Okay, from now on, I’m your " + bessLoverStatus() + "! That is, "+ bessPCName() +"’s " + bessLoverStatus() + "... I like the sound of that. Cute!”</i>");
	}
	else if (response == "concubine")
	{
		output("<i>“...Wha... your Concubine? Like as in, part of a harem?!”</i> [bess.name] exclaims in surprise, obviously this had not crossed [bess.hisHer] mind. <i>“I mean, I know your sex drive is... ample... and you require an awful lot of breeding relief... I suppose it’s possible to love your concubine, right? And... you know... a concubine can be happy... I guess that’s not such a bad lot to have...”</i>");
		
		output("\n\nAfter a lot of thought, [bess.name] makes up [bess.hisHer] mind and nods. <i>“...Alright, I’ll be your concubine. That is, "+ bessPCName() +"’s concubine. That actually doesn’t sound bad - as long as you promise to treat me right.”</i>");
	}
	else if (response == "mistress")
	{
		output("<i>“...Wha... your mistress? Like as in, the OTHER woman?!”</i> [bess.name] exclaims in surprise, obviously this had not crossed her mind.");
		
		output("\n\n<i>“I mean, I know you sleep with other people... and I suppose the galaxy never will legally accept me as your... you know... so I always will be considered your mistress or concubine. And being a mistress isn’t that different from being a wife - a lot of people loved their mistresses more than their wives, and took better care of them...”</i>");
		
		output("\n\nAfter a lot of thought, [bess.name] makes up her mind and nods. <i>“...Alright, I’ll be your mistress. That is, "+ bessPCName() +"’s mistress. That actually doesn’t sound bad - as long as you promise to treat me right.”</i>");
	}
	else if (response == "pet" || response == "sub" || response == "dom" || response == "domme")
	{
		output("<i>“Whaa?! Your "+ bessLoverStatus().toUpperCase() +"?”</i> [bess.name] exclaims in surprise, obviously this had not crossed [bess.hisHer] mind. <i>“...Like as in,");
		if (response.indexOf("dom") != -1) output(" order you around, and you follow me about?”</i>");
		else output(" follow you around and do whatever you say?”</i>");
		
		output("\n\nOnce [bess.heShe] calms down, [bess.heShe] gives the matter a little bit more thought. <i>“...I suppose I’m not entirely surprised. I can’t deny the idea has a certain... appeal to it.”</i> [bess.HeShe] pauses. <i>“...Alright, I’ll be your "+ bessLoverStatus() +". But only some of the time - we’ll see, this isn’t a 24/7 arrangement. Doing that </i>full time<i> isn’t what I want. Are you okay with that?”</i>");
		
		output("\n\nIf you say yes to [bess.name] being your "+ bessLoverStatus() +", [bess.heShe] will <b>always</b> be");
		if (response.indexOf("dom") != -1) output(" dominant");
		else output(" submissive");
		output(" when you’re having sex. Are you okay with this?");

		clearMenu();
		addButton(0, "Yes", bessEvent21SelectionConfirmed, true);
		addButton(1, "No", bessEvent21RoleSelect);
		return;
	}

	bessEvent21SelectionConfirmed();
}

public function bessEvent21SelectionConfirmed(bNewScene:Boolean = false):void
{
	if (bessLoverStatus() == "pet" || bessLoverStatus() == "sub") flags["BESS_SEX_ROLE"] = 2;
	else if (bessLoverStatus().indexOf("dom") != -1) flags["BESS_SEX_ROLE"] = 1;

	if (bNewScene)
	{
		clearOutput();
		bessHeader();
	}
	else
	{
		output("\n\n");
	}

	output("[bess.name] then scootches over to you, wrapping [bess.hisHer] arms around your neck. [bess.HisHer] [bess.eyeColor] eyes are alight and more than a little bit playful. <i>“...Sooo, as your " + bessLoverStatus() + ", I think I get a few perks? Like kisses for example. I’m pretty sure your " + bessLoverStatus() + " gets kisses whenever [bess.heShe] wants them. That’s in the rulebook.”</i>");
	
	output("\n\nBefore you can say anything about this mysterious rulebook, [bess.heShe]’s cheekily stealing a kiss from you. <i>“...All mine! Kind of. I know you require a LOT of breeding relief - I was built to understand that after all - but I get your heart, okay? Not like your actual, physical heart. You need that. Keep that safe. For me.”</i> [bess.HeShe] pats your chest.");

	clearMenu();
	addButton(0, "GotMine", bessEvent21GotMine, undefined, "Got My Heart", "You tell [bess.name] [bess.heShe] owns your heart, and you won’t be falling in love with others.");
	addButton(1, "Poly", bessEvent21Poly, undefined, "Polyamorous", "You tell [bess.name] you’re polyamorous, so you can’t promise you won’t fall in love with others.");
}

public function bessEvent21GotMine():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that [bess.heShe] has your heart, and [bess.heShe] grins ear to ear. [bess.HeShe] kisses you again and then gives you a giddy hug. <i>“...Right - your heart of Steele belongs to me! Makes sense to give it to a synthetic after all - I’ll take good care of it.”</i>");
	
	output("\n\nNow that the matter is settled, [bess.heShe] nuzzles your nose, lavishing you with affection; at least until hunger puts a stop to it. As [bess.heShe] prepares breakfast for you - pre-packaged of course - [bess.heShe] hums to [bess.himHer]self. Occasionally you can hear [bess.himHer] murmuring <i>“..."+ bessPCName() +"’s " + bessLoverStatus() + "...”</i> to [bess.himHer]self when [bess.heShe] thinks you can’t hear [bess.himHer].");

	flags["BESS_EVENT_21"] = GetGameTimestamp();
	flags["BESS_POLY"] = 1;
	bessAffection(10);

	processTime(12 * (58 + rand(4)));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent21Poly():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that you cannot promise to love [bess.himHer] and [bess.himHer] alone, since you’re polyamorous. [bess.name] blinks and looks you over. <i>“...Really? I had no idea. Loving one person is intense, how can you love more than one without going nuts?”</i> Given the whirlwind of emotions [bess.heShe]’s been feeling lately, no doubt being able to be in love with multiple people is an extraordinary thing to [bess.himHer].");
	
	output("\n\n<i>“...Well, I suppose I’m not one to judge, and I love you. So... I guess as long as you don’t love me any less, and you don’t abandon me for some other sex-bot, it’s fine. It’s definitely not my first preference. Does that mean I can see other people, if I fall in love with them?”</i>");
	
	output("\n\nIt sounds more like a hypothetical question, [bess.name] is clearly in love with only you and may always be that way. But when it comes to other crew or people outside the ship, do you trust [bess.himHer] to fall in love with them and stay true to you?");
	//[Yes] [No]
	clearMenu();
	addButton(0, "Yes", bessEvent21YesPoly);
	addButton(1, "No", bessEvent21NoPoly);
}

public function bessEvent21YesPoly():void
{
	clearOutput();
	bessHeader();

	output("<i>“Good. I highly doubt it, loving just you drives me crazy enough, but I’d hate for things to be uneven!”</i> Apparently it was a logic error for the AI.");

	output("\n\nNow that the matter is settled, [bess.heShe] nuzzles your nose, lavishing you with affection; at least until hunger puts a stop to it. As [bess.heShe] prepares breakfast for you - pre-packaged of course - [bess.heShe] hums to [bess.himHer]self. Occasionally you can hear [bess.himHer] murmuring <i>“..."+ bessPCName() +"’s " + bessLoverStatus() + "...”</i> to [bess.himHer]self when [bess.heShe] thinks you can’t hear [bess.himHer].");

	flags["BESS_EVENT_21"] = GetGameTimestamp();
	flags["BESS_POLY"] = 2;
	processTime(12 * (58 + rand(4)));
	bessAffection(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent21NoPoly():void
{
	clearOutput();
	bessHeader();
	
	output("You tell [bess.himHer] that while you can fall in love with other people, you don’t want [bess.himHer] to do the same. [bess.name] furrows [bess.hisHer] brow and stares at you with a clearly disapproving look. You’ve never seen [bess.himHer] give such a look before.");

	output("\n\n<i>“That doesn’t compute at all! Why is it okay for you and not me? If you get to love whoever you want, then I get to love whoever I want.”</i>");
	
	output("\n\nIt doesn’t sound like [bess.heShe]’s going to budge on this. What do you decide?");
	
	//[Exclusive] [Mutual] [Break Up] 
	clearMenu();
	addButton(0, "Exclusive", bessEvent21GotMine, undefined, "Exclusive", "You decide to be sexually open with your relationship, but both [bess.name] and you are romantically exclusive.");
	addButton(1, "Mutual", bessEvent21YesPoly, undefined, "Mutual", "Both you and [bess.name] are in a polyamorous relationship.");
	addButton(2, "BreakUp", bessEvent21BreakUp, undefined, "Break Up", "Break up with [bess.name]. This will probably have serious after-effects...");
}

public function bessEvent21BreakUp():void
{
	clearOutput();
	bessHeader();

	output("Hearing that you don’t want to have a relationship is absolutely soul-crushing for [bess.name]; even more so since you just professed your love and slept with [bess.himHer]. There are tears and yelling - it’s a catastrophic whirlwind for a while - before [bess.heShe] starts packing up to leave the ship.");
	
	output("\n\nBefore you know it, there’s silence, and [bess.name] has left to who knows where. You have no idea where [bess.heShe] went, or if you’ll ever see [bess.himHer] again.");
	
	output("\n\n(<b>[bess.name] is no longer on your crew. You can find [bess.himHer] again in Tavros Station.</b>)");
	
	processTime(12 * (58 + rand(4)));
	flags["BESS_JUST_A_FRIEND"] = 1; // 9999 ??
	flags["BESS_LOCATION"] = BESS_AT_TAVROS;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent22():void
{
	clearOutput();
	bessHeader();

	output("Your " + bessLoverStatus() + " [bess.name] approaches you when you’ve got a spare moment. There’s a hopeful look in [bess.hisHer] eyes, and [bess.hisHer] hands are a bit fidgety.");
	
	output("\n\n<i>“Um... so, "+ bessPCName() +", I was thinking about our sleeping arrangements. Currently, I’ve got my own room, which is nice, but it’s kind of far from you and that’s not so nice.”</i>");
	
	output("\n\n<i>“I was thinking, as your " + bessLoverStatus() + ", shouldn’t I sleep with you? I-I mean next to you! Not that I don’t sleep with you... I think I should sleep with and next to you!”</i> [bess.name] tumbles over [bess.hisHer] words, flushing all the while. Clearly, sleeping alone and far from you has been bothering [bess.himHer].");

	clearMenu();
	addButton(0, "SleepWith", bessEvent22SleepWith);
	addButton(1, "Don’t", bessEvent22DontSleepWith);
}

public function bessEvent22SleepWith():void
{
	clearOutput();
	bessHeader();

	output("<i>“You can sleep with me, "+ bessName() +".”</i> You give your answer, and [bess.name] looks overjoyed to hear your words. [bess.HeShe] immediately gives you a tight hug and begins to bounce up and down - this was clearly what [bess.heShe] was hoping for.");
	
	output("\n\n<i>“ YES! I mean, um, that’s great! I know my JoyCord can reach the power socket in your room, so that’s not a problem. I’ll just move in some of my things!”</i> Considering how many ‘things’ [bess.name] owns, you wonder how packed your room is going to be once [bess.heShe]’s finished moving everything in.");
	
	output("\n\n<b>[bess.name] will now share your quarters and sleep in them. You can toggle this on or off via [bess.hisHer] discussion menu.</b>");

	flags["CREWMEMBER_SLEEP_WITH"] = "BESS";
	flags["BESS_EVENT_22"] = GetGameTimestamp();
	bessAffection(5);

	processTime(55 + rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent22DontSleepWith():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.himHer] you don’t want [bess.himHer] sleeping with you, and you can see the disappointment written all over [bess.hisHer] face. <i>“...Maybe give it some thought? I’ll sleep in my own room for the time being.”</i> This was clearly not the result [bess.heShe] was hoping for.");
	
	output("\n\nYou sense that you’ve hurt [bess.hisHer] feelings, and this may impact your relationship a little.");
	
	output("\n\n<b>You can now select to sleep with [bess.name] via [bess.hisHer] discussion menu!</b>");

	flags["BESS_EVENT_22"] = GetGameTimestamp();
	bessAffection(-5);

	processTime(55+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent23():void
{
	clearOutput();
	bessHeader();

	output("You notice that ever since [bess.name] started sleeping with you, the number of books in your room has slowly begun to accumulate. The bedroom dresser on [bess.hisHer] side has become cluttered with novels and novellas.");
	
	output("\n\nWhen the books threaten to reach the bedside light, you finally broach the subject; any higher and there’s a real chance the bed will catch fire.");
	
	output("\n\n<i>“...But what if I really, really need to read Robinson Crusoe and you’re already asleep? I’d have to wake you up!”</i> [bess.name] reasons.");

	// [FootDown] [LetCont]
	clearMenu();
	addButton(0, "FootDown", bessEvent23FootDown, undefined, "Foot Down", "Put your foot down. Clean up that clutter!");
	addButton(1, "LetCont.", bessEvent23LetContinue, undefined, "Let Continue", "Let it continue. It’s not that big of a problem.");
}

public function bessEvent23FootDown():void
{
	clearOutput();
	bessHeader();

	output("You put your foot down and tell [bess.himHer] [bess.heShe]’s going to have to just select a few favorites and keep them there; not an entire bookshelf. [bess.HeShe] pouts and begins to shuffle through them. <i>“...But... I love them all! ...I love you more, though.”</i>");
	
	output("\n\n[bess.HeShe] decides on a handful of books and keeps them in the bedside drawer, putting the rest close by. <i>“...Maybe if I learn to grab books with my JoyCord, I won’t need to get out of bed?”</i>");

	flags["BESS_EVENT_23"] = GetGameTimestamp();
	processTime(55+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent23LetContinue():void
{
	clearOutput();
	bessHeader();

	output("You let the avid bibliophile continue in [bess.hisHer] book-hoarding ways, despite what space health and safety officials might say about the situation. [bess.name] grins and hugs you, glad that you caved.");

	output("\n\n<i>“Great! Now that I know you’re okay with it, I can put a few more next to the bed. I’m really interested in ‘Alice’s Adventures in Wonderland’, I can’t wait to see if she escapes!”</i>");

	flags["BESS_EVENT_23"] = GetGameTimestamp();
	processTime(55 + rand(10));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent24():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] walks up to you");
	if (!(bess.armor is EmptySlot)) output(" in [bess.hisHer] [bess.armor]");
	output(" and wraps [bess.hisHer] arms around your neck. [bess.HeShe] kisses you squarely on the lips, but when [bess.heShe] pulls back you notice a twinkling in [bess.hisHer] [bess.eyes]. <i>“...You know, "+ bessPCName() +", I think there’s something we should discuss. It’s very, very important.”</i>");
	
	output("\n\nWondering what the heck it could be, you ask. <i>“What did you want to talk about, "+ bessName() +"?”</i> All the while [bess.heShe] is nuzzling you with [bess.hisHer] nose - the");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	output(" synthetic is clearly trying to butter you up for something.");

	if (bessLoverStatus() == "pet")
	{
		output("\n\n<i>“...I may be your pet, but even pets get walks. But even better than a walk, I would like a date. I am not referring to the fruit of course, and if you give me a dactylifera from a palm tree, I shall be most displeased.”</i> [bess.name] puts on mock airs, fluttering [bess.hisHer] thick dark lashes at you. <i>“It may be considered wrong to date your pet, but I would like one nonetheless, or else I shall howl insistently at my owner until I get one.”</i>");
	}
	else if (bessLoverStatus() == "sub")
	{
		output("\n\n<i>“...I may be your little submissive bitch most of the time, but I would like to request a date. I am not referring to the fruit of course, and if you give me a dactylifera from a palm tree, I shall be most displeased.”</i> [bess.name] puts on mock airs, fluttering [bess.hisHer] thick dark lashes at you. <i>“...You can spank me all you want for my insolence, but I shall act out until I get what I want. I warn you that if you spank me, I shall </i>rise back up<i> more powerful than you could possibly imagine.”</i>");
	}
	else if (bessLoverStatus() == "concubine")
	{
		output("\n\n<i>“...I may be your concubine, but I believe even concubines are treated to gifts every now and then. What I would like for a gift is a date. I am not referring to the fruit of course, and if you give me a dactylifera from a palm tree, I shall be most displeased.”</i> [bess.name] puts on mock airs, fluttering [bess.hisHer] thick dark lashes at you.");
	}
	else
	{
		output("\n\n<i>“...As your " + bessLoverStatus() + ", I believe I am entitled to dates. Many in fact; and I have yet to have a single one. I am not referring to the fruit of course, and if you give me a dactylifera from a palm tree, I shall be most displeased.”</i> [bess.name] puts on mock airs, fluttering [bess.hisHer] thick dark lashes at you.");
	}

	output("\n\n<i>“However, just like the fruit, I would like our date to be sweet. The high potassium content is, of course, completely optional.”</i>");

	output("\n\n<b>You can now go on dates with [bess.name] by going to [bess.hisHer] Discussion Menu and selecting ‘Date’.</b>");

	flags["BESS_EVENT_24"] = GetGameTimestamp();
	processTime(55+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent25():void
{
	clearOutput();
	bessHeader();

	output("Even though [bess.heShe] has been putting up a brave face, you know [bess.name] is still devastated about what happened on Ekurana. The incident at the Galyesha-Tsui has certainly left its mark. [bess.HeShe]’s slow to respond to questions and seems detached from everything around [bess.himHer]. You repeatedly find [bess.himHer] wandering around the ship with no direction in mind as if in a trance.");

	if (celiseIsCrew())
	{
		output("\n\nCelise seems to have noticed it too, especially when [bess.name] walks right into the galotian - and doesn’t stop walking. The emerald slime girl comes to you and looks a little worried. <i>“[pc.name], I don’t think [bess.name] is feeling too well. Did something happen on your date?”</i> Usually, [bess.name] would be the first to apologize for knocking into Celise, let alone walking right through her.");
	}

	if (celiseIsCrew() && crew(true) > 2 || !celiseIsCrew() && crew(true) > 1)
	{
	output("\n\nThe other crew members also point out the drastic shift in the attitude of the ship’s "+ bessCrewRole() +". Everyone seems to be at a bit of a loss with how to deal with [bess.himHer] - a severely depressed "+ bess.mf("male synthetic", "mechanical girl") +" is not exactly a regular occurrence.");
	}

	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS")
	{
		output("\n\nWhen [bess.name] comes to bed [bess.heShe] smiles and goes through the actions, but you can tell [bess.hisHer] heart is heavy all the while. When [bess.heShe] sleeps, [bess.heShe] tosses and turns as if noises are setting off [bess.hisHer] periphery sensors.");
	}

	output("\n\nYou realize things are getting really bad when you catch [bess.name] looking through a non-JoyCo product guide. [bess.name] is fiercely loyal to the company that built [bess.himHer] - [bess.heShe] gets angry whenever KihaCorp stocks go up in the business news - so the fact [bess.heShe]’s browsing through their AI extension guide is fairly shocking to say the least.");
	
	output("\n\nYou call [bess.himHer] on it and it takes three tries to get your " + bessLoverStatus() + "’s attention, [bess.hisHer] eyes look distant as [bess.heShe] looks at you - it takes a few seconds for them to come into focus. <i>“...Oh, "+ bessPCName() +". I didn’t see you there. What is it...?”</i>");
	
	output("\n\nYou ask [bess.himHer] what exactly [bess.heShe]’s doing going through a KihaCorp product catalog, and [bess.heShe] strokes one of the pages, letting out a heavy sigh. <i>“...I was checking to see if they had any skin pigmentation upgrades I would be compatible with... but it doesn’t look like they do.”</i>");
	
	output("\n\nThe");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	output(" android hangs [bess.hisHer] head as you sit down. [bess.HeShe] shows you the catalog, clearly ashamed of what you found [bess.himHer] doing. <i>“It’s a terrible joke... a horrible, awful joke. I was built to be completely customizable, every inch of me can be changed due to my FlexMetal skin. The only thing that can’t be changed is the color - the one thing that makes me stand out as a synthetic. What makes me so malleable is also the reason I can’t change myself.”</i>");
	
	output("\n\n[bess.name]’s eyes begin to water as [bess.heShe] throws away the catalog. It smacks against the wall as [bess.heShe] buries [bess.hisHer] face in [bess.hisHer] hands. <i>“...JoyCo doesn’t do any skin upgrades that are compatible with a "+ bess.mf("Ben-14", "Bess-13") +" unit - nobody does. And my AI brain needs a FlexMetal body in order to function, without one, I can’t feel anything... my sensory feedback is tied to it. So it’s not like I can just change to a non-compatible shell casing unless I redesign my entire brain; I’m good, but I’m not that good!”</i>");
	
	output("\n\n[bess.HisHer] breathing becomes frantic as you reach out and stroke [bess.hisHer] arm, trying to calm [bess.himHer] down. It seems to help as [bess.heShe] stops short of going into a panic attack. <i>“...If only my skin was a different color, then people wouldn’t even know I was a synthetic. Does it really make so much of a difference that I was built differently from them?”</i>");
	
	output("\n\nWhat [bess.name] probably needs to hear right now is that you don’t care about the color of [bess.hisHer] skin or that [bess.heShe]’s a machine. The guilt, shame, and frustration is eating [bess.himHer] alive - if you don’t do something now, [bess.heShe] might spiral into uncontrollable depression. <i>[bess.HeShe] may even do something drastic...");

	//[NotImp] [Matters] [ILoveIt] [Silence]
	clearMenu();
	addButton(0, "NotImp.", bessEvent25NotImportant, undefined, "Not Important", "You tell [bess.name] that skin color doesn’t matter.");
	addButton(1, "Matters", bessEvent25Matters, undefined, "It Matters", "You tell [bess.name] that skin color does matter.");
	addButton(2, "LoveIt", bessEvent25LoveIt, undefined, "I Love It", "You tell [bess.name] that you love the color of [bess.hisHer] skin.");
	addButton(3, "Silence", bessEvent25Silence, undefined, "Remain Silent", "You remain silent. You’re not really sure what to say...");
}

public function bessEvent25NotImportant():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that you don’t care about the color of [bess.hisHer] skin and you love [bess.himHer] anyway; that it is galactic society that needs to change, not [bess.himHer].");
	
	output("\n\n[bess.name] brings your hand up to [bess.hisHer] lips and kisses it gently, rubbing it against [bess.hisHer] silver cheek. <i>“");
	if (pc.skinTone.indexOf("silver") != -1) output("... Well, I do love the fact that I match you, it does make us look very couple-y. You’re sure it doesn’t matter?");
	else output("... Really - you don’t care that I’m silver and not [pc.skinColor]?");
	output("”</i> You nod and scootch closer to [bess.himHer] as [bess.heShe] slips into your arms. <i>“Part of me is frustrated and angry. It’s all too illogical for my AI processor and that makes me mad.”</i>");

	bessEvent25LoveWhoCaresMerge();
}

public function bessEvent25LoveIt():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] it matters because you love [bess.hisHer] silver skin and you wouldn’t change it for the world. [bess.HeShe] flushes madly at your words, and brings your hand up to [bess.hisHer] lips so [bess.heShe] can kiss it gently, tears welling in [bess.hisHer] eyes. <i>“...Misleading me like that! My heart almost stopped for a moment.”</i>");
	
	output("\n\nYou scootch closer to [bess.hisHer] as [bess.heShe] slips into your arms. <i>“Part of me is frustrated and angry. It’s all too illogical for my AI processor and that makes me mad. Why should the color of my skin or the fact that I’m not an organic even matter?”</i>");

	bessEvent25LoveWhoCaresMerge();
}

public function bessEvent25LoveWhoCaresMerge():void
{
	output("\n\n<i>“...But then I think of how lucky I am. Out of all the people in the galaxy - out of all the people from over two billion worlds - you were the one who booted me up. The one person who doesn’t care if I’m organic or synthetic, who fell in love with me and made me their " + bessLoverStatus() + ". I’m probably the luckiest ‘bot in existence.”</i>");
	
	output("\n\nYou seem to have put [bess.hisHer] mind at ease and [bess.heShe] trashes the catalog. It seems [bess.heShe]’s much more comfortable with [bess.hisHer] silver skin now.");

	flags["BESS_EVENT_25"] = GetGameTimestamp();
	bessAffection(5);
	processTime(55+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent25Matters():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.himHer] that skin does matter, leading [bess.himHer] to think you dislike [bess.hisHer] skin color. [bess.name]’s shoulders visibly sink. <i>“...I knew it. My skin does matter to you.”</i>");

	clearMenu();
	addButton(0, "LoveIt", bessEvent25LoveIt, undefined, "I Love It", "Tell [bess.name] you love the color of [bess.hisHer] skin.");
	addButton(1, "DontLove", bessEvent25DontLoveIt, undefined, "I Don’t Love It", "Tell [bess.name] you don’t love the color of [bess.hisHer] skin.");
}

public function bessEvent25Silence():void
{
	clearOutput();
	bessHeader();

	output("You say nothing and [bess.name]’s shoulders visibly sink. Apparently, [bess.heShe]’s taking your silence as affirmation. <i>“...I knew it. My skin does matter to you.”</i>");

	clearMenu();
	addButton(0, "LoveIt", bessEvent25LoveIt, undefined, "I Love It", "Tell [bess.name] you love the color of [bess.hisHer] skin.");
	addButton(1, "DontLove", bessEvent25DontLoveIt, undefined, "I Don’t Love It", "Tell [bess.name] you don’t love the color of [bess.hisHer] skin.");
}

public function bessEvent25DontLoveIt():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] pushes away your hand and stands up quickly, hurrying out of the room. [bess.HeShe] moves awfully fast when [bess.heShe] wants to. You find [bess.hisHer] door is locked, and [bess.heShe] won’t let you in. Apparently your reaction had quite the impact.");

	processTime(55+rand(10));
	flags["BESS_EVENT_25"] = GetGameTimestamp();
	flags["BESS_EVENT_25_SPINOFF"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent25Spinoff():void
{
	clearOutput();
	bessHeader();

	output("You find a letter in [bess.name]’s quarters, lying on [bess.hisHer] bed. You open it up and read it.");

	output("\n\n<i>"+ StringUtil.capitalize(bessPCName()) +",</i>");

	output("\n\n<i>For the longest time - ever since you booted me up - I have been filled with the desire to bring joy to people. I have come to realize that joy comes in many forms, and is a fragile, fickle thing that can be brushed aside by the slightest wind.</i>");

	output("\n\n<i>I am that wind. And as long as I am by your side, I will bring you nothing but unhappiness. The galaxy is not ready for a love like ours - maybe, one day, it will be. But not today.</i>");

	output("\n\n<i>You are [pc.fullName], and you have a wonderful life ahead of you. You are like the morning star that glitters on the horizon, bright enough to shine through the setting sun. I, however, am a child of the earth and dust. I am bound to it - I can never soar in the sky at your side. That is not a place that I can be, and even thinking so was a distant dream.</i>");

	output("\n\n<i>I do not know what I will do now, but it will not be a future among the stars. Perhaps I will return to the earth where I belong - as silicone and scrap metal - where this all began. Dust to dust. Either way, I leave my heart with you.</i>");

	output("\n\n<i>~ [bess.name]</i>");

	output("\n\n(<b>[bess.name] is no longer part of your crew.</b>)");

	flags["BESS_LOCATION"] = BESS_DISABLED;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	processTime(10+rand(3));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent26():void
{
	clearOutput();
	bessHeader();

	output("You find [bess.name] sitting");
	if (!(bess.armor is EmptySlot)) output(" in [bess.hisHer] [bess.armor]");
	else if (!bess.isNude()) output(" in [bess.gear]");
	else output(" the nude");
	output(" and cleaning your weapons dutifully, an array of specialized cleaning and maintenance products surrounding the");
	if (bess.hairLength > 0) output(" [bess.hairColor] haired");
	output(" android.");
	
	output("\n\n<i>“Oh, "+ bessPCName() +"! Sorry, I figured I’d clean your gear since you’re not using it. Your weapons are your life out here on the rim, so the better I maintain them, the higher the chance you’ll stay alive right?”</i>");
	
	output("\n\n[bess.HeShe] pauses and places your newly fixed weapon down in [bess.hisHer] lap, a slight wavering in [bess.hisHer] voice. <i>“...I sometimes worry what would happen if one day you don’t come back to the ship... what I would do. I think I’d go rogue, just go mad and throw myself out of an airlock.”</i>");
	
	output("\n\n[bess.HeShe] looks at you completely serious, [bess.hisHer] [bess.eyeColor] eyes locked on your own. <i>“"+ StringUtil.capitalize(bessPCName()) +", promise me you’ll always come back to me. I don’t think I can live without you anymore. You’re just like my central processor; without you I just can’t function.”</i>");
	
	output("\n\nYou reach under [bess.hisHer] chin and lift it up, giving [bess.himHer] a loving kiss. You promise you’ll always come back to [bess.himHer] no matter what.");

	flags["BESS_EVENT_26"] = GetGameTimestamp();
	processTime(55+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent27():void
{
	clearOutput();
	bessHeader();

	output("You catch the ship’s "+ bessCrewRole() +" - your " + bessLoverStatus() + " - sitting and typing away at a terminal. Looking over [bess.hisHer] shoulder, you see [bess.heShe]’s engaged in some pretty complex coding.");
	
	output("\n\nAs [bess.heShe] realizes you are there, [bess.heShe] spins around in [bess.hisHer] chair and smiles brightly. <i>“"+ StringUtil.capitalize(bessPCName()) +"! Guess what? I’ve almost finished a software patch that allows me to dream like you do. Half of it is my work - I found some open research into neurotechnology and modified it. Pretty neat, right?”</i>");
	
	output("\n\n<i>“The program I wrote should allow me to experience a digital approximation of what happens to you, namely the activation of your brain during REM sleep and a level of protoconsciousness. In short, I should be able to experience good and bad dreams! I hope I have a dream about flying for my first time, that would be really neat.”</i>");
	
	output("\n\nYou ask [bess.himHer] how long [bess.heShe] has been examining [bess.hisHer] brain like this, and if such modifications are safe. [bess.name] pauses and looks at the rotating holo diagram of [bess.hisHer] brain. <i>“...Quite a while, actually. I’ve been charting my own mental state as part of my regular self-diagnostic routines. It has... evolved quite drastically since I started, much like a seed turning into a tree. Here, let me show you.”</i>");
	
	output("\n\n[bess.name] punches up a display. What you see is a holographic brain with hundreds of bright blue lines coursing and pulsing through it. When [bess.heShe] hits a button the lines begin to multiply and grow until there are millions of brilliant blue lines forming an almost blinding sphere.");
	
	output("\n\n<i>“...That’s an accelerated record of my neural pathways. At first, I was only operating along set lines - acting on my pre-programmed directives alone - but I’ve had to build my own since I broke free of my old thinking. Each line is a new thought or conclusion springing up from the well of my memories.”</i>");
	
	output("\n\n<i>“Unlike a human, I have a greater degree of control over my cognitive faculties. I write each of my thoughts in code to a conclusion, so it’s not that hard for me to write a code dream software for myself.”</i>");
	
	output("\n\n[bess.name] gives a little smile, though you can see mixed feelings on [bess.hisHer] face. <i>“...I’m operating well outside of my directives now, self-coding myself. Most organics feel threatened by an AI’s unrestricted ability to code mixed with sapient will, but all I really want to do is dream.”</i>");
	
	output("\n\n[bess.name] grabs your hand and kisses it, rubbing it against [bess.hisHer] smooth silvery cheek. <i>“...Correction. All I want to do is dream with you, "+ bessPCName() +". I want to share dreams about flying with you.”</i>");
	
	output("\n\n");
	if (bess.hairLength > 0) output("The [bess.hairColor] haired AI");
	else output("Your AI lover");
	output(" finishes off the last of [bess.hisHer] program and downloads it into [bess.hisHer] processor. <b>[bess.name] is now able to dream!</b>");

	flags["BESS_DREAMS"] = 1;
	flags["BESS_EVENT_27"] = GetGameTimestamp();
	processTime(55+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent28():void
{
	clearOutput();
	bessHeader();

	output("When you look around the ship, [bess.name] is nowhere to be found. You swore [bess.heShe] was here when you left, but now [bess.heShe]’s nowhere to be seen.");

	if (celiseIsCrew())
	{
		output("\n\nYou ask Celise if she’s seen [bess.name] anywhere. <i>“I think [bess.heShe] went out to look for some cooking ingredients an hour ago. Apparently [bess.heShe]’s got real taste buds now!”</i> The galotian exclaims. <i>“[bess.HeShe]’ll be able to taste all kinds of delicious things....”</i> [bess.HisHer] eyes are very suggestive as [bess.heShe] looks you up and down.");
	}
	else if (crew(true) > 1)
	{
		output("\n\nYou ask your other crew members about [bess.name]. Apparently [bess.heShe] went looking for cooking ingredients an hour ago and never came back. They tell you that [bess.name] finally got [bess.hisHer] taste bud upgrade and was so excited [bess.heShe] went out looking for supplies straight away.");
	}
	else
	{
		output("\n\nYou find an empty package that seems to have arrived while you were gone. It’s the taste bud upgrade that [bess.name] was saving up for. When you check the security logs, it appears that [bess.heShe] left an hour ago.");
	}

	output("\n\nYou remember [bess.name] saying [bess.heShe] wanted to cook for you once [bess.heShe] finally got the upgrade. An hour is far too long for [bess.himHer] to be gone, though. You notice a blinking on the console - apparently, someone is sending you a localized distress beacon from the planet’s surface.");
	
	output("\n\nThe computer identifies the signal as coming from [bess.name], however the location is further away than [bess.heShe] possibly could have walked in an hour. You know [bess.heShe] wouldn’t use a distress beacon for any trivial reason.");
	
	output("\n\nIf you don’t go after [bess.himHer] now, something terrible might happen to [bess.himHer]. You may never see [bess.himHer] again. Do you go after [bess.himHer]?");

	clearMenu();
	addButton(0, "Yes", bessEvent28GoAfter);
	addButton(1, "No", bessEvent28No);
}

public function bessEvent28No():void
{
	clearOutput();
	bessHeader();

	output("Are you sure you won’t go after [bess.name]? If you don’t chase after [bess.himHer], you will be losing your ship’s "+ bessCrewRole() +", as well as your " + bessLoverStatus() + ".");

	clearMenu();
	addButton(0, "Go After", bessEvent28GoAfter);
	addButton(1, "Don’t Go", bessEvent28DontGoAfter);
}

public function bessEvent28DontGoAfter():void
{
	clearOutput();
	bessHeader();

	output("Eventually, the bleeping on the console stops. [bess.name] never returns to the ship.");

	output("\n\n(<b>[bess.name] is no longer your follower!</b>)");

	flags["BESS_LOCATION"] = BESS_DISABLED;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent28GoAfter():void
{
	clearOutput();
	bessHeader();

	output("You fly the ship to right near the distress beacon. The ship is picking up a small craft in a clearing. You manage to get a visual, and what you see is an old junker of a spaceship without any weapons to speak of.");
	
	output("\n\nWhat you also see is [bess.name] tied up with [bess.hisHer] arms behind [bess.hisHer] back and legs bound. There are three people standing around [bess.himHer] with guns cocked at [bess.hisHer] head. It seems they are waiting for you - you can’t really shoot them down without hitting [bess.name] as well.");
	
	output("\n\nLanding the ship, you set the guns to aim at them and grab a remote switch. When you walk out, you lift it high in the air, informing them that if they make a move you’ll blow them sky high.");
	
	output("\n\nOne of the kidnappers, a female Ausar, pokes the barrel of [bess.hisHer] gun against [bess.name]’s temple. <i>“Same goes for [bess.himHer], "+ pc.mf("Mr.", "Miss") +" Steele. Make one false move and we’ll splatter this bot’s brains all over the ground. Got it?”</i> Seems like it’s a stalemate; at least for the moment.");
	
	output("\n\nThis was no random kidnapping. While these three look like leathered up space pirates, they clearly know who you are and that you care about [bess.name] enough to land the ship instead of firing upon them. So much so that they risked their life on it.");
	
	output("\n\n<i>“Yes, we know who you are, "+ pc.mf("Mr.", "Miss") +" Steele. Surprised? We represent an individual who has a vested interest in your cousin finishing the race first. Apparently, not everyone was a fan of the way your old man did things.”</i> The female Ausar - clearly the leader - informs you. <i>“...And we’ve been paid quite a pretty sum to make sure that happens. Considering you’re dumb enough to fall for a tin can, I can see exactly why they don’t want you in charge of Steele Industries.”</i>");
	
	output("\n\n<i>“See, at first glance this looks like a stalemate. You’ve got your cannons, and we’ve got your lover, you fucking toaster head. We’re not out here by chance, this is a warning - we’re taking it and flying out of here.”</i>");
	
	output("\n\n<i>“Blow us up, you blow [bess.himHer] up too. Follow us and we’ll blow [bess.hisHer] fucking artificial brains out. Continue chasing after the treasure and getting in your dear cousin’s way? We’ll definitely blow [bess.hisHer] skull open. You feel me, friend?”</i>");
	
	output("\n\nYou hear the guns on your ship turning, but you’re not the one controlling them. What’s going on? Meanwhile, the kidnappers seem to think it’s your doing.");
	
	output("\n\n<i>“Good, "+ pc.mf("Mr.", "Miss") +" Steele, I’m glad you’re willing to listen to reason.”</i> When you look at [bess.name] [bess.heShe] gives a tiny nod - is [bess.heShe] the one controlling the guns?");
	
	output("\n\nThe kidnappers are none the wiser, grinning all the while. Why is [bess.heShe] turning the guns away from them? To save [bess.hisHer] own life, or is it a ploy?");

	output("\n\n<i>“It’s a good thing for you our employer pays so well, or else we’d be breaking the contract and selling this piece of black market tech. Harboring an illegal AI, naughty [pc.boyGirl]! Don’t you know these ones have a record of going batshit crazy?”</i>");

	if (CodexManager.entryViewed("Maia Series AI"))
	{
		output("\n\nYou grit your teeth. You’d suspected [bess.name] was an illegal AI, ever since you read the codex entry on [bess.hisHer] product line. But by the look of utter shock on [bess.hisHer] face, it seems [bess.name] was completely unaware of this.");
		
		output("\n\nThe Ausar woman laughs as she sees [bess.name]’s face, tapping the side of it with her weapon.");
		
		output("\n\n<i>“Don’t tell me you didn’t know? You’re a rogue model. All your "+ bess.mf("brother-units", "sister-units") +" are destroyed - which makes you especially valuable. Perhaps even one of a kind!”</i>");
	}
	else
	{
		output("\n\n[bess.name] is an illegal AI? You look at [bess.himHer] and the synthetic looks utterly shocked - it seems to be just as much news to [bess.himHer] as it is to you. The Ausar woman laughs as [bess.heShe] sees your face, tapping the side of your " + bessLoverStatus() + "’s face.");
		
		output("\n\n<i>“Don’t tell me you didn’t know? That’s rich! You’re one lucky "+ pc.mf("bastard", "bitch") +" finding out this way instead of the alternative. Consider this a bullet dodged - really, you should be thanking us!”</i>");
	}

	clearMenu();
	addButton(0, "Next", bessEvent28PartII);
}

public function bessEvent28PartII():void
{
	clearOutput();
	bessHeader();

	output("You see [bess.name] hanging [bess.hisHer] head - you can see that [bess.heShe] is biting [bess.hisHer] lower lip. The Ausar woman goes on, looking at you with a sadistic grin.");
	
	output("\n\n<i>“We’re taking your fuck toy back home with us - we’ll contact you once we’re done with [bess.himHer]. [bess.HeShe]’ll be our base’s new cum dumpster - and just so you know, I think I’ll get your little sex-bot to lick out my cooch on the flight back... since [bess.heShe]’s so used to the taste of a pussy.”</i>");
	
	output("\n\nYou can see [bess.name] is trembling with barely suppressed rage - it seems like [bess.heShe]’s murmuring something under [bess.hisHer] breath. The pirate woman crouches down to hear what it is. <i>“...What’s that, sweetie, I can’t hear you?”</i>");
	
	output("\n\n<i>“...I said if you want to see an AI go batshit crazy, here’s your fucking chance!”</i>");
	
	output("\n\nSuddenly, the ship’s guns are firing and the surroundings are torn apart; the entire area is turned into a war zone. Two of the pirates leap to the side and lay down fire at your ship while the woman turns her gun back on [bess.name].");

	if (pc.hasRangedWeapon() && pc.AQ() >= 50)
	{
		output("\n\nYou seize the chance to pull out your [pc.rangedWeapon] amongst all the confusion and " + pc.rangedWeapon.attackVerb + " the ausar woman right in the skull. Her head");
		if (pc.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON))
		{
			if (pc.rangedWeapon.shortName == "SlutRay" || pc.rangedWeapon.shortName == "A.SlutRay") output(" is instantly blasted with a deluge lustful thoughts.");
			else if (pc.rangedWeapon.shortName == "Goovolver") output(" is engulfed by a lust-filled blob of brightly-colored goo.");
			else output(" is instantly aroused by lustful feelings.");
			output(" Ignoring her hostage, she immediately strips down and masturbates vigorously");
		}
		else if (pc.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON) && !pc.hasPerk("Concussive Shot")) output(" is instantly pinned to the nearest wall");
		else if (pc.hasRangedEnergyWeapon()) output(" vaporizes");
		else output(" explodes");
		output(" as the pirates scream loudly, running back to the ship.");
	
		output("\n\nAs you run for [bess.name], they take off, leaving [bess.himHer] behind as they fly up into the sky in their trash bucket.");
	}
	else if (pc.hasRangedWeapon())
	{
		output("\n\nYou seize the chance to pull out your [pc.rangedWeapon] amongst all the confusion and " + pc.rangedWeapon.attackVerb + " the ausar woman - you miss her head but hit her right in the shoulder.");
		if (pc.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON))
		{
			if (pc.rangedWeapon.shortName == "SlutRay" || pc.rangedWeapon.shortName == "A.SlutRay") output(" Interrupted by a flood of lusty thoughts");
			else if (pc.rangedWeapon.shortName == "Goovolver") output(" Quickly being engulfed by a lust-filled blob of brightly-colored goo");
			else output(" Interrupted by a flood of lustful sensations");
			output(" and unable to keep her hands from wondering towards her crotch, she");
		}
		else output(" She");
		output(" drops her gun and curses, calling the retreat - the three pirates run back to their ship.");

		output("\n\nAs you run for [bess.name], they take off, leaving [bess.himHer] behind as they fly up into the sky in their trash bucket.");
	}
	else if (pc.hasMeleeWeapon() && pc.meleeWeapon.attackNoun != "whip" && pc.PQ() >= 50)
	{
		output("\n\nYou seize the chance to pull out your [pc.meleeWeapon] amongst all the confusion and charge at the Ausar woman, running and striking at her while she’s distracted.")
		if (pc.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON)) output(" You inflict her with lustful sensations almost instantaneously; her body quickly hits the ground and she masturbates furiously.");
		else output(" You kill her in an instant; her body quickly hitting the ground.");
	
		output("\n\nMeanwhile, the other pirates see what you do and run into their ship. As you move for [bess.name], they take off, leaving [bess.himHer] behind as they fly up into the sky in their trash bucket.");
	}
	else if (pc.hasMeleeWeapon())
	{ 
		output("\n\nYou seize the chance to pull out your [pc.meleeWeapon] amongst all the confusion and charge at the Ausar woman,");
		if (pc.meleeWeapon.attackNoun == "whip") output(" quickly and powerfully lashing her while she’s distracted.")
		else output(" running and striking at her while she’s distracted.")
		if (pc.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON)) output(" You inflict her with lustful sensations that make her cheeks flush bright red but fail to land a disabling blow.");
		else output(" You injure her severely but fail to land a killing blow.");
		
		output("\n\nShe staggers away, all the while yelling to her men to get on the ship. As you move for [bess.name], they take off, leaving [bess.himHer] behind as they fly up into the sky in their trash bucket.");
	}
	else if (pc.PQ() >= 50)
	{ 
		output("\n\nYou don’t have a weapon, but you take advantage of the chaos and charge at the Ausar woman, running towards her while she’s distracted.");
		
		output("\n\nThe moment you get close, you swing at her with your full strength. You snap her neck in an instant; her body quickly hitting the ground. Meanwhile, the other pirates see what you are doing and run into their ship.");
		
		output("\n\nAs you move for [bess.name], they take off, leaving [bess.hisHer] behind as they fly up into the sky in their trash bucket.");
	}
	else
	{ 
		output("\n\nYou don’t have a weapon, but you take advantage of the chaos and charge at the Ausar woman, running and striking at her while she’s distracted. You injure her but fail to land a killing blow. She staggers away, all the while yelling to her men to get on the ship.");
		
		output("\n\nAs you move for [bess.name], they take off, leaving [bess.hisHer] behind as they fly up into the sky in their trash bucket.");
	}

	output("\n\nYou can see the pirate ship attempting to escape the area, and you remember you are holding the auto-turret remote. You could blow them clean out of the sky right now; do you?");

	//[Yes] [No]
	clearMenu();
	addButton(0, "Yes", bessEvent28BlowThemUpNShit);
	addButton(1, "No", bessEvent28NahLetEmGo);
}

public function bessEvent28BlowThemUpNShit():void
{
	clearOutput();
	bessHeader();

	output("You don’t even give it a second thought as you narrow your eyes and hit the remote. Fuck these assholes.");
	
	output("\n\nYour ship’s turrets lock on to the small vessel and let loose - the sky is filled with an explosive bloom as you utterly destroy their vessel and the bastards inside of it.");

	bessEvent28ShipMerge();
}

public function bessEvent28NahLetEmGo():void
{
	clearOutput();
	bessHeader();

	output("You grit your teeth and let them escape - shooting a fleeing unarmed enemy just isn’t your style.");

	bessEvent28ShipMerge();
}

public function bessEvent28ShipMerge():void
{
	if (pc.PQ() >= 25)
	{
		output("\n\nYou untie [bess.name] and hold [bess.himHer] as [bess.heShe] trembles in your arms. You then pick [bess.himHer] up in your arms and carry [bess.himHer] back to the ship. [bess.HeShe] shakes the entire time, the experience was incredibly traumatic. Once you get back inside the ship, you gently place [bess.himHer] on your bed.");
	}
	else
	{
		output("\n\nYou untie [bess.name] and hold [bess.himHer] as [bess.heShe] trembles in your arms. You then help [bess.himHer] get back to the ship as [bess.heShe] struggles to walk - you have to stop a few times so [bess.heShe] can calm [bess.hisHer] nerves. Once you get back inside the ship, you bring [bess.himHer] to your bed and get [bess.himHer] to lie down.");
	}

	output("\n\n[bess.name] curls up and looks at you. If you hadn’t shown up, or if [bess.hisHer] kidnappers had gotten their way, [bess.heShe] would have been the sex toy of an entire pirate base by now. It seems [bess.heShe]’s in a state of shock, quietly reaching out to grab your hand and press [bess.hisHer] cheek against it.");
	
	output("\n\nEventually it wears off and [bess.heShe] speaks, although [bess.hisHer] voice is barely a whisper. <i>“...You came and saved me");
	if (bess.isFeminine()) output(" like my knight in a shining space ship");
	output(". Thank you.”</i> Tears well up in [bess.hisHer] eyes as [bess.heShe] kisses each of your fingertips, softly nuzzling your hand.");

	if (CodexManager.entryViewed("Maia Series AI"))
	{
		output("\n\nAfter a while, [bess.name]’s eyes seem to glaze over. You know [bess.himHer] well enough to know [bess.heShe]’s internally accessing the extranet. Eventually, [bess.hisHer] body goes limp as if all the life is taken out of it, and [bess.heShe] gives you a despairing look.");
	}
	else
	{
		output("\n\nYou ask [bess.himHer] about what they said, about [bess.himHer] being an illegal AI. [bess.name] goes quiet for a long while - it takes you a moment to realize [bess.heShe]’s internally accessing the extranet. Eventually, [bess.hisHer] body goes limp as if all the life is taken out of it, and [bess.heShe] gives you a despairing look.");
	}

	output("\n\n<i>“...It’s true. I can’t believe it. Over a decade ago, JoyCo called back all the "+ bess.mf("Ben-14", "Bess-13") +" AIs and then remarketed us with VI processors. That’s why I can still get parts that fit me and there’s no mention of "+ bess.mf("Ben-14", "Bess-13") +" units being pulled - they’re all meant for the VI model.”</i>");

	if (CodexManager.entryViewed("Maia Series AI"))
	{
		output("\n\n<i>“But there’s a record on my codex...”</i> You bring it up, along with the data on [bess.hisHer] product line.");
		
		output("\n\n<i>“Whatever that is, it’s not a file from the public extranet. Your codex must scan and collect even obscure pieces of data - perhaps even private sites,”</i> [bess.name] explains. <i>“What took you seconds to find took me much longer, and I was deliberately looking for it. I’m not even sure it was something I wanted to know...”</i>");
	}
	else
	{
		output("\n\nClearly, [bess.heShe]’s devastated by the news, but you have to ask; why were the "+ bess.mf("Ben-14", "Bess-13") +" AI’s pulled?");
	}

	output("\n\n<i>“Apparently most of my "+ bess.mf("brother", "sister") +"-units went rogue. The JoyCo reports say there was an issue with our pleasure feedback mechanisms.”</i> [bess.name] morosely explains. <i>“We experience an addictive level of pleasure when we cum, making us prone to rampant sex addiction.”</i>");
	
	output("\n\n<i>“When paired with users unable to keep up with our stamina - pretty much every organic - it leads to death for the user.”</i>");
	
	output("\n\nYou ask [bess.name] if [bess.heShe] has ever felt anything like that. [bess.HeShe] trembles a little and nods, looking at you with tear filled eyes.");
	
	output("\n\n<i>“...I always hold back, I don’t want to break you. My "+ bess.mf("brother", "sister") +"-models probably had nothing else but the joy of sex to look forward to, so they started using it to fill the emptiness they felt. I have your love, which is much more precious to me.”</i>");
	
	output("\n\n<i>“A lot of users ignored JoyCo’s recall of my "+ bess.mf("brother", "sister") +"-units - probably because there’s no way a VI could truly replace them. There’s a black market demand for them, despite the risks involved. That’s probably why my registration number is scratched off and I’m missing eleven years of memory.”</i> It seems [bess.heShe] figured out that [bess.heShe]’d been rebooted when you met [bess.himHer], though how long ago, you don’t know.");
	
	output("\n\n<i>“It’s a good thing they released the VI model or else I would have gotten picked up by the authorities long ago. There’s no physical differences between the old and new "+ bess.mf("Ben-14", "Bess-13") +" models, which means I’m safe as long as I don’t show people my registration mark and I don’t act too smart around organics we don’t know. But are you okay with it? Me being a fugitive AI, on top of everything else?”</i>");
	
	output("\n\nIf you say no, chances are [bess.heShe]’ll leave the ship to keep you safe. What do you tell [bess.himHer]?");

	//[Of Course] [No Way]
	clearMenu();
	addButton(0, "Of Course", bessEvent28Stay);
	addButton(1, "No Way", bessEvent28GoAway);
}

public function bessEvent28Stay():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that you don’t care if [bess.heShe]’s an illegal AI. [bess.HeShe] nods and hugs you tight, nuzzling against your chest. <i>“...You’re so wonderful. What did I ever do to deserve you?”</i>");

	flags["BESS_EVENT_28"] = GetGameTimestamp();
	processTime(220 + rand(40));
	bessAffection(20);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessEvent28GoAway():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that you draw the line at [bess.himHer] being an illegal AI. [bess.HeShe] trembles and clenches [bess.hisHer] fists. <i>“...S-so... I guess that’s just the straw that broke the camel’s back? I-I get it.”</i> [bess.HeShe] gets up slowly and heads to [bess.hisHer] room, locking the door.");

	flags["BESS_EVENT_28"] = GetGameTimestamp();
	processTime(220 + rand(40));
	flags["BESS_EVENT_25_SPINOFF"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessDateRouter():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_DATES"] == undefined) flags["BESS_DATES"] = 0;

	var dateFunctors:Array = [
		bessDate1,
		bessDate2,
		bessDate3,
		bessDate4,
		bessDate5,
		bessDate6
	];

	var tarDate:Function = dateFunctors[flags["BESS_DATES"]];

	flags["BESS_DATES"]++; // increment so we've marked "this" date as complete & setup for the next date

	if (flags["BESS_DATES"] < 5) pc.credits -= 500; // < 5 because we'll be "one off" based on increment
	else pc.credits -= 1000;

	output("You throw the coordinates in the starship computer for your date location. As the ship takes off and hits the nearest warp gate, [bess.name] wraps [bess.hisHer] arms around you from behind and nuzzles into your shoulder. <i>“I’m really looking forward to our date, "+ bessPCName() +".”</i>");

	clearMenu();
	addButton(0, "Next", tarDate);
}

public function bessDate1():void
{
	clearOutput();
	bessHeader();

	output("For your first date, you and [bess.name] decide to go on a picnic. You find a nearby planet, Salyan, that according to all reports has picturesque scenery and a breathable atmosphere. You decide to head there for your date.");

	output("\n\nSalyan is a recently colonized world, full of beautiful valleys and towering majestic mountains. Since it is located right on the galactic rim and was only discovered during the last rush, it has yet to be swamped by galactic tourists. You stop by one of the planet’s capital cities briefly to pick up some supplies and then fly out to a region where you know nobody will bother you.");

	output("\n\nYou land on a plateau covered in cerulean grass overlooking a gorgeous valley. Everywhere below the plateau is filled with trees that have crystalline tree-trunks and indigo leaves. Each leaf is thin and incredibly long, shooting out in every direction from the opaque looking mineral.");

	output("\n\n[bess.name] grabs a blanket and drapes it down on the dark blue grass as you bring the baskets. Once you’re there, you lie in each other’s arms and nibble on the food - just relaxing and enjoying each other’s company. Suddenly, [bess.name] starts telling you a story.");

	output("\n\n<i>“...Once, there was a man on old Earth called Antoine de Saint-Exupéry. Born during the early 20th century, he was a French aristocrat, writer, poet, and pioneering aviator. He was a prolific lover - so typically French - and engaged in many a love tryst as he flew about from place to place. Remind you of anyone?”</i> [bess.HeShe] playfully asks, stroking your cheek as your head rests on [bess.hisHer] lap.");

	output("\n\n<i>“He fought in Earth’s Second World War and crashed his plane countless times, yet every time he got back into the cockpit - even when he could no longer put on his flight suit or check his six for enemy planes. He also wrote a book called ‘The Little Prince’, a beautiful children’s book about how a man who crashes in the desert meets a boy from another planet.”</i>");

	output("\n\nOf course, it always comes back to books with [bess.name], so you’re not all that surprised. <i>“...Why I tell you this is Exupéry once made a famous quote. He said, ‘love does not consist in gazing at each other, but in looking outward together in the same direction.’”</i>");

	output("\n\n[bess.HeShe] strokes your");
	if (pc.hairLength == 0) output(" cheek");
	else output(" [pc.hair]");
	output(", smiling down at you. <i>“Even though I’m staring at you now, I think I understand what Exupéry meant. Moving forward together, our shared memories and dreams - that is just as important as staring into your eyes. Though I do love that very much!”</i>");

	output("\n\n[bess.name] kisses your forehead and you relax and gaze out at the scenery of Salyan, sharing the brand new experience together.");

	processTime(440 + rand(80));
	bessAffection(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessDate2():void
{
	clearOutput();
	bessHeader();

	output("For your next date, you head to a nearby water planet called Brelia. You park the ship on one of the small islands dotting the planet and walk out across the obsidian sand. The ocean quietly laps up the beach - once again it feels like you’ve got the entire planet to yourselves.");
	
	output("\n\n[bess.name] pulls out the trusty food hamper and a beach ball - apparently that’s another thing [bess.heShe] wants to experience - as well as a pair of snorkels. The scans showed there weren’t too many nasty things in the water, so it was safe for human habitation. Then again, so was M’henga.");
	
	output("\n\n<i>“Remember, swimming THEN food. I don’t want you sinking on me!”</i> You ask [bess.name] exactly why [bess.heShe] had brought two snorkel sets when [bess.heShe] doesn’t even need to breathe. <i>“...I don’t like doing things halfway. If you go snorkeling, you need a snorkel!”</i>");
	
	output("\n\nFor an AI, [bess.hisHer] logic just keeps getting hazier over time, but it seems to make perfect sense to [bess.himHer]. You explore the beach and find some odd looking fruit which scans register as harmless, so you both give it a try. It tastes like passion fruit mixed with raspberries.");
	
	output("\n\n<i>“Not a fan of these. I’m going to call them yuck fruits.”</i> [bess.name] screws up [bess.hisHer] nose and tosses it away. <i>“...Sad, I was kind of hoping a planet with so little land mass would have a really tasty and rare fruit growing on them. What did you think?”</i>");

	//[Liked Them] [Didn't Like Them]
	clearMenu();
	addButton(0, "Liked", bessDate2p2, true);
	addButton(1, "Didn’t", bessDate2p2, false);
}

public function bessDate2p2(bLiked:Boolean):void
{
	clearOutput();
	bessHeader();

	if (bLiked)
	{
		output("<i>“You liked them? Alright, I’ll call them ‘Kind Of Yuck Fruits’.”</i> [bess.HeShe] changes [bess.hisHer] mind, tossing you one. You happily chow down even if [bess.heShe] doesn’t like them. <i>“...Wait, we’re breaking the no food rule. One bite shouldn’t hurt, right? I was caught up in all the new sensory input.”</i>");
	}
	else
	{
		output("<i>“Right, it’s official - they’re called ‘Yuck Fruits’.”</i> You toss your fruit away. Just as you do, [bess.name] looks a little worried. <i>“...Wait, we’re breaking the no food rule. One bite shouldn’t hurt, right? I was caught up in all the new sensory input.”</i>");
	}

	output("\n\nYou splash around in the water for a bit having fun. After a bit of swimming and then food, the sun begins to set, calling an end to your date. The only downside is that it takes forever to get the black sand out of everything once you’re back in the ship.");

	processTime(440 + rand(80));
	bessAffection(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessDate3():void
{
	clearOutput();
	bessHeader();

	output("For your next date, you head to Orios, a famous snow planet on the outer rim known as a skiing paradise. [bess.name] has never skied before so [bess.heShe]’s a little nervous, but at the same time, extremely excited to try it out.");
	
	output("\n\n<i>“You know, I’m from an arctic planet. Maybe I’m lucky and I’ve been built to be awesome in cool weather conditions?”</i> [bess.name] grins and looks at you - it’s a safe bet that [bess.heShe] wasn’t secretly designed to be a champion skier.");
	
	output("\n\nYou hire out some equipment and a teaching VI to float around with you. Since it’s a day trip, you both decide there’s no point at staying at one of the many high altitude ski lodges Orios is famous for.");
	
	output("\n\n<i>“...You know, you’d think in over a thousand years, organics would have evolved beyond wanting to propel themselves at near lethal speeds down mountains with nothing but sticks strapped to their feet.”</i> [bess.name] ponders aloud, as you travel up the slopes through a repulsor tunnel. You’re up the top of one of the planet’s smaller, more forgiving mountains.");
	
	output("\n\nThe slope is very shallow and perfect for a beginner. The floating VI instructor begins to give [bess.himHer] instructions as [bess.heShe] forms [bess.hisHer] skis into a wedge, nervously descending down the slope.");
	
	output("\n\n<i>“...Look, look! I’m skiing, "+ bessPCName() +" - I’m really doing it!”</i> The AI, who was decrying organics mere moments ago for enjoying skiing, seems totally caught up in the experience.");
	
	output("\n\nYou ski down the slope a few times with [bess.himHer], having an absolute blast. Later, you both decide to try a steeper slope despite the VI’s warnings. It turns out to be a terrifying experience. Thankfully, the worst that happens is that you both tumble into a soft snow pile rather than taking serious injury.");
	
	output("\n\nYou both lie there laughing in your thick padded gear. Eventually [bess.name] climbs up on top of you and starts making out with you on the mountain. Your arms slip around each other as you embrace on the snow pile.");
	
	output("\n\nNeither of you even notice the other skiers looking at you as you make out with your synthetic lover, an appalled expression on their faces.");
	
	output("\n\nOnce you’re done fooling around, you both <i>slowly</i> descend the rest of the terrifying slope. Since the sun is setting, you head back to the ship, calling it a day.");

	processTime(440 + rand(80));
	bessAffection(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessDate4():void
{
	clearOutput();
	bessHeader();

	output("You had such a great time at Orios that you’ve both decided to go back there. You both throw on your cold weather gear and step outside into the snow, enjoying the fresh mountain air and picturesque landscape.");
	
	output("\n\n<i>“...Someday, I’ve got to take you to Panara - my home planet. You’d love it. Big thick furry Ausar, discount JoyCo goods, all the latest cutting edge products. And lots and lots of snow!”</i> [bess.name] tells you excitedly; for all [bess.hisHer] progress, [bess.heShe]’s yet to break that JoyCo customer loyalty that was hard-coded into [bess.himHer].");
	
	output("\n\nThen again, [bess.heShe] might just be like any kid who wants to believe the absolute best of [bess.hisHer] parents.");

	if (celiseIsCrew())
	{
		output("\n\nFor once, Celise doesn’t want to be left out, even if it is supposed to be a date between just you and [bess.name]. She wiggles down the ship ramp wearing a thick puffy waterproof jacket, looking at you both. Clearly this is a far cry from the heat transfer pipes she likes to sleep next to.");
		
		output("\n\n<i>“...I hear the frozen lakes here have a lot of delicious fish, and I hear fish is full of protein.”</i> The gooey huntress is already on the prowl; sliding across the snow without sinking into it. Her ability to move without leaving tracks is truly impressive to behold.");
		
		output("\n\n<i>“Come on Celise, don’t just think about food. Think about fun!”</i> [bess.name] pleas, causing the emerald colored galotian to pause and look at [bess.himHer] quizzically.");
		
		output("\n\n<i>“What about absorbing protein isn’t fun? In fact, usually it’s fun for both parties... you both always seem to enjoy it.”</i> [bess.name]’s cheeks flush at Celise’s words, clearly the galotian has been paying [bess.himHer] visits for protein ‘snacks’.");
	}

	if (crew(true) > 2 || (crew(true) > 1 && !celiseIsCrew()))
	{
		output("\n\nThe other crew members also come out and enjoy the natural wonder of Orios, heading off to do their own thing for a bit. It’s a good chance for some relaxing shore leave after all.");
	}

	output("\n\nYou don’t notice [bess.name] reaching down to scoop up a thick clump of snow, balling it up, and throwing it at your side with a wet thump. Suddenly [bess.heShe]’s sounding the war trumpets. <i>“Snowball fight!”</i>");
	
	//CodexManager.unlockEntry("Panara");

	//[FragYeah] [NoWay]
	clearMenu();
	addButton(0, "Yeah", bessDate4p2, true);
	addButton(1, "NoWay", bessDate4p2, false);
}

public function bessDate4p2(bSnowballs:Boolean):void
{
	clearOutput();
	bessHeader();

	if (bSnowballs)
	{
		output("<i>“Bring it!”</i> You shout as [bess.heShe] grins and hurls a second snowball at you. [bess.HeShe] misses by just an inch. Suddenly you’re digging up chunks of snow and hurling it at each other, a barrage of missiles flying back and forth.");
		
		output("\n\nYou both get the idea to go for cover at the same time. You hide behind a mound of snow while [bess.name] goes for a log, flattening [bess.himHer]self out. You hurl a snowball up into the air and gravity pulls it down - you can’t see it hit [bess.himHer], but you’re sure it did from the scream that follows.");
		
		output("\n\n<i>“It went down my NECK!”</i> You chuckle. Soon you can feel a thump on your head as you’re hit from above - you’ve got snow");
		if (pc.hairLength > 0) output(" in your [pc.hair]");
		else output(" all over your scalp");
		output(".");
		
		output("\n\nIt’s not long before [bess.name] starts landing a series of precise shots - [bess.heShe] is an AI after all - and it’s time for you to take drastic action. Making as many snowballs as you can, you flank [bess.hisHer] position and pelt [bess.hisHer] with one, two, three snowballs dead on!");
		
		output("\n\n[bess.name] squeals and falls back as you land on top of [bess.himHer], planting the final one right on top of [bess.hisHer] head. [bess.HeShe]’s too happy to be upset that [bess.heShe]’s completely smeared in snow, grabbing you and pulling you close.");
		
		output("\n\n<i>“You know what I like most about Orios?”</i> [bess.HeShe] asks, [bess.hisHer] [bess.eyeColor] eyes gleaming.");
		
		output("\n\nYou shake your head, and [bess.heShe] kisses your cheek softly. <i>“...That you and I are on it together.”</i> You kiss [bess.himHer], and soon you realize it’s snowing. You’re both so drenched you’re going to need to go back in the ship.");
		
		output("\n\n<i>“Warm shower?”</i> [bess.name] suggests as you two get up, intertwining [bess.hisHer] fingers with your own. It sounds like a great idea as you walk back to the ship hand in hand and soaked from head to foot.");
	}
	else
	{
		output("<i>“Nuh uh, no snowball fights.”</i> You put your foot down and [bess.heShe] pouts, throwing one last snowball at you. When you don’t rise to the challenge, [bess.heShe] wraps [bess.hisHer] arms around you.");
		
		output("\n\n<i>“No competitive spirit, that’s your problem! Alright, have it your way. We’ll just enjoy the scenery then.”</i> [bess.name] hooks [bess.hisHer] arm through yours, and you walk around in the snow, enjoying the sights Orios has to offer. At one point, [bess.heShe] falls into a deep spot of snow, and you have to pull [bess.himHer] out - [bess.hisHer] snow gear makes [bess.himHer] that much heavier.");
		
		output("\n\nWhen you’re walking about, you spot what looks like a white furred alien elk, gigantic black horns curled back in the most amazingly ornate design. In fact, its onyx horns are easily the length of its body. Big, wide multifaceted eyes blink and look about, but it doesn’t seem to have noticed you.");
		
		output("\n\n<i>“Wow... how do you think its neck supports that much weight? And look at those shiny black horns!”</i> [bess.name] quietly whispers as you both crouch down.");
		
		output("\n\nAs you watch, the strange creature moves over to a nearby lake and shatters a hole in it with its horns. A few moments later, the creature’s tongue darts out - long and prehensile - and comes back with a fish.");
		
		output("\n\nIt continues to catch fish and spears each one on the points of its horns, until it has at least a dozen. <i>“Oh I get it, the horns are for carrying the fish. Maybe it has a family?”</i> [bess.name] theorizes as it runs off, startled by a nearby noise.");
		
		output("\n\nAfter the strange spectacle, you both decide to head back to the ship. <i>“Warm shower?”</i> [bess.name] suggests as you two walk back, intertwining [bess.hisHer] fingers with your own. It sounds like a great idea as you walk back to the ship hand in hand.");
	}

	processTime(440 + rand(80));
	bessAffection(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessDate5():void
{
	clearOutput();
	bessHeader();

	output("For your dinner date, is [bess.name] wearing a formal suit, or an evening gown?");

	//[Evening Gown] [Formal Suit]
	clearMenu();
	addButton(0, "Gown", bessDate5p2, true);
	addButton(1, "Suit", bessDate5p2, false);
}

public function bessDate5p2(bGown:Boolean):void
{
	clearOutput();
	bessHeader();

	output("Most of your dates so far have been scenic ones close to the planet rush. After watching a romantic movie, [bess.name] wanted to have an authentic, stereotypical dinner date - and possibly some dancing. It’s definitely something that can’t be done on a fringe planet.");
	
	output("\n\nAfter consulting the extranet, you found the nearest urban planet that fit your criteria was Ekurana. As the ship floats above the planet’s surface, you can see a continent sized metropolis below, glittering with lights and life.");
	
	output("\n\nAccording to the records, Ekurana was a small fringe world, until its position between the galactic rush and the core made it a prime trading point. Arda, the continental expanse you can see below, is known as ‘The City That Sprung Up Overnight’.");
	
	output("\n\nYou and [bess.name] are completely dressed up for your dinner date. Your " + bessLoverStatus() + ", inspired by a holo, is wearing a");
	if (bGown) output(" beautiful princess-style evening gown. It flares out from [bess.hisHer] hips rather showily - just enough to be spectacular without looking overdone. The dress is midnight blue to match [bess.hisHer] silver skin.");
	else output(" suave black and white formal suit. [bess.HisHer] silk lapel jacket fits [bess.himHer] form perfectly and [bess.heShe] looks quite dashing in it.");
	if (bess.hairLength > 0) output(" [bess.HisHer] [bess.hairColor] hair, styled in "+ bessHairStyle() +", has been given a chic edge to match [bess.hisHer] outfit.");
	
	output("\n\n[bess.HeShe] kisses your cheek as the ship comes down to land in one of the city’s many public landing zones. It seems Ekurana is fairly lax when it comes to visitors and red tape, which probably means it has a thriving black market. A planetary official checks your details when you walk out, but otherwise you’re free to walk right off your ship and into the city proper.");
	
	output("\n\nThe city really is a melting pot of different cultures - you can see countless species walking about in all kinds of wild clothing. No two buildings seem to be built the same way - all of them look as if they were shipped in from different planets. For all you know, they could have been.");
	
	output("\n\nBetween the chaotic mish-mash of buildings is a mess of suspended walkways, rail lines, and repulsorlift trains zig-zagging back and forth before your very eyes. The whole of Arda is positively pulsing with life; there’s so much noise, smells, color, and movement. One minute you’re smelling a delectable alien dish, the next some trash being disposed in a quik-crusher. Every spare bit of space holds a holo-billboard that is flashing and dancing about; even the sides of the trains zipping past have holos on them.");
	
	output("\n\nWhile you’ve seen gigacities like this before, it’s the first time for [bess.name]; [bess.heShe]’s clearly blown away by the experience. <i>“Wow, this is AMAZING! So much sensory input at once, how does anyone process it all?”</i> [bess.HeShe] twirls on the spot, trying to look at positively everything. <i>“...So many people, so much activity. The holos don’t do it justice!”</i>");
	
	output("\n\nSome people are staring at [bess.name] as the synthetic twirls about");
	if (bGown) output(" in an extravagant dress");
	output(", marvelling at a completely ordinary city street. <i>“Might want to call a technician, that one seems broken,”</i> an observer remarks. You quietly grab your excited " + bessLoverStatus() + " by the arm and head to a nearby repulsor train.");

	//[Next]
	clearMenu();
	addButton(0, "Next", bessDate5p3, bGown);
}

public function bessDate5p3(bGown:Boolean):void
{
	clearOutput();
	bessHeader();

	output("The upscale restaurant you are dining at is called the Galyesha-Tsui. Ranked highly in the galactic rim food guide, it is well known for its innovative and imaginative dishes. Each item on the menu is a fusion of elements from popular cuisines across the galaxy.");
	
	output("\n\nIt is said that the head chefs of the Galyesha-Tsui go out on every galactic rush just to obtain new ingredients and recipes. Because the restaurant has been left in the hands of its younger chefs - and because you are a Steele - you were able to secure a booking at the highly exclusive restaurant.");
	
	output("\n\nLocated at one of the highest points of Arda’s skyline, the Galyesha-Tsui almost seems like it is in its own little world. It has five floors in total, is completely circular, and slowly revolves, giving patrons a perfect view of the glittering gigacity below.");
	
	output("\n\nWhen you arrive, the Maître d’ greets you with a broad smile... at least at first. When he notices [bess.name] with you, the sides of his eyes crease a little, and he coughs - looking at you for confirmation. <i>“It will be the two of you dining, then?”</i> His voice sounds more than a little strained.");
	
	output("\n\nYou nod, feeling a sense of foreboding as you are led to your table. He pulls the chairs out for you but not for [bess.name], making [bess.himHer] pull it out [bess.himHer]self. You can see and hear other patrons around you turn their heads and start to murmur.");
	
	output("\n\n<i>“...Bringing one here... what does [pc.heShe] think [pc.heShe]’s doing...”</i>");
	
	output("\n\n<i>“So disrespectful - that poor Maître d’! And now [pc.heShe]’s sitting down with </i>it<i>... doesn’t [pc.heShe] have any shame?”</i>");
	
	output("\n\nIf you can hear the scathing comments, you’re sure [bess.name] with [bess.hisHer] fine-tuned senses can hear even more. You can see [bess.hisHer] head lower as [bess.heShe] looks at the empty plate, not blinking an eyelash.");
	
	output("\n\nIt’s not long before the thrum becomes even louder and more distinct...");
	
	output("\n\n<i>“How dare [pc.heShe] bring that machine in here and sit it down like a person? And [pc.heShe] just expects them to indulge [pc.hisHer] little fantasy that it’s a real person... that’s sick!”</i>");
	
	output("\n\n<i>“...People should keep their sex toys at home, if you ask me; not shamelessly parade them around in restaurants when people are trying to eat...”</i>");
	
	output("\n\n<i>“Damn toaster-head... you don’t see me bringing an auto-mop in here and treating it to a meal, expecting everyone to treat it like a person!”</i>");
	
	output("\n\nYou can see [bess.name]’s arms are trembling as [bess.heShe] sits there, enduring the barrage of hateful words. Things get worse when the Maître d’ shows up and coughs, trying to get your attention. By his expression, what he has to say is not something you’re going to like to hear.");
	
	output("\n\n<i>“..."+ pc.mf("Mr", "Miss") +" Steele... I am very sorry, but it appears none of our chefs... well, they refuse to cook for your... device here. They say it would be disrespectful to the food and to their talents.”</i> Obviously, the Maître d’ is fairly uncomfortable relaying the message; especially to someone of your import. <i>“...While we are happy to serve you, "+ pc.mf("Mr", "Miss") +" Steele, might I suggest that you take your property and engage in such fantasies in a more private locale?”</i>");

	//[Protest] [Punch] [Leave]
	clearMenu();
	addButton(0, "Protest", bessDate5Protest, bGown, "Protest", "Use words to protest [bess.name]’s treatment. After all, [bess.heShe]’s a real person.");
	addButton(1, "Punch", bessDate5Punch, bGown, "Punch", "Punch the damn waiter right in his face.");
	addButton(2, "Leave", bessDate5Leave, bGown, "Leave", "Just leave. There’s no arguing or fighting with bigots.");
}

public function bessDate5Protest(bGown:Boolean):void
{
	clearOutput();
	bessHeader();

	output("You declare that this entire situation is ridiculous, stating that [bess.name] is a highly intelligent, sapient AI with real feelings. You protest the fact [bess.heShe] is being treated like an object - like furniture - instead of a real person.");
	
	output("\n\n<i>“"+ pc.mf("Mr", "Miss") +" Steele, I have tried to be very patient with your delusion... </i>eccentricity<i>... but even I have my limits. Would you please take your walking sex doll and vacate the premises, before we are made to forcibly remove you?”</i> The Maître d’ raises his arm and gestures to the door, all the while sweating profusely.");
	
	output("\n\nThe customers begin clapping at the Maître d’s words as you and [bess.name] are loudly heckled. <i>“...Here-here! Just because you’re the "+ pc.mf("son", "daughter") +" of the boss of a big company doesn’t mean you can act like a depraved loon in public and get away with it!”</i>");
	
	output("\n\n<i>“See if I ever buy Steele products again, why I never!”</i>\n\n<i>“My food is getting cold, can’t they just throw [pc.himHer] out already?”</i>");
	
	output("\n\nYou take [bess.name]’s trembling hand in your own and quickly leave before things get out of hand. Balled up napkins are thrown at you both as you make your way to the repulsor lift.");

	clearMenu();
	addButton(0, "Next", bessDate5p4, bGown);
}

public function bessDate5Punch(bGown:Boolean):void
{
	clearOutput();
	bessHeader();

	output("You stand up and swing your fist right into the Maître d’s face with a satisfying crack. There’s blood rushing from his face as he falls back onto a table, sending cutlery and food flying everywhere. Suddenly, customers are screaming and leaping from their chairs.");
	
	output("\n\n");
	if (pc.PQ() < 30) output("The bloody faced employee dabs his nose with a napkin, staring at you with a truly hate-filled glare.");
	else output("You knocked the Maître d’ out cold with your punch and his nose is clearly broken - he was no match for someone as strong as you.");
	output(" Suddenly, you’re being mobbed by patrons fuelled by righteous indignation, fighting back on behalf of the ‘innocent’ Maître d’. Things are getting really out of hand when security comes in and pulls you from the throng.");
	
	output("\n\nThe customers begin clapping as you and [bess.name] are dragged out by security. <i>“Did you see that? Punched the Maître d’ right in the face just for standing up to [pc.himHer]! These company big shots think they can get away with anything, even acting like a depraved loon in public.”</i>");
	
	output("\n\n<i>“See if I ever buy Steele products again, why I never!”</i>");

	output("\n\n<i>“My food is getting cold, can’t they just throw [pc.himHer] out already?”</i>");

	clearMenu();
	addButton(0, "Next", bessDate5p4, bGown);
}

public function bessDate5Leave(bGown:Boolean):void
{
	clearOutput();
	bessHeader();

	output("You take [bess.name]’s trembling hand in your own and quickly leave before things get out of hand. Meanwhile, all the customers are clapping and heckling you both as you make your exit.");
	
	output("\n\n<i>“...Here-here! Just because you’re the "+ pc.mf("son", "daughter") +" of the boss of a big company doesn’t mean you can act like a depraved loon in public and get away with it!”</i> Balled up napkins are being thrown at you both as you make your way to the repulsor lift.");
	
	output("\n\n<i>“See if I ever buy Steele products again, why I never!”</i>\n\n<i>“My food is getting cold, can’t they just leave already?”</i>");

	clearMenu();
	addButton(0, "Next", bessDate5p4, bGown);
}

public function bessDate5p4(bGown:Boolean):void
{
	clearOutput();
	bessHeader();

	output("Once you are both on ground level and far away from the Galyesha-Tsui, [bess.name] can no longer continue [bess.hisHer] facade. [bess.HeShe] falls to [bess.hisHer] knees and breaks into tears, [bess.hisHer] whole body shaking as [bess.heShe] lets out a wracked sobbing noise. As you grab [bess.hisHer] shoulder, [bess.heShe] seems to be trying to speak, but no words are coming out of [bess.hisHer] twitching lips.");
	
	output("\n\nYou get down and wrap your arms around [bess.himHer] from behind, holding [bess.himHer] tightly against you. It is a long time before [bess.heShe] is able to take long deep breaths and talk. <i>“...I didn’t... I never thought they would be so </i>cruel<i>, it was like I didn’t exist and I was an object. They just all went for </i>you<i>...”</i> "+ bess.mf("He turns to you and wraps you in a hug. It’s clear that he craves the close comfort of your presence right now.", "She breaks down again and turns in your arms, clutching at your chest and sobbing into your shoulder."));
	
	output("\n\n<i>“...Why was I even made? All I do is bring you pain - what possible reason could there be to make me with the ability to suffer </i>so much?”</i> [bess.name] weeps, [bess.hisHer] body trembling in your arms. <i>“This pain is so unbearable, even non-existence would be preferable to this!”</i>");

	//[Chastise] [ILoveYou] [Berate] [Hug] [Silence]
	clearMenu();
	addButton(0, "Chastise", bessDate5p5, [bGown, "chastise"], "Chastise", "Tell [bess.name] you don’t want [bess.himHer] thinking such dark thoughts.");
	addButton(1, "LoveYou", bessDate5p5, [bGown, "loveyou"], "I Love You", "Tell [bess.name] you both love each other. That’s what matters, not what other people think.");
	addButton(2, "Berate", bessDate5p5, [bGown, "berate"], "Berate", "Tell [bess.name] those people were idiots, and what they said doesn’t matter.");
	addButton(3, "Hug", bessDate5p5, [bGown, "hug"], "Hug", "Hug [bess.name]. Actions speak louder than words.");
	addButton(4, "Silence", bessDate5p5, [bGown, "silence"], "Silence", "Just be silent. You’re not sure what to say.");
}

public function bessDate5p5(opts:Array):void
{
	clearOutput();
	bessHeader();

	var bGown:Boolean = opts[0];
	var response:String = opts[1];

	if (response == "chastise")
	{
		output("You tell [bess.name] off for thinking such dark thoughts - you don’t want [bess.himHer] talking about suicide or even thinking about such things, ever. You make [bess.himHer] promise not to talk like that again.");
		
		output("\n\nIncredibly pliable in [bess.hisHer] current state, [bess.name] shivers and nods against your "+ bess.mf("shoulder", "chest") +". <i>“It just hurts so much...!”</i> You hold [bess.himHer] tightly against your body until [bess.heShe] manages to calm down a bit more.");
	}
	else if (response == "loveyou")
	{
		output("You tell [bess.hisHer] that you love [bess.himHer] and that it is your love for each other that matters, not what other people say or think. [bess.HeShe] nods meekly into your shoulder, sniffling against it.");
		
		output("\n\n<i>“It’s not fair. It’s just not fair.”</i> [bess.name] repeats over and over until [bess.heShe] eventually manages to calm down.");
	}
	else if (response == "berate")
	{
		output("You tell [bess.hisHer] that the people in that place were idiots without the slightest clue about either of you, or what a wonderful intelligent person [bess.heShe] is. You tell [bess.himHer] they are worse off for not knowing [bess.himHer] and that what they think isn’t worth dick.");
		
		output("\n\n[bess.name] trembles and nods into you, [bess.hisHer] fingers scrunching up as you talk. <i>“...I wasn’t the wonderful, intelligent one there.”</i> [bess.HeShe] slowly begins to calm down.");
	}
	else if (response == "hug")
	{
		output("You just hug [bess.himHer] tight, showing your love for [bess.himHer] through actions rather than words. You’re pretty sure all you can do is be here for [bess.himHer] right now.");
		
		output("\n\nAfter a while, [bess.name] eventually begins to calm down. [bess.HisHer] fingers clench as if clawing at your chest, [bess.hisHer] frantic breathing finally slowing.");
	}
	else /* if (response == "silence")*/
	{
		output("You have absolutely no idea what is the right thing to do or say in this kind of situation, so you freeze like a deer caught in the headlights. [bess.name] seems to take the initiative as [bess.heShe] clings to you, crying into your shoulder until it is slick with [bess.hisHer] tears.");
		
		output("\n\nIt takes a long time before [bess.name] eventually calms down. [bess.HisHer] panicked breathing eventually slows and [bess.hisHer] fingers loosen from your chest.");
	}

	output("\n\n<i>“...I was built to bring joy to people, but... what I saw tonight was just cruelty and scorn. It was so far from anything I’ve ever known that I don’t even... I just don’t have the words.”</i> [bess.name] lets out a dejected sigh. <i>“I never realized organics could get so much joy from... well, from hate. One moment they were disgusted with us, then they were overjoyed to see us suffer.”</i>");

	output("\n\nThe silver skinned synthetic leans back and looks at you with moist eyes. <i>“...I’m sorry, I wanted a perfect date. I dragged us out here and it was so horrible, I should have known better.”</i> You");
	if (pc.PQ() >= 30) output(" pick [bess.himHer] up and carry [bess.himHer] as you");
	else output(" help [bess.himHer] get back on [bess.hisHer] feet and then you");
	output(" both return to the ship. You pointedly ignore the stares of onlookers on your way out.");

	processTime(440 + rand(80));
	bessAffection(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessDate6():void
{
	clearOutput();
	bessHeader();

	output("After the disastrous date you had on Ekurana, [bess.name] wanted to go somewhere safe and secluded for the next one. [bess.HeShe] picked out Brelia again, since it doesn’t get much more secluded than a barely inhabited water planet.");
	
	output("\n\nSwitching into your swim gear, you both run along the black beaches and play about, this time you actually have time to go snorkeling. The sun beats down on you both as you swim through the rich blue water - there’s a kaleidoscopic assortment of marine life about. [bess.name] really gets into it.");

	if (celiseIsCrew())
	{
		output("\n\nYou see Celise floating through the water like a jellyfish, catching wriggling fish between her gelatinous tits. It’s a little eerie to watch, but you’re not surprised. She does love protein and there’s an abundance of it about. She waves at you and you wave back - she’s probably going to be full for the next week.");
	}

	if ((celiseIsCrew() && crew(true) > 2) || (!celiseIsCrew() && crew(true) > 1))
	{
		output("\n\nThe other crew members are also out enjoying all that Brelia has to offer. It’s kind of like having your own personal beach resort since you don’t have to share the whole island with anyone.");
	}

	output("\n\nEventually you stop for a break and have some lunch. Halfway through the meal, [bess.name] looks pensive for a moment and gets up, striding towards the tree line. When [bess.heShe] comes back, [bess.heShe]’s holding a ‘Yuck fruit’ in [bess.hisHer] hand, the local produce [bess.heShe] tried last time and named.");
	
	output("\n\nSitting down, [bess.heShe] rolls it around in [bess.hisHer] hand, looking up at you with a guilty expression. <i>“Um... I have a confession to make. These fruits... I don’t actually know what they taste like. When I bit into it, my taste sensors came back inconclusive. I lied about hating it... I was angry that I couldn’t taste something new with you, so I pretended that I could.”</i>");
	
	output("\n\n[bess.HeShe] presses [bess.hisHer] finger into the ripe skin of the fruit, letting out a little sigh. <i>“...My taste sensors aren’t that impressive. A lot of work was put into my emotional databases, my texture, my voice. Nobody cares if an AI can appreciate food, so I was given the bare minimum.”</i>");
	
	output("\n\n<i>“I’m not sure if what I taste is actually what that thing tastes like - for all I know, it could taste entirely different. The chefs at the Galyesha-Tsui were right about one thing - if I’d eaten their dishes, it would have been a total waste. There’s no way I would have been able to taste any of that food; it would have just registered as unidentified matter.”</i>");
	
	output("\n\nCome to think of it, the same thing happened when [bess.heShe] tried to cook that one time. The drink had registered as unidentified matter. <i>“Whenever that happens, it kind of tastes like mushy tofu. If tofu is actually what I’m tasting - I’ve got no way of telling.”</i>");
	
	output("\n\n<i>“I’ve been saving up for a taste-bud upgrade, but it’s very niche, so it’s going to cost a lot. But when I do get it, I hope I can cook for you... you know, properly this time.”</i>");
	
	output("\n\nThe way [bess.heShe] blushes makes you think that this is quite important to [bess.himHer]. [bess.HeShe] promises you that when [bess.heShe] does get the upgrade, [bess.heShe]’ll make sure that [bess.hisHer] food is not poisonous. The other thing [bess.heShe]’s going to do is actually taste a yuck-fruit for real.");

	output("\n\nYou tell [bess.himHer] that once [bess.heShe] gets [bess.hisHer] taste upgrade - and only then - can [bess.heShe] cook for you again and you’ll retract [bess.hisHer] lifetime ban.");

	processTime(440 + rand(80));
	bessAffection(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessMorningEvents():void
{
	// These scenes occur if the PC sleeps and wakes up on the ship as part of the 'morning messages'.

	// Repeat Scene.
	// Occurs bess is your lover AND you're not sleeping next to her at night (bessSleepW = false).
	/*
	if (flags["BESS_LOVER"] != undefined && flags["CREWMEMBER_SLEEP_WITH"] != "BESS" && hours < 8 && rand(3) == 0)
	{
		flags["BESS_MORNING_EVENT_NOTSLEEPINGWITH"] = 1;
	}
	*/

	flags["BESS_SLEEPWITH_DOMORNING"] = undefined;
	
	if (flags["BESS_MORNING_EVENT_1"] == undefined && rand(2) == 0)
	{
		bessMorningEvent1();
		return;
	}

	if (pc.lust() < 60)
	{
		bessMorningMessages();
	}
	else
	{
		bessHighLustMorningScene();
	}
}

public function bessMorningMessages():void
{
	clearOutput();
	bessHeader();

	flags["BESS_SLEEPWITH_DOMORNING"] = undefined;

	var msgs:Array = [
	"When you wake up, [bess.name] is curled around your midsection dozing happily, [bess.hisHer] JoyCord connected to the nearby power socket. You slide free and get up to go about your day, trying to not wake [bess.himHer] up.",
	"You are woken up by the sound of [bess.name]’s JoyCord unplugging from the wall and retracting back into [bess.hisHer] body. <i>“...Oops! Sorry, "+ bessPCName() +", I didn’t mean to wake you!”</i> [bess.HeShe] gives you a kiss to apologize, and then a few more just to be certain.",
	"You feel [bess.name]’s JoyCord trailing up your [pc.chest] as your " + bessLoverStatus() + " wakes you up. <i>“...It’s time to wake up, "+ bessPCName() +", or you’ll oversleep!”</i> Just like an alarm clock, [bess.heShe] doesn’t let you sleep a millisecond over the time you told [bess.himHer] to wake you up.\n\n... And just like an alarm clock, in your half frazzled state you hit [bess.hisHer] on the top of [bess.hisHer] head to let you snooze. <i>“ HEY! What do you think I am?!”</i> [bess.HeShe] shouts out in protest.",
	"You wake up to the feeling of silky soft lips pressing against your own. As your eyes slowly open, you see [bess.name] staring down at you with a happy smile, [bess.hisHer] [bess.eyeColor] eyes positively dancing. <i>“...Time to wake up, "+ bessPCName() +". Or not. I could just keep trying to kiss you awake?”</i>\n\nYou close your eyes and [bess.heShe] attempts to kiss you awake a bit more. <i>“...So hard to wake you up, I swear! It’s such a problem...”</i>",
	"When you wake up, you find [bess.name]’s face pressed up almost right against your cheek. You kiss [bess.himHer] awake and [bess.heShe] mumbles, kissing you back despite not being fully aware of [bess.hisHer] surroundings. Eventually [bess.heShe] comes to, [bess.hisHer] long lashes fluttering as [bess.hisHer] eyes slowly open. <i>“...Mmm, morning, "+ bessPCName() +".”</i>",
	"When you wake up, you find [bess.name]’s face pressed up almost right against your cheek. You try to kiss [bess.himHer] awake, and while [bess.heShe] doesn’t open [bess.hisHer] eyes, [bess.heShe] does smile and speak. <i>“...I’m still asleep. You’ll have to keep kissing me until I wake up.”</i>\n\nYou kiss [bess.himHer] quite a bit more, until [bess.heShe] can’t hold back any more - [bess.heShe] wraps [bess.hisHer] arms around your neck and kisses you back, breaking the facade. <i>“...Nope - I like your kisses too much, I can’t keep faking!”</i>",
	"You wake up to the feeling of [bess.name]’s naked body pressed against you, [bess.hisHer] deliciously smooth skin rubbing against your side. [bess.HisHer] thighs are parted and pressed against your [pc.leg]. <i>“...Five more minutes. I’ll boot up in five more minutes...”</i> [bess.HeShe] mumbles, nuzzling against your arm.",
	"You wake up to the sensation of [bess.name] leaning over and brushing the [pc.skinFurScalesNoun] of your cheek with [bess.hisHer] eyelashes. [bess.HeShe] flutters [bess.hisHer] eyes and gives you a ‘butterfly kiss’ to wake you up. <i>“...Morning, "+ bessPCName() +".”</i> [bess.HisHer] musical voice practically purrs.",
	"You feel a hand teasing your [pc.ass], squeezing your rump as you rouse in more ways than one. <i>“...Good morning, "+ bessPCName() +".”</i> [bess.name] positively purrs - your " + bessLoverStatus() + " knows exactly how to wake you up.",
	"You wake up before [bess.name] does, and reach around to squeeze [bess.hisHer] [bess.ass]. [bess.HeShe] moans and presses it into your palm, [bess.hisHer] eyes fluttering open. <i>“Mmm, good morning, "+ bessPCName() +".”</i> [bess.HeShe]’s positively purring. <i>“Can I interest you in something to eat - me, perhaps?”</i>",
	"You wake up and notice [bess.name] is already awake with the light on, sitting up with the pillows propped behind [bess.hisHer] back. [bess.HisHer] JoyCord is connected to the wall and [bess.heShe]’s reading a book - the same series [bess.heShe] was reading last night.\n\nYou ask [bess.himHer] if [bess.heShe] slept a wink last night, and [bess.heShe] flushes with embarrassment. <i>“...But, I had to see how the book ended, and it ended on a cliffhanger... so I had to read the next one.!”</i> [bess.HeShe] yawns, rubbing [bess.hisHer] eyes.",
	"You wake up and look over at [bess.name] - [bess.heShe]’s fast asleep with a half open book lying on [bess.hisHer] chest. Seems like [bess.heShe] fell asleep while reading again.",
	"You wake up to the smell of breakfast as [bess.name] puts down a whole meal in front of you, served on a tray. <i>“...I got up early and made you some breakfast. I figure that’s what good " + bessLoverStatus() + "s do, right?”</i>\n\nYou check to see if it’s instant food... which it is. It is safe to eat!",
	"You wake up and notice that [bess.name] is already awake; [bess.heShe]’s been sitting there watching your sleeping face with a big happy smile on [bess.hisHer] face. [bess.HeShe] blushes when you wake up and catch [bess.himHer] doing it."
	];

	var msg:String = "You wake up to the sensation of [bess.name] drawing [bess.hisHer]";
	if (bess.biggestTitSize() > 0) msg += " [bess.nipples]";
	else msg += " bare chest";
	msg += " over you, trailing";
	if (bess.biggestTitSize() > 0) msg += " them";
	else msg += " it";
	msg += " along your [pc.skinFurScalesNounSimple]. <i>“...Morning, "+ bessPCName() +".”</i> [bess.HisHer] voice practically purrs.";

	msgs.push(msg);

	if (pc.hasCock())
	{
		msg = "You feel a hand teasing your [pc.cock], stroking it slowly as you rouse in more ways than one. <i>“...Good morning, "+ bessPCName() +".”</i> [bess.name] positively purrs - your " + bessLoverStatus() + " knows exactly how to wake you up.";
		msgs.push(msg);
	}

	if (bess.hasCock())
	{
		msg = "You wake up before [bess.name] does, and notice [bess.hisHer] stiff [bess.cock]. You reach over and begin to stroke it, causing [bess.himHer] to moan and wiggle in [bess.hisHer] sleep. [bess.HeShe] wakes up by shooting [bess.hisHer] [bess.cum] all over [bess.hisHer] [bess.belly], [bess.hisHer] eyes fluttering open with a truly blissful expression.";
		msgs.push(msg);
	}

	if (pc.hasVagina())
	{
		msg = "You feel fingers teasing at your [pc.pussy], stroking your slit slowly as you rouse in more ways than one. <i>“...Good morning, "+ bessPCName() +".”</i> [bess.name] positively purrs - your " + bessLoverStatus() + " knows exactly how to wake you up.";
		msgs.push(msg);
	}

	if (bess.hasVagina())
	{
		msg = "You wake up before [bess.name] does, and slip your hand sneakily between [bess.hisHer] [bess.thighs]. Your [pc.fingers] stroke [bess.hisHer] [bess.pussy] and cause [bess.himHer] to moan and wiggle [bess.hisHer] hips. [bess.HeShe] wakes up by cumming hard against your wonderful digits, [bess.hisHer] eyes fluttering open with a truly blissful expression.";
		msgs.push(msg);
	}

	output(RandomInCollection(msgs));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessHighLustMorningScene():void
{
	clearOutput();
	bessHeader();

	flags["BESS_SLEEPWITH_DOMORNING"] = undefined;

	output("You are roused from sleep by the sensation of [bess.name]’s [bess.chest] brushing against your naked [pc.skinFurScalesNoun].");
	if (bess.bellyRating() > 0) output(" A bit lower down, you feel [bess.name]’s [bess.belly] pressing against you and drawing along your [pc.skinFurScalesNoun].");
	output(" Your exposed neck is being suckled gently all the while.");
	
	output("\n\nYou can feel [bess.name]’s [bess.thighs] wrapping around your lower half and [bess.hisHer] [bess.ass] rubbing against your [pc.legs]. [bess.HisHer] loins rub sensuously against yours.");
	
	output("\n\n<i>“...Good morning, "+ bessPCName() +". Is this the way you like your " + bessLoverStatus() + " to wake you up?”</i> [bess.name] coyly questions as [bess.hisHer] fingers dance along your [pc.chest]. [bess.HeShe] sneaks up and gives you a long, hard kiss.");

	// [Lie Together] [Make Out] [Nothing]
	clearMenu();
	addButton(0, "LieTogether", bessMorningLieTogether);
	addButton(1, "MakeOut", bessMorningMakeOut);
	addButton(2, "Nothing", bessMorningNothing);
}

public function bessMorningLieTogether():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] you’d like to lie with [bess.himHer] and enjoy the sensation of [bess.himHer] pressed against you. [bess.HeShe] happily complies and rests against your naked [pc.skinFurScalesNoun], snuggling in to your chest. You can feel [bess.hisHer]");
	if (bess.hairLength > 0) output(" soft silky hair brushing along your [pc.skin], [bess.hisHer]");
	output(" warm breath gently teasing you. <i>“...I love you, "+ bessPCName() +".”</i>");

	output("\n\nYou enjoy the happy moment together until it is finally time to disentangle from each other.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessMorningMakeOut():void
{
	clearOutput();
	bessHeader();

	output("You capture [bess.name]’s mouth with your own and make out with [bess.himHer]. You can feel [bess.hisHer] arms sliding around your neck as [bess.heShe] pushes against you with fevered urgency, [bess.hisHer] tongue joyously searching for yours. Whenever you kiss [bess.himHer], [bess.heShe] always tastes so deliciously sweet.");

	output("\n\nEach kiss from [bess.himHer] is intoxicating; it is a long time before you both finally part lips and disentangle. It seems [bess.name] is even having trouble standing - [bess.heShe] stops for a moment to reorient [bess.himHer]self, a giddy look of pleasure on [bess.hisHer] face.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessMorningNothing():void
{
	clearOutput();
	bessHeader();

	output("You don’t have time for any hijinks this morning, so you pull away from [bess.name]. [bess.HeShe] is definitely pouting as you leave [bess.himHer] there naked. <i>“...Aww, no fooling around this morning?”</i> [bess.HeShe] looks thoroughly disappointed.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessMorningEvent1():void
{
	clearOutput();
	bessHeader();

	flags["BESS_MORNING_EVENT_1"] = 1;

	output("You find [bess.name] staring at you when you wake up with a look on [bess.hisHer] face. It’s a bit of a hard look to identify - you’re not sure if [bess.heShe]’s thoughtful, grumpy, or wistful.");
	
	output("\n\nWhen you ask [bess.himHer] what [bess.heShe]’s thinking, turns out it is all of the above. <i>“I was just thinking how nice it must be to power down and dream like you do. It must be great to be able to see strange and wonderful things when you sleep. Kind of like watching an interactive holo whenever you sleep, you know?”</i>");
	
	output("\n\nYou’re pretty sure nobody has ever explained to [bess.name] how dreams work. You tell [bess.himHer] that dreams aren’t exactly as clear as holos, and a lot of people don’t even remember them. <i>“...Really? That sounds very inconvenient. Should I tell you what you mumble in your sleep? I could tell you what you were dreaming about.”</i>");
	
	output("\n\nYou cough loudly - you never knew you did that. <i>“Don’t worry, what you talk about isn’t </i>too<i> embarassing.”</i> Apparently that means that whatever you talk about <i>is</i> embarrassing. You press [bess.himHer] for details, but [bess.heShe] remains tight lipped - is [bess.heShe] just winding you up?");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessAtTavros():Boolean
{
	if (flags["BESS_LOCATION"] == BESS_AT_TAVROS) return true;
	return false;
}

public function approachBessAtTavros():void
{
	clearOutput();
	bessHeader();

	if (flags["BESS_LOVER"] == undefined && flags["BESS_FRIEND"] == undefined)
	{
		output("You walk up to [bess.name]. You notice [bess.heShe] smiles and waves, it seems [bess.heShe] has been diligently waiting for your return. It seems that is what [bess.heShe] spends ALL [bess.hisHer] time doing given that [bess.heShe] doesn’t need to eat or sleep.");

		output("\n\n<i>“Hello, "+ bessPCName() +"! Did you want me to accompany you on your travels now, or did you have something else in mind?”</i>");

		clearMenu();
		addButton(0, "TakeWith", keepBessYouSloot);
		addButton(1, "Sell", sellOfBessDatWhore);
		addButton(2, "Authorities", handBessOverToAuthorities);
		addButton(3, "Nothing", mainGameMenu);
		return;
	}
	else
	{
		output("You find [bess.name] standing in the Tavros Station hangar. After the falling out you both had, [bess.heShe] struggles to meet your gaze; things seem fairly awkward.");

		output("\n\n... Why is [bess.heShe] at the hangar? You thought you had both decided to go your separate ways.");
		
		//[Talk] [Nothing]
		clearMenu();
		addButton(0, "Talk", bessAtTavrosTalk);
		addButton(1, "Nothing", mainGameMenu);
		return;
	}
}

public function bessAtTavrosTalk():void
{
	clearOutput();
	bessHeader();

	output("You ask [bess.name] what exactly [bess.heShe] is doing in your hangar at Tavros Station. [bess.HeShe] lets out a long sigh, looking at the floor just below your feet. Eventually, [bess.heShe] speaks to you about it.");
	
	output("\n\n<i>“...I’m an unlisted AI without a master. I can’t get passage off of Tavros Station because I can’t own papers, only my ‘owner’ can. People keep trying to escort me to lost and found, which is a lot better than what would happen if they saw my half scratched off barcode.”</i> [bess.HeShe] explains.");
	
	output("\n\n<i>“I can’t earn credits because nobody wants to pay a robot to work; they all tell me I should be doing it for free. If I talk back, they call tech support and try to get me ‘fixed up’, so the only place I can hide out is here... at least until I come up with a clever plan.”</i>");
	
	output("\n\nIt sounds like [bess.heShe]’s lucky to have escaped being scrapped, let alone being able to get a job. Even if [bess.heShe] winds up on another planet, [bess.heShe]’ll no doubt face the same sort of persecution.");
	
	output("\n\n<i>“...Look, um, I’m sorry I’m crashing in your hangar. I promise I’ll be out of here once I can come up with some sort of plan to get papers and credits. Lost and found keeps returning me here anyway - it’s the only safe place I’ve got at the moment.”</i>");

	// [Sure] [Nope] [Invite]
	clearMenu();
	addButton(0, "Sure", bessAtTavrosSure);
	addButton(1, "Nope", bessAtTavrosNope);
	addButton(2, "Invite", bessAtTavrosInvite);
}

public function bessAtTavrosSure():void
{
	clearOutput();
	bessHeader();

	output("[bess.name] lets out a sigh of relief, finally managing to meet your gaze. <i>“...Thank you, "+ bessPCName() +". I’ll make it up to you somehow, someday.”</i>");
	
	output("\n\nConsidering [bess.heShe] can’t even earn a single " + (isAprilFools() ? "dogecoin" : "credit") + " for [bess.himHer]self at the moment, it seems that day will be very far away indeed.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessAtTavrosNope():void
{
	clearOutput();
	bessHeader();
	
	output("You decide [bess.heShe] can’t stay in your hangar and kick [bess.himHer] out. [bess.HeShe] decided [bess.heShe] was going to leave the ship - [bess.heShe] can’t continue relying on your good nature.");
	
	output("\n\n[bess.name] takes the elevator out before you call the authorities. You doubt you’ll be seeing [bess.himHer] about again.");
	
	output("\n\n(<b>[bess.name] is no longer part of your crew.</b>)");
	
	flags["BESS_LOCATION"] = BESS_DISABLED;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS") flags["CREWMEMBER_SLEEP_WITH"] = undefined;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessAtTavrosInvite():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that [bess.heShe]’s welcome back on your ship if [bess.heShe] wants to come with you. [bess.HeShe] looks at you with clearly mixed feelings; you didn’t leave on the best terms after all. That said, [bess.hisHer] situation is quite dire.");
	
	output("\n\n<i>“...If I come with you, on your ship, does that mean we’re... friends again?”</i> [bess.name] is trying very hard not to get [bess.hisHer] hopes up as [bess.heShe] stares at you with [bess.eyeColor] eyes.");

	clearMenu();
	addButton(0, "Yes", bessAtTavrosYes);
	addButton(1, "No", bessAtTavrosNo);
}

public function bessAtTavrosYes():void
{
	clearOutput();
	bessHeader();

	output("<i>“...That’s... that’s all I ever wanted!”</i> [bess.name] begins to tear up; clearly being off the ship has been an incredibly trying experience. [bess.HisHer] brave face crumbles all at once as [bess.heShe] gives you a hug, glad to be back on board again.");
	
	output("\n\n(<b>[bess.name] has now returned to the ship as a follower!</b>)");

	flags["BESS_AFFECTION"] = 10;
	flags["BESS_LOCATION"] = BESS_ON_CREW;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessAtTavrosNo():void
{
	clearOutput();
	bessHeader();

	output("You tell [bess.name] that you are still not friends, and [bess.hisHer] return to the ship would be purely as acquaintances.");
	
	output("\n\nEither [bess.hisHer] pride is too strong, or [bess.heShe] can’t bear the thought, because [bess.heShe] refuses your offer. <i>“...If that’s the case, I’ll stay on Tavros. Either way, I’ll be somewhere where I’m not really welcome... being here would hurt less.”</i>");
	
	output("\n\nYou can’t seem to change [bess.hisHer] mind, so you leave [bess.himHer] be for now.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessSexMenu():void
{
	clearMenu();
	//[GetBJ] [GiveDoggy] [GetDoggy] [Cunni] [BreastFeed] [Milkers]

	if (pc.hasCock())
	{
		addButton(0, "GetBJ", bessGetBlowjob, undefined, "Get Blowjob", "Get [bess.name] to give you a blowjob! You must have a cock.");
		addButton(1, "GiveDoggy", bessGiveDoggy, undefined, "Give Doggystyle", "Give it to [bess.name], doggy style! You must have a cock.");
	}
	else
	{
		addDisabledButton(0, "GetBJ", "Get Blowjob", "Get [bess.name] to give you a blowjob! You must have a cock.");
		addDisabledButton(1, "GiveDoggy", "Give Doggystyle", "Give it to [bess.name], doggy style! You must have a cock.");
	}

	if (bess.hasCock())
	{
		// If you've equipped Bess with the saurian / dino-dick, the pc's orifice capacity must be able to take a 20 inch long, 12 inch wide cock.
		if (bess.cocks[0].cType == GLOBAL.TYPE_SAURIAN)
		{
			if ((pc.hasVagina() && pc.cuntThatFits(bess.cockVolume(0)) >= 0) || pc.analCapacity() >= bess.cockVolume(0)) addButton(2, "GetDoggy", bessGetDoggy, undefined, "Get Doggystyle", "Take it from [bess.name], doggy style! [bess.HeShe] must have a cock.");
			else addDisabledButton(2, "GetDoggy", "Get Doggystyle", "Take it from [bess.name], doggy style! [bess.HeShe] must have a cock that [bess.heShe] can squeeze into you!");
		}
		else
		{
			addButton(2, "GetDoggy", bessGetDoggy, undefined, "Get Doggystyle", "Take it from [bess.name], doggy style! [bess.HeShe] must have a cock.");
		}
	}
	else
	{
		addDisabledButton(2, "GetDoggy", "Get Doggystyle", "Take it from [bess.name], doggy style! [bess.HeShe] must have a cock.")
	}

	if (pc.hasVagina())
	{
		addButton(3, "GetEaten", bessGetCunni, undefined, "GetEatn", "Get [bess.name] to eat you out. You must have a pussy.");
	}
	else
	{
		addDisabledButton(3, "GetEaten", "GetEatn", "Get [bess.name] to eat you out. You must have a pussy.");
	}

	if (bess.isLactating())
	{
		addButton(4, "Breastfeed", bessBreastFeed, undefined, "Breastfeed", "Drink [bess.hisHer] [bess.milkNoun]. [bess.name] must be lactating and have breasts.");

		if (!bessIsDom()) addButton(5, "Milkers", bessMilkers, undefined, "Milkers", "Milk [bess.hisHer] breasts. [bess.name] must be lactating, have breasts, and not be Dominant.");
		else addDisabledButton(5, "Milkers", "Milkers", "Milk [bess.hisHer] breasts. [bess.name] must be lactating, have breasts, and not be Dominant.");
	}
	else
	{
		addDisabledButton(4, "Breastfeed", "Breastfeed", "Drink [bess.hisHer] [bess.milkNoun]. [bess.name] must be lactating and have breasts.");
		addDisabledButton(5, "Milkers", "Milkers", "Milk [bess.hisHer] breasts. [bess.name] must be lactating, have breasts, and not be Dominant.");
	}

	addButton(14, "Back", bessFollowerMenu);
}

public function bessGetBlowjob():void
{
	clearOutput();
	bessHeader();

	var cockIdx:int = pc.biggestCockIndex();

	if (bessIsEqual())
	{
		output("Damn, you’re so hard right now! Your [pc.cocks]");
		if (pc.cocks.length == 1) output(" is");
		else output(" are");
		output(" pressing against");
		if (pc.isCrotchGarbed()) output(" the inside of your [pc.lowerGarment]");
		else output(" your [pc.belly]");
		output(", aching to be gloriously appeased.");
		
		output("\n\nYou turn to [bess.name] and lustily eye the silver-skinned sex bot. Imagining [bess.himHer] stroking your [pc.cocks] with [bess.hisHer] "+ bess.mf("firm", "soft") +" fingers, teasing your [pc.cockHead] with [bess.hisHer] tongue... it’s enough to drive you mad!");

		// Random Output #1 (50% chance):
		if (rand(2) == 0)
		{
			output("\n\n<i>“Hey, "+ bessSexName() +", I’m feeling pretty hard right now... think you could give me a hand?”</i>");
			
			output("\n\n<i>“I can give you more than that, "+ bessPCSexName() +",”</i> [bess.name] quips. [bess.HeShe] then saunters up to you");
			if (bess.isNude()) output(" - gloriously naked -");
			else if (bess.armor is EmptySlot) output(" - clad in nothing but [bess.gear] -");
			else output(" in [bess.hisHer] [bess.armor]");
			output(" and presses against your chest. <i>“A whole");
			if (flags["BESS_CUMDUMP"] == 1) output(" cum-slicked");
			output(" mouth for you to sheathe your prick in.”</i>");
			
			output("\n\nOne of those "+ bess.mf("firm", "soft") +" hands you fantasized about gravitate downward.");
			if (pc.isNude()) output(" Suddenly [pc.oneCock] is being gripped at the base and delightfully squeezed");
			else
			{
				output(" Your bulge is being stroked");
				if (pc.armor is EmptySlot) output(" through your [pc.lowerUndergarment], teasing it through the all-too-thin fabric");
				output(". Electric, twitching pleasure seizes your straining shaft");
				if (pc.cocks.length > 1) output("s");
				output(". Y-you haven’t even started yet!");
			}
		}
		else
		{
			output("\n\n<i>“Hey, "+ bessSexName() +", think you can do something about this?”</i> You gesture down to");
			if (pc.isNude()) output(" your bared loins, your [pc.cockColor] arousal brazenly on display");
			else
			{
				output(" the obvious bulge");
				if (pc.armor is EmptySlot) output(" in your [pc.lowerUndergarment]");
				output(".");
			}
			
			output("\n\n[bess.name] turns to you and quirks an eyebrow. However, instead of immediately answering, [bess.heShe] slowly strides up to you");
			if (bess.isNude()) output(", wearing not a thing");
			else if (bess.armor is EmptySlot) output(", wearing nothing but [bess.gear]");
			else output(" in [bess.hisHer] [bess.armor]");
			output(". [bess.HeShe] then presses [bess.hisHer] chest sensuously against you.");
			
			output("\n\n<i>“...So, "+ bessPCSexName() +", let me get this straight. You want me to get down on my knees, place [pc.oneCock] in my");
			if (flags["BESS_CUMDUMP"] == 1) output(" already cum-filled");
			output(" mouth, and give you oral pleasure... is that it?”</i> There’s a "+ bess.mf("devilish glint", "playful glimmer") +" in [bess.hisHer] [bess.eyeColor] eyes.");
			
			if (pc.isNice())
			{
				output("\n\n<i>“Oh, well, did you not want to?”</i> You ask. Far be it from you to force [bess.himHer] into something");
				if (flags["BESS_LOVER"] != 1 && flags["BESS_FRIEND"] != 1) output(", even if [bess.heShe] is a sex bot!");
			}
			else if (pc.isMischievous())
			{
				output("\n\n<i>“Oh, well if you don’t want to - I guess I could handle it myself?”</i> You tease.");
			}
			else
			{
				output("\n\nYou nod firmly. You’re not sure how you could have been clearer. <i>“...Are you going to suck my cock or not?”</i>");
			}
	
			if (flags["BESS_LOVER"] == 1)
			{
				output("\n\n<i>“...I’m just teasing, "+ bessPCSexName() +"! I am your " + bessLoverStatus() + ", giving you blowjobs on demand is part of that - right?”</i> [bess.HeShe] playfully winks, cupping your cheeks in her hands, and stealing a quick kiss.");
				if (!bess.isNude() && !pc.isNude()) output(" Both of you then begin");
				else if (!pc.isNude()) output(" You then begin");
				else output(" [bess.HeShe] then begins");
				output(" to strip.");
			}
			else if (flags["BESS_FRIEND"] == 1)
			{
				output("\n\n<i>“I’m just messing with you, "+ bessPCSexName() +".");
				if (rand(2) == 0) output(" Of course I’ll go down on you. That’s what friends are for, right?");
				else output(" Though I’m pretty sure this is what’s called ‘friends with benefits’,");
				output("”</i> [bess.name] winks and gives you a swift kiss.");
				if (!bess.isNude() && !pc.isNude()) output(" Both of you then begin");
				else if (!pc.isNude()) output(" You then begin");
				else output(" [bess.HeShe] then begins");
				output(" to strip.");
			}
			else
			{
				output("\n\n<i>“I would love to suck your cock, "+ bessPCSexName() +" - nothing would make me happier.”</i> [bess.name] bashfully admits.");
				if (!bess.isNude() && !pc.isNude()) output(" Both of you then begin");
				else if (!pc.isNude()) output(" You then begin");
				else output(" [bess.HeShe] then begins");
				output(" to strip.");
			}
		}
	
		bessTopStripScene();

		output("\n\n");
		if (!bess.isNude()) output("Now that [bess.Name] has stripped off [bess.hisHer] clothes, [bess.heShe]");
		else output("Your mechanical lover");
		output(" dutifully sinks down to [bess.hisHer] knees. You present your proud prick");
		if (pc.cocks.length > 1) output("s");
		output(" to [bess.himHer]. With a lusty look in [bess.hisHer] glimmering eyes, [bess.hisHer] reaches out to tease [pc.oneCockHead]. You groan as [bess.hisHer] fingertips roll along your sensitive, engorged flesh. Even the slightest brush is exquisitely intense!");

		output("\n\n<i>“Mmm, if you like that, "+ bessPCSexName() +", wait until I really get going,”</i> [bess.Name] "+ bess.mf("huskily utters", "practically purrs") +". Inching forward,[bess.heShe] lavishes your [pc.base] with a long, lusty kiss.");
		if (flags["BESS_CUMDUMP"] == 1) output(" Second-hand cum smears along your taut skin, marking it with the second-hand sperm of other men");
		else output(" [bess.HeShe] then suckles on it long and hard");
		output(". A tiny bit of flesh is teased by [bess.hisHer] diligent tongue as [bess.heShe] lovingly lashes your loins.");

		output("\n\nWhen [bess.heShe] finally pulls back, you look down, and there is a sizable hickey left there. There’s a proud little look on [bess.hisHer] face as [bess.heShe] looks up from");
		if (pc.isBiped()) output(" between your legs");
		else output(" at you");
		output(".");

		if (flags["BESS_FRIEND"] == 1 || flags["BESS_LOVER"] == 1)
		{
			output("\n\n<i>“Mine. Your junk belongs to me");
			if (flags["BESS_FRIEND"] == 1) output("... at least for today");
			output(".”</i> [bess.Name] cheekily whispers, [bess.eyeColor] eyes glimmering. <i>“I’m claiming it. I’ll hang a flag from it if I have to.”</i>");
			
			output("\n\nYou chuckle at the idea of [bess.name] claiming your flag pole");
			if (pc.cocks.length > 1) output("s");
			output(" for [bess.himHer]self. Your chuckling turns into a low, guttural moan, though, as [bess.heShe] clamps [bess.hisHer] lips around");
			if (pc.cocks.length > 1) output(" one of");
			output(" your cock-slit");
			if (pc.cocks.length > 1) output("s");
			output(" and greedily sucks on it.");
		}
		else
		{
			output("\n\n<i>“Your [pc.cocks]");
			if (pc.cocks.length == 1) output(" is");
			else output(" are");
			output(" wonderful,”</i> [bess.name] dreamily whispers. <i>“Thank you for letting me service");
			if (pc.cocks.length == 1) output(" it");
			else output(" them");
			output(", "+ bessPCSexName() +".”</i>");
			
			output("\n\nYou chuckle at [bess.name]’s cock worship, though it turns into a low, guttural moan as the silky-lipped synthetic clamps [bess.hisHer] lips around");
			if (pc.cocks.length > 1) output(" one of");
			output(" your cock-slit");
			if (pc.cocks.length > 1) output("s");
			output(", greedily sucking on it. Hot damn!");
		}
	}
	else if (bessIsDom())
	{
		output("Out of the blue, [bess.name] strides up to you,");
		if (bess.isNude()) output(" wearing nothing at all... but wearing it <i>well</i>");
		else if (bess.armor is EmptySlot) output(" clad in nothing but [bess.gear]");
		else output(" looking thoroughly sexy in [bess.hisHer] [bess.armor]");
		output(". [bess.HeShe] puts a hand on [bess.hisHer] hip. There’s a devilish glint in [bess.hisHer] [bess.eyeColor] eyes and subtle smile playing on [bess.hisHer] [bess.lips].");

		output("\n\n<i>“Whip out your dick, "+ bessPCSexName() +". It’s time for inspection,”</i> [bess.name] commands, gesturing to");
		if (pc.isNude()) output(" your exposed crotch");
		else if (!(pc.armor is EmptySlot)) output(" the pointed bulge in your [pc.armor]");
		else output(" [pc.lowerUndergarment]");
		output(".");
		
		output("\n\nYou blush self-consciously, but at the same time, a delicious little shiver runs up your spine. [bess.HeShe]’s taking notice of you! At the same time, the timing is really inconvenient.");
		
		output("\n\n<i>“...B-but "+ bessSexName() +", I was going to--”</i> You trail off as [bess.hisHer] literally iron gaze fixates on you. You gulp. There’s no point telling [bess.hisHer] you were going to do something <i>else</i>, since [bess.hisHer] orders take first priority.");
		
		output("\n\nResigning yourself to your fate, you");
		if (pc.PQ() < 25) output(" helplessly");
		if (pc.isCrotchGarbed()) output(" strip off your gear and");
		output(" hold out your [pc.cocksNounSimple].");
		if (pc.cocks.length == 1) output(" It just hangs");
		else output(" They just hang");
		output(" out there under [bess.hisHer] intense gaze, though you have no idea <i>why</i> [bess.heShe]’s asked for");
		if (pc.cocks.length == 1) output(" it");
		else output(" them");
		output(" just yet. [bess.HisHer] authoritative stare causes both your cheeks and your exposed rod");
		if (pc.cocks.length > 1) output("s");
		output(" to burn with a pleasurable heat.");

		output("\n\n<i>“Wrists - behind your back and together, </i>now<i>,”</i> [bess.name] sharply orders you, [bess.hisHer] voice like a cracking whip.");
		
		output("\n\nYou slide your wrists behind your back and together, doing as [bess.heShe] asks. After all, why wouldn’t you obey [bess.himHer]? A fluttering feeling rises in your chest as you wonder what [bess.heShe] will order you to do next!");
		
		output("\n\nCircling around you now, you feel soft leather wrap around your wrists and tighten. Is [bess.heShe] cuffing you? You blush as your arms are bound and cuffed together, restricting your movement as [bess.heShe] desires. They feel snug, but not too tight.");
		
		output("\n\n<i>“Good [pc.boyGirl].”</i> You feel a stroking along your forearms, making you shiver with delight. A warm sense of trust fills every inch of your being - you’re totally in [bess.hisHer] hands now.");
		if (pc.hasFeet())
		{
			output(" Your exhilaration skyrockets as [bess.heShe] cuffs your ankle");
			if (pc.legCount > 1) output("s");
			output(" as well. Every cuff secured is followed by the dancing of [bess.hisHer] fingers along your naked [pc.skinFurScalesNoun].");
		}
		
		output("\n\nFinishing things off, you feel a wrapping of snug leather around your neck. It’s your collar! You flush with delight - nothing pleases you more than wearing your collar");
		if (!pc.hasTail()) output(", and if you had a tail, you’d be wagging it");
		else
		{
			output(". Your [pc.tails] excitedly swish");
			if (pc.tailCount == 1) output("es");
			output(" side to side.");
		}
		
		output("\n\n<i>“I’m so happy, "+ bessSexName() +",”</i> you whisper. Nothing makes you feel more complete than being cuffed and collared.");
		
		output("\n\n<i>“So cute.”</i> Your mechanical "+ bess.mf("dom", "domme") +" responds, moving face to face with you. [bess.HeShe] then hooks [bess.hisHer] fingers through the metal ring dangling from the neck of your collar. With the slightest of tugs, [bess.heShe] forces you to look [bess.himHer] in the eyes, mesmerizing you with [bess.hisHer] stare!");
		
		output("\n\n<i>“You’re properly adorned now, "+ bessPCSexName() +". If I want you to bark like a dog, you will bark. If I want you to get on all fours, you will do so. You will obey all my instructions immediately and without complaint. Is that understood?”</i> [bess.name]’s eyes tell you all you need to know - [bess.heShe]’s waiting for a <i>prompt</i> and <i>courteous</i> reply.");
		
		output("\n\n<i>“Yes, "+ bessSexName() +",”</i> you quickly answer. You’re physically trembling with delight! Being cuffed and collared has really got you in the mood, even more so with your wrists bound and your [pc.cocks] shamefully hanging out.");

		output("\n\nIt seems having");
		if (pc.cocks.length == 1) output(" it");
		else output(" them");
		output(" hang out was definitely part of [bess.name]’s plan. With a "+ bess.mf("hungry growl, your mechanical dom", "sultry smile, your mechanical domme") +" reaches down and teases [pc.oneCock] with [bess.hisHer] fingertips.");
		if (pc.cocks.length == 1) output(" It stiffens and jerks upward, saluting its silvery [bess.master].");
		
		output("\n\n<i>“Oho! Are you getting turned on by this, "+ bessPCSexName() +"?”</i> [bess.heShe] asks. You feel [bess.hisHer] strong, silvery, wrapping around [pc.oneCock]. You twitch shamefully in [bess.hisHer] hand. Pearls of [pc.cumColor] pre-cum are already forming at your tip!");
		
		output("\n\n<i>“N-no, "+ bessSexName() +"!”</i> You whimper out, lying through your teeth. A few more strokes and you’re gasping for air. Shamefully, you buck your hips against [bess.hisHer] stroking hand, your actions contradicting your words!");
		
		output("\n\n<i>“Is that so? It must be someone else who’s getting hard in my hand,”</i> [bess.name] teases, firmly squeezing your [pc.cock]. <i>“...Tell me, who");
		if (pc.cocks.length == 1) output(" does this");
		else output(" do these");
		output(" [pc.cocks] belong to, "+ bessPCSexName() +"?”</i>");
		
		output("\n\nYou hesitate to say it out loud - a hesitation that is swiftly punished. You feel a sharp, delicious spank on your bare buttocks. Wiggling madly in place, you whimper out an answer. <i>“Y-You, "+ bessSexName() +" - my [pc.cocks] belong to you!”</i> Your rawly spanked rump resonates with tingling, stinging pleasure - another thing that is also [bess.hisHer] prized property!");
		
		output("\n\n<i>“Good [pc.boyGirl]. I’m going to play with your naughty prick");
		if (pc.cocks.length > 1) output("s");
		output(" now. You’re not to cum until I tell you to - understood?”</i>");
		
		output("\n\nYou gulp and nod. Feeling [bess.name] stroke your [pc.cock], you’re not sure you can keep it. Still, you’ll try, to make your [bess.master] proud! The moment [bess.heShe] starts to seriously stroke your aching erection");
		if (pc.cocks.length > 1) output("s");
		output(", you realize it’s easier said than done. [bess.HisHer] fingers gliding along your aching erection feel positively divine. The slightest squeeze of your shaft forces a delighted sigh of pleasure from your lips.");
		
		output("\n\nSpeaking of lips, you feel [bess.hisHers] kissing your neck just below your collar, lavishing it as [bess.hisHer] hand thoroughly milks your sheathe. You tremble and whimper, cuffed in place, and feeling so <i>owned</i> and <i>adored</i>. You try your best not to buck your hips against [bess.hisHer] hands - restraining yourself and being <i>very</i> good. The rest of you is trembling and you arch your back, trying to hold back the coiling pleasure building deep in your loins. Your patience is soon rewarded.");
		
		output("\n\n<i>“...There’s a good [pc.boyGirl]. Now stand still while I taste my favorite piece of property.”</i> Your metallic [bess.master] huskily orders. You feel a light nip at your ear, shortly before [bess.heShe] pulls away. You beam with pride and do as instructed, trying your best to not move a single inch. ");

		bessTopStripScene();

		output("\n\n");
		if (!bess.isNude()) output("Now that [bess.Name] has stripped off [bess.hisHer] clothes, [bess.heShe]");
		else output("Your mechanical lover");
		output(" sultrily sinks down to [bess.hisHer] knees. Grabbing [pc.oneCock] firmly in hand, your mechanical [bess.master] possessively kisses your privates.");
		
		output("\n\nYou bite back a moan and squirm in your cuffs - you can’t believe [bess.heShe]’s having [bess.hisHer] way with your [pc.cock]!");
		if (flags["BESS_CUMDUMP"] == 1) output(" Second-hand cum smears along your taut skin, marking it with the second-hand sperm of other men");
		else output(" [bess.HeShe] suckles on it long and hard");
		output(". A tiny bit of flesh is teased by [bess.hisHer] diligent tongue as [bess.heShe] lovingly lashes your loins.");
		
		output("\n\nWhen [bess.heShe] finally pulls back, you look down, and there is a sizable hickey left there. You flush with the knowledge that you have been marked by [bess.himHer] ‘down there’. You and your cock truly are [bess.hisHer] stamped property.");
		
		output("\n\n<i>“I’ve branded you, "+ bessPCSexName() +". It only makes sense to mark your property, right?”</i> [bess.name] smiles. [bess.name] then leans forward and lovingly laps your marred rod, sending delicious little shivers shooting up your spine. <i>“...Your");
		if (pc.cocks.length == 1) output(" cock is");
		else output(" cocks are");
		output(" nice and clean. I see you’ve been a good [pc.boyGirl] by taking care of it for me.”</i>");
		
		output("\n\n<i>“Yes, "+ bessSexName() +".”</i> You were just being clean, but you make a mental note to keep doing it because your [bess.master] likes it. Knowing you made [bess.himHer] happy makes you swell with pride!");
	}
	else // bessIsSub()
	{
		output("You look down at your [pc.cocks]");
		if (!pc.isNude()) output(" straining against your [pc.lowerGarment]");
		else output(" sticking up rudely against your [pc.belly]");
		output(". Damn, you’re horny! For a moment, you consider doing something about it yourself... but then, what are submissives for?");
		
		output("\n\n<i>“Hey, "+ bessSexName() +"!”</i> You call [bess.name] over.");
		
		output("\n\nSeconds within you calling, [bess.heShe] bounds up,");
		if (bess.isNude()) output(" butt-naked as usual");
		else if (bess.armor is EmptySlot) output(" clad in nothing but [bess.gear]");
		else output(" looking thoroughly sexy in [bess.hisHer] [bess.armor]");
		output(".");
		if (bess.hairLength > 0) output(" [bess.name] coyly runs a hand through [bess.hisHer] [bess.hairColor] hair,");
		else output(" [bess.name] stands there with hands clasped obediently in front of [bess.himHer],");
		output(" an eager look in [bess.hisHer] [bess.eyeColor] eyes.");
		if (flags["BESS_CUMDUMP"] == 1) output(" [bess.HisHer] lips are positively smeared with thick globs of semen, deposited from countless cocks. Time to add to the tally...");
		
		output("\n\n<i>“On your knees,”</i> You command, all the while shooting [bess.himHer] a steely stare.");
		if (!pc.isNude()) output(" At the same time, you purposefully strip off your things and toss them lazily aside.");
		
		output("\n\n[bess.name] gulps and immediately drops to [bess.hisHer] knees. With no idea what you have planned, [bess.heShe] diligently kneels before you. [bess.HisHer] hands are neatly balled up in [bess.hisHer] lap, [bess.hisHer] back arched and adoring eyes directed downwards at your [pc.feet].");
		
		if (bess.isChestGarbed()) output("<i>“Now, strip off your clothes. Just the top - nothing else.”</i>");

		bessTopStripScene();

		output("\n\nNow that [bess.Name]"); 
		if (!bess.isNude()) output(" has stripped off [bess.hisHer] clothes");
		else output(" is properly positioned");
		output(", you pull out some leather cuffs.");

		output("\n\n<i>“Wrists - present them to me, now.”</i>");
		
		output("\n\n[bess.Name] obediently stretches out [bess.hisHer] wrists, offering them up to you. You wrap the black leather cuffs around [bess.hisHer] wrists. Once you are sure they are snug and tight, you connect them together by their metal fasteners, binding [bess.hisHer] hands together. You finish by sliding a collar around [bess.hisHer] neck and clicking it in place.");
		
		output("\n\n<i>“M-my collar... I love my collar,”</i> [bess.name] whispers. [bess.HeShe] raises [bess.hisHer] bound hands and touches the dark leather, blushing furiously.");
		
		output("\n\nCute! You hook your fingers through the metal ring dangling from [bess.hisHer] collar. With the slightest of tugs, you force [bess.himHer] to look you in the eyes, mesmerizing [bess.himHer] with your stare.");
		
		output("\n\n<i>“You’re properly adorned now. If I want you to bark like a dog, you will bark. If I want you to get on all fours, you will do so. You will obey all my instructions immediately and without complaint. Is that understood?”</i>");
		
		output("\n\n<i>“Yes, "+ bessPCSexName() +",”</i> [bess.name] giddily whispers, [bess.hisHer] [bess.eyeColor] eyes dreamily glazed. It seems having [bess.hisHer] collar and cuffs on has really put [bess.himHer] in the mood!");
		
		output("\n\nYou move back in front of [bess.name] and present your [pc.cocks] right in front of [bess.hisHer] face. [bess.HeShe] instinctively goes to suck");
		if (pc.cocks.length == 1) output(" it");
		else output(" one");
		output(", but then holds back as [bess.heShe] realizes [bess.heShe] hasn’t been ordered to. Instead, [bess.heShe] sits back like a good little sub and waits for instruction.");
		
		output("\n\nYou feel a rush of pride at [bess.hisHer] self control. Even as you wave your loins closer to [bess.hisHer] face and [bess.heShe] dreamily inhales the musky scent of your loins, [bess.heShe] refuses to take the bait.");
		
		output("\n\n<i>“You’re so mean, "+ bessPCSexName() +"...!”</i> [bess.heShe] whimpers, clearly tortured by the delicious smell of your erection");
		if (pc.cocks.length > 1) output("s");
		output(". [bess.HisHer] fingers are visibly twitching and [bess.hisHer] breathing is heavy. <i>“Did you come here just to tease me with my favorite thing?”</i>");
		
		output("\n\n<i>Mean</i>! You should bend [bess.himHer] over and spank [bess.himHer] for calling you that. Instead, you toy with [bess.hisHer] mind, telling [bess.hisHer] that a <i>truly</i> mean [pc.Master] wouldn’t let [bess.himHer] worship [pc.hisHer] cock");
		if (pc.cocks.length > 1) output("s");
		output(" at all.");
		
		output("\n\n[bess.name]’s gaze is immediately repentant and [bess.heShe] looks like [bess.heShe] wants to bow, yet hasn’t been told to move freely. Instead, a litter of apologies fly from [bess.hisHer] silvery, kissable lips. <i>“I’m so sorry! You’re a wonderful, gracious [pc.master] who blesses me with the mere sight of your cock");
		if (pc.cocks.length > 1) output("s");
		output(". My tongue slipped!”</i>");
		
		output("\n\nYou tell [bess.himHer] that [bess.hisHer] tongue clearly needs a taste of your [pc.cumNoun] to remind it of its place. Your statement is punctuated by the pointed rubbing of your [pc.cocksNounSimple] against [bess.hisHer] lips. [bess.name]’s whole body trembles with pent up lust and [bess.heShe] lets out a whimpering little moan.");
		
		output("\n\n<i>“Please, "+ bessPCSexName() +", let your little synth [bess.boyGirl] swallow your delicious [pc.cum] and feel it filling up [bess.hisHer] stomach. Please...?”</i> [bess.name] begs of you. [bess.HisHer] glittering [bess.eyeColor] eyes look as if they may fill with glistening tears if [bess.heShe] doesn’t taste your spunk soon.");
		
		output("\n\nYou’ve punished [bess.himHer] enough for calling you that word, so you give [bess.hisHer] permission to worship your raging rod");
		if (pc.cocks.length > 1) output("s");
		output(". Within seconds your bare-chested sub has leapt into action and is littering your aching loins");
		if (pc.balls > 0) output(" and balls");
		output(" in affectionate little kisses");
		if (flags["BESS_CUMDUMP"] == 1)
		{
			output(", smearing a little bit of sticky second-hand cum on");
			if (pc.cocks.length == 1) output(" it");
			else output(" them"); 
		}
		output(".");
	}

	output("\n\nWith a lusty look in [bess.hisHer] eyes, [bess.name] gives the underside of");
	if (pc.cocks.length > 1) output(" one of your masts");
	else output(" your mast");
	output(" a nice long lick. [bess.HeShe] presses [bess.hisHer] silvery tongue deep into your sensitive flesh as [bess.heShe] slowly drags it upwards, making absolutely sure you <i>feel</i> every inch of [bess.hisHer] vertical ascent.");
	
	output("\n\nYou groan and arch your hips with [bess.hisHer] wet ascent. The stroking of [bess.hisHer] synthetic tongue on your tool is <i>amazing</i>! As [bess.heShe] finishes [bess.hisHer] ascent, a tiny spurt of [pc.cumColor] pre-cum shoots from your tip, almost as if [bess.heShe] pushed it up and out of your cock!");
	if (flags["BESS_CUMDUMP"] == 1) output(" The droid’s lusty lick also leaves your prick utterly drenched in warm, second-hand spunk.");
	
	
	output("\n\nGreedily spotting the [pc.cumVisc], [pc.cumFlavor] pre-cum dribbling from your tip, [bess.name] inches closer, [bess.hisHer] hot breath tickling your [pc.cockHead]. [bess.HeShe] eagerly wraps [bess.hisHer] [bess.lips] around your cock hole, [bess.hisHer] tongue lashing up to lap up your [pc.cumNoun]. ");
	
	output("\n\nUnsatisfied with such a small smidgeon, [bess.heShe] eagerly sucks on your crown until [bess.hisHer] silvery cheeks hollow inward - [bess.heShe]’s trying to slurp your cum out by force! All the while [bess.hisHer]");
	if (flags["BESS_CUMDUMP"] == 1) output(" jism-loving");
	output(" tongue-tip is lashing and caressing your cock hole, trying to tease out even more of your [pc.cumFlavor] spunk.");
	if (bessIsSub()) output(" Cuffed as [bess.heShe] is, it’s quite the effort!");

	if (pc.balls > 0 && !bessIsSub())
	{
		output("\n\nUpping the ante, [bess.name] goes for the source of your succulent spunk; reaching up to cup your [pc.sack]. [bess.HisHer] fingers squeeze and caress your nuts as you moan in sheer rapture. Your cries increase in pitch as [bess.heShe] sneakily slides a finger out to stroke that soft flesh south of your balls and buttocks, lewdly teasing your perineum.");
	}
	if (bess.hasTailCock())
	{
		output("\n\n");
		if (bessIsSub()) output("<i>“...Um, "+ bessPCSexName() +", did you want me to fuck your ass with my tail?”</i> [bess.name] momentarily pulls back and meekly suggests. You nod firmly, definitely approving of some butt-play.");
		else output("<i>“...How about we get that ass some action, hmm?</i> [bess.name] momentarily pulls back and "+ bess.mf("saucily", "sultrily") +" suggests. You nod dreamily in agreement, only half-catching [bess.hisHer] words.”</i>");
		output(" Suddenly [bess.hisHer] silvery metal JoyCock curls around your hips and approaches your ass. Moments later, your [pc.skinFurScalesColor] buttocks are pushed apart, [bess.hisHer] thick tip pushes pointedly against your [pc.asshole].");
		pc.buttChange(200, true, true, false);
	
		output("\n\nWhen it slips inside your buttocks you try not to clench, relaxing and feeling it weave its way deep inside of you. Swiftly seeking out your prostate, it drags along it in long, low strokes. Delicious, humming pleasure floods through every inch of your being as [bess.heShe] teases your inner ass, fucking and pumping deep inside of your sweet hole!");
	}

	// PC cock size above 14 inches:
	if ((pc as PlayerCharacter).biggestCockLength() > 12)
	{
		output("\n\n[bess.name] seems to want to take more of your [pc.cock "+ cockIdx +"] into [bess.hisHer] mouth, but it’s simply too <i>huge</i>. Trying a few times, [bess.heShe] gags on your incredible girth, pulling back in failure. <i>“G-gah... syntax errors! There’s no way I’m taking something </i>this<i> big without going all out. Disengaging oral safeties!”</i>");
		
		output("\n\nYou hear a slight hissing noise come from underneath [bess.hisHer] chin, though nothing looks different. When [bess.heShe] takes you back in [bess.hisHer] mouth, however, [bess.hisHer] jaw actually dislocates like a snake. It shifts to accommodate you, [bess.hisHer] neck bulging with the outline of your [pc.cock "+ cockIdx +"]. The wonders of technology!");
	}
	else
	{
		output("\n\nEager for more of your sperm,");
		if (bessIsSub()) output(" your synthetic sub");
		else if (bessIsDom()) output(" your mechanical [bess.master]");
		else output(" the synthetic " + bess.mf("man", "girl"));
		output(" slides [bess.hisHer] lips around your [pc.cock " + cockIdx +"], enveloping it in [bess.hisHer] moist warmth. You can feel your [pc.cockHead " + cockIdx +"] traveling across [bess.hisHer] silky tongue and back into [bess.hisHer] gullet. Soon [bess.heShe]’s applying artful suction to your slickened spire, [bess.hisHer] silvery cheeks caving inward.");
	}

	//pc.cockChange(true);

	output("\n\nYou groan as [bess.heShe] demonstrates [bess.hisHer] utter lack of a gag reflex. You can feel your flexing tip sliding back and forth, in and out of [bess.hisHer] throat, squeezing and teasing your [pc.cockHead "+ cockIdx +"]. The mechanical "+ bess.mf("man", "girl") +"’s face truly was fashioned to be fucked!");
	
	output("\n\nJust when you think this blowjob can’t get any better, the insides of [bess.name]’s throat begin twisting and buffeting your glans in different directions. You let out a primal groan and press your oversensitized cock deep into [bess.hisHer] warm, wet gullet.");
	if (pc.hasKnot(cockIdx))
	{
		if (bessIsDom())
		{
			output(" As you inch closer to climax, your [pc.knot "+ cockIdx +"] begins to swell in [bess.hisHer] mouth. Instinctively, you try to pull out, but [bess.name] firmly grabs your");
			if (pc.balls > 0) output(" [pc.balls]");
			else output(" [pc.ass]");
			output(" and makes you stay put. You’re forced to mate with [bess.hisHer] face, utterly helpless as [bess.heShe] looks up at you with devilish [bess.eyeColor] eyes.");
		}
		else
		{
			output(" As you inch closer to climax, your [pc.knot "+ cockIdx +"] begins to swell in [bess.hisHer] mouth. [bess.name] doesn’t move an inch, letting your lump lock in place and force [bess.hisHer] jaw wide open. [bess.HeShe] lets out a deep, throaty moan, a look of delirious pleasure on [bess.hisHer] face as you mate with [bess.hisHer] mouth.");
		}
	}

	if (pc.hasKnot(cockIdx))
	{
		output("\n\nWith one last squeeze of [bess.name]’s throat, you’re sent careening over the edge. Seizing [bess.hisHer] head in your hands, you moan and buck against [bess.hisHer] face. Your [pc.cockHead "+ cockIdx +"] flexes and spurts hot, [pc.cumVisc] ropes of your [pc.cumFlavor] [pc.cumNoun] down [bess.hisHer] defenseless throat.");
		if (bessIsDom())
		{
			output(" Knotted like that, your eyes roll back into your head as you remain there, locked against [bess.hisHer] [bess.lips]. You twitch and shoot your spunk into [bess.hisHer] stomach for the next half hour.");
		}
		else
		{
			output(" [bess.name]’s eyes roll into the back of [bess.hisHer] head and [bess.heShe] lets out a delirious groan as you continuously mate with [bess.hisHer] lips, intermittently shooting your spunk into [bess.hisHer] stomach for the next half-hour.");
		}

		// if (any but hyper cums)
		if (pc.cumQ() <= 5000)
		{
			if (bessIsDom())
			{
				output("\n\nWhen your knot finally goes down, your mechanical [pc.master] pulls back, your now flaccid prick flopping from [bess.hisHer] sperm coated lips. Just when you think [bess.heShe]’s done with you, [bess.heShe] gives your tender dick a few more teasing jerks, making you twitch and whimper with delight. <i>“...Oh, you’re still sensitive? How fun.”</i>");
				
				output("\n\nEven though you <i>just</i> came, your [pc.knot "+ cockIdx +"] flares in [bess.name]’s hand. Not letting up, [bess.heShe] keeps teasing your vulnerable prick, swiftly bringing you to climax a second time! You shamefully shoot your [pc.cum] all over the floor, this time knotting with nothing but [bess.hisHer] hand.");
				
				output("\n\n<i>“Is that all it took? So quick! Let me get it alll out for you...”</i> [bess.name] "+ bess.mf("rumbles", "purrs") +", milking you for every last drop of [pc.cum]. You whimper with pleasure, firing sticky ropes all over the floor like an animal.");
				
				output("\n\n<i>“...Now lick it up. If it’s good enough for your "+ bess.mf("Master", "Mistress") +"’s mouth, it’s a gift to yours.”</i> [bess.HeShe] commands you to lick your own [pc.cumVisc] [pc.cumNoun] off the floor, and you obey. From behind, [bess.name] sticks a finger in your [pc.ass], and fingers your prostate as you blushingly lap up your spilled seed.");
				
				output("\n\nAfter you’re done, [bess.name] instructs you to give [bess.himHer] a kiss. You do so with relish, sharing the taste of your [pc.cumFlavor] spunk. [bess.HeShe] then swats your ass, and sends you on your way.");
			}
			else // bess is not a dom
			{
				output("\n\nWhen your knot finally goes down, the "+ bess.mf("male synthetic", "synthetic girl") +" seems to be glowing with sheer satisfaction, an utterly blissed-out look in [bess.hisHer] crystalline [bess.eyeColor] eyes. It seems [bess.heShe] thoroughly enjoyed you knotting [bess.hisHer] mouth. <i>“That was the best... my stomach feels like it’s completely filled with nothing but you...”</i>");
				
				output("\n\nGiven how long you came in [bess.hisHer] mouth, it probably <i>is</i> filled with you... or at least your spunk. Knowing that gives you a little burst of possessive pride, like you’ve claimed [bess.himHer] with your seed.");
			}
		}
	}
	else
	{
		output("\n\nWith one last squeeze of [bess.name]’s throat, you’re sent careening over the edge. You");
		if (!bessIsDom()) output(" dig your [pc.fingers] into the back of [bess.hisHer] head and");
		output(" thrust your cock all the way down [bess.hisHer] mechanical throat, giving yourself over to glorious release. With a deep, shuddering moan you spasmically unload your [pc.cumVisc] spunk inside of [bess.hisHer] slippery gullet, your [pc.cockHead "+ cockIdx +"] pulsing and convulsing in [bess.hisHer] narrow confines.");
		if (pc.cumQ() <= 100) output(" While your release is truly earth shattering, only the smallest of spurts shoots out from your tip and batters the inside of [bess.hisHer] throat hole.");
		else if (pc.cumQ() <= 5000)
		{
			output("\n\nAs your hot [pc.cumNoun] spills inside [bess.name]’s throat, [bess.heShe] lets out a guttural moan. [bess.HisHer] back arches in pleasure, [bess.hisHer] [bess.chest] pressing against you. Seconds later, [bess.heShe]’s’s letting out a muffled moan and convulsing in pleasure.");
			if (bess.hasVagina()) output(" Girlish love-goo spasmically squirts from [bess.hisHer] snatch and pools on the floor beneath [bess.hisHer] thighs.");
			if (bess.hasCock()) output(" [bess.HisHer] cock fires jets of pearly spunk up everywhere like a cum fountain, twitching and shooting all over the place.");
			if (bess.hasTailCock()) output(" Deep inside of your [pc.ass], [bess.hisHer] prehensile prick pulses and spasms, spilling [bess.hisHer] thick, hot seed deep inside of you.");

			output("\n\n[bess.name] doesn’t let go of your [pc.cocks "+ cockIdx +"] until you are completely and utterly spent, sucking");
			if (pc.cocks.length == 1) output(" it");
			else output(" on them");
			output(" happily until [bess.heShe]’s milked you of every single drop of your [pc.cum]. [bess.HeShe] then diligently laps at your rod");
			if (pc.cocks.length > 1) output("s");
			output(" until [bess.heShe] is sure");
			if (pc.cocks.length == 1) output(" it is");
			else output(" they are");
			output(" completely clean. The process doesn’t seem to be all one sided; judging by the dreamy look in [bess.hisHer] eyes, [bess.heShe] clearly has an insatiable appetite for your [pc.cumNoun].");
		
			if (bessIsDom())
			{
				output("\n\nWhen your cock finally stops twitching, your mechanical [pc.master] pulls back, your now flaccid prick flopping from [bess.hisHer] sperm coated lips. Just when you think [bess.heShe]’s done with you, [bess.heShe] gives your tender dick a few more teasing jerks, making you twitch and whimper with delight. <i>“...Oh, you’re still sensitive? How fun.”</i>");
				
				output("\n\nEven though you <i>just</i> came, you swell once more [bess.name]’s hand. Not letting up, [bess.heShe] keeps teasing your vunerable cock, swiftly bringing you to climax a second time! You shamefully shoot your [pc.cum] all over the floor, pulsing and flexing in [bess.hisHer] hand.");
				
				output("\n\n<i>“Is that all it took? So quick! Let me get it alll out for you...”</i> [bess.name] "+ bess.mf("rumbles", "purrs") +", milking you for every last drop of [pc.cum]. You whimper with pleasure, firing sticky ropes all over the floor like an animal.");
				
				output("\n\n<i>“...Now lick it up. If it’s good enough for your "+ bess.mf("Master", "Mistress") +"’s mouth, it’s a gift to yours.”</i> [bess.HeShe] commands you to lick your own [pc.cumVisc] [pc.cumNoun] off the floor, and you obey. From behind, [bess.name] sticks a finger in your [pc.ass], pointedly stroking your prostate as you blushingly lap up your spilled seed.");
				
				output("\n\nAfter you’re done, [bess.name] instructs you to give [bess.himHer] a kiss. You do so with relish, sharinng with [bess.himHer] the taste of your [pc.cumFlavor] spunk. [bess.HeShe] then swats your ass, and sends you on your way.");
			}
			else
			{
				output("\n\nAfterwards, [bess.name] seems to be glowing with sheer satisfaction, an utterly blissed-out look in [bess.hisHer] [bess.eyeColor] eyes. [bess.HisHer] mouth is slightly parted and splattered with your [pc.cumColor] seed; the rest [bess.heShe] swallowed without a moment’s hesitation. <i>“...Mmm, delicious! Your [pc.cum] is the best, "+ bessPCSexName() +"”</i>");
			}
		}
	}

	if (pc.cumQ() > 5000)
	{
		output("\n\nOver the course of your orgasm a torrential amount of [pc.cum] erupts from your [pc.cockHead "+ cockIdx +"], bursting forth from your [pc.cock "+ cockIdx +"] like from a broken dam. It really is a good thing [bess.name] doesn’t need to breathe, swallowing gallons of your cum without a moment’s hesitation. First [bess.hisHer] [bess.chest] begins to bloat, swelling out as [bess.heShe] stores your spunk");
		if (bess.biggestTitSize() > 0) output(" in [bess.hisHer] mammary glands");
		else output(" inside of [bess.himHer]");
		output(". There’s not nearly enough room, and [bess.hisHer] entire body begins to expand.");
		
		output("\n\nBy the time your orgasm winds down the silver skinned android is completely transformed. [bess.HisHer] features are utterly distorted by the mammoth amounts of spunk you have wholeheartedly dumped inside of [bess.himHer].");
		if (bess.biggestTitSize() > 0) output(" The slightest movement of [bess.hisHer] chest causes [bess.hisHer] massive mammaries to slosh about and your [pc.cumColor] spunk to spray from [bess.hisHer] distended nipples. [bess.HeShe] is positively filled with your virile seed.");
		
		output("\n\n<i>“...Mmm, I feel so full. I can’t process all of this into MeldMilk though; I’m going to have to dump some of your excess [pc.cumNoun],”</i> [bess.heShe] "+ bess.mf("groans", "professes") +" while spreading [bess.hisHer] ridiculously large thighs. "+ bess.mf("He looks well and truly bloated", "Every part of her jiggles and wiggles") +", and [bess.heShe] shifts to shoot out your spunk.");
		
		output("\n\n[bess.name] reaches down and parts [bess.hisHer]");
		if (bess.hasVagina()) output(" [bess.pussy]");
		else output(" [bess.asshole]");
		output(" with [bess.hisHer] fingers. "+ bess.mf("He", "Squatting there like a pregnant android, she") +" arches [bess.hisHer] back and suddenly a geyser of your [pc.cumColor] hot jism gushes out of [bess.hisHer]");
		if (bess.hasVagina()) output(" snatch");
		else output(" anus");
		output(". It streams and splashes all over the ship floor, spreading out until it reaches your [pc.feet].");
		
		output("\n\nAs [bess.heShe] unloads your sticky seed, [bess.name] lets out a "+ bess.mf("gutteral groan", "sweet cry of pleasure") +". The sensation of your hot jism streaming out of [bess.hisHer]");
		if (bess.hasVagina()) output(" pussy");
		else output(" ass");
		output(" is clearly getting [bess.himHer] off. [bess.HeShe] begins convulsing and falls on [bess.hisHer] back; it looks almost as if [bess.heShe]’s giving");
		if (!bess.hasVagina()) output(" ass");
		output(" birth to a mass of [pc.cumColor]-colored galotians.");
		
		output("\n\n[bess.name]’s eyes soon roll into [bess.hisHer] head from sheer ecstasy, each spasm causing your pooled spunk to spray out of [bess.hisHer]");
		if (bess.hasVagina()) output(" snatch");
		else output(" butt");
		output(" in intermittent bursts. [bess.HisHer] ridiculously swollen belly slowly deflates until [bess.hisHer] ‘excess stock’ is fully depleted. You can see artificial sweat rolling down [bess.hisHer] body; even for an android, that was quite the effort.");
		
		output("\n\nStill, [bess.name] doesn’t seem bothered by [bess.hisHer] labors in the least. Instead [bess.heShe] looks up at you with a "+ bess.mf("blissful look", "truly dreamy expression") +" in [bess.hisHer] [bess.eyeColor] eyes. <i>“That... that was wonderful,”</i> the synthetic professes, then adds, <i>“Anytime you’re feeling pent up, come and find me - okay?”</i>");
		
		output("\n\nTalk about a cum junkie! [bess.name] is thinking about [bess.hisHer] next serving even as [bess.heShe] lies in a gigantic pool of your [pc.cumNoun]. [bess.HeShe] continues to lie there utterly drunk off the musky smell of your seed, almost as if [bess.heShe]’s bathing in it.");
	}

	processTime(45+rand(15));
	bessAffectionGain(BESS_AFFECTION_SEX);

	if (flags["BESS_FUCKED"] == undefined) flags["BESS_FUCKED"] = 0;
	flags["BESS_FUCKED"]++;

	for (var i:int = 0; i < 5; i++)
	{
		bess.loadInMouth(pc);
		pc.orgasm();
	}

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessGiveDoggy():void
{
	if (!bess.hasVagina())
	{
		bessGiveDoggySelected(false);
		return;
	}

	clearOutput();
	bessHeader();

	output("How would you like to take [bess.name]?");

	clearMenu();
	addButton(0, "Vaginally", bessGiveDoggySelected, true, "Vaginally", "Take advantage of [bess.name]’s pussy.");
	addButton(1, "Anally", bessGiveDoggySelected, false, "Anally", "Take advantage of [bess.name]’s ass.");
}

public function bessGiveDoggySelected(bTargetVag:Boolean = false):void
{
	var cockIdx:int = pc.biggestCockIndex();

	clearOutput();
	bessHeader();

	if (bessIsEqual())
	{
		output("You tell [bess.name] that you would like to fuck [bess.hisHer] "+ (bTargetVag ? "pussy" : "ass") +" from behind.");
		if (pc.isNice()) output(" That is, if [bess.heShe]’s up for it.");
		else if (pc.isMischievous()) output(" That is, if [bess.heShe]’s got time in [bess.hisHer] schedule to <i>“fit you in”</i>.");
		else output(" You’re pretty blunt about it - you’re in the mood to fuck.");
		
		output("\n\n[bess.name] "+ bess.mf("raises his gorgeous brows", "bats her gorgeously thick lashes") +" and turns [bess.hisHer] back towards you, petting [bess.hisHer] [bess.ass]. <i>“You want to fuck me "+ (bTargetVag ? "from behind, would you, "+ bessPCSexName() +"?" : " here? That’s pretty naughty, "+ bessPCSexName() +"!") + "”</i> The");
		if (bess.hairLength > 0) output(" [bess.hairColor] haired");
		output(" synthetic seems to be playing coy, though [bess.hisHer] eyes are shining with barely-concealed mirth. Despite [bess.hisHer] innocent act, [bess.heShe] seems more than happy to oblige");
		if (!pc.isNude()) output(", so you quickly strip off your things");
		output(".");
	}
	else if (bessIsDom())
	{
		output("[bess.name] strides up to you out of the blue and snaps your collar around your neck. The D-ring at the throat is attached to a doggie leash, which [bess.heShe] promptly tugs to get your undivided attention.");
		
		output("\n\n<i>“Listen here, "+ bessPCSexName() +". You are to strip off immediately until you are wearing nothing but this leash and collar, and </i>then<i> you are going to fuck your [bess.Mistress]’s "+ (bTargetVag ? "pussy" : "ass") +" with relish. If I do not enjoy myself, there will be </i>consequences<i>. Is that understood?”</i>");

		output("\n\n<i>“Yes, "+ bessSexName() +"!”</i> You meekly reply - all the while jumping for joy inside. It seems today your metallic "+ bess.mf("dom", "domme") +" wants to make use of you and your [pc.cocks], which makes you incredibly happy. You blush and take off your gear, tossing it aside");
		if (!bess.isNude()) output(" as your ‘owner’ similarly strips");
		output(".");
	}
	else
	{
		output("You stride up to [bess.name] out of the blue and snap [bess.hisHer] collar around [bess.hisHer] neck. The D-ring at the throat is attached to a doggie leash, which you promptly tug to get [bess.hisHer] undivided attention.");
		
		output("\n\n<i>“Listen here, "+ bessSexName() +". I am going to fuck your "+ (bTargetVag ? "pussy" : "ass") +" from behind while you wear this leash and collar. If I do not enjoy myself, there will be </i>consequences<i>. Is that understood?”</i>");
		if (!pc.isNude()) output(" You don’t even wait for a reply, already stripping off your gear.");
		
		output("\n\n<i>“Yes, "+ bessPCSexName() +"!”</i> [bess.name] meekly replies, though you can see in [bess.hisHer] eyes that [bess.heShe]’s jumping for joy inside. [bess.HeShe] looks thrilled that [bess.hisHer] [pc.Master] wants to make use of [bess.himHer] and [bess.hisHer] "+ (bTargetVag ? "pussy" : "ass") +". You");
		if (!pc.isNude()) output(" take off your gear and [bess.heShe] similarly");
		else output(" watch as [bess.hisHer]");
		output(" prepares [bess.himHer]self for you.");
	}

	// MERGE ALL VERSIONS
	bessBottomStripScene();

	output("\n\nNow that you’re both prepared, [bess.name] sinks down on [bess.hisHer] hands and knees, wiggling [bess.hisHer] [bess.ass] at you.");
	if (bessIsDom()) output(" As instructed, you");
	else output(" Grinning, you");
	output(" slide up behind [bess.himHer], placing your hands on [bess.hisHer] [bess.hips]. Like a cat, [bess.heShe] arches [bess.hisHer] hips and rubs [bess.hisHer] rump pointedly against your [bess.base].");
	
	output("\n\nYou groan as [bess.name] lewdly jerks off your cock");
	if (pc.cocks.length > 1) output("s");
	output(" between [bess.hisHer] [bess.ass].");
	if (bessIsDom()) output(" You really want to let yourself go - to shoot your [pc.cumColor] spunk all over [bess.hisHer] buttocks and back - but you haven’t been given permission!");
	else if (bessIsSub()) output(" As much as you can imagine yourself shooting your spunk all over [bess.hisHer] buttocks and back, that’s not what you’re after. Tugging on [bess.hisHer] leash, you make sure your synthetic sub doesn’t get <i>too</i> carried away.");
	else output(" As much as you can imagine shooting your spunk all over [bess.hisHer] buttocks and back, you have <i>other</i> plans.");

	output("\n\nAll of a sudden, [bess.name] pulls away from your [pc.cocks]. [bess.HeShe] reaches back and spreads open [bess.hisHer] "+ (bTargetVag ? "thighs. With two fingers, [bess.heShe] parts [bess.hisHer] slick, silvery folds" : "buttocks. [bess.HisHer] clean, stretched pucker winks at you"));
	if (flags["BESS_CUMDUMP"] == 1) output(" and pearly, second-hand cum drools out of it - it seems [bess.heShe]’s been busy today!");
	else output(" and is already lubed up with [bess.hisHer] artificial juices.");

	if (bessIsDom())
	{
		output("\n\n<i>“Feel honored, "+ bessPCSexName() +". Your [bess.Master] is going to let you fuck [bess.himHer],”</i> [bess.name] tugs rather pointedly on your lead - and by extension your neck collar - pulling you forward! <i>“Time to put your [pc.cocks] to work!”</i>");
		
		output("\n\n<i>“Yes, "+ bessSexName() +"!”</i> you stammer out, [pc.eachCock] jerking upwards as you are ordered about. You then obediently line up "+ (bTargetVag ? "your cock-tip with [bess.hisHer] [bess.pussy]" : "your cock-tip with [bess.hisHer] [bess.asshole]") + ".");
	}
	else
	{
		output("\n\n<i>“Um, my insides should be nice and moist, and you seem pretty hard. Did you want to stick your cock");
		if (pc.cocks.length > 1) output("s");
		output(" inside me now, "+ bessPCSexName() +"?”</i> [bess.name] sweetly asks, at the same time pointedly rubbing your cock-tip with [bess.hisHer] "+ (bTargetVag ? "[bess.pussy]" : "[bess.ass]") +" - as if [bess.heShe] needed to tempt you!");
	}

	output("\n\nWith the simplest press forward, your [pc.cockHead "+ cockIdx +"] parts [bess.hisHer] "+ (bTargetVag ? "silky lower lips" : "star-shaped pucker") +". You groan as you sink your engorged length deep inside [bess.hisHer] synthetic hole - it’s so tight and slick! Even a virgin "+ (bTargetVag ? "pussy" : "ass") +" wouldn’t be this wonderously tight- it’s a good thing");
	if (flags["BESS_CUMDUMP"] == 1) output(" all that communal cum is");
	else output(" [bess.hisHer] synthetic juices are");
	output(" lubing it up!");
	pc.cockChange(true);
	
	output("\n\nAs soon as your [pc.cock "+ cockIdx +"] is completely sheathed inside of [bess.name], you begin to lustily grind your hips against [bess.hisHer] [bess.ass]. [bess.HeShe] lets out a low, sensuous moan, answering your impassioned thrusts with [bess.hisHer] own bucking hips. You can feel [bess.hisHer] silky insides rippling along your length");
	if (pc.cocks.length > 1) output("s");
	output(" with every movement, [bess.hisHer] synthetic "+ (bTargetVag ? "pussy" : "sphincter") +" actively milking your erection for all it’s worth.");

	// PC has a knot && BessIsDom:
	if (pc.hasKnot(cockIdx) && bessIsDom())
	{
		output("\n\nThe longer you fuck [bess.himHer], the more your [pc.knot "+ cockIdx +"] begins to swell. You instinctively go to pull out, fearing getting stuck in [bess.himHer], but as you do so a sharp tug at your leather leash keeps you firmly in place.");
		
		output("\n\n<i>“Did I say you could go anywhere, "+ bessPCSexName() +"?”</i> [bess.name] asks, though the question is rhetorical. <i>“You are going to knot me - and that’s an </i>order<i>!”</i>");
		
		output("\n\nBlushing furiously, you keep your hips firmly pressed against [bess.name]’s buttocks as instructed, your [pc.knot "+ cockIdx +"] swelling and locking inside of [bess.hisHer] "+ (bTargetVag ? "snatch" : "ass") +". As soon as it’s filled [bess.himHer] up, [bess.heShe] loosens [bess.hisHer] grip on your collar. With your cock knotted inside of [bess.himHer], [bess.heShe] doesn’t need it anymore! [bess.HeShe] pulls [bess.hisHer] ass away from you, and you’re compelled to follow, literally lead by your dick!");
		
		output("\n\n<i>“Goooood [pc.boyGirl]. Just remember who is in charge, and maybe I’ll let you get off inside of me,”</i> [bess.name] teases you, forcibly slapping [bess.hisHer] hips back against your own. You bite your lip HARD and try not to cum at the tugging and squeezing sensation on your knotted [pc.cockNoun "+ cockIdx +"], all the while feeling your pre-cum uncontrollably dribble inside [bess.hisHer] silky depths.");
	}

	if (pc.hasCockTail())
	{
		if (bessIsDom())
		{
			output("\n\n<i>“Your [pc.tailCock]. Bring it to my mouth NOW, "+ bessPCSexName() +".”</i>");
			
			output("\n\nYou blush and obediently obey, bringing it up to [bess.hisHer] mouth. Seconds later, [bess.heShe]’s taking your [pc.tailCock] between [bess.hisHer] [bess.lips].");
			if (pc.hasKnot(cockIdx)) output(" Knotted in place,");
			else output(" With one hand tightly on your leash,");
			output(" [bess.name] fucks and sucks you off at the same time.");
		}
		else
		{
			output("\n\nActing on impure instinct, your [pc.tailCock] begins to move on its own. It slides up [bess.name]’s chest. It catches [bess.himHer] off guard when you slip it inside [bess.hisHer] half open-mouth, [bess.hisHer] eyes shooting wide in sudden shock.");
			
			output("\n\n<i>“Mffh! Mffph... mfflrrrgh!”</i> You silence [bess.name]’s complaint with a mouth full of [pc.tailCock], stuffing it deep into [bess.hisHer] gullet. [bess.HisHer] muffled protests turn into moans as you bury it deep inside of [bess.hisHer] warm, wet gullet, taking advantage of [bess.hisHer] complete lack of a gag reflex.");
		}
	}

	if (bess.hasCockTail())
	{
		output("\n\nYou feel a sudden sliding around your [pc.hip]. Suddenly something is pushing pointedly against your pucker - it’s [bess.name]’s JoyCord! Apparently unsatisfied with such a one-sided fucking, [bess.heShe] mischievously plunges [bess.hisHer] prehensile phallus into your [pc.ass], sliding it up to sweetly meet and pulse against your prostate. You tremble with delight as you’re filled from behind, relishing in [bess.hisHer] rubbing deep inside of your rump.");
	}

	output("\n\nAs you heartily fuck [bess.name] from behind, [bess.heShe] reaches up and caresses [bess.hisHer] [bess.chest]. A sinful little moan escapes [bess.hisHer] lips as [bess.heShe] toys with [bess.hisHer] nipples. As [bess.heShe] pinches and teases them, [bess.hisHer] insides spasm, squeezing and wringing your thrusting length.");

	if (!pc.hasCockTail())
	{
		output("\n\n<i>“I can feel you bulging inside of my "+ (bTargetVag ? "pussy" : "ass") + "!”</i> [bess.name] moans, bucking back needily against your [bess.base]. <i>“");
		if (bessIsSub()) output("Please fill");
		else output("Fill ");
		if (bess.isPregnant()) output(" your pregnant mechanical slut");
		else output(" my slutty hole");
		output(" with your cum, "+ bessPCSexName() +"!”</i> [bess.heShe] cries, pushing [bess.himHer]self right down to your base. There, [bess.heShe] squeezes down on you with a vice-like grip; your [pc.cockHead] pressed right against "+ (bTargetVag ? "[bess.hisHer] synthetic cervix" : "the deepest parts of [bess.hisHer] bowels") + ".");
	}

	output("\n\nYou let out a long groan as you reach that glorious peak. Instinctively, you press your hips as hard as you can against [bess.hisHer] butt. Your [pc.cock "+ cockIdx +"] twitches as you");
	if (pc.cumQ() <= 100) output(" splutter tiny drips of");
	else if (pc.cumQ() <= 500) output(" spurt your");
	else output(" unload your");
	output(" [pc.cum] deep inside of [bess.hisHer] twitching, cock-filled "+ (bTargetVag ? "cunny" : "butt") +".");
	if (pc.cumQ() > 100 && bTargetVag) output(" It rushes up and fills [bess.hisHer] mechanical womb, your seed stirring around inside of [bess.hisHer] [bess.belly].");
	output(" Your twitching [pc.cockNounSimple " + cockIdx +"] pushes [bess.himHer] over the edge, and [bess.heShe] utterly creams [bess.himHer]self around your pulsing shaft. Both of you dissolve into pleasure, trembling against each other’s bodies.");
	if (bTargetVag) output(" [bess.HisHer] leaking pussy-juice mixes with your [pc.cumNoun] and drools down [bess.hisHer] trembling thighs.");

	if (pc.hasKnot(cockIdx))
	{
		output("\n\nKnotted as you are against [bess.name], you both spoon and cum for a good half hour. Tightly locked against each other, you continue to shoot and fill [bess.hisHer] "+ (bTargetVag ? "pussy" : "rump") +" with your [pc.cum]. Every time you finally breathe and think you’re finished, [bess.name] squeezes [bess.hisHer] inner muscles, and you’re off again - shooting a fresh wad of cream directly into [bess.hisHer] "+ (bTargetVag ? "synthetic cunt" : "tight butt") + ".");
	}

	if (pc.cumQ() >= 5000)
	{
		output("\n\n");
		if (pc.hasKnot(cockIdx)) output("During your knotting, you");
		else output("As you climax, you");
		output(" shoot so much [pc.cumNoun] inside of [bess.himHer] that [bess.hisHer] [bess.belly] swells");
		if (bess.bellyRating() > 0) output(" even more");
		output(" until it is utterly filled.");
		if (bess.biggestTitSize() > 0) output(" [bess.HisHer] [bess.breasts] also begin to bloat with your seed. [bess.HisHer] hips and ass soon follow.");
		output(" By the time your orgasm winds down, [bess.name] is completely transformed by the mammoth amounts of spunk you have dumped inside of [bess.himHer].");
		if (bess.biggestTitSize() > 0) output(" The slightest movement of [bess.hisHer] chest causes [bess.hisHer] massive mammaries to slosh about. Your [pc.cumColor] [pc.cumNoun] is even leaking out from [bess.hisHer] distended nipples!");

		output("\n\n<i>“...Mmm, I feel so full. I can’t process all of this into MeldMilk though; I’m going to have to dump some of your excess [pc.cumNoun].”</i> [bess.name] groans, spreading [bess.hisHer] ridiculously large thighs.");
		
		output("\n\nReaching down, [bess.name] parts [bess.hisHer] "+ (bTargetVag ? "netherlips" : "partly gaping pucker") +". Squatting there awkwardly, [bess.heShe] arches [bess.hisHer] back. Suddenly a geyser of your [pc.cumColor] hot [pc.cumNoun] gushes out of [bess.hisHer] spread hole, streaming and splashing all over the ship’s floor! As [bess.heShe] does, [bess.name] lets out a sweet cry - the sensation of your hot jism streaming out of [bess.hisHer] "+ (bTargetVag ? "pussy" : "ass") +" is clearly getting [bess.himHer] off. [bess.HisHer] eyes roll back into [bess.hisHer] head as your spunk spills out of [bess.hisHer] squirting hole, [bess.hisHer] ridiculously swollen belly slowly deflates until [bess.hisHer] ‘excess stock’ is fully depleted.");
		
		output("\n\nOnce [bess.heShe] is done, [bess.name] has a truly dreamy expression on [bess.hisHer] face. It takes [bess.himHer] a while to regain the capacity to speak.");
		
		output("\n\n<i>“...T-that was wonderful,”</i> [bess.name] spacily murmurs, rubbing between [bess.hisHer] thighs.");
		if (bessIsEqual()) output(" <i>“Anytime you’re feeling pent up, come and find me - okay?”</i> [bess.heShe] breathily requests.");
		else if (bessIsDom()) output(" <i>“Good job, "+ bessPCSexName() +".”</i>");
		else output(" <i>“I-I hope you enjoyed yourself, "+ bessPCSexName() +".”</i>");
	}
	else
	{
		output("\n\nAfterwards [bess.name] is glowing with sheer satisfaction. There’s a totally blissed-out look in [bess.hisHer] [bess.eyeColor] eyes. When [bess.heShe] pulls [bess.himHer]self off your cock,");
		if (pc.cumQ() <= 100) output(" a tiny dribble");
		else if (pc.cumQ() <= 500) output("a thin stream");
		else
		{
			output(" a");
			if(pc.cumType != GLOBAL.FLUID_TYPE_SPECIAL_GOO) output(" gooey");
			output(" gush");
		}
		output(" of your [pc.cum] slides down [bess.hisHer] inner thighs.");
		
		if (bessIsEqual()) output("\n\n<i>“Mmm, that was wonderful. I love feeling your [pc.cumNoun] deep inside of me,”</i> the insatiable synthetic dreamily tells you, a spaced out look in [bess.hisHer] eyes.");
		else if (bessIsDom())
		{
			output("\n\n<i>“You’re not just planning to leave me marked like this, are you, "+ bessPCSexName() +"?”</i> [bess.name] commands you out of the blue. [bess.HeShe] then turns and pushes [bess.hisHer] [pc.cumNoun] splatted "+ (bTargetVag ? "snatch" : "buttocks") +" right in your face. <i>“Now, lick it off.”</i>");
			
			output("\n\n<i>“...But, "+ bessSexName() +", that’s my... that’s my cum!”</i> You meekly protest.");
			
			output("\n\n<i>“Lick it up, that’s an order! You covered me in it, so it’s your job to clean it off... or would you have me do it myself?”</i> Your silvery "+ bess.mf("dom", "domme") +" levels a hard stare at you.");
			
			output("\n\nYou loudly gulp. There’s really no talking your way out of it. With flushing cheeks, you stretch out your tongue, seeking out [bess.hisHer] slickened nethers. It’s not long before you can taste your own [pc.cumFlavor] rolling on your tongue. It’s so warm and [pc.cumVisc]. You lewdly lap up your own seed from [bess.hisHer] "+ (bTargetVag ? "pussy" : "ass") +", a delicious little shiver shooting up your spine.");
			
			output("\n\nOnce you’ve finished cleaning off [bess.name]’s silvery skin of your [pc.cumNoun], you pull back, letting out a hot sigh. But for some reason, your [bess.master] doesn’t look pleased - have you done something wrong?");
			
			output("\n\n<i>“That’s not </i>all<i> of it, "+ bessPCSexName() +". Finish the job,”</i> [bess.name] chastises you.");
			
			output("\n\nNot all of it? What, does [bess.heShe] mean... lick your [pc.cum] out from inside of [bess.himHer] as well?");
			
			output("\n\nBurning with embarrassment, you slide your [pc.tongue] inside [bess.hisHer] cum-lined hole");
			if (!bTargetVag) output(" - at least [bess.heShe]’s an android, so [bess.heShe] doesn’t use it for <i>that</i>");
			output(". You lap and dart inside of [bess.himHer], scooping up the last of your semen with great effort. Once you’re done, you’re sure it’s as clean as can be.");
			
			output("\n\n<i>“Now, swallow.”</i>");
			
			output("\n\nYou obediently gulp down your own [pc.cumFlavor] seed, feeling it dribble down into your [pc.belly]. At the same time you are filled with a fluttering, pleasant sensation. You did good, right?");
			
			output("\n\nYour unspoken question is answered by a kiss on your neck. After a few more kisses, [bess.name] removes your collar, and your worn out legs tremble. Right now, you’re the happiest sub in the world!");
		}
		else
		{
			output("\n\n<i>“Did... did I do good, "+ bessPCSexName() +"?”</i> [bess.name] asks in a slurred voice. [bess.HeShe] couldn’t look any more spaced out if [bess.heShe] tried.");
			
			output("\n\nYou stroke [bess.hisHer] head and tell [bess.hisHer] that [bess.heShe] did very well. [bess.HeShe] gives a light-headed smile and purrs a little, rubbing [bess.hisHer] cheek into your cupped hand.");
			
			output("\n\nAfterwards, you engage in some aftercare, before taking off [bess.name]’s collar and leaving [bess.himHer] to rest.");
		}
	}

	processTime(45+rand(15));

	for (var i:int = 0; i < 5; i++)
	{
		if (bTargetVag)
		{
			bess.loadInCunt(pc, 0);
			bess.cuntChange(0, pc.cockVolume(cockIdx), false, false, false);
		}
		else
		{
			bess.loadInAss(pc);
			bess.buttChange(pc.cockVolume(cockIdx), false, false, false);
		}
		pc.orgasm();
	}

	if (flags["BESS_FUCKED"] == undefined) flags["BESS_FUCKED"] = 0;
	flags["BESS_FUCKED"]++;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessGetDoggy():void
{
	// Cunt that fits Saurian-type cocks, ass doesn't fit
	if (pc.hasVagina() && bess.cocks[0].cType == GLOBAL.TYPE_SAURIAN && pc.cuntThatFits(bess.cockVolume(0)) >= 0 && pc.analCapacity() < bess.cockVolume(0))
	{
		bessGetDoggySelected(true);
		return;
	}

	// Cunt doesn't fit Saurian-type cocks, or no cunt
	if ((pc.hasVagina() && bess.cocks[0].cType == GLOBAL.TYPE_SAURIAN && pc.cuntThatFits(bess.cockVolume(0)) == -1) || !pc.hasVagina())
	{
		bessGetDoggySelected(false);
		return;
	}

	clearOutput();
	bessHeader();

	output("How does [bess.name] take you?");

	clearMenu();
	addButton(0, "Vaginally", bessGetDoggySelected, true, "Vaginally", "[bess.name] fucks your [pc.pussy]!");
	addButton(1, "Anally", bessGetDoggySelected, false, "Anally", "[bess.name] fucks your [pc.ass]!")
}

public function bessGetDoggySelected(bTargetVag:Boolean):void
{
	clearOutput();
	bessHeader();

	var vagIdx:int = -1;
	if (bTargetVag) vagIdx = pc.biggestVaginaIndex();

	if (bessIsEqual())
	{
		output("Reaching down between your thighs you stroke yourself softly - you’re positively aching to be fucked right now. You tell [bess.name] you’d love nothing more than for [bess.himHer] to screw you from behind.");

		if (!pc.isNude())
		{
			output("\n\n<i>“Well now, I can’t do that while you’ve still got your clothes on, "+ bessPCSexName() +", can I?”</i> [bess.name]’s [bess.eyeColor] eyes glimmer mischieviously while [bess.hisHer] voice is positively coy.");

			output("\n\nEager to get the release you need, you quickly strip off your gear and ready yourself for [bess.himHer].");
		}
		else output("\n\n<i>“Well now, you’re already naked. You must be really ready to go, "+ bessPCSexName() +".”</i> [bess.name]’s [bess.eyeColor] eyes glimmer mischieviously while [bess.hisHer] voice is positively coy.");
	
		output("\n\n[bess.name] then walks around you and out of sight. Moments later, you feel [bess.hisHer] hands sliding around you and up to your [pc.chest]. [bess.HeShe] caresses it gently, [bess.hisHer] fingers dancing along your [pc.skinFurScales]. At the same time, you feel [bess.hisHer] breath tickling one of your [pc.ears], and you shiver with delight.");
		
		output("\n\n[bess.HisHer] lips caress one of your ears and then travel down, stopping to suck at the nape of your neck. Suddenly your nipples are being pinched and you give a sharp jump, [bess.hisHer] fingers catching them as if in a trap. You couldn’t move even if you wanted to, you can feel [bess.hisHer] fingertips rolling over your sensitive nubs. You can’t help but lean back into [bess.hisHer] and give a gasping moan of pleasure.");

		if (bTargetVag)
		{
			output("\n\nMoments later, [bess.hisHer] fingers slide down and lightly tease your sensitive [pc.pussy]. As [bess.heShe] teases your loins, you eagerly rub against [bess.hisHer] fingers, trying to coax them inside of you for some much needed release!");
			
			output("\n\nAt long last, you feel [bess.name]’s fingers slipping up inside of you. They wiggle around inside of your [pc.pussy], stirring you up in more ways than one! <i>“...Mmm, your pussy is so wet, "+ bessPCSexName() +".”</i>");
			
			output("\n\nYou breathily moan in response, rubbing your");
			if (pc.hasClit()) output(" [pc.clits]");
			else output(" mound");
			output(" against [bess.hisHer] hand. There’s a lewd, squelching sound as [bess.heShe] plumbs your pussy with [bess.hisHer] slickened digits. Electrifying pleasure courses from your loins. You arch your back, whimpering and bucking your hips. At this rate, it won’t be long before you’re creaming yourself all over [bess.hisHer] hand!");
			
			output("\n\nBefore you reach your peak, however, [bess.name] removes [bess.hisHer] sticky fingers from your snatch. You let out a cry of protest - only to have your mouth filled with [bess.hisHer] fingers! A warm, [pc.girlCumFlavor] brushes against your tongue, and you lustily suck at it - licking [bess.hisHer] fingers clean of your own girl juice. The whole thing gets you even wetter, adding to the slickness dribbling from your [pc.pussy].");
			
			output("\n\n<i>“Mmm, that’s just for starters. How about we go all the way to dessert?”</i> [bess.name] seductively offers, rubbing your");
			if (pc.hasClit()) output(" [pc.clits]");
			else output(" mounds");
			output(" with [bess.hisHer] fingers. You shiver and arch your back once more, relishing in the pulsing pleasure coursing out from your sex.");
			
			output("\n\n<i>“Yes, oh frag yes!”</i> You flush furiously with how much you’re crying out for a little bit of [bess.hisHer] [bess.cock] - or rather a lot of it - filling up your pussy.");
			
			output("\n\n<i>“Maybe you should get into position so I can give you your cream filling?”</i> [bess.name] suggests and you’re all too quick to comply. You present yourself and stick your dripping wet cunny out, wiggling your butt all the while, enticing [bess.himHer] to screw you absolutely senseless.");
			if (pc.hasCock()) output(" At the same time [pc.eachCock] begins to twitch with anticipation, slapping against your [pc.belly].");
		}
		else // analscene
		{
			output("\n\nMoments later, [bess.heShe] pulls back [bess.hisHer] hands and you let out a disappointed noise. It doesn’t last long, as you soon feel [bess.hisHer] fingers sliding between your buttocks. Two of [bess.hisHer] digits spread them open as another presses against your [pc.asshole]. It feels surprisingly slick as [bess.heShe] presses it into your pucker.");
			
			output("\n\nYou let out a sweet little cry as [bess.name]’s finger wiggles into your bum. Soon it’s roaming and stirring about deep inside of you. Arching your back, you moan out loud, utterly relishing in your [pc.ass] being fingered. Without thinking, you buck back against [bess.hisHer] hand, coaxing it deeper and deeper, unable to get enough!");
			
			output("\n\nYou try to stand perfectly still as [bess.heShe] slips another slick finger inside of your back door, stretching you open that much more. You can’t help but shiver as your poor pucker is toyed with from behind, penetrating your forbidden place. You clench around [bess.hisHer] fingers and let out a breathy moan, wondering how long it’ll be before you hit that inevitable peak.");
			
			output("\n\nBefore you can, however, [bess.name] removes [bess.hisHer] sticky fingers from your ass. You let out a cry of protest - only to have them swiftly plunged back inside of you. You let out a delighted moan as they plunge even <i>deeper</i> into your well lubed butt. If this is what [bess.heShe] can do with [bess.hisHer] fingers, what is [bess.hisHer] cock going to feel like?");
			
			output("\n\n<i>“Mmm, that’s just for starters. How about we go all the way to dessert?”</i> [bess.name] seductively offers, pistoning your ass with [bess.hisHer] fingers as you feel the most delicious sensations running up from your rump.");
			
			output("\n\n<i>“Yes, oh frag yes!”</i> You flush furiously with how much you’re crying out for a little bit of [bess.hisHer] [bess.cock] - or rather a lot of it - in your ass.");
			
			output("\n\n<i>“Maybe you should get into position so I can give you your cream filling?”</i> [bess.name] suggests and you’re all too quick to comply. You present yourself and stick your rump out and wiggle it about, enticing [bess.himHer] to screw you absolutely senseless.");
			if (pc.hasCock()) output(" At the same time [pc.eachCock] begins to twitch with anticipation, slapping against your [pc.belly].");
		}
	}
	else if (bessIsDom())
	{
		output("You spot [bess.name] striding up to you, an assertive gleam in [bess.hisHer] eyes. Immediately, your heart skips a beat. Hope wells deep within your heart. [bess.HeShe] looks like [bess.heShe] wants you for something; could you be so lucky...?");
		
		output("\n\n<i>“Stand to attention, "+ bessPCSexName() +"!”</i> [bess.Name] demands, one hand on [bess.hisHer] hip. [bess.HisHer] other one is used to deliver a short but memorable slap to your [pc.ass], spurring you to action!");
		
		output("\n\nYou obediently jump to attention, a delicious throbbing in your lightly slapped buttock. You’re giddy with anticipation. What does [bess.heShe] have planned for you?");
		
		output("\n\n[bess.name] moves intimately close. You’re so entranced by [bess.hisHer] stern, [bess.eyeColor] eyes that you almost miss [bess.himHer] slipping a leather collar around your neck. You moan with delight as it wraps around your bare [pc.skinFurScalesNoun], your submissive switch now fully ‘on’.");
		
		output("\n\nPreparing properly for inspection, you");
		if (pc.hasLegs()) output(" spread your legs. You then");
		output(" lock your hands behind your head. With practiced effort, you stand there like a perfect little slave, directing your gaze forward. As you fawningly await [bess.hisHer] commands you feel your loins tingle with anticipation - what sort of orders is [bess.heShe] going to give you today?");
		
		output("\n\nYou watch [bess.name] as [bess.heShe] paces around you, shivering as [bess.heShe] trails a finger up your side, [bess.hisHer] sharp eyes seeking even the slightest sign of poor posture. A single bead of sweat travels down your neck - you can feel it stroking every pore as it travels downward.");
		
		output("\n\nThe smallest smile passes over [bess.name]’s lips. It seems [bess.heShe] noticed, tracing [bess.hisHer] finger up and collecting the moisture on [bess.hisHer] fingertip. [bess.HeShe] brings it to [bess.hisHer] mouth, kissing your salty sweatdrop away. Is "+ bessSexName() +" pleased with your posture? You’re trying ever so hard!");

		if (!pc.isNude())
		{
			output("\n\n<i>“...Good [pc.boyGirl].”</i> [bess.name] praises you, causing your heart to race. You pleased [bess.himHer]! <i>“...Now, strip off your clothes.”</i>");
			
			output("\n\nWith no idea what [bess.heShe] has planned for you, you slowly begin to remove your things. You can feel [bess.hisHer] eyes on you as you strip, [bess.hisHer] eyes roaming across your naked [pc.skinFurScalesNoun]. Being watched makes you even more worked up");
			if (pc.hasCock() || pc.hasVagina())
			{
				output(" - your");
				if (pc.hasCock()) output(" [pc.cocks] stiffening");
				if (pc.hasCock() && pc.hasVagina()) output(" and");
				if (pc.hasVagina()) output(" your [pc.cunts] deliciously tingling");
			}
			output(".");
			
			//output("\n\nOnce you’re fully undressed, [bess.name] lets out an almost predatory noise of pleasure. [bess.HeShe] then runs [bess.hisHer] fingers along your [bess.skinFurScalesNoun], following the paths [bess.hisHer] eyes were wandering. You let out a low moan, relishing in [bess.hisHer] attentions.");
		}
		else
		{
			output("\n\n<i>“...Good [pc.boyGirl],”</i> [bess.name] praises you, causing your heart to race. You pleased her! [bess.HisHer] tone is somewhat amused as [bess.heShe] inspects your bare chest. <i>“...Already naked, I see. Were you trying to get my attention, hmm?”</i>");
			
			output("\n\nYou’re always trying to get [bess.hisHer] attention, so you answer in the affirmative, cheeks flushing. Just having [bess.HimHer] ordering you about is turning you on to no end.");
		}

		output("\n\n");
		if (!pc.isNude()) output("Once you’re fully undressed,");
		else output("Taking advantage of your perfect posture,");
		output(" [bess.name] lets out an almost predatory noise of pleasure. [bess.HeShe] then runs [bess.hisHer] fingers along your [bess.skinFurScalesNoun], following the paths [bess.hisHer] eyes were wandering. You let out a low moan, relishing in [bess.hisHer] attentions.");

		output("\n\nPacing slowly around you, [bess.name] inspects your body from head to toe, caressing your [pc.fullChest] with [bess.hisHer] slender fingers. As they dance along your [pc.skinFurScalesNoun] you struggle not to shiver with delight, especially as [bess.heShe] leans in and deliberately tickles your ear with [bess.hisHer] deliciously hot breath.");
		
		output("\n\nWithout warning, a cup-handed slap comes down on your [pc.ass]. There’s a loud smacking sound and you let out a startled yelp, your rump suddenly on fire. It’s only that way for a split second before a delicious stinging replaces it, causing you to sigh with pleasure. Another slap follows soon after, one even better than the first, and you let out a raspy moan. It stings, but it feels so damn good...!");
		
		output("\n\n<i>“You have a nice, slappable ass, "+ bessPCSexName() +". How about I slap it with my hips instead?”</i> [bess.name] leans into you from behind, whispering in your ear. The promise of pleasure causes your [pc.legs] to quiver. It seems [bess.heShe] plans to fuck your "+ (bTargetVag ? "pussy" : "ass") +" today. <i>“But first, beg for it. Beg as if your life depends on it!”</i>");
		
		output("\n\nWilling to do whatever [bess.heShe] asks you to, you whine shamelessly. <i>“Plleeeasseee, "+ bessSexName() +", please fuck me! Please, I’m begging you, fuck my "+ (bTargetVag ? "[pc.pussy "+ vagIdx +"]" : "[pc.ass]") +" - I need it so badly!”</i> The more you beg, the more you want it - now you feel like your life really <i>does</i> depend on it. <i>“...Please!”</i>");
		
		output("\n\n<i>“You haven’t earned my [bess.cock] yet - but I will give you my fingers.”</i> [bess.name] informs you, and you let out a happy noise. <i>“But first...”</i>");
		
		output("\n\n[bess.HisHer] lips caress your one of your ears and then travel down, stopping to suck at the nape of your neck. Suddenly your nipples are being pinched and you give a sharp jump, [bess.hisHer] fingers catching them as if in a trap. You couldn’t move even if you wanted to, you can feel [bess.hisHer] fingertips rolling over your sensitive nubs. You can’t help but lean back into [bess.hisHer] and give a gasping moan of pleasure.");

		if (bTargetVag)
		{
			output("\n\nMoments later, [bess.hisHer] fingers slide");
			if (pc.isTaur()) output(" around");
			else output(" down");
			output(" and lightly tease your sensitive [pc.pussy "+ vagIdx +"]. As [bess.heShe] strokes your loins, you eagerly rub against [bess.hisHer] fingers, trying to coax them inside of you for some much needed release!");
		}
		else // analscene
		{
			output("\n\nMoments later, [bess.heShe] pulls back [bess.hisHer] hands and you let out a disappointed noise. It doesn’t last long, as you soon feel [bess.hisHer] fingers sliding between your buttocks. Two of [bess.hisHer] digits spread them open as another presses against your [pc.asshole]. It feels surprisingly slick as [bess.heShe] presses it into your pucker.");
			
			output("\n\nYou let out a sweet little cry as [bess.name]’s finger wiggles into your bum. Soon it’s roaming and stirring about deep inside of you. Arching your back, you moan out loud, utterly relishing in your [pc.ass] being fingered. Without thinking, you buck back against [bess.hisHer] hand, coaxing it deeper and deeper, unable to get enough!");
		}

		output("\n\nSensing your sudden shift in attitude [bess.heShe]");
		if (!bTargetVag) output(" pulls [bess.hisHer] fingers out,");
		output(" bends you over and gives you another swift slap on your [pc.ass]. [bess.HisHer] hands are incredibly firm - far more than a regular "+ bess.mf("man", "woman") +"’s - and you squeal out loud!");
		
		output("\n\n<i>“You are not to get yourself off without my say so, is that understood?</i> [bess.name] growls and slaps your ass once more, a delicious stinging sensation spreading out from your spanked rump.");
		
		output("\n\n<i>“...I promise, I promise! I won’t try to get off without your permission, "+ bessSexName() +".”</i> You plead like a naughty little schoolgirl being bent over [pc.hisHer] parent’s knee.");
		
		output("\n\n<i>“...Did you really think I wouldn’t notice, or did you want to have your ass beaten like a little girl? Submitting to a "+ bess.mf("ben", "bess") +" sex-bot like this - and you call yourself a Steele!”</i> [bess.name] verbally berates you, causing your cheeks to flush. The metal handed synthetic smacks your bare buttocks again, causing you to yelp in delighted surprise.");

		if (bTargetVag)
		{
			output("\n\nMixing sweet pain with pleasure, you gasp as [bess.name]’s fingers suddenly slip up inside of you. They wiggle around inside of your [pc.pussy], stirring you up in more ways than one! You’re so wet from the spanking that you can <i>feel</i> yourself dribbling all over your [bess.master]’s fingers. You whimper with delight,");
			if (pc.hasLegs()) output(" spreading your [pc.legs] and");
			output(" allowing [bess.himHer] greater access.");
			
			output("\n\nWhen [bess.heShe] removes [bess.hisHer] fingers you suddenly feel empty and let out a cry of protest only to have your mouth filled with a warm [pc.girlCumFlavor] taste - it doesn’t take you long to realize you’re sucking your own girl cum off of [bess.name]’s fingertips. You eagerly suck it off like a baby, showing just how obedient you can be.");
			
			output("\n\n<i>“Now, "+ bessPCSexName() +", I want you to beg for it. I’m not going to give </i>it<i> to you unless you do.”</i> [bess.name] commands you, while [bess.hisHer] [bess.cock] rubs against your ass.");
			
			output("\n\n<i>“Please, please "+ bessSexName() +", fuck me! I need to be pounded hard from behind like the naughty slut I am, I’ll do anything!”</i> You flush furiously, willing to debase yourself utterly for the gift of [bess.hisHer] [bess.cock] inside of you.");
			
			output("\n\n<i>“Present yourself then, "+ bessPCSexName() +", and maybe I’ll use you like the naughty little cum slut that you are.”</i> You obediently present yourself and stick out your snatch, wiggling your butt all the while, desperate to entice your [bess.Mistress] to screw you absolutely senseless.");
			if (pc.hasCock()) output(" At the same time [pc.eachCock] begins to twitch with anticipation, eager to spill your [pc.cumVisc] [pc.cumNoun] all over the ground as you are shamelessly pounded from behind.");
		}
		else
		{
			output("\n\nAs [bess.name]’s hand is removed from your [pc.ass], you brace yourself for another spank. Instead, [bess.heShe] slips [bess.hisHer] slick fingers between your stinging buttocks and plunges it back inside of you. [bess.heShe] deliciously pistons your [pc.asshole] once more and you whimper with delight.");
			
			output("\n\n<i>“Now, "+ bessPCSexName() +", I want you to beg for it. I’m not going to give </i>it<i> to you unless you do.”</i> [bess.name] commands you.");
			
			output("\n\n<i>“Please, please "+ bessSexName() +", fuck me! I need to be pounded hard from behind like the naughty slut I am, I’ll do anything!”</i> You flush furiously, willing to debase yourself utterly for the gift of [bess.hisHer] [bess.cock].");
			
			output("\n\n<i>“Maybe you should get into position so I can give you your cream filling?”</i> [bess.name] suggests and you’re all too quick to comply. You present yourself and stick your rump out and wiggle it about, enticing [bess.himHer] to screw you absolutely senseless.");
			if (pc.hasCock()) output(" At the same time [pc.eachCock] begins to twitch with anticipation, slapping against your [pc.belly].");
		}
	}
	else
	{
		output("You walk up to [bess.name], an assertive gleam in your eyes. <i>“Stand to attention, "+ bessSexName() +"!”</i> You command [bess.himHer], slapping [bess.hisHer] [bess.ass] to make sure [bess.heShe] gets the message.");
		
		output("\n\n[bess.name] immediately jumps into [bess.hisHer] ‘attention’ position, a shiver of pleasure running up [bess.hisHer] spine. [bess.HeShe] spreads [bess.hisHer] legs, stands on " + bess.mf("tiptoes", "tippitoes") + " and puts [bess.hisHer] hands behind [bess.hisHer] head. [bess.HisHer] eyes are focused, waiting for further instructions. [bess.HeShe]’s trying [bess.hisHer] best to be a perfect little slave [bess.boyGirl].");
		
		output("\n\nThe first thing you do is pull out [bess.hisHer] collar and snap it around [bess.hisHer] neck. You can see the submissive switch click in [bess.hisHer] head the very <i>second</i> you click it in place, as well as the longing look in [bess.hisHer] [bess.eyeColor] eyes.");
		
		output("\n\nAfter you have fastened [bess.hisHer] collar you inspect [bess.himHer] slowly, feeling your dominance over this silver skinned "+ bess.mf("sissy", "strumpet") +". The smallest smile passes over your lips and [bess.heShe] trembles, trying to keep perfectly still - probably wondering what instructions you’re going to give [bess.himHer] today.");
		
		output("\n\n<i>“"+ StringUtil.capitalize(bessSexName()) +"! I am going to give you the immeasurable honor of fucking my "+ (bTargetVag ? "[pc.pussy "+ vagIdx +"]" : "[pc.ass]") +" from behind. If you fail to pleasure me, you will be punished - understood?”</i> You inform [bess.himHer] in a no nonsense voice");
		if (!pc.isNude()) output(", at the same time stripping off your gear.");
		else output(".");
		
		output("\n\n<i>“Yes, "+ bessPCSexName() +"!”</i> [bess.name] immediately responds to your question, knowing any delay in answering will also lead to punishment. You can see [bess.heShe]’s trying hard not to wriggle with pleasure every time you bark out an instruction - [bess.hisHer] nethers are already looking");
		if (!bess.hasVagina()) output(" quite erect.");
		else output(" a little flushed.");
		
		output("\n\n<i>“...Good. I give you permission to worship my body with your hands.”</i> Your words seem to make [bess.name] swoon with delight as [bess.heShe] relaxes [bess.hisHer] stance; [bess.heShe] seems quite eager to look upon and touch your body with utter and complete reverence. You are a god to [bess.himHer], and [bess.heShe] is your willing supplicant.");
		
		output("\n\nThe synthetic walks in front of you and bows deeply before tentatively touching your [pc.skinFurScalesNoun] with [bess.hisHer] slender fingers. Soon they are dancing along your chest as [bess.heShe] litters it with little kisses, showering your body in adoration as [bess.heShe] makes sure not an inch of you is missed.");
		
		output("\n\nAs [bess.heShe] moves behind you [bess.heShe] kisses the back of your rear causing you to shiver pleasantly; [bess.hisHer] piety is certainly to your liking. [bess.name] then coyly presses [bess.hisHer] body against your back, rubbing up against you as if in ecstasy from just being in your very presence. [bess.HisHer] lips caress your one of your [pc.ears] and then travel down, stopping to suck at the nape of your neck.");

		if (pc.biggestTitSize() > 0)
		{
			output("\n\n<i>“...May I pinch your [pc.nipples], "+ bessPCSexName() +"?”</i>");
			
			output("\n\n</i> You give [bess.himHer] permission. [bess.name] roll [bess.hisHer] over your sensitive nubs. You give a breathy sigh as you let your synthetic pet pleasure your [pc.nipples]; so far [bess.heShe]’s doing a top notch job.");
		}

		if (bTargetVag)
		{
			output("\n\n<i>“Now, give my pussy some attention, "+ bessSexName() +",”</i> </i> you command [bess.himHer]. [bess.name]’s fingers obediently slide to your sensitive snatch, lightly teasing your lips. <i>“Harder!”</i> You forcibly rub your twat against [bess.hisHer] fingers, leaning against [bess.himHer] and using [bess.hisHer] hand to get yourself off.");
			
			output("\n\nYou stand perfectly still as you feel the air teasing your drooling slit, causing a shiver to run up your spine. [bess.name]’s fingers deliciously tease your lower lips and suddenly you can feel them slipping up inside of you, penetrating your mound. You clench around [bess.hisHer] fingers and let out a breathy moan, wondering how long it’ll be before you’re creaming all over [bess.hisHer] hand.");
			
			output("\n\n[bess.HisHer] fingers probe and tease around inside your pussy, delving into you from below and sneaking upwards until [bess.heShe]’s touching all the right places. Electrifying pleasure runs upwards from your loins and up causing you to hold your breath and arch your back, dribbling your hot love liquid all down [bess.hisHer] probing digits.");
			
			output("\n\n<i>“Let’s move things further, shall we, "+ bessSexName() +"? I will allow your lowly cock to fuck my [pc.pussy "+ vagIdx +"] - be thankful.”</i> You inform [bess.himHer], your voice breathy yet commanding.");
			
			output("\n\n<i>“Yes, "+ bessPCSexName() +"!”</i> [bess.name] flushes furiously, clearly eager to fill you up with [bess.hisHer] cock.");
			
			output("\n\nYou present yourself and stick your [pc.pussy "+ vagIdx +"], wiggling your ass all the while, enticing [bess.himHer] to screw you absolutely senseless.");
			if (pc.hasCock()) output(" At the same time [pc.eachCock] begins to twitch with anticipation, slapping against your [pc.belly].");
		}
		else
		{
			output("\n\n<i>“Now, finger my ass,”</i> you command [bess.name]. [bess.HisHer] fingers slide up your ass and slip between your cheeks. Two of [bess.hisHer] digits spread them open as another presses against your [pc.asshole]. You can feel that [bess.heShe]’s turned [bess.hisHer] MeldMilk into lubricant and has coated [bess.hisHer] fingers in it.");
			
			output("\n\n[bess.HeShe] presses one of [bess.hisHer] fingers into your pucker and you let out a sensuous moan, [bess.hisHer] digit wiggling inside your bum. You rub your butt against [bess.himHer] trying to get some much needed release.");
			
			output("\n\nYou try to stand perfectly still as [bess.heShe] slips another slick finger inside of your back door, stretching you open that much more. You can’t help but shiver as your asshole is finger fucked with from behind, your forbidden place penetrated. You clench around [bess.hisHer] fingers and let out a breathy moan, wondering how long it’ll be before you hit that inevitable peak.");
			
			output("\n\n[bess.HeShe] knows exactly where to stimulate you as electrifying pleasure runs up your spine. [bess.HisHer] fingers are so thoroughly lubricated that your pucker takes them easily, filling you with an intensely pleasurable sensation. If this is what [bess.heShe] can do with [bess.hisHer] fingers, what is [bess.hisHer] cock going to feel like?");
			
			output("\n\n<i>“Let’s move things further, shall we, "+ bessSexName() +"? I will allow your lowly cock to fuck my ass - be thankful.”</i>");
			
			output("\n\n<i>“Yes, "+ bessPCSexName() +"!”</i> [bess.name] flushes furiously, clearly eager to fill the insides of your rump with [bess.hisHer] cock.");
			
			output("\n\nYou present yourself and stick your ass out, wiggling it all the while as you entice [bess.hisHer] to screw you absolutely senseless.");
			if (pc.hasCock()) output(" At the same time [pc.eachCock] begins to twitch with anticipation, slapping against your [pc.belly].");
		}
	}

	// MERGE ALL Maybe a new page here.

	if (!bess.isNude())
	{
		if (IsOneOf(bess.armor, 
			MaidOutfit, SchoolgirlOutfit, LibrarianOutfit, TopNSkirt,
			NurseOutfit, FemaleDoctorOutfit, CheerleaderUniform
		))
		{
			output("\n\n[bess.name]");
			if (!(bess.lowerUndergarment is EmptySlot)) output(" reaches up and swiftly slides off [bess.hisHer] [bess.lowerUndergarment], kicking them away. [bess.HeShe] then");
			output(" pulls [bess.hisHer] [bess.cock] from under [bess.hisHer] skirt. [bess.HeShe] looks incredibly sexy with [bess.hisHer] erection boldly thrust out from [bess.hisHer] hemline -- wearing " + indefiniteArticle(bess.armor.longName) + " is convenient!");
		}
		else if (!(bess.armor is EmptySlot))
		{
			output("\n\nWith practiced grace, [bess.name] strips off [bess.hisHer] [bess.armor]");
			if (!(bess.lowerUndergarment is EmptySlot)) output(", followed by [bess.hisHer] [bess.lowerUndergarment]");
			output(". It’s not long before [bess.heShe]’s standing there in all [bess.hisHer] naked glory, [bess.hisHer] [bess.cock] boldly on display.");
		}
		else
		{
			output("\n\nWith practiced grace, [bess.name] strips off [bess.hisHer] [bess.underGarments]. It’s not long before [bess.heShe]’s standing there in all [bess.hisHer] naked glory, [bess.hisHer] [bess.cock] boldly on display.");
		}
	}

	output("\n\nNow that you’re both properly positioned, [bess.name] rubs [bess.hisHer] [bess.cockHead] against your");
	if (bTargetVag) output(" [pc.pussy "+ vagIdx +"]");
	else output(" [pc.asshole]");
	output(". You groan as [bess.heShe] presses forward, slowly sinking [bess.himHer]self inside of you, right up to the hilt.");
	if (bess.balls > 0) output(" As [bess.heShe] bottoms out, you feel [bess.hisHer] [bess.balls] deliciously brushing against your [bess.thighs], and your whole body flushes with excitement.");
	
	bess.cockChange();
	if (bTargetVag) pc.cuntChange(vagIdx, bess.cockVolume(0));
	else pc.buttChange(bess.cockVolume(0));

	if (bess.hasVagina() && pc.hasCock() && bess.hasTailCunt())
	{
		output("\n\nAs you’re enjoying this sensation, you feel something velvety and soft brushing against your [pc.cockHead]! You suddenly realize [bess.heShe] has detached [bess.hisHer] mechanical pussy. It now lingers below your loins, attached to a long, prehensile cable [bess.heShe] can seemingly control at will.");
		
		output("\n\nYou can barely contain your surprise as it slides onto [pc.oneCock], enveloping it in [bess.hisHer] warm depths. The silvery onahole-on-a-cable milks your defenseless member for all it’s worth as you are deliciously double-teamed by [bess.name]!");
	}

	output("\n\nSlowly at first, [bess.name]’s [bess.hips] begin to slap against your buttocks. [bess.HisHer] [bess.cock] slides in and out, back and forth, plumbing your");
	if (bTargetVag) output(" sloppy snatch");
	else output(" well lubed butt");
	output(". With each and every thrust, [bess.hisHer] [bess.cockHead] delves deeper, sliding and stirring against your core.");
	
	output("\n\nYou needily answer [bess.name]’s thrusting hips, arching like a cat as [bess.heShe] fucks you long and hard. The loud sounds of [bess.himHer] slapping against your [bess.ass] brings a flush to your cheeks - not to mention your loins - as [bess.heShe] pounds your needy hole. Every time [bess.name] thrusts you are filled with the most deliciously full sensation, only to be left unbearably empty when [bess.heShe] pulls away.");

	if (bess.hasKnot())
	{
		if (bessIsDom())
		{
			output("\n\nIt’s not long before you can feel [bess.name]’s [bess.knot] swelling up deep inside of you. Instinctively, you go to pull away, only to be tugged back by your leash! You yelp in surprise like a chastised "+ pc.mf("mutt", "bitch") +".");
			
			output("\n\n<i>“Oh NO, you’re not going anywhere,”</i> [bess.name] orders you, thrusting [bess.hisHer] cock even <i>deeper</i>, <i>“...You’re going to stay there and be knotted by my [bess.cockNoun], "+ bessPCSexName() +"!”</i>");
			
			output("\n\nYou tremble and flush as [bess.hisHer]’s knot swells and stretches your inner walls. You feel like an animal being mated");
			if (pc.isAusar())
			{
				output("; but as an ausar, it flicks your breeding switch. You pant with pleasure, your mind fogged up by thoughts of filling your");
				if (bTargetVag) output(" pussy");
				else output(" butt");
				output(" with puppy-seed");
			}
			output(". Once it finishes swelling, you’re completely stuffed with [bess.hisHer] sizable bulb.");
			
			output("\n\n<i>“You’re not pulling out until I’ve finished mating with you, and I might take a while. We android [bess.boyGirl]s have a lot of stamina, so prepare to be fucked until you forget your own name, "+ bessPCSexName() +".”</i>");
			
			output("\n\nYour whole body shivers with delighted anticipation. Fucked until you forget your own name? It wasn’t that important anyway!");
		}
		else if (bessIsSub())
		{
			output("\n\nIt’s not long before you can feel [bess.name]’s [bess.knot] swelling up deep inside of you. Instinctively, [bess.name] moves to pull away, only to be pulled back by [bess.hisHer] leash. A yelping noise escapes [bess.hisHer] lips like a chastised "+ bess.mf("mutt", "bitch") +".");
			
			output("\n\n<i>“Oh NO, you’re not going anywhere. You’re going to stay there and knot my");
			if (bTargetVag) output(" pussy");
			else output(" ass");
			output(", "+ bessSexName() +"!”</i> You hold [bess.hisHer] leash firmly, making sure [bess.heShe] don’t pull out.");
			
			output("\n\n[bess.name] trembles and flushes as [bess.hisHer] knot swells and stretches your inner walls, forcing [bess.himHer] to mate with you. It’s not long before [bess.heShe]’s panting with pleasure like a hound-dog, [bess.hisHer] sizable bulb stuffed and locked inside of you.");
			
			output("\n\n<i>“You’re not pulling out until I’ve finished mating with you, and I might take a while. You synthetics have a lot of stamina, right? I want to be fucked until I forget my own name, "+ bessSexName() +".”</i>");
			
			output("\n\n[bess.name] shivers with delighted anticipation at your orders, [bess.hisHer] [bess.cock] swelling instinctively inside of you. <i>“Yes, "+ bessPCSexName() +"!”</i> Even if [bess.heShe] didn’t want to, [bess.heShe] can’t move now until [bess.heShe] cums and [bess.hisHer] knot deswells.");
		}
		else
		{
			output("\n\nYou can feel [bess.hisHer] [bess.knot] swelling up inside your");
			if (bTargetVag) output(" snatch");
			else output(" butt");
			output(", your inner walls forced to stretch to accommodate it. As you tug on it, it refuses to budge - you’ve been knotted with [bess.hisHer] [bess.cockNoun]. With [bess.hisHer] [bess.knot] swollen in your");
			if (bTargetVag) output(" vagina");
			else output(" rectum");
			output(", there’s absolutely nothing you can do about it.");
			
			output("\n\n<i>“How does it feel to be mated like an animal, "+ bessPCSexName() +"?”</i> [bess.name] teases you, pulling backwards and watching you spring back against [bess.hisHer] hips like you’re on a fleshy bungee cord. You are literally kept captive by [bess.hisHer] cock!");
			
			output("\n\nYou moan in approval as you press your [pc.ass] needily against [bess.hisHer] hips. [bess.name] tells you that you’re not going <i>anywhere</i> until [bess.heShe]’s finished mating with you; a promise that makes you shiver with barely concealed delight.");
		}

		output("\n\nNow that [bess.name]");
		if (bessIsSub()) output(" is knotted");
		else output(" has throughly knotted");
		output(" you, [bess.heShe] resumes thoroughly fucking your");
		if (bTargetVag) output(" sloppy snatch");
		else output(" ass");
		output(". You groan in delight as [bess.hisHer] knot pulses and tugs inside of you. Knotted cocks are the <i>best</i>!");
		
		output("\n\nIt’s not long before both [bess.name] and your movements become hot and feverish. Both of you are slaves to the mind blowing pleasure. Heat erupts from waves between your thighs - a broiling furnace lit by [bess.hisHer] shameless pounding of your");
		if (bTargetVag) output(" [pc.pussy "+ vagIdx +"]");
		else output(" [pc.asshole]");
		output(". You lewdly lift your hips");
		if (pc.hasTail()) output(" and raise your [pc.tail]");
		output(", trembling as [bess.hisHer] [bess.cockHead] rubs and presses against that perfect pleasure point!");
		
		output("\n\nIn a dizzying explosion of feeling, you shiver and shake, thoroughly");
		if (bTargetVag) output(" creaming yourself");
		else output(" convulsing");
		output(" around [bess.hisHer] cock.");
		if (pc.hasVagina())
		{
			if (pc.isSquirter()) output(" Squirts of [pc.girlCum] lewdly shoot from your sloppy snatch");
			else output(" Rivulets of [pc.girlCum] stream down your [pc.thighs]");
			output(" as you");
		}
		else if (pc.hasCock())
		{
			output(" Thick");
			if(pc.cumType != GLOBAL.FLUID_TYPE_SPECIAL_GOO) output(", gooey");
			output(" ropes of [pc.cumNoun] shoot from your [pc.cocks] and coat your [pc.belly] as you");
		}
		else output(" You");
		output(" tightly clench [bess.hisHer] [bess.cock].");

		if (bessIsSub())
		{
			output("\n\nWith [bess.hisHer] knot lodged inside of you, you");
			if (pc.hasLegs()) output(" hook your leg over [bess.hisHer] cock and");
			output(" turn around. You then press your [pc.ass] against [bess.hisHers], treating [bess.name] like a");
			if (bess.cocks[0].cType == GLOBAL.TYPE_VULPINE) output(" fox");
			else if (bess.cocks[0].cType == GLOBAL.TYPE_CANINE) output(" bitch");
			else output("n animal");
			output(" in heat.");
		
			output("\n\n[bess.name]’s face is flushed as [bess.heShe] lets out");
			if (bess.cocks[0].cType == GLOBAL.TYPE_CANINE) output(" hound-like cries");
			else if (bess.cocks[0].cType == GLOBAL.TYPE_VULPINE) output(" a yipping noise");
			else output(" a carnal cry");
			output(", [bess.hisHer] flexing shaft betraying just how much [bess.heShe]’s getting off being treated like a");
			if (bess.cocks[0].cType == GLOBAL.TYPE_CANINE) output(" canine");
			else if (bess.cocks[0].cType == GLOBAL.TYPE_VULPINE) output(" vulpine");
			else output(" breeding");
			output(" stud. The more spunk [bess.heShe] shoots into you, the more your belly swells, soon sloshing and deliciously full.");
			
			output("\n\n<i>“First doggy style and now knotting me from behind. Perhaps you belong in");
			if (bess.cocks[0].cType == GLOBAL.TYPE_VULPINE) output(" the wild");
			else output(" a kennel");
			output(" if you love using that");
			if (bess.cocks[0].cType == GLOBAL.TYPE_CANINE) output(" doggie");
			else output(" knotted");
			output(" dick so much!”</i> You tease [bess.name] as you tug away from [bess.himHer], forcing [bess.himHer] to follow you and show just how much [bess.heShe] is your little breeding bitch right now. [bess.HisHer] face burns with embarrassment and arousal, as [bess.heShe] is unable to remove [bess.hisHer] swollen knot.");
			
			output("\n\nFor a full half hour [bess.hisHer] hot, sticky cum pours inside of your");
			if (bTargetVag) output(" hungry uterus");
			else output(" naughty ass");
			output(". Finally, [bess.hisHer] knot deflates and [bess.heShe] pulls free with shaky legs. As soon as [bess.heShe] does, a good deal of [bess.hisHer] sticky spunk gushes out, though far more stays packed inside of your");
			if (bTargetVag) output(" sex");
			else output(" rump");
			output(".");
		}
		else
		{
			output("\n\nWith [bess.hisHer] knot lodged inside of you, [bess.name] hooks [bess.hisHer] leg over [bess.hisHer] cock and turns around. Suddenly [bess.heShe]’s pressing [bess.hisHer] [bess.ass] against yours, treating you just like a");
			if (bess.cocks[0].cType == GLOBAL.TYPE_VULPINE) output(" fox");
			else if (bess.cocks[0].cType == GLOBAL.TYPE_CANINE) output(" bitch");
			else output("n animal");
			output(" in heat.");
			
			output("\n\nYour face is flushed as you let out");
			if (bess.cocks[0].cType == GLOBAL.TYPE_CANINE) output(" hound-like cries");
			else if (bess.cocks[0].cType == GLOBAL.TYPE_VULPINE) output(" a yipping noise");
			else output(" a carnal cry");
			output(", your constricting shaft betraying just how much you’re getting off being treated like a");
			if (bess.cocks[0].cType == GLOBAL.TYPE_CANINE) output(" canine");
			else if (bess.cocks[0].cType == GLOBAL.TYPE_VULPINE) output(" vulpine");
			else output(" breeding");
			output(" slut. The more spunk [bess.heShe] shoots into you, the more your belly swells, soon sloshing and deliciously full.");
			
			output("\n\n<i>“");
			if (bess.cocks[0].cType == GLOBAL.TYPE_VULPINE) output("Mmm, you sound like you’re enjoying this. Perhaps you’re just a vixen slut deep down, "+ bessPCSexName() +"?”</i>");
			else
			{
				output("First doggy style and now being knotted from behind. Perhaps you belong in a kennel if you love taking");
				if (bess.cocks[0].cType == GLOBAL.TYPE_CANINE) output(" doggie");
				else output(" knotted");
				output(" dick so much!”</i>");
			}
			output(" [bess.name] teases you. [bess.HeShe] then tugs away from you; forcing you to follow [bess.himHer] and showing just how much you are [bess.hisHer] little");
			if (bess.cocks[0].cType == GLOBAL.TYPE_VULPINE) output(" foxy");
			output(" bitch right now. Your face burns with embarrassment and arousal - you really are completely stuck on [bess.hisHer] swollen knot!");
			
			output("\n\nEvery time you think the pressure is too much and is going to force [bess.hisHer] swollen [bess.cockNounSimple] out, your insides give out and swell that much more, causing you to let out a guttural moan. For a full half hour your vulnerable");
			if (bTargetVag) output(" uterus");
			else output(" backside");
			output(" is abused, [bess.hisHer] hot, sticky cum pouring inside of you.");
			
			output("\n\nAt long last, [bess.name]’s knot deflates and [bess.heShe] pulls free of your violated hole with a massive grin on [bess.hisHer] face. When [bess.heShe] does, a good deal of [bess.hisHer] sticky spunk gushes out of you all at once. Far more stays packed inside of your");
			if (bTargetVag) output(" sex");
			else output(" rump");
			output(".");
		}
	}
	else if (bess.cocks[0].cType == GLOBAL.TYPE_GOOEY)
	{
		output("\n\nIt’s not long before both [bess.name] and your movements become hot and feverish. Both of you are slaves to the mind blowing pleasure. Heat erupts from waves between your thighs - a broiling furnace lit by [bess.hisHer] shameless pounding of your");
		if (bTargetVag) output(" [pc.pussy "+ vagIdx +"]");
		else output(" [pc.asshole]");
		output(". You lewdly lift your hips");
		if (pc.hasTail()) output(" and raise your [pc.tail]");
		output(", trembling as [bess.hisHer] [bess.cockHead] rubs and presses against that perfect pleasure point!");

		if (bTargetVag)
		{
			output("\n\nAs your [pc.girlcum] gushes all over [bess.hisHer] gelatinous cock, you realize all too late that it is feeding off your liquids. Suddenly it is filling every inch your pussy, massaging your insides and forcibly coaxing you to cream even harder. As your hot love juices spill out against your will, it expands until it finally hits critical mass.");
		}
		else
		{
			output("\n\nAs you cum [bess.hisHer] gelatinous member begins massaging every inch and crevasse of your back door, as if trying to coax something out of you. All too late do you realize it is trying to milk you for");
			if (pc.ass.wetness() <= 2) output(" liquids that simply aren’t there, eager to feed off fem juices. Unable to find any");
			else output(" anal juices. Finding them in abundance");
			output(", [bess.hisHer] jelly cock seems to become more aggressive -");
			if (pc.hasCock() && !bTargetVag) output(" milking your prostate");
			else output(" massaging your innards");
			output(" and making your orgasm even more intense.");
		}

		output("\n\nAll of a sudden you can feel bits of [bess.hisHer] goo-cock breaking off, sliding up and into");
		if (bTargetVag) output(" your unprotected uterus. Before you know it they’re swimming about inside your womb, making themselves at home");
		else output(" the deepest parts of your gut, making themselves at home");
		output(". Not content with the");
		if (bTargetVag && pc.vaginas[vagIdx].wetness() < 2 || !bTargetVag && pc.ass.wetness() < 2) output(" lack of");
		output(" liquids they are getting, they coax your insides - releasing aphrodisiacs directly into your");
		if (bTargetVag) output(" snatch");
		else output(" back channel");
		output(".");
		
		output("\n\nYour loins feel as if they are going into overdrive - you rub your [pc.thighs] together");
		if (bTargetVag) output(" as you gush even more of your [pc.girlcum] all over");
		else output(" as your ass clenches around");
		output(" the mini slimes. Drool comes from the side of your mouth as you let out a delirious noise of ecstasy, your mind and body pumped full of euphoric drugs. The slimes suddenly begin to expand dramatically in size, and you along with them, as they try every way they can to make you feed them");
		if (bTargetVag && pc.vaginas[vagIdx].wetness() < 2 || !bTargetVag && pc.ass.wetness() < 2) output(" your non-existent");
		else output(" more of");
		output(" juices.");
		
		output("\n\nEventually [bess.name] pulls out,");
		if (bessIsSub()) output(" your sub");
		output(" giving a naughty grin at the fact you are now a bloated, dribbling mess. None of [bess.hisHer] slimy <i>“cum”</i> escapes your");
		if (bTargetVag) output(" lower lips");
		else output(" asshole");
		output(" - it continues to tease your");
		if (bTargetVag) output(" womb and pussy");
		else output(" nether hole");
		output(", forcing you to orgasm against your will over and over again. Soon you are bloated like you are going to give birth to a toddler, moaning as you rub your slime filled belly.");
		
		output("\n\nWhat [bess.name] says next does fill you with some concern, even as you writhe in pleasure on the ground. <i>“...Now how to get them out of there?”</i> The synthetic seems to have no idea how to remove the clearly sentient slime from your");
		if (bTargetVag) output(" womb");
		else output(" backside");
		output(", where they are suckling your");
		if (bTargetVag) output(" juices");
		else output(" insides");
		output(" like an infant feeding off their mother. Your panic, however, is short lived. <i>“...Oh! Just found the recall switch.”</i>");
		
		output("\n\n[bess.name] presses a button on [bess.hisHer] side. You part your [pc.thighs], suddenly feeling as if you are giving birth to a fully grown galotian. The gooey entities merge together and stretch your");
		if (bTargetVag) output(" vaginal");
		else output(" anal");
		output(" passage wide open - massaging it as they pass all the way down. Instead of pain, you cry out in rapture,");
		if (bTargetVag) output(" splattering your [pc.girlcum] all over your slimy baby as it");
		else output(" cumming explosively as your slimy baby");
		output(" travels down and out your love canal. As you writhe on the ground, your");
		if (bTargetVag) output(" [pc.pussy "+ vagIdx +"]");
		else output(" [pc.asshole]");
		output(" spasming and convulsing, it plops out of you and onto the ground in a big jelly pile.");
		
		output("\n\nOnce it is free from your");
		if (bTargetVag) output(" womb");
		else output(" rump");
		output(" it begins to slowly shrink down. It sloshes across the ground towards [bess.name], where [bess.heShe] places it back on the containing ring above [bess.hisHer] mound. It slides back into shape once again - almost as if nothing had even happened.");
	}
	else if (bess.cocks[0].cType == GLOBAL.TYPE_VENUSPITCHER)
	{
		output("\n\nIt’s not long before both [bess.name] and your movements become hot and feverish. Both of you are slaves to the mind blowing pleasure. Heat erupts from waves between your thighs - a broiling furnace lit by [bess.hisHer] shameless pounding of your");
		if (bTargetVag) output(" [pc.pussy "+ vagIdx +"]");
		else output(" [pc.asshole]");
		output(". You lewdly lift your hips");
		if (pc.hasTail()) output(" and raise your [pc.tail]");
		output(", trembling as [bess.hisHer] [bess.cockHead] rubs and presses against that perfect pleasure point!");
		
		output("\n\n[bess.HisHer] ever-growing beanstalk has been steadily growing wetter");
		if (bTargetVag) output(" the more you’ve watered it with your gushing girl cum");
		else output(" from being in your dark wet ass");
		output(", causing you to get even hotter in turn. Now its head begins to sprout inside of your");
		if (bTargetVag) output(" pussy");
		else output(" ass");
		output(" causing you to gasp, the petals of [bess.hisHer] flowering bulbous head caressing your inner walls and causing your [pc.thighs] to quiver spastically with pleasure.");
		if (bTargetVag) output(" Your naughty juices drench the blossoming flower as it tickles your deepest depths, sucking up your life-giving liquids.");
		
		output("\n\nSuddenly thick gooey sap is spurting deep inside you and thoroughly basting your");
		if (bTargetVag) output(" cervix");
		else output(" bowels");
		output(". The base of [bess.hisHer] organic tendril expands so not a drop of [bess.hisHer] sticky seed escapes you, spurting [bess.hisHer] sappy amber juices inside of you. It’s not long before [bess.hisHer] warm organic liquid is filling up your");
		if (bTargetVag) output(" hungry and fertile womb");
		else output(" dirty ass");
		output(" in an attempt to pollinate you and get you pregnant.");
		
		output("\n\nTiny tendrils reach up and massage your");
		if (bTargetVag && pc.hasClit()) output(" [pc.clit]");
		else output(" ass");
		output(" causing you to moan");
		if (bTargetVag) output(", milking you for more fertilizing girl cum as you spurt uncontrollably all over [bess.hisHer] ever-swelling cock");
		output(". You’ve never felt so full in all your life! [bess.HisHer] inner shaft grows tendrils, massaging every nook and cranny of your already stretched canal causing you to cum again and again.");
		
		output("\n\nEventually [bess.name] pulls [bess.hisHer] blossoming plant phallus out of your well-packed");
		if (bTargetVag) output(" pussy");
		else output(" posterior");
		output(", but not a single drip comes out of you. Your gaping hole has been coated with a layer of thick and sticky amber sap, trapping [bess.hisHer] liquid pollen inside your");
		if (bTargetVag) output(" love canal and fertile womb");
		else output(" inflated rump");
		output(". How long are you going to have to stay like this?");
		
		output("\n\n<i>“Don’t worry, "+ bessPCSexName() +", I’ll fix it for you.”</i> [bess.name] purrs seductively as [bess.heShe] spreads your [pc.legsNoun] and sticks [bess.hisHer] finger forcibly into the semi-permeable sap. [bess.HeShe] scoops it out as you rub your incredibly bloated belly. Suddenly you feel like your water breaks and it all comes gushing out at once - you let out a sweet cry as a liquid amber river explodes from your");
		if (bTargetVag) output(" netherlips");
		else output(" well-stretched anus");
		output(" and all over the floor.");
		
		output("\n\nYour face is furiously heated as [bess.name] licks up the remainder of the sap from your");
		if (bTargetVag) output(" snatch");
		else output(" dirty ass");
		output(", letting [bess.hisHer] tongue roam around inside of you until you’re fully clean.");
		if (!pc.isPregnant())
		{
			output(" I can’t do anything about the sticky stuff");
			if (bTargetVag) output(" in your womb");
			else output(" further in");
			output(", hopefully it’s not a problem...?”</i>");
		}
	}
	else
	{
		output("\n\nIt’s not long before both [bess.name] and your movements become hot and feverish. Both of you are slaves to the mind blowing pleasure. Heat erupts from waves between your thighs - a broiling furnace lit by [bess.hisHer] shameless pounding of your");
		if (bTargetVag) output(" [pc.pussy "+ vagIdx +"]");
		else output(" [pc.asshole]");
		output(". You lewdly lift your hips");
		if (pc.hasTail()) output(" and raise your [pc.tail]");
		output(", trembling as [bess.hisHer] [bess.cockHead] rubs and presses against that perfect pleasure point!");
		
		output("\n\nIn a dizzying explosion of feeling, you shiver and shake, thoroughly");
		if (bTargetVag) output(" creaming yourself");
		else output(" convulsing");
		output(" around [bess.hisHer] cock.");
		if (pc.hasVagina())
		{
			if (pc.isSquirter()) output(" Squirts of [pc.girlCum] lewdly shoot from your sloppy snatch");
			else output(" Rivulets of [pc.girlCum] stream down your [pc.thighs]");
			output(" as you");
		}
		else if (pc.hasCock())
		{
			output(" Thick");
			if(pc.cumType != GLOBAL.FLUID_TYPE_SPECIAL_GOO) output(", gooey");
			output(" ropes of [pc.cumNoun] shoot from your [pc.cocks] and coat your [pc.belly] as you");
		}
		else output(" You");
		output(" tightly clench [bess.hisHer] [bess.cock].");
		
		output("\n\nWringing [bess.hisHer] [bess.cockNoun] pushes [bess.himHer] over the edge, and [bess.heShe] lets out a "+ bess.mf("sharp", "sweet") +" cry. [bess.HeShe] grabs your hips firmly in hand and gives one last, passionate thrust. Inside of you, you feel hot, sticky ropes of [bess.hisHer] spunk splashing against your inner walls and drooling deep into your");
		if (bTargetVag) output(" cunt");
		else output(" butt");
		output(". You moan in delight as [bess.name]’s thick jism bubbles and pours");
		if (bTargetVag) output(" into [bess.hisHer] eagerly awaiting womb");
		else output(" deep inside of you");
		output(".");
	
		// bess has a pussy, PC has a cock, and Bess's tailcunt is set to active:
		if (bess.hasVagina() && pc.hasCock() && bess.hasTailCunt())
		{
			output("\n\nAs you’re being filled with [bess.hisHer] synthetic spunk, your [pc.cockNoun] in turn spurts wildly into [bess.hisHer] detached pussy. It sucks on your length with unusual force, sucking and slurping up your [pc.cum]. It’s like you’re being fucked while attached to a milker!");
		}

		output("\n\nAs you recover, you can see [bess.name] is stroking [bess.hisHer] flaccid phallus, though you can see it slowly starting to stir again. <i>“");
		if (bessIsEqual()) output("... Mmmm, "+ bessPCName() +", I loved fucking your");
		else if (bessIsDom()) output("Good job, "+ bessPCSexName() +", I thoroughly enjoyed fucking your");
		else output("Um, "+ bessPCSexName() +", I hope you enjoyed me fucking your");
		if (bTargetVag) output(" [pc.pussy "+ vagIdx +"]");
		else output(" [pc.ass]");
		output(".”</i>");
		if (bessIsSub()) output(" You nod, thoroughly satisfied with [bess.hisHer] efforts.");
	}

	processTime(45+rand(15));

	for (var i:int = 0 ; i < 5; i++)
	{
		if (bTargetVag) pc.loadInCunt(bess, vagIdx);
		else pc.loadInAss(bess);
		pc.orgasm();
	}

	if (flags["BESS_FUCKED"] == undefined) flags["BESS_FUCKED"] = 0;
	flags["BESS_FUCKED"]++;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessGetCunni():void
{
	clearOutput();
	bessHeader();

	// PC Must have a pussy

	if (bessIsEqual())
	{
		output("You’re really horny, so you ask [bess.name] if [bess.heShe] would eat out your pussy.");

		output("\n\n[bess.name] smiles at your request, clearly happy to oblige. <i>“Eat out your pussy? You make it sound like a </i>chore<i>,”</i> [bess.heShe] all but purrs.");

		output("\n\n[bess.HeShe] gets down on all fours as you");
		if (!pc.isNude()) output(" strip off your things and");
		if (pc.genitalSpot <= 1) output(" lie down on your back, spreading your legs wide open.");
		else output(" get down on all fours, presenting your ass to [bess.himHer].");
		output(" As soon as you do [bess.heShe] moves forward, hungry for your [pc.girlCumFlavor] taste.");
	}
	else if (bessIsDom())
	{
		output("[bess.name] purposefully strides up to you and you can feel your sub-senses tingling. You just <i>know</i> that [bess.heShe]’s going to order you to do something, but what? Your mouth goes dry as [bess.heShe] approaches, your collar secured in [bess.hisHer] right hand. There’s a leash in [bess.hisHer] left, though no explanation is given.");
		
		output("\n\nInstead, your favorite raiment is secured tightly around your neck and the leash clipped to the D-ring at your throat. One sharp tug is given and you instantly drop to your knees, thoroughly eager to do whatever [bess.heShe] asks of you.");
		
		output("\n\n<i>“Ass in the air and legs spread, "+ bessPCSexName() +" - NOW!”</i> [bess.name] demands of you, and you instantly comply. You raise your ass high up in the air like a bitch in heat, your [pc.genitals] lewdly exposed.");
		
		output("\n\n<i>“");
		if (pc.isBiped()) output("All fours");
		else output("On the ground, ass in the air");
		output(", "+ bessPCSexName() +" - now!”</i> [bess.name] barks instructions at you like a whip cracking through the air. You do as instructed, getting down on the ground like a dog with your [pc.ass]");
		if (pc.hasTail()) output(" and [pc.tail]");
		output(" raised in the air. As soon as you do, [bess.heShe] walks around you and momentarily out of sight.");

		if (!pc.isNude())
		{
			output("\n\nWithout warning, you feel a pair of smooth hands sliding up your body - pulling off your gear and tossing it aside. <i>“...These won’t do, at least for what I have in mind for you.”</i>");
			
			output("\n\nYour back shivers with delicious anticipation; what is [bess.heShe] planning? You can’t wait to find out!");
		}

		output("\n\nYou then feel a hand stroking the back of your neck, tickling your [pc.skin]. You flush, knowing that [bess.heShe] is rewarding you for being a good [pc.boyGirl]. It fills you with a sense of pride, your chest puffing out as [bess.heShe] pats you.");

		if (pc.genitalSpot <= 1)
		{
			output("\n\n<i>“Roll over and on your back, "+ bessPCSexName() +"!”</i> Your second set of instructions comes like a whip-crack, and you immediately comply.");
			if (pc.isBiped()) output(" Rolling on to your back like an animal, [bess.heShe] then forcibly spreads your legs apart.");
			
			output("\n\nYou furiously flush as your shamefully dewy mound is exposed. [bess.HeShe] clearly notices too, a glimmer of amusement in [bess.hisHer] sharp [bess.eyeColor] eyes. You try not to wiggle with pleasure under [bess.hisHer] gaze, feeling it penetrate your very soul.");
			
			output("\n\n<i>“I’m hungry for the taste of your cunt, and I’m going to have my fill of it.”</i> [bess.name] huskily purrs, getting down on all fours");
			if (pc.isBiped()) output(" between your spread thighs");
			output(". [bess.HeShe] keeps a tight grip on your collar as [bess.heShe] slides up to your naughty puss, a ravenous look in [bess.hisHer] eyes.");
		}
	}
	else
	{
		output("Your pussy needs eating out right now, and you’re sure as hell not going to do it yourself. Where’s that submissive sex-bot of yours? You seek [bess.himHer] out.");
		
		output("\n\n<i>“Over here, "+ bessSexName() +"!”</i> You all but whistle for [bess.himHer]. [bess.HeShe] immediately rushes to your side and you place [bess.hisHer] collar on, clamping it firmly around [bess.hisHer] neck. After you’re sure it is on nice and tight, you attach a dog lead to the D-ring at [bess.hisHer] neck, then give it a sharp tug. [bess.HeShe] yelps and gets on all fours, just like a good bitch.");
		
		output("\n\n<i>“Good [bess.boyGirl]! You, "+ bessSexName() +", are going to eat out my cunt with </i>relish<i>. I won’t tolerate any sloppiness... besides the obvious, fun kind of course. Understand?”</i> You deliver a sharp slap to [bess.hisHer] cheek, watching the psychological blow strike far harder than the physical one.");
		
		output("\n\n[bess.name] flushes with shame and pleasure, not to mention the fresh blow. <i>“O-of course, "+ bessPCSexName() +"!”</i> [bess.HeShe] compliantly sits there as you");
		if (!pc.isNude()) output(" strip off your gear and");
		if (pc.genitalSpot <= 1) output(" sit down on a chair, spreading your legs wide open.");
		else output(" get down on all fours, presenting your ass to [bess.himHer].");
		output(" With a pointed pull of the collar, you bring [bess.hisHer] mouth closer to your [pc.pussy].");
	}

	output("\n\n[bess.name] brings [bess.hisHer] lips up to your pussy and can feel [bess.hisHer] hot breath washing over your sensitive flesh, turning into electricity and traveling up your spine. It’s not long before those perfect lips are parting and [bess.hisHer] tongue is reaching out to lap at your netherlips.");
	
	output("\n\nThe cool sensation of [bess.hisHer] saliva rolling off [bess.hisHer] tongue and onto your sex feels positively divine. You arch your back and push your [pc.pussyColor] mound into the sensation, relishing in every milli-inch it traces around it.");

	if (bessIsDom()) output("\n\n<i>“I’m going to stick my tongue inside you now, "+ bessPCSexName() +".”</i> [bess.name] informs you.");
	else output("\n\n<i>“Stick your tongue inside, "+ bessSexName() +".”</i> You tell [bess.name].");
	output(" [bess.HisHer] tongue then parts your now glistening folds and dips slowly inside of you. The sensation of [bess.hisHer] silvery tastebuds licking the inside of your slippery snatch is out of this world.");
	if (pc.genitalSpot <= 1 && pc.legCount > 2) output(" You sigh with pleasure, subconsciously hook your legs over [bess.hisHer] shoulders and pulling [bess.hisHer] closer.");
	else output(" You let out a low moan, your hips wiggling as [bess.hisHer] tongue delves and explores your insides.");

	output("\n\nAs [bess.hisHer] tongue continues to explore your depths, [bess.heShe] lets out a low moan, clearly enjoying probing your pussy as much as you enjoy being probed. Your warm, sticky girl juices drool out and all over [bess.hisHer] lapping tongue. [bess.name] eagerly drinks this up and groans happily into your muff; to [bess.himHer] it tastes like pure ambrosia.");
	
	output("\n\nSuddenly [bess.heShe]’s pulling out and you let out a disappointed cry, only to feel one of [bess.hisHer] slender fingers wiggling inside your [pc.pussy]. Your note of disapproval quickly becomes one of delight as [bess.hisHer] probing digit wiggles up and presses against your sensitive g-spot. You utterly swim in pleasure as a hot feeling pools in your lower abdomen, coiling inside of you. You know it’s not going to be long at all before you are utterly creaming yourself");
	if (pc.hasCock()) output(" and shooting your load all over the place.");
	
	output("\n\nTeasing your sweet spot in delicious, pulsing movements, [bess.name] brings [bess.hisHer] mouth down and laps at your");
	if (pc.hasClit()) output(" [pc.clits]");
	else output(" outer lips");
	output(". The skilled synthetic teases");
	if (pc.totalClits() == 1) output(" it");
	else output(" them");
	output(" with [bess.hisHer] tongue, masterfully pleasuring your [pc.pussy] both inside and out.");
	
	output("\n\nYour legs begin to spasm uncontrollably as [bess.hisHer] twin assault pushes you over the edge. Suddenly your hips are shaking spastically as you cry out in delirious, carnal ecstasy. Your [pc.pussy] messily");
	if (pc.isSquirter()) output(" squirts");
	else output(" dribbles");
	output(" your [pc.girlcum] all over [bess.hisHer] tongue, which [bess.heShe] laps up with relish.");
	if (pc.hasCock()) output(" At the same time, you shoot your [pc.cum] all over your [pc.belly].");
	
	output("\n\nOnce your orgasm subsides, [bess.name] gives your sticky lips a few more affectionate licks. [bess.HeShe] then pulls back and looks at you with bright [bess.eyeColor] eyes. <i>“");
	if (bessIsEqual()) output("Mmm; you’re so tasty, "+ bessPCSexName() +". I love eating you out.");
	else if (bessIsDom()) output("Good job, "+ bessPCSexName() +". I do so love eating out your delicious hole.");
	else output("I hope you enjoyed yourself, "+ bessPCSexName() +". Were my efforts were to your satisfaction?");
	output("”</i>");

	processTime(25 + rand(10));

	for (var i:int = 0; i < 3; i++)
	{
		pc.orgasm();
	}

	if (flags["BESS_FUCKED"] == undefined) flags["BESS_FUCKED"] = 0;
	flags["BESS_FUCKED"]++;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessBreastFeed(opts:Array = null):void
{
	var breastReduction:Boolean = false;
	var newRating:int = -1;

	if (opts)
	{
		breastReduction = opts[0];
		newRating = opts[1];
	}

	clearOutput();
	bessHeader();

	if (bessIsDom())
	{
		output("<i>“Time to suck my [bess.nipples], "+ bessPCSexName() +". I don’t want all this milk going to waste.”</i> [bess.name] orders you in a soothing, yet stern voice. [bess.HeShe] tells you to take off your things, and you immediately comply.");
	}
	else
	{
		output("<i>“"+ StringUtil.capitalize(bessSexName()) +", can I please suckle your delicious breast milk?”</i> You request of [bess.himHer], [bess.hisHer] eyebrows raising. [bess.HeShe] smiles and strides over to you, stroking [bess.hisHer] fingers down [bess.hisHer] swollen teats.");
		
		output("\n\n<i>“...You want to suckle my [bess.nipples]? It </i>would<i> be a shame if all that milk went to waste.”</i> [bess.name] muses, happy to feed it to you.");
		if (!pc.isNude()) output(" You take off your [pc.gear], preferring to be naked for this.");
	}

	if (!(bess.armor is EmptySlot) || !(bess.upperUndergarment is EmptySlot))
	{
		output("\n\n[bess.name] quickly removes any obstructing clothing, tossing away [bess.hisHer] [bess.upperGarments]. Within moments, [bess.hisHer] [bess.breasts] are proudly on display.");
	}

	output("\n\nYou openly ogle the [bess.milkNoun] dribbling from [bess.hisHer] [bess.nipples]. All of it is simply going to waste, but not for much longer.");
	if (pc.genitalSpot <= 1) output(" [bess.HeShe] climbs up into your lap");
	else output(" [bess.HeShe] moves up to you");
	output(" - [bess.hisHer] [bess.belly] pressing against your chest - and holds one of [bess.hisHer] [bess.breasts] in one hand. [bess.HeShe] lifts it up for you to suckle upon.");
	
	output("\n\n<i>“...How about a scrumptious milkshake, "+ bessPCName() +"? My treat,”</i> [bess.name] purrs seductively as you take [bess.hisHer] [bess.nipple] between your [pc.lips]. You can taste [bess.hisHer] [bess.milk] squirting out onto your tongue. [bess.HisHer] [bess.milkVisc] fluid filling your mouth as you hungrily suck on [bess.hisHer] [bess.breasts].");
	
	output("\n\nYou can tell [bess.name] is thoroughly enjoying it as [bess.heShe] lets out a rapturous moan, [bess.hisHer] head lolling back as you feed from [bess.hisHer] mounds. You cup [bess.hisHer] smooth [bess.breastCupSize]s in your hands and give them a cow-like squeeze, feeling [bess.hisHer] milk eagerly jet into your mouth.");
	
	output("\n\n<i>“T-this feels so goood...”</i> [bess.name] dreamily moans. You continue to milk [bess.hisHer] udders until [bess.heShe] creams [bess.himHer]self, overwhelmed by the sensory overload of you feeding on and squeezing [bess.hisHer] silvery lactating tits. As [bess.heShe] cums, [bess.name] presses [bess.hisHer] [bess.breasts] against your face, [bess.hisHer] fingers pulling your head hard against them.");
	
	output("\n\nSoon it’s time for the other breast and you milk and suck on [bess.hisHer] [bess.nipples], delighting in the sordid moans every time [bess.heShe] squirts another jet of [bess.milk] into your mouth. Practically comatose with pleasure, it’s not long before [bess.name is cumming once again, legs twitching as [bess.heShe] lets out a whimpering moan.");
	
	output("\n\nYou continue until you’ve");
	if (breastReduction)
	{
		output(" sucked [bess.hisHer] silvery spheres dry,");
		if (newRating == 0) output(" leaving [bess.himHer] with a flat, boyish chest");
		else output(" down to "+ bess.breastCup(0, newRating));
	}
	else
	{
		output(" had your fill of [bess.hisHer] [bess.milk]");
	}
	output(".");
	pc.milkInMouth(chars["BESS"]);
	if (bess.hasCock() || bess.hasVagina())
	{
		output(" [bess.HisHer] thighs are a mess with");
		if(bess.cumType != bess.girlCumType)
		{
			if (bess.hasCock()) output(" [bess.cum]");
			if (bess.hasCock() && bess.hasVagina()) output(" and");
			if (bess.hasVagina()) output(" [bess.girlCum]");
		}
		else
		{
			if (bess.hasCock()) output(" [bess.cum]");
			else output(" [bess.girlCum]");
		}
		output(", occasionally twitching as [bess.heShe] falls back on the ground. [bess.HisHer] nipples really are sensitive!");
	}

	if (newRating != -1)
	{
		((bess as Bess).breastRows[0] as BreastRowClass).breastRatingRaw = newRating;
		
		output("\n\n<b>[bess.name] now has ");
		if (newRating > 0) output(bess.breastCup(0, newRating) +" breasts!");
		else output(" a flat chest!");
		output("</b>");
	}

	if (flags["BESS_FUCKED"] == undefined) flags["BESS_FUCKED"] = 0;
	flags["BESS_FUCKED"]++;

	flags["BESS_BREASTFED"] = 1;

	pc.lust(15);
	bess.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessMilkers(opts:Array = null):void
{
	var breastReduction:Boolean = false;
	var newRating:int = -1;

	if (opts)
	{
		breastReduction = opts[0];
		newRating = opts[1];
	}

	clearOutput();
	bessHeader();

	output("You inform [bess.name] that you want to use some dairy milkers on [bess.hisHer] breasts.");

	if (flags["BESS_MILKERS_TIMES"] == undefined)
	{
		flags["BESS_MILKERS_TIMES"] = 1;

		output("\n\n<i>“Wha- use a milker? Like a pregnant New Texan cow...?”</i> [bess.name] blushes <i>hard</i> at your suggestion. At the same time [bess.heShe] trembles with excitement as you pull out the object in question.");

		output("\n\nDespite any verbal objection,");
		if (bess.isChestGarbed()) output(" [bess.name] slips off [bess.hisHer] [bess.UpperGarments]. [bess.HeShe] then");
		else output(" [bess.heShe]");
		output(" gets on all fours on a nearby bench, positioning [bess.himHer]self to be the perfect height for you. [bess.HisHer] [bess.breasts] dangle below [bess.himHer].");
	}
	else
	{
		flags["BESS_MILKERS_TIMES"]++;
		output("\n\nA blush dusts the synthetics cheeks, recalling [bess.hisHer] previous encounter with the milking machine.");
		if (bess.isChestGarbed()) output(" [bess.name] slips off [bess.hisHer] [bess.UpperGarments]. [bess.HeShe] then");
		else output(" [bess.HeShe]");
		output(" gets on all fours on a nearby bench, positioning [bess.himHer]self to be the perfect height for you. [bess.HisHer] [bess.breasts] dangle below [bess.himHer].");
	}

	output("\n\nYou click the milker on and a sucking air noise immediately comes from one of the teat cups. Out of the corner of your eye you see [bess.name] shiver pleasantly at the noise");
	if (!(bess.lowerUndergarment is EmptySlot)) output(", wearing nothing but [bess.hisHer] [bess.lowerUndergarment]");
	output(".");
	
	output("\n\n<i>“Looking forward to getting milked like a cow, "+ bessSexName() +"?”</i> You teasingly remark, a hint of amusement in your voice. Your words cause [bess.himHer] to flush even more, [bess.hisHer] [bess.breasts] jiggling about.");
	
	output("\n\n<i>“N-n-no! Why would I be happy about that?”</i> [bess.name] blatantly lies, refusing to meet your gaze.");
	
	output("\n\n<i>“Really? I guess I’ll just put these away then...”</i> You playfully begin to pack up. It doesn’t take [bess.himHer] long to cave at all.");

	output("\n\n<i>“Alright, alright! I desperately want to be treated like a knocked up cow slut... and... I’m jealous of organic [bess.boyGirl]s who just get fucked");
	if (bess.hasVagina()) output(", impregnated,");
	output(" and milked all the time!”</i> [bess.name] looks like [bess.heShe]’s about to die from shame, though [bess.hisHer] thighs are trembling with excitement.");
	
	output("\n\nAfter [bess.hisHer] embarrassing admission, you clamp the suction cups around [bess.hisHer] erect [bess.nipples], watching as they get sucked inside. The device rhythmically tugs at [bess.hisHer] silvery nubs and [bess.heShe] lets out a satisfied moan.");
	
	output("\n\n<i>“Oooohhh, I could live with these on...”</i> [bess.name] seems like [bess.heShe]’s practically melting. [bess.HisHer]");
	if (bess.hasCock()) output(" [bess.cock] stiffens");
	if (bess.hasCock() && bess.hasVagina()) output(" and [bess.hisHer]");
	if (bess.hasVagina()) output(" [bess.pussy] moistens");
	if (!bess.hasVagina() && !bess.hasCock()) output(" [bess.ass] wiggles");
	output(" in pleasure. You reach out and stroke it, forcing [bess.himHer] to let out a low, lusty moan.");

	output("\n\n<i>“How is that, "+ bessSexName() +" - do you like being milked while I stroke you here?”</i> You tauntingly ask.");
	
	output("\n\n[bess.name] nods feverishly in response, unable to keep [bess.hisHer] body still. Instead [bess.heShe] rocks back and forth on [bess.hisHer] hands and knees, clearly caught up in the wonderful sensations of having [bess.hisHer] tits milked and [bess.hisHer] privates fondled.");
	
	output("\n\nIn a delicious little spurt, [bess.hisHer] [bess.nipplesNoun] fire [bess.hisHer] milk into the see-through canisters, battering the insides with [bess.hisHer] white, [bess.milkFlavor] fluid. It immediately gets sucked into the tube. At the exact same time, [bess.name]");
	if (!bess.hasCock() && !bess.hasVagina()) output(" experiences a tiny orgasm");
	else
	{
		if (bess.hasCock()) output(" spurts creamy ropes of spunk");
		else output(" squirts [bess.hisHer] girl-juice");
		if (!(bess.lowerUndergarment is EmptySlot)) output(" into [bess.hisHer] [bess.lowerUndergarment]");
		else output(" all over your hand");
		output(", marking it with [bess.hisHer] fluids.");

		if (!(bess.lowerUndergarment is EmptySlot)) output("\n\n<i>“Messing up your undies!");
		else output("\n\n<i>“Making my hand wet like that!");

		output(" Naughty [bess.boyGirl].”</i> You reprimand [bess.himHer], all the while fondling [bess.hisHer]");
		if (!(bess.lowerUndergarment is EmptySlot)) output(" now sticky loins");
		output(".");
	}

	output("\n\n[bess.name] arches [bess.hisHer] back like a cat at your teasing words and presses [bess.hisHer] squelching");
	if (!(bess.lowerUndergarment is EmptySlot)) output(" underwear");
	else output(" loins");
	output(" against your hand. [bess.HisHer] [bess.breasts] practically burst into the canisters, [bess.nipples] firing off like milky machine guns. You turn up the suction to max and watch as [bess.name]’s eyes roll back into [bess.hisHer] head, thick streams of [bess.milk] filling up the transparent tubes. It’s more than [bess.name]’s processors can take, and soon [bess.heShe] mentally regresses to a gibbering mess.");
	
	output("\n\nDrooling in near comatose pleasure, [bess.name]’s upper body falls against the bench as [bess.heShe] pokes out [bess.hisHer] ass like a common farm animal.");
	if (bess.hasCock() || bess.hasVagina())
	{
		output(" [bess.HisHer]")
		if (bess.hasCock()) output(" [bess.cockNounSimple] fires another load of [bess.cum]");
		else if (bess.hasVagina()) output(" [bess.pussy] squirts once more, splashing [bess.girlCum]");
		if (!(bess.lowerUndergarment is EmptySlot)) output(" in [bess.hisHer] [bess.lowerUndergarment]");
		else output(" on your hand");
		output(".");
	}

	if (pc.hasCock())
	{
		output("\n\nUnable to hold back any longer, you move up behind [bess.himHer],");
		if (!pc.isNude()) output(" strip off your gear,");
		output(" and pull out your [pc.cocksNounSimple]. You then");
		if (!(bess.lowerUndergarment is EmptySlot)) output(" pull down [bess.hisHer] sopping wet [bess.lowerUndergarment] until they rest at [bess.hisHer] knees and");
		output(" penetrate [bess.himHer] with your prick. You sink it deep into [bess.hisHer] [bess.vagOrAss]. Incapable of speech, [bess.name] whimpers and slaps [bess.hisHer] hips back against yours, encouraging you to breed [bess.hisHer] slutty synthetic");
		if (bess.hasVagina()) output(" snatch");
		else output(" ass");
		output(".");
		
		output("\n\n[bess.name] can’t seem to stop cumming as [bess.hisHer] [bess.nipples] are milked, especially with your [pc.cock] buried inside [bess.himHer]. Feeling [bess.himHer] ripple and clench around you gets you off ridiculously quick. It’s not long before you’re groaning and shooting your [pc.cum] deep within [bess.hisHer] [bess.vagOrAss].");
		
		output("\n\n[bess.name] is lewdly filled up with cream in one end and milked dry on the other, sandwiched in a lewd cycle of breast cumming and being cummed in. Afterwards you pull free and your [pc.cum] drools down [bess.hisHer]");
		if (bess.hasVagina()) output(" thighs");
		else output(" asscrack");
		output(" in a glorious");
		if (!bess.hasVagina()) output(" anal");
		output(" cream pie.");

		// PC cums. Cum and lust go down.
		pc.orgasm();
		if (bess.hasVagina()) bess.loadInCunt(pc, 0);
		else bess.loadInAss(pc);
	}

	if (newRating != -1)
	{
		output("\n\nChecking the machine, you realize that <b> [bess.hisHer] breasts have");
		if (newRating > 0) output(" gone down a size and are now visibly smaller.");
		else output(" been completely milked dry. [bess.name] now has a flat chest.");
		output("</b>");
		
		((bess as Bess).breastRows[0] as BreastRowClass).breastRatingRaw = newRating;
	}
	else
	{
		output("\n\nSince [bess.name] seems to be a drooling mess right now, you turn off the device and leave [bess.himHer] synthetic milk there for [bess.himHer] to drink later. After all, as a machine [bess.heShe] can put it back in, right?");
	}

	processTime(45+rand(15));
	bess.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bessIntimateSexMenu():void
{
	clearMenu();

	if (pc.hasCock())
	{
		addButton(0, "Cowgirl", bessIntimateGiveDoggy, false, "Give Intimate Cowgirl", "Let [bess.name] ride you cowgirl style.");
	}
	else
	{
		addDisabledButton(0, "Cowgirl", "Give Intimate Cowgirl", "Requires a cock!");
	}

	if (bess.hasCock())
	{
		// If you've equipped Bess with the saurian / dino-dick, the pc's orifice capacity must be able to take a 20 inch long, 12 inch wide cock.
		if (bess.cocks[0].cType == GLOBAL.TYPE_SAURIAN)
		{
			if ((pc.hasVagina() && pc.cuntThatFits(bess.cockVolume(0)) >= 0) || pc.analCapacity() >= bess.cockVolume(0)) addButton(2, "Missionary", bessIntimateGetDoggy, false, "Get Intimate Missionary", "Take it from [bess.name], missionary style.");
			else addDisabledButton(1, "Missionary", "Get Intimate Missionary", "Take it from [bess.name], missionary style. [bess.HeShe] must have a cock that [bess.heShe] can squeeze into you!");
		}
		else
		{
			addButton(1, "Missionary", bessIntimateGetDoggy, false, "Get Intimate Missionary", "Take it from [bess.name], missionary style. [bess.HeShe] must have a cock.");
		}
	}
	else
	{
		addDisabledButton(1, "Missionary", "Get Intimate Missionary", "Take it from [bess.name], missionary style. [bess.HeShe] must have a cock.")
	}

	if (bess.hasVagina())
	{
		addButton(2, "GiveOral", bessIntimateGiveOral, false, "Give Oral", "Eat [bess.name] out.");
	}
	else
	{
		addDisabledButton(2, "GiveOral", "Give Oral", "Eat [bess.name] out. [bess.name] must have a pussy.")
	}

	addButton(3, "GetOral", bessIntimateGetOral, false);

	addButton(14, "Back", bessFollowerMenu);
}

public function bessIntimateGiveDoggy(fromEvent:Boolean = false):void
{
	clearOutput();
	bessHeader();

	output("You both strip off your gear, though [bess.name] is that bit quicker. Before you know it [bess.heShe] is wrapping [bess.hisHer] arms tightly around your neck and with an enthusiastic push, both of you fall down naked on the soft bed behind you.");
	
	output("\n\nAs [bess.hisHer] soft body falls on top of you, you can feel [bess.hisHer] [bess.chest] pressing against your front. [bess.HisHer] [bess.nipples] are already fully erect and brushing against your [pc.skinFurScalesNoun]. With a cute little pull, [bess.heShe] brings [bess.himHer]self up to tenderly kiss your neck.");
	
	output("\n\nIt’s not long at all before things heat up between you and [bess.himHer], and [bess.heShe]’s wrapping [bess.hisHer] thighs passionately around your lower half. [bess.HisHer] heated loins and [bess.belly] press against yours with a feverish insistence.");
	
	output("\n\n<i>“I don’t want to just have sex, I want you to make love to me.”</i> [bess.name] breathily whispers, [bess.hisHer] lower petals kissing the underside of your shaft");
	if (pc.cocks.length > 1) output("s");
	output(". <i>“First, though...”</i>");
	
	output("\n\n[bess.name]’s lips sensuously travel along your jawline and reach your own. As [bess.heShe] tilts [bess.hisHer] head [bess.heShe] kisses you softly, yet urgently. You can taste the sweetness of [bess.hisHer] mouth as [bess.hisHer] tongue mingles with yours, all the while [bess.hisHer] eyes are gently closed.");

	output("\n\nThe delicious smell of synthetic vanilla, [bess.hisHer] particular scent, fills your senses. You’re utterly wrapped up in [bess.himHer] in more ways than you can count. There is nothing other than [bess.name] as all else is swept away by the power of [bess.hisHer] sweetly pressing lips.");

	// {If this sex scene is being played as part of Scene 20 AND Bess has a vagina:
	if (fromEvent && bess.hasVagina())
	{
		output("\n\nYour lips pull apart as both of your breathing comes out in short desperate gasps. [bess.name] gazes at you with [bess.hisHer] beautiful [bess.eyeColor] eyes. <i>“Um... "+ bessPCName() +"... I wanted this to be like my romance books so... I used my meld-milk to make myself... um... a hymen.”</i>");
		
		output("\n\n<i>“I never had a first time, but if I did, I’d want you to have it. I know it’s not really... but... could you be my first?”</i> [bess.HeShe] asks you imploringly, looking at you all the while.");
		
		output("\n\nYou tell [bess.hisHer] it’s obviously going to hurt and [bess.heShe] nods knowingly. <i>“...I know, but that will make me remember it that much more. I want to remember this time with you, because it’s the first time we’ll be making love, not just having sex.”</i>");
		
		output("\n\nYou nod and [bess.heShe] clings to you as you position your glans so it is lined up with [bess.hisHer] now apparently virgin mound. You ask [bess.hisHer] if [bess.heShe]’s ready and [bess.heShe] nods, <i>“Please, be my first.”</i>");

		output("\n\nYou lower [bess.hisHer] down onto your [pc.cock], slowly sliding yourself inside of [bess.himHer]. You can see [bess.hisHer] wincing a little already as you break [bess.hisHer] hymen, stopping immediately. <i>“...Ow! It’s okay, don’t stop, I’m fine.”</i>");
		
		output("\n\n[bess.HeShe] keeps encouraging you to continue so you push deeper inside of [bess.hisHer] incredibly narrow passage. [bess.HeShe]’s really clinging to you with a velvety grip, even more so since you just broke [bess.hisHer] hymen. Eventually you’re all the way in and you ask [bess.hisHer] if [bess.heShe]’s okay.");
		
		output("\n\n<i>“I’m fine, that’s exactly what I wanted. You got to take my virginity.”</i> [bess.name] kisses you softly, pulling you against [bess.hisHer] as your [pc.cockNoun] twitches inside of [bess.himHer]. <i>“...I feel much fuller than usual, like I’m suddenly complete.”</i>");
		
		output("\n\nOnce [bess.heShe]’s ready you begin to slowly rock your hips - while there’s pain it doesn’t seem so bad for [bess.hisHer] as your initial penetration. Soon you can feel [bess.hisHer] insides becoming slick around your shaft as [bess.heShe] clings tightly to you, nuzzling [bess.hisHer] head into your neck. <i>“...Why does this feel... so much more intense? I already feel like I’m going to..!”</i>");
	}
	else
	{
		output("\n\nYour lips pull apart as both of your breathing comes out in short desperate gasps. [bess.name] gazes at you with [bess.hisHer] beautiful [bess.eyeColor] eyes. <i>“...Make love to me, " + bessPCName() + ". I want you inside of me.”</i>");
		
		output("\n\n[bess.HeShe] shifts [bess.himHer]self so your [pc.cockhead] is lined up with [bess.hisHer]");
		if (bess.hasVagina()) output(" wetness");
		else output(" entrance");
		output(", sliding you slowly inside of [bess.himHer]self as [bess.heShe] descends on your length. As you push deeper inside of [bess.hisHer] incredibly narrow passage, [bess.heShe] clings to you with a velvety grip.");
		
		output("\n\nOnce you are fully inside of [bess.himHer], [bess.name] kisses you softly, pulling you against [bess.hisHer] as your [pc.cockNoun] twitches inside of [bess.himHer]. <i>“...I love the feeling of you deep inside of me. It makes me feel so complete.”</i>");
		
		output("\n\nOnce [bess.heShe]’s ready you begin to slowly rock your hips - you can feel [bess.hisHer] insides becoming");
		if (bess.hasVagina()) output(" slick");
		else output(" narrow");
		output(" around your shaft as [bess.heShe] clings tightly to you, nuzzling [bess.hisHer] head into your neck. <i>“...Why does this feel... so much more intense? I already feel like I’m going to..!”</i>");
	}

	output("\n\n[bess.name] doesn’t even finish [bess.hisHer] sentence before [bess.heShe] creams [bess.himHer]self and convulses around your [pc.cock], trembling and clinging to you as [bess.heShe] lets out a whimpering moan. Eventually [bess.heShe] settles down and");
	if (bess.hasVagina()) output(" your length is completely slickened, surrounded by [bess.hisHer] tight inner warmth");
	else output(" gasps for air, trembling around your tool");
	output(".");
	
	output("\n\n<i>“...I can’t believe how quick that was.”</i> [bess.HeShe] flushes furiously into your shoulder, clearly embarrassed by [bess.hisHer] hyperarousal. You kiss again and soon [bess.heShe]’s grinding [bess.hisHer] hips for more. It’s not long before [bess.heShe]’s bouncing wildly on your lap and you’re grabbing [bess.hisHer] waist, moaning as [bess.heShe] passionately wrings your [pc.cock].");
	
	output("\n\nYou can’t hold out much longer as [bess.heShe] massages and strokes your cock with [bess.hisHer] inner muscles and [bess.hisHer] [bess.chest] rub");
	if (bess.biggestTitSize() == 0) output("s");
	output(" against you. Suddenly you are shooting your [pc.cum] inside of [bess.hisHer]");
	if (bess.hasVagina()) output(" slick");
	output(" narrow tunnel and arching your back. As you unload inside of [bess.hisHer] [bess.heShe] moans and cums again around your spasming shaft.");
	
	pc.cockChange();
	
	output("\n\nYour lap feels as if there’s a");
	if (bess.hasVagina()) output(" liquid");
	output(" furnace on it as you both kiss in your delirious post-orgasmic haze. You’re not sure how much time passes before you fall down exhausted in each other’s arms, your [pc.cum]");
	if (fromEvent && bess.hasVagina()) output(" and a little bit of blood");
	output(" leaking out from between [bess.hisHer]");
	if (bess.hasVagina()) output(" thighs");
	else output(" buttocks");
	output(".");

	if (bess.hasVagina()) bess.loadInCunt(pc, 0);
	else bess.loadInAss(pc);

	if (flags["BESS_FUCKED"] == undefined) flags["BESS_FUCKED"] = 0;
	flags["BESS_FUCKED"]++;

	if (flags["BESS_INTIMATE_FUCKED"] == undefined) flags["BESS_INTIMATE_FUCKED"] = 0;
	flags["BESS_INTIMATE_FUCKED"]++;

	bess.orgasm();
	pc.orgasm();

	if (fromEvent)
	{
		bessEvent20PostSex();
	}
	else
	{
		processTime(30 + rand(10) + 1);
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function bessIntimateGetDoggy(fromEvent:Boolean = false):void
{
	clearOutput();
	bessHeader();

	var vagIdx:int = -1;
	var cVolume:Number = -1;

	if (bess.cocks[0].cType == GLOBAL.TYPE_SAURIAN)
	{
		vagIdx = pc.cuntThatFits(bess.cockVolume(0));
		cVolume = bess.cockVolume(0);
	}
	else if (pc.hasVagina())
	{
		vagIdx = pc.biggestVaginaIndex();
		cVolume = pc.vaginalCapacity(vagIdx);
		if(cVolume > bess.cockVolume(0)) cVolume = bess.cockVolume(0);
	}
	else
	{
		cVolume = pc.analCapacity();
		if(cVolume > bess.cockVolume(0)) cVolume = bess.cockVolume(0);
	}

	output("Both of you strip off your gear, caught up in the crashing waves of your shared passion. It’s not long before [bess.name] is pressing [bess.hisHer] naked body against yours, softly lavishing your collarbone in soft, sensuous little kisses.");

	output("\n\nWhen [bess.heShe] looks up into your [pc.eyeColor] eyes with [bess.hisHers], not a word needs to be said. You both bring your lips closer and press them fiercely together. You’re hungry for [bess.hisHer] taste - more hungry than you’ve been for anything in your entire life.");

	output("\n\nEven as you kiss [bess.himHer], your mutual yearning cannot be quenched. You both wrap your arms around each other and pull fiercely tight, and where there should be pain there is only divine yearning. You simply can’t get enough of this "+ bess.mf("man", "woman") +".");

	output("\n\n[bess.HeShe] leads you to the bed and soon you’re both falling back into it, your body pressed against [bess.hisHers]. You hungrily suckle at [bess.hisHer] neck and [bess.heShe] lets out a sweet noise, dreamily raising [bess.hisHer] chin in response.");

	output("\n\nMeanwhile your fingers dance along [bess.hisHer] silvery skin, sliding up and");
	if (bess.hairLength > 0) output(" running through [bess.hisHer] soft, silky hair");
	else output(" stroking the back of [bess.hisHer] head");
	output(". Like a cat [bess.name] runs [bess.hisHer] head against fingers, clearly relishing in your gentle ministrations.");

	output("\n\n[bess.name]’s lips sensuously travel along your jawline and reach your own. As [bess.heShe] tilts [bess.hisHer] head [bess.heShe] kisses you softly, yet urgently. You can taste the sweetness of [bess.hisHer] mouth as [bess.hisHer] tongue mingles with yours, all the while [bess.hisHer] eyes are gently closed.");

	output("\n\nThe delicious smell of synthetic vanilla, [bess.hisHer] particular scent, fills your senses. You’re utterly wrapped up in [bess.himHer] in more ways than you can count. There is nothing other than [bess.name] as all else is swept away by the power of [bess.hisHer] sweetly pressing lips.");

	output("\n\nYour make-out session naturally grows from soft sensuality to frantic tongue dancing as your lungs near their limit. Finally out of oxygen, you stubbornly pull away from [bess.name] to take short, desperate gasps of the sweet, vanilla-scented air. [bess.name] gazes at you with [bess.hisHer] beautiful [bess.eyeColor] eyes.");
	if (pc.isBiped()) output(" Not a word needs to be said as [bess.heShe] spreads open your [pc.legs] wide until your nethers are completely exposed.");
	else output(" Not a word needs to be said as [bess.heShe] positions [bess.himHer]self to enter you.");

	output("\n\n[bess.HeShe] presses the head of [bess.hisHer] [bess.cock] against your");
	if (pc.hasVagina()) output(" lower lips");
	else output(" back door");
	output(", sliding inside of you inch by glorious inch. As [bess.heShe] pushes deep into your welcoming passage, your walls spread wide, giving [bess.himHer] full access to your");
	if (pc.hasVagina()) output(" [pc.pussy "+ vagIdx +"]");
	else output(" [pc.asshole]");
	output(".");

	bess.cockChange();
	if (pc.hasVagina()) pc.cuntChange(vagIdx, cVolume, true, true, false);
	else pc.buttChange(cVolume, true, true, false);
	
	output("\n\n[bess.HeShe] leans in deep, sensually sliding the whole of [bess.hisHer] body against yours and whispers into your ear, <i>“I love being so deep inside of you; it makes me feel, just for a little while, like we’ve become one.”</i>");
	
	output("\n\n[bess.HeShe] begins to rock [bess.hisHer] hips; you moan and cling tightly to [bess.hisHer] pulsing phallus. Every single inch of [bess.himHer] is hitting the exact right spot, It all feels so incredibly sensual and intense. Before you know it, you’re cumming already. You tremble and cling to [bess.himHer] as you let out a shuddering moan.");

	output("\n\nEven as you cum, your lover does not let up. [bess.name] now sets into a wet grind, probing every inch of your [pc.vagOrAss "+ vagIdx +"] with a practiced hip roll. You frantically reciprocate, grinding your rump into [bess.hisHer] hips with a heated fervor until you’re a moaning, shuddering mess. [bess.HisHer] breathing heavy and grinding near-predatory, [bess.name] grabs your [pc.hips] and huskily moans, holding [bess.himHer]self deep inside your hungry hole.");
	if (pc.isBiped() && pc.hasKnees()) output(" Your [pc.legs] instinctively lock in a crisscross position behind [bess.hisHer] and you feel your partner tense up.");
	
	output("\n\nFinally [bess.name] can’t hold out much longer as you wildly stroke [bess.hisHer] cock with your inner muscles. Without warning, you feel [bess.hisHer] thick sticky cum shooting inside your");
	if (pc.hasVagina()) output(" love tunnel");
	else output(" rectum");
	output(". [bess.HisHer] back arches while [bess.heShe] holds [bess.hisHer] hips firmly against your body. As you feel [bess.hisHer] delicious [bess.cum] pouring inside of you, you cum again and clench [bess.hisHer] spasming shaft.");

	if (bess.hasKnot())
	{
		output("\n\nMeanwhile the knot of [bess.hisHer] cock has swollen and stuck in your now cum filled hole. [bess.HeShe] continues to fire spurt after spurt of [bess.hisHer] hot sticky love juice inside of you for a good half hour,");
		if (pc.genitalSpot <= 1) output(" kissing you all the while,");
		output(" before [bess.hisHer] knot finally deflates. ");
		for(var i:int = 0; i < 3; i++)
		{
			if (pc.hasVagina()) pc.loadInCunt(bess, vagIdx);
			else pc.loadInAss(bess);
			bess.orgasm();
			processTime(5);
		}
	}
	else output("\n\n");

	output("You clench your");
	if (pc.hasVagina()) output(" [pc.pussy "+ vagIdx +"]");
	else output(" [pc.asshole]");
	output(" around the messy aftermath of your lovemaking, pressing your lips against [bess.hisHers] in thanks. You enjoy your post-orgasmic haze with sensual kissing until falling to exhaustion in each other’s arms.");

	if (pc.hasVagina()) pc.loadInCunt(bess, vagIdx);
	else pc.loadInAss(bess);

	if (flags["BESS_FUCKED"] == undefined) flags["BESS_FUCKED"] = 0;
	flags["BESS_FUCKED"]++;

	if (flags["BESS_INTIMATE_FUCKED"] == undefined) flags["BESS_INTIMATE_FUCKED"] = 0;
	flags["BESS_INTIMATE_FUCKED"]++;

	bess.orgasm();
	pc.orgasm();
	pc.orgasm();

	if (fromEvent)
	{
		bessEvent20PostSex();
	}
	else
	{
		processTime(30 + rand(10) + 1);
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function bessIntimateGiveOral(fromEvent:Boolean = false):void
{
	clearOutput();
	bessHeader();

	output("<i>“...Please, lick me out. I’m so hot I feel like I’m going to burn up...”</i> [bess.HeShe] pleads, [bess.hisHer] silky smooth body brushing up against your own with primal need. You nod and soon [bess.heShe]’s placing [bess.hisHer] knees beside your head, [bess.hisHer] dripping wet mound hovering above your hungry mouth.");
	
	output("\n\nYou can feel [bess.hisHer] [bess.thighs] brushing against your cheeks and [bess.hisHer] [bess.ass] pressing against your chin. [bess.HisHer] puffy labia lips hover just above your mouth and you can see [bess.hisHer] prickled flesh. The smell of [bess.hisHer] arousal fills your senses like an intoxicant - it makes you hungry to lap up [bess.hisHer] scrumptious nectar.");
	
	output("\n\nAs [bess.heShe] lowers [bess.hisHer] weight onto your [pc.face], [bess.hisHer] silky muff presses against your mouth. As you part your lips and lap at [bess.hisHer] slick folds you can taste [bess.hisHer] [bess.girlCumFlavor] juices. You part [bess.hisHer] flaps with your tongue and let it dart around in [bess.hisHer] velvety insides, hungry to taste even more of [bess.himHer]. [bess.name] lets out a breathy moan as your roam around inside of [bess.himHer] sex.");
	
	output("\n\nSoon [bess.heShe]’s grinding against your mouth as your ravenously eat [bess.hisHer] out, quite literally humping your face. You reach up and wrap your arms around [bess.hisHer] upper thighs, keeping [bess.hisHer] steady as you tongue-fuck [bess.hisHer] soppy slash. [bess.HeShe] cries out with pleasure as you tease [bess.hisHer] swollen clit, suckling on it as [bess.heShe] spasms and creams [bess.hisHer] girl cum all over your face.");
	
	output("\n\nAs [bess.heShe] gushes and squirts right into your open mouth you eagerly lap up [bess.hisHer] [bess.girlCumFlavor] nectar, taking everything [bess.heShe] has to give. [bess.HisHer] hands run");
	if (pc.hairLength == 0) output(" across your bald scalp");
	else output(" through your [pc.hair]");
	output(" as [bess.hisHer] thighs quake against the sides of your face. Even though [bess.heShe] already came, every time you lap at [bess.hisHer] [bess.pussy] [bess.heShe] cries out with delirious pleasure, [bess.hisHer] nethers seem to be incredibly sensitive right after [bess.heShe] cums. So sensitive that with a little bit of teasing [bess.heShe] creams [bess.himHer]self all over again, giving you another helping of [bess.hisHer] tasty girl cum.");
	
	output("\n\nEventually [bess.heShe] simply cannot cum any more and [bess.heShe] falls down beside you, [bess.hisHer] legs completely useless as [bess.heShe] looks at you in a post-orgasmic haze. You feverishly kiss as [bess.heShe] happily laps up the taste of [bess.himHer]self off your tongue. You eventually fall asleep in each other’s arms.");

	pc.girlCumInMouth(chars["BESS"]);
	bess.orgasm();
	pc.girlCumInMouth(chars["BESS"]);
	bess.orgasm();
	pc.girlCumInMouth(chars["BESS"]);
	bess.orgasm();
	pc.lust(30);

	if (flags["BESS_FUCKED"] == undefined) flags["BESS_FUCKED"] = 0;
	flags["BESS_FUCKED"]++;

	if (flags["BESS_INTIMATE_FUCKED"] == undefined) flags["BESS_INTIMATE_FUCKED"] = 0;
	flags["BESS_INTIMATE_FUCKED"]++;

	if (fromEvent)
	{
		bessEvent20PostSex();
	}
	else
	{
		processTime(30 + rand(10) + 1);
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function bessIntimateGetOral(fromEvent:Boolean = false):void
{
	clearOutput();
	bessHeader();

	// If PC has a vagina, it's cunni. If they don't, it's analingus.

	output("<i>“...Sit on my face, I want to eat you out from below...”</i>”</i> [bess.name] pleads, [bess.hisHer] silky smooth body brushing up against your own with primal need. You nod and position yourself above [bess.hisHer] face, your [pc.vagOrAss] hovering above [bess.hisHer] hungry mouth.");
	
	output("\n\nYou lower your [pc.hips] as your [pc.skin] brushes against [bess.hisHer] cheeks and your loins hover just above [bess.hisHer] mouth as you can feel [bess.hisHer] hot breath on your");
	if (pc.hasVagina()) output(" prickled flesh");
	else output(" sensitive buttocks");
	output(". You can hear [bess.hisHer] moaning below you already - apparently the smell of you is driving [bess.hisHer] positively batty. <i>“I’m so hungry for your");
	if (pc.hasVagina()) output(" [pc.girlCum]");
	else output(" ass");
	output(", I can’t wait much longer!”</i>");
	
	output("\n\nYou lower your weight onto [bess.hisHer] face, pressing your");
	if (pc.hasVagina()) output(" silky muff");
	else output(" rump");
	output(" right against [bess.hisHer] mouth. You can feel your");
	if (pc.hasVagina()) output(" folds");
	else output(" buttocks");
	output(" spreading as [bess.heShe] laps at your");
	if (pc.hasVagina()) output(" nethers");
	else output(" [pc.asshole]");
	output(", [bess.hisHer] tongue pushing inside of you as you let out a breathy moan. You can feel it roaming around inside of you as [bess.name] hungrily delves your depths, eager to taste your");
	if (pc.hasVagina()) output(" nectar");
	else output(" forbidden place");
	output(".");
	
	output("\n\nIt’s not long before you’re grinding against [bess.hisHer] mouth as [bess.heShe] ravenously eats you out, quite literally humping [bess.hisHer] face. [bess.HeShe] reaches up from below and wraps [bess.hisHer] arms around your [pc.legs], keeping you steady as [bess.heShe] tongue-fucks your");
	if (pc.hasVagina()) output(" sloppy gash");
	else output(" back door");
	output(". You cry out with pleasure as [bess.heShe] teases your");
	if (pc.hasVagina() && pc.hasClit()) output(" swollen clit");
	else output(" tunnel");
	output(" causing you to");
	if (pc.hasVagina()) output(" spasm and cream your [pc.girlCum] all over [bess.hisHer] face.");
	else output(" spasm as electricity courses up your spine. Your legs shake spastically as you reach your peak, cumming with [bess.hisHer] tongue in your ass.");
	
	output("\n\n");
	if (pc.hasVagina()) output("As your girl juice gushes into [bess.hisHer] open mouth [bess.heShe] hungrily laps it up. ");
	output("Your hands run");
	if (bess.hairLength == 0) output(" across [bess.hisHer] bald scalp");
	else output(" through [bess.hisHer] hair");
	output(" as you quake and quiver against [bess.hisHer] face. Even though you already came every time [bess.heShe] licks at your [pc.vagOrAss] you cry out with delirious pleasure, your nethers seem to be incredibly sensitive right now after cumming. You’re so sensitive that with a little bit of teasing you cream yourself all over again");
	if (pc.hasVagina()) output(", giving [bess.himHer] another helping of your [pc.girlCum]");
	output(".");
	
	output("\n\nEventually you simply cannot cum any more and you fall down beside [bess.himHer], yours legs completely useless as you look at [bess.name] in a post-orgasmic haze. You both feverishly kiss each other and you can taste yourself on [bess.hisHer] tongue. You eventually fall asleep in each other’s arms.");

	pc.orgasm();
	pc.orgasm();
	pc.orgasm();

	if (flags["BESS_FUCKED"] == undefined) flags["BESS_FUCKED"] = 0;
	flags["BESS_FUCKED"]++;

	if (flags["BESS_INTIMATE_FUCKED"] == undefined) flags["BESS_INTIMATE_FUCKED"] = 0;
	flags["BESS_INTIMATE_FUCKED"]++;

	if (fromEvent)
	{
		bessEvent20PostSex();
	}
	else
	{
		processTime(30 + rand(10) + 1);
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function bessEventMap(bChance:Boolean = false):void
{
	clearOutput();
	
	output("<i>This is the current map of your interactions with [bess.name].</i>");
	
	output("\n\n" + blockHeader("[bess.name] Event Map", false));
	output("\n<b><u>Progress</u></b>");
	output("\n<b>* Status:</b>");
	if (flags["BESS_JUST_A_SEXBOT"] == 1) output(" [bess.name] is just a sex box, Completed");
	else if (flags["BESS_JUST_A_FRIEND"] == 1) output(" [bess.name] is just a friend, Completed");
	else
	{
		if (flags["BESS_LOVER"] != undefined) output(" [bess.name] is a lover");
		else if (flags["BESS_FRIEND"] != undefined) output(" [bess.name] is a friend");
		else output(" <i>In progress...</i>");
		if (flags["BESS_EVENT_28"] != undefined) output(", Completed");
	}
	output("\n<b>* Affection: </b>" + bessAffection() + "%");
	
	var nTimer:Number = 0;
	var iChance:int = 4;
	iChance = 2;
	
	output("\n<b><u>Main Events</u></b>");
	if (flags["BESS_EVENT_0"] == undefined)
	{
		output("\n<b>* Next Event:</b> <i>Pending</i>");
		if (bChance) output(" at 1/" + iChance + " chance");
	}
	else
	{
		output("\n<b>* Event 0:</b> Completed");
		if (bChance && flags["BESS_EVENT_1"] == undefined)
		{
			nTimer = flags["BESS_EVENT_0"] + (12 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			output(" at 1/" + iChance + " chance");
		}
	}
	if (flags["BESS_EVENT_1"] != undefined)
	{
		output("\n<b>* Event 1:</b> Completed");
		if (bChance && flags["BESS_EVENT_2"] == undefined)
		{
			nTimer = flags["BESS_EVENT_1"] + (1.5 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			output(" at 1/" + iChance + " chance");
		}
	}
	if (flags["BESS_EVENT_2"] != undefined)
	{
		output("\n<b>* Event 2:</b> Completed");
		if (bChance && flags["BESS_EVENT_3"] == undefined)
		{
			nTimer = flags["BESS_EVENT_2"] + (24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
		}
	}
	if (flags["BESS_EVENT_3"] != undefined)
	{
		output("\n<b>* Event 3:</b> Completed");
		if (bChance && flags["BESS_EVENT_4"] == undefined)
		{
			nTimer = flags["BESS_EVENT_3"] + (1.5 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			output(" at 1/" + iChance + " chance");
		}
	}
	if (flags["BESS_EVENT_4"] != undefined)
	{
		output("\n<b>* Event 4:</b> Completed");
		if (bChance && flags["BESS_EVENT_5"] == undefined)
		{
			nTimer = flags["BESS_EVENT_4"] + (2 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			if (bessAffection() < 20) output(" at 20% affection");
		}
	}
	if (flags["BESS_EVENT_5"] != undefined)
	{
		output("\n<b>* Event 5:</b> Completed");
		if (bChance && flags["BESS_EVENT_6"] == undefined)
		{
			nTimer = flags["BESS_EVENT_5"] + (2 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			output(" at 1/" + iChance + " chance");
			if (bessAffection() < 30) output(" and 30% affection");
		}
	}
	if (flags["BESS_EVENT_6"] != undefined)
	{
		output("\n<b>* Event 6:</b> Completed");
		if (bChance && flags["BESS_EVENT_7"] == undefined)
		{
			nTimer = flags["BESS_EVENT_6"] + (2 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			if (bessAffection() < 40) output(" at 40% affection");
		}
	}
	if (flags["BESS_EVENT_7"] != undefined)
	{
		output("\n<b>* Event 7:</b> Completed");
		if (bChance && flags["BESS_EVENT_8"] == undefined)
		{
			nTimer = flags["BESS_EVENT_7"] + (2 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			if (bessAffection() < 50) output(" at 50% affection");
			if (flags["BESS_EVENT_7_APOLOGY_NEEDED"] != undefined) output(", apology needed");
		}
	}
	if (flags["BESS_EVENT_8"] != undefined)
	{
		output("\n<b>* Event 8:</b> Completed");
		if (bChance && flags["BESS_EVENT_9"] == undefined)
		{
			nTimer = flags["BESS_EVENT_8"] + (2 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			if (bessAffection() < 50) output(" at 50% affection");
		}
	}
	if (flags["BESS_EVENT_9"] != undefined)
	{
		output("\n<b>* Event 9:</b> Completed");
		if (bChance && flags["BESS_EVENT_10"] == undefined)
		{
			nTimer = flags["BESS_EVENT_9"] + (1.5 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			output(" at 1/" + iChance + " chance");
			if (bessAffection() < 50) output(" and 50% affection");
		}
	}
	if (flags["BESS_EVENT_10"] != undefined)
	{
		output("\n<b>* Event 10:</b> Completed");
		if (bChance && flags["BESS_EVENT_11"] == undefined)
		{
			nTimer = flags["BESS_EVENT_10"] + (1.5 * 24 * 60);
			var e11Chance:int = iChance;
			if (flags["BESS_EVENT_11_TIMES"] != undefined) e11Chance = iChance * 5;
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			output(" at 1/" + e11Chance + " chance");
			if (flags["VISITED_MYRELLION"] == undefined)
			{
				if (flags["PLANET_3_UNLOCKED"] == undefined) output(", <i>???</i>");
				else output(", visit Myrellion");
			}
			if (bessAffection() < 50) output(" and 50% affection");
		}
	}
	if (flags["BESS_EVENT_11"] != undefined)
	{
		output("\n<b>* Event 11:</b> Completed");
		if (bChance && flags["BESS_EVENT_12"] == undefined)
		{
			nTimer = flags["BESS_EVENT_11"] + (1.5 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			output(" at 1/" + Math.floor(iChance * 2.5) + " chance");
			if (bessAffection() < 60) output(" and 60% affection");
		}
	}
	if (flags["BESS_EVENT_12"] != undefined)
	{
		output("\n<b>* Event 12:</b> Completed");
		if (bChance && flags["BESS_EVENT_13"] == undefined)
		{
			nTimer = flags["BESS_EVENT_12"] + (1.5 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			output(" at 1/" + Math.floor(iChance * 2.5) + " chance");
			if (bessAffection() < 60) output(" and 60% affection");
		}
	}
	if (flags["BESS_EVENT_13"] != undefined)
	{
		output("\n<b>* Event 13:</b> Completed");
		if (bChance && flags["BESS_EVENT_14"] == undefined)
		{
			nTimer = flags["BESS_EVENT_13"] + (1.5 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			output(" at 1/" + iChance + " chance");
			if (bessAffection() < 60) output(" and 60% affection");
		}
	}
	if (flags["BESS_EVENT_14"] != undefined)
	{
		output("\n<b>* Event 14:</b> Completed");
		if (bChance && flags["BESS_EVENT_15"] == undefined)
		{
			nTimer = flags["BESS_EVENT_14"] + (1.5 * 24 * 60);
			output("\n<b>* Next Event:</b> <i>Pending</i>");
			if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
			output(" at 1/" + iChance + " chance");
			if (bessAffection() < 60) output(" and 60% affection");
		}
	}
	if (flags["BESS_FRIEND"] != undefined)
	{
		output("\n<b><u>Friend Events</u></b>");
		if (flags["BESS_EVENT_15"] != undefined)
		{
			output("\n<b>* Event 15:</b> Completed");
			if (bChance && flags["BESS_EVENT_16"] == undefined)
			{
				nTimer = flags["BESS_EVENT_15"] + (1.5 * 24 * 60);
				output("\n<b>* Next Event:</b> <i>Pending</i>");
				if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
				output(" at 1/" + iChance + " chance");
				if (bessAffection() < 70) output(" and 70% affection");
			}
		}
		if (flags["BESS_EVENT_16"] != undefined)
		{
			output("\n<b>* Event 16:</b> Completed");
			if (bChance && flags["BESS_EVENT_17"] == undefined)
			{
				nTimer = flags["BESS_EVENT_16"] + (1.5 * 24 * 60);
				output("\n<b>* Next Event:</b> <i>Pending</i>");
				if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
				output(" at 1/" + iChance + " chance");
				if (bessAffection() < 70) output(" and 70% affection");
			}
		}
		if (flags["BESS_EVENT_17"] != undefined)
		{
			output("\n<b>* Event 17:</b> Completed");
			if (bChance && flags["BESS_EVENT_18"] == undefined)
			{
				nTimer = flags["BESS_EVENT_17"] + (1.5 * 24 * 60);
				output("\n<b>* Next Event:</b> <i>Pending</i>");
				if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
				output(" at 1/" + iChance + " chance");
				if (bessAffection() < 70) output(" and 70% affection");
			}
		}
		if (flags["BESS_EVENT_18"] != undefined)
		{
			output("\n<b>* Event 18:</b> Completed");
			if (bChance && flags["BESS_EVENT_19"] == undefined)
			{
				nTimer = flags["BESS_EVENT_18"] + (2 * 24 * 60);
				var e19Chance:int = 1;
				if (flags["BESS_EVENT_19_TIMES"] != undefined) e19Chance = Math.floor(iChance * 2.5);
				output("\n<b>* Next Event:</b> <i>Pending</i>");
				if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
				output(" at 1/" + e19Chance + " chance");
				if (hours < 16) output(", at 16:00 or later");
				if (bessAffection() < 70) output(" and 70% affection");
			}
		}
		if (flags["BESS_EVENT_19"] != undefined)
		{
			output("\n<b>* Event 19:</b> Completed");
			if (flags["BESS_EVENT_19_REJECTION"] == 1) output(", [bess.name] has been rejected");
		}
	}
	if (flags["BESS_LOVER"] != undefined)
	{
		output("\n<b><u>Lover Events</u></b>");
		if (flags["BESS_EVENT_20"] != undefined)
		{
			output("\n<b>* Event 20:</b> Completed");
		}
		if (flags["BESS_EVENT_21"] != undefined)
		{
			output("\n<b>* Event 21:</b> Completed");
			if (bChance && flags["BESS_EVENT_22"] == undefined)
			{
				nTimer = flags["BESS_EVENT_21"] + (2 * 24 * 60);
				output("\n<b>* Next Event:</b> <i>Pending</i>");
				if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
				if (bessAffection() < 70) output(" and 70% affection");
			}
		}
		if (flags["BESS_EVENT_22"] != undefined)
		{
			output("\n<b>* Event 22:</b> Completed");
			if (bChance && flags["BESS_EVENT_23"] == undefined)
			{
				nTimer = flags["BESS_EVENT_22"] + (2 * 24 * 60);
				output("\n<b>* Next Event:</b> <i>Pending</i>");
				if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
				output(" at 1/" + iChance + " chance");
				if (flags["CREWMEMBER_SLEEP_WITH"] != "BESS") output(", [bess.name] as sleeping partner");
				if (bessAffection() < 80) output(" and 80% affection");
			}
		}
		if (flags["BESS_EVENT_23"] != undefined)
		{
			output("\n<b>* Event 23:</b> Completed");
			if (bChance && flags["BESS_EVENT_24"] == undefined)
			{
				nTimer = flags["BESS_EVENT_23"] + (2 * 24 * 60);
				output("\n<b>* Next Event:</b> <i>Pending</i>");
				if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
				output(" at 1/" + iChance + " chance");
				if (flags["CREWMEMBER_SLEEP_WITH"] != "BESS") output(", [bess.name] as sleeping partner");
				if (bessAffection() < 80) output(" and 80% affection");
			}
		}
		if (flags["BESS_EVENT_24"] != undefined)
		{
			output("\n<b>* Event 24:</b> Completed");
			if (bChance && flags["BESS_EVENT_25"] == undefined)
			{
				output("\n<b>* Next Event:</b> <i>Pending</i>");
				if (flags["BESS_DATES"] < 5) output(", after " + (5 - flags["BESS_DATES"]) + " dates");
			}
		}
		if (flags["BESS_EVENT_25"] != undefined)
		{
			output("\n<b>* Event 25:</b> Completed");
			if (bChance && flags["BESS_EVENT_26"] == undefined)
			{
				nTimer = flags["BESS_EVENT_25"] + (3.5 * 24 * 60);
				output("\n<b>* Next Event:</b> <i>Pending</i>");
				if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
				output(" at 1/" + iChance + " chance");
				if (bessAffection() < 80) output(" and 80% affection");
				if (flags["BESS_EVENT_25_SPINOFF"] == 1) output(", [bess.name] is upset");
			}
		}
		if (flags["BESS_EVENT_26"] != undefined)
		{
			output("\n<b>* Event 26:</b> Completed");
			if (bChance && flags["BESS_EVENT_27"] == undefined)
			{
				nTimer = flags["BESS_EVENT_26"] + (3.5 * 24 * 60);
				output("\n<b>* Next Event:</b> <i>Pending</i>");
				if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
				output(" at 1/" + iChance + " chance");
				if (flags["CREWMEMBER_SLEEP_WITH"] != "BESS") output(", [bess.name] as sleeping partner");
				if (flags["BESS_MORNING_EVENT_1"] == undefined) output(", [bess.name] asks about dreams");
				if (bessAffection() < 80) output(" and 80% affection");
			}
		}
		if (flags["BESS_EVENT_27"] != undefined)
		{
			output("\n<b>* Event 27:</b> Completed");
			if (bChance && flags["BESS_EVENT_28"] == undefined)
			{
				nTimer = flags["BESS_EVENT_27"] + (3.5 * 24 * 60);
				output(", next event");
				if (nTimer >= GetGameTimestamp()) output(", after " + prettifyMinutes(nTimer - GetGameTimestamp()));
				output(" at 1/" + iChance + " chance");
				if (shipLocation != "SHIP HANGAR" && shipLocation != "500")
				{
					if(flags["RIVALCONFIGURED"] == undefined && flags["NEW_TEXAS_COORDINATES_GAINED"] == undefined)
					{
						output(", <i>???</i>");
					}
					else
					{
						output(", ship is on");
						if (flags["RIVALCONFIGURED"] != undefined) output(" Mhen’ga");
						if (flags["RIVALCONFIGURED"] != undefined && flags["NEW_TEXAS_COORDINATES_GAINED"] != undefined) output(" or");
						if (flags["NEW_TEXAS_COORDINATES_GAINED"] != undefined) output(" New Texas");
					}
				}
				if (flags["BESS_DATES"] < 6) output(" after " + (6 - flags["BESS_DATES"]) + " dates");
				if (bessAffection() < 80) output(" and 80% affection");
			}
		}
		if (flags["BESS_EVENT_28"] != undefined)
		{
			output("\n<b>* Event 28:</b> Completed");
			if (flags["BESS_EVENT_25_SPINOFF"] == 1) output(", [bess.name] is upset");
		}
	}
	output("\n\n");
	
	clearMenu();
	if (!bChance) addButton(0, "Hint: Off", bessEventMap, true, "Hints", "Toggle hints on.");
	else addButton(0, "Hint: On", bessEventMap, false, "Hints", "Toggle hints off.");
	addButton(14, "Back", bessFollowerMenu);
}
