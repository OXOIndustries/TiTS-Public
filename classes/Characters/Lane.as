package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	
	public class Lane extends Creature
	{
		public function Lane()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Lane";
			this.originalRace = "daynar";
			this.a = "";
			this.capitalA = "";
			this.long = "Lane";
			this.customDodge = "Dodge Placeholder";
			this.customBlock = "Block Placeholder";
			this.plural = false;
			this.lustVuln = 1;
			
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
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XPRaw = 350;
			this.level = 3;
			this.credits = 0;
			
			this._isLoading = false;
		}		
		
		public function configMale():void
		{
			this.femininity = 75;
			this.eyeType = 0;
			this.eyeColor = "dark blue";
			this.tallness = 72;
			this.thickness = 40;
			this.tone = 0;
			this.hairColor = "black";
			this.scaleColor = "ebony";
			this.furColor = "black";
			this.hairLength = 10;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "tanned";
			this.skinFlags = [GLOBAL.FLAG_FLUFFY];
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 2;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY];
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 5;
			this.hipRatingRaw = 10;
			this.buttRatingRaw = 9;
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1.5;
			this.cocks[0].cLengthRaw = 8;
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			this.balls = 2;
			this.cumMultiplierRaw = 3;
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			this.ballEfficiency = 15;
			this.refractoryRate = 9999;
			this.minutesSinceCum = 65;
			this.timesCum = 9001;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.elasticity = 1.5;
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			this.breastRows[0].breastRatingRaw = 5;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			
			throw new Error("Set me up!");
		}
		
		public function configFemale():void
		{
			throw new Error("Set me up!");
		}
	}
}