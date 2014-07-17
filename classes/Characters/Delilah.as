package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.ComfortableClothes;
	import classes.Items.Guns.*
	import classes.Items.Melee.Fists;

	public class Delilah extends Creature
	{
		//constructor
		public function Delilah()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Delilah";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.plural = false;
			this.lustVuln = 1;
			
			this.meleeWeapon = new Fists();
			this.armor = new ComfortableClothes();
			
			this.armor.defense = 0;
			this.physiqueRaw = 2;
			this.reflexesRaw = 5;
			this.aimRaw = 4;
			this.intelligenceRaw = 2;
			this.willpowerRaw = 1;
			this.libidoRaw = 60;
			this.HPMod = 0;
			this.shieldsRaw = 0;
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 45;
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XPRaw = 50;
			this.level = 1;
			this.credits = 0;
			
			this.femininity = 70;
			this.eyeType = 0;
			this.eyeColor = "brown";
			this.tallness = 65;
			this.thickness = 20;
			this.tone = 30;
			this.hairColor = "blond";
			this.scaleColor = "black";
			//this.scaleColor = titsPtr.chars["PC"].scaleColor;
			this.furColor = "blond";
			//this.furColor = titsPtr.chars["PC"].furColor;
			this.hairLength = 9;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "chocolate";
			//this.skinTone = titsPtr.chars["PC"].skinTone;
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 0;
			this.tailFlags = new Array();
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
			this.hipRatingRaw = 0;
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
			this.buttRatingRaw = 2;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 5;
			this.cocks[0].cThicknessRatioRaw = 1;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 1;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 1;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 1;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 5;
			this.minutesSinceCum = 800;
			this.timesCum = 1450;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "brown";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.version = _latestVersion;
			this._isLoading = false;
			this.createStatusEffect("Uniball",0,0,0,0,true,"","",false,0);
		}
	}
}