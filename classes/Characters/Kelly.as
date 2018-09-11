package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Kelly extends Creature
	{
		//constructor
		public function Kelly()
		{
			this.keeperSell = "<i>“Xenogen isn’t usually in the business of buying mods to sell, but we’ll offer fair compensation,”</i> Kelly explains.\n";
			this.keeperBuy = "<i>“Oh, you’d like to purchase some of our basic modification programs? Why, certainly,”</i> Kelly chimes merrily.\n";
			this.keeperGreeting = "Kelly asks, <i>“Is there anything else I can do for you?”</i>\n";
			this.typesBought[this.typesBought.length] = GLOBAL.PILL;
			this.typesBought[this.typesBought.length] = GLOBAL.POTION;
			this.typesBought[this.typesBought.length] = GLOBAL.DRUG;
			this.sellMarkup = 1.3;
			this.buyMarkdown = .4;

			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Kelly";
			this.originalRace = "laquine";
			this.a = "";
			this.capitalA = "";
			this.long = "PLACE HOLDER!";
			this.customDodge = "PLACE HOLDER!";
			this.customBlock = "PLACE HOLDER!";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "shield-corset";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 3;
			this.reflexesRaw = 5;
			this.aimRaw = 9;
			this.intelligenceRaw = 7;
			this.willpowerRaw = 14;
			this.libidoRaw = 75;
			this.energyRaw = 100;
			this.lustRaw = 85;
			
			this.level = 3;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 90;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "amber";
			this.tallness = 69;
			this.thickness = 55;
			this.tone = 40;
			this.hairColor = "yellow";
			this.scaleColor = "yellow";
			this.furColor = "black and yellow";
			this.hairLength = 19;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "black";
			this.skinFlags = new Array();
			
			this.faceType = GLOBAL.TYPE_LAPINE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.ZIL;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_LAPINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.hornLength = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
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
			this.tailType = GLOBAL.TYPE_LAPINE;
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
			this.createCock();
			this.cocks[0].cLengthRaw = 12;
			this.createCock();
			this.cocks[1].cLengthRaw = 12;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 250;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 500;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 19473;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].bonusCapacity = 120;
			//Goo is hyper friendly!
			this.elasticity = 2.5;
			//Fertility is a % out of 100. 
			//this.fertility = 0;
			this.createStatusEffect("Infertile");
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 5;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_HONEY;
			this.cumType = GLOBAL.FLUID_TYPE_HONEY;
			this.girlCumType = GLOBAL.FLUID_TYPE_HONEY;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity = 120;
			
			this.createStatusEffect("Disarm Immune");
		}
		
		public function UpgradeVersion1(d:Object):void
		{
			delete d.armor;
			delete d.meleeWeapon;
			
			delete d.lustVuln;
			delete d.resistances;
			delete d.bonusResistances;
			delete d.bonusLustVuln;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.kellyOfficeApproach();
		}
	}

}