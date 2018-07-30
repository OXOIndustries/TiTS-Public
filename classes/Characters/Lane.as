package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	
	public class Lane extends Creature
	{
		public function Lane()
		{
			this._latestVersion = 2;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Lane";
			this.originalRace = "daynar";
			this.a = "";
			this.capitalA = "";
			this.long = "Lane";
			this.customDodge = "Dodge Placeholder";
			this.customBlock = "Block Placeholder";
			this.isPlural = false;
			
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.longName = "semi-solid fist";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "durable dermis";
			this.armor.defense = 10;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 13;
			this.reflexesRaw = 10;
			this.aimRaw = 15;
			this.intelligenceRaw = 9;
			this.willpowerRaw = 4;
			this.libidoRaw = 55;
			this.HPMod = 15;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			this.level = 3;
			this.XPRaw = normalXP();
			this.credits = 0;
			
			this._isLoading = false;
		}		
		
		public function configMale():void
		{
			kGAMECLASS.flags["LANE_CONFIGURED"] = 1;
			
			this.femininity = 10;
			this.eyeType = GLOBAL.TYPE_DAYNAR;
			this.eyeColor = "dark blue";
			this.tallness = 71;
			this.thickness = 25;
			this.tone = 50;
			this.hairColor = "black";
			this.scaleColor = "ebony";
			this.furColor = "black";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pale";
			this.skinFlags = [];
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 2;
			this.earType = GLOBAL.TYPE_DAYNAR;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_DAYNAR;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_DAYNAR;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_DAYNAR;
			this.tailCount = 1;
			this.tailFlags = [];
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 0;
			this.hipRatingRaw = 2;
			this.buttRatingRaw = 2;
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1.5;
			this.cocks[0].cLengthRaw = 8;
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].cType = GLOBAL.TYPE_DAYNAR;
			this.balls = 2;
			this.cumMultiplierRaw = 3;
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			this.ballEfficiency = 15;
			this.refractoryRate = 9991;
			this.minutesSinceCum = 65;
			this.timesCum = 9001;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.elasticity = 1.5;
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			this.breastRows = [];
			this.createBreastRow();
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 0;
			this.lipMod = 0;
			this.cockVirgin = true;
			
		}
		
		public function configFemale():void
		{
			kGAMECLASS.flags["LANE_CONFIGURED"] = 2;
			
			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_DAYNAR;
			this.eyeColor = "dark blue";
			this.tallness = 71;
			this.thickness = 30;
			this.tone = 20;
			this.hairColor = "black";
			this.scaleColor = "ebony";
			this.furColor = "black";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pale";
			this.skinFlags = [];
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 2;
			this.earType = GLOBAL.TYPE_DAYNAR;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_DAYNAR;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_DAYNAR;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_DAYNAR;
			this.tailCount = 1;
			this.tailFlags = [];
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 0;
			this.hipRatingRaw = 2;
			this.buttRatingRaw = 2;
			this.cocks = new Array();
			this.vaginas = [];
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 2;
			this.balls = 2;
			this.cumMultiplierRaw = 3;
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			this.ballEfficiency = 15;
			this.refractoryRate = 9991;
			this.minutesSinceCum = 65;
			this.timesCum = 9001;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.elasticity = 1.5;
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			this.breastRows = [];
			this.createBreastRow();
			this.breastRows[0].breastRatingRaw = 3;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 0;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.lipMod = 1;
		}
		
		public function UpgradeVersion1(d:Object):void
		{
			delete d.armor;
			delete d.meleeWeapon;
			
			delete d.lustVuln;
			delete d.resistances;
			delete d.bonusResistances;
			delete d.bonusLustVuln;
		}
	}
}