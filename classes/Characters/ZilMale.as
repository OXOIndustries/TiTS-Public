package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	
	public class ZilMale extends Creature
	{
		//constructor
		public function ZilMale()
		{
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "zil male";
			this.originalRace = "zil";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "OHGODFIXME";
			this.customDodge = "The zil zips out of the way with a swift contortion of his agile frame.";
			this.customBlock = "The zil's chitinous armor deflects your attack.";
			this.plural = false;
			this.lustVuln = 1;
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.longName = "fists";
			this.armor.longName = "chitinous plating";
			this.armor.defense = 2;
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
			this.XP = 20;
			this.level = 1;
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			
			
			this.femininity = 35;
			this.eyeType = GLOBAL.BEE;
			this.eyeColor = "black";
			this.tallness = 54;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "black";
			this.scaleColor = "black";
			this.furColor = "yellow";
			this.hairLength = 3;
			this.hairType = GLOBAL.BEE;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.CHITIN;
			this.skinTone = "black";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.BEE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.BEE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.BEE;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.BEE;
			this.gills = false;
			this.wingType = GLOBAL.BEE;
			this.legType = GLOBAL.BEE;
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
			this.hipRating = 0;
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
			this.buttRating = 2;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLength = 6;
			this.cocks[0].cThickness = 1.75;
			//balls
			this.balls = 2;
			this.cumMultiplier = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQuality = 1;
			this.cumType = GLOBAL.HONEY;
			this.ballSize = 1;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 3650;
			this.timesCum = 321;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertility = 5;
			this.clitLength = .5;
			this.pregnancyMultiplier = 1;
			
			this.breastRows[0].breastRating = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.HONEY;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetness = 0;
			this.ass.bonusCapacity += 15
		}
	}
}