package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
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
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Kiro";
			this.originalRace = "kui-tan";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "Kiro casually sidesteps out of the way";
			this.customBlock = "Obvious placeholder is obvious.";
			this.plural = false;
			this.lustVuln = 1;
			
			this.meleeWeapon = new ShockBlade();
			this.meleeWeapon.hasRandomProperties = true;
			this.meleeWeapon.damage = 3;
			
			this.rangedWeapon = new HammerCarbine();
			this.rangedWeapon.hasRandomProperties = true;
			this.rangedWeapon.attackVerb = "shot";
			this.rangedWeapon.damage = 3;
			
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
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XPRaw = 500;
			
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
			this.cocks[0].cThicknessRatioRaw = 3.5;
			this.cocks[0].cLengthRaw = 21;
			this.cocks[0].cType = GLOBAL.TYPE_EQUINE;
			this.cocks[0].cockFlags = [GLOBAL.FLAG_FLARED, GLOBAL.FLAG_SHEATHED, GLOBAL.FLAG_BLUNT]
			
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = 0;
			this.vaginas[0].hymen = true;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].vagooFlags = [];
			
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 100;
			
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
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
		}
		
	}

}