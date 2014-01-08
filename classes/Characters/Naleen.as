package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*
	
	public class Naleen extends Creature
	{
		
		
		//constructor
		public function Naleen(dataObject:Object = null)
		{
			this._latestVersion = 1;
			this._neverSerialize = true;
			
			this.short = "naleen";
			this.originalRace = "naleen";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "You're fighting a Naleen: a towering, serpentine predator from the waist down, supporting a beautiful and quite busty humanoid torso that bares a more than passing resemblance to a feline, with brilliant orange and black tiger stripes and perky feline ears. Her long, fiery hair is braided down her back, ending in a green  leaf-woven bow just above her wide hips and full ass. Despite a body that screams raw sexuality, the naleen's claws are razor sharp and pointed at you as she slithers around the battle ground, ready to pounce with feline grace and reptilian power.";
			this.customDodge = "The naleen slides out of the way of your attack, serpentine body stretching and contorting in ways far beyond human ability.";
			this.customBlock = "The naleen girl catches your attack on her sharp claws, parrying the strike with feline grace.";
			this.plural = false;
			this.lustVuln = 1;
			this.meleeWeapon.attackVerb = "claw";
			this.meleeWeapon.longName = "claws";
			this.armor.longName = "shimmering scales";
			this.armor.defense = 2;
			this.physiqueRaw = 4;
			this.reflexesRaw = 11;
			this.aimRaw = 1;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 1;
			this.libidoRaw = 60;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XP = 25;
			this.level = 1;
			this.credits = 0;
			this.HPMod = 20;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = GLOBAL.FELINE;
			this.eyeColor = "green";
			this.tallness = 73;
			this.thickness = 42;
			this.tone = 70;
			this.hairColor = "red";
			this.scaleColor = "green";
			this.furColor = "orange";
			this.hairLength = 33;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.FUR;
			this.skinTone = "pale";
			this.skinFlags = new Array(GLOBAL.FLUFFY);
			
			this.faceType = GLOBAL.HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.SNAKE;
			this.lipMod = 2;
			this.earType = GLOBAL.FELINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.NAGA;
			this.legCount = 1;
			this.legFlags = new Array(GLOBAL.PREHENSILE,GLOBAL.TENDRIL,GLOBAL.SCALED);
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.SNAKE;
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
			this.hipRating = 16;
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
			this.buttRating = 8;
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
			this.timesCum = 998;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetness = 4;
			this.vaginas[0].looseness = 3;
			this.vaginas[0].bonusCapacity = 1000;
			//Goo is hyper friendly!
			this.elasticity = 1.4;
			//Fertility is a % out of 100. 
			this.fertility = 30;
			this.clitLength = .5;
			this.pregnancyMultiplier = 1;
			
			this.breastRows[0].breastRating = 15;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetness = 0;
			this.ass.looseness = 3;
			this.ass.bonusCapacity = 1000;
			
			this.inventory[0] = new classes.Items.Miscellaneous.NaleenNip();			
			
			if (dataObject != null)
			{
				super.loadSaveObject(dataObject);
			}
			else
			{
				this.version = _latestVersion;
			}
		}
	}
}