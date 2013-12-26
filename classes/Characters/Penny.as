package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	
	public class Penny extends Creature
	{
		//constructor
		public function Penny()
		{

			this.short = "Penny";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.long = "uncreated";
			this.customDodge = "uncreated";
			this.customBlock = "uncreated";
			this.plural = false;
			this.lustVuln = 1;
			this.meleeWeapon.attackVerb = "smack";
			this.meleeWeapon.longName = "tonfas";
			this.armor.longName = "U.G.C. Peacekeeper uniform";
			this.armor.defense = 0;
			this.physiqueRaw = 10;
			this.reflexesRaw = 8;
			this.aimRaw = 6;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 3;
			this.libidoRaw = 40;
			this.shieldsRaw = 20;
			this.energyRaw = 100;
			this.lustRaw = 85;
			this.resistances = new Array(0,0,0,0,0,0,0,0);
			this.XP = 50;
			this.level = 1;
			this.credits = 0;
			this.HPMod = 20;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "blue";
			this.tallness = 60;
			this.thickness = 40;
			this.tone = 70;
			this.hairColor = "red";
			this.scaleColor = "bronze";
			this.furColor = "tawny";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.FUR;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.VULPINE;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = GLOBAL.VULPINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = new Array(GLOBAL.DIGITIGRADE);
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.VULPINE;
			this.tailCount = 1;
			this.tailFlags = new Array(GLOBAL.FLUFFY,GLOBAL.LONG,GLOBAL.THICK,GLOBAL.FURRED);
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
			this.hipRating = 8;
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
			this.buttRating = 7;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplier = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQuality = 1;
			this.cumType = GLOBAL.CUM;
			this.ballSize = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 9000;
			this.timesCum = 785;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetness = 2;
			this.vaginas[0].looseness = 1;
			this.vaginas[0].bonusCapacity = 0;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertility = 1;
			this.clitLength = .5;
			this.pregnancyMultiplier = 1;
			
			this.breastRows[0].breastRating = 6;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetness = 0;

		}
	}
}