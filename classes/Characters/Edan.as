package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.ComfortableClothes;
	import classes.Items.Guns.*
	import classes.Items.Melee.Fists;

	public class Edan extends Creature
	{
		
		
		//constructor
		public function Edan()
		{
			this._latestVersion = 1; 
			this.version = _latestVersion; //Dunno what the fuck these vars are lol!
			this._neverSerialize = true;
			
			this.short = "Edan";
			this.originalRace = "leithan";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.meleeWeapon = new Fists();
			this.armor = new ComfortableClothes();
			
			this.armor.defense = 50;
			this.physiqueRaw = 35
			this.reflexesRaw = 30
			this.aimRaw = 5
			this.intelligenceRaw = 14
			this.willpowerRaw = 22
			this.libidoRaw = 25
			this.HPMod = 0;
			this.shieldsRaw = 0;
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 35;
			this.xpRaw = 500;
			this.level = 6;
			this.credits = 1500;
			
			this.sellMarkup = 1.3;
			this.buyMarkdown = .25;
			this.keeperSell = "boop";
			this.keeperBuy = "bop";
			this.keeperGreeting = "BLOOP.";
			
			this.femininity = 0;
			this.eyeType = GLOBAL.TYPE_LEITHAN;
			this.eyeColor = "green";
			this.tallness = 120;
			this.thickness = 28;
			this.tone = 33;
			this.hairColor = "black";
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "gray";
			this.furColor = "silver";
			this.hairLength = 5;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "gray";
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
			this.legCount = 6;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_LEITHAN;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.addTailFlag(GLOBAL.FLAG_LONG);
			this.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 5;
			this.hipRatingRaw = 4;
			this.buttRatingRaw = 4;
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 36; //I dunno how to specify 'type: horse'
			this.cocks[0].cThicknessRatioRaw = 1.6
			this.balls = 2; 
			this.cumMultiplierRaw = 50; 
			this.cumQualityRaw = 4;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 14; 
			this.ballFullness = 100;
			this.ballEfficiency = 35;
			this.refractoryRate = 20;
			this.minutesSinceCum = 1500;
			this.timesCum = 1000;
			
			this.elasticity = 1;
			this.fertilityRaw = 1.05;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			this._isLoading = false;
		}
	}
}
