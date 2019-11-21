package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	public class WetraHound extends Creature
	{
		//constructor
		public function WetraHound()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "wetra hound";
			this.originalRace = "wetra";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "This huge, muscular creature has a slavering maw full of razor-sharp fangs, and walks on four legs in an almost gorilla-like gait. The hound’s claws dig into the earth, clattering across the stone and echoing through the cavern. Glowing blue eyes look you over with a bestial, hungry intelligence.";
			this.customDodge = "Claws scrabbling, the wetra slips away from your attack.";
			this.customBlock = "The hounds thick hide soak up your attack.";
			this.isPlural = false;
			isLustImmune = true;
			
			this.meleeWeapon = new Fists();
			meleeWeapon.baseDamage.kinetic.damageValue = 8;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			this.meleeWeapon.attack = 8;
			this.meleeWeapon.longName = "claw";
			this.meleeWeapon.attackVerb = "claw";
			this.meleeWeapon.attackNoun = "claw";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "tough hide";
			this.armor.defense = 5;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 27;
			this.reflexesRaw = 29;
			this.aimRaw = 2;
			this.intelligenceRaw = 5;
			this.willpowerRaw = 10;
			this.libidoRaw = 1;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();
			
			
			this.femininity = 0;
			this.eyeType = GLOBAL.TYPE_CANINE;
			this.eyeColor = "green";
			this.tallness = 40;
			this.thickness = 70;
			this.tone = 95;
			this.hairColor = "blue";
			this.scaleColor = "none";
			this.furColor = "blue";
			this.hairLength = 1;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "gray";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_CANINE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_CANINE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 1;
			this.antennaeType = GLOBAL.TYPE_CANINE;
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_GOAT;
			this.armType = GLOBAL.TYPE_CANINE;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 4;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
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
			this.hipRatingRaw = 2;
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
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			//this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			
			isUniqueInFight = true;
			btnTargetText = "WetraHound";
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "WETRAHOUND";
		}
				
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var attacks:Array = [];

			attacks.push(wetraHoundBite);
			if (!target.hasStatusEffect("Tripped")) attacks.push(wetraHoundPunch);
			attacks.push(wetraHoundOverrun);

			var hit:Boolean = attacks[rand(attacks.length)](target);

			if (hit && target.hasStatusEffect("Bleeding"))
			{
				output("\n");
				wetraHoundRend(target);
			}
		}
		
		private function wetraHoundOverrun(target:Creature):Boolean
		{
			//Massive bludgeoning damage, low chance to hit unless knocked down already. 

			output("The wetra hound bellows, a thunderous roar that echoes through the caverns, and charges at you at its full, loping speed.");

			var missMod:Number = 5;
			if (target.hasStatusEffect("Tripped")) missMod = 1;

			if (!combatMiss(target, target, -1, missMod))
			{
				output(" The beast slams into you head-first, its thick skull-plate acting like a battering ram that sends you flying against the cavern wall. You yelp in pain as the rib-cracking attack lands, and leaves you rolling in agony on the floor.");

				applyDamage(damageRand(new TypeCollection( { kinetic: 20 } ), 20), this, target);
				return true;
			}
			else
			{
				output(" You tumble out of the way as quick as you can, letting the hound’s momentum carry it past you. Its head slams into a wall with what should have been lethal force... but the beast just shakes it off and whirls around, ready to keep fighting!");
				return false;
			}
		}
		
		private function wetraHoundRend(target:Creature):void
		{
			//Gain a Flurry attack against bleeding targets. Add to any other attack:

			output("The wetra hound leaps forward and rakes at you with its claws,");
			if (!combatMiss(this, target))
			{
				output(" tearing into your flesh");
				applyDamage(damageRand(new TypeCollection( { kinetic: 20 }, DamageFlag.PENETRATING), 10), this, target);
			}
			else
			{
				output(" narrowly missing you");
			}
		}
		
		private function wetraHoundPunch(target:Creature):Boolean
		{
			//Moderate bludgeoning damage, chance to knockdown. 

			output("The wetra hound rises up onto its puny hind legs, bringings its meaty fists up and trying to sucker-punch you!");
			if (!combatMiss(this, target))
			{
				output(" Pow, right in the kisser! You stagger back under the massive weight of the blow");
				if ((rand(target.reflexes() / 2) + target.reflexes() / 2 >= reflexes()) && !target.isPlanted())
				{
					output(", and suddenly find yourself tripping on a rocky outcropping. <b>You’re knocked prone</b>");
					CombatAttacks.applyTrip(target);
				}
				output("!");

				applyDamage(damageRand(new TypeCollection( { kinetic: 10 } ), 15), this, target);
				return true;
			}
			else
			{
				output(" You put up your dukes and block the punch, deflecting the beast’s mighty blow!");
				return false;
			}
		}
		
		private function wetraHoundBite(target:Creature):Boolean
		{
			//Moderate piercing damage. Chance to inflict Bleeding (if shields are down only).

			output("The wetra hound leaps forward, its fanged maw wide open. The creature slams into you, attempting to sink its dagger-like teeth into you.");
			if (!combatMiss(this, target))
			{
				output(" The hound bites your arm, bringing its jaws down around you with crushing weight. You yelp in pain as its fangs sink into you!");
				if (target.shields() <= 0)
				{
					output(" When the creature pries itself off of you, you watch in horror as blood spurts from the wound. <b>You’re bleeding!</b>");
					CombatAttacks.applyBleed(target, 1, 3, 15);
				}
				var damage:TypeCollection = new TypeCollection( { kinetic: 15 }, DamageFlag.PENETRATING );
				damageRand(damage, 15);
				applyDamage(damage, this, target);
				return true;
			}
			else
			{
				output(" You punch the bastard right in the nose, sending the beast tumbling back away just before it can bite into you!");
				return false;
			}
		}
	}
}