package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.UGCUniform;
	import classes.Items.Melee.Knife;
	import classes.Items.Miscellaneous.EmptySlot;
	
	public class Pippa extends Creature
	{
		//constructor
		public function Pippa()
		{
			this._latestVersion = 3;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Pippa";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.long = "uncreated";
			this.customDodge = "uncreated";
			this.customBlock = "uncreated";
			this.isPlural = false;
			
			this.meleeWeapon = new EmptySlot();
			this.armor = new EmptySlot();
			
			this.physiqueRaw = 3;
			this.reflexesRaw = 5;
			this.aimRaw = 3;
			this.intelligenceRaw = 6;
			this.willpowerRaw = 6;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 85;
			
			this.level = 1;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "hazel";
			this.tallness = 66;
			this.thickness = 75;
			this.tone = 25;
			this.hairColor = "dirty blonde";
			this.scaleColor = "pink";
			this.furColor = "white";
			this.hairLength = 18;
			this.hairType = GLOBAL.HAIR_TYPE_REGULAR;
			this.hairStyle = "pigtails";
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "light pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_SWINE;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 3;
			this.earType = GLOBAL.TYPE_SWINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_SWINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_HOOVES];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SWINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_CORKSCREWED];
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
			this.hipRatingRaw = 18;
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
			this.buttRatingRaw = 18;
			this.bellyRatingRaw = 10;
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
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].bonusCapacity = 300;
			this.vaginas[0].type = GLOBAL.TYPE_SWINE;
			this.vaginas[0].addFlag(GLOBAL.FLAG_CORKSCREWED);
			this.clitLength = 1;
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 30;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL; // They're actually inverted, but Creature class has way better descriptors for normal nipples, and any time it's being used, her nipples are probably erect, and functionally normal
			this.nippleColor = "brown-pink";
			this.nippleLengthRatio = 1;
			this.nippleWidthRatio = 1;
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 2;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity = 150;
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL; // See nipple type note in constructor
		}
		public function UpgradeVersion2(dataObject:Object):void
		{
			dataObject.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_HOOVES];
		}
	}
}