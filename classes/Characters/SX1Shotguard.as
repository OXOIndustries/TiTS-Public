package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Guns.SecureMP;
	import classes.Items.Guns.TrenchShotgun;
	import classes.Items.Melee.Fists;
	import classes.Items.Protection.DecentShield;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	
	//Level 5. High health, medium armor, low shields. Uses a shotgun just like Pyra's.
	
	public class SX1Shotguard extends Creature
	{
		//constructor
		public function SX1Shotguard()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "mercenary guard";
			this.originalRace = "human";
			this.a = "the ";
			this.capitalA = "The ";
			//this.long = "The mercenary guard is a gruff, weathered human man with a long, faded-brown coat pulled over a ballistic vest -- enough armor for a corporate jackboot, but less than the assassins you fought upstairs. He's packing a pump-action shotgun and a bandolier full of grenades and other goodies.";
			this.long = "A gruff, weathered human man with a long, faded-brown coat pulled over a ballistic vest. He's packing a pump-action shotgun and a bandolier full of grenades and other goodies.";
			this.customBlock = "The mercs armor deflects your attack with an alarming ease.";
			this.isPlural = false;
			isLustImmune = false;
			
			this.meleeWeapon = new Fists();
			this.rangedWeapon = new TrenchShotgun();
			rangedWeapon.attackVerb = "shoot";
			rangedWeapon.attackNoun = "shot";
			rangedWeapon.longName = "shotgun";
			rangedWeapon.hasRandomProperties = true;
			this.shield = new DecentShield();
			
			this.armor.longName = "ballistic armor";
			this.armor.defense = 8;
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
			
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 120 + rand(52);
			this.HPMod = 175;
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
			
			sexualPreferences.setRandomPrefs(4, 2);
			
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createStatusEffect("Disarm Immune", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = false;
			btnTargetText = "VoidMerc";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "MERCGUARD";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var blastAvail:Boolean = energy() >= 20 && !hasStatusEffect("Disarmed");
			var netAvail:Boolean = energy() >= 10 && !hasStatusEffect("Stun Net Cooldown");
			var zapAvail:Boolean = energy() >= 10 && !target.hasStatusEffect("Stunned");
			
			var attacks:Array = [];
			if (!hasStatusEffect("Disarmed")) attacks.push( { v: rangedAttack, w:30 } );
			attacks.push( { v: meleeAttack, w:10 } );
			if (!hasStatusEffect("Disarmed")) attacks.push( { v: shotBlast, w: 40 } );
			if (blastAvail) attacks.push( { v: solidSlug, w: 25 } );
			if (netAvail) attacks.push( { v: ropeShot, w: 10 } );
			if (zapAvail) attacks.push( { v: stunBaton, w: 20 } );
			
			weightedRand(attacks)(target);
		}
		
		private function rangedAttack(target:Creature):void
		{
			CombatAttacks.RangedAttack(this, target);
		}
		
		private function meleeAttack(target:Creature):void
		{
			CombatAttacks.MeleeAttack(this, target);
		}
		
		private function stunBaton(target:Creature):void
		{
			// Stun Baton
			//Light Electrical damage, high chance to stun

			output("The pirate yanks a baton off his belt and lunges at "+ (target is PlayerCharacter ? "you" : target.a + target.short) +", fingering a button as he does so, causing the haft of it to erupt in a burst of electricity. Zap!");
			if (!combatMiss(this, target))
			{
				if (target is PlayerCharacter)
				{
					output(" You take a shock right to the chest, zapping you! <b>Worse, you're stunned!</b>");
				}
				else output(" " + target.capitalA + target.short + " takes a shock right to the chest! <b>" + target.mfn("He", "She", "It") + " looks a little unsteady on their feet!</b>");
				
				target.createStatusEffect("Stunned",1,0,0,0,false,"Stun","Cannot act for a turn.",true,0,0xFF0000);
			}
			else
			{
				output(" " + (target is PlayerCharacter ? "You just manage" : target.capitalA + target.short + " manages") + " to duck under the swing, evading the pirate's attack!");
			}

			energy(-10);
		}
		
		private function ropeShot(target:Creature):void
		{
			output("The pirate switches his finger to a second trigger and pulls it, shooting a rope and hook from a second barrel under his gun! The rope shot shoots towards");
			if (target is PlayerCharacter) output(" you,");
			else output(" Saendra,");

			if (rangedCombatMiss(this, target, -1, 2))
			{
				output(" but buries itself harmlessly in the wall.");
			}
			else
			{
				output(" swinging around and around until it binds"); 
				if (target is Saendra)
				{
					output(" her arms against her side. Saendra is");
					target.createStatusEffect("Stunned",3,0,0,0,false,"Stun","Cannot act for a turn.",true,0,0xFF0000);
				}
				else
				{
					output(" your arms to your side. You are");
					target.createStatusEffect("Grappled", 0, 30, 0, 0, false, "Constrict", "You're stuck in the pirates net!", true, 0);
					// 9999 -- might need new grappletexts for this to make sense
				}
				
				output(" restrained!");
			}

			createStatusEffect("Stun Net Cooldown", 5);
			energy(-10);	
		}
		
		private function shotBlast(target:Creature):void
		{
			var numHits:int = 1;
			for (var i:int = 0; i < 5; i++)
			{
				if (!rangedCombatMiss(this, target, -1)) numHits++;
			}

			var damage:TypeCollection = rangedDamage();
			damage.multiply(0.33 * numHits); // potentially double the damage of a base ranged shot

			output("The pirate gunner fires off his shotgun, blasting "+ (target is PlayerCharacter ? "you" : target.a + target.short) + " with a cone of hot lead!");
			applyDamage(damage, this, target, "minimal");
		}
		
		private function solidSlug(target:Creature):void
		{
			// Solid Slug
			// Deals heavy damage, but has a chance to miss

			output("The pirate shoves a shell into the bottom of his shotgun and pumps it in. Grinning maliciously, he shoulders his gun and fires it at "+ (target is PlayerCharacter ? "you" : target.a + target.short) + ", blasting "+ (target is PlayerCharacter ? "you" : target.mfn("him", "her", "it")) +" with a solid slug of lead as thick around as your thumb.");
			
			energy(-20);

			if (rangedCombatMiss(this, target))
			{
				output(" The shell misses, blasting a hole in the bulkhead!");
			}
			else
			{
				output(" The shell hits!");
				var damage:TypeCollection = rangedDamage();
				damage.multiply(1.5);
				applyDamage(damage, this, target, "minimal");
			}	
		}
	}
}