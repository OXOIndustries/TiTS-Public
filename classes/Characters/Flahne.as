package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	
	public class Flahne extends Creature
	{
		//constructor
		public function Flahne()
		{
			this.short = "Flahne";
			this.originalRace = "loo'rahn";
			this.a = "";
			this.capitalA = "";
			this.long = "Placeholder";
			this.customDodge = "The goo twists a portion of its body out of the way of the attack, moving in a way that would be fatal for any vertebrate.";
			this.customBlock = "Your attack sinks into the goo, the wound vanishing almost instantly as her surface recloses.";
			this.plural = false;
			this.lustVuln = 1;
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.longName = "semi-solid fist";
			this.armor.longName = "durable dermis";
			this.armor.defense = 10;
			this.physiqueRaw = 2;
			this.reflexesRaw = 3;
			this.aimRaw = 1;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 1;
			this.libidoRaw = 65;
			this.HPMod = 15;
			this.shieldsRaw = 0;
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.resistances = new Array(0,0,0,0,0,0,0,0);
			this.XP = 50;
			this.level = 1;
			this.credits = 0;
			
			this.femininity = 90;
			this.eyeType = 0;
			this.eyeColor = "violet";
			this.tallness = 60;
			this.thickness = 80;
			this.tone = 0;
			this.hairColor = "amber";
			this.scaleColor = "yellow";
			this.furColor = "amber";
			this.hairLength = 18;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.GOO;
			this.skinTone = "yellow";
			this.skinFlags = new Array(GLOBAL.SQUISHY,GLOBAL.LUBRICATED);
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 2;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.GOOEY;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.GOOEY;
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
			this.hipRating = 13;
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
			this.buttRating = 13;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThickness = 4;
			this.cocks[0].cLength = 16;
			this.cocks[0].addFlag(GLOBAL.LUBRICATED);
			this.cocks[0].addFlag(GLOBAL.SQUISHY);
			this.cocks[0].addFlag(GLOBAL.SMOOTH);
			//balls
			this.balls = 0;
			this.cumMultiplier = 50;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQuality = 1;
			this.cumType = GLOBAL.CUM;
			this.ballSize = 0;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 400;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 65;
			this.timesCum = 9001;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetness = 4;
			this.vaginas[0].looseness = 1;
			this.vaginas[0].bonusCapacity = 100;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertility = 15;
			this.clitLength = .5;
			this.pregnancyMultiplier = 1;
			
			this.breastRows[0].breastRating = 15;
			this.nippleColor = "honey";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetness = 3;
		}
	}
}