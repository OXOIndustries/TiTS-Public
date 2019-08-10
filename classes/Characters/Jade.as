package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	/*
	import classes.Items.Miscellaneous.AusarTreats;
	import classes.Items.Miscellaneous.HorsePill;
	import classes.Items.Miscellaneous.KnotAProblem;
	import classes.Items.Miscellaneous.NukiCookies;
	import classes.Items.Miscellaneous.Pandaneen;
	import classes.Items.Miscellaneous.PandaPro;
	import classes.Items.Transformatives.DracoGuard;
	import classes.Items.Transformatives.Furball;
	import classes.Items.Transformatives.OvirAce;
	import classes.Items.Transformatives.OvirPositive;
	import classes.Items.Transformatives.CaninePoppers;
	*/
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Jade extends Creature
	{
		//constructor
		public function Jade()
		{
			this._latestVersion = 11;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Jade";
			this.originalRace = "orchan";
			this.a = "";
			this.capitalA = "";
			this.long = "PLACE HOLDER!";
			this.customDodge = "PLACE HOLDER!";
			this.customBlock = "PLACE HOLDER!";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "claw";
			this.meleeWeapon.longName = "claws";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "soft fur";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 3;
			this.aimRaw = 2;
			this.intelligenceRaw = 10;
			this.willpowerRaw = 9;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 15;
			this.HPRaw = this.HPMax();

			//Inventory handled in includes/tavros/jade.as - jadeStoreSetup
			
			this.typesBought[this.typesBought.length] = GLOBAL.PILL;
			this.typesBought[this.typesBought.length] = GLOBAL.POTION;
			this.typesBought[this.typesBought.length] = GLOBAL.DRUG;
			this.sellMarkup = 1.2;
			this.buyMarkdown = .75;

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "red";
			this.tallness = 75;
			this.thickness = 75;
			this.tone = 20;
			this.hairColor = "black";
			this.scaleColor = "green";
			this.furColor = "white and black";
			this.hairLength = 40;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "dark";
			this.skinFlags = [GLOBAL.FLAG_FLUFFY];
			
			this.faceType = GLOBAL.TYPE_PANDA;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_PANDA;
			this.lipMod = 2;
			this.earType = GLOBAL.TYPE_PANDA;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_PANDA;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_FURRED, GLOBAL.FLAG_PAWS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_PANDA;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];
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
			this.buttRatingRaw = 10;
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
			this.timesCum = 212;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].bonusCapacity = 200;
			//Goo is hyper friendly!
			this.elasticity = 1.5;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.10;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 31;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 100;
			
			this.createStatusEffect("Disarm Immune");
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			//dataObject.inventory.push(new HorsePill().getSaveObject());
		}
		public function UpgradeVersion2(dataObject:Object):void
		{
			//dataObject.inventory.push(new AusarTreats().getSaveObject());
		}
		public function UpgradeVersion3(dataObject:Object):void
		{
			//dataObject.inventory.push(new KnotAProblem().getSaveObject());
		}
		public function UpgradeVersion4(dataObject:Object):void
		{
			//dataObject.inventory.push(new NukiCookies().getSaveObject());
		}
		public function UpgradeVersion5(dataObject:Object):void
		{
			delete dataObject.resistances;
			delete dataObject.bonusResistances;
			delete dataObject.armor;
			delete dataObject.meleeWeapon;
			delete dataObject.lustVuln;
			delete dataObject.bonusLustVuln;
		}
		public function UpgradeVersion6(d:Object):void
		{
			//d.inventory.push(new OvirAce().getSaveObject());
			//d.inventory.push(new OvirPositive().getSaveObject());
		}
		public function UpgradeVersion7(d:Object):void
		{
			//d.inventory.push(new Catnip().getSaveObject());
		}
		public function UpgradeVersion8(dataObject:Object):void
		{
			//dataObject.inventory.push(new DracoGuard().getSaveObject());
		}
		public function UpgradeVersion9(d:Object):void
		{
			//d.inventory.push(new Foxfire().getSaveObject());
		}
		public function UpgradeVersion10(dataObject:Object):void
		{
			//dataObject.inventory = UpdateInventory();
		}
		
		/*
		private function UpdateInventory():Array
		{
			// Renew/Reorganize inventory
			var newInventory:Array = [];
			
			newInventory.push(new Pandaneen().getSaveObject());
			newInventory.push(new PandaPro().getSaveObject());
			newInventory.push(new KnotAProblem().getSaveObject());
			newInventory.push(new HorsePill().getSaveObject());
			newInventory.push(new Furball().getSaveObject());
			newInventory.push(new AusarTreats().getSaveObject());
			newInventory.push(new NukiCookies().getSaveObject());
			newInventory.push(new DracoGuard().getSaveObject());
			newInventory.push(new OvirAce().getSaveObject());
			newInventory.push(new OvirPositive().getSaveObject());
			
			return newInventory;
		}
		*/
		override public function get bustDisplay():String
		{
			if(hasTentacleNipples()) return "JADE_NIPS";
			return "JADE";
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachJade();
		}
	}
}