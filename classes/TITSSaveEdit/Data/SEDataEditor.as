package classes.TITSSaveEdit.Data 
{
	import classes.BreastRowClass;
	import classes.CockClass;
	import classes.GLOBAL;
	import classes.TITSSaveEdit.Data.CoCTypeDefs;
	import classes.VaginaClass;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEDataEditor 
	{
		public static function mergeData(tits:TiTsCharacterData, coc:CoCCharacterData):void
		{
			// Basic properties first
			if (coc.short.length > 0) tits.short = coc.short;
			if (coc.femininity >= 0 && coc.femininity <= 100) tits.femininity = coc.femininity;
			
			tits.tallness = coc.tallness;
			tits.tone = coc.tone;
			tits.thickness = coc.thickness;
			
			tits.minutesSinceCum = coc.hoursSinceCum * 60;
			
			tits.buttRatingRaw = coc.buttRating;
			tits.hipRatingRaw = coc.hipRating;
			
			// Skin
			convertSkinData(tits, coc);
			
			// Tongue
			convertTongueData(tits, coc);
			
			// Tail
			convertTailData(tits, coc);
			
			// Wings
			convertWingData(tits, coc);
			
			// Titties
			convertBreastData(tits, coc);
			
			// Arms
			convertArmData(tits, coc);
			
			// Head data
			convertHeadData(tits, coc);
			
			// Cocks
			convertCockData(tits, coc);
			
			// Cunts
			convertCuntData(tits, coc);
			
			// Butt
			convertAssData(tits, coc);
		}
		
		// Conversion functions
		// Each function is paired with backing data lookups that are based off of:
		// CoC\includes\AppearanceDefs.as
		// TiTs\Classes\Global.as
		
		private static function convertBreastData(tits:TiTsCharacterData, coc:CoCCharacterData):void
		{
			// If there are no incoming arrays, force-clear the breast data and setup the default initial row
			// CoC probably works in a similar manner (min 1 row, goes to rating 0 etc) as TiTs but I'm being careful.
			if (coc.breastRows.length == 0)
			{
				tits.breastRows = new Array();
				tits.breastRows.push(new BreastRowClass());
				return;
			}
			
			tits.breastRows = new Array();
			
			// Setup to read max rows for TiTs data structure
			var numRows:int = (coc.breastRows.length <= 10) ? coc.breastRows.length : 10;
			var biggestBRating:Number = 0;
			var totalNips:int = 0;
			var totalBoobs:int = 0;
			
			
			// Tit fluid conversion values
			
			// milking endurance
			var lactEndurance:Number = 1.0;
			var saLactEnd:Object = coc.getStatusAffect("Lactation Endurance");
			if (saLactEnd != null) lactEndurance = saLactEnd.value1;
			
			// avg. lactation
			var avgLactation:Number = 0.0;
			
			// effects
			var hasFeeder:Boolean = (coc.getStatusAffect("Feeder") == null) ? false : true;
			var hasQuadNips:Boolean = false;
			
			for (var i:int = 0; i < numRows; i++)
			{
				var titsRow:BreastRowClass = new BreastRowClass();
				tits.breastRows.push(titsRow);
				
				var cocRow:CoCBreastRowClass = coc.breastRows[i] as CoCBreastRowClass;
				
				titsRow.breastRatingRaw = cocRow.breastRating;
				
				if (titsRow.breastRatingRaw > biggestBRating) biggestBRating = titsRow.breastRatingRaw;
				
				titsRow.breasts = 2; // CoC never sets anything other than 2.
				totalBoobs += 2;
				
				totalNips += cocRow.nipplesPerBreast;
				if (cocRow.nipplesPerBreast >= 4) hasQuadNips = true;
				
				//titsRow.breastRatingLactationMod = cocRow.lactationMultiplier;
				avgLactation += cocRow.lactationMultiplier;
				titsRow.fullness = cocRow.milkFullness;
				
				if (cocRow.fuckable == true)
				{
					titsRow.nippleType = GLOBAL.NIPPLE_TYPE_FUCKABLE;
				}
				else
				{
					titsRow.nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
				}
			}
			
			tits.nipplesPerBreast = Math.floor(totalNips / totalBoobs);
			if (tits.nipplesPerBreast < 1) tits.nipplesPerBreast = 1; // I don't think no-nips is possible in CoC like it (presumably - see Jade) is with TiTs.
			
			
			// Try and gen default values for stuff
			
			// This makes an attempt to convert the nippleLength from CoC data to the ratios used in TiTs based on the
			// largest breast size found.
			tits.nippleLengthRatio = 1 + (4 * (coc.nippleLength / biggestBRating));
			tits.nippleWidthRatio = 1 + (2 * (coc.nippleLength / biggestBRating));
			
			tits.dickNippleType = 0;
			tits.dickNippleMultiplier = 2;
			tits.nippleColor = "pink";
			tits.nipplesPerBreast = 1;
			
			// Do our mathmangling into TiTs values
			
			// Nomilky
			if (avgLactation < 1)
			{
				tits.milkRate = 10;
				tits.milkMultiplier = 0;
				tits.milkFullness = 0;
				tits.milkStorageMultiplier = 1;
			}
			// milky
			else
			{
				tits.milkRate = 10 * (lactEndurance + (avgLactation / 10));
				tits.milkMultiplier = 50 + (Math.max(0, Math.min(5, avgLactation)) * 10);
				tits.milkStorageMultiplier = lactEndurance;
				
				if (tits.milkRate < 10) tits.milkRate = 10;
				if (tits.milkMultiplier < 0) tits.milkMultiplier = 0;
				if (tits.milkStorageMultiplier < 0) tits.milkStorageMultiplier = 0;
				
				if (hasFeeder) tits.milkStorageMultiplier += 0.5;
				if (hasQuadNips) tits.milkStorageMultiplier += 0.5;
				if (coc.faceType == CoCTypeDefs.FACE_COW_MINOTAUR) tits.milkStorageMultiplier += 0.25;
				if (coc.earType == CoCTypeDefs.EARS_COW) tits.milkStorageMultiplier += 0.25;
				if (coc.tailType == CoCTypeDefs.TAIL_TYPE_COW) tits.milkStorageMultiplier += 0.25;
				if (coc.hornType == CoCTypeDefs.HORNS_COW_MINOTAUR) tits.milkStorageMultiplier += 0.25;
				
				tits.milkFullness = 11; // I think that's enough to ensure all of the lactation system works as appropriate?
			}
		}
		
		private static function convertCuntData(tits:TiTsCharacterData, coc:CoCCharacterData):void
		{
			// General stuffs
			tits.clitLength = coc.clitLength;
			
			// CoC will only ever present a singular cunt but it IS stored in an Array... URGH.
			tits.vaginas = new Array();
			
			if (coc.vaginas.length == 0) return;
			
			var titsCunt:VaginaClass = new VaginaClass();
			tits.vaginas.push(titsCunt);
			
			var cocCunt:CoCVaginaClass = coc.vaginas[0];
			
			titsCunt.wetnessRaw = cocCunt.vaginalWetness;
			titsCunt.loosenessRaw = cocCunt.vaginalLooseness;
			titsCunt.hymen = cocCunt.virgin;
			
			if (cocCunt.type == 5) // I think this is sandtrap vagoo
				titsCunt.vaginaColor = "obsidian";
		}
		
		private static function convertAssData(tits:TiTsCharacterData, coc:CoCCharacterData):void
		{
			tits.ass = new VaginaClass(false);
			
			tits.ass.wetnessRaw = coc.ass.analWetness;
			tits.ass.loosenessRaw = coc.ass.analLooseness;
		}
		
		private static var CONVERT_COCK_TYPES:Array;
		
		{
			CONVERT_COCK_TYPES = [];
			
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_HUMAN] = GLOBAL.TYPE_HUMAN;
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_EQUINE] = GLOBAL.TYPE_EQUINE;
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_DOG] = GLOBAL.TYPE_CANINE;
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_DEMON] = GLOBAL.TYPE_DEMONIC;
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_TENTACLE] = GLOBAL.TYPE_TENTACLE;
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_CAT] = GLOBAL.TYPE_FELINE;
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_LIZARD] = GLOBAL.TYPE_DRACONIC; // Closest match
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_ANEMONE] = GLOBAL.TYPE_ANEMONE;
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_KANGAROO] = GLOBAL.TYPE_KANGAROO;
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_DRAGON] = GLOBAL.TYPE_DRACONIC;
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_DISPLACER] = GLOBAL.TYPE_HUMAN; // Total fallback
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_FOX] = GLOBAL.TYPE_CANINE; // Closest match
			CONVERT_COCK_TYPES[CoCTypeDefs.COCK_TYPE_UNDEFINED] = GLOBAL.TYPE_HUMAN; // kek "Enum"
		}
		
		private static function convertCockData(tits:TiTsCharacterData, coc:CoCCharacterData):void
		{
			// Ballstuff
			tits.balls = coc.balls;
			tits.ballSizeRaw = coc.ballSize;
						
			tits.cocks = new Array();
			
			// Early exit if no cocks.
			if (coc.cocks.length == 0) return;
			
			// Configure for max tits supported cocks
			var numCocks:int = (coc.cocks.length <= 10) ? coc.cocks.length : 10;
			
			for (var i:int = 0; i < numCocks; i++)
			{
				var titsCock:CockClass = new CockClass();
				tits.cocks.push(titsCock);
				
				var cocCock:CoCCockClass = coc.cocks[i];
				
				if (CONVERT_COCK_TYPES[cocCock.cockType] != undefined)
				{
					titsCock.cType = CONVERT_COCK_TYPES[cocCock.cockType];
				}
				
				titsCock.cLengthRaw = cocCock.cockLength;
				
				titsCock.cThicknessRatioRaw = 6 * (cocCock.cockThickness / cocCock.cockLength);
				titsCock.knotMultiplier = cocCock.knotMultiplier;
				
				//titsCock.cockColor = ???
				// color is never explicitly mentioned in CoC afaik (outside of a few type assertions f.ex red puppy pecker or whatever maybe).
			}
			
			// Cumstuff
			if (tits.cocks.length > 0)
			{
				// Perk lookups
				var hasBroBody:Boolean = (coc.getStatusAffect("Bro Body") == null) ? false : true;
				var hasFertPlus:Boolean = (coc.getStatusAffect("Fertility+") == null) ? false : true;
				var hasMessy:Boolean = (coc.getStatusAffect("Messy Orgasms") == null) ? false : true;
				var hasOneTrack:Boolean = (coc.getStatusAffect("One Track Mind") == null) ? false : true;
				
				var hasProfractory:Boolean = (coc.getStatusAffect("Marae's Gift - Profractory") == null) ? false : true;
				var hasStud:Boolean = (coc.getStatusAffect("Marae's Gift - Stud") == null) ? false : true;
				var hasFerasAlpha:Boolean = (coc.getStatusAffect("Fera's Boon - Alpha") == null) ? false : true;
				var hasFerasSeeder:Boolean = (coc.getStatusAffect("Fera's Boon - Seeder") == null) ? false : true;
				var hasMagicVirility:Boolean = (coc.getStatusAffect("Magical Virility") == null) ? false : true;
				
				var cumMod:Number = 0.0;
				if (hasBroBody) cumMod += 0.3;
				if (hasFertPlus) cumMod += 0.5;
				if (hasMessy) cumMod += 0.5;
				if (hasOneTrack) cumMod += 0.2;
				
				var effMod:Number = 0.0;
				if (hasProfractory) effMod += 3;
				if (hasStud) effMod += 3.5;
				if (hasFerasAlpha) effMod += 3.5;
				if (hasMagicVirility) effMod += 2;
				if (hasFerasSeeder) effMod += 10;
				
				tits.cumMultiplierRaw = 10 + (10 * ((1 + cumMod) / 4));
				tits.ballEfficiency = 3 + (effMod * 2);
				tits.refractoryRate = 3 + (effMod * 4);
				tits.ballFullness = Math.max((coc.hoursSinceCum / 24) * 50, 100);
				
				if (tits.cumMultiplierRaw < 1) tits.cumMultiplierRaw = 1;
				if (tits.ballEfficiency < 1) tits.ballEfficiency = 1;
				if (tits.refractoryRate < 1) tits.refractoryRate = 1;
				if (tits.ballFullness < 0) tits.ballFullness = 0;
			}
		}
		
		private static var CONVERT_SKIN_TYPES:Array;
		
		{
			CONVERT_SKIN_TYPES = [];
			
			CONVERT_SKIN_TYPES[CoCTypeDefs.SKIN_TYPE_PLAIN] = GLOBAL.SKIN_TYPE_SKIN;
			CONVERT_SKIN_TYPES[CoCTypeDefs.SKIN_TYPE_FUR] = GLOBAL.SKIN_TYPE_FUR;
			CONVERT_SKIN_TYPES[CoCTypeDefs.SKIN_TYPE_GOO] = GLOBAL.SKIN_TYPE_GOO;
			CONVERT_SKIN_TYPES[CoCTypeDefs.SKIN_TYPE_SCALES] = GLOBAL.SKIN_TYPE_SCALES;
			CONVERT_SKIN_TYPES[CoCTypeDefs.SKIN_TYPE_UNDEFINED] = GLOBAL.SKIN_TYPE_SKIN;
		}
		
		private static function convertSkinData(tits:TiTsCharacterData, coc:CoCCharacterData):void
		{
			if (CONVERT_SKIN_TYPES[coc.skinType] != undefined)
			{
				tits.skinType = CONVERT_SKIN_TYPES[coc.skinType];
			}
			
			// Skin Adjectives.
			// All known adjectives from the CoC codebase are listed
			switch(coc.skinAdj)
			{
				case "rubber":
				case "latex":
				case "smooth":
				case "milky":
				case "ashen":
				case "silky":
					tits.skinFlags = [GLOBAL.FLAG_SMOOTH];
					break;
					
				case "slimy":
				case "slimey":
				case "goopey":
					tits.skinFlags = [GLOBAL.FLAG_STICKY];
					break;
					
				case "thick":
					tits.skinFlags = [GLOBAL.FLAG_THICK];
					break;
					
				case "freckled":
				default:
					tits.skinFlags = [];
					break;
			}
			
			// SkinDesc only ever appears to be "skin/fur/scales/goo" in the majority of cases so fuck it.
			
			if (coc.skinTone.length > 0)
			{
				tits.skinTone = coc.skinTone;
			}
		}
		
		private static var CONVERT_TAIL_TYPES:Array;
		
		{
			CONVERT_TAIL_TYPES = [];
			
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_NONE] = 0;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_HORSE] = GLOBAL.TYPE_EQUINE;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_DOG] = GLOBAL.TYPE_CANINE;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_DEMONIC] = GLOBAL.TYPE_DEMONIC;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_COW] = GLOBAL.TYPE_BOVINE;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_SPIDER_ADBOMEN] = GLOBAL.TYPE_ARACHNID;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_BEE_ABDOMEN] = GLOBAL.TYPE_BEE;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_SHARK] = GLOBAL.TYPE_SHARK;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_CAT] = GLOBAL.TYPE_FELINE;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_LIZARD] = GLOBAL.TYPE_LIZAN;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_RABBIT] = GLOBAL.TYPE_LAPINE; // Check valid
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_HARPY] = GLOBAL.TYPE_AVIAN;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_KANGAROO] = GLOBAL.TYPE_KANGAROO;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_FOX] = GLOBAL.TYPE_VULPINE;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_DRACONIC] = GLOBAL.TYPE_DRACONIC;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_RACCOON] = GLOBAL.TYPE_KUITAN;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_MOUSE] = GLOBAL.TYPE_MOUSE;
			CONVERT_TAIL_TYPES[CoCTypeDefs.TAIL_TYPE_FERRET] = GLOBAL.TYPE_BADGER;
		}
		
		private static function convertTailData(tits:TiTsCharacterData, coc:CoCCharacterData):void
		{
			var initTail:int = tits.tailType;
			
			if (CONVERT_TAIL_TYPES[coc.tailType] != undefined)
			{
				tits.tailType = CONVERT_TAIL_TYPES[coc.tailType];
			}
			
			// Early exit if type didn't actually change
			if (tits.tailType == initTail) return;
			
			// Continue setting up more tail data with some useful defaults.
			if (tits.tailType == 0)
			{
				tits.tailCount = 0;
				tits.tailFlags = [];
				tits.tailGenital = 0;
				tits.tailGenitalArg = 0;
			}
			else
			{
				// The only tail the player can have more than one if in TiTs are the kitsune tails, and the data
				// for those is stored in a fucking annoying way, so I'm pretending like I didn't see it.
				tits.tailCount = 1;
				
				switch (tits.tailType)
				{
					case GLOBAL.TYPE_EQUINE:
					case GLOBAL.TYPE_MOUSE:
						tits.tailFlags = [GLOBAL.FLAG_LONG];
						break;
						
					case GLOBAL.TYPE_BOVINE:
						tits.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLUFFY];
						break;
						
					case GLOBAL.TYPE_PANDA:
					case GLOBAL.TYPE_BADGER:
					case GLOBAL.TYPE_DEER:
					case GLOBAL.TYPE_LAPINE:
						tits.tailFlags = [GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];
						break;
					
					case GLOBAL.TYPE_CANINE:
					case GLOBAL.TYPE_KUITAN:
					case GLOBAL.TYPE_VULPINE:
						tits.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];
						break;
						
					case GLOBAL.TYPE_FELINE:
						tits.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FURRED];
						break;
						
					case GLOBAL.TYPE_BEE:
						tits.tailFlags = [GLOBAL.FLAG_SMOOTH, GLOBAL.FLAG_STINGER_TIPPED, GLOBAL.FLAG_CHITINOUS];
						break;
						
					case GLOBAL.TYPE_ARACHNID:
					case GLOBAL.TYPE_DRIDER:
						tits.tailFlags = [GLOBAL.FLAG_SMOOTH, GLOBAL.FLAG_CHITINOUS];
						break;
						
					case GLOBAL.TYPE_MYR:
						tits.tailFlags = [GLOBAL.FLAG_SMOOTH, GLOBAL.FLAG_CHITINOUS];
						break;
						
					case GLOBAL.TYPE_DEMONIC:
						tits.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_PREHENSILE];
						break;
						
					case GLOBAL.TYPE_DRACONIC:
					case GLOBAL.TYPE_LIZAN:
					case GLOBAL.TYPE_RASKVEL:
					case GLOBAL.TYPE_SNAKE:
						tits.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_PREHENSILE, GLOBAL.FLAG_SCALED];
						break;
						
					case GLOBAL.TYPE_OVIR:
						tits.tailFlags = [GLOBAL.FLAG_SCALED];
						break;
						
					case GLOBAL.TYPE_VANAE:
						tits.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_PREHENSILE];
						break;
						
					default:
						tits.tailFlags = [];
						break;
				}
				
				tits.tailGenital = 0;
				tits.tailGenitalArg = 0;
			}
		}
		
		private static var CONVERT_TONGUE_TYPES:Array;
		
		{
			CONVERT_TONGUE_TYPES = [];
			
			CONVERT_TONGUE_TYPES[CoCTypeDefs.TONUGE_HUMAN] = GLOBAL.TYPE_HUMAN;
			CONVERT_TONGUE_TYPES[CoCTypeDefs.TONUGE_SNAKE] = GLOBAL.TYPE_NAGA;
			CONVERT_TONGUE_TYPES[CoCTypeDefs.TONUGE_DEMONIC] = GLOBAL.TYPE_DEMONIC;
			CONVERT_TONGUE_TYPES[CoCTypeDefs.TONUGE_DRACONIC] = GLOBAL.TYPE_DRACONIC;
		}
		
		private static function convertTongueData(tits:TiTsCharacterData, coc:CoCCharacterData):void
		{
			var initTongueType:int = tits.tongueType;
			
			if (CONVERT_TONGUE_TYPES[coc.tongueType] != undefined)
			{
				tits.tongueType = CONVERT_TONGUE_TYPES[coc.tongueType];
			}
			
			if (tits.tongueType != initTongueType)
			{
				tits.tongueFlags = [];
				
				switch (tits.tongueType)
				{
					case GLOBAL.TYPE_BEE:
						tits.armFlags.push(GLOBAL.FLAG_LONG);
						tits.armFlags.push(GLOBAL.FLAG_HOLLOW);
						
					case GLOBAL.TYPE_DEMONIC:
					case GLOBAL.TYPE_DRACONIC:
					case GLOBAL.TYPE_LEITHAN:
						tits.armFlags.push(GLOBAL.FLAG_LONG);
						tits.armFlags.push(GLOBAL.FLAG_PREHENSILE);
						break;
						
					case GLOBAL.TYPE_NAGA:
					case GLOBAL.TYPE_OVIR:
						tits.armFlags.push(GLOBAL.FLAG_LONG);
						break;
						
					case GLOBAL.TYPE_RASKVEL:
						tits.armFlags.push(GLOBAL.FLAG_LONG);
						tits.armFlags.push(GLOBAL.FLAG_LUBRICATED);
						tits.armFlags.push(GLOBAL.FLAG_PREHENSILE);
						tits.armFlags.push(GLOBAL.FLAG_SQUISHY);
						break;
						
					default:
						break;
				}
			}
		}
		
		private static var CONVERT_WING_TYPES:Array;
		
		{
			CONVERT_WING_TYPES = [];
			
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_NONE] = 0;
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_BEE_LIKE_SMALL] = GLOBAL.TYPE_SMALLBEE;
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_BEE_LIKE_LARGE] = GLOBAL.TYPE_BEE;
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_HARPY] = GLOBAL.TYPE_AVIAN;
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_IMP] = GLOBAL.TYPE_SMALLDEMONIC;
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_BAT_LIKE_TINY] = 0;
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_BAT_LIKE_LARGE] = 0;
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_SHARK_FIN] = GLOBAL.TYPE_SHARK;
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_FEATHERED_LARGE] = GLOBAL.TYPE_AVIAN;
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_DRACONIC_SMALL] = GLOBAL.TYPE_SMALLDRACONIC;
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_DRACONIC_LARGE] = GLOBAL.TYPE_DRACONIC;
			CONVERT_WING_TYPES[CoCTypeDefs.WING_TYPE_GIANT_DRAGONFLY] = GLOBAL.TYPE_DRAGONFLY;
		}
		
		private static function convertWingData(tits:TiTsCharacterData, coc:CoCCharacterData):void
		{
			if (CONVERT_WING_TYPES[coc.wingType] != undefined)
			{
				tits.wingType = CONVERT_WING_TYPES[coc.wingType];
			}
			
			// There are no other available properties in TiTs to do anything with coc.wingDesc so whatevs!
		}
		
		private static var CONVERT_ARM_TYPES:Array;
		
		{
			CONVERT_ARM_TYPES = [];
			
			CONVERT_ARM_TYPES[CoCTypeDefs.ARM_TYPE_HUMAN] = GLOBAL.TYPE_HUMAN;
			CONVERT_ARM_TYPES[CoCTypeDefs.ARM_TYPE_HARPY] = GLOBAL.TYPE_AVIAN;
			CONVERT_ARM_TYPES[CoCTypeDefs.ARM_TYPE_SPIDER] = GLOBAL.TYPE_ARACHNID;
		}
		
		private static function convertArmData(tits:TiTsCharacterData, coc:CoCCharacterData):void
		{
			var initArmType:int = tits.armType;
			
			if (CONVERT_ARM_TYPES[coc.armType] != undefined)
			{
				tits.armType = CONVERT_ARM_TYPES[coc.armType];
			}
			
			if (tits.armType != initArmType)
			{
				tits.armFlags = [];
				
				switch (tits.armType)
				{
					case GLOBAL.TYPE_AVIAN:
						tits.armFlags.push(GLOBAL.FLAG_FEATHERED);
						break;
						
					case GLOBAL.TYPE_ARACHNID:
					case GLOBAL.TYPE_BEE:
					case GLOBAL.TYPE_DRIDER:
					case GLOBAL.TYPE_LEITHAN:
					case GLOBAL.TYPE_MYR:
						tits.armFlags.push(GLOBAL.FLAG_CHITINOUS);
						break;
						
					case GLOBAL.TYPE_CANINE:
					case GLOBAL.TYPE_FELINE:
					case GLOBAL.TYPE_BADGER:
					case GLOBAL.TYPE_KUITAN:
					case GLOBAL.TYPE_PANDA:
						tits.armFlags.push(GLOBAL.FLAG_FURRED);
						break;
						
					case GLOBAL.TYPE_OVIR:
						tits.armFlags.push(GLOBAL.FLAG_SCALED);
						break;
						
					default:
						break;
				}
			}
		}
		
		private static var CONVERT_EYE_TYPES:Array;
		
		{
			CONVERT_EYE_TYPES = [];
			
			CONVERT_EYE_TYPES[CoCTypeDefs.EYES_HUMAN] = GLOBAL.TYPE_HUMAN;
			CONVERT_EYE_TYPES[CoCTypeDefs.EYES_FOUR_SPIDER_EYES] = GLOBAL.TYPE_ARACHNID;
			CONVERT_EYE_TYPES[CoCTypeDefs.EYES_BLACK_EYES_SAND_TRAP] = GLOBAL.TYPE_MYR;
		}
		
		private static var CONVERT_FACE_TYPES:Array;
		
		{
			CONVERT_FACE_TYPES = [];
			
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_HUMAN] = GLOBAL.TYPE_HUMAN;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_HORSE] = GLOBAL.TYPE_EQUINE;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_DOG] = GLOBAL.TYPE_CANINE;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_COW_MINOTAUR] = GLOBAL.TYPE_BOVINE;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_SHARK_TEETH] = GLOBAL.TYPE_SHARK;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_SNAKE_FANGS] = GLOBAL.TYPE_SNAKE;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_CAT] = GLOBAL.TYPE_FELINE;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_LIZARD] = GLOBAL.TYPE_LIZAN;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_BUNNY] = GLOBAL.TYPE_LAPINE;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_KANGAROO] = GLOBAL.TYPE_KANGAROO;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_SPIDER_FANGS] = GLOBAL.TYPE_ARACHNID;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_FOX] = GLOBAL.TYPE_VULPINE;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_DRAGON] = GLOBAL.TYPE_DRACONIC;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_RACCOON_MASK] = GLOBAL.TYPE_HUMANMASKED;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_RACCOON] = GLOBAL.TYPE_KUITAN;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_BUCKTEETH] = GLOBAL.TYPE_LAPINE;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_FERRET_MASK] = GLOBAL.TYPE_HUMANMASKED;
			CONVERT_FACE_TYPES[CoCTypeDefs.FACE_FERRET] = GLOBAL.TYPE_BADGER;
		}
		
		private static var CONVERT_HAIR_TYPES:Array;
		
		{
			CONVERT_HAIR_TYPES = [];
			
			CONVERT_HAIR_TYPES[CoCTypeDefs.HAIR_NORMAL] = GLOBAL.HAIR_TYPE_REGULAR;
			CONVERT_HAIR_TYPES[CoCTypeDefs.HAIR_FEATHER] = GLOBAL.HAIR_TYPE_FEATHERS;
			CONVERT_HAIR_TYPES[CoCTypeDefs.HAIR_GHOST] = GLOBAL.HAIR_TYPE_TRANSPARENT;
			CONVERT_HAIR_TYPES[CoCTypeDefs.HAIR_GOO] = GLOBAL.HAIR_TYPE_GOO;
			CONVERT_HAIR_TYPES[CoCTypeDefs.HAIR_ANEMONE] = GLOBAL.HAIR_TYPE_TENTACLES;
		}
		
		private static var CONVERT_HORN_TYPES:Array;
		
		{
			CONVERT_HORN_TYPES = [];
			
			CONVERT_HORN_TYPES[CoCTypeDefs.HORNS_NONE] = 0;
			CONVERT_HORN_TYPES[CoCTypeDefs.HORNS_DEMON] = GLOBAL.TYPE_DEMONIC;
			CONVERT_HORN_TYPES[CoCTypeDefs.HORNS_COW_MINOTAUR] = GLOBAL.TYPE_BOVINE;
			CONVERT_HORN_TYPES[CoCTypeDefs.HORNS_DRACONIC_X2] = GLOBAL.TYPE_DRACONIC;
			CONVERT_HORN_TYPES[CoCTypeDefs.HORNS_DRACONIC_X4_12_INCH_LONG] = GLOBAL.TYPE_DRACONIC;
		}
		
		private static var CONVERT_EAR_TYPES:Array;
		
		{
			CONVERT_EAR_TYPES = [];
			
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_HUMAN] = GLOBAL.TYPE_HUMAN;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_HORSE] = GLOBAL.TYPE_EQUINE;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_DOG] = GLOBAL.TYPE_CANINE;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_COW] = GLOBAL.TYPE_BOVINE;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_ELFIN] = GLOBAL.TYPE_SYLVAN;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_CAT] = GLOBAL.TYPE_FELINE;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_LIZARD] = GLOBAL.TYPE_LIZAN;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_BUNNY] = GLOBAL.TYPE_LAPINE;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_KANGAROO] = GLOBAL.TYPE_KANGAROO;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_FOX] = GLOBAL.TYPE_VULPINE;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_DRAGON] = GLOBAL.TYPE_DRACONIC;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_RACCOON] = GLOBAL.TYPE_KUITAN;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_MOUSE] = GLOBAL.TYPE_MOUSE;
			CONVERT_EAR_TYPES[CoCTypeDefs.EARS_FERRET] = GLOBAL.TYPE_HUMAN;
		}
		
		private static function convertHeadData(tits:TiTsCharacterData, coc:CoCCharacterData):void
		{
			// eyes
			if (CONVERT_EYE_TYPES[coc.eyeType] != undefined)
			{
				tits.eyeType = CONVERT_EYE_TYPES[coc.eyeType];
			}
			
			// face
			var initFaceType:int = tits.faceType;
			
			if (CONVERT_FACE_TYPES[coc.faceType] != undefined)
			{
				tits.faceType = CONVERT_FACE_TYPES[coc.faceType];
			}
			
			if (tits.faceType != initFaceType)
			{
				tits.faceFlags = [];
				
				switch (tits.faceType)
				{
					case GLOBAL.TYPE_EQUINE:
						tits.faceFlags.push(GLOBAL.FLAG_LONG);
						tits.faceFlags.push(GLOBAL.FLAG_MUZZLED);
						break;
						
					case GLOBAL.TYPE_CANINE:
					case GLOBAL.TYPE_FELINE:
					case GLOBAL.TYPE_LIZAN:
					case GLOBAL.TYPE_KANGAROO:
					case GLOBAL.TYPE_VULPINE:
					case GLOBAL.TYPE_DRACONIC:
					case GLOBAL.TYPE_PANDA:
					case GLOBAL.TYPE_BADGER:
					case GLOBAL.TYPE_BOVINE:
						tits.faceFlags.push(GLOBAL.FLAG_MUZZLED);
						break;
						
					case GLOBAL.TYPE_SHARK:
					case GLOBAL.TYPE_GABILANI:
						tits.faceFlags.push(GLOBAL.FLAG_ANGULAR);
						break;
						
					default:
						break;
				}
			}
			
			// ears
			if (CONVERT_EAR_TYPES[coc.earType] != undefined)
			{
				tits.earType = CONVERT_EAR_TYPES[coc.earType];
			}
			
			// hair
			tits.hairColor = coc.hairColor;
			tits.hairLength = coc.hairLength;
			
			if (CONVERT_HAIR_TYPES[coc.hairType] != undefined)
			{
				tits.hairType = CONVERT_HAIR_TYPES[coc.hairType];
			}
			
			// horns
			if (CONVERT_HORN_TYPES[coc.hornType] != undefined)
			{
				tits.hornType = CONVERT_HORN_TYPES[coc.hornType];
			}
			
			if (tits.hornType != 0)
			{
				switch (coc.hornType)
				{
					case CoCTypeDefs.HORNS_DEMON:
						
						tits.horns = coc.horns;
						
						if (coc.horns <= 2)
						{
							tits.hornLength = 2;
						}
						else if (coc.horns > 2 && coc.horns <= 4)
						{
							tits.hornLength = 5;
						}
						else if (coc.horns > 4 && coc.horns <= 6)
						{
							tits.hornLength = 8;
						}
						else
						{
							tits.hornLength = 10;
						}
						
						break;
					
					case CoCTypeDefs.HORNS_DRACONIC_X2:
					case CoCTypeDefs.HORNS_COW_MINOTAUR:
						tits.horns = 2;
						tits.hornLength = coc.horns;
						break;
						
					case CoCTypeDefs.HORNS_DRACONIC_X4_12_INCH_LONG:
						tits.horns = 4;
						tits.hornLength = coc.horns;
						break;
					
					default:
						tits.horns = 0;
						tits.hornLength = 0;
				}
			}
		}
		
	}

}
