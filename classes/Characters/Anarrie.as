package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Items.Drinks.RedMyrVenom;
	import classes.Items.Accessories.Minesweeper;
	import classes.Items.Armor.ChitinArmor;
	import classes.Items.Guns.FlareGun;
	import classes.Items.Guns.HuntingRifle;
	import classes.Items.Guns.MyrBow;
	import classes.Items.Melee.SurvivalAxe;
	import classes.Items.Apparel.ThermalUnderwear;
	import classes.Items.Apparel.HoneypotBra;
	import classes.Items.Miscellaneous.EmptySlot;
	
	public class Anarrie extends Creature
	{
		//constructor
		public function Anarrie()
		{
			this._latestVersion = 3;
			this.version = this._latestVersion;
			_neverSerialize = true;
			
			inventory.push(new Minesweeper());
			inventory.push(new ChitinArmor());
			inventory.push(new FlareGun());
			inventory.push(new ThermalUnderwear());
			inventory.push(new HoneypotBra());
			inventory.push(new SurvivalAxe());
			inventory.push(new HuntingRifle());
			inventory.push(new MyrBow());
			inventory.push(new RedMyrVenom());
			
			this.typesBought[this.typesBought.length] = GLOBAL.ARMOR;
			this.typesBought[this.typesBought.length] = GLOBAL.RANGED_WEAPON;
			this.typesBought[this.typesBought.length] = GLOBAL.SHIELD;
			this.sellMarkup = 1.2;
			this.buyMarkdown = .80;

			this.short = "Anarrie";
			this.originalRace = "myrmedion";
			this.a = "";
			this.capitalA = "";
			this.long = "Placeholder";
			this.customDodge = "Anarrie Don't Dodge Foo";
			this.customBlock = "Obvious placeholder is obvious.";
			keeperGreeting = "<i>“Hello and welcome to my shop. Take a gander and let me know if you see anything you like,”</i>  " + short + " says with a smile.";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "coat";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 8;
			this.reflexesRaw = 10;
			this.aimRaw = 17;
			this.intelligenceRaw = 19;
			this.willpowerRaw = 14;
			this.libidoRaw = 55;
			this.HPMod = 15;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 0;
			
			this.femininity = 80;
			this.eyeType = GLOBAL.TYPE_MYR;
			this.eyeColor = "black";
			this.tallness = 70;
			this.thickness = 40;
			this.tone = 0;
			this.hairColor = "red";
			this.scaleColor = "red";
			this.furColor = "red";
			this.hairLength = 32;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 2;
			this.earType = GLOBAL.TYPE_SYLVAN;
			this.antennae = 2;
			this.antennaeType = GLOBAL.TYPE_MYR;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_MYR;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_MYR;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_CHITINOUS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_MYR;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_CHITINOUS];
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
			this.buttRatingRaw = 9;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 15;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 65;
			this.timesCum = 9001;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1.5;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 5;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 30;
			this.createVagina();
			this.vaginas[0].wetnessRaw = 6;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 20;
			
			this._isLoading = false;
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.inventory.push(new RedMyrVenom().getSaveObject());
		}
		public function UpgradeVersion2(dataObject:Object):void
		{
			dataObject.rangedWeapon = new EmptySlot().getSaveObject();
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.mainGameMenu();
		}
	}
}
