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
			"Tech Specialist",
		];
		
		public static const UPBRINGING_PAMPERED:uint						= 0;
		public static const UPBRINGING_ATHLETIC:uint						= 1;
		public static const UPBRINGING_BOOKWORM:uint						= 2;
		public static const UPBRINGING_AUSTERE:uint							= 3;
		public static const UPBRINGING_BALANCED:uint						= 4;
		public static const UPBRINGING_SLUTTY:uint							= 5;
		public static const MAX_UPBRINGINGS:uint							= 6;
		
		public static const UPBRINGING_NAMES:Array = [
			"Pampered",
			"Athletic",
			"Bookworm",
			"Austere",
			"Balanced",
			"Slutty",
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
		public static const FLAG_FEATHERED:int								= 35;
		public static const FLAG_DOUBLE_HEADED:int							= 36;
		public static const FLAG_GOOEY:int									= 37;
		public static const FLAG_SPIKED:int									= 38;
		public static const FLAG_ABSORBENT:int								= 39;
		public static const FLAG_SLIGHTLY_PUMPED:int 						= 40;
		public static const FLAG_PUMPED:int 								= 41;
		public static const FLAG_TAILCUNT:int                               = 42;
		public static const FLAG_BEAK:int									= 43;
		public static const FLAG_CORKSCREWED:int							= 44;
		public static const FLAG_TONGUE:int									= 45;
		public static const FLAG_FRECKLED:int                               = 46;
		public static const FLAG_PLUGGED:int                   	            = 47;
		public static const FLAG_SCALED_PRETTY:int                          = 48;
		public static const FLAG_SHORT:int									= 49;
		public static const FLAG_FLOPPY:int									= 50; //Not for dicks, lol. Mostly for differentiating rabbit ears right now, but perhaps another use will arise down the road. Might be good for tails to help differentate tails with no muscular control
		public static const FLAG_HYPER_PUMPED:int 							= 51;
		public static const FLAG_HEART_SHAPED:int							= 52;
		public static const FLAG_STAR_SHAPED:int							= 53;
		public static const FLAG_FLOWER_SHAPED:int							= 54;

		
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
			"Ribbed",
			"Chitinous",
			"Feathered",
			"Double Headed",
			"Gooey",
			"Spiked",
			"Absorbent",
			"Slightly Pumped",
			"Fully Pumped",
			"Tailcunt",
			"Beaked",
			"Corkscrewed",
			"Tongued",
			"Freckled",
			"Plugged",
			"Partially Scaled",
			"Short",
			"Floppy",
			"Hyper Pumped",
			"Heart-Shaped",
			"Star-Shaped",
			"Flower-Shaped",
		];
		
		public static const VALID_SKIN_FLAGS:Array = [
			FLAG_SMOOTH,
			FLAG_THICK,
			FLAG_STICKY,
			FLAG_FLUFFY,
			FLAG_SQUISHY,
			FLAG_LUBRICATED,
			FLAG_ABSORBENT,
			FLAG_SCALED_PRETTY,
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
		public static const TYPE_CENTAUR:int                                = GLOBAL.TYPE_EQUINE;
		public static const TYPE_FROG:int                                   = 14;
		public static const TYPE_DEMONIC:int                                = 15;
		public static const TYPE_GOOEY:int                                  = 16;
		public static const TYPE_KANGAROO:int                               = 17;
		public static const TYPE_GABILANI:int                               = 18;
		public static const TYPE_TANUKI:int                                 = 24; //Changed from 18 to 24 soz is the same as kui-tan
		public static const TYPE_SHARK:int                                  = 19;
		public static const TYPE_SIREN:int                                  = 20;
		public static const TYPE_SUULA:int                                  = GLOBAL.TYPE_SIREN;
		public static const TYPE_DEER:int                                   = 21;
		public static const TYPE_ANEMONE:int                                = 22;
		public static const TYPE_TENTACLE:int                               = 23;
		public static const TYPE_KUITAN:int                                 = 24;
		public static const TYPE_HUMANMASKED:int                            = 25;
		public static const TYPE_MOUSE:int                                  = 26;
		public static const TYPE_MOUSEMAN:int                               = 27;
		public static const TYPE_DOVE:int									= 28;
		public static const TYPE_DOGGIE:int									= 29;
		public static const TYPE_DRYAD:int                                  = 30;
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
		public static const TYPE_MYR:int 									= 60;
		public static const TYPE_SAURIAN:int								= 61;
		public static const TYPE_RHINO:int									= 62;
		public static const TYPE_NARWHAL:int								= 63;
		public static const TYPE_HRAD:int									= 64;
		public static const TYPE_GRYVAIN:int								= 65;
		public static const TYPE_KORGONNE:int								= 66;
		public static const TYPE_FLOWER:int									= 67;
		public static const TYPE_WATERQUEEN:int								= 68;
		public static const TYPE_BOTHRIOC:int								= 69;
		public static const TYPE_MILODAN:int								= 70;
		public static const TYPE_WORG:int									= 71;
		public static const TYPE_SWINE:int									= 72;
		public static const TYPE_QUAD_LAPINE:int 							= 73;
		public static const TYPE_MOUTHGINA:int 								= 74;
		public static const TYPE_LUPINE:int 								= 75;
		public static const TYPE_SHEEP:int 									= 76;
		public static const TYPE_REDPANDA:int 								= 77;
		public static const TYPE_RAHN:int 									= 78;
		public static const TYPE_THRAGGEN:int 								= 79;
		public static const TYPE_ADREMMALEX:int 							= 80;
		public static const TYPE_MOTHRINE:int 								= 81;
		public static const TYPE_FROSTWYRM:int 								= 82;
		public static const TYPE_SANDWORM:int 								= 83;
		public static const TYPE_SANDWORM_PARASITE:int 						= 84;
		public static const TYPE_JANERIA:int								= 85;
		public static const TYPE_ROEHM:int									= 86;
		public static const TYPE_XHELARFOG:int								= 87;
		public static const TYPE_SAURMORIAN:int								= 88;
		public static const TYPE_HYENA:int									= 89;
		public static const TYPE_DZAAN:int									= 90;
		
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
			"Frog",
			"Demonic",
			"Gooey",
			"Kangaroo",
			"Gabilani",
			"Shark",
			"Suula",
			"Deer",
			"Anemone",
			"Tentacle",
			"Kui-tan",
			"Human Masked",
			"Mouse",
			"Mouseman",
			"Dove",
			"Floppy Dog",
			"Dryad",
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
			"Dark Sylvan",
			"Myr",
			"Saurian",
			"Rhino",
			"Narwhal",
			"Hradian",
			"Gryvain",
			"Korgonne",
			"Flower",
			"Water Queen",
			"Bothrioc",
			"Milodan",
			"Worg",
			"Swine",
			"Quad Lapine",
			"Mouthgina",
			"Lupine",
			"Sheep",
			"Lesser Panda",
			"Rahn",
			"Thraggen",
			"Adremmalex",
			"Mothrine",
			"Frostwyrm",
			"Sand Worm",
			"Butt Bug",
			"Janeria",
			"Roehm",
			"Xhelarfog",
			"Saurmorian",
			"Hyena",
			"Dzaan",
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
			TYPE_GABILANI,
			TYPE_FROG,
			TYPE_WORG,
			TYPE_SWINE,
			TYPE_LUPINE,
			TYPE_SHEEP,
			TYPE_REDPANDA,
			TYPE_FROSTWYRM,
			TYPE_XHELARFOG,
			TYPE_SAURMORIAN,
			TYPE_HYENA,
			TYPE_DEER,
		];
		
		public static const VALID_FACE_FLAGS:Array = [
			FLAG_LONG,
			FLAG_SMOOTH,
			FLAG_MUZZLED,
			FLAG_ANGULAR,
			FLAG_BEAK,
			FLAG_FRECKLED,
		];
		
		public static const VALID_EYE_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_ARACHNID,
			TYPE_FELINE,
			TYPE_SNAKE,
			TYPE_SYNTHETIC,
			TYPE_LEITHAN,
			TYPE_BEE,
			TYPE_MYR,
			TYPE_GABILANI,
			TYPE_DEMONIC,
			TYPE_FROG,
			TYPE_NYREA,
			TYPE_GRYVAIN,
			TYPE_SHEEP,
			TYPE_COCKVINE,
			TYPE_JANERIA,
			TYPE_FROSTWYRM,
			TYPE_XHELARFOG,
			TYPE_SAURMORIAN,
			TYPE_DEER,
		];
		
		public static const VALID_TONGUE_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_NAGA,
			TYPE_DEMONIC,
			TYPE_DRACONIC,
			TYPE_LEITHAN,
			TYPE_OVIR,
			TYPE_LAPINE,
			TYPE_EQUINE,
			TYPE_CANINE,
			TYPE_FELINE,
			TYPE_BOVINE,
			TYPE_RASKVEL,
			TYPE_GOOEY,
			TYPE_BEE,
			TYPE_FROG,
			TYPE_TENTACLE,
			TYPE_FROSTWYRM,
		];
		
		public static const VALID_TONGUE_FLAGS:Array = [
			FLAG_LONG,
			FLAG_PREHENSILE,
			FLAG_HOLLOW,
			FLAG_LUBRICATED,
			FLAG_SQUISHY,
			FLAG_APHRODISIAC_LACED,
			FLAG_GOOEY,
			FLAG_STICKY,
			FLAG_NUBBY,
			FLAG_TAPERED,
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
			TYPE_DEER,
			TYPE_VULPINE,
			TYPE_DEMONIC,
			TYPE_DRACONIC,
			TYPE_KUITAN,
			TYPE_MOUSE,
			TYPE_PANDA,
			TYPE_HUMAN,
			TYPE_LEITHAN,
			TYPE_OVIR,
			TYPE_RASKVEL,
			TYPE_VANAE,
			TYPE_SYLVAN,
			TYPE_GABILANI,
			TYPE_FROG,
			TYPE_GRYVAIN,
			TYPE_SWINE,
			TYPE_QUAD_LAPINE,
			TYPE_DOGGIE,
			TYPE_LUPINE,
			TYPE_SHEEP,
			TYPE_REDPANDA,
			TYPE_FROSTWYRM,
			TYPE_SAURMORIAN,
			TYPE_HYENA,
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
			TYPE_LEITHAN,
			TYPE_KUITAN,
			TYPE_OVIR,
			TYPE_MYR,
			TYPE_VULPINE,
			TYPE_DEMONIC,
			TYPE_NYREA,
			TYPE_FLOWER,
			TYPE_TENTACLE,
			TYPE_LUPINE,
			TYPE_REDPANDA,
			TYPE_FROSTWYRM,
			TYPE_SAURMORIAN,
			TYPE_HYENA,
		];

		public static const VALID_ARM_FLAGS:Array = [
			FLAG_SMOOTH,
			FLAG_AMORPHOUS,
			FLAG_FURRED,
			FLAG_SCALED,
			FLAG_CHITINOUS,
			FLAG_FEATHERED,
			FLAG_GOOEY,
			FLAG_SPIKED,
			FLAG_STICKY,
			FLAG_PAWS,
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
			TYPE_OVIR,
			TYPE_MYR,
			TYPE_FROG,
			TYPE_NYREA,
			TYPE_GRYVAIN,
			TYPE_SWINE,
			TYPE_TENTACLE,
			TYPE_LUPINE,
			TYPE_SHEEP,
			TYPE_REDPANDA,
			TYPE_MOUSE,
			TYPE_JANERIA,
			TYPE_FROSTWYRM,
			TYPE_SAURMORIAN,
			TYPE_HYENA,
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
			FLAG_PREHENSILE,
			FLAG_SMOOTH,
			FLAG_CHITINOUS,
			FLAG_FEATHERED,
			FLAG_GOOEY,
			FLAG_STICKY,
		];
		
		public static const VALID_ANTENNAE_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_BEE,
			TYPE_SYDIAN,
			TYPE_MYR,
			TYPE_HRAD,
		];
		
		public static const VALID_HORN_TYPES:Array = [
			0,
			TYPE_DEMONIC,
			TYPE_BOVINE,
			TYPE_LIZAN,
			TYPE_DRACONIC,
			TYPE_DEER,
			TYPE_GOAT,
			TYPE_RHINO,
			TYPE_NARWHAL,
			TYPE_GRYVAIN,
			TYPE_DRYAD,
			TYPE_SHEEP,
			TYPE_FROSTWYRM,
			TYPE_XHELARFOG,
			TYPE_SAURMORIAN,
		];
		
		public static const VALID_WING_TYPES:Array = [
			0,
			TYPE_BEE,
			TYPE_SMALLBEE,
			TYPE_SMALLDEMONIC,
			TYPE_SMALLDRACONIC,
			TYPE_SHARK,
			TYPE_AVIAN,
			TYPE_DEMONIC,
			TYPE_DRAGONFLY,
			TYPE_DRACONIC,
			TYPE_SYLVAN,
			TYPE_DARK_SYLVAN,
			TYPE_MYR,
			TYPE_DOVE,
			TYPE_GRYVAIN,
			TYPE_COCKVINE,
			TYPE_TENTACLE,
			TYPE_JANERIA,
			TYPE_FROSTWYRM,
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
			TYPE_DEER,
			TYPE_MOUSE,
			TYPE_BADGER,
			TYPE_RASKVEL,
			TYPE_NAGA,
			TYPE_SYDIAN,
			TYPE_COCKVINE,
			TYPE_VANAE,
			TYPE_OVIR,
			TYPE_MYR,
			TYPE_FROG,
			TYPE_GRYVAIN,
			TYPE_SWINE,
			TYPE_TENTACLE,
			TYPE_DOGGIE,
			TYPE_LUPINE,
			TYPE_SHEEP,
			TYPE_REDPANDA,
			TYPE_FROSTWYRM,
			TYPE_XHELARFOG,
			TYPE_SAURMORIAN,
			TYPE_HYENA,
		];
		
		public static const VALID_TAIL_FLAGS:Array = [
			FLAG_PREHENSILE,
			FLAG_LONG,
			FLAG_FLUFFY,
			FLAG_SMOOTH,
			FLAG_TAILCOCK,
			FLAG_TAILCUNT,
			FLAG_FURRED,
			FLAG_SCALED,
			FLAG_OVIPOSITOR,
			FLAG_THICK,
			FLAG_STINGER_TIPPED,
			FLAG_CHITINOUS,
			FLAG_FEATHERED,
			FLAG_FLARED,
			FLAG_SHEATHED,
			FLAG_KNOTTED,
			FLAG_RIBBED,
			FLAG_NUBBY,
			FLAG_GOOEY,
			FLAG_STICKY,
			FLAG_TAPERED,
			FLAG_CORKSCREWED,
			FLAG_SHORT,
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
			TYPE_COCKVINE,
			TYPE_GRYVAIN,
			TYPE_FELINE,
			TYPE_VULPINE,
			TYPE_FLOWER,
			TYPE_TENTACLE,
		];
		
		//SKINTYPES
		public static const SKIN_TYPE_SKIN:int                                   = 0;
		public static const SKIN_TYPE_FUR:int                                    = 1;
		public static const SKIN_TYPE_SCALES:int                                 = 2;
		public static const SKIN_TYPE_GOO:int                                    = 3;
		public static const SKIN_TYPE_CHITIN:int                                 = 4;
		public static const SKIN_TYPE_FEATHERS:int                               = 5;
		public static const SKIN_TYPE_LATEX:int                                  = 6;
		public static const SKIN_TYPE_PLANT:int                                  = 7;
		public static const SKIN_TYPE_BARK:int                                   = 8;
		public static const SKIN_TYPE_GEL:int                                    = 9;
		
		public static const SKIN_TYPE_NAMES:Array = [
			"Skin",
			"Fur",
			"Scales",
			"Goo",
			"Chitin",
			"Feathers",
			"Latex",
			"Plant",
			"Bark",
			"Gel",
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
			"Cunt",
			"Lip",
			"Dick",
			"Flat",
			"Inverted",
			"Tentacled",
		];
		
		public static const VALID_DICKNIPPLE_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_EQUINE,
			TYPE_CANINE,
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
		
		public static const VALID_AREOLA_FLAGS:Array = [
			FLAG_PUMPED,
			FLAG_HEART_SHAPED,
			FLAG_STAR_SHAPED,
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
		public static const FLUID_TYPE_GABILANI_CUM:int							= 14;
		public static const FLUID_TYPE_GABILANI_GIRLCUM:int						= 15;
		public static const FLUID_TYPE_VANILLA:int								= 16;
		public static const FLUID_TYPE_NYREA_CUM:int							= 17;
		//Why special? Cause it matches yer goo color.
		public static const FLUID_TYPE_SPECIAL_GOO:int							= 18;
		public static const FLUID_TYPE_CHOCOLATE_CUM:int						= 19;
		public static const FLUID_TYPE_VANAE_CUM:int							= 20;
		public static const FLUID_TYPE_NYREA_GIRLCUM:int						= 21;
		public static const FLUID_TYPE_BLUEBERRY_YOGURT:int						= 22;
		public static const FLUID_TYPE_HRAD_CUM:int								= 23;
		public static const FLUID_TYPE_SPECIAL_CUMGOO:int						= 24;
		public static const FLUID_TYPE_FRUIT_CUM:int							= 25;
		public static const FLUID_TYPE_FRUIT_GIRLCUM:int						= 26;
		public static const FLUID_TYPE_EGGNOG:int								= 27;
		public static const FLUID_TYPE_PEPPERMINT:int							= 28;
		public static const FLUID_TYPE_SUGAR:int								= 29;
		public static const FLUID_TYPE_CUNDARIAN_SEED:int						= 30;
		
		public static const FLUID_TYPE_NAMES:Array = [
			"Milk",
			"Honey",
			"Cum",
			"Oil",
			"Milksap",
			"Girl Cum",
			"Cumsap",
			"Chocolate Milk",
			"Strawberry Milk",
			"Sydian Cum",
			"Vanae Maiden Milk",
			"Vanae Huntress Milk",
			"Nectar",
			"Leithan Milk",
			"Gabilani Cum",
			"Gabilani Girl Cum",
			"Vanilla",
			"Nyrea Cum",
			"Goo",
			"Chocolate Cum",
			"Vanae Cum",
			"Nyrea Girl Cum",
			"Blueberry Yogurt",
			"Hradian Cum",
			"Goo Cum",
			"Fruit Cum",
			"Fruit Girl Cum",
			"Eggnog",
			"Peppermint Cum",
			"Sugar Glaze",
		];
		
		public static const FLUID_TYPE_SHORT:Array = [
			"Milk",
			"Honey",
			"Cum",
			"Oil",
			"M.Sap",
			"GCum",
			"C.Sap",
			"C.Milk",
			"S.Milk",
			"S.Cum",
			"VM.Mlk",
			"VH.Mlk",
			"Nectar",
			"L.Milk",
			"G.Cum",
			"G.GCum",
			"V.Milk",
			"N.Cum",
			"Goo",
			"C.Cum",
			"V.Cum",
			"N.GCum",
			"B.Ygrt",
			"H.Cum",
			"GooCum",
			"F.Cum",
			"F.GCum",
			"Eggnog",
			"Mint.C",
			"Sugar",
		];
		
		public static const VALID_CUM_TYPES:Array = [
			FLUID_TYPE_CUM,
			FLUID_TYPE_HONEY,
			FLUID_TYPE_CUMSAP,
			FLUID_TYPE_SYDIAN_CUM,
			FLUID_TYPE_MILK,
			FLUID_TYPE_CHOCOLATE_MILK,
			FLUID_TYPE_STRAWBERRY_MILK,
			FLUID_TYPE_VANILLA,
			FLUID_TYPE_NYREA_CUM,
			FLUID_TYPE_GABILANI_CUM,
			FLUID_TYPE_SPECIAL_GOO,
			FLUID_TYPE_CHOCOLATE_CUM,
			FLUID_TYPE_HRAD_CUM,
			FLUID_TYPE_VANAE_CUM,
			FLUID_TYPE_SPECIAL_CUMGOO,
			FLUID_TYPE_FRUIT_CUM,
			FLUID_TYPE_EGGNOG,
			FLUID_TYPE_PEPPERMINT,
			FLUID_TYPE_SUGAR,
		];
		
		public static const VALID_GIRLCUM_TYPES:Array = [
			FLUID_TYPE_GIRLCUM,
			FLUID_TYPE_HONEY,
			FLUID_TYPE_CHOCOLATE_MILK,
			FLUID_TYPE_STRAWBERRY_MILK,
			FLUID_TYPE_VANILLA,
			FLUID_TYPE_GABILANI_GIRLCUM,
			FLUID_TYPE_SPECIAL_GOO,
			FLUID_TYPE_NYREA_GIRLCUM,
			FLUID_TYPE_HRAD_CUM,
			FLUID_TYPE_FRUIT_GIRLCUM,
			FLUID_TYPE_SUGAR,
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
			FLUID_TYPE_VANILLA,
			FLUID_TYPE_CUM,
			FLUID_TYPE_GIRLCUM,
			FLUID_TYPE_BLUEBERRY_YOGURT,
			FLUID_TYPE_SUGAR,
		];
		
		// HAIRTYPES
		public static const HAIR_TYPE_REGULAR:int						= 0;
		public static const HAIR_TYPE_HAIR:int							= HAIR_TYPE_REGULAR;
		public static const HAIR_TYPE_FEATHERS:int						= 1;
		public static const HAIR_TYPE_TRANSPARENT:int					= 2;
		public static const HAIR_TYPE_GOO:int							= 3;
		public static const HAIR_TYPE_TENTACLES:int						= 4;
		public static const HAIR_TYPE_QUILLS:int						= 5;
		public static const HAIR_TYPE_PLANT:int							= 6;
		
		public static const HAIR_TYPE_NAMES:Array = [
			"Hair",
			"Feathers",
			"Transparent",
			"Gooey",
			"Tentacles",
			"Quills",
			"Plant",
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
			TYPE_KUITAN,
			TYPE_VENUSPITCHER,
			TYPE_SAURIAN,
			TYPE_SYNTHETIC,
			TYPE_NYREA,
			TYPE_DAYNAR,
			TYPE_SYDIAN,
			TYPE_COCKVINE,
			TYPE_INHUMAN,
			TYPE_GABILANI,
			TYPE_HRAD,
			TYPE_GRYVAIN,
			TYPE_SWINE,
			TYPE_FROSTWYRM,
			TYPE_JANERIA,
			TYPE_SAURMORIAN,
			TYPE_DEER,
		];
		
		public static const VALID_COCK_FLAGS:Array = [
			FLAG_LUBRICATED,
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
			FLAG_FORESKINNED,
			FLAG_APHRODISIAC_LACED,
			FLAG_STICKY,
			FLAG_OVIPOSITOR,
			FLAG_RIBBED,
			FLAG_DOUBLE_HEADED,
			FLAG_GOOEY,
			FLAG_CORKSCREWED,
		];
		
		public static const VALID_VAGINA_TYPES:Array = [
			TYPE_HUMAN,
			TYPE_EQUINE,
			TYPE_LEITHAN,
			TYPE_BEE,
			TYPE_DEER,
			TYPE_VULPINE,
			TYPE_SYNTHETIC,
			TYPE_LAPINARA,
			TYPE_VANAE,
			TYPE_KUITAN,
			TYPE_NAGA,
			TYPE_CANINE,
			TYPE_GOOEY,
			TYPE_SIREN,
			TYPE_GABILANI,
			TYPE_NYREA,
			TYPE_GRYVAIN,
			TYPE_FLOWER,
			TYPE_SWINE,
			TYPE_MOUTHGINA,
			TYPE_FROSTWYRM,
			TYPE_SAURMORIAN,
		];
		
		// As far as I can tell, at time of writing there are no flags currently used/assigned to vaginas
		// So I'm winging it.
		public static const VALID_VAGINA_FLAGS:Array = [
			FLAG_LUBRICATED,
			FLAG_APHRODISIAC_LACED,
			FLAG_STINGER_BASED,
			FLAG_STINGER_TIPPED,
			FLAG_NUBBY,
			FLAG_OVIPOSITOR,
			FLAG_GOOEY,
			FLAG_SLIGHTLY_PUMPED,
			FLAG_PUMPED,
			FLAG_CORKSCREWED,
			FLAG_TONGUE,
			FLAG_PLUGGED,
			FLAG_RIBBED,
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
		public static const ICYTUNDRA:int							    = 25;
		public static const FROZENTUNDRA:int							= 26;
		public static const SHIPINTERIOR:int							= 27; // Used to flag all rooms of player-own ships.
		public static const POOL:int									= 28;
		public static const WATERFALL:int								= 29;
		public static const SPIDER_WEB:int								= 30;
		public static const LOW_GRAVITY:int								= 31;
		public static const NURSERY:int									= 32; //used to mark all rooms in tavros nursery
		public static const LOW_TECH:int								= 33; //used to mark rooms where the inhabitants wouldn't own regular space tech (see InRoomWithPhones)
		public static const FIRST_AID:int								= 34;
		
		// Temp flag alias whilst the asset gets introduced
		public static const LIFT:int = OBJECTIVE;

		//PLOT FLAGS
		public static const RECRUITED_CELISE:int                       = 0;
		public static const CELISE_ONBOARD:int                         = 1;
		public static const TIMES_CELISE_IN_BALLS:int                  = 2;

		//ITEM TYPES
		public static const PILL:int									= 0; // Used for medicinal/misc and mostly legal drugs.
		public static const FOOD:int									= 1; // Used for consumable food items.
		public static const POTION:int									= 2; // Used for drinks/recovery items.
		public static const MELEE_WEAPON:int							= 3;
		public static const RANGED_WEAPON:int							= 4;
		public static const ARMOR:int									= 5;
		public static const SHIELD:int									= 6;
		public static const UPPER_UNDERGARMENT:int 						= 7;
		public static const LOWER_UNDERGARMENT:int 						= 8;
		public static const ACCESSORY:int 								= 9;
		public static const DRUG:int									= 10; // Used for illegal or detrimental drugs/consumables.
		public static const CLOTHING:int 								= 11;
		public static const ALL:int										= 12; // Used for pawn shops!
		public static const GADGET:int 									= 13; // Used for devices/appliances.
		public static const EXPLOSIVECONSUMABLE:int						= 14;
		public static const QUEST_ITEM:int								= 15; // Used for quest-related items.
		public static const GEM:int 									= 16; // Used for very valuable items.
		public static const SEXTOY:int 									= 17; // Used for any portable sexual relief devices.
		public static const PIERCING:int 								= 18; // Used for piercings
		public static const COCKWEAR:int 								= 19; // Used for cockwear
		
		public static const ITEM_TYPE_NAMES:Array = [
			"Pill",
			"Food",
			"Potion",
			"Melee Weapon",
			"Ranged Weapon",
			"Armor",
			"Shield",
			"Upper Undergarment",
			"Lower Undergarment",
			"Accessory",
			"Drug",
			"Clothing",
			"All",
			"Gadget",
			"Explosive",
			"Quest Item",
			"Gem",
			"Sex Toy",
			"Piercing",
			"Cockwear",
		];

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
		public static const NOT_CONSUMED_BY_DEFAULT:int 				= 2;
		public static const ITEM_FLAG_EFFECT_FLURRYBONUS:int			= 3; // Equipping the items removes the additional miss-chances from flurry attacks.
		public static const ITEM_FLAG_AIRTIGHT:int 						= 4; // Used for space suits and the like.
		public static const ITEM_FLAG_SWIMWEAR:int						= 5; // Used specifically for swimming attire.
		public static const ITEM_FLAG_EXPOSE_FULL:int					= 6; // Used specifically for attire that exposes nipples/breasts and genitals/asshole to the elements.
		public static const ITEM_FLAG_LUST_WEAPON:int					= 7; // Used specifically for lust-exclusive weapons (that don't do physical damage).
		public static const ITEM_FLAG_POWER_ARMOR:int					= 8; // An item designed to be used with power armor.
		public static const ITEM_FLAG_EXPOSE_CHEST:int					= 9; // Used specifically for clothing/armor that exposes nipples/breasts to the elements.
		public static const ITEM_FLAG_EXPOSE_GROIN:int					= 10; // Used specifically for clothing/armor that exposes genitals to the elements.
		public static const ITEM_FLAG_EXPOSE_ASS:int					= 11; // Used specifically for clothing/armor that exposes asshole to the elements.
		public static const ITEM_FLAG_HEATBELT:int						= 12;
		public static const ITEM_FLAG_HEAT_GENERATOR:int				= 13; // Some other item that provides total avoidance of damage from cold, but not nessecerily a belt.
		public static const ITEM_FLAG_REDUCED_ACCURACY:int				= 14;
		public static const ITEM_FLAG_COMBAT_DRONE:int					= 15; // For combat drones
		public static const ITEM_FLAG_INTERNAL_POWER:int				= 16; // For drones that do not require shields in order to function.
		public static const ITEM_FLAG_UNDROPPABLE:int					= 17; // For items that cannot be dropped.
		public static const ITEM_FLAG_TRANSPARENT:int					= 18; // Used specifically for clothing/armor that is see-through.
		public static const ITEM_FLAG_ANTIGRAV:int						= 19; // Used for items that can levitate heavy parts.
		public static const ITEM_FLAG_BLIND_IGNORE:int 					= 20; // Used for items with no penalties for blind-fire.
		public static const ITEM_FLAG_COVER_BODY:int					= 21; // Used specifically for accessories that cover the body (like duster jackets).
		public static const ITEM_FLAG_SKIN_TIGHT:int					= 22; // Used specifically for items that are body conforming (like goo armor and omnisuit).
		public static const ITEM_FLAG_VAGINAL_CHASTITY:int 				= 23; //Used for undies that prevent penetration. Y u do dis, Nonesuch?
		public static const ITEM_FLAG_ANAL_CHASTITY:int 				= 24; //Used for undies that prevent penetration. Y u do dis, Nonesuch?
		public static const ITEM_FLAG_VAGINALLY_SEALED:int 				= 25; //For undies that seal in cumflation :3
		public static const ITEM_FLAG_ANALLY_SEALED:int 				= 26; //For undies that seal in Kiro's enormous loads.
		public static const ITEM_FLAG_HIGH_PHYSIQUE:int 				= 27; //For items that require high physique - 66%+, rounded up.
		public static const ITEM_FLAG_PIERCING_MULTIPLE:int 			= 28; //For piercings that are multiple - IE, will fit on both ears or all 
		public static const ITEM_FLAG_PIERCING_STUD:int 				= 29; //Piercings of the "stud" type.
		public static const ITEM_FLAG_PIERCING_RING:int 				= 30; //Piercings of the "ring" type.
		public static const ITEM_FLAG_PIERCING_CHAINS:int 				= 31; //Piercings of the "chain" type.
		public static const ITEM_FLAG_NO_REMOVE:int 					= 32; //Worn items that the PC cannot remove by themself.
		public static const ITEM_FLAG_SMALL_DICK_ONLY:int               = 33; //Cockwear can only be equipped by smol
		public static const ITEM_FLAG_SHELTER:int						= 34; // For items that regulate environmental effects.
		public static const ITEM_FLAG_STRETCHY:int						= 35; // Increases sexiness buff if related body part is big. Doubles as Transparent flag at 20+;
		public static const ITEM_FLAG_RIFLE_WEAPON:int					= 36; //For outputing that a gun is a rifle
		public static const ITEM_FLAG_PISTOL_WEAPON:int					= 37; //For outputing that a gun is a pistol
		public static const ITEM_FLAG_SHOTGUN_WEAPON:int				= 38; //For outputing that a gun is a shotgun
		public static const ITEM_FLAG_THROWER_WEAPON:int				= 39; //For outputing that a gun is a thrower
		public static const ITEM_FLAG_LAUNCHER_WEAPON:int				= 40; //For outputing that a gun is a Launcher
		public static const ITEM_FLAG_TOGGLED_OFF:int 					= 41; //For spaceships weapons being toggled off to save power.
		public static const ITEM_FLAG_TWINSHOT:int 						= 42; //For weapons that fire twice.
		public static const ITEM_FLAG_BURSTSHOT:int 						= 43; //For weapons that fire thrice.
		public static const ITEM_FLAG_QUADSHOT:int 						= 44; //For weapons that fire QUAD DAMAGE.
		public static const ITEM_FLAG_SHIP_EQUIPMENT:int 				= 45; //For things equipped on ships
		public static const ITEM_FLAG_TURRET:int 						= 46; //For things equipped on ships
		public static const ITEM_FLAG_PIERCING_BAR:int 					= 47; //Piercings of the "bar" type.
		public static const ITEM_FLAG_PIERCING_HOOP:int 				= 48; //Piercings of the "hoop" type.
		public static const ITEM_FLAG_COCKSOCK:int 						= 49; //For cocksock-type cockwear.
		public static const ITEM_FLAG_COCKRING:int 						= 50; //For cockring-type cockwear.
		public static const ITEM_FLAG_ALCOHOLIC:int						= 51; //For hooch
		public static const ITEM_FLAG_MEDICINE:int						= 52; //For things that can cure disease, NOT WOUNDS
		
		public static const ITEM_FLAG_NAMES:Array = [
			"Bow Weapon",
			"Energy Weapon",
			"Non-consumable",
			"Bonus Hit Rate",
			"Airtight",
			"Swimwear",
			"Fully Exposed",
			"Lust Weapon",
			"Power Armor",
			"Chest Exposed",
			"Groin Exposed",
			"Ass Exposed",
			"Heat Belt",
			"Heat Generator",
			"Reduces Accuracy",
			"Combat Drone",
			"Self-Powered",
			"Undroppable",
			"Transparent",
			"Anti-Gravity",
			"Ignores Blindness",
			"Covers Body",
			"Body Conforming",
			"Vaginal Chastity",
			"Anal Chastity",
			"Vaginal Cum-Sealed",
			"Anal Cum-Sealed",
			"Requires High Physique",
			"Multiples",
			"Stud",
			"Ring",
			"Chained",
			"Permanent",
			"Requires Small Cock",
			"Shelter",
			"Stretchable",
			"Rifle",
			"Pistol",
			"Shotgun",
			"Thrower",
			"Launcher",
			"Disabled",
			"Double Shot",
			"Burst Fire",
			"Full-Auto Fire",
			"Ship Equipment",
			"Crewed Turret",
			"Bar",
			"Hoop",
			"Cocksock",
			"Cockring",
		];
		
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
		public static const SEXPREF_SWEAT:int = 27
		public static const SEXPREF_CUMMY:int = 28
		//"racial" type
		public static const SEXPREF_FURRIES:int = 29
		public static const SEXPREF_SCALIES:int = 30
		public static const SEXPREF_FEATHERS:int = 31
		public static const SEXPREF_CHITIN:int = 32
		
		public static const MAX_SEXPREF_VALUE:int = 33; // Keep this as a book-end on the values. Check penny for how you'd random shit
		
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
			"Sweat",
			"Sexjuice coatings",
			"Furries",
			"Scalies",
			"Feathers",
			"Chitin",
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
		
		public static const STATUS_NEUTRAL:uint = 0xFFFFFF;
		public static const STATUS_BAD:uint = 0xFF0000;
		public static const STATUS_GOOD:uint = 0x00FF00;
		
		// The list of possible artists that we can pull busts for- each one has a seperate class rather than
		// the singular override being the fallback, and we need it to be like this for instances where we
		// have multiple fallbacks for any given character, and we want to let people select them.
		public static const VALID_ARTISTS:Array = [
			"NONE",
			"ADJATHA",
			"AKI",
			"ALDER",
			"BNG",
			"BER00",
			"BUSTEDRADIO",
			"CHESHIRE",
			"CROSSMAN",
			"CYANCAPSULE",
			"DAMNIT",
			"DCLZEXON",
			"DOCBADGER",
			"DOXY",
			"FRIENDLYALIENFRIEND",
			"GATS",
			"GATSOLD",
			"JACQUES",
			"JAMESAB",
			"JASSBEFROLD",
			"JAYECHO",
			"JLIKESTODRAW",
			"LAPINBEAU",
			"LILIRURU",
			"MANIACPAINT",
			"MISSBEHAVIOR",
			"MOIRA",
			"NOLIMIT",
			"NUBATTORI",
			"PEEKAY",
			"RENEZUO",
			"SHEEPPUN",
			"SHOU",
			"TSUDA",
			"UTHSTAR",
			"WOLFYNAIL",
			"FUBMISTRESS",
			"JAYFIREGROWLITHE",
			"YOHSL",
		];
		
		// Any time we want to show a name, this is where it'll be getting pulled from
		public static const VALID_ARTISTS_NAMES:Array = [
			"None",
			"Adjatha",
			"Aki",
			"Alder",
			"Benji",
			"Ber00",
			"BustedRadio",
			"Cheshire",
			"Crossman",
			"CyanCapsule",
			"Damnit",
			"DCLZexon",
			"DatBadger",
			"Doxy",
			"FriendlyAlienFriend",
			"Gats",
			"Old Gats",
			"Jacques00",
			"James AB",
			"Jass Befrold",
			"Jay Echo",
			"J-Likes-To-Draw",
			"Lapinbeau",
			"LiliRuru",
			"ManiacPaint",
			"MissBehavior",
			"Moira",
			"No Limit",
			"Nu Battori",
			"Pee-Kay",
			"Renezuo",
			"SheepPun",
			"Shou",
			"Tsuda",
			"Uthstar",
			"Wolfy-Nail",
			"FubMistress",
			"JayfireGrowlithe",
			"YohSL",
		];
		
		// These are what show up in the options menu combo boxes
		public static const SELECTABLE_ARTISTS:Array = [
			"NONE",
			"ADJATHA",
			"CHESHIRE",
			"GATS",
			"GATSOLD",
			"JACQUES",
			"SHOU",
		];
		
		
	}
}
