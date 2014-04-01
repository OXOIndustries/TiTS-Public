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
		public static const NUBBY:int  		                           = 30;
		public static const FORESKINNED:int	    					   = 31;
		
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
		public static const VENUSPITCHER:int						   = 34;
		public static const PANDA:int 								   = 40;
		public static const MIMBRANE:int							   = 41;
		public static const RASKVEL:int 							   = 42;
		
		//Used for custom legs, otherwise demonic!
		public static const SUCCUBUS:int                               = 35;
		
		//Special wing types!
		public static const SMALLBEE:int                               = 36;
		public static const SMALLDEMONIC:int                           = 37;
		public static const SMALLDRACONIC:int                          = 38;
		public static const NALEEN_FACE:int 						   = 39;

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
		public static const TENTACLED:int 							   = 6;
				
		//CUM & MILK TYPES
		public static const MILK:int                                   = 0;
		public static const HONEY:int                                  = 1;
		public static const CUM:int                                    = 2;
		public static const OIL:int                                    = 3;
		public static const MILKSAP:int                                = 4;
		public static const GIRLCUM:int                                = 5;
		public static const CUMSAP:int								   = 6;
		public static const CHOCOLATE_MILK:int 						   = 7;

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
		
		public static const MAX_DAMAGE_TYPES:int						= 8; // damageType bookend, probably gonna roll its usage into things like array generation and shit.
		
		public static const DamageTypeStrings = 
		[
			"Kinetic",
			"Slashing",
			"Piercing",
			"Laser",
			"Plasma",
			"Gravitic",
			"Electrical",
			"Thermal",
		];
		
		public static const DamageTypeShortStrings = 
		[
			"Kntc",
			"Slsh",
			"Prcn",
			"Lasr",
			"Plsm",
			"Grvt",
			"Elec",
			"Thrm",
		];

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
		public static const HAZARD:int								   = 10;

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
		public static const NALEEN:int								   = 11;
		public static const VPITCHER:int							   = 12;
		public static const ELDERVPITCHER:int						   = 13;
		public static const SYRI:int 								   = 14;
		public static const NALEEN_MALE:int  						   = 15;
		public static const MACHINA:int 							   = 16;
		public static const JADE:int 								   = 17;
		public static const REAHA:int 								   = 18;
		public static const KELLY:int 								   = 19;

		public static var ITEMS:Object = {};
		
		/**
		 * You have a couple of ways of querying the preference values to get useful information back out; it's why I've set the LIKES/DISLIKES values like I have.
		 * creature.sexualPreferences.getPref(SEXPREF_flag) will give you the direct set value; 2, 1, -1 or -2. Or 0 if the preference isn't set.
		 * creature.sexualPreferences.getAveragePrefScore(SEXPREF_flag1, SEXPREF_flag2, ..., SEXPREF_flagn) will give you the *average* score of the provided flags.
		 * creature.sexualPreferences.getTotalPrefSecore(SEXPREF_flag1 ... SEXPREF_flagn) will give you the total running score of the provided flags.
		 * There's also getHighestPrefScore and getLowestPrefScore. They both work on multiple flags at the same time.
		 * 
		 * I'm seeing two possible ways to use it;
		 * Say you tag up a tease-attack internally; give it a list of SEXPREFS that are "major parts" of the tease attack. You can then feed them into the target of the attack, and use the return as a multiplier on the lust damage delt.
		 * You could then also individually target the flags in the tease scene to bulk out the content. If the targets got a pref for one of the core things in the attack, you can slap in some reactionary shit in there p. easy.
		 * 
		 * I kinda want to add a method of getting a list of what SEXPREFS a creature "satisfies" now too, based on how its stats are setup.
		 * Get list from creature -> feed list into target, get some kinda factor that you could use to trigger special interactions or something. Rather than checking properties individually to get the ball rolling, you could check how close to "ideal" two creatures are to each other instead.
		 */
		
		// Changed around how this was gonna work internally. You can be as generic or as verbose as you wanna be, just make sure every "preference" has a unique value.
		// See Penny's creature constructor for examples of whats going on to set things.
		
		public static const SEXPREF_FEMININE:int = 0;
		public static const SEXPREF_MASCULINE:int = 1;
		public static const SEXPREF_HERMAPHRODITE:int = 2;
		public static const SEXPREF_BIG_BUTTS:int = 3;
		public static const SEXPREF_SMALL_BUTTS:int = 4;
		public static const SEXPREF_BIG_BREASTS:int = 5;
		public static const SEXPREF_SMALL_BREASTS:int = 6;
		public static const SEXPREF_WIDE_HIPS:int = 7;
		public static const SEXPREF_NARROW_HIPS:int = 8;
		public static const SEXPREF_COCKS:int = 9;
		public static const SEXPREF_PUSSIES:int = 10;
		public static const SEXPREF_BALLS:int = 11;
		public static const SEXPREF_BIG_MALEBITS:int = 12;
		public static const SEXPREF_SMALL_MALEBITS:int = 13; // Because Vladimir Snoutin' aka Savin would want dis!
		public static const SEXPREF_MULTIPLES:int = 14;
		public static const SEXPREF_HYPER:int = 15;
		public static const SEXPREF_GAPE:int = 16;
		public static const SEXPREF_VAGINAL_WETNESS:int = 17;
		public static const SEXPREF_VAGINAL_DRYNESS:int = 18;
		public static const SEXPREF_TAILS:int = 19;
		public static const SEXPREF_TAILGENITALS:int = 20;
		public static const SEXPREF_LACTATION:int = 21;
		public static const SEXPREF_NIPPLECUNTS:int = 22;
		public static const SEXPREF_EXOTIC_BODYSHAPE:int = 23;
		public static const SEXPREF_BALDNESS:int = 24;
		public static const SEXPREF_LONG_HAIR:int = 25;
		
		public static const MAX_SEXPREF_VALUE:int = 26; // Keep this as a book-end on the values. Check penny for how you'd random shit
		
		// Not ideal, but it's possibly better than using switch statements, plus it keeps the Keys ^ with Descriptors \/
		// The two will have to forever be in the same order though, but I can probably rig up some better system.
		public static const SEXPREF_DESCRIPTORS:Array = 
		[
			"Feminine faces",
			"Masculine faces",
			"Hermaphrodites",
			"Big butts",
			"Small butts",
			"Big breasts",
			"Small breasts",
			"Wide hips",
			"Narrow hips",
			"Penises",
			"Vaginas",
			"Balls",
			"Big masculine endowments",
			"Petite masculine endowments",
			"Multiple sex organs or breasts",
			"Hypersized attributes",
			"Gaped orifices",
			"Wet vaginas",
			"Less lubricated vaginas",
			"Tails",
			"Tail genitalia",
			"Lactation",
			"Nipplecunts",
			"Exotic bodyshapes like nagas and taurs",
			"Baldness",
			"Long hair",
			"ERROR ERROR ABORT ABORT"
		];
		
		public static const REALLY_LIKES_SEXPREF:Number = 2;
		public static const KINDA_LIKES_SEXPREF:Number = 1.3333;
		public static const KINDA_DISLIKES_SEXPREF:Number = .75;
		public static const REALLY_DISLIKES_SEXPREF:Number = .5;
		
		public static const SEXPREF_VALUES:Array = [REALLY_LIKES_SEXPREF, KINDA_LIKES_SEXPREF, KINDA_DISLIKES_SEXPREF, REALLY_DISLIKES_SEXPREF];
		
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