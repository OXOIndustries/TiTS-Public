package classes.Characters 
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.DamageTypes.*;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Mimbrane extends Creature
	{
		
		public function Mimbrane() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "mimbrane";
			this.originalRace = "mimbrane";
			this.a = "a ";
			this.capitalA = "A ";
			this.long = "A Mimbrane is flying around you, resembling a slick and smooth cloth at times. The parasite is incredibly thin, seeming less than a quarter of an inch in width. What it lacks in depth it makes up in diameter, though; it easily sizes up to around a couple square feet. The Mimbrane’s moist, oily skin occasionally glistens in the surrounding light, sometimes appearing slightly translucent as it stretches its lithe form.  The creature’s face is hard to make out a times, little more than two small eyeballs and a slightly protruding mouth that contrast somewhat to the rest of the beast’s uniform appearance.";
			this.customDodge = "The Mimbrane’s light, agile form twists and contorts in the air, effortlessly dodging around your attack.";
			this.customBlock = "You’re shocked to see the parasite’s form adapt to your attack. It’s as if you’re attacking a bedsheet in a wind tunnel.";
			this.isPlural = false;
			
			isLustImmune = true;
			
			this.meleeWeapon.attackVerb = "scratch";
			this.meleeWeapon.attackNoun = "barbs";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 4;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.attack = 2;
			this.meleeWeapon.longName = "barbs";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "pink flesh"; // Fix
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 2;
			this.reflexesRaw = 5;
			this.aimRaw = 4;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			this.level = 1;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 15;
			this.HPRaw = this.HPMax();
			
			this.femininity = 50;
			this.eyeType = GLOBAL.TYPE_MIMBRANE;
			this.eyeColor = "red";
			this.tallness = 6 + rand(31); // 6-36
			this.thickness = 1;
			this.tone = 50;
			this.hairColor = "red";
			this.scaleColor = "red";
			this.furColor = "red";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = 0;
			this.skinTone = "red";
			this.skinFlags = new Array();
			addSkinFlag(GLOBAL.FLAG_ABSORBENT);
			this.faceType = GLOBAL.TYPE_MIMBRANE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_MIMBRANE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_MIMBRANE;
			this.legCount = 1;
			this.legFlags = new Array();
			
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
			
			this.buttRatingRaw = 0;
			
			//No dicks here!
			this.cocks = new Array();
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			//this.cumQuality = 0;
			this.createStatusEffect("Infertile");
			this.cumType = 0;
			this.ballSizeRaw = 0;
			this.ballFullness = 0;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 0;
			this.minutesSinceCum = 9999;
			this.timesCum = 0;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.clitLength = 0.5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = 0;
			
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			createStatusEffect("Disarm Immune");
			createStatusEffect("Force It Gender");
			
			isUniqueInFight = true;
			btnTargetText = "Mimbrane";
			
			tallness = 6 + rand(31);
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "MIMBRANE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			// Continue the smother stuff
			if (target.hasStatusEffect("Mimbrane Smother"))
			{
				mimbraneSmother(target);
				return;
			}
			
			// We get cooldown management of effects with "Cooldown" in the name
			// for free now!
			if (!hasStatusEffect("Mimbrane Cloud Cooldown"))
			{
				mimbraneLustCloud(target);
				return;
			}
			
			// Select between lust and HP attacks
			var hpAttackWeight:int = 3; // 33% [1 in (0-2)]
			if (target.lustMax() / target.lust() > 0.75) hpAttackWeight += 3; // 20% [1 in (0-5)]
			trace("HP Attack Weight: " + hpAttackWeight);

			if (rand(hpAttackWeight) == 0)
			{
				// HP Attack
				if (rand(3) == 0) mimbraneTrip(target);
				else mimbraneScratch(target);
			}
			else
			{
				// Lust attack selection
				if (rand(2) == 0) mimbraneSkinContact(target);
				else
				{
					if (target.lust() / target.lustMax() < 0.6) mimbraneSpit(target);
					else if(!hasStatusEffect("Mimbrane Smother Cooldown")) mimbraneSmother(target);
					else mimbraneSpit(target);
				}
			}
		}
		
		private function mimbraneTrip(target:Creature):void
		{
			output("The Mimbrane divebombs you again. Just as it closes in on you, the parasite contorts its body into a half circle, aiming for your [pc.leg].");

			// standard miss/block text
			if (combatMiss(this, target))
			{
				output("\n\nYou dodge!");
			}
			// hit
			else
			{
				output("\n\nIt successfully hooks onto your [pc.leg] and pulls it out from under you, tripping you hard against the ground.");

				var damage:TypeCollection = new TypeCollection( { kinetic: 5 + rand(5) } );
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				
				if (damageResult.shieldDamage > 0)
				{
					if (target.shieldsRaw > 0) output(" Your shield crackles but holds.");
					else output(" There is a concussive boom and tingling aftershock of energy as your shield collapses under the impact.");
				}
				
				if (damageResult.hpDamage > 0)
				{
					output(" You take a moment to shake the stars from your vision");
					if(!target.isPlanted())
					{
						output(", your rapid introduction to the floor suprisingly painful considering the circumstances");
						CombatAttacks.applyTrip(target);
					}
					output(".");
				}
				
				outputDamage(damageResult);
			}
		}
		
		private function mimbraneScratch(target:Creature):void
		{
			output("Sharp, miniature barbs form along the underside of the parasite, as it glides towards you.\n\n");
			CombatAttacks.SingleMeleeAttackImpl(this, target, false);
		}
		
		private function mimbraneSpit(target:Creature):void
		{
			output("What amounts to your adversary’s face bulges intensely. The Mimbrane’s mouth struggles for a bit before launching a thick, deep red payload of concentrated sexual craving right at you.");

			// standard miss/block text
			if (combatMiss(this, target))
			{
				output(" You tuck out of the way!");
			}
			else if(target.hasAirtightSuit())
			{
				output(" The parasite’s discharge makes its mark, smothering you in a volatile mix of a supersaturated batch of its oily residue and dense cloud of prurient perspiration -- however, the airtight properties of your [pc.armor] proves such an attack completely useless.");
			}
			// hit
			else
			{
				output(" The parasite’s discharge makes its mark, smothering you in a volatile mix of a supersaturated batch of its oily residue and dense cloud of prurient perspiration.");
				//target.lust(15 + target.libido()/10);
				applyDamage(new TypeCollection( { drug: (10 + target.libido()/10) } ), this, target, "minimal");
			}
		}
		
		private function mimbraneSmother(target:Creature):void
		{
			createStatusEffect("Mimbrane Smother Cooldown", 4, 0, 0, 0, true, "", "", true, 0);
			if(target.hasAirtightSuit())
			{
				output("The Mimbrane is difficult to track as it circles above and around you. You lose sight of the creature, but a shadow on the ground clues you in on its position: spread thin and wide above you. The parasite descends upon you like a fishing net! Your head is encased in the parasite’s embrace, futilely trying to smother you in its slick, salacious skin. Its secretions don’t make it past your [pc.armor]; giving you a chance to breathe a sign of relief.");
				output("\n\nThe creature quickly slides off, waiting for the opportune moment to strike you again.");
				// Just in case:
				target.removeStatusEffect("Mimbrane Smother");
				return;
			}
			if (!target.hasStatusEffect("Mimbrane Smother"))
			{
				output("The Mimbrane is difficult to track as it circles above and around you. You lose sight of the creature, but a shadow on the ground clues you in on its position: spread thin and wide above you. The parasite descends upon you like a fishing net!");
				target.createStatusEffect("Mimbrane Smother", 0, 0, 0, 0, false, "Constrict", "Your face is being smothered by a Mimbrane!", true);
			}
			
			// hit
			output(" Your head is encased in the parasite’s embrace, smothering you in its slick, salacious skin. Its secretions are seeping into you; its aroma greets you with every attempt to breathe.");
			//target.lust(10 + target.libido()/10);
			applyDamage(new TypeCollection( { drug: (7 + target.libido()/10) } ), this, target, "minimal");
		}
		
		private function mimbraneLustCloud(target:Creature):void
		{
			createStatusEffect("Mimbrane Cloud Cooldown", 3, 0, 0, 0, true, "", "", true, 0);

			output("Your adversary grows more dense in the air for a second, appearing as if it were wringing out more passionate sweat from its flesh. In one fluid motion, it stretches back out again, a large square of flesh suspended above you surrounding the visible cloud of lust it created. The Mimbrane spins in the air, pushing the fog your way!");

			// standard miss/block text
			if (combatMiss(this, target))
			{
				output("\n\nAnticipating the Mimbranes attack, you’re already poised to avoid the creatures mist before it can take effect.");
			}
			else if(target.hasAirtightSuit())
			{
				output(" The parasite’s cloud envelops and consumes you, but it does so in vain. Your [pc.armor] prevents the stuff from contacting your skin, sparing your lust of wanton desires.");
			}
			else
			{
				// hit
				output("\n\nThe parasite’s cloud of wanton desire consumes you, seeping into every pore and driving you ever further off the edge.");
				
				// Always increase lust from the initial attack
				// No save will also attach a lust increasing effect to the player.
				//target.lust(10 + rand(10));
				applyDamage(new TypeCollection( { drug: (8 + target.libido()/10) } ), this, target, "minimal");


				// no save
				if (target.reflexes() + rand(20) + 1 < 15)
				{
					output(" You’re too disoriented to get out of the veil before it can sink its fangs into you. The best you can hope for is for it to dissipate on its own.");
					if (!target.hasStatusEffect("Mimbrane Lust Cloud"))
					{
						// v1 = stacks
						// v2 = duration remaining
						target.createStatusEffect("Mimbrane Lust Cloud", 1, 3, 0, 0, false, "Icon_LustUp", "You have been exposed to the lust inducing venom of a Mimbrane.", true, 0);
					}
					else
					{
						target.setStatusValue("Mimbrane Lust Cloud", 1, target.statusEffectv1("Mimbrane Lust Cloud"));
						target.setStatusValue("Mimbrane Lust Cloud", 2, 3);
					}
				}
				else
				{
					output("\n\nYou dart out of the venomous cloud before it has an opportunity to seep into your bloodstream.");
				}
			}
		}
		
		private function mimbraneSkinContact(target:Creature):void
		{
			output("It’s hard to keep track of the Mimbrane as it dashes through the air around you. You finally catch sight of the parasite just as it rears up in place above you, narrowing its form. It’s dive bombing straight towards you!");

			// standard miss/block text
			if (combatMiss(this, target))
			{
				output("\n\nYou twist out of the path of the speeding Mimbrane at the last second!");
			}
			else if(target.hasAirtightSuit())
			{
				output(" You’re quick enough to avoid being hit head-on, but the parasite manages to brush up against you as it sails by. Oily perspiration smears along your [pc.armor], but it is all for naught thanks to your outfit’s impermeability.");
			}
			// hit
			else
			{
				output(" You’re quick enough to avoid being hit head-on, but the parasite manages to brush up against you as it sails by. Oily perspiration smears along your " + (target.hasArmor() ? "[pc.armor]" : "body") + ", forcing a healthy whiff of wanton lust down your nostrils.");

				//target.lust(5 + target.libido()/20);
				applyDamage(new TypeCollection( { drug: (5 + target.libido()/20) } ), this, target, "minimal");

				// not defeated
				if (target.lust() < target.lustMax())
				{
					output("\n\nYou quickly brush off the residue before it can affect you more than it already has.");
				}
			}
		}
	}
}