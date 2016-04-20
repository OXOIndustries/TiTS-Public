package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Guns.AegisLightMG;
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
	
	//Fight is in pitch black. Aim and Reflexes are significantly reduced. 
	public class KQ2Juggernaut extends Creature
	{
		//constructor
		public function KQ2Juggernaut()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "void juggernaut";
			this.originalRace = "human";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "You're fighting a Black Void Juggernaut, a behemoth of a man strapped into a suit of military-spec powered armor. Not an inch of flesh is visible under all that armor, just the outline of a face hidden behind a holographic Jolly Roger on his helmet.";
			this.customBlock = "The pirate’s armor deflects your attack with alarming ease.";
			this.isPlural = false;
			isLustImmune = false;
			
			this.meleeWeapon = new Fists();
			
			rangedWeapon = new AegisLightMG();
			rangedWeapon.attack = 2; // Remove the penalty as the dudes wearing the requisite armor etc.
			rangedWeapon.baseDamage.kinetic.damageValue = 35;
			rangedWeapon.hasRandomProperties = true;
			
			this.shield = new JoyCoPremiumShield();
			shield.shields = 150;
			shield.hasRandomProperties = true;
			
			this.armor.longName = "black void power armor";
			this.armor.defense = 15;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 35;
			this.reflexesRaw = 5;
			this.aimRaw = 30;
			this.intelligenceRaw = 12;
			this.willpowerRaw = 14;
			this.libidoRaw = 20;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.XPRaw = 500;
			this.level = 7;
			this.credits = 80 + rand(80);
			this.HPMod = 180;
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
			
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			createStatusEffect("Disarm Immune");
			createStatusEffect("Stun Immune");
			
			isUniqueInFight = true;
			btnTargetText = "Juggernaut";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "JUGGERNAUT";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			if (shields() <= 0 && !hasStatusEffect("GunShield Overloaded"))
			{
				fullPowerToTheDeflectors();
				return;
			}
			
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			// enemy AI
			var enemyAttacks:Array = [];
			enemyAttacks.push( { v: standardAttack, w: 40 } );
			if (!hasStatusEffect("Machinegun Cooldown")) enemyAttacks.push( { v: machinegunSpray, w: 25 } );
			if (!hasStatusEffect("Flashbang Cooldown")) enemyAttacks.push( { v: flashbang, w: 10 } );
			if (!hasStatusEffect("Shield Bash Cooldown")) enemyAttacks.push( { v: shieldBash, w: 25 } );

			var attack:Function = weightedRand(enemyAttacks);
			if (attack == standardAttack || attack == shieldBash) attack(target);
			else attack(hostileCreatures);
			
		}
		
		private function standardAttack(target:Creature):void
		{
			output("The juggernaut levels his gun at " + (target is PlayerCharacter ? "you" : "Kara") + " with a gruff grunt, firing off a three-round burst of fire in " + (target is PlayerCharacter ? "your" : "her") + " direction!");
			
			for (var i:int = 0; i < 3; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true, "ranged");
			}
		}
		
		private function fullPowerToTheDeflectors():void
		{
			createStatusEffect("GunShield Overloaded");
			
			output("<i>“THAT THE BEST YOU GOT!?”</i> the pirate roars as his machinegun’s tower shield shorts out, leaving him... not without a shield, you see, as another protective layer flickers to life around his armor. Standard-issue shield belt. <i>“COME GET SOME MORE, BITCHES!”</i>");
			shields(shieldsMax() * 0.5);
		}
		
		private function machinegunSpray(hostiles:Array):void
		{
			createStatusEffect("Machinegun Cooldown", 3);
			
			output("<i>“DIE, YOU SACKS OF SHIT!”</i> the pirate booms, bracing his feet and holding down the trigger, letting out a hail of fire");
			
			var numAlive:int = 0;
			var pc:Creature;
			var kara:Creature;
			
			for (var i:int = 0; i < hostiles.length; i++)
			{
				if (!hostiles[i].isDefeated()) numAlive++;
				if (hostiles[i] is PlayerCharacter) pc = hostiles[i];
				if (hostiles[i] is Kara) kara = hostiles[i];
			}
			
			if (numAlive > 1)
			{
				output(" split between you and Kara, sweeping over the room, blasting at you both!");
				
				for (i = 0; i < 4; i++)
				{
					output("\n");
					CombatAttacks.SingleRangedAttackImpl(this, pc);
					output("\n");
					CombatAttacks.SingleRangedAttackImpl(this, kara);
				}
			}
			else
			{
				output(" hammering you with a barrage of bullets.");
				
				for (i = 0; i < 8; i++)
				{
					output("\n");
					CombatAttacks.SingleRangedAttackImpl(this, pc);
				}
			}
		}
		
		private function flashbang(hostiles:Array):void
		{
			output("<i>“LOOK OUT!”</i> the pirate laughs, grabbing a grenade from his belt and chucking it into the middle of the room. It detonates with a blinding flash and a concussive <b>BOOM</b> that shakes you to the bone");
			
			var pc:Creature;
			var kara:Creature;
			
			for (var i:int = 0; i < hostiles.length; i++)
			{
				if (hostiles[i] is PlayerCharacter) pc = hostiles[i] as Creature;
				if (hostiles[i] is Kara && !hostiles[i].isDefeated()) kara = hostiles[i] as Creature;
			}
			
			if (kara != null)
			{
				var blindedPC:Boolean = rand(10) != 0 && !pc.hasBlindImmunity();
				var blindedKara:Boolean = rand(10) != 0 && !kara.hasBlindImmunity();
				if (blindedPC && blindedKara)
				{
					output(", blinding you and Kara.");
					pc.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0,0xFF0000);
					kara.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0,0xFF0000);
				}
				else if (!blindedPC && blindedKara)
				{
					output(" and blinds Kara, though you manage to avoid any serious effect.");
					kara.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0,0xFF0000);
				}
				else
				{
					output(", though both you and Kara manage to avoid any serious effect.");
				}
			}
			// Can only be the PC then
			else
			{
				blindedPC = rand(10) != 0 && !pc.hasBlindImmunity();
				
				if (blindedPC)
				{
					output(" and blinds you.");
					pc.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0,0xFF0000);
				}
				else
				{
					output(", though you manage to avoid any serious effect.");
				}
			}

			createStatusEffect("Flashbang Cooldown", 5);
		}
		
		private function shieldBash(target:Creature):void
		{
			output("<i>“DOWN ON YOUR ASS!”</i> the pirate shouts, lunging towards " + (target is PlayerCharacter ? "you" : target.a + target.short) +" and swinging the");
			if (!hasStatusEffect("GunShield Overloaded")) output(" shield projected from his gun");
			else output(" butt of his gun");
			output(" in a heavy-handed arc.");
			
			if (target is PlayerCharacter) output(" You are"); 
			else output(" Kara is");
			output(" thrown back by the weight of the impact, knocked down and staggered by the force.");
			
			if (rand(3) == 0)
			{
				if (target is PlayerCharacter) output(" <b>You are stunned!</b>");
				else output(" <b>Kara is stunned!</b>");
				target.createStatusEffect("Stunned", 2 + rand(2), 0, 0, 0, false, "Stun", "Cannot act for a while.", true, 0,0xFF0000);
			}
		}
		
		override public function getCombatDescriptionExtension():void
		{
			output(" The Juggernaut’s packing a light machinegun, fired from the hip");
			if (!hasStatusEffect("GunShield Overloaded")) output(", which projects a massive hardlight shield in front of him.");
			else output(". Thankfully, the gun's shield emitter has been overloaded.");
		}
	}
}
