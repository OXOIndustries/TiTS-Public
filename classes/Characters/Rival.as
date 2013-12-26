package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;

	public class Rival extends Creature
	{
		//constructor
		public function Rival()
		{
			this.short = "Jack/Jill";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.plural = false;
			this.lustVuln = 1;
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.longName = "fist";
			this.armor.longName = "A-type personal defense suit";
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
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XP = 50;
			this.level = 1;
			this.credits = 1000;
			this.femininity = 50;
			this.eyeType = 0;
			this.eyeColor = "FIXME";
			//this.eyeColor = pcPtr.eyeColor;
			this.tallness = 65;
			this.thickness = 50;
			this.tone = 50;
			this.hairColor = "FIXME";
			//this.hairColor = pcPtr.hairColor;
	    	this.scaleColor = "FIXME";
	    	//this.scaleColor = pcPtr.scaleColor;
			this.furColor = "FIXME";
			//this.furColor = pcPtr.furColor;
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN;
			this.skinTone = "FIXME";
			//this.skinTone = pcPtr.skinTone;
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
			this.legType = GLOBAL.HUMAN;
			this.legCount = 2;
			this.legFlags = new Array(GLOBAL.PLANTIGRADE);
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
			this.hipRating = 4;
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
			this.buttRating = 4;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplier = 50;
			//this.cumMultiplier = pcPtr.cumMultiplier;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQuality = 1;
			this.cumType = GLOBAL.CUM;
			this.ballSize = 1.5;
			//this.ballSize = pcPtr.ballSize;
			this.ballFullness = 900;
			//this.ballFullness = pcPtr.ballFullness;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 900;
			//this.ballEfficiency = pcPtr.ballFullness;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 900;
			//this.refractoryRate = pcPtr.refractoryRate;
			this.minutesSinceCum = 9000;
			//this.minutesSinceCum = pcPtr.minutesSinceCum;
			this.timesCum = 55;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertility = 5;
			this.clitLength = .5;
			this.pregnancyMultiplier = 1;
			this.breastRows[0].breastRating = 0;
			this.nippleColor = "maroon (fixme)";
			//this.nippleColor = pcPtr.nippleColor;
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetness = 0;
		}
	}
}