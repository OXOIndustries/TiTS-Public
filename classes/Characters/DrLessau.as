package classes.Characters
{
	import classes.CockClass;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.TerranTreats;
	import classes.Items.Transformatives.DoveBalm;
	import classes.Items.Transformatives.Hornitol;
	import classes.Items.Transformatives.Hornucopia;
	import classes.Items.Transformatives.Pickmentation;
	import classes.Items.Transformatives.PleasurePalette;
	import classes.Items.Transformatives.RainbowGaze;
	import classes.Items.Transformatives.SheepTF;
	import classes.Items.Transformatives.UthraPlus;
	import classes.kGAMECLASS;

	public class DrLessau extends Creature
	{
		//constructor
		public function DrLessau()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Doctor Lessau";
			this.originalRace = "chimera";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.inventory = [];
			this.inventory.push(new TerranTreats());
			this.inventory.push(new DoveBalm());
			this.inventory.push(new Hornitol());
			this.inventory.push(new Hornucopia());
			this.inventory.push(new Pickmentation());
			this.inventory.push(new PleasurePalette());
			this.inventory.push(new RainbowGaze());
			this.inventory.push(new SheepTF());
			this.inventory.push(new UthraPlus());
			
			this.keeperBuy = "<i>“Ah, interested in improving yourself?”</i> Lessau opens up a holoterminal for you displaying a menu of various transformative agents. <i>“Go right ahead, mix and match to your heart’s desire. I’ll have the treatments prepared for you immediately. I will, unfortunately, have to charge for the service, but you'll benefit from the employee discount.”</i>\n";
			
			this.typesBought = [];
			this.sellMarkup = 1.1;
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
			
			this.femininity = 20;
			this.eyeType = 0;
			this.eyeColor = "brown";
			this.tallness = 74;
			this.thickness = 70;
			this.tone = 80;
			this.hairColor = "orange";
			this.scaleColor = "black";
			this.furColor = "white";
			this.hairLength = 24;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "tanned";
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
			this.armType = GLOBAL.TYPE_FELINE;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_NAGA;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_PREHENSILE, GLOBAL.FLAG_TENDRIL, GLOBAL.FLAG_SCALED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SNAKE;
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
			this.buttRatingRaw = 5;
			//No dicks here!
			this.cocks = new Array();
			var c:CockClass = new CockClass();
			cocks.push(c);
			c.cType = GLOBAL.TYPE_EQUINE;
			c.addFlag(GLOBAL.FLAG_NUBBY);
			c.addFlag(GLOBAL.FLAG_FLARED);
			c.cLengthRaw = 12;
			c.cThicknessRatioRaw = 1.0;
			c.flaccidMultiplier = 0.2;
			
			//balls
			this.balls = 2;
			this.ballSizeRaw = 1.5;
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
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .25;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pale pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
		}
				
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.drLessauMainMenu();
		}
	}
}