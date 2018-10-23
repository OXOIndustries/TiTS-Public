package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.ComfortableClothes;
	import classes.Items.Guns.*
	import classes.Items.Melee.Fists;
	import classes.kGAMECLASS;

	public class Aina extends Creature
	{
		
		
		//constructor
		public function Aina()
		{
			this._latestVersion = 1; 
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Aina";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.meleeWeapon = new Fists();
			this.armor = new ComfortableClothes();
			
			this.armor.defense = 10;
			this.physiqueRaw = 10
			this.reflexesRaw = 10
			this.aimRaw = 10
			this.intelligenceRaw = 10
			this.willpowerRaw = 10
			this.libidoRaw = 30
			this.HPMod = 0;
			this.shieldsRaw = 0;
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 100;
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 100;
			
			this.sellMarkup = 1.3;
			this.buyMarkdown = .25;
			this.keeperSell = "boop";
			this.keeperBuy = "bop";
			this.keeperGreeting = "BLOOP.";
			
			this.femininity = 0;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "tawny";
			this.tallness = 72;
			this.thickness = 20;
			this.tone = 33;
			this.hairColor = "honey-blonde";
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "unknown";
			this.furColor = "chestnut";
			this.hairLength = 12;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "fair";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.tongueFlags = new Array();
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_EQUINE;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_EQUINE;
			this.legCount = 4;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_EQUINE;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 5;
			this.hipRatingRaw = 10;
			this.buttRatingRaw = 7;
			
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = true;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].bonusCapacity = 125;
			this.elasticity = 1;
			this.fertilityRaw = 1;
			this.pregnancyMultiplierRaw = 1;
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			
			this._isLoading = false;
		}
		
		override public function loadInCunt(cumFrom:Creature = null, vagIndex:int = -1):Boolean
		{
			this.vaginalVirgin = false;
			if (cumFrom is PlayerCharacter)
			{
				sstdChecks(cumFrom,"vagina");
				return kGAMECLASS.tryKnockUpAina();
			}
			return false;
		}
		
		override public function isPregnant(vIdx:int = 0):Boolean
		{
			return (kGAMECLASS.flags["AINA_PREG_TIMER"] != undefined);
		}
	}
}			