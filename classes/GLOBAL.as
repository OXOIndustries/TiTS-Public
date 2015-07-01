package classes
{
	public class GLOBAL
	{
		//CLASSES
		public static const CLASS_SMUGGLER:int                               = 0;
		public static const CLASS_MERCENARY:int                              = 1;
		public static const CLASS_ENGINEER:int                               = 2;
		public static const MAX_CLASSES:int							   		 = 3;
		
		public static const CLASS_NAMES:Array = [
			"Smuggler",
			"Mercenary",
			"Engineer"
		];

		//Body Part Flags - used for any body part that supports the new flags system.
		//NOTE: Not all flags work with all body parts, for obvious reasons
		public static const FLAG_LONG:int                                   = 1;
		public static const FLAG_PREHENSILE:int                             = 2;
		public static const FLAG_LUBRICATED:int                             = 3;
		public static const FLAG_FLUFFY:int                                 = 4;
		public static const FLAG_SQUISHY:int                                = 5;
		public static const FLAG_SMOOTH:int                                 = 6;
		public static const FLAG_TAPERED:int                                = 7;
		public static const FLAG_FLARED:int                                 = 8;
		public static const FLAG_KNOTTED:int                                = 9;
		public static const FLAG_BLUNT:int                                  = 10;
		public static const FLAG_APHRODISIAC_LACED:int                      = 11;
		public static const FLAG_STICKY:int                                 = 12;
		public static const FLAG_THICK:int                                  = 13;
		public static const FLAG_MUZZLED:int                                = 14;
		public static const FLAG_ANGULAR:int                                = 15;
		public static const FLAG_PLANTIGRADE:int                            = 16;
		public static const FLAG_DIGITIGRADE:int                            = 17;
		public static const FLAG_TENDRIL:int                                = 18;
		public static const FLAG_AMORPHOUS:int                              = 19;
		public static const FLAG_FURRED:int                                 = 20;
		public static const FLAG_SCALED:int                                 = 21;
		public static const FLAG_HOOVES:int                                 = 22;
		public static const FLAG_PAWS:int                                   = 23;
		public static const FLAG_HEELS:int                                  = 24;
		public static const FLAG_OVIPOSITOR:int                             = 25;
		public static const FLAG_SHEATHED:int                               = 26;
		public static const FLAG_TAILCOCK:int                               = 27;
		public static const FLAG_STINGER_BASED:int                          = 28;
		public static const FLAG_STINGER_TIPPED:int                         = 29;
		public static const FLAG_NUBBY:int  		                        = 30;
		public static const FLAG_FORESKINNED:int	    					= 31;
		public static const FLAG_HOLLOW:int									= 32;
		public static const FLAG_RIBBED:int									= 33;
		public static const FLAG_CHITINOUS:int								= 34;
		
		public static const FLAG_NAMES:Array = [
			"OFFSET -- INVALID",
			"Long",
			"Prehensile",
			"Lubricated",
			"Fluffy",
			"Squishy",
			"Smooth",
			"Tapered",
			"Flared",
			"Knotted",
			"Blunt",
			"Aphrodisiac",
			"Sticky",
			"Thick",
			"Muzzled",
			"Angular",
			"Plantigrade",
			"Digitgrade",
			"Tendril",
			"Amorphous",
			"Furred",
			"Scaled",
			"Hooves",
			"Paws",
			"Heels",
			"Ovipositor",
			"Sheathed",
			"Tailcock",
			"Stinger Base",
			"Stinger Tip",
			"Nubby",
			"Foreskinned",
			"Hollow",
			"Ribbed"
		];
		
		public static const VALID_SKIN_FLAGS:Array = [
			FLAG_SMOOTH,
			FLAG_THICK,
			FLAG_STICKY,
			FLAG_FLUFFY,
		];
		
		//TYPES
		public static const TYPE_HUMAN:int                                  = 0;
		public static const TYPE_EQUINE:int                                 = 1;
		public static const TYPE_BOVINE:int                                 = 2;
		public static const TYPE_CANINE:int                                 = 3;
		public static const TYPE_FELINE:int                                 = 4;
		public static const TYPE_VULPINE:int                                = 5;
		public static const TYPE_BEE:int                                    = 6;
		public static const TYPE_ARACHNID:int                               = 7;
		public static const TYPE_DRIDER:int                                 = 8;
		public static const TYPE_LAPINE:int                                 = 9;
		public static const TYPE_AVIAN:int                                  = 10;
		public static const TYPE_DRACONIC:int                               = 11;
		public static const TYPE_LIZAN:int                                  = 12;
		public static const TYPE_SNAKE:int                                  = 13;
		public static const TYPE_NAGA:int                                   = GLOBAL.TYPE_SNAKE;
		public static const TYPE_CENTAUR:int                                = 14;
		public static const TYPE_DEMONIC:int                                = 15;
		public static const TYPE_GOOEY:int                                  = 16;
		public static const TYPE_KANGAROO:int                               = 17;
		public static const TYPE_TANUKI:int                                 = 24; //Changed from 18 to 24 soz is the same as kui-tan
		public static const TYPE_SHARK:int                                  = 19;
		public static const TYPE_SIREN:int                                  = 20;
		public static const TYPE_DEER:int                                   = 21;
		public static const TYPE_ANEMONE:int                                = 22;
		public static const TYPE_TENTACLE:int                               = 23;
		public static const TYPE_KUITAN:int                                 = 24;
		public static const TYPE_HUMANMASKED:int                            = 25;
		public static const TYPE_MOUSE:int                                  = 26;
		public static const TYPE_MOUSEMAN:int                               = 27;
		public static const TYPE_DRAGONFLY:int                              = 31;
		public static const TYPE_MLP:int                                    = 32;
		public static const TYPE_CUNTSNAKE:int                              = 33;
		public static const TYPE_VENUSPITCHER:int						   	= 34;
		public static const TYPE_SUCCUBUS:int                               = 35;
		public static const TYPE_SMALLBEE:int                               = 36;
		public static const TYPE_SMALLDEMONIC:int                           = 37;
		public static const TYPE_SMALLDRACONIC:int                          = 38;
		public static const TYPE_NALEEN_FACE:int 						   	= 39;
		public static const TYPE_PANDA:int 								   	= 40;
		public static const TYPE_MIMBRANE:int							  	= 41;
		public static const TYPE_RASKVEL:int 							   	= 42;
		public static const TYPE_SYDIAN:int 								= 43;
		public static const TYPE_LAPINARA:int 							   	= 44;
		public static const TYPE_BADGER:int 								= 45;
		public static const TYPE_VANAE:int									= 46;
		public static const TYPE_VANAE_MAIDEN:int							= 47;
		public static const TYPE_VANAE_HUNTRESS:int							= 48;
		public static const TYPE_LEITHAN:int 							    = 49;
		public static const TYPE_GOAT:int 									= 50;
		public static const TYPE_SYNTHETIC:int 								= 51;
		public static const TYPE_SIMII:int 								    = 52;
		public static const TYPE_DAYNAR:int									= 53;
		public static const TYPE_COCKVINE:int								= 54;
		public static const TYPE_NYREA:int									= 55;
		public static const TYPE_INHUMAN:int 								= 56; //For when you want things to be vaguely like a human's but not quite the same
		public static const TYPE_OVIR:int									= 57;
		public static const TYPE_SYLVAN:int 								= 58; //Fuckin' elves
		public static const TYPE_DARK_SYLVAN:int 							= 59;
		
		public static const TYPE_NAMES:Array = [
			"Human",
			"Equine",
			"Bovine",
			"Canine",
			"Feline",
			"Vulpine",
			"Bee",
			"Arachnid",
			"Drider",
			"Lapine",
			"Avian",
			"Draconic",
			"Lizan",
			"Naga",
			"Centaur",
			"Demonic",
			"Gooey",
			"Kangaroo",
			"Tanuki",
			"Shark",
			"Siren",
			"Deer",
			"Anemone",
			"Tentacle",
			"Kuitan",
			"Humanmasked",
			"Mouse",
			"Mouseman",
			"Dragonfly",
			"MLP",
			"Cuntsnake",
			"Venus Pitcher",
			"Succubus",
			"Small Bee",
			"Small Demonic",
			"Small Draconic",
			"Naleen",
			"Panda",
			"Mimbrane",
			"Raskvel",
			"Sydian",
			"Lapinara",
			"Badger",
			"Vanae",
			"Vanae Maiden",
			"Vanae Huntress",
			"Leithan",
			"Goat",
			"Synthetic",
			"Simii",
			"Daynar",
			"Cockvine",
			"Nyrea",
			"Inhuman",
			"Ovir",
			"Sylvan",
			"Dark Sylvan"
		];
		
		public static const VALID_FACE_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_FELINE,
			TYPE_EQUINE,
			TYPE_BOVINE,
			TYPE_LIZAN,
			TYPE_DRACONIC,
			TYPE_NALEEN_FACE,
			TYPE_SHARK,
			TYPE_SIREN,
			TYPE_LAPINE,
			TYPE_NAGA,
			TYPE_HUMANMASKED,
			TYPE_KUITAN,
			TYPE_VULPINE,
			TYPE_MOUSEMAN,
			TYPE_MOUSE,
			TYPE_CANINE,
			TYPE_PANDA,
			TYPE_BADGER,
			TYPE_KANGAROO,			
		];
		
		public static const VALID_FACE_FLAGS:Array = [
			FLAG_SMOOTH,
			FLAG_MUZZLED,
			FLAG_ANGULAR,
		];
		
		public static const VALID_EYE_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_ARACHNID,
			TYPE_FELINE,
			TYPE_SNAKE,
			TYPE_SYNTHETIC,
			TYPE_LEITHAN,
		];
		
		public static const VALID_TONGUE_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_NAGA,
			TYPE_DEMONIC,
			TYPE_DRACONIC,
			TYPE_LEITHAN
		];
		
		public static const VALID_TONGUE_FLAGS:Array = [
			FLAG_LONG,
			FLAG_PREHENSILE,
			FLAG_HOLLOW,
		];
		
		public static const VALID_EAR_TYPES:Array = [
			TYPE_EQUINE,
			TYPE_CANINE,
			TYPE_BOVINE,
			TYPE_DRIDER,
			TYPE_FELINE,
			TYPE_LIZAN,
			TYPE_LAPINE,
			TYPE_KANGAROO,
			TYPE_VULPINE,
			TYPE_DRACONIC,
			TYPE_KUITAN,
			TYPE_MOUSE,
			TYPE_PANDA,
			TYPE_HUMAN,
			TYPE_LEITHAN,
			TYPE_RASKVEL,
			TYPE_SYLVAN,
		];
		
		public static const VALID_ARM_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_EQUINE,
			TYPE_PANDA,
			TYPE_CANINE,
			TYPE_BEE,
			TYPE_FELINE,
			TYPE_AVIAN,
			TYPE_ARACHNID,
			TYPE_DRIDER,
			TYPE_BADGER,
			TYPE_LEITHAN
		];
		
		public static const VALID_LEG_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_NAGA,
			TYPE_DRIDER,
			TYPE_ARACHNID,
			TYPE_GOOEY,
			TYPE_EQUINE,
			TYPE_CENTAUR,
			TYPE_BOVINE,
			TYPE_CANINE,
			TYPE_FELINE,
			TYPE_VULPINE,
			TYPE_BEE,
			TYPE_LAPINE,
			TYPE_AVIAN,
			TYPE_DRACONIC,
			TYPE_LIZAN,
			TYPE_DEMONIC,
			TYPE_KANGAROO,
			TYPE_DEER,
			TYPE_PANDA,
			TYPE_MLP,
			TYPE_SUCCUBUS,
			TYPE_KUITAN,
			TYPE_RASKVEL,
		];
		
		public static const VALID_LEG_FLAGS:Array = [
			FLAG_DIGITIGRADE,
			FLAG_PLANTIGRADE,
			FLAG_AMORPHOUS,
			FLAG_SCALED,
			FLAG_FURRED,
			FLAG_TENDRIL,
			FLAG_HOOVES,
			FLAG_PAWS,
			FLAG_HEELS,
		];
		
		public static const VALID_ANTENNAE_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_BEE,
			TYPE_SYDIAN,
		];
		
		public static const VALID_HORN_TYPES:Array = [
			0,
			TYPE_DEMONIC,
			TYPE_BOVINE,
			TYPE_LIZAN,
			TYPE_DEER,
			TYPE_GOAT,
		];
		
		public static const VALID_WING_TYPES:Array = [
			0,
			TYPE_BEE,
			TYPE_SMALLBEE,
			TYPE_SMALLDEMONIC,
			TYPE_SMALLDRACONIC,
			TYPE_SHARK,
			TYPE_AVIAN,
			TYPE_DRAGONFLY,
			TYPE_DRACONIC,
			TYPE_SYLVAN,
			TYPE_DARK_SYLVAN,
		];
		
		// None is for specifying no tail, which would normally pull the HUMAN name.
		// It's going to be overwritten in the SaveEdit UI to save duplicating a lot of name arrays.
		public static const VALID_TAIL_TYPES:Array = [
			0,
			TYPE_LAPINE,
			TYPE_EQUINE,
			TYPE_CANINE,
			TYPE_BOVINE,
			TYPE_CUNTSNAKE,
			TYPE_PANDA,
			TYPE_FELINE,
			TYPE_BEE,
			TYPE_ARACHNID,
			TYPE_DEMONIC,
			TYPE_DRIDER,
			TYPE_SHARK,
			TYPE_SIREN,
			TYPE_LIZAN,
			TYPE_AVIAN,
			TYPE_KANGAROO,
			TYPE_VULPINE,
			TYPE_DRACONIC,
			TYPE_KUITAN,
			TYPE_MOUSE,
			TYPE_BADGER,
			TYPE_RASKVEL,
			TYPE_NAGA,
			TYPE_SYDIAN,
			TYPE_COCKVINE,
			TYPE_OVIR
		];
		
		public static const VALID_TAIL_FLAGS:Array = [
			FLAG_PREHENSILE,
			FLAG_LONG,
			FLAG_FLUFFY,
			FLAG_SMOOTH,
			FLAG_TAILCOCK,
			FLAG_FURRED,
			FLAG_SCALED,
			FLAG_OVIPOSITOR
		];
		
		public static const TAIL_GENITAL_NONE:int 	= 0;
		public static const TAIL_GENITAL_COCK:int	= 1;
		public static const TAIL_GENITAL_VAGINA:int	= 2;
		
		public static const TAIL_GENTIAL_TYPE_NAMES:Array = [
			"None",
			"Cock",
			"Vagina",
		];
		
		public static const TAIL_GENITAL_TYPES:Array = [
			TAIL_GENITAL_NONE,
			TAIL_GENITAL_COCK,
			TAIL_GENITAL_VAGINA,
		];
		
		public static const VALID_TAIL_GENITAL_ARGS:Array = [
			TYPE_HUMAN,
			TYPE_EQUINE,
			TYPE_CANINE,
			TYPE_GOOEY,
			TYPE_SIREN,
		];
		
		//SKINTYPES
		public static const SKIN_TYPE_SKIN:int                                   = 0;
		public static const SKIN_TYPE_FUR:int                                    = 1;
		public static const SKIN_TYPE_SCALES:int                                 = 2;
		public static const SKIN_TYPE_GOO:int                                    = 3;
		public static const SKIN_TYPE_CHITIN:int                                 = 4;
		
		public static const SKIN_TYPE_NAMES:Array = [
			"Skin",
			"Fur",
			"Scales",
			"Goo",
			"Chitin",
		];
				
		//NIPPLETYPES
		public static const NIPPLE_TYPE_NORMAL:int                                 = 0;
		public static const NIPPLE_TYPE_FUCKABLE:int                               = 1;
		public static const NIPPLE_TYPE_LIPPLES:int                                = 2;
		public static const NIPPLE_TYPE_DICK:int                                   = 3;
		public static const NIPPLE_TYPE_FLAT:int                                   = 4;
		public static const NIPPLE_TYPE_INVERTED:int                               = 5;
		public static const NIPPLE_TYPE_TENTACLED:int 							   = 6;
		
		public static const NIPPLE_TYPE_NAMES:Array = [
			"Normal",
			"Fuckable",
			"Lipples",
			"Dick",
			"Flat",
			"Inverted",
			"Tentacled"
		];
		
		public static const VALID_DICKNIPPLE_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_EQUINE,
			TYPE_FELINE,
		];
		
		public static const VALID_NIPPLE_TYPES:Array = [
			NIPPLE_TYPE_NORMAL,
			NIPPLE_TYPE_FUCKABLE,
			NIPPLE_TYPE_LIPPLES,
			NIPPLE_TYPE_DICK,
			NIPPLE_TYPE_FLAT,
			NIPPLE_TYPE_INVERTED,
			NIPPLE_TYPE_TENTACLED,
		];
				
		//CUM & MILK TYPES
		public static const FLUID_TYPE_MILK:int                                 = 0;
		public static const FLUID_TYPE_HONEY:int                                = 1;
		public static const FLUID_TYPE_CUM:int                                  = 2;
		public static const FLUID_TYPE_OIL:int                                  = 3;
		public static const FLUID_TYPE_MILKSAP:int                              = 4;
		public static const FLUID_TYPE_GIRLCUM:int                              = 5;
		public static const FLUID_TYPE_CUMSAP:int								= 6;
		public static const FLUID_TYPE_CHOCOLATE_MILK:int 						= 7;
		public static const FLUID_TYPE_STRAWBERRY_MILK:int 					   	= 8;
		public static const FLUID_TYPE_SYDIAN_CUM:int 							= 9;
		public static const FLUID_TYPE_VANAE_MAIDEN_MILK:int					= 10;
		public static const FLUID_TYPE_VANAE_HUNTRESS_MILK:int					= 11;
		public static const FLUID_TYPE_NECTAR:int 								= 12;
		public static const FLUID_TYPE_LEITHAN_MILK:int							= 13;
		
		public static const FLUID_TYPE_NAMES:Array = [
			"Milk",
			"Honey",
			"Cum",
			"Oil",
			"Milksap",
			"Girlcum",
			"Cumsap",
			"Chocolate Milk",
			"Strawberry Milk",
			"Sydian Cum",
			"Vanae Maiden Milk",
			"Vanae Huntress Milk",
			"Nectar",
			"Leithan Milk",
		];
		
		public static const VALID_CUM_TYPES:Array = [
			FLUID_TYPE_CUM,
			FLUID_TYPE_HONEY,
			FLUID_TYPE_CUMSAP,
			FLUID_TYPE_SYDIAN_CUM,
			FLUID_TYPE_MILK,
		];
		
		public static const VALID_GIRLCUM_TYPES:Array = [
			FLUID_TYPE_GIRLCUM,
			FLUID_TYPE_HONEY,
		];
		
		public static const VALID_MILK_TYPES:Array = [
			FLUID_TYPE_MILK,
			FLUID_TYPE_HONEY,
			FLUID_TYPE_MILKSAP,
			FLUID_TYPE_CHOCOLATE_MILK,
			FLUID_TYPE_STRAWBERRY_MILK,
			FLUID_TYPE_VANAE_MAIDEN_MILK,
			FLUID_TYPE_VANAE_HUNTRESS_MILK,
			FLUID_TYPE_NECTAR,
			FLUID_TYPE_LEITHAN_MILK,
		];
		
		// HAIRTYPES
		public static const HAIR_TYPE_REGULAR:int						= 0;
		public static const HAIR_TYPE_FEATHERS:int						= 1;
		public static const HAIR_TYPE_TRANSPARENT:int					= 2;
		public static const HAIR_TYPE_GOO:int							= 3;
		public static const HAIR_TYPE_TENTACLES:int						= 4;
		
		public static const HAIR_TYPE_NAMES:Array = [
			"Hair",
			"Feathers",
			"Transparent",
			"Gooey",
			"Tentacles",
		];

		public static const GENITAL_SPOT_WAIST:int		= 0;
		public static const GENITAL_SPOT_MIDTAIL:int	= 1;
		public static const GENITAL_SPOT_REARLEGS:int	= 2;
		public static const GENITAL_SPOT_UNDERTAIL:int	= 3;
		
		public static const VALID_GENITAL_SPOTS:Array = [
			GENITAL_SPOT_WAIST,
			GENITAL_SPOT_MIDTAIL,
			GENITAL_SPOT_REARLEGS,
			GENITAL_SPOT_UNDERTAIL,
		];
		
		public static const GENITAL_SPOT_NAMES:Array = [
			"Waist",
			"Mid-tail",
			"Hind legs",
			"Under-tail",
		];
		
		public static const VALID_COCK_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_EQUINE,
			TYPE_CANINE,
			TYPE_FELINE,
			TYPE_DEMONIC,
			TYPE_TENTACLE,
			TYPE_SNAKE,
			TYPE_ANEMONE,
			TYPE_SIREN,
			TYPE_KANGAROO,
			TYPE_DRACONIC,
			TYPE_BEE,
			TYPE_SIMII,
			TYPE_RASKVEL,
		];
		
		public static const VALID_COCK_FLAGS:Array = [
			FLAG_PREHENSILE,
			FLAG_FLARED,
			FLAG_KNOTTED,
			FLAG_SHEATHED,
			FLAG_STINGER_BASED,
			FLAG_TAPERED,
			FLAG_STINGER_TIPPED,
			FLAG_NUBBY,
			FLAG_AMORPHOUS,
			FLAG_BLUNT,
			FLAG_SMOOTH,
		];
		
		public static const VALID_VAGINA_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_EQUINE,
			TYPE_LEITHAN,
			TYPE_BEE,
			TYPE_SYNTHETIC,
			TYPE_LAPINARA,
			TYPE_VANAE,
			TYPE_KUITAN,
		];
		
		// As far as I can tell, at time of writing there are no flags currently used/assigned to vaginas
		// So I'm winging it.
		public static const VALID_VAGINA_FLAGS:Array = [
			FLAG_LUBRICATED,
			FLAG_APHRODISIAC_LACED,
			FLAG_TENDRIL,
			FLAG_NUBBY,
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
		public static const NOFAP:int 								   = 11;
		public static const LIFTUP:int 								   = 12;
		public static const LIFTDOWN:int 								= 13;
		public static const TAXI:int    								= 14;
		public static const PUBLIC:int 									= 15;
		public static const PRIVATE:int									= 16;
		public static const FAPPING_ILLEGAL:int							= 17;
		public static const NUDITY_ILLEGAL:int							= 18;
		public static const CAVE:int									= 19;
		public static const FOREST:int									= 20;
		public static const JUNGLE:int									= 21;
		public static const DESERT:int									= 22;
		public static const PLANE:int									= 23;
		public static const PLANT_BULB:int								= 24;
		
		// Temp flag alias whilst the asset gets introduced
		public static const LIFT:int = OBJECTIVE;

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
		public static const GADGET:int 								   = 13;
		public static const EXPLOSIVECONSUMABLE:int					   = 14;
		public static const QUESTITEM:int							   = 15;

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

		// ITEM FLAGS
		public static const ITEM_FLAG_BOW_WEAPON:int					= 0;
		public static const ITEM_FLAG_ENERGY_WEAPON:int					= 1;
		
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
		public static const SEXPREF_SMALL_MALEBITS:int = 13;
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
		public static const SEXPREF_NEUTER:int = 26
		
		public static const MAX_SEXPREF_VALUE:int = 27; // Keep this as a book-end on the values. Check penny for how you'd random shit
		
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
			"Neuters",
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

		public static const CHILD_TYPE_LIVE:uint = 1;
		public static const CHILD_TYPE_EGGS:uint = 2;
		public static const CHILD_TYPE_SEED:uint = 3;
	}
}