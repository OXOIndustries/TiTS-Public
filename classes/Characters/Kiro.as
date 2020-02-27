package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.StorageClass;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Guns.HammerCarbine;
	import classes.Items.Protection.JoyCoPremiumShield;
	
	/**
	 * KIRO FLAG DOCS
	 * "RESCUE KIRO FROM BLUEBALLS" (Undefined = not attempted, -1 ignored the message or left her, 1 = saved from beachedballs)
	 */
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Kiro extends Creature
	{
		public function Kiro() 
		{
			this._latestVersion = 7;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Kiro";
			this.originalRace = "kui-tan";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "Kiro casually sidesteps out of the way";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon = new ShockBlade();
			this.meleeWeapon.hasRandomProperties = true;
			meleeWeapon.baseDamage.electric.damageValue = 3;
			
			this.rangedWeapon = new HammerCarbine();
			this.rangedWeapon.hasRandomProperties = true;
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "shot";
			rangedWeapon.baseDamage.kinetic.damageValue = 3;
			
			this.armor.longName = "armor";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			this.shield = new JoyCoPremiumShield();
			
			this.level = 5;
			this.physiqueRaw = 12;
			this.reflexesRaw = 19;
			this.aimRaw = 18;
			this.intelligenceRaw = 11;
			this.willpowerRaw = 9;
			this.libidoRaw = 50;
			this.HPMod = 0;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			this.XPRaw = normalXP();
			
			this.credits = 1200;
			
			this.femininity = 80;
			this.eyeType = 0;
			this.eyeColor = "brown";
			this.tallness = 66;
			this.thickness = 80;
			this.tone = 25;
			this.hairColor = "brown";
			this.scaleColor = "white";
			this.furColor = "chocolate-brown";
			this.hairLength = 8;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = [];
			this.faceType = GLOBAL.TYPE_KUITAN;
			this.faceFlags = [];
			this.tongueType = 0;
			this.tongueFlags = [];
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_KUITAN;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_KUITAN;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_TANUKI;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_TANUKI;
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
			this.buttRatingRaw = 8;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1;
			this.cocks[0].cLengthRaw = 21;
			this.cocks[0].cType = GLOBAL.TYPE_EQUINE;
			this.cocks[0].cockFlags = [GLOBAL.FLAG_FLARED, GLOBAL.FLAG_SHEATHED, GLOBAL.FLAG_BLUNT]
			
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_KUITAN;
			this.vaginas[0].hymen = true;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].vaginaColor = "black";
			this.vaginas[0].vagooFlags = [];
			
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 10;
			this.ballFullness = 100;
			
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 2000;
			this.timesCum = 2478;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 0;
			this.clitLength = .25;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 11;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			
			createPerk("'Nuki Drunk", 0, 0, 0, 0, "");
			createPerk("'Nuki Nuts", 0, 0, 0, 0, "");
		}
		
		public function UpgradeVersion1(d:Object):void
		{
			delete d.armor;
			delete d.meleeWeapon;
			delete d.rangedWeapon;
			delete d.lustVuln;
			delete d.resistances;
			delete d.bonusResistances;
			delete d.bonusLustVuln;
		}
		public function UpgradeVersion2(d:Object):void
		{
			var se:StorageClass = new StorageClass();
			se.storageName = "Nuki Drunk";

			d.perks.push(se.getSaveObject());
			d.perks.sortOn("storageName", Array.CASEINSENSITIVE);
		}
		public function UpgradeVersion3(d:Object):void
		{
			d.vaginas[0].type = GLOBAL.TYPE_KUITAN;
		}
		public function UpgradeVersion4(d:Object):void
		{
			for(var i:int = 0; i < d.perks.length; i++)
			{
				if(d.perks[i].storageName == "Nuki Drunk") d.perks[i].storageName = "'Nuki Drunk";
			}
			d.perks.sortOn("storageName", Array.CASEINSENSITIVE);
		}
		public function UpgradeVersion5(d:Object):void
		{
			var se:StorageClass = new StorageClass();
			se.storageName = "'Nuki Nuts";

			d.perks.push(se.getSaveObject());
			d.perks.sortOn("storageName", Array.CASEINSENSITIVE);
		}
		public function UpgradeVersion6(d:Object):void
		{
			for(var i:int = 0; i < d.perks.length; i++)
			{
				if(d.perks[i].storageName == "Evermilk") d.perks[i].storageName = "Ever-Milk";
			}
			d.perks.sortOn("storageName", Array.CASEINSENSITIVE);
		}
		
		//Gotta reset 'dem balls!'
		override public function orgasm(): void {
			super.orgasm();
			if(kGAMECLASS.flags["KIRO_BALLS"] == 3) ballSizeRaw = 78;
			else ballSizeRaw = 10;
		}
		//Kiro milkies :3
		override public function canLactate():Boolean { return hasPerk("Ever-Milk"); }
		override public function isLactating():Boolean { return canLactate(); }
		override public function milkQ(arg:int = -1):Number { return perkv1("Ever-Milk"); }
		
		override public function get bustDisplay():String
		{
			var str:String = "KIRO";
			
			if(ballDiameter() <= 7) str += "_SM";
			else if(ballDiameter() <= 14) str += "";
			else if(ballDiameter() <= 24) str += "_LG";
			else str += "_XL";
			
			if(biggestTitSize() >= 32) str += "_2";
			else if(biggestTitSize() >= 12) str += "_1";
			else str += "";
			
			return str;
		}
	}

}
