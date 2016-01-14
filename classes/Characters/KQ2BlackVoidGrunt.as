package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Melee.Fists;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	
	public class KQ2BlackVoidGrunt extends Creature
	{
		//constructor
		public function KQ2BlackVoidGrunt()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "void pirate";
			originalRace = "human";
			a = "the ";
			capitalA = "The ";
			// this.long = "Several armed men in black-and-red heavy armor have stormed into the construction site, wildly firing machine pistols at you and your companion. It's almost impossible to see in here, except by the occasional muzzle flashes and showers of sparks as bullets slam into the metal bulkheads.\n\nNot far from you, Saen ducks into and out of cover, evading bursts of enemy fire and returning it as quick as she can.";
			this.long = "A man in black-and-red armor, armed with machine pistol.";
			this.customBlock = "The pirate’s armor deflects your attack with alarming ease.";
			this.isPlural = false;
			isLustImmune = true;
			
			this.meleeWeapon = new ShockBlade();
			this.rangedWeapon = new MagnumPistol();
			rangedWeapon.longName = "machine pistol"
			rangedWeapon.attackVerb = "shoot";
			rangedWeapon.attackNoun = "shot";
			rangedWeapon.hasRandomProperties = true;
			rangedWeapon.baseDamage = new TypeCollection();
			rangedWeapon.baseDamage.kinetic.damageValue = 7;
			rangedWeapon.attack = 4;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			
			this.shield = new JoyCoPremiumShield();
			
			this.armor.longName = "black void armor";
			this.armor.defense = 5;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 17;
			this.reflexesRaw = 15;
			this.aimRaw = 16;
			this.intelligenceRaw = 12;
			this.willpowerRaw = 14;
			this.libidoRaw = 20;
			this.shieldsRaw = 40;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.XPRaw = 500;
			this.level = 5;
			this.credits = 80 + rand(80);
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			
			this.createPerk("Multiple Attacks",1,0,0,0,"");
			
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
			
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = false;
			btnTargetText = "VoidPirate";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "BLACKVOID";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var nadesAvail:Boolean = true;
			for (var i:int = 0; i < alliedCreatures.length; i++)
			{
				if (alliedCreatures[i].hasStatusEffect("Nade Cooldown")) nadesAvail = false;
			}
			
			// enemy AI
			var enemyAttacks:Array = [];
			enemyAttacks.push({ v: rangedAttack, 				w: 40 });
			enemyAttacks.push({ v: machinePistols, 				w: 40 });

			if (nadesAvail)
			{
				enemyAttacks.push({ v: groupFlashbang, 			w: 15 });
				enemyAttacks.push({ v: sx1GroupSmokeGrenade,	w: 15 });
				enemyAttacks.push({ v: concGrenade, 			w: 15 });
			}

			var attack:Function = weightedRand(enemyAttacks);
			
			if (attack == rangedAttack || attack == machinePistols) attack(target);
			else attack(hostileCreatures);
		}
		
		private function rangedAttack(target:Creature):void
		{
			CombatAttacks.RangedAttack(this, target);
		}
		
		private function machinePistols(target:Creature):void
		{
			output("One of the assassins brings his machine pistol to bear, firing a burst of toward " + (target is PlayerCharacter ? "you" : target.a + target.short) + "!");
			if (rangedCombatMiss(this, target, -1, 3))
			{
				output(" The burst misses!");
			}
			else
			{
				output(" The burst hits!");

				applyDamage(new TypeCollection({ kinetic: 5 }), this, target, "minimal");
			}
		}
		
		private function groupFlashbang(targets:Array):void
		{
			// Flashbang
			output("One of the assassins pulls another disk-like grenade from his belt and slides it across the deck, placing it between you and Saendra! The flashbang detonates with deafening force,");

			var pc:Creature;
			var saen:Creature;
			
			for (var i:int = 0; i < targets.length; i++)
			{
				if (targets[i] is PlayerCharacter) pc = targets[i] as Creature;
				if (targets[i] is Saendra) saen = targets[i] as Creature;
			}
			
			var blindedPC:Boolean = rand(10) != 0;
			var blindedSaen:Boolean = rand(10) != 0;
			
			if (blindedPC && blindedSaen)
			{
				output(" blinding you and Saendra.");
				pc.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
				saen.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
			}
			else if (!blindedPC && blindedSaen)
			{
				output(" blinding Saendra, though you manage to avoid any serious effect.");
				saen.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
			}
			else
			{
				output(" though both you and Saendra manage to avoid any serious effect.");
			}

			createStatusEffect("Nade Cooldown", 5);
		}
		
		private function sx1GroupSmokeGrenade(hostileCreatures:Array):void
		{
			// Smoke Grenade
			output("One of the assassins pulls a cylindrical grenade from his belt and hurls it between you and him. Smoke billows out of the grenade after a loud POP, making it almost impossible to see. <b>Aim reduced!</b>");
			
			for (var i:int = 0; i < hostileCreatures.length; i++)
			{
				hostileCreatures[i].createStatusEffect("Smoke Grenade", 3, 0, 0, 0, false, "Blind", "Ranged attacks are far more likely to miss.", true, 0);
			}
			
			createStatusEffect("Nade Cooldown", 5);
		}
		
		public function concGrenade(hostileCreatures:Array):void
		{
			// Concussion Grenade
			output("One of the assassins grabs a red grenade off of his belt and hurls it at you. A second later, the grenade detonates in a rib-crushing wave of kinetic force that nearly knocks you on your ass!");
			
			for (var i:int = 0; i < hostileCreatures.length; i++)
			{
				var target:Creature = hostileCreatures[i];
				var mul:Number;
				if (target.RQ() < rand(100)) mul = 2;
				else mul = 1;

				applyDamage(new TypeCollection( { kinetic: 8 * mul } ), this, target, (target is PlayerCharacter ? "minimal" : "suppress"));
			}

			createStatusEffect("NadeCD", 5);
		}
	}
}
