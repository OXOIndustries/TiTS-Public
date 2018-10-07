package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.UGCUniform;
	import classes.Items.Melee.Tonfas;
	import classes.kGAMECLASS;
	
	public class Penny extends Creature
	{
		
		
		//constructor
		public function Penny()
		{
			this._latestVersion = 5;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Penny";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.long = "uncreated";
			this.customDodge = "uncreated";
			this.customBlock = "uncreated";
			this.isPlural = false;
			
			this.meleeWeapon = new Tonfas();
			this.armor = new UGCUniform();
			
			this.physiqueRaw = 10;
			this.reflexesRaw = 8;
			this.aimRaw = 6;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 3;
			this.libidoRaw = 40;
			this.shieldsRaw = 20;
			this.energyRaw = 100;
			this.lustRaw = 85;
			
			this.level = 1;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 20;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "blue";
			this.tallness = 60;
			this.thickness = 40;
			this.tone = 70;
			this.hairColor = "red";
			this.scaleColor = "bronze";
			this.furColor = "tawny";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_VULPINE;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_VULPINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_VULPINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY,GLOBAL.FLAG_LONG,GLOBAL.FLAG_THICK,GLOBAL.FLAG_FURRED];
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
			this.hipRatingRaw = 8;
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
			this.buttRatingRaw = 7;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 785;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 20;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			
			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			return kGAMECLASS.pennyBustDisplay();
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_DIGITIGRADE);
			}
		}
		
		public function UpgradeVersion2(dataObject:Object):void
		{
			dataObject.physiqueRaw = 10;
			dataObject.reflexesRaw = 8;
			dataObject.aimRaw = 6;
			dataObject.intelligenceRaw = 4;
			dataObject.willpowerRaw = 3;
		}
		
		public function UpgradeVersion3(dataObject:Object):void
		{
			dataObject.vaginas[0].bonusCapacity = 20;
			dataObject.elasticity = 3;
		}
		
		public function UpgradeVersion4(dataObject:Object):void
		{
			// Clear out this shit and let the default constructor handle it.
			delete dataObject.meleeWeapon;
			delete dataObject.rangedWeapon;
			delete dataObject.lustVuln;
			delete dataObject.resistances;
			delete dataObject.bonusResistances;
			delete dataObject.bonusLustVuln;
		}
	}
}