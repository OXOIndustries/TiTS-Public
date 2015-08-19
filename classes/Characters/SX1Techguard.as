package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Melee.Fists;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.VaginaClass;
	
	//Low health, mid armor, heavy shields. Carries a rapid-fire, low-damage gun. Level 5.

	public class SX1Techguard extends Creature
	{
		//constructor
		public function SX1Techguard()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "pirate techie";
			this.originalRace = "ausar";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "You're fighting a pirate techie, an ausar woman in a flight suit with a machine pistol at her hip. She's got a shock of blonde hair, perky breasts under her suit, and a shield generator that's thrumming with overcharged energy.";
			this.customBlock = "The pirates armor deflects your attack with an alarming ease.";
			this.plural = false;
			isLustImmune = false;
			
			this.meleeWeapon = new Fists();
			this.rangedWeapon = new MagnumPistol();
			rangedWeapon.attackVerb = "shoot";
			rangedWeapon.attackNoun = "shot";
			rangedWeapon.longName = "machine pistol";
			rangedWeapon.hasRandomProperties = true;
			this.shield = new JoyCoPremiumShield();
			shield.shields = 120;
			shield.hasRandomProperties = true;
			
			this.armor.longName = "flight suit";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 10;
			this.reflexesRaw = 18;
			this.aimRaw = 18;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 8;
			this.libidoRaw = 20;
			this.shieldsRaw = shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.XPRaw = 500;
			this.level = 5;
			this.credits = 400 + rand(37);
			this.HPMod = -35;
			this.HPRaw = this.HPMax();
			
			this.femininity = 100;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "black";
			this.tallness = 68;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "black";
			this.scaleColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.legType = GLOBAL.TYPE_HUMAN;
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
			this.hipRatingRaw = 0;
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
			this.buttRatingRaw = 2;
			//No dicks here!
			this.cocks = new Array();
			this.vaginas = [new VaginaClass()];
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 1.5;
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
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 4;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			this._isLoading = false;
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
		}
		
		override public function prepForCombat():void
		{
			var techie:SX1Techguard = this.makeCopy();
			
			techie.sexualPreferences.setRandomPrefs(4, 2);
			
			kGAMECLASS.userInterface.showBust("TECHGUARD");
			kGAMECLASS.showName("FIGHT:\nPIRATE TECHIE");
			
			kGAMECLASS.foes.push(techie);
		}
	}
}