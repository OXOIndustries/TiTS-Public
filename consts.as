//CLASSES
const SMUGGLER:int = 0;
const MERCENARY:int = 1;
const ENGINEER:int = 2;

//Body Part Flags - used for any body part that supports the new flags system.
	//NOTE: Not all flags work with all body parts, for obvious reasons
const LONG:int = 1;
const PREHENSILE:int = 2;
const LUBRICATED:int = 3;
const FLUFFY:int = 4;
const SQUISHY:int = 5;
const SMOOTH:int = 6;
const TAPERED:int = 7;
const FLARED:int = 8;
const KNOTTED:int = 9;
const BLUNT:int = 10;
const APHRODISIAC_LACED:int = 11;
const STICKY:int = 12;
const THICK:int = 13;
const MUZZLED:int = 14;
const ANGULAR:int = 15;
const PLANTIGRADE:int = 16;
const DIGITIGRADE:int = 17;
const TENDRIL:int = 18;
const AMORPHOUS:int = 19;
const FURRED:int = 20;
const SCALED:int = 21;
const HOOVES:int = 22;
const PAWS:int = 23;
const HEELS:int = 24;
const OVIPOSITOR:int = 25;
const SHEATHED:int = 26;
const TAILCOCK:int = 27;
const STINGER_BASED:int = 28;
const STINGER_TIPPED:int = 29;
//TYPES
const HUMAN:int = 0;
const EQUINE:int = 1;
const BOVINE:int = 2;
const CANINE:int = 3;
const FELINE:int = 4;
const VULPINE:int = 5;
const BEE:int = 6;
const ARACHNID:int = 7;
const DRIDER:int = 8;
const LAPINE:int = 9;
const AVIAN:int = 10;
const DRACONIC:int = 11;
const LIZAN:int = 12;
const SNAKE:int = 13;
const NAGA:int = SNAKE;
const CENTAUR:int = 14;
const DEMONIC:int = 15;
const GOOEY:int = 16;
const KANGAROO:int = 17;
const TANUKI:int = 18;
const SHARK:int = 19;
const SIREN:int = 20;
const DEER:int = 21;
const ANEMONE:int = 22;
const TENTACLE:int = 23;
const KUITAN:int = 24;
const HUMANMASKED:int = 25;
const MOUSE:int = 26;
const MOUSEMAN:int = 27;
const DRAGONFLY:int = 31;
const MLP:int = 32;
const CUNTSNAKE:int = 33;
//Used for custom legs, otherwise demonic!
const SUCCUBUS:int = 33;
//Special wing types!
const SMALLBEE:int = 28;
const SMALLDEMONIC:int = 29;
const SMALLDRACONIC:int = 30;

//SKINTYPES
const SKIN:int = 0;
const FUR:int = 1;
const SCALES:int = 2;
const GOO:int = 3;
		
//NIPPLETYPES
const NORMAL:int = 0;
const FUCKABLE:int = 1;
const LIPPLES:int = 2;
const DICK:int = 3;
const FLAT:int = 4;
const INVERTED:int = 5;
		
//CUM & MILK TYPES
const MILK:int = 0;
const HONEY:int = 1;
const CUM:int = 2;
const OIL:int = 3;
const MILKSAP:int = 4;
const GIRLCUM:int = 5;

//DAMAGE TYPES
//Guns and blunt weapons
const KINETIC:int = 0;
//Swords and the like.
const SLASHING:int = 1;
//Horns, knives, etc.
const PIERCING:int = 2;
//Lasers - less effective against HP
const LASER:int = 3;
//Equally murders everything.
const PLASMA:int = 4;
//Pretty good against everything
const GRAVITIC:int = 5;
//ELECTRIC - good vs shields
const ELECTRIC:int = 6;
//THERMAL
const THERMAL:int = 7;

//ROOM FLAGS
const INDOOR:int = 0;
const OUTDOOR:int = 1;
const BED:int = 2;

//ITEM TYPES
const PILL:int = 0;
const FOOD:int = 1;
const POTION:int = 2;
const MELEE_WEAPON:int = 3;
const RANGED_WEAPON:int = 4;
const ARMOR:int = 5;
const SHIELD:int = 6;
const UPPER_UNDERGARMENT:int = 7;
const LOWER_UNDERGARMENT:int = 8;
const ACCESSORY:int = 9;
const DRUG:int = 10;
const CLOTHING:int = 11;
const ALL:int = 12; //Used for pawn shops!

//CHARACTERS
const CELISE:int = 1;
const RIVAL:int = 2;
const GEOFF:int = 3;

/*PLOT FLAGS
RECRUITED_CELISE
CELISE_ONBOARD
TIMES_CELISE_IN_BALLS
MET_GEOFF
SCRAPYARD_SEEN
SEXED_GEOFF
"GEOFF_FUCKED_DUDES_TWICE"
*/