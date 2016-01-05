package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Melee.Fists;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.VaginaClass;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Utility.num2Text;
	
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
			// this.long = "You're fighting a pirate techie, an ausar woman in a flight suit with a machine pistol at her hip. She's got a shock of blonde hair, perky breasts under her suit, and a shield generator that's thrumming with overcharged energy."
			this.long = "An ausar woman in a flight suit with a machine pistol at her hip. She's got a shock of blonde hair, perky breasts under her suit, and a shield generator that's thrumming with overcharged energy.";
			this.customBlock = "The pirates armor deflects your attack with an alarming ease.";
			this.isPlural = false;
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
			
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			createPerk("Attack Drone", 0, 0, 0, 0, "Attack Drone!");
			
			isUniqueInFight = false;
			btnTargetText = "VoidTech";
			sexualPreferences.setRandomPrefs(4, 2);
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "TECHGUARD";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			// 1x per encounter, don't call it "Cooldown" to avoid auto-handling
			if (shields() <= 0 && !hasStatusEffect("Shield Boost CD"))
			{
				shieldBoost();
			}
			else
			{
				var attacks:Array = [];

				attacks.push( { v: machinePistol, w: 30 } );
				if (!hasStatusEffect("Stun Cooldown") && energy() >= 20) attacks.push( { v: shockDart, w: 10 } );
				attacks.push( { v: teaseAttack, w: (lust() / 2) } );

				var selection:Function = weightedRand(attacks);
				if (selection == teaseAttack) selection(hostileCreatures);
				else selection(target);
			}
			
			// Drone handled automatically by the combat container process- just make sure the perk
			// exists on the creature!
		}
		
		private function teaseAttack(hostileCreatures:Array):void
		{
			var pc:Creature;
			var saen:Creature;
			
			for (var i:int = 0; i < hostileCreatures.length; i++)
			{
				if (hostileCreatures[i] is PlayerCharacter) pc = hostileCreatures[i] as Creature;
				if (hostileCreatures[i] is Saendra) saen = hostileCreatures[i] as Creature;
			}
			
			output("<i>“Hey, come on,”</i> the tech says, pressing her back to the wall and zipping down the front of her flight suit, revealing the perky mounds of her tits. <i>“Why don’t you put those weapons down, huh? We can work something out...”</i> she groans, running a hand up her chest.");

			if (pc.willpower() + rand(30) + 1 < 30)
			{
				output("\n\nAn subtle warmth builds in your crotch as you stare at the ausar womans pert breasts, transfixed by their succulent, pliant flesh forming so perfectly around the tips of her fingers....");
				applyDamage(new TypeCollection( { tease: 10 * (pc.libido() / pc.libidoMax()) } ), this, pc, "minimal");
				applyDamage(new TypeCollection( { tease: 10 * (saen.libido() / saen.libidoMax()) } ), this, saen, "suppress");
			}
			else
			{
				output("\n\nYou respond with a polite, and obviously fake, cough. The ausar womans sensual show ends as abruptly as it started. <i>“Hey, don’t stop now!”</i> You shoot a glare at Saen. <i>“What? I'm not going to turn down a free show.”</i> Touché.");
				applyDamage(new TypeCollection( { tease: 2 } ), this, pc, "minimal");
				applyDamage(new TypeCollection( { tease: 2 } ), this, saen, "suppress");
			}
		}
		
		private function shockDart(target:Creature):void
		{
			energy( -20);
			output("The pirate tech fires a dart from a device on her wrist,");

			if (rangedCombatMiss(this, target))
			{
				output(" though " + (target is PlayerCharacter ? "you're" : target.a + target.short + " is") + " able to duck out of the way.");
			}
			else
			{
				output(" hitting " + (target is PlayerCharacter ? "you" : target.a + target.short) + " in the shoulder. The darts instantly release an agonizing shock of electricity, making " + (target is PlayerCharacter ? "you" : target.mfn("him", "her", "it")) + " yelp in agony.");

				applyDamage(new TypeCollection({ electric: 17 }), this, target, "minimal");

				if (target.physique() + rand(25) + 1 < 35)
				{
					output(" The shock of it leaves " + (target is PlayerCharacter ? "you" : target.a + target.short) + " reeling -- <b>" + (target is PlayerCharacter ? "you're" : target.mfn("he's", "she's", "it's")) + " stunned!</b>");
					target.createStatusEffect("Stunned", 3, 0, 0, 0, false, "Stun", "Cannot take action!", true, 0);
				}
			}
			
			createStatusEffect("Stun Cooldown", 5);
		}
		
		private function machinePistol(target:Creature):void
		{
			output("The pirate tech sprays bullets at " + (target is PlayerCharacter ? "you" : target.a + target.short) + ", firing wildly from the hip!");

			var numHits:int = 0;
			for (var i:int = 0; i < 4; i++)
			{
				if (!rangedCombatMiss(this, target, -1, 0 - i))
				{
					numHits++;
				}
			}

			if (numHits == 0) output(" All of her shots go wide!");
			else
			{
				output(" " + num2Text(numHits, true) + " bullet");
				if (numHits > 1) output("s");
				output(" hit");
				if (numHits == 1) output("s");
				output(", drilling " + (target is PlayerCharacter ? "you" : target.a + target.short) + "!");

				var damage:TypeCollection = rangedDamage();
				damage.multiply(0.4 * numHits);

				applyDamage(damage, this, target, "minimal");
			}	
		}
		
		private function shieldBoost():void
		{
			output("The pirate babe grabs the generator on her belt and pushes it into maximum overdrive, giving herself a few more seconds of shielding from your assault.");

			shields(shieldsMax() * 0.5);
			createStatusEffect("Shield Boost CD");
		}
		
		override public function getCombatDescriptionExtension():void
		{
			output("\n\nA small ball-shaped hover drone floats around her, spraying laser fire everywhere."); 
		}
	}
}