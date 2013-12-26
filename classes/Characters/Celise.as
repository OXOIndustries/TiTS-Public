package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	
	public class Celise extends Creature
	{
		//constructor
		public function Celise()
		{

			this.short = "Celise";
			this.originalRace = "galotian";
			this.a = "";
			this.capitalA = "";
			this.long = "A three foot high, oblong ball of goo jiggles and wobbles across from you, its surface somehow holding back the liquid weight inside even though it appears no more solid than the rest of it. Atop the mound of viridian goop is the torso of a ultrapornstar goddess. Pendulous breasts hang from the front of her glittering chest, obscuring everything above her navel with gooey boob. Her eyes glitter with a predatory mirth, slightly darker in hue than the rest of her, a color matched by her plump, wet-looking lips. You need to defeat her if you ever want to lay claim to Dad’s fortune and make him proud!";
			this.customDodge = "The goo twists a portion of its body out of the way of the attack, moving in a way that would be fatal for any vertebrate.";
			this.customBlock = "Your attack sinks into the goo, the wound vanishing almost instantly as her surface recloses.";
			this.plural = false;
			this.lustVuln = 1;
			this.meleeWeapon.attackVerb = "slap";
			this.meleeWeapon.longName = "gooey psuedopod";
			this.armor.longName = "gooey coverings";
			this.armor.defense = 50;
			this.physiqueRaw = 3;
			this.reflexesRaw = 1;
			this.aimRaw = 1;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 100;
			this.HPMod = 100;
			this.shieldsRaw = 0;
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 85;
			this.resistances = new Array(0,0,0,0,0,0,0,0);
			this.XP = 50;
			this.level = 1;
			this.credits = 0;
			
			this.femininity = 90;
			this.eyeType = 0;
			this.eyeColor = "green";
			this.tallness = 49;
			this.thickness = 60;
			this.tone = 50;
			this.hairColor = "green";
		    this.scaleColor = "green";
			this.furColor = "green";
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.GOO;
			this.skinTone = "green";
			this.skinFlags = new Array(GLOBAL.SQUISHY,GLOBAL.LUBRICATED,GLOBAL.AMORPHOUS);
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.GOOEY;
			this.legCount = 1;
			this.legFlags = new Array(GLOBAL.AMORPHOUS);
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
			this.hipRating = 15;
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
			this.buttRating = 10;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplier = 50;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQuality = 1;
			this.cumType = GLOBAL.CUM;
			this.ballSize = 24;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 400;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 9000;
			this.timesCum = 5674;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetness = 5;
			this.vaginas[0].looseness = 1;
			this.vaginas[0].bonusCapacity = 10;
			//Goo is hyper friendly!
			this.elasticity = 100;
			//Fertility is a % out of 100. 
			this.fertility = 1;
			this.clitLength = .5;
			this.pregnancyMultiplier = 1;
			
			this.breastRows[0].breastRating = 14;
			this.nippleColor = "deep emerald";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetness = 5;

		}
	}
}