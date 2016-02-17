package classes.Characters 
{
	import classes.Creature;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Utility.MathUtil;
	import classes.GameData.Pregnancy.PregnancyStageProgression;
	import classes.GLOBAL;
	import classes.Items.Apparel.GooeyCoverings;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Melee.GooeyPsuedopod;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Protection.BasicShield;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Utility.rand;
	
	/**
	 * Hook damage processing to call OnTakeDamage to heal from burning/freezing whilst armor is gone.
	 * Figure out how to implement this:
	 * 		(in-game effect: chance of damage reduction from or percent resistance to kinetic attacks until armor hits 0)
	 */
	public class CrystalGooT2 extends Creature
	{
		private var baseReflexes:Number;
		private var baseShieldKineticResistance:Number;
		private var kickMeleeWeapon:ItemSlotClass;
		private var slapMeleeWeapon:ItemSlotClass;
		
		public function CrystalGooT2() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "ganrael ambusher";
			this.originalRace = "ganrael";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "The goo's liquid flexibility allows her to handily avoid your attack.";
			this.customBlock = "The goo's liquidity absorbs a great deal of punishment - without taking damage.";
			this.isPlural = false;
			
			baseHPResistances = new TypeCollection();
			
			kickMeleeWeapon = new GooeyPsuedopod();
			kickMeleeWeapon.attackVerb = "kick";
			kickMeleeWeapon.attackNoun = "kick";
			kickMeleeWeapon.baseDamage.kinetic.damageValue = 20;
			kickMeleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			kickMeleeWeapon.hasRandomProperties = true;
			
			slapMeleeWeapon = new GooeyPsuedopod();
			slapMeleeWeapon.baseDamage.kinetic.damageValue = 10;
			slapMeleeWeapon.hasRandomProperties = true;
			
			meleeWeapon = kickMeleeWeapon;
			
			armor = new GooeyCoverings();
			armor.defense = 10;
			armor.hasRandomProperties = true;
			
			this.rangedWeapon = new EmptySlot();
			
			shield = new BasicShield();
			shield.shields = 100;
			baseShieldKineticResistance = shield.resistances.kinetic.resistanceValue = 20.0;
			
			shield.hasRandomProperties = true;
			
			this.physiqueRaw = 30;
			baseReflexes = reflexesRaw = 19;
			this.aimRaw = 12;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 14;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 20;
			
			this.XPRaw = 450;
			this.level = 7;
			this.credits = 0;
			this.HPMod = 100;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.shieldDisplayName = "ARMOR";
			
			this.femininity = 50;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "green";
			this.tallness = 24;
			this.thickness = 70;
			this.tone = 80;
			this.hairColor = "none";
			this.scaleColor = "none";
			this.furColor = "none";
			this.hairLength = 0;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.TYPE_HUMAN;
			this.skinTone = "green";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 1;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 3;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 5;
			this.hipRatingRaw = 2;
			this.buttRatingRaw = 2;
			this.cocks = new Array();
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Stun Immune");
			
			isUniqueInFight = true;
			btnTargetText = "GooAmbusher";
			sexualPreferences.setRandomPrefs(2 + rand(3));
			
			Randomise();
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			if (shields() > 0) return "CRYSTAL_GOO_ARMORED";
			else return "CRYSTAL_GOO_UNARMORED";
		}
		
		public function Randomise():void
		{
			if(rand(2) == 0) skinTone = "green";
			else skinTone = "blue";
			
			UpdateState();
		}
		
		public function UpdateState():void
		{
			if (hasStatusEffect("GooCamo"))
			{
				long = "The ganrael is hidden among the stones and fungi at the moment, prowling for the best direction to strike from. Disturbing scuttling sounds echo in the chamber, and you’ve no doubt that you’ll get another look all too soon.";		
			}
			else if (!hasStatusEffect("Unarmored"))
			{
				long = "The ganrael ambusher is a frightful sight. Tens of skittering, insectile legs shift and clatter beneath its  lichen cloak";
				if (!kGAMECLASS.pc.hasStatusEffect("Grappled")) long += ", propelling it through pillars and over rocks in a constant attempt to flank you";
				long += ". Though it usually stays low to take advantage of its camouflage, its nine-foot body is capable of dangerous leverage when it rears to strike. It’s covered with hard, sculpted plates that provide formidable defense, and its gauntleted hands ward blows. The uppermost section of its trunk resembles a";
				if (flags["MET_NYREA_ALPHA"] != undefined || flags["MET_NYREA_BETA"] != undefined) long += " nyrea";
				else long += " woman";
				long += " sculpted from " + skinTone+" stone.";
				if (shields() < shieldsMax() * 0.66) long += " Chips and cracks in its armor show the soft, gooey flesh underneath - the consequences of your attack.";
			}
			else
			{
				long = "The ganrael’s meticulously-curated covering is in ruins, and its movement has slowed considerably. Underneath the shattered guise is a blank, flat-bodied neuter. It still attempts to circle you, but its trunk now resembles a chubby "+ skinTone +" caterpillar rather than a frightening insectile predator in both grace and shape. Slashes of color are visible through damaged lichen leftovers and it leaves a trail of crystal dust, undermining its camouflage.";
			}
			
			if (shields() > 0)
			{
				if (!hasStatusEffect("Force It Gender")) createStatusEffect("Force It Gender");
				if (hasStatusEffect("Force Fem Gender")) removeStatusEffect("Force Fem Gender");
			}
			else
			{
				if (hasStatusEffect("Force It Gender")) removeStatusEffect("Forced It Gender");
				if (!hasStatusEffect("Forced Fem Gender")) createStatusEffect("Force Fem Gender");
			}
			
			// Interpolate the armor value as a percent between a multiplier between 1 and 0.33. Use this multiplier to modify the base reflex value of the enemy.
			reflexesRaw = MathUtil.LinearInterpolate(0.33, 1, shieldsMax() / shields()) * baseReflexes;
			shield.resistances.kinetic.resistanceValue = MathUtil.LinearInterpolate(0, 1, shieldsMax() / shields()) * baseShieldKineticResistance;
		}
		
		public function OnTakeDamage(incomingDamage:TypeCollection):void
		{
			if (shields() <= 0)
			{
				if (!hasStatusEffect("Unarmored")) 
				{
					createStatusEffect("Unarmored");
				}
				else
				{
					var typedDamageTotal:int = 0;
					typedDamageTotal = incomingDamage.freezing.damageValue;
					typedDamageTotal = incomingDamage.burning.damageValue;
					
					if (typedDamageTotal > 0)
					{
						shieldsRaw = (typedDamageTotal * 0.66);
						
						if (incomingDamage.burning.damageValue > 0) output(" The scorched flesh hisses and bubbles at the site of the damage, hardening into a jagged, scar-like plate!");
						else output(" The cold causes hundreds of tiny crystals to form, clouding and stiffening the site into a sandpapery plate!");
					}
				}
			}
			else if (shields() > 0)
			{
				if (incomingDamage.kinetic.damageValue > 0)
				{
					output(" The ganrael’s rounded gauntlets deflect some of the force!");
				}
			}
		}
			
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			UpdateState();
			
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			// Force update the output here for the goo being hidden
			if (hasStatusEffect("GooCamo"))
			{
				FalseRetreat(target);
			}
			
			// If this is the first round that goo camo has persisted, use a special attack
			if (hasStatusEffect("GooCamo") && statusEffectv1("GooCamo") == 1)
			{
				SneakSqueeze(target);
				return;
			}
			
			if (skipTurn)
			{
				skipTurn = false;
				return;
			}
			
			var attacks:Array = [];
			
			attacks.push( { v: LashOut, w: (hasStatusEffect("Unarmored") ? 10 : 40) } );
			attacks.push( { v: HaveANiceTrip, w: (hasStatusEffect("Unarmored") ? 20 : 10) } );
			if (!hasStatusEffect("GooCamo Cooldown")) attacks.push( { v: FalseRetreat, w: (hasStatusEffect("Unarmored") ? 20 : 10) } );
			
			//tactics change as armor depletes; gets less evasive, slower, and less damaging as leg-points break off
		}
		
		private function LashOut(target:Creature):void
		{
			//high use chance/main attack while armored

			var numAttacks:int = 0;
			var i:int = 0;
			
			if (!hasStatusEffect("Unarmored"))
			{
				numAttacks = Math.round(((shieldsMax() / shields()) / 0.25)) + 2;
				meleeWeapon = kickMeleeWeapon;
				
				output("The ganrael lashes out with its legs!");
				for (i = 0; i < numAttacks; i++)
				{
					output("\n");
					CombatAttacks.SingleMeleeAttackImpl(this, target, false, "melee");
				}
			}
//texs		else
			{
				meleeWeapon = slapMeleeWeapon;
				
				output("The ganrael slaps at you with its goopy hands!");
				for (i = 0; i < 2; i++)
				{
					output("\n");
					CombatAttacks.SingleMeleeAttackImpl(this, target, false, "melee");
				}
			}
		}
		
		private function HaveANiceTrip(target:Creature):void
		{
			var missed:Boolean;
			
			if (!hasStatusEffect("Unarmored"))
			{
				// without ‘unarmored’ status:
				// -rarely used, but accurate
				// -trips PC
				// -kinetic damage

				output("The ganrael swipes at your [pc.feet] with its trunk!");
				
				missed = combatMiss(this, target, -1, 0.5);
				if (missed && target.hasWings()) output(" It connects, but your wings keep you upright anyway.");
				else if (missed && !target.hasWings()) output(" You easily hop over it.");
				else
				{
					output(" It takes out your support and you crash to the cave floor!");
					applyDamage(new TypeCollection( { kinetic: 7 + rand(5) } ), this, target, "minimal");
					target.createStatusEffect("Tripped");
				}
			}
			else
			{
				//with ‘unarmored’:
				// -commonly used but inaccurate (enough to avoid annoying player)
				// -still trips PC
				// -light lust damage (PC falls on plush, soft-bodied goo)
				
				missed = combatMiss(this, target, -1, 3);

				output("The ganrael tries to stick to you, clinging at you with gooey fingers and being a nuisance.");
				if (missed) output(" You manage to keep away from it.");
				else
				{
					output(" Your [pc.foot] slips on its gooey trunk and you stumble, landing right on the alien’s body! It drags you to the ground, oozing warm tongues of flesh into your intimate places. Using all your focus, you");
					if (target.lust() >= target.lustMax() * 0.66) output(" barely");
					output(" resist its caresses and roll away.");
					target.createStatusEffect("Tripped");
					applyDamage(new TypeCollection( { tease: 5 + rand(3) } ), this, target, "minimal");
				}
			}
		}
		
		private function FalseRetreat(target:Creature):void
		{
			// Geddynote:
			// The presence of GooCamo on a target infers a 66% miss chance after ALL other modifiers have been taken into account.
			// combatMiss and rangedCombatMiss are where this is hooked up.
			
			//gan drops flat and attempts to hide using camouflage; 
			// PC must pass combined int+aim check to keep track of gan (base check value should require med-high scores in both or perfect score in one and med score in other - scaled to regional difficulty)
			//higher odds of use if unarmored
			//one-turn cooldown (gan never uses it two turns in a row; ignore this if excessive handicap)
			//check gets easier as gan loses armor and therefore camo falls off (either gradated or flat modifier)
			//check also easier for techs with the drone active (flat modifier)
			//tripped PC gets penalty to check
			
			if (hasStatusEffect("GooCamo"))
			{
				addStatusValue("GooCamo", 1, 1);
			}
			else
			{
				createStatusEffect("GooCamo", 0);
			}
			
			var chanceRoll:Number = (target.aim() + target.intelligence() + rand(40) / 3);
			
			output("The ganrael drops and begins to weave through the rocks, trying to elude you!");
			
			// This is a mess, but its the clearest way I can handle this.
			
			var baseFailure:Number = (intelligence() + aim()) / 2;
			if (chanceRoll > baseFailure)
			{
				removeStatusEffect("GooCamo");
				createStatusEffect("GooCamo Cooldown", 2);
				output(" You keep sight of it with your superior aim and honed intelligence.");
				return;
			}
			
			baseFailure -= (statusEffectv1("Camo Weight") * 5);
			if (chanceRoll > baseFailure )
			{
				removeStatusEffect("GooCamo");
				createStatusEffect("GooCamo Cooldown", 2);
				output(" It’s hard to track, but damage has left colorful gaps in the lichen covering.");
				return;
			}
			
			if (hasStatusEffect("Unarmored"))
			{
				baseFailure *= 0.8;
				if (chanceRoll > baseFailure)
				{
					removeStatusEffect("GooCamo");
					createStatusEffect("GooCamo Cooldown", 2);
					output(" Its exposed " + skinTone +" and goopy sounds stick out well enough that you can keep tracking it.");
					return;
				}
			}
			
			if (target.hasPerk("Combat Drone"))
			{
				baseFailure *= 0.8;
				if (chanceRoll > baseFailure)
				{
					removeStatusEffect("GooCamo");
					createStatusEffect("GooCamo Cooldown", 2);
					output(" Your drone continues to track it, making it easy to reacquire.");
					return;
				}
			}
			
			if (target.hasStatusEffect("Tripped"))
			{
				output(" It takes advantage of your grounded state, moving through blind spots until you lose it completely. The cave echoes with its scuffling gait, like the earth is shifting in preparation to swallow you.");
			}
			else
			{
				output(" Despite your best efforts, you lose track of it. The cave echoes with skitters and laughs, no two from the same direction, and your anxiety mounts.");
			}
		}
		
		public function ShouldIntercept():Boolean
		{
			// Return true if we should fuck the players current action off and redirect it through SneakSqueezeAttackReaction
			if (hasStatusEffect("GooCamo") && !skipIntercept)
			{
				
			}
			return false;
		}
		
		private var skipIntercept:Boolean = false;
		private var skipTurn:Boolean = false;
		
		public function SneakSqueezeAttackReaction(attackOpts:Object):void
		{
			// isMelee, isRanged, isTease, isSquirt, isSpecial, isAOE, isWait, isStand
			// isFantasize, isFlee
			
			var pc:PlayerCharacter = kGAMECLASS.pc;
			var pcHit:Boolean = false;
			
			if (attackOpts["isMelee"] != undefined || attackOpts["isRanged"] != undefined)
			{
				if (rand(10) == 0)
				{
					output("You " + pc.meleeWeapon.attackVerb +" blindly and barely manage a glancing hit on the lurking ganrael just as it bursts from cover! The alien seems stunned, but its momentum carries it into you anyway.");
					pcHit = true;
				}
				else
				{
					output("You "+ pc.meleeWeapon.attackVerb +" blindly, hoping to hit the lurking ganrael, but fail. It bursts from cover in a different direction and slams into you.");
				}
				skipTurn = false;
			}
			else if (attackOpts["isSquirt"] != undefined)
			{
				if (rand(10) == 0)
				{
					output("You squirt blindly and barely manage a glancing hit on the lurking ganrael just as it bursts from cover! The alien seems stunned, but its momentum carries it into you anyway.");
					pcHit = true;
					skipTurn = false;
				}
				else
				{
					output("You squirt blindly, hoping to hit the lurking ganrael, but fail. It bursts from cover in a different direction and slams into you.");
					skipTurn = false;
				}
			}
			else if (attackOpts["isTease"] != undefined)
			{
				output("You pose alluringly, but with no clue where the alien is, you have no way of knowing if your slutty seduction has hit its mark.");
				skipTurn = false;
			}
			else if (attackOpts["isAOE"] != undefined)
			{
				output(" The ganrael reels from your indiscriminate attack, revealing itself and costing it the element of surprise.");
				removeStatusEffect("GooCamo");
				createStatusEffect("GooCamo Cooldown", 3);
				skipTurn = false;
				return;
			}
			
			if (attackOpts["isWait"] != undefined)
			{
				output("You stop moving and try to calm yourself, preparing for the blow.");
				if (rand(10) <= 3)
				{
					output(" The ganrael sails at you and you throw it to the ground. It skitters away and, though its stoic mask doesn’t show it, seems a little surprised.");
					removeStatusEffect("GooCamo");
					createStatusEffect("GooCamo Cooldown", 3);
					skipTurn = true;
					return;
				}
				else
				{
					output("\n\nYour newfound tranquility makes it slightly less stressful when the ganrael tackles you from cover and wraps you up in its body, laughing.");
					pc.createStatusEffect("Grappled", 9999);
				}
			}
			else if (attackOpts["isFlee"] != undefined)
			{
				if (pc.hasWings())
				{
					output("You beat your [pc.wings] and fly as high as the cave allows, intent on escaping this trap. But when you pick a direction and flee,");
					if (hasStatusEffect("Unarmored")) output(" goopy fingers");
					else output(" hard hands");
					output(" grab your [pc.foot] and bring you violently to the ground! The ganrael wraps you in its body, pinning your wings.");
				}
				else
				{
					output("The skittering sounds bore in from all directions until you can’t take it anymore, and you bolt. But when you pass an outcropping of rock, a blur tackles you, bringing you the the ground! The ganrael wraps you in its body, laughing.");
				}
			}
			else
			{
				output(" The creature bowls you over and its body wraps around you! You’re trapped!");
			}
		}
		
		private function SneakSqueeze(target:Creature):void
		{
			//grapple does med crushing damage per turn if NPC armored or very light crushing plus decent lust damage when unarmored (slops into sensitive places)
			//static burst and etc. skills break free of grapple in one turn, else PC must struggle based on relevant stat; 
			// escape check is more forgiving if ganrael is unarmored
			
			//if unarmored
			if (target.armor is EmptySlot || target.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || target.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR))
			{
				output("The ganrael’s gooey body spreads over you, working into your");
				if (target.armor is EmptySlot || target.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) output(" crotch and licking at your [pc.legFurScales].");
				else output(" [pc.gear], hunting for sensitive spots.");
				output(" Blood hammers in your temples and your needy");
				if (target.hasCocks() || target.hasVaginas() || target.isHerm()) output(" sexes throb");
				else if (target.hasCock() || target.hasVagina()) output(" sex throbs");
				else output(" asshole throbs");
				output(" inches away from its tendrils, demanding attention.");
				//lust damage
				applyDamage(new TypeCollection( { tease: 5 + rand(5) } ), this, target, "minimal"); // 9999 damage
			}
			//if armored
			else
			{
				output("The ganrael’s unforgiving trunk tightens around you.");
				if (target.shields() > 0) output(" Your shield crackles dangerously.");
				else if (target.isGoo()) output(" It’s mildly uncomfortable until your amorphous body flows out of the way.");
				else output(" You panic as trapped blood dims your vision and numbs you. You’ve got to get free!");
				
				var damage:Number = 10;
				if (target.isGoo()) damage -= 3;
				damage += rand(damage);
				
				applyDamage(new TypeCollection( { kinetic: damage }, DamageFlag.CRUSHING ), this, target, "minimal");
			}
		}
		
		public function SneakSqueezeStruggle(target:Creature):void
		{
			var escaped:Boolean = false;
			
			//PC struggle text
			if (!(target.armor is EmptySlot) && target.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT))
			{
				if (target.physique() > target.reflexes())
				{
					if ((target.physique() + rand(30) / 2) > (physique() - (target.statusEffectv1("Grappled") * 5)))
					{
						output("You shove the creature’s legs away and batter from its grasp!");
						escaped = true;
					}
				}
				else
				{
					if ((target.reflexes() + rand(30) / 2) > (reflexes() - (target.statusEffectv1("Grappled") * 5)))
					{
						output("It shifts its grip, and you use the chance to free your upper body! The alien tries to keep hold, but you worm the rest of the way out.");
						escaped = true;
					}
				}
			}
			else
			{
				if (target.physique() > target.reflexes())
				{
					if ((target.physique() + rand(30) / 2) > (physique() - (target.statusEffectv1("Grappled") * 5)))
					{
						output("It’s like punching taffy, but you batter so many lumps into the malleable ganrael that it releases you.");
						escaped = true;
					}
				}
				else
				{
					if ((target.reflexes() + rand(30) / 2) > (reflexes() - (target.statusEffectv1("Grappled") * 5)))
					{
						output("Moving with the flow of gooey skin, you slip the creature’s grip like wet soap. / (else fail) Your struggles fail to free you from the alien’s grip!");
						escaped = true;
					}
				}
			}
			
			if (escaped)
			{
				target.removeStatusEffect("Grappled");
				createStatusEffect("Grappled", 2);
			}
		}
	}
}
