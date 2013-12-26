package classes
{
	public class GLOBAL
	{
		//CLASSES
		public static const SMUGGLER:int                               = 0;
		public static const MERCENARY:int                              = 1;
		public static const ENGINEER:int                               = 2;

		//Body Part Flags - used for any body part that supports the new flags system.
			//NOTE: Not all flags work with all body parts, for obvious reasons
		public static const LONG:int                                   = 1;
		public static const PREHENSILE:int                             = 2;
		public static const LUBRICATED:int                             = 3;
		public static const FLUFFY:int                                 = 4;
		public static const SQUISHY:int                                = 5;
		public static const SMOOTH:int                                 = 6;
		public static const TAPERED:int                                = 7;
		public static const FLARED:int                                 = 8;
		public static const KNOTTED:int                                = 9;
		public static const BLUNT:int                                  = 10;
		public static const APHRODISIAC_LACED:int                      = 11;
		public static const STICKY:int                                 = 12;
		public static const THICK:int                                  = 13;
		public static const MUZZLED:int                                = 14;
		public static const ANGULAR:int                                = 15;
		public static const PLANTIGRADE:int                            = 16;
		public static const DIGITIGRADE:int                            = 17;
		public static const TENDRIL:int                                = 18;
		public static const AMORPHOUS:int                              = 19;
		public static const FURRED:int                                 = 20;
		public static const SCALED:int                                 = 21;
		public static const HOOVES:int                                 = 22;
		public static const PAWS:int                                   = 23;
		public static const HEELS:int                                  = 24;
		public static const OVIPOSITOR:int                             = 25;
		public static const SHEATHED:int                               = 26;
		public static const TAILCOCK:int                               = 27;
		public static const STINGER_BASED:int                          = 28;
		public static const STINGER_TIPPED:int                         = 29;
		public static const NUBBY:int                                  = 30;
		//TYPES
		public static const HUMAN:int                                  = 0;
		public static const EQUINE:int                                 = 1;
		public static const BOVINE:int                                 = 2;
		public static const CANINE:int                                 = 3;
		public static const FELINE:int                                 = 4;
		public static const VULPINE:int                                = 5;
		public static const BEE:int                                    = 6;
		public static const ARACHNID:int                               = 7;
		public static const DRIDER:int                                 = 8;
		public static const LAPINE:int                                 = 9;
		public static const AVIAN:int                                  = 10;
		public static const DRACONIC:int                               = 11;
		public static const LIZAN:int                                  = 12;
		public static const SNAKE:int                                  = 13;
		public static const NAGA:int                                   = GLOBAL.SNAKE;
		public static const CENTAUR:int                                = 14;
		public static const DEMONIC:int                                = 15;
		public static const GOOEY:int                                  = 16;
		public static const KANGAROO:int                               = 17;
		public static const TANUKI:int                                 = 18;
		public static const SHARK:int                                  = 19;
		public static const SIREN:int                                  = 20;
		public static const DEER:int                                   = 21;
		public static const ANEMONE:int                                = 22;
		public static const TENTACLE:int                               = 23;
		public static const KUITAN:int                                 = 24;
		public static const HUMANMASKED:int                            = 25;
		public static const MOUSE:int                                  = 26;
		public static const MOUSEMAN:int                               = 27;
		public static const DRAGONFLY:int                              = 31;
		public static const MLP:int                                    = 32;
		public static const CUNTSNAKE:int                              = 33;
		//Used for custom legs, otherwise demonic!
		public static const SUCCUBUS:int                               = 33;
		//Special wing types!
		public static const SMALLBEE:int                               = 28;
		public static const SMALLDEMONIC:int                           = 29;
		public static const SMALLDRACONIC:int                          = 30;

		//SKINTYPES
		public static const SKIN:int                                   = 0;
		public static const FUR:int                                    = 1;
		public static const SCALES:int                                 = 2;
		public static const GOO:int                                    = 3;
		public static const CHITIN:int                                 = 4;
				
		//NIPPLETYPES
		public static const NORMAL:int                                 = 0;
		public static const FUCKABLE:int                               = 1;
		public static const LIPPLES:int                                = 2;
		public static const DICK:int                                   = 3;
		public static const FLAT:int                                   = 4;
		public static const INVERTED:int                               = 5;
				
		//CUM & MILK TYPES
		public static const MILK:int                                   = 0;
		public static const HONEY:int                                  = 1;
		public static const CUM:int                                    = 2;
		public static const OIL:int                                    = 3;
		public static const MILKSAP:int                                = 4;
		public static const GIRLCUM:int                                = 5;

		//DAMAGE TYPES
		//Guns and blunt weapons
		public static const KINETIC:int                                = 0;
		//Swords and the like.
		public static const SLASHING:int                               = 1;
		//Horns, knives, etc.
		public static const PIERCING:int                               = 2;
		//Lasers - less effective against HP
		public static const LASER:int                                  = 3;
		//Equally murders everything.
		public static const PLASMA:int                                 = 4;
		//Pretty good against everything
		public static const GRAVITIC:int                               = 5;
		//ELECTRIC - good vs shields
		public static const ELECTRIC:int                               = 6;
		//THERMAL
		public static const THERMAL:int                                = 7;

		//ROOM FLAGS
		public static const INDOOR:int                                 = 0;
		public static const OUTDOOR:int                                = 1;
		public static const BED:int                                    = 2;
		public static const COMMERCE:int							   = 3;
		public static const BAR:int									   = 4;
		public static const NPC:int									   = 5;
		public static const MEDICAL:int								   = 6;
		public static const SHIPHANGAR:int							   = 7;
		public static const QUEST:int								   = 8;
		public static const OBJECTIVE:int						       = 9;


		//PLOT FLAGS
		public static const RECRUITED_CELISE:int                       = 0;
		public static const CELISE_ONBOARD:int                         = 1;
		public static const TIMES_CELISE_IN_BALLS:int                  = 2;
		

		//ITEM TYPES
		public static const PILL:int                                   = 0;
		public static const FOOD:int                                   = 1;
		public static const POTION:int                                 = 2;
		public static const MELEE_WEAPON:int                           = 3;
		public static const RANGED_WEAPON:int                          = 4;
		public static const ARMOR:int                                  = 5;
		public static const SHIELD:int                                 = 6;
		public static const UPPER_UNDERGARMENT:int                     = 7;
		public static const LOWER_UNDERGARMENT:int                     = 8;
		public static const ACCESSORY:int                              = 9;
		public static const DRUG:int                                   = 10;
		public static const CLOTHING:int                               = 11;
		public static const ALL:int                                    = 12; //Used for pawn shops!

		//CHARACTERS
		public static const CELISE:int                                 = 1;
		public static const RIVAL:int                                  = 2;
		public static const GEOFF:int                                  = 3;
		public static const FLAHNE:int                                 = 4;
		public static const ZILPACK:int                                = 5;
		public static const ZIL:int                                    = 6;
		public static const PENNY:int                                  = 7;
		public static const BURT:int                                   = 8;
		public static const ZILFEMALE:int 							   = 9;
		public static const CSNAKE:int								   = 10;


		public static const bustLookup:Object = {
			"CELISE"     : 1,
			"RIVAL"      : 2,
			"GEOFF"      : 3,
			"FLAHNE"     : 4,
			"ZILPACK"    : 5,
			"ZIL"        : 6,
			"PENNY"      : 7,
			"BURT"       : 8,
			"ZILFEMALE"  : 9,
			"CSNAKE"     : 10
		};

		public static var ITEMS:Object = {};

		/*PLOT FLAGS
		RECRUITED_CELISE
		CELISE_ONBOARD
		TIMES_CELISE_IN_BALLS
		MET_GEOFF
		SCRAPYARD_SEEN
		SEXED_GEOFF
		"GEOFF_FUCKED_DUDES_TWICE"
		*/

	}
}