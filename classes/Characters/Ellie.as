package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Melee.RaskvelWrench;
	
	import classes.Items.Apparel.BountyBra;
	import classes.Items.Apparel.CowPrintLeotard;
	import classes.Items.Apparel.CowPrintBra;
	import classes.Items.Apparel.CowPrintBikiniBottom;
	import classes.Items.Apparel.CowPrintPantiesAndGarter;
	import classes.Items.Miscellaneous.MilkCaramelGushers;
	import classes.Items.Miscellaneous.MilkmaidsAid;
	import classes.Items.Miscellaneous.BoobswellPads;
	import classes.Items.Miscellaneous.Treatment;
	import classes.Items.Accessories.LightningDuster;
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	
	public class Ellie extends Creature
	{
		//constructor
		public function Ellie()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.sellMarkup = 2.0;
			this.buyMarkdown = .75;
			this.inventory.push(new Treatment());
			this.inventory.push(new BoobswellPads());
			this.inventory.push(new BountyBra());
			this.inventory.push(new CowPrintLeotard());
			this.inventory.push(new CowPrintBra());
			this.inventory.push(new CowPrintBikiniBottom());
			this.inventory.push(new CowPrintPantiesAndGarter());
			this.inventory.push(new LightningDuster());
			this.inventory.push(new MilkCaramelGushers());
			this.inventory.push(new MilkmaidsAid());
			
			this.short = "Ellie";
			this.originalRace = "leithan";
			this.a = "";
			this.capitalA = "";
			this.long = "PLACEHOLDER";
			this.customBlock = "BLOOP";
			this.plural = false;
			//this.meleeWeapon = new RaskvelWrench();
			
			//this.rangedWeapon.damage = 10;
			//this.rangedWeapon.attack = 10;
			//this.rangedWeapon.longName = "shotgun";
			//this.rangedWeapon.attackVerb = "shot";
			//this.rangedWeapon.hasRandomProperties = true;
			
			//this.armor.longName = "chitinous plating";
			//this.armor.defense = 1;
			//this.armor.hasRandomProperties = true;
			
			//this.shield = new ImprovisedShield();

			this.physiqueRaw = 26;
			this.reflexesRaw = 20;
			this.aimRaw = 8;
			this.intelligenceRaw = 7;
			this.willpowerRaw = 4;
			this.libidoRaw = 90;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 40;
			
			this.XPRaw = 9999;
			this.level = 6;
			this.credits = 4000;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 95;
			this.eyeType = GLOBAL.TYPE_LEITHAN;
			this.eyeColor = "blue";
			this.tallness = 108;
			this.thickness = 55;
			this.tone = 35;
			this.hairColor = "black and pink";
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "black and pink";;
			this.furColor = "red";
			this.hairLength = 37;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "light gray";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.tongueFlags = new Array();
			this.lipMod = 2;
			this.earType = GLOBAL.TYPE_LEITHAN;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_RASKVEL;
			this.legCount = 6;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_LEITHAN;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.addTailFlag(GLOBAL.FLAG_LONG);
			this.addTailFlag(GLOBAL.FLAG_PREHENSILE);
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
			this.hipRatingRaw = 20;
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
			this.buttRatingRaw = 15;
			//No dicks here!
			this.cocks = new Array();
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 125;
			this.vaginas[0].clits = 1;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 10;
			this.timesCum = 109144;

			this.elasticity = 1.6;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = 1;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 22;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 75;
			this.ass.loosenessRaw = 2;
			this._isLoading = false;
		}
	}
}