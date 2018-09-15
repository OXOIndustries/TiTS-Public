package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Apparel.TSTArmor;
	import classes.Items.Guns.AegisLightMG;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Guns.NovaRifle;
	import classes.Items.Melee.Fists;
	import classes.Items.Melee.GooeyPsuedopod;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Miscellaneous.EmptySlot;
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
	import classes.Engine.Interfaces.clearOutput;
	import classes.StringUtil;
	
	
	public class CommanderHenderson extends Creature
	{
		//constructor
		public function CommanderHenderson()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Commander Henderson";
			originalRace = "human";
			a = "";
			capitalA = "";
			this.long = "";
			this.customBlock = "The commander’s incredible bulk meets your attack with little effect.";
			this.isPlural = false;
			isLustImmune = false;
			isUniqueInFight = true;
			
			this.meleeWeapon = new GooeyPsuedopod();
			meleeWeapon.attackVerb = "tentacle-slap";
			meleeWeapon.attackNoun = "tentacle-slap";
			meleeWeapon.longName = "wriggly tentacle";
			meleeWeapon.baseDamage.kinetic.damageValue = 24;
			meleeWeapon.addFlag(DamageFlag.CRUSHING);
			meleeWeapon.hasRandomProperties = true;
			meleeWeapon.attack = -4;
			
			this.rangedWeapon = new EmptySlot();
			this.shield = new EmptySlot();
			
			armor = new TSTArmor();
			armor.resistances.kinetic.resistanceValue = 25.0;
			armor.resistances.burning.resistanceValue = 25.0;
			armor.resistances.freezing.resistanceValue = 25.0;
			armor.resistances.electric.resistanceValue = 40.0;
			armor.resistances.corrosive.resistanceValue = 20.0;
			armor.resistances.drug.resistanceValue = 10.0;
			armor.resistances.pheromone.resistanceValue = 25.0;
			armor.resistances.poison.resistanceValue = 25.0;
			armor.resistances.psionic.resistanceValue = 80.0;
			armor.resistances.tease.resistanceValue = 25.0;
			armor.defense = 8;
			armor.evasion = -4;
			armor.hasRandomProperties = true;
			
			this.physiqueRaw = 35;
			this.reflexesRaw = 15;
			this.aimRaw = 28;
			this.intelligenceRaw = 8;
			this.willpowerRaw = 8;
			this.libidoRaw = 33;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 20;
			
			this.level = 8;
			this.XPRaw = normalXP();
			this.credits = 80 + rand(80);
			this.HPMod = 100;
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
			
			btnTargetText = "Henderson";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "HENDERSON";
		}
		
		override public function CombatAI(allied:Array, hostiles:Array):void 
		{			
			var bDoAttack:Boolean = true;
			
			if (HP() < HPMax())
			{
				healTick();
			}
			
			
			for (var i:int = 0; i < hostiles.length; i++)
			{
				if (hostiles[i] is PlayerCharacter && hostiles[i].hasStatusEffect("Grappled"))
				{
					handleGrapple(hostiles[i]);
					bDoAttack = false;
				}
			}
			
			if (bDoAttack)
			{
				var target:Creature = selectTarget(hostiles);
				if (target == null) return;
				
				var atks:Array = [];
				
				atks.push( { v: tentacleWhip, w: 40 } );
				atks.push( { v: aphrodisiacSpray, w: 30 } );
				if (target is PlayerCharacter && !hasStatusEffect("Grapple Cooldown")) atks.push( { v: tentacleRestraint, w: 15 } );
				atks.push( { v: staggeringSlam, w: 20 } );
				if (energy() > 55) atks.push( { v: crushingWorms, w: 25 } );
				
				weightedRand(atks)(target, hostiles);
			}
		}
		
		public function tentacleWhip(target:Creature, hostiles:Array):void
		{
			output("The tentacle abomination sweeps his arm towards " + target.getCombatName() + ", extending the squirming mass of red vines far beyond a human’s reach to smash its targets.");
			if (combatMiss(this, target))
			{
				output(" Luckily, it’s attack is slow, and easily dodged!");
			}
			else
			{
				output(" The tentacles slam into " + target.getCombatName() + " like a Pyrite freighter");
				if (rand(4) == 0)
				{
					output(", throwing " + target.getCombatPronoun("himher") + " to the ground");
					createStaggeredEffect(target);
				}
				output("!");
				
				applyDamage(damageRand(new TypeCollection( { kinetic: 20 }, DamageFlag.CRUSHING), 15), this, target, "minimal");
			}
		}
		
		public function tentacleRestraint(target:Creature, hostiles:Array):void
		{
			createStatusEffect("Grapple Cooldown", 4);
			
			output("Henderson lunges for " + target.getCombatName() + ", tentacle-arms outstretched in a writhing mass of squirming sub-creatures.");
			if (combatMiss(this, target))
			{
				output(" Luckily, you manage to dodge the grab!");
			}
			else
			{
				output(" The Commander grabs you, squeezing furiously and drawing you towards himself. Worse, the tentacles start spurting bubbling pink fluids all over you, biting at your " + (target.hasAirtightSuit() ? "suit" : "skin") +"! It’s acid!");
				
				applyDamage(damageRand(new TypeCollection( { corrosive: 8 }, DamageFlag.BYPASS_SHIELD), 15), this, target, "minimal");
				
				CombatAttacks.applyGrapple(target, 66);
			}
		}
		
		public function handleGrapple(target:Creature):void
		{
			output("Henderson’s grapple persists, holding you tight and bathing you in pink acid from a dozen spurting tentacles.");
			applyDamage(damageRand(new TypeCollection( { corrosive: 8 }, DamageFlag.BYPASS_SHIELD), 15), this, target, "minimal");
		}

		public function aphrodisiacSpray(target:Creature, hostiles:Array):void
		{
			var struct:Object = GetCharacterStructure(hostiles, { pc: PlayerCharacter, neykkar: ChiefNeykkar } );
			
			var bHitNeykkar:Boolean = false;
			if (struct.neykkar != undefined && !struct.neykkar.isDefeated())
			{
				bHitNeykkar = rand(2) == 0;
			}
			
			output("The corrupted commander rears back and hurls all over the deck, retching up a roiling gas cloud of crimson that splatters across the deck and wafts up towards you.");
			if ((struct.pc as PlayerCharacter).hasAirtightSuit())
			{
				output(" Your suit cuts straight to the internal oxygen supply before even a whiff of the gas can seep inside.");
				
				if (!bHitNeykkar)
				{
					if (!rangedCombatMiss(this, struct.pc))
					{
						output(" Another roar and spray of liquid splatters across your suits mask,");
						if(!struct.pc.hasBlindImmunity())
						{
							output(" fortunately to no effect.");
						}
						else if(!struct.pc.hasStatusEffect("Blinded"))
						{
							output(" forming a blinding morass of sticky goop.");
							CombatAttacks.applyBlind(struct.pc, rand(3) + 1);
						}
						else
						{
							output(" forming an extra layer to your blinding mask!");
							struct.pc.addStatusValue("Blinded", 1, 1);
						}
					}
					else
					{
						output(" The commander rears back again, another roar signaling a second spray of liquid heading your way, but you barely manage to slide out of its way before it can hit you!");
					}
				}
				else
				{
					output(" Another roar and spray of liquid splatters across the Chief’s face, forming a blinding mask of sticky aphrodesiacs!");
					applyDamage(damageRand(new TypeCollection( { drug: 7 } ), 15), this, struct.neykkar, "minimal");
					CombatAttacks.applyBlind(struct.neykkar, rand(3) + 1);
				}
			}
			else
			{
				output(" You recoil from the overwhelming, musky scent, trying to cover you nose as best you can.");
				
				if (!bHitNeykkar)
				{
					if (!rangedCombatMiss(this, struct.pc))
					{
						output(" Even as you’re struggling against the fumes, another roar and spray of liquid splatters across your face,");
						if(!struct.pc.hasBlindImmunity())
						{
							output(" fortunately to no effect.");
						}
						else if(!struct.pc.hasStatusEffect("Blinded"))
						{
							output(" forming a blinding mask of sticky aphrodesiacs!");
							CombatAttacks.applyBlind(struct.pc, rand(3) + 1);
						}
						else
						{
							output(" forming another layer to your blinding mask!");
							struct.pc.addStatusValue("Blinded", 1, 1);
						}
						applyDamage(damageRand(new TypeCollection( { drug: 7 } ), 15), this, struct.pc, "minimal");
					}
					else
					{
						output(" The commander rears back again, another roar signaling a second spray of liquid heading your way, but you barely manage to slide out of its way before it can hit you!");
					}
				}
				else
				{
					output(" Even as you’re struggling against the fumes, another roar and spray of liquid splatters across the Chief’s face, forming a blinding mask of sticky aphrodesiacs!");
					applyDamage(damageRand(new TypeCollection( { drug: 7 } ), 15), this, struct.neykkar, "minimal");
					CombatAttacks.applyBlind(struct.neykkar, rand(3) + 1);
				}
			}
		}
		
		public function staggeringSlam(target:Creature, hostiles:Array):void
		{
			var struct:Object = GetCharacterStructure(hostiles, { pc: PlayerCharacter, neykkar: ChiefNeykkar } );
			
			var bStaggeredPC:Boolean = (rand(3) == 0 && !struct.pc.isPlanted());
			var bHitNeykkar:Boolean = (struct.neykkar != undefined && !struct.neykkar.isDefeated());
			var bStaggeredNeykkar:Boolean = (bHitNeykkar && rand(3) == 0 && !struct.neykkar.isPlanted());
			
			output("The Commander throws his hands up and hurls them down, slamming the deck with all his augmented might. A veritable shockwave slams you as the deck rocks precariously.");
			
			var pcDamage:DamageResult = applyDamage(damageRand(new TypeCollection( { kinetic: 5 } ), 15), this, struct.pc, "suppress");
			var neykkarDamage:DamageResult;
			
			if (bHitNeykkar) neykkarDamage = applyDamage(damageRand(new TypeCollection( { kinetic: 5 } ), 15), this, struct.neykkar, "suppress");
			
			if (bStaggeredPC && !bStaggeredNeykkar)
			{
				output(" <b>You are staggered!</b>");
				outputDamage(pcDamage);
				createStaggeredEffect(struct.pc);
			}
			else if (bStaggeredPC && bStaggeredNeykkar)
			{
				output(" <b>You</b>");
				outputDamage(pcDamage);
				output(" <b>and the Chief</b> ");
				outputDamage(neykkarDamage);
				output(" <b>are staggered!</b>");
				
				createStaggeredEffect(struct.pc);
				createStaggeredEffect(struct.neykkar);
			}
			if (!bStaggeredPC && bStaggeredNeykkar)
			{
				outputDamage(pcDamage);
				output(" <b>The Chief is staggered!</b>");
				outputDamage(neykkarDamage);
				
				createStaggeredEffect(struct.neykkar);
			}
		}
		
		private function createStaggeredEffect(target:Creature):void
		{
			if (target.hasStatusEffect("Staggered"))
			{
				target.setStatusValue("Staggered", 1, 5);
			}
			else
			{
				CombatAttacks.applyStagger(target, 5);
			}
		}
		
		public function crushingWorms(target:Creature, hostiles:Array):void 
		{
			energy( -55);
			output("Henderson slowly extends one of his mutated, writhing limbs in");
			if (target is PlayerCharacter) output(" your");
			else output(" the Chief’s");
			output(" direction. With a gurgling roar, several of the blood-red tendrils detatch from his arm, flopping down onto the ground and squirming like fish out of water. They’d almost be comical looking, if they didn’t quickly right themselves and start bee-lining for " + target.getCombatPronoun("himher") + ". Several of the things leap for " + target.getCombatName() + ", grasping and wrapping around " + target.getCombatPronoun("hisher") + " arms and legs like a dozen tiny snakes. They start squeezing and hammering, doing everything they can to drag " + target.getCombatPronoun("himher") + " down with them!");
			
			applyDamage(damageRand(new TypeCollection( { kinetic: 5 }, DamageFlag.BYPASS_SHIELD), 15), this, target, "minimal");
			if (target.hasStatusEffect("Crushing Worms"))
			{
				target.setStatusValue("Crushing Worms", 1, 3);
			}
			else
			{
				target.createStatusEffect("Crushing Worms", 3, 0, 0, 0, false, "Constrict", "Crushing worms are wrapped around " + (target is PlayerCharacter ? "your" : "their") +" limbs!", true, 0, 0xFF0000);
			}
		}
		
		public function freeChief():void
		{
			clearOutput();
			
			output("You turn to the Chief and pull out your [pc.meleeWeapon]. <i>“Hang on, I’m getting you out!”</i>");

			output("\n\nShe wiggles urgently in the tentacles’ grasp as you pull them off her limbs, hurrying before the Commander gets his bearings again. You slice away most of the tentacles, causing Henderson to shudder violently with pain, but you get the Chief free... save for the one huge, thick tentacle lodged in her cunt.");

			output("\n\nIt’s lodged in tight, preventing the belly-bloated ‘taur from moving. While you still have time, you hop around behind her and grab the tentacle, hoping to yank it out of her. Instead, the tentacle pulsates, creampies the Chief with an explosion of pink juices that make her shriek, and then detatches from its host, breaking off and slithering out of your hands... and disappearing into Chief Neykkar’s belly. She grunts and gasps, flailing her arms at her belly as it bloats out even more. You can see her skin writhing under her chitin plates, squirming as the tentacle moves inside her. Oh, shit.");

			output("\n\n<i>“Fuck. Ah-ah no God fuck it’s ins-- fuck I’m cumming aahhh!”</i>");

			output("\n\nShe clenches, screaming and flopping bonelessly onto her side and spilling fuck-juices like a waterfall out of her horsecunt. Dammit.");
			
			createStatusEffect("Free Chief");
			CombatManager.processCombat();
		}
		
		public function actuallyFreeChief():void
		{
			output("\n\nYou glance behind yourself, just in time to see the Chief struggling to her feet. She looks dizzy and horny and altogether disheveled, but she nevertheless staggers up and grabs her machinegun from where it had clattered aside some time before. Neykkar trots up to your side, racking the gun’s bolt and shouldering it. She gives you a slight nod, even as her tentacle-bloated belly strains and deforms around the creature inside it.\n\n<b>Chief Neykkar has joined the fight!</b>");
			
			setStatusValue("Free Chief", 1, 2);
			
			var f:ChiefNeykkar = new ChiefNeykkar();
			f.hendersonConfig();
			
			CombatManager.addFriendlyActor(f);
		}
		
		public function attemptCure():void
		{
			clearOutput();
			
			if (!hasStatusEffect("Parasite Cure"))
			{
				output("You wind your way around the mutated Commander Henderson, ducking and weaving out of the way of his many throbbing, goo-leaking tentacles. Through a mix of sheer luck");
				if (kGAMECLASS.pc.PQ() >= 75) output(" and your impressive physique");
				else if (kGAMECLASS.pc.RQ() >= 75) output(" and your preternatural reflexes");
				else if (kGAMECLASS.pc.IQ() >= 75) output(" and your cunning intellect dissecting his attack patterns");
				else output(" and pluckiness");
				output(", you manage to get over to the Fire Suppression system controls: a huge, red box bolted to one of the walls.");

				output("\n\nYou yank the box open, and find that a tentacle has ripped through the bulkhead in back and wrapped itself around the controls inside. It pulsates like with a heartbeat, drooling pink tentacle-jizz all over the controls. Gross!");

				output("\n\nBefore you can decide how to deal with this, you feel another tendril wrap around your [pc.foot], yanking you back from the controls and into the fight!");
				
				createStatusEffect("Parasite Cure", 1, 100);
			}
			else if (statusEffectv1("Parasite Cure") == 1)
			{
				output("Once again you duck and weave over to the fire control panel, sliding to a stop in front of it and grabbing at the tentacle inside.");
				if (kGAMECLASS.pc.hasRangedWeapon()) output(" You can’t shoot it for risk of damaging the controls underneath it or your whole plan is down the drain!"); 
				output(" You pull out your [pc.meleeWeapon] and start");
				if (kGAMECLASS.pc.meleeWeapon.baseDamage.hasFlag(DamageFlag.CRUSHING)) output(" bashing");
				else output(" hacking");
				output(" at the tentacle, trying to drive it out of the way.");
				
				var dam:Number = damageRand(kGAMECLASS.pc.meleeDamage(), 15).getTotal();
				addStatusValue("Parasite Cure", 2, -(dam));
				
				if (statusEffectv2("Parasite Cure") > 0)
				{
					output("\n\nYou hammer at the tentacle as hard as you can, and though it looks pretty hurt, you can’t quite get it out of the way before Commander Henderson gets too close -- you’ve got no choice but to get out the way if you don’t want to get grabbed!");
				}
				else
				{
					output("\n\nYou slam the tentacle as hard as you can, wrenching it away from the bulkhead in a spurting mess. It squirms and lashes at you, but finally withdraws. The controls are slathered with tentacle-cum, but they’re unguarded now!");

					output("\n\nUnfortunately, Henderson’s coming up fast behind you, roaring and slavering. You have to turn and dodge him again!");
					setStatusValue("Parasite Cure", 1, 2);
				}
			}
			else if (statusEffectv1("Parasite Cure") == 2)
			{
				kGAMECLASS.pc.removeKeyItem("Parasite Cure");
				output("You lunge for the control panel one more time, leaping over a sweep of Henderson’s biggest tentacle before you and shoving a hand into your pack. You grab the cure-laden hypo and shove it into the replication chamber, replacing the fire-foam vial with the nanobots. Now the ship’s systems will start spreading the cure for you, replicating it all over the vessel... as soon as you trigger the fire alarm.");
				setStatusValue("Parasite Cure", 1, 3);
			}
			
			CombatManager.processCombat();
		}
		
		override public function OnTakeDamage(incomingDamage:TypeCollection):void
		{
			if (hasStatusEffect("Parasite Cure") && statusEffectv1("Parasite Cure") == 3)
			{
				if (incomingDamage.hasFlag(DamageFlag.CHANCE_APPLY_BURN) || incomingDamage.hasFlag(DamageFlag.EXPLOSIVE))
				{
					setStatusValue("Parasite Cure", 1, 4);
				}
			}
		}
		
		public function triggerAlarm(wasAttack:Boolean):void
		{
			if (!wasAttack)
			{
				clearOutput();
				output("You leap across the room to the emergency panel and smack the alarm button with all your");
				if (kGAMECLASS.pc.PQ() <= 20) output(" feeble, nerdy");
				output(" might.");
			}
			else
			{
				output("\n\n");
			}
			
			output("\n\nA klaxxon starts blaring from overhead, a shrill alert against an imaginary flame. Jet-sprays appear from the walls and ceiling and start gushing geysers of nano-machines over the deck. The tentacle-creature before you shrieks and recoils, staggering back as shimmering gray mist pelts him. The other tendrils covering the room start writhing, then withdrawing. They uncurl from around the trapped Nova and Steele crewmen, who collapse limply to the ground as tentacle-cocks withdraw from their every hole.");

			if (!hasStatusEffect("Free Chief"))
			{
				output("\n\nEvery hole except the Chief’s. She wiggles urgently in the tentacles’ grasp as you run over to help pull them off her limbs. You slice away most of the reticent tentacles, causing Henderson to shudder violently with pain, but you get the Chief free... save for the one huge, thick tentacle lodged in her equine cunt.");

				output("\n\nIt’s lodged in tight, preventing the belly-bloated ‘taur from moving. You hop around behind her and grab the tentacle, hoping to yank it out of her. Instead, the tentacle pulsates, creampies the Chief with an explosion of pink juices that make her shriek, and then detatches from its host, breaking off and slithering out of your hands... and disappearing into Chief Neykkar’s belly. She grunts and gasps, flailing her arms at her belly as it bloats out even more. You can see her skin writhing under her chitin plates, squirming as the tentacle moves inside her. Oh, shit.");

				output("\n\n<i>“Fuck. Ah-ah no God fuck it’s ins-- fuck I’m cumming aahhh!”</i>");

				output("\n\nShe clenches, screaming and flopping bonelessly onto her side and spilling fuck-juices like a waterfall out of her horsecunt. Dammit.");
			}

			output("\n\nCommander Henderson follows suit moments later, flopping to the deck like a limp dick. All the energy goes out of him, and he’s soon completely still, just breathing heavily.");

			output("\n\n<i>“Holy shit!”</i> Chief Neykkar gasps,");
			if (!hasStatusEffect("Free Chief")) output(" struggling to her feet several long moments later");
			else output(" lowering her weapon");
			output(". <i>“You... you did it! What did you do?”</i>");
			
			setStatusValue("Parasite Cure", 1, 5);
			HPRaw = 0;
			
			if (!wasAttack)
			{
				CombatManager.processCombat();
			}
		}
		
		public function healTick():void
		{
			var healAmt:Number = HPMax() * 0.05;
			if (HP() + healAmt > HPMax()) healAmt = HPMax() - HP();
			HP(healAmt);
			energy(energyMax() * 0.15);
			
			output("The commander’s mutated form rapidly recovers from damage, knitting closed fresh wounds with newly-sprouted tentacles! (<b><span status='good'>+" + healAmt + "</span></b>)\n\n");
			
			if (hasStatusEffect("Bleeding"))
			{
				removeStatusEffect("Bleeding");
			}
		}
	}
}
