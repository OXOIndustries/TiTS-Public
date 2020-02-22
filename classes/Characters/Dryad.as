package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.ComfortableClothes;
	import classes.Items.Guns.*
	import classes.Items.Melee.Fists;

	public class Dryad extends Creature
	{
		
		
		//constructor
		public function Dryad()
		{
			this._latestVersion = 1; 
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Dryad";
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
			this.libidoRaw = 55
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
			this.eyeColor = "green";
			this.tallness = 72;
			this.thickness = 20;
			this.tone = 33;
			this.hairColor = "light red";
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "unknown";
			this.furColor = "brown";
			this.hairLength = 10;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "white";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.tongueFlags = new Array();
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_LEITHAN;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_LEITHAN;
			this.legCount = 4;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_LEITHAN;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 5;
			this.hipRatingRaw = 10;
			this.buttRatingRaw = 7;
			this.cocks = new Array();
			
			this.createCock();
			this.cocks[0].cType = GLOBAL.TYPE_EQUINE;
			this.cocks[0].addFlag(GLOBAL.FLAG_FLARED);
			this.cocks[0].addFlag(GLOBAL.FLAG_SHEATHED);
			this.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
			this.cocks[0].cockColor = "pink";
			this.cocks[0].cLengthRaw = 14; //I dunno how to specify 'type: horse'
			this.cocks[0].cThicknessRatioRaw = 1.4
			this.balls = 2; 
			this.cumMultiplierRaw = 20; 
			this.cumQualityRaw = 4;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 10; 
			this.ballFullness = 2;
			this.ballEfficiency = 150;
			this.refractoryRate = 10;
			this.minutesSinceCum = 90;
			this.timesCum = 1000;
			
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.cockVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 200;
			this.vaginas[0].vaginaColor = "black";
			this.vaginas[0].type = GLOBAL.TYPE_EQUINE;
			this.elasticity = 1;
			this.fertilityRaw = 1.05;
			this.pregnancyMultiplierRaw = 1;
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			this._isLoading = false;
		}
	}
}
