package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	
	public class CuntSnake extends Creature
	{
		//constructor
		public function CuntSnake()
		{

			this.short = "cunt snake";
			this.originalRace = "cunt snake";
			this.a = "a ";
			this.capitalA = "A ";
			this.tallness = 24 + rand(36);
			this.scaleColor = "green";
			this.long = "The green-hued cunt snake blends in well with vegetation. It has no visible eyes, though there are two sensory bulbs atop its head. The reptilian alien is somewhere around " + num2Text(Math.round(this.tallness/12)) + " feet in length and moves with such sinuous, unpredictable grace that it would be difficult to hit from long range, but the fangs seem to suggest you keep your distance. A moist, drooling pussy is visible at the end of its body. It often shifts to point it towards you so that you can see just how sopping wet the hole is.";
			this.customDodge = "The cunt snake sways aside at the last second!";
			this.customBlock = "Your attack deflects off the cunt snake's " + this.scaleColor + " scales!";
			this.plural = false;
			this.lustVuln = 1;
			this.meleeWeapon.attackVerb = "bite";
			this.meleeWeapon.damageType = GLOBAL.PIERCING;
			this.meleeWeapon.attack = 2;
			this.meleeWeapon.damage = 4;
			this.meleeWeapon.longName = "fangs";
			this.armor.longName = "glittering scales";
			this.armor.defense = 0;
			this.physiqueRaw = 1;
			this.reflexesRaw = 5;
			this.aimRaw = 4;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XP = 50;
			this.level = 1;
			this.credits = 0;
			this.HPMod = -5;
			this.HPRaw = this.HPMax();
			
			this.femininity = 50;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 1;
			this.tone = 80;
			this.hairColor = "red";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.CUNTSNAKE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.CUNTSNAKE;
			this.lipMod = 1;
			this.earType = GLOBAL.CUNTSNAKE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.CUNTSNAKE;
			this.legCount = 1;
			this.legFlags = new Array(GLOBAL.TENDRIL);
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.CUNTSNAKE;
			this.tailCount = 1;
			this.tailFlags = new Array(GLOBAL.SCALED,GLOBAL.LONG,GLOBAL.THICK,GLOBAL.PREHENSILE);
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
			this.buttRating = 0;
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
			this.timesCum = 122;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertility = 1;
			this.clitLength = .5;
			this.pregnancyMultiplier = 1;
			
			this.breastRows[0].breastRating = 0;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetness = 0;
			this.createPerk("Ranged Immune",0,0,0,0);

		}
	}
}