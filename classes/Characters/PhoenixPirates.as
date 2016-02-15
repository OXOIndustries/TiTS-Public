package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Melee.Fists;
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	
	public class PhoenixPirates extends Creature
	{
		//constructor
		public function PhoenixPirates()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "void pirate";
			this.originalRace = "human";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customBlock = "The pirate’s armor deflects your attack with alarming ease.";
			this.isPlural = false;
			isLustImmune = true;
			
			this.meleeWeapon = new Fists();
			this.rangedWeapon = new MagnumPistol();
			rangedWeapon.attackVerb = "shoot";
			rangedWeapon.attackNoun = "shot";
			rangedWeapon.hasRandomProperties = true;
			this.shield = new ImprovisedShield();
			
			this.armor.longName = "black void armor";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 8;
			this.reflexesRaw = 10;
			this.aimRaw = 10;
			this.intelligenceRaw = 8;
			this.willpowerRaw = 10;
			this.libidoRaw = 20;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.XPRaw = 100;
			this.level = 4;
			this.credits = 100 + rand(68);
			this.HPMod = -20;
			this.HPRaw = this.HPMax();
			
			this.femininity = 35;
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
			this.createCock();
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.75;
			//balls
			this.balls = 2;
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
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			isUniqueInFight = false;
			btnTargetText = "Pirate";
			
			this._isLoading = false;
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
		}
		
		override public function get bustDisplay():String
		{
			return "VOIDPIRATE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var bSideChance:int = 25;
			if (rand(100) <= bSideChance)
			{
				phoenixPiratesBroadside(target);
				return;
			}

			if (!hasStatusEffect("Carpet Grenade Cooldown") && rand(5) == 0) // Probably better to share this cooldown across ALL enemies.
			{
				createStatusEffect("Carpet Grenade Cooldown", 5, 0, 0, 0);
				phoenixPiratesCarpetGrenades(target);
				return;
			}

			if (rand(100) <= 25 && energy() >= 20)
			{
				phoenixPiratesBulletstorm(target);
				return;
			}

			// Fallback ranged attacku
			CombatAttacks.RangedAttack(this, target);
		}
		
		private function phoenixPiratesBulletstorm(target:Creature):void
		{
			output("One of the pirates pops up from cover, firing on full-auto and sending a withering hail of gunfire downrange at you!");

			energy(-20);

			for (var i:int = 0; i < 3; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}
		
		private function phoenixPiratesCarpetGrenades(target:Creature):void
		{
			output("<i>“Frag out!”</i> one of the pirates shouts, hurling a beeping black cylinder " + (target is PlayerCharacter ? "your way. You dive" : "Saendra's way. She dives") + " out of the way, but still " + (target is PlayerCharacter ? "get" : "gets") + " riddled with shrapnel.");
			
			applyDamage(new TypeCollection( { kinetic: 25 }, DamageFlag.PENETRATING), this, target);
		}
		
		private function phoenixPiratesBroadside(target:Creature):void
		{
			output("Suddenly, a particularly stealthy pirate pops up on your portside flank, poised to pound " + (target is PlayerCharacter ? "you" : "Saendra") + " into a pulp with a particularly potent-looking pump-action shotgun.");

			if (target is PlayerCharacter) output(" You get blasted by the shotty, throwing you back with the sheer force of the sneak attack!");
			else output(" She gets blasted by the shotty, thrown back by the sheer force of the attack!");
			
			applyDamage(new TypeCollection( { kinetic: 30 }, DamageFlag.BULLET), this, target);
		}
	}
}
