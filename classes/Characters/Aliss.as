package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.GetGameTimestamp;
	import classes.kGAMECLASS;
	
	public class Aliss extends Creature
	{
		
		
		//constructor
		public function Aliss()
		{
			this._latestVersion = 3;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Aliss";
			this.originalRace = "ovir";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.femininity = 75;
			this.eyeType = 0;
			this.eyeColor = "green";
			this.tallness = 72;
			this.thickness = 40;
			this.tone = 0;
			this.hairColor = "blonde";
			this.scaleColor = "purple";
			this.furColor = "blonde";
			this.hairLength = 10;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "light purple";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.faceType = GLOBAL.TYPE_OVIR;
			this.faceFlags = [GLOBAL.FLAG_SMOOTH];
			this.tongueType = GLOBAL.TYPE_OVIR;
			this.tongueFlags = [GLOBAL.FLAG_LONG];
			this.lipMod = 2;
			this.earType = GLOBAL.TYPE_OVIR;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_OVIR;
			this.armFlags = [GLOBAL.FLAG_SCALED, GLOBAL.FLAG_SMOOTH];
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_OVIR;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_SCALED, GLOBAL.FLAG_SMOOTH];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_OVIR;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_SCALED, GLOBAL.FLAG_LONG, GLOBAL.FLAG_THICK, GLOBAL.FLAG_TAPERED];
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = 0;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 0;
			//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
			this.tailVenom = 0;
			//Tail recharge determines how fast venom/webs comes back per hour.
			this.tailRecharge = 5;
			//hipRating
			//0 - boyish
			//2 - slender
			//4 - average
			//6 - noticable/ample
			//10 - curvy//flaring
			//15 - child-bearing/fertile
			//20 - inhumanly wide
			this.hipRatingRaw = 10;
			//buttRating
			//0 - buttless
			//2 - tight
			//4 - average
			//6 - noticable
			//8 - large
			//10 - jiggly
			//13 - expansive
			//16 - huge
			//20 - inconceivably large/big/huge etc
			this.buttRatingRaw = 9;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1.5;
			this.cocks[0].cLengthRaw = 14;
			this.cocks[0].cType = GLOBAL.TYPE_OVIR;
			this.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
			this.cocks[0].addFlag(GLOBAL.FLAG_FLARED);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 15;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 65;
			this.timesCum = 9001;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1.5;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 5;
			this.nippleColor = "purple";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			
			this._isLoading = false;
		}
		
		public function UpgradeVersion1(d:Object):void
		{
			// ???
		}
		
		public function UpgradeVersion2(dataObject:Object):void
		{
			// Clear out this shit and let the default constructor handle it.
			delete dataObject.meleeWeapon;
			delete dataObject.rangedWeapon;
			delete dataObject.lustVuln;
			delete dataObject.resistances;
			delete dataObject.bonusResistances;
			delete dataObject.bonusLustVuln;
			delete dataObject.armor;
		}
		
		override public function processTime(deltaT:uint, doOut:Boolean):void
		{
			var totalDays:int = ((GetGameTimestamp() + deltaT) / 1440) - kGAMECLASS.days;
			if (totalDays > 1 && lust() >= 70) orgasm();
			
			super.processTime(deltaT, doOut);
		}
	}
}