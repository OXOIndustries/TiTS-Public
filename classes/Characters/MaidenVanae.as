package classes.Characters 
{
	import classes.BreastRowClass;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.Items.Apparel.*;
	import classes.Items.Melee.*;
	import classes.Items.Guns.*;
	import classes.Engine.Utility.rand;
	import classes.VaginaClass;
	import classes.kGAMECLASS;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MaidenVanae extends Creature
	{
		
		public function MaidenVanae() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "maiden vanae";
			this.originalRace = "vanae";
			this.a = "the ";
			this.capitalA = "The ";
			
			this.long = "Your opponent - a young vanae maiden - almost appears as if she’s dancing as she fights you. Her [enemy.hair] and short skirt, not to mention her tiny breasts, make her look almost girlish. The amazon’s tentacles and body markings are [enemy.hairColor] colored and bioluminescent. \n\nAs she swings her pointed spear around in her webbed hands, you can’t help but notice her tiny boobs bouncing about. Her inverted nipples are lactating a transparent, [enemy.milkColor] goo. Meanwhile her [enemy.tail] whips around as she ‘dances’, another weapon in the alien girl’s natural arsenal.\n\nHer eyes are closed. It’s always a little weird fighting someone who doesn’t even look at you.";

			this.customDodge = "The girlish vanae maiden gracefully dances out of the way of your attack, beautiful even in battle. These squid girls are hard to hit!";
			this.customBlock = "The maiden brings her pointed spear up and parries your attack, redirecting your forceful strike instead of meeting it head on.";
			
			this.isPlural = false;
			
			this.meleeWeapon = new VanaeSpear();
			this.rangedWeapon;
			this.armor;
			
			this.physiqueRaw = 7;
			this.reflexesRaw = 9;
			this.aimRaw = 4;
			this.intelligenceRaw = 6;
			this.willpowerRaw = 4;
			this.libidoRaw = 60;
			
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			
			this.level = 3;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 15;
			this.HPRaw = this.HPMax();
			
			this.femininity = 100;
			this.hairType = GLOBAL.HAIR_TYPE_TENTACLES;
			this.hairColor = "luminous pink";
			this.hairLength = 12;
			this.tallness = 62;
			this.tone = 25;
			this.thickness = 25;
			this.eyeColor = "glowing pink";
			this.skinTone = "pale pink";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.earType = GLOBAL.TYPE_VANAE;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.lipColor = "rich pink";
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.armType = GLOBAL.TYPE_VANAE;
			this.faceType = GLOBAL.TYPE_VANAE;
			this.faceFlags = [];
			this.legType = GLOBAL.TYPE_VANAE;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			this.breastRows = [new BreastRowClass()];
			(breastRows[0] as BreastRowClass).breastRatingRaw = 1;
			(breastRows[0] as BreastRowClass).nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			this.nipplesPerBreast = 1;
			this.nippleColor = "hot pink";
			
			this.milkMultiplier = 75;
			this.milkRate = 15;
			this.milkFullness = 50;
			this.milkType = GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			
			this.vaginas = [new VaginaClass()];
			(vaginas[0] as VaginaClass).vaginaColor = "pale pink";
			(vaginas[0] as VaginaClass).clits = 2;
			(vaginas[0] as VaginaClass).type = GLOBAL.TYPE_VANAE;
			(vaginas[0] as VaginaClass).wetnessRaw = 2;
			this.clitLength = 0.5;
			this.vaginalVirgin = true;
			
			this.cocks = [];
			this.balls = 0;
			this.timesCum = 0;
			this.minutesSinceCum = 9999;
			
			this.tailType = GLOBAL.TYPE_VANAE;
			this.tailCount = 0;
			this.tailFlags = [];
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 0;
			
			this.hipRatingRaw = 5;
			this.buttRatingRaw = 5;
			
			isUniqueInFight = true;
			btnTargetText = "Maiden";
			
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION, GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS, GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS, GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES, GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER, GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS, GLOBAL.REALLY_DISLIKES_SEXPREF);
			
			if (rand(10) == 0) inventory.push(new VanaeSpear());
			else if(rand(10) <= 6) inventory.push(new SkySap());
			
			this._isLoading = false;
		}
		
		override public function hasBlindImmunity():Boolean
		{
			return true;
		}
		
		override public function get bustDisplay():String
		{
			return "VANAE_MAIDEN";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var camoUsed:Boolean = false;
	
			if (target.hasStatusEffect("Tripped") || target.hasStatusEffect("Grappled") || target.hasStatusEffect("Stunned")) vanaeGrapple(target);
			else if (rand(3) == 0)
			{
				camoUsed = true;
				vanaeCamoflage(false);
			}
			else if (rand(5) == 0) CombatAttacks.MeleeAttack(this, target);
			else
			{
				var options:Array = [];
				
				if (target.lust() >= target.lustMax() * 0.6)
				{
					options.push(vanaeMilkSquirtBreasts);
					options.push(vanaeMilkSquirtBreasts);
					options.push(vanaeMilkSquirtBreasts);
					options.push(vanaeMilkSquirtBreasts);
					options.push(vanaeMilkSquirtBreasts);
					options.push(vanaeMilkSquirtBreasts);
					options.push(vanaeTailSwipe);
					options.push(vanaeSpearStrike);
				}
				else if (target.HP() <= target.HPMax() * 0.4)
				{
					options.push(vanaeTailSwipe);
					options.push(vanaeTailSwipe);
					options.push(vanaeTailSwipe);
					options.push(vanaeSpearStrike);
					options.push(vanaeSpearStrike);
					options.push(vanaeSpearStrike);
					options.push(vanaeMilkSquirtBreasts);
				}
				else
				{
					// Maiden
					options.push(vanaeTailSwipe);
					options.push(vanaeTailSwipe);
					options.push(vanaeTailSwipe);
					options.push(vanaeTailSwipe);
					options.push(vanaeSpearStrike);
					options.push(vanaeSpearStrike);
					options.push(vanaeSpearStrike);
					options.push(vanaeSpearStrike);
					options.push(vanaeMilkSquirtBreasts);
				}
				
				options[rand(options.length)](target);
			}
			
			if (!camoUsed) vanaeCamoflage(true);
		}
		
		private function vanaeCamoflage(justUpdate:Boolean = true):void
		{
			if (hasStatusEffect("Camouflage"))
			{
				addStatusValue("Camouflage", 1, -1);
			}
			
			if (!justUpdate)
			{
				if (!hasStatusEffect("Camouflage"))
				{
					// [Activate]: 
					output("The octopus-like huntress stops and presses herself against the ground. Suddenly her [vanae.skin] starts shifting and she seems to slowly disappear. Her outline remains, but you have to concentrate to see it.");
					
					output("\n\nIt seems she’s changed her skin to match her surroundings like instant camouflage. You can still see her, but while she’s camouflaged it is going to be harder to hit her and dodge her attacks.");
					
					createStatusEffect("Camouflage", 3, 0, 0, 0, false, "Icon_Blind", "Active camouflage makes it harder for opponents to target.");
					reflexesMod += 8;
					aimMod += 8;
				}
				else
				{
					output("The octopus-like huntress takes a moment to stop and press against the ground, renewing her camouflage. Now she’s back in synch with her surroundings.");
					
					setStatusValue("Camouflage", 1, 3);
				}
			}

			if (hasStatusEffect("Camouflage"))
			{
				if (statusEffectv1("Camouflage") < 0)
				{
					removeStatusEffect("Camouflage");
					reflexesMod -= 8;
					aimMod -= 8;
					
					output("\n\nShe’s moved around too much, and suddenly her camouflage is useless. She seems to realize that as well, changing back to her usual skin tones. Now she’ll be easier to hit and dodge!");
				}
			}
		}
		
		private function vanaeSpiralKick(target:Creature):void
		{
			output("Suddenly, the lithe huntress is making a dash at you. Before you know what she’s doing, she twirls and launches herself in the air like a sideways top - her foot arching at");
			if (target.tallness <= 80) output(" your head");
			else output(" your side");
			output(" with an impressive spinning high kick!");

			if (combatMiss(this, target, -1, 3)) output(" The move is spectacular, but clearly telegraphed. You dart backwards as her [vanae.foot] whips past you, connecting with nothing but air. She lands and spins around, dissapointed that it didn’t connect.");
			else
			{
				// [Hit & Stun]: 
				output(" Her [enemy.foot] connects with all the velocity of her wind up, striking your [pc.face] with incredible force. You see stars as you are knocked back, stunned by her blow. She’s leading into a follow-up attack...");
				
				var damage:TypeCollection = meleeDamage();
				damage.add(12);
				damageRand(damage, 20);
				applyDamage(damage, this, target);
				
				CombatAttacks.applyStun(target, 2);
			}
		}
		
		public function vanaeMilkSquirtBreasts(target:Creature):void
		{
			output("Suddenly, the");
			if (this is MaidenVanae) output(" girlish");
			else output(" busty");
			output(" huntress grabs the sides of her [enemy.breasts]. She squeezes them and squirts a stream of [enemy.milk] at you.");

			// [Miss]: 
			if (combatMiss(this, target)) output(" You dodge the [enemy.milk] as it shoots past your [pc.ear]. She steadies her spear, moving back into her fighting stance.");
			else if(target.hasAirtightSuit())
			{
				output(" You are splattered with her [enemy.milk]! Fortunately for you, your [pc.armor] is watertight and prevents any of the lust-inducing liquid to seep into it.");
			}
			else
			{
				var critChance:int = 33;
				var bStun:Boolean = false;

				if (rand(100) > critChance)
				{
					// [Hit]: 
					output(" You are splattered with her [enemy.milk], unable to get it off. All of a sudden, your cheeks begin to flush and you start feeling quite aroused...");
				}
				else
				{
					// [Hit And Stun]: 
					output(" You are splattered with her [enemy.milk], unable to get it off. All of a sudden, your cheeks begin to flush and you lose control to your limbs, falling to the ground. She’s leading into a follow-up attack...");
					bStun = true;
				}
				
				applyDamage(new TypeCollection( { tease: 8 + rand(4) } ), this, target, "minimal");
				if(bStun) CombatAttacks.applyStun(target, 2);
			}
		}
		
		private function vanaeGrapple(target:Creature):void
		{
			// Effect: Grapple chance. Failure leads to nothing, success/don't struggle leads to target grappled and consecutive "lubricate" attacks until the pin is broken or victory occurs.
			
			if (!target.hasStatusEffect("Grappled"))
			{
				output("Sliding up to you as you are incapacitated, you feel her");
				if (this is MaidenVanae) output(" short");
				output(" tentacle skirt begin to");
				if (this is MaidenVanae) output(" awkwardly");
				output(" wrap around your waist");
				if (!(this is MaidenVanae)) output(" and lower body");
				output(". You can feel her suckers begin to stick to your skin - she’s trying to pin you down!");
				
				// [Failure]:
				if (combatMiss(this, target)) output(" You forcibly shake her off of you; it’s a close call. If she’d pinned you, who knows what would have happened!");
				else
				{
					// [Success/Don't Struggle]: 
					output(" You can’t shake her off you as she wraps around your lower body and [pc.hips], pulling herself flush against your [pc.skin]. Her [enemy.breasts] are rubbing against you, coating you in her [enemy.milk]...");

					output("\n\nYou can feel your cheeks begin to flush. All of a sudden you start to lose the ability to move your limbs, but not the ability to feel what’s happening to them. And what is happening feels <i>good</i>...");

					CombatAttacks.applyGrapple(target, 30);
					applyDamage(new TypeCollection( { tease: 8 + rand(8) } ), this, target, "minimal");
				}
			}
			else
			{
				output("You are helpless as the vanae huntress rubs her [enemy.breasts] up and down your body, smearing her wonderful breast milk all over your body. You feel like you’re being lubed up by her");
			if (this is MaidenVanae) output(" meager");
			else output(" sizable");
			output(" mounds, your [pc.groin] burning with arousal.");
				applyDamage(new TypeCollection( { tease: 8 + rand(8) } ), this, target, "minimal");
			}
		}
		
		private function vanaeTailSwipe(target:Creature):void
		{
			// Effect: Small Damage if hit, trip if connect. Vanae always attempts either a grapple or a melee strike on a tripped opponent. Small crit chance.
			
			output("The lithe huntress dances up towards you, her [enemy.hairColor], luminescent ‘skirt’ twirling about her body. Suddenly she crouches and her [enemy.tail] sweeps at your [pc.feet] - it’s a trip attack!");

			// [Miss]: 
			if (combatMiss(this, target) || target.isPlanted()) output(" You read her movements and avoid being tripped. She only succeeds at sweeping the ground with her sneaky strike.");
			else
			{
				var critChance:int = 15;
				var damage:TypeCollection = meleeDamage();
				damageRand(damage, 20);
				
				if (rand(100) > critChance)
				{
					// [Hit]: 
					output(" You’re struck by her tail, falling to the ground. She gives a victorious grin, closing in on you. She’s leading into a follow-up attack...");
				}
				else
				{
					damage.multiply(2);
					
					// [Crit]: 
					output(" You’re struck by her tail, falling to the ground and hitting your head - hard. Your world spins as she closes in on you. You’re too disoriented to do anything about it...");
				}
				
				applyDamage(damage, this, target);
				
				CombatAttacks.applyTrip(target);
			}
		}
		
		private function vanaeSpearStrike(target:Creature):void
		{
			//Effect: Light physical damage, stun chance. Extra damage against tripped or stunned opponents. Small crit chance - higher against tripped or stunned opponents.
			if(hasStatusEffect("Disarmed"))
			{
				output("The blind huntress searches for her spear, giving you time to attack.");
			}
			else
			{
				output("The blind huntress twirls towards you, bringing her spear head up to strike. Just when you think she’s going to hit you, she flicks the blunt end around at the last moment.");

				// [Miss]: 
				if (combatMiss(this, target)) output(" You jerk out of the way and she connects with nothing but air. The alien girl spins around, returning to a neutral stance.");
				
				else
				{
					var isCrit:Boolean = false;
					var dMulti:Number = 1.0;
					var critChance:int = 15;
					
					if (target.hasStatusEffect("Stunned") || target.hasStatusEffect("Tripped"))
					{
						dMulti += 0.25;
						critChance *= 2;
					}
					
					if (rand(100) > critChance)
					{
						// [Hit]: 
						output(" You’re caught off guard, the flat end cracking against the side of your head. Pain shoots through your skull - her feint a success.");
					}
					else
					{
						// [Critical]: 
						isCrit = true;
						output(" One minute you’re fighting, the next you’re seeing stars as she drives the flat end right into your temple. Your world spins, your head feeling as if it suddenly exploded.");
					}
					
					var damage:TypeCollection = meleeDamage();
					var bStun:Boolean = false;
					damageRand(damage, 10);
					
					if (isCrit)
					{
						damage.multiply(2);
						bStun = true;
					}
					
					applyDamage(damage, this, target);
					if(bStun) CombatAttacks.applyStun(target, 1);
				}
			}
		}
	}
}