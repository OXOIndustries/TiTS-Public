package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.rand;
	
	import classes.Engine.Utility.num2Text;
	
	public class CuntSnake extends Creature
	{
		
		
		//constructor
		public function CuntSnake()
		{	
			this._latestVersion = 2;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
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
			this.lustVuln = 0;
			
			this.meleeWeapon.attackVerb = "bite";
			this.meleeWeapon.damageType = GLOBAL.PIERCING;
			this.meleeWeapon.attack = 2;
			this.meleeWeapon.damage = 4;
			this.meleeWeapon.longName = "fangs";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "glittering scales";
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;
			
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
			this.XPRaw = 20;
			this.level = 1;
			this.credits = 0;
			this.HPMod = 0;
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
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_CUNTSNAKE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_CUNTSNAKE;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_CUNTSNAKE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CUNTSNAKE;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_TENDRIL];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CUNTSNAKE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_SCALED, GLOBAL.FLAG_LONG, GLOBAL.FLAG_THICK, GLOBAL.FLAG_PREHENSILE];
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
			this.buttRatingRaw = 0;
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
			this.timesCum = 122;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			
			this.createPerk("Ranged Immune",0,0,0,0);
			this.createStatusEffect("Disarm Immune");
			
			this._isLoading = false;
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_TENDRIL);
			}
		}
		
		// There's actually some WeirdShit™ going down here that we might have to go a different way to fix.
		// Parser tags are looking at the "base" objects for data -- ie things in the chars[] array.
		// We're making instance modifications to the base types, and moving them to foes[]... where the parser
		// doesn't look to pull info from.
		// ie, we should be modifying the base type in chars[], and then make a copy for foes[]
		override public function prepForCombat():void
		{
			var combatCSnake:CuntSnake = this.makeCopy();

			kGAMECLASS.userInterface.showBust("CUNTSNAKE");
			kGAMECLASS.setLocation("FIGHT:\nCUNT SNAKE", "PLANET: MHEN'GA", "SYSTEM: ARA ARA");
			
			combatCSnake.tallness = 24 + rand(36);
			combatCSnake.scaleColor = "green";
			combatCSnake.long = "The green-hued cunt snake blends in well with vegetation. It has no visible eyes, though there are two sensory bulbs atop its head. The reptilian alien is somewhere around " + num2Text(Math.round(combatCSnake.tallness/12)) + " feet in length and moves with such sinuous, unpredictable grace that it would be difficult to hit from long range, but the fangs seem to suggest you keep your distance. A ";
			
			if(rand(5) == 0) 
			{
				combatCSnake.tailGenitalArg = GLOBAL.TYPE_HUMAN;
				combatCSnake.long += "<b>slippery, terran-like cunt</b>";
			}
			else if(rand(4) == 0) 
			{
				combatCSnake.tailGenitalArg = GLOBAL.TYPE_EQUINE;
				combatCSnake.long += "<b>puffy, horse-like gash</b>";
			}
			else if(rand(3) == 0) 
			{
				combatCSnake.tailGenitalArg = GLOBAL.TYPE_CANINE;
				combatCSnake.long += "<b>slippery, dog-like slit</b>";
			}
			else if(rand(2) == 0) 
			{
				combatCSnake.tailGenitalArg = GLOBAL.TYPE_GOOEY;
				combatCSnake.long += "<b>slippery slime creature's cunt</b>";
			}
			else 
			{
				combatCSnake.tailGenitalArg = GLOBAL.TYPE_SIREN;
				combatCSnake.long += "<b>cilia-filled tunnel</b>";
			}	

			combatCSnake.long += " is visible at the end of its body. It often shifts to point it towards you so that you can see just how sopping wet the hole is.";
			combatCSnake.customDodge = "The cunt snake sways aside at the last second!";
			combatCSnake.customBlock = "Your attack deflects off the cunt snake's " + combatCSnake.scaleColor + " scales!";

			// What's all this shit for? Is i supposed to still be here after all the rand^ calls? It was in the initCSnake function so...
			//combatCSnake.tailGenitalArg = GLOBAL.TYPE_HUMAN;
			//if(rand(3) == 0) combatCSnake.tailGenitalArg = GLOBAL.TYPE_EQUINE;
			//if(rand(3) == 0) combatCSnake.tailGenitalArg = GLOBAL.TYPE_CANINE;
			//if(rand(3) == 0) combatCSnake.tailGenitalArg = GLOBAL.TYPE_GOOEY;
			//if(rand(3) == 0) combatCSnake.tailGenitalArg = GLOBAL.TYPE_SIREN;

			kGAMECLASS.foes.push(combatCSnake);
		}
	}
}