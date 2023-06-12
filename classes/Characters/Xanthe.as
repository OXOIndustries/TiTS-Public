package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.Items.Apparel.GenericCatsuit;
	import classes.Items.Apparel.ReinforcedBodysuit;
	import classes.Items.Apparel.RevealingFemaleArmor;
	import classes.Items.Apparel.RevealingMaleArmor;
	import classes.Items.Apparel.TransparentZipsuit;
	import classes.Items.Apparel.BusinessClothes;
	import classes.Items.Apparel.MeshShirt;
	import classes.Items.Apparel.SkullPatternBra;
	import classes.Items.Apparel.FurryBra;
	import classes.Items.Apparel.CString;
	import classes.Items.Apparel.ZipPouch;
	import classes.Items.Apparel.NurseOutfit;
	import classes.Items.Accessories.AdventurersCoat;
	import classes.kGAMECLASS;
	
	public class Xanthe extends Creature
	{
		//MOSTLY PLACEHOLDER. NOT PROPERLY VARIABLE SO IT DOESN'T MATTER.
		//constructor
		public function Xanthe()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Xanthe";
			this.originalRace = "siel";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			//Shopkeeper Jammle
			this.inventory.push(new MeshShirt());
			this.inventory.push(new FurryBra());
			this.inventory.push(new BusinessClothes());
			this.inventory.push(new NurseOutfit());
			this.inventory.push(new SkullPatternBra());
			this.inventory.push(new CString());
			this.inventory.push(new ZipPouch());
			this.inventory.push(new RevealingFemaleArmor());
			this.inventory.push(new RevealingMaleArmor());
			this.inventory.push(new ReinforcedBodysuit());
			this.inventory.push(new TransparentZipsuit());
			this.inventory.push(new AdventurersCoat());
			
			this.typesBought[this.typesBought.length] = GLOBAL.UPPER_UNDERGARMENT;
			this.typesBought[this.typesBought.length] = GLOBAL.LOWER_UNDERGARMENT;
			//this.typesBought[this.typesBought.length] = GLOBAL.ACCESSORY;
			//this.typesBought[this.typesBought.length] = GLOBAL.ARMOR;
			this.sellMarkup = 1.1;
			this.buyMarkdown = .6;
			
			this.meleeWeapon.attack = 0;
			this.meleeWeapon.longName = "fists";
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor = new GenericCatsuit();
			
			this.shield = new ReaperArmamentsMarkIIShield();
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 15;
			this.aimRaw = 25;
			this.intelligenceRaw = 19;
			this.willpowerRaw = 19;
			this.libidoRaw = 50;
			this.HPMod = 50;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 0;
			
			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "electric blue";
			this.tallness = 78;
			this.thickness = 45;
			this.tone = 30;
			this.hairColor = "midnight blue";
			this.scaleColor = "blue";
			this.furColor = "blue";
			this.hairLength = 11;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "blue-gray";
			this.skinFlags = [];
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_HUMAN;
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
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailCount = 2;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY,GLOBAL.FLAG_LONG];
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
			this.buttRatingRaw = 10;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 10;
			this.cocks[0].cType = GLOBAL.TYPE_HUMAN;
			//Vag!
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].bonusCapacity = 500;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 2;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 15;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 8;
			this.minutesSinceCum = 900;
			this.timesCum = 50;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 5;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 9;
			this.nippleColor = "dark blue";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 100;
			this._isLoading = false;
		}	
		//Needs filled in sumday
		override public function setDefaultSexualPreferences():void
		{
			//LIKES	

			//Dislikes
		
		}
		override public function get bustDisplay():String
		{
			return "XANTHE";
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.enterTheSilkenSerenityWhyDidWashHaveToDie();
		}
		/*
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.inventory.push(new AdventurersCoat().getSaveObject());
		}
		*/
	}

}