package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.*
	import classes.Items.Melee.Fists;
	
	public class ElderVenusPitcher extends Creature
	{
		
		
		//constructor
		public function ElderVenusPitcher()
		{
			this._latestVersion = 2;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "elder venus\npitcher";
			this.originalRace = "venus pitcher";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The venus pitcher is not a combat mob. Thus this should never be shown.";
			this.customDodge = "";
			this.customBlock = "";
			this.plural = false;
			this.lustVuln = 1;
			
			this.meleeWeapon = new Fists();
			
			this.rangedWeapon.attack = 1;
			this.rangedWeapon.longName = "dart";
			this.rangedWeapon.attackVerb = "dart";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 2;
			this.reflexesRaw = 2;
			this.aimRaw = 1;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 45;
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XPRaw = 20;
			this.level = 1;
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			

			this.femininity = 95;
			this.eyeType = GLOBAL.TYPE_VENUSPITCHER;
			this.eyeColor = "green";
			this.tallness = 65;
			this.thickness = 35;
			this.tone = 20;
			this.hairColor = "green";
			this.scaleColor = this.scaleColor;
			this.furColor = "yellow";
			this.hairLength = 24;
			this.hairType = GLOBAL.HAIR_TYPE_TENTACLES;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale green";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_VENUSPITCHER;
			this.lipMod = 3;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_VENUSPITCHER;
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
			this.buttRatingRaw = 13;
			//No dicks here!
			this.cocks = new Array();
			this.createCock(10,2.5);
			this.cocks[0].cType = GLOBAL.TYPE_VENUSPITCHER;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 10;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUMSAP;
			this.ballSizeRaw = 0;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 50;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 200;
			this.minutesSinceCum = 3650;
			this.timesCum = 20;
			this.impregnationType = "VenusPitcherSeedCarrier";
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.25;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 11;
			this.nippleColor = "dark green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILKSAP;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			this._isLoading = false;
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_PLANTIGRADE);
			}
		}
	}
}