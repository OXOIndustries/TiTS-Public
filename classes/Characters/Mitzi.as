package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.TarkusJokeBook;
	import classes.Items.Apparel.MitzisDress;
	import classes.Items.Apparel.SchoolgirlCostume;
	import classes.Items.Apparel.MitzisYogaBikini;
	import classes.Items.Apparel.MitzisLibrarianOutfit;
	import classes.Items.Apparel.TransparentZipsuit;
	import classes.Items.Apparel.MitzisSuccBikini;
	import classes.Items.Apparel.MitziCowFetishCostume;
	import classes.Items.Apparel.MitziNunFetishCostume;
	
	public class Mitzi extends Creature
	{
		//constructor
		public function Mitzi()
		{
			this._latestVersion = 2;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.inventory.push(new SchoolgirlCostume());
			this.inventory.push(new MitzisYogaBikini());
			this.inventory.push(new MitzisLibrarianOutfit());
			this.inventory.push(new TransparentZipsuit());
			this.inventory.push(new MitzisSuccBikini());
			this.inventory.push(new MitziCowFetishCostume());
			this.inventory.push(new MitziNunFetishCostume());
						
			this.typesBought[this.typesBought.length] = GLOBAL.ALL;
			this.sellMarkup = 1.3;
			this.buyMarkdown = .25;
			this.keeperBuy = "";
			this.keeperSell = "";
			this.keeperGreeting = "";

			this.short = "Mitzi";
			this.originalRace = "gabilani";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.meleeWeapon = new Fists();
			this.armor = new MitzisDress();
			
			this.physiqueRaw = 2;
			this.reflexesRaw = 3;
			this.aimRaw = 3;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 100;
			this.HPMod = 20;
			this.shieldsRaw = 0;
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 75;
			this.level = 1;
			this.XPRaw = normalXP();
			this.credits = 5000;
			
			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "pink";
			this.tallness = 42;
			this.thickness = 40;
			this.tone = 0;
			this.hairColor = "purple";
			this.scaleColor = "green";
			//this.scaleColor = titsPtr.chars["PC"].scaleColor;
			this.furColor = "pink";
			//this.furColor = titsPtr.chars["PC"].furColor;
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "green";
			//this.skinTone = titsPtr.chars["PC"].skinTone;
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.tongueFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_DEMONIC;
			this.hornLength = 4;
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
			this.tailType = GLOBAL.TYPE_DEMONIC;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
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
			this.buttRatingRaw = 18;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 3;
			//this.ballSize = titsPtr.chars["PC"].ballSize;
			this.ballFullness = 10;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 1;
			this.minutesSinceCum = 14;
			this.timesCum = 1433;
			
			this.elasticity = 3;

			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 100;
			this.vaginas[0].vaginaColor = "emerald";
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 50;

			//Fertility is a % out of 100. 
			this.fertilityRaw = 0;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 15;
			this.nippleColor = "purple";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			this._isLoading = false;
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.breastRows[0].breastRatingRaw = 15;
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.mainGameMenu();
		}
	}
}
