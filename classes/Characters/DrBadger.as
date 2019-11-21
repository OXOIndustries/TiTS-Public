package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Items.Miscellaneous.Throbb;
	import classes.Items.Miscellaneous.Dumbfuck;
	import classes.Items.Transformatives.Gush;
	import classes.Items.Transformatives.Soak;
	import classes.Items.Accessories.BimboleumDefenseSystem;
	import classes.Items.Guns.SlutRay;
	public class DrBadger extends Creature
	{
		//constructor
		public function DrBadger()
		{
			this._latestVersion = 5;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			// Note: Shop inventory handeled by drBadgerBuyMenu(), in tarkus/drBadger.as
			/*
			this.inventory.push(new Dumbfuck());
			this.inventory.push(new Gush());
			this.inventory.push(new Soak());
			this.inventory.push(new Throbb());
			this.inventory.push(new SlutRay());
			this.inventory.push(new BimboleumDefenseSystem());
			*/
			this.typesBought[this.typesBought.length] = GLOBAL.PILL;
			this.typesBought[this.typesBought.length] = GLOBAL.POTION;
			this.typesBought[this.typesBought.length] = GLOBAL.DRUG;
			this.sellMarkup = 1.5;
			this.buyMarkdown = .5;
			keeperBuy = "The “good” doctor points you towards a nearby display with a bored look on her face. It’s clear she’d rather have you doing something other than shopping.\n";
			keeperSell = "Doctor Badger rolls her eyes but begrudgingly looks over your possessions.\n";
			keeperGreeting = "<i>“So what do you want then?”</i> Doctor Badger grumps.\n";

			this.short = "Dr. Badger";
			this.originalRace = "anthromorph";
			this.a = "";
			this.capitalA = "";
			this.long = "Placeholder";
			this.customDodge = "Dr. Badger Don’t Dodge Foo";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.longName = "semi-solid fist";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "nanoweave utilisuit";
			this.armor.defense = 5;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 14;
			this.reflexesRaw = 7;
			this.aimRaw = 15;
			this.intelligenceRaw = 20;
			this.willpowerRaw = 10;
			this.libidoRaw = 75;
			this.HPMod = 20;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 45;
			
			this.level = 5;
			this.XPRaw = bossXP();
			this.credits = 1000;
			
			this.femininity = 80;
			this.eyeType = 0;
			this.eyeColor = "green";
			this.tallness = 71;
			this.thickness = 80;
			this.tone = 0;
			this.hairColor = "black";
			this.scaleColor = "ebony";
			this.furColor = "black";
			this.hairLength = 11;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "black";
			this.skinFlags = [GLOBAL.FLAG_THICK, GLOBAL.FLAG_FLUFFY];
			this.faceType = GLOBAL.TYPE_BADGER;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED];
			this.tongueType = GLOBAL.TYPE_BADGER;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_BADGER;
			this.earFlags = [GLOBAL.FLAG_FURRED];
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_BADGER;
			this.armFlags = [GLOBAL.FLAG_FURRED];
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_BADGER;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_FURRED, GLOBAL.FLAG_PAWS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_BADGER;
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
			this.hipRatingRaw = 13;
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
			this.buttRatingRaw = 13;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1.5;
			this.cocks[0].cLengthRaw = 13;
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 30;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 90;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 65;
			this.timesCum = 12133;
			this.cockVirgin = false;
			this.analVirgin = false;
			this.vaginalVirgin = false;
			
			this.createVagina();
			this.vaginas[0].bonusCapacity = 20;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].wetnessRaw = 2;
			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 19;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			
			this._isLoading = false;
			this.createStatusEffect("Undetected Furpies");
		}
		public function UpgradeVersion5(dataObject:Object):void
		{
			// Readjust types and flags
			dataObject.tailType = GLOBAL.TYPE_BADGER;
			dataObject.tailFlags = [GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];
			dataObject.skinType = GLOBAL.SKIN_TYPE_FUR;
			dataObject.skinFlags = [GLOBAL.FLAG_THICK, GLOBAL.FLAG_FLUFFY];
			dataObject.legType = GLOBAL.TYPE_BADGER;
			dataObject.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_FURRED, GLOBAL.FLAG_PAWS];
			dataObject.armType = GLOBAL.TYPE_BADGER;
			dataObject.armFlags = [GLOBAL.FLAG_FURRED];
			dataObject.faceType = GLOBAL.TYPE_BADGER;
			dataObject.faceFlags = [GLOBAL.FLAG_MUZZLED];
			dataObject.earType = GLOBAL.TYPE_BADGER;
			dataObject.earFlags = [GLOBAL.FLAG_FURRED];
		}
		public function UpgradeVersion4(dataObject:Object):void
		{
			dataObject.inventory.push(new BimboleumDefenseSystem().getSaveObject());
		}
		public function UpgradeVersion3(dataObject:Object):void
		{
			dataObject.inventory.push(new SlutRay().getSaveObject());
		}
		public function UpgradeVersion2(d:Object):void
		{
			delete d.meleeWeapon;
			delete d.armor;
			
			delete d.lustVuln;
			delete d.resistances;
			delete d.bonusResistances;
			delete d.bonusLustVuln;
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.inventory.push(new Gush().getSaveObject());
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.mainGameMenu();
		}
		override public function get bustDisplay():String
		{
			return "DRBADGER";
		}
		override public function isBimbo():Boolean
		{
			return (kGAMECLASS.flags["BADGER_QUEST"] <= -3);
		}
	}
}
