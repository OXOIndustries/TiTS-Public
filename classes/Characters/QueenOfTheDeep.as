package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.VaginaClass;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Interfaces.*;
	
	public class QueenOfTheDeep extends Creature
	{
		//constructor
		public function QueenOfTheDeep()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			short = "queen of the deep";
			originalRace = "water queen";
			a = "the ";
			capitalA = "The ";
			long = "The creature before you is a monstrous amalgam of bestial features: stalk-like legs with too many joints, writhing masses of envenomed tentacles, and a pair of huge claws all grow from a dark red body covered in carapace as thick as a tank's armor. Rising from atop the fifteen-foot-high body comes a woman's torso, with creamy cyan and white skin covered in patches of bioluminescent algae that strobe to the beat of their owner's heart. The mossy substance is arranged across her almost like clothing, though the moss leaves her pair of pendulous breasts bare, exposing eight nipples, each drooling with amber moisture. A long braid of tentacle-hair falls down the upper half's back, glowing softly in shades of blue and green.";
			customDodge = "The creature's many tentacles dance and weave around, making it difficult to focus your attack toward her properly!";
			customBlock = "The alien's chitin deflects the attack.";
			isPlural = false;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.resistanceValue = 45.0;
			baseHPResistances.burning.resistanceValue = 45.0;
			baseHPResistances.corrosive.resistanceValue = 45.0;
			baseHPResistances.electric.resistanceValue = 45.0;
			baseHPResistances.freezing.resistanceValue = 45.0;
			
			baseHPResistances.drug.resistanceValue = 25.0;
			baseHPResistances.tease.resistanceValue = 45.0;
			baseHPResistances.pheromone.resistanceValue = 25.0;
			baseHPResistances.psionic.resistanceValue = 25.0;
			
			meleeWeapon = new Fists();
			
			armor.longName = "chitinous plating";
			armor.defense = 8;
			armor.hasRandomProperties = true;
			
			physiqueRaw = 45;
			reflexesRaw = 35;
			aimRaw = 30;
			intelligenceRaw = 15;
			willpowerRaw = 40;
			libidoRaw = 50;
			shieldsRaw = 0;
			energyRaw = 100;
			lustRaw = 10;
			
			level = 8;
			XPRaw = bossXP();
			credits = 0;
			HPMod = 110;
			HPRaw = HPMax();
			
			femininity = 100;
			eyeType = GLOBAL.TYPE_MYR;
			eyeColor = "black";
			tallness = 180;
			thickness = 30;
			tone = 90;
			hairColor = "iridescent";
			scaleColor = "dark red";
			furColor = "blue";
			hairLength = 24;
			hairType = GLOBAL.HAIR_TYPE_TENTACLES;
			beardLength = 0;
			beardStyle = 0;
			skinType = GLOBAL.SKIN_TYPE_CHITIN;
			skinTone = "cyan";
			skinFlags = [GLOBAL.FLAG_SMOOTH, GLOBAL.FLAG_LUBRICATED, GLOBAL.FLAG_APHRODISIAC_LACED];
			faceType = GLOBAL.TYPE_WATERQUEEN;
			faceFlags = [GLOBAL.FLAG_SMOOTH];
			tongueType = GLOBAL.TYPE_WATERQUEEN;
			lipMod = 2;
			earType = 0;
			antennae = 2;
			antennaeType = 0;
			horns = 0;
			hornType = 0;
			armType = GLOBAL.TYPE_WATERQUEEN;
			gills = false;
			wingType = 0;
			legType = GLOBAL.TYPE_WATERQUEEN;
			legCount = 10;
			legFlags = [GLOBAL.FLAG_CHITINOUS, GLOBAL.FLAG_SMOOTH];
			
			genitalSpot = 0;
			tailType = 0;
			tailCount = 0;
			tailFlags = new Array();
			tailGenitalArg = 0;
			tailGenital = 0;
			tailVenom = 0;
			tailRecharge = 0;
			
			hipRatingRaw = 15;
			buttRatingRaw = 16;
			
			cocks = new Array();
			createCock();
			cocks[0].cLengthRaw = 12;
			cocks[0].cThicknessRatioRaw = 1.5;
			cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);
			cocks[0].addFlag(GLOBAL.FLAG_LUBRICATED);
			cocks[0].addFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
			
			vaginas = new Array();
			var tarVag:VaginaClass = new VaginaClass();
			tarVag.hymen = false;
			tarVag.wetnessRaw = 4;
			tarVag.loosenessRaw = 5;
			tarVag.bonusCapacity = 500;
			tarVag.addFlag(GLOBAL.FLAG_LUBRICATED);
			vaginas.push(tarVag);			
			
			balls = 2;
			cumMultiplierRaw = 10;
			cumQualityRaw = 1;
			cumType = GLOBAL.FLUID_TYPE_CUM;
			ballSizeRaw = 8;
			ballFullness = 100;
			ballEfficiency = 200;
			refractoryRate = 20;
			minutesSinceCum = 2110;
			timesCum = 1722;
			
			elasticity = 1;
			fertilityRaw = 1.05;
			clitLength = .5;
			pregnancyMultiplierRaw = 1;
			
			breastRows[0].breastRatingRaw = 45;
			nippleColor = "navy blue";
			nipplesPerBreast = 4;
			nippleLengthRatio = 2;
			nippleWidthRatio = 2;
			milkMultiplier = 100;
			milkFullness = 200;
			milkType = GLOBAL.FLUID_TYPE_NECTAR;
			milkRate = 0;
			
			ass.wetnessRaw = 0;
			ass.bonusCapacity += 500
			ass.loosenessRaw = 5;
			
			impregnationType = "DeepQueenPregnancy";
			createStatusEffect("Force Fem Gender");
			createStatusEffect("Disarm Immune");
			
			isUniqueInFight = true;
			btnTargetText = "Queen";
			
			sexualPreferences.setRandomPrefs(4 + rand(3), 2);
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "QUEENOFTHEDEEP";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void 
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (hasStatusEffect("Water Veil"))
			{
				addStatusValue("Water Veil", 1, -1);
				if (statusEffectv1("Water Veil") <= 0)
				{
					removeStatusEffect("Water Veil");
					output("The creature's claws stop thrashing in the water, finally letting it settle. <b>The veil of mist is gone now!</b>\n\n");
				}
				else
				{
					output("The creature's claws are thrashing against the surface of the water, kicking up a heavy veil of mist!\n\n");
				}
			}
			
			if (target.hasStatusEffect("Grappled"))
			{
				queenOfTheDeepGrappledFollowup(target);
				return;
			}

			if (!hasStatusEffect("Climaxed") && lust() >= 80)
			{
				queenOfTheDeepClimax();
				return;
			}

			if (!target.hasStatusEffect("Watered Down"))
			{
				queenOfTheDeepGETOFF(target);
				return;
			}

			// Human attack
			var humanAttacks:Array = [];
			
			humanAttacks.push({ v: queenOfTheDeepBowShot, w: 5 });
			
			if (!hasStatusEffect("Tittysuckle Cooldown") && HP() < HPMax())
			{
				humanAttacks.push({ v: queenOfTheDeepTittySuckle, w: 1 });
			}
			
			if (lust() >= 0.4 * lustMax())
			{
				humanAttacks.push( { v: queenOfTheDeepCloacaTease, w: 2 } );
			}
			
			if (lust() >= 0.7 * lustMax())
			{
				humanAttacks.push( { v: queenOfTheDeepTentacleSelfRape, w: 2 } );
			}
			
			weightedRand(humanAttacks)(target);

			if (!hasStatusEffect("Water Veil"))
			{
				output("\n\n");
			}
			
			// Crab attack
			var crabAttacks:Array = [];

			if (!hasStatusEffect("Water Veil"))
			{
				if (!hasStatusEffect("Clawgrab Cooldown"))
				{
					crabAttacks.push( { v: queenOfTheDeepClawChomp, 		w: 15 } );
				}
				crabAttacks.push( { v: queenOfTheDeepWaterVeil, 			w: 15 } );
				crabAttacks.push( { v: queenOfTheDeepLegStomp,  			w: 30 } );
				crabAttacks.push( { v: queenOfTheDeepTentacleBarrage, 		w: 30 } );
				
				weightedRand(crabAttacks)(target);
			}
		}
		
		private function queenOfTheDeepCloacaTease(target:Creature):void
		{
			output("\n<i>“Why must you fight, child? All I want is for you to worship my body, to let me seed yours with my young...”</i> the creature hisses, raising up to her full height so that her arms can caress the lowest-hanging outcroppings of rock hanging down from the cavern ceiling, spidery legs stretching out across the cavern walls. One hand braces against the ceiling, but the other disappears, sliding down behind her back to the ample ass resting atop her bestial lower body. She lets out a soft, whimpering moan, and you can see her hand thrusting deep into a hole of some kind, as if inviting you to climb up and fuck it.");
			
			var hits:Boolean = false;
			
			if (target.hasCock())
			{
				if (rand(10) <= 7) hits = true; 
			}
			else
			{
				if (rand(10) <= 4) hits = true;
			}
			
			if (hits)
			{
				output(" An offer you find so very hard to resist...\n");
				
				applyDamage(new TypeCollection( { tease: 7 } ), this, target, "minimal");
			}
			else
			{
				output(" Averting your gaze from the creature, you save yourself from her attempts to subvert you into lustfueled submission.");
			}
		}
		
		private function queenOfTheDeepTentacleSelfRape(target:Creature):void
		{
			output("\nThe creature’s womanly half coos and moans seductively, wrapping herself in her writhing mass of tentacles. They go everywhere, like a thousand ravenous serpents: they squeeze and caress her breasts, making the eight nipples she’s sporting squirt geysers of amber milk across the water’s surface. Others penetrate her mouth, filling it like a wriggling cock and spraying her mouth with liquid venom, or squirm down between the cheeks of her ass and fill the hole hidden there with a half dozen shafts.");
			
			output("\n\n<i>“Perhaps when I’ve taught you your place, I’ll let you enjoy my body like this,”</i> the creature hisses, running her tongue along a tentacle’s underside. <i>“You’ll spend days mired in my tendrils, violated nonstop until you cannot bear to think any longer...”</i>");
			
			var hits:Boolean = false;
			
			if (target.hasVagina())
			{
				if (rand(10) <= 7) hits = true;
			}
			else
			{
				if (rand(10) <= 4) hits = true;
			}
			
			if (hits)
			{	
				output(" The idea is more tempting than you’d like to admit...");
				
				applyDamage(new TypeCollection( { tease: 10 } ), this, target, "minimal");
			}
			else
			{
				output(" Seeing it for what it is, you mentally rebuke the creatures attempts to influence you!");
			}
		}
		
		private function queenOfTheDeepClimax():void
		{
			output("\n<i>“Mmm, why are you resisting me?”</i> the woman moans, groping at her breasts. Her tentacles coil around her, pumping into holes and groping at sensitive flesh. <i>“You seem as eager to enjoy my flesh as I am yours... why not just put your weapons down and submit? Lie with me, accept me as your queen of pleasure...”</i>");
			
			output("\n\nEven as she speaks, though, tentacles pound the woman’s body, assailing the hole hidden between her torso and lower body, fucking her breasts, caressing the gaping hole at the end of her abdomen. She moans whorishly, arching her back and fucking herself until the caverns reverberate with her sexual ecstasy.");
			
			output("\n\n<i>“Come... join me...”</i> she croons, sounding like she’s on the edge of climax. <i>“Surrender to your lusts with me...”</i>");
			
			output("\n\nShe doesn’t wait for you to answer, but instead screams with pleasure. Her body quakes, staggering forward as orgasm rocks her. Her legs buckle, sending her slumping to the ground with a low, lewd moan. <b>The monster seems stunned</b>, momentarily unable to act as she recovers from her body-shaking orgasm!\n");

			lustRaw = 0;
			createStatusEffect("Climaxed", 0, 0, 0, 0, true);
			createStatusEffect("Stunned", 1, 0, 0, 0, false,"Stun","Cannot take action!",true,0,0xFF0000);
		}
		
		private function queenOfTheDeepTittySuckle(target:Creature):void
		{
			output("The monstrous woman smirks down at you and cups one of her huge breasts, hefting it up to her mouth and running her long probe-like tongue along its smooth curves. <i>“Come now, wouldn’t you rather experience the pleasure I have to offer?”</i>");
			
			output("\n\nAs she speaks, the monster’s tentacles coil around her body, slathering her pale blue flesh with liquid venom. They form a facsimile of a corset around her taut belly, emphasizing her heavy breasts even more. Never taking her eyes off you, the creature wraps her dark lips around the four nipples on the tit she’s fondling. She starts to suck, slurping up the amber sap from within.");
			
			output("\n\nThe more she drinks for herself, the more her cheeks flush darkly... and the faster her lower body seems to move. <b>The creature’s healing itself</b>");
			
			applyDamage(new TypeCollection( { tease: 5 } ), this, target, "minimal");
			
			HP(20);
			createStatusEffect("Tittysuckle Cooldown", 5);
		}
		
		private function queenOfTheDeepBowShot(target:Creature):void
		{
			output("The woman-half of the lake monster pulls a crystal-tipped arrow from the quiver on her waist and draws it back, taking only a moment to aim before letting fly at you!");
			
			if (rangedCombatMiss(this, target))
			{
				output(" Lucky you, the shot goes wide and shatters against the cavern wall.");
			}
			else
			{
				output(" The arrow slams into you, shattering like glass and covering you with scratches... which immediately fill with a dark, thick liquid that makes your skin burn not with pain but a red, lusty heat...");
				
				applyDamage(new TypeCollection( { drug: 7, kinetic: 3 } ), this, target, "minimal");
			}
		}
		
		private function queenOfTheDeepGETOFF(target:Creature):void
		{
			output("The lake monster shrieks at you, <i>“Get off! Get off me, worm!”</i> Her many tentacles slap at you,");

			var numHits:int = 0;
			for (var i:int = 0; i < 3; i++)
			{
				if (!combatMiss(this, target)) numHits++;
			}
			
			if (numHits == 0) output(" though you're able to duck their attacks, especially now that you're out of the water");
			else
			{
				var hitText:Array = ["nonce", "once", "twice", "thrice"]; // nonce, lol
				
				output(" hitting you " + hitText[numHits] + " and slathering you in her aphrodisiac venom");
			}
			output(". Worse, one of her gigantic claws reaches back over her shoulder, trying to pincer you off her back!");
			
			var clawHit:Boolean = !combatMiss(this, target, -1, 2)
			
			if (!clawHit) output(" You're able to dodge -- for now!");
			else
			{
				output(" The mammoth jaws of her claw grab hold of you, hauling you off its owner's back with frightening strength.");

				output("\n\n<i>“I said OFF!”</i> the woman bellows, hurling you like a rag doll across the cavern and into the depths of the lake. <b>There goes your advantage!</b>");
				
				target.createStatusEffect("Watered Down", 0, 0, 0, 0, false, "Icon_Slow", "You're submerged in water, and your movements are dramatically slowed because of it. While you're fighting in the lake, your Reflex is reduced!", true, 0);
			}
			
			if (numHits > 0 || clawHit)
			{
				var damage:TypeCollection = new TypeCollection();
				if (numHits > 0) damage.drug.damageValue = 3 * numHits;
				if (clawHit)
				{
					damage.kinetic.damageValue = 10;
					damage.addFlag(DamageFlag.CRUSHING);
				}
				
				applyDamage(damageRand(damage, 40), this, target, "minimal");
			}
		}
		
		private function queenOfTheDeepTentacleBarrage(target:Creature):void
		{
			var numHits:int = 0;
			for (var i:int = 0; i < 5; i++)
			{
				if (!combatMiss(this, target)) numHits++;
			}
			
			output("The towering beast slips down onto its knees, almost toppling over onto its side as it exposes its back to you. At first, you think she’s tiring, finally showing a weak point. Instead, as you close the distance, you’re suddenly accosted by her mass of writhing tentacles. The venom-tipped appendages slap and jab at you, trying to cover you with their chemical payload!");
			
			if (target.hasAirtightSuit())
			{
				output(" The tentacles wetly slick across your [pc.armor], slathering you with copious amounts of liquid venom. Your watertight outfit prevents the stuff from affecting you, but you are sure that will be the least of your problems.");
			}
			else
			{
				if (numHits == 0) output(" You evade the barrage of tentacles!");
				else if (numHits == 1) output(" One of the tentacles manages"); 
				else if (numHits < 5) output(" Some of the tentacles manage");
				else output(" The tentacles manage");
				output(" to get through your defenses, slathering you with a liquid venom that quickly has your [pc.skinFurScales] burning with arousal!");
				
				if (numHits > 0)
				{
					var baseDamage:TypeCollection = new TypeCollection( { drug: 2 } );
					if (numHits > 1) baseDamage.multiply(numHits);
					applyDamage(baseDamage, this, target, "minimal");
				}
			}
		}
		
		private function queenOfTheDeepLegStomp(target:Creature):void
		{
			output("The lake monster rears up one of her huge, slender legs and jabs it at you like a titanic spear.");

			if (combatMiss(this, target))
			{
				output(" You manage to duck under the thrust, avoiding the blow and putting some distance between you and the monster.");
			}
			else
			{
				output(" The pointed tip of the leg slams into your chest, sending you hurtling back. You could have sworn you just heard your ribs creaking... oh, you’re going to be sore in the morning.");
				
				applyDamage(damageRand(new TypeCollection( { kinetic: 25 }, DamageFlag.PENETRATING ), 20), this, target, "minimal");

				output("\n\nAssuming you make it out of here alive.");
			}

			output("\n\n<i>“It is not too late to beg for mercy,”</i> the creature coos, bracing her leg against the side of the cavern. <i>“You may yet walk away with your body intact. All you need do is get on your knees and worship me...”</i>");
		}
		
		private function queenOfTheDeepWaterVeil(target:Creature):void
		{
			output("<i>“You cannot fight what you cannot see,”</i> the creature hisses gleefully, slamming her lower claws into the water before you with earthshaking force and kicking up a spray of water that seems to have no end. Worse, she keeps swiping her claws through the water, creating a thick mist between the two of you. <b>It’s much harder to see the creature now!</b>");

			createStatusEffect("Water Veil", 2 + rand(3), 25, 0, 0, false, "Icon_DefUp", "The Queen of the Deep is thrashing in the water, making it difficult to properly see!", true, 0);
		}
		
		private function queenOfTheDeepClawChomp(target:Creature):void
		{
			output("One of the creature’s claws lunges forward, opening like a carapace-clad ‘V’ to grab you.");
			// miss
			if (combatMiss(this, target))
			{
				output(" You stumble out of the way, avoiding the crushing weight of the creature's pincers snapping closed inches in front of your nose with bone-crushing finality.");
			}
			else
			{
				output(" You try to leap out of the way, but are too slow to avoid the monstrous crab-drider's embrace. Mammoth claws close around your waist, hauling you up and out of the water, leaving you thrashing and screaming as the claws squeeze you. <b>You're grappled -- and getting crushed by a monster's claws to boot!</b>");
				
				applyDamage(damageRand(new TypeCollection( { kinetic: 20 }, DamageFlag.CRUSHING ), 15), this, target, "minimal");
				
				target.createStatusEffect("Grappled", 0, 50, 0, 0, false, "Constrict", "You're pinned in a grapple.", true, 0);
			}
			
			createStatusEffect("Clawgrab Cooldown", 5);
		}
		
		private function queenOfTheDeepGrappledFollowup(target:Creature):void
		{
			output("The lake monster continues to crush you in her claws, squeezing just enough to hurt, but not enough to rip you in half -- as she surely could.");
			
			applyDamage(damageRand(new TypeCollection( { kinetic: 10 }, DamageFlag.CRUSHING ), 10), this, target, "minimal");
		}
		
		override public function getCombatDescriptionExtension():void
		{
			if (lust() >= 50) output("\n\nYou can see her breath quickening, her massive chest heaving with nipples as hard as diamonds. She looks almost ready to cum just from your confrontation...");
		}
	}
}
