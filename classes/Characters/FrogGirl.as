package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.kGAMECLASS;
	import classes.rand;
	
	public class FrogGirl extends Creature
	{
		
		
		//constructor
		public function FrogGirl()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "kerokoras";
			this.originalRace = "kerokoras";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "PLACEHOLDAH!";
			this.customDodge = "The frog-girl twists out of the way on powerful legs.";
			this.customBlock = "The frog-girl's skin proves remarkably durable!";
			this.plural = false;
			this.lustVuln = 1;
			
			this.meleeWeapon.attackVerb = "claw";
			this.meleeWeapon.longName = "claws";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "shimmering scales";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 8;
			this.reflexesRaw = 10;
			this.aimRaw = 1;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 8;
			this.libidoRaw = 30;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 30;
			this.resistances = new Array(1,1,1,1,1,1,1,1);
			this.XPRaw = 50;
			this.level = 2;
			this.credits = 0;
			this.HPMod = 20;
			this.HPRaw = this.HPMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "varied";
			this.tallness = 1; //See initialization below - randomized!
			this.thickness = 33;
			this.tone = 50;
			this.hairColor = "green"; //No hair doh!
			this.scaleColor = "green"; //Same with scales
			this.furColor = "orange"; //Same fur fur
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_SNAKE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
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
			this.hipRatingRaw = 8;
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
			this.buttRatingRaw = 7;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
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
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].bonusCapacity = 10;
			this.vaginas[0].type = GLOBAL.TYPE_LIZAN;
			this.vaginas[0].vaginaColor = "pink";
			//Goo is hyper friendly!
			this.elasticity = 1.0;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.00;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			this.ass.bonusCapacity = 10;
			
			this.createStatusEffect("Disarm Immune");

			//this.inventory.push(new NaleenNip());
			
			this._isLoading = false;
		}
		
		override public function setDefaultSexualPreferences():void
		{
			
			this.sexualPreferences.setRandomPrefs(4 + rand(3));
			//Special like:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,GLOBAL.REALLY_LIKES_SEXPREF);
		}
		
		override public function prepForCombat():void
		{
			var combatFrog:FrogGirl = this.makeCopy();
			
			combatFrog.setDefaultSexualPreferences();
			
			var colorSelect:int = rand(7);
			if(colorSelect == 0) combatFrog.skinTone = "orange and green";
			else if(colorSelect == 1) combatFrog.skinTone = "mottled brown";
			else if(colorSelect == 2) combatFrog.skinTone = "black and gold";
			else if(colorSelect == 3) combatFrog.skinTone = "black and blue";
			else if(colorSelect == 4) combatFrog.skinTone = "black and red";
			else if(colorSelect == 5) combatFrog.skinTone = "red and blue";
			else if(colorSelect == 6) combatFrog.skinTone = "black, blue, and yellow";
			else combatFrog.skinTone = "gold";

			combatFrog.long = "The short and sleek alien before you dodges about with practiced ease. Her " + combatFrog.skinTone + " skin shines with a coating of lust inducing toxins. A grin crosses her features as she gazes at you with unrestrained need. Despite the soft appearance of her body, you can see toned muscle coiled beneath her pliant flesh. She’s ready to fight if it means getting ";
			if(kGAMECLASS.pc.hasCock()) combatFrog.long += "into your pants";
			else combatFrog.long += "you out of the way";
			combatFrog.long += ".";
			combatFrog.lustRaw = 20 + rand(30);
			combatFrog.tallness = 54 + rand(13);

			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 2 + rand(3);
			this.vaginas[0].loosenessRaw = 1 + rand(4);
			this.vaginas[0].bonusCapacity = 10;
			this.vaginas[0].type = GLOBAL.TYPE_LIZAN;
			this.vaginas[0].vaginaColor = combatFrog.skinTone;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1 + rand(3);
			this.ass.bonusCapacity = 10;
			kGAMECLASS.foes.push(combatFrog);
			kGAMECLASS.showFrogGirl();
			kGAMECLASS.setLocation("FIGHT:\nKEROKORAS", "PLANET: MHEN'GA", "SYSTEM: ARA ARA");
		}
	}
}