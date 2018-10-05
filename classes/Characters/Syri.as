package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	
	public class Syri extends Creature
	{
		
		
		//constructor
		public function Syri()
		{
			this._latestVersion = 6;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Syri";
			this.originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			this.long = "Placeholder";
			this.customDodge = "Syri Don't Dodge Foo";
			this.customBlock = "Obvious placeholder is obvious.";
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
			
			this.femininity = 75;
			this.eyeType = 0;
			this.eyeColor = "dark blue";
			this.tallness = 72;
			this.thickness = 40;
			this.tone = 30;
			this.hairColor = "black";
			this.scaleColor = "ebony";
			this.furColor = "black";
			this.hairLength = 10;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
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
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY];
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
			this.cocks[0].cLengthRaw = 8;
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			this.cocks[0].cType = GLOBAL.TYPE_CANINE;
			this.cocks[0].cockColor = "red";
			this.cocks[0].knotMultiplier = 1.5;
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
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			
			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			return "SYRI";
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.physiqueRaw = 13;
			dataObject.reflexesRaw = 10;
			dataObject.aimRaw = 15;
			dataObject.intelligenceRaw = 9;
			dataObject.willpowerRaw = 4;
		}
		public function UpgradeVersion2(d:Object):void
		{
			delete d.armor;
			delete d.meleeWeapon;
			
			delete d.lustVuln;
			delete d.resistances;
			delete d.bonusResistances;
			delete d.bonusLustVuln;
		}
		public function UpgradeVersion3(dataObject:Object):void
		{
			dataObject.tone = 30;
		}
		public function UpgradeVersion4(dataObject:Object):void
		{
			dataObject.skinType = GLOBAL.SKIN_TYPE_SKIN;
		}
		public function UpgradeVersion5(dataObject:Object):void
		{
			dataObject.cocks[0].cType = GLOBAL.TYPE_CANINE;
			dataObject.cocks[0].cockColor = "red";
			dataObject.cocks[0].knotMultiplier = 1.5;
		}
	}
}