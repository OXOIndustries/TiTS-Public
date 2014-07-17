package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Melee.RaskvelWrench;
	import classes.Items.Miscellaneous.Cargobot;
	import classes.Items.Miscellaneous.Hoverboard;
	import classes.Items.Apparel.Smartclothes;
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	
	public class Shekka extends Creature
	{
		//constructor
		public function Shekka()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.inventory.push(new Cargobot());
			this.inventory.push(new Hoverboard());
			this.inventory.push(new Smartclothes());
			
			this.typesBought[this.typesBought.length] = GLOBAL.GADGET;
			this.typesBought[this.typesBought.length] = GLOBAL.ACCESSORY;
			this.typesBought[this.typesBought.length] = GLOBAL.ARMOR;
			this.typesBought[this.typesBought.length] = GLOBAL.SHIELD;
			this.sellMarkup = 1.2;
			this.buyMarkdown = .75;

			this.short = "Shekka";
			this.originalRace = "raskvel";
			this.a = "";
			this.capitalA = "";
			this.long = "PLACEHOLDER";
			this.customBlock = "BLOOP";
			this.plural = false;
			this.lustVuln = 1;
			this.meleeWeapon = new RaskvelWrench();
			
			this.rangedWeapon.damage = 10;
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.longName = "shotgun";
			this.rangedWeapon.attackVerb = "shot";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.shield = new ImprovisedShield();

			this.physiqueRaw = 11;
			this.reflexesRaw = 17;
			this.aimRaw = 15;
			this.intelligenceRaw = 20;
			this.willpowerRaw = 14;
			this.libidoRaw = 30;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XPRaw = 250;
			this.level = 4;
			this.credits = 400;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 90;
			this.eyeType = GLOBAL.TYPE_RASKVEL;
			this.eyeColor = "pink";
			this.tallness = 43;
			this.thickness = 35;
			this.tone = 35;
			this.hairColor = "pink";
			this.hairType = GLOBAL.TYPE_RASKVEL;
			this.scaleColor = "red";;
			this.furColor = "red";
			this.hairLength = 7;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pale red";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_RASKVEL;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_RASKVEL;
			this.tongueFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_RASKVEL;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_RASKVEL;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_RASKVEL;
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
			this.hipRatingRaw = 15;
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
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 12;
			this.vaginas[0].clits = 2;
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
			this.minutesSinceCum = 420;
			this.timesCum = 787;

			this.elasticity = 1.4;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 2;
			this.nippleColor = "purple";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			this.ass.loosenessRaw = 2;
			this._isLoading = false;
		}
	}
}