package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.ComfortableClothes;
	import classes.Items.Guns.*
	import classes.Items.Melee.*
	import classes.Items.Apparel.*
	import classes.Items.Melee.Fists;
	import classes.kGAMECLASS;
	
	public class Geoff extends Creature
	{
		//constructor
		public function Geoff()
		{
			this._latestVersion = 5;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Geoff";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.meleeWeapon = new Fists();
			this.armor = new ComfortableClothes();
			
			this.armor.defense = 50;
			this.physiqueRaw = 3;
			this.reflexesRaw = 3;
			this.aimRaw = 3;
			this.intelligenceRaw = 3;
			this.willpowerRaw = 3;
			this.libidoRaw = 30;
			this.HPMod = 20;
			this.shieldsRaw = 0;
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			this.level = 1;
			this.XPRaw = normalXP();
			this.credits = 1000;
			
			this.inventory.push(new LeatherArmor());
			this.inventory.push(new NaleenArmor());
			this.inventory.push(new Knife());
			this.inventory.push(new HoldOutPistol());
			this.inventory.push(new EagleHandgun());
			this.inventory.push(new ScopedPistol());
			this.inventory.push(new ComfortableClothes());
			this.inventory.push(new PlainUndershirt());
			this.inventory.push(new PlainBra());
			this.inventory.push(new PlainPanties());
			this.inventory.push(new PlainBriefs());

			
			this.typesBought[this.typesBought.length] = GLOBAL.ALL;
			this.sellMarkup = 1.3;
			this.buyMarkdown = .25;
			this.keeperSell = "<i>“You have items ready to be spiritually appraised and elevated, then?”</i> Artie rubs his hands in anticipation as you approach his crate. <i>“Let’s see what you have and what they are, ahem, worth.”</i>\n";
			this.keeperBuy = "Geoff smiles at you as you carefully make your way over to him.\n\n<i>“Hey, [pc.name]. Looking to buy something?”</i>\n";
			this.keeperGreeting = "Artie nods at you as you enter the scrap yard hut, smiling peacefully as he closes his eyes and goes back to meditating over a large diode. Geoff is busy working on something in the back.\n";
			
			this.femininity = 20;
			this.eyeType = 0;
			this.eyeColor = "brown";
			this.tallness = 78;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "brown";
			this.scaleColor = "FIXME";
			//this.scaleColor = titsPtr.chars["PC"].scaleColor;
			this.furColor = "FIXME";
			//this.furColor = titsPtr.chars["PC"].furColor;
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "FIXME";
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
			this.hipRatingRaw = 4;
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
			this.buttRatingRaw = 4;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.4;
			//balls
			this.balls = 2;
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
			this.minutesSinceCum = 3650;
			this.timesCum = 55;
			
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
			
			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			return bustString;
		}
		
		public var bustString:String = "GEOFF";
		public function bustUpdate(isArtie:Boolean = false):void
		{
			short = (!isArtie ? "Geoff" : "Artie");
			bustString = (!isArtie ? "GEOFF" : "ARTIE");
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_PLANTIGRADE);
			}
		}

		public function UpgradeVersion2(dataObject:Object):void
		{
			dataObject.inventory.push(new Knife().getSaveObject());
			dataObject.inventory.push(new ComfortableClothes().getSaveObject());
			dataObject.inventory.push(new PlainUndershirt().getSaveObject());
			dataObject.inventory.push(new PlainBra().getSaveObject());
			dataObject.inventory.push(new PlainPanties().getSaveObject());
			dataObject.inventory.push(new PlainBriefs().getSaveObject());
		}
		public function UpgradeVersion3(dataObject:Object):void
		{
			dataObject.inventory.push(new LeatherArmor().getSaveObject());
			dataObject.inventory.push(new NaleenArmor().getSaveObject());
		}
		public function UpgradeVersion4(dataObject:Object):void
		{
			// Clear out this shit and let the default constructor handle it.
			delete dataObject.meleeWeapon;
			delete dataObject.rangedWeapon;
			delete dataObject.lustVuln;
			delete dataObject.resistances;
			delete dataObject.bonusResistances;
			delete dataObject.bonusLustVuln;
		}
		
		override public function onLeaveBuyMenu():void
		{
			short = "Geoff";
			bustString = "GEOFF";
			kGAMECLASS.mainGameMenu();
		}
	}
}