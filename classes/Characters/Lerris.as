package classes.Characters
{
	import classes.CockClass;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	
	public class Lerris extends Creature
	{
		//constructor
		public function Lerris()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Lerris";
			this.originalRace = "kaithrit";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			// Handled in tamaniCorpShop.as
			this.inventory = [];
			
			keeperBuy = "Lerris busies herself with her prodigious tits whilst you browse the shops wares; casting a casual glance in her direction, you catch her squeezing her boobs together with her arms, wiggling this way and that...\n";
			
			this.typesBought = [];
			this.sellMarkup = 1.2;
			this.buyMarkdown = .8;
			
			this.physiqueRaw = 5;
			this.reflexesRaw = 5;
			this.aimRaw = 3;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 3;
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
			this.eyeColor = "brown";
			this.tallness = 68;
			this.thickness = 50;
			this.tone = 20;
			this.hairColor = "strawberry blonde";
			this.scaleColor = "bronze";
			this.furColor = "tawny";
			this.hairLength = 48;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_FELINE;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 2;
			this.earType = GLOBAL.TYPE_FELINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_FELINE;
			this.tailCount = 2;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY,GLOBAL.FLAG_LONG,GLOBAL.FLAG_FURRED, GLOBAL.FLAG_PREHENSILE];
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
			this.hipRatingRaw = 5;
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
			this.buttRatingRaw = 6;
			//No dicks here!
			this.cocks = new Array();
			var c:CockClass = new CockClass();
			cocks.push(c);
			c.cType = GLOBAL.TYPE_FELINE;
			c.addFlag(GLOBAL.FLAG_NUBBY);
			c.cLengthRaw = 5;
			c.cThicknessRatioRaw = 1.0;
			c.flaccidMultiplier = 0.2;
			
			//balls
			this.balls = 2;
			this.ballSizeRaw = 1.5;
			createStatusEffect("Uniball");
			
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
	
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 785;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = false;
			this.vaginas = [];
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .25;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "pink";
			this.milkMultiplier = 50;
			this.milkFullness = 50;
			createPerk("Mega Milk", 0, 0, 0, 0, "");
			
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 4;
			
			this.ass.wetnessRaw = 1;
			this.ass.loosenessRaw = 4;
			this.ass.bonusCapacity = 250;
		}
		
		override public function get bustDisplay():String
		{
			// LERRIS_<COW_>_0
			
			var str:String = "LERRIS_";
			//FEN NOTE: Replaced with a simple override since we only have 1 bovine lerris bust.
			//if (horns == 2 && hornType == GLOBAL.TYPE_BOVINE) str += "COW_";
			if (horns == 2 && hornType == GLOBAL.TYPE_BOVINE) return "LERRIS_COW";
			
			if (biggestTitSize() <= 6) str += "0";
			else if (biggestTitSize() <= 15) str += "1";
			else str += "2";
			
			return str;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.lerrisMenu();
		}
	}
}
