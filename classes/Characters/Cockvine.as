package classes.Characters
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	public class Cockvine extends Creature
	{
		//constructor
		public function Cockvine()
		{	
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "cockvine";
			this.originalRace = "cockvine";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 24 + rand(36);
			this.scaleColor = "green";
			this.long = "You are trapped by a cockvine. In the heavy darkness of its nest you can just about make out the rapacious plant creature’s limbs writhing busily over the rock and around you: dark green stems thick enough that you cannot get your hand fully around them, tipped with blunt, purple helmet-like heads, oozing white seed from their tips. They are attempting to draw you further downwards, towards the broad trunk of the thing, where it can secure you completely in its grasp. The harder you struggle the more vigorously they in turn seem to act, as if energized by your own movements. The tropical heat and smell of the creature is overwhelming - a heady, cloying herbal atmosphere which seems to permeate through your whole being, making you feel cloudy and limp.";
			this.customDodge = "The cockvine sways aside at the last second!";
			this.customBlock = "Your attack deflects off the cockvine’s " + this.scaleColor + " scales!";
			this.isPlural = false;
			
			isLustImmune = true;
			
			this.meleeWeapon.attackVerb = "lash";
			this.meleeWeapon.attackNoun = "tendrils";
			this.meleeWeapon.attack = 2;
			
			meleeWeapon.baseDamage.kinetic.damageValue = 4;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.longName = "tendrils";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "glittering scales";
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 12;
			this.reflexesRaw = 15;
			this.aimRaw = 3;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 75;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 50.0;
			baseHPResistances.burning.damageValue = -50.0;
			
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			
			this.femininity = 50;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 1;
			this.tone = 80;
			this.hairColor = "red";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_COCKVINE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_COCKVINE;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_COCKVINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_COCKVINE;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_TENDRIL];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_COCKVINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_SCALED, GLOBAL.FLAG_LONG, GLOBAL.FLAG_THICK, GLOBAL.FLAG_PREHENSILE];
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = GLOBAL.TYPE_COCKVINE;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 1;
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
			this.cumMultiplierRaw = 2;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 400;
			this.ballFullness = 200;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 1;
			this.minutesSinceCum = 9000;
			this.timesCum = 122;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			
			this.impregnationType = "CockvinePregnancy";
			this.fertilityRaw = 1.0;
			this.cumQualityRaw = 1.0;
			this.pregnancyMultiplierRaw = 1;
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			
			this.cocks = [];
			this.createCock();
			(this.cocks[0] as CockClass).cLengthRaw = 8;
			(this.cocks[0] as CockClass).cType = GLOBAL.TYPE_COCKVINE;
			
			isUniqueInFight = true;
			btnTargetText = "Cockvine";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "ADULTCOCKVINE";
		}
		
		public function adultCockvineCombatDescriptionExtension(target:Creature):void
		{
			if (!target.hasStatusEffect("Cockvine Grip")) return;

			switch (target.statusEffectv1("Cockvine Grip"))
			{
				case 0:
					output("You have fought yourself clear almost to the lip of the cockvine’s nest. The relative light of the cavern is tantalizingly close...\n\n")
					break;

				case 1:
					output("The cockvine has a firm grip on your [pc.legOrLegs], making escape impossible. You have the use of your arms, at least.\n\n");
					break;

				case 2:
					output("The cockvine has pulled you deep into the pit and wrapped itself tightly around your torso and [pc.chest], sliding its wet, ropy warmth across your [pc.skin] as it crawls inexorably up your body. The heavy smell of it is overwhelming, dazing – you feel your muscles relaxing despite your terror.\n\n");
					break;

				case 3:
					output("The cockvine has you bound securely, your arms pulled away from your hot plant - slathered body. The feeling of arousal, hopelessness and doziness is getting steadily stronger and it’s getting increasingly difficult to force yourself to struggle...\n\n");
					break;

				default:
					throw new Error("Unmatched Cockvine Description Extension: " + target.statusEffectv1("Cockvine Grip"));
					break;
			}
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			adultCockvineCombatDescriptionExtension(target);
			
			if (!target.hasStatusEffect("Cockvine Grip"))
			{
				target.createStatusEffect("Cockvine Grip", 1, 0, 0, 0, false, "Constrict", "You’re in the grip of a Cockvine!", true, 0);
			}
	
			// Struggling will set v2 to 1 - things read weirdly if you struggle -> cocvine constricts straight away
			if (target.statusEffectv1("Cockvine Grip") < 3 && target.statusEffectv2("Cockvine Grip") == 0) adultCockvineConstrictAttack(target);
			else
			{
				var attacks:Array = [];

				attacks.push(adultCockvineWhips);
				attacks.push(adultCockvineMouthFuxAttack);
				if (target.hasActiveCombatDrone()) attacks.push(adultCockvineMowThisAttack);
				
				attacks[rand(attacks.length)](target);
			}
	
			// Resolve various state changes that can happen and apply/remove/change appropriate status effects
			
			// Reset the struggle-indicator
			if (target.statusEffectv2("Cockvine Grip") == 1)
			{
				target.setStatusValue("Cockvine Grip", 2, 0);
			}
	
			// Trigger various effects based on grip-level
			if (target.statusEffectv1("Cockvine Grip") <= 0)
			{
				if (target.hasStatusEffect("Evasion Reduction")) target.removeStatusEffect("Evasion Reduction");
				if (target.hasStatusEffect("Grappled")) target.removeStatusEffect("Grappled");
			}
			else
			{
				if (target.statusEffectv1("Cockvine Grip") == 1)
				{
					if (!target.hasStatusEffect("Evasion Reduction")) target.createStatusEffect("Evasion Reduction", 10, 0, 0, 0, true, "", "", true, 0);
					else target.setStatusValue("Evasion Reduction", 1, 10);
				}

				if (target.statusEffectv1("Cockvine Grip") >= 2)
				{
					if (!target.hasStatusEffect("Evasion Reduction")) target.createStatusEffect("Evasion Reduction", 20, 0, 0, 0, true, "", "", true, 0);
					else target.setStatusValue("Evasion Reduction", 1, 20);

					target.energyRaw -= 5;
					target.lustRaw += 2 + rand(target.libido() / 15);
				}

				if (target.statusEffectv1("Cockvine Grip") == 3)
				{
					target.createStatusEffect("Grappled", 1000, 0, 0, 0, true, "", "", true, 0);
				}
			}
		}
		
		private function adultCockvineMowThisAttack(target:Creature):void
		{
			//Activates if attacked by drone. Disables drone for 3-5 turns if successful
			output("Incensed by");
			if(target.hasStatusEffect("Varmint Buddy")) output(" your varmint’s");
			else output(" your drone’s");
			output(" attack, one of the tentacles reacts by swinging at it hard.");

			if (rand(4) == 0)
			{
				if(target.hasStatusEffect("Varmint Buddy")) output(" Your loyal varmint");
				else output(" Your trusty drone");
				output(" darts nimbly out of the way.");
			}
			else
			{
				output(" With a nasty sounding crunch the cockvine connects, sending");
				if(target.hasStatusEffect("Varmint Buddy")) output(" your loyal companion");
				else output(" the light robot");
				output(" flying out of the crevice.");
				target.createStatusEffect("Combat Drone Disabled", rand(5) + 1, 0, 0, 0, true, "", "", true, 0);
			}
		}
		
		private function adultCockvineMouthFuxAttack(target:Creature):void
		{
			//Lust rise if success
			output("One of the tentacles reaches for your face, implacably stretching towards the wet orifice it can sense there.");

			if (target.hasAirtightSuit())
			{
				output(" Luckily, your airtight [pc.armor] protects you from the oral invasion!");
			}
			else if (combatMiss(this, target))
			{
				output(" You grit your teeth and manage to bat it away.");
			}
			else
			{
				output("\n\nYou struggle the best you can, but you cannot stop it pushing its dense, bulbous head into your mouth, invading it with its humid, verdant smell. Your cries of disgust turn into a muffled gargle when it tenses up and ejaculates a thick load of its white semen down your throat. Finding extra reserves of energy in response to this foul development you rip your head away, but the taste of it – heavy, sweet citrus, inescapably sexual – stays with you.");
				output("\n\nYou groan woozily as heat rises to your skin and your heart beats faster with each passing second, seeming to pulse in time with the movement of the vines, plant pheromones flowing into your bloodstream.");
				target.loadInMouth(this);
				target.changeLust(3 + rand(5));
			}
		}
		
		private function adultCockvineWhips(target:Creature):void
		{
			output("The movement of your own body translates into the surrounding vines where it seems to gather, the tentacles bunching and swaying back and forth until frenetic energy seizes them up, and they are whipping their bulbous heads into you with ropy, numbing force.");

			createPerk("Multiple Attacks", 2 + rand(2), 0, 0, 0, "");
			CombatAttacks.MeleeAttack(this, target);
			removePerk("Multiple Attacks");
		}
		
		private function adultCockvineConstrictAttack(target:Creature):void
		{
			output("The cockvine coils its grasp around you from every angle, trying to bind you closer in its warm, wet clinch.");

			if (rand(Math.max(target.RQ(), target.PQ())) <= 65)
			{
				output("\n\nYou grapple with it as best you can but whenever you fight off one tentacle another seizes the opportunity to grasp you tightly. You cannot prevent the thoughtless power of it drawing you further into the darkness.");

				target.addStatusValue("Cockvine Grip", 1, 1);
				
				var damage:TypeCollection = new TypeCollection( { kinetic: 15 * (0.5 + (target.statusEffectv1("Cockvine Grip") / 2)) }, DamageFlag.CRUSHING);
				damageRand(damage, 15);
				
				switch (target.statusEffectv1("Cockvine Grip"))
				{
					case 1:
						output("\n\nYou bark in frustration as once again it takes a firm grip of your [pc.legOrLegs] and drags you away from the light.");
						break;

					case 2:
						output("\n\nVines slide around your belly and [pc.chest], cosseting you in tight, wet heat as you futilely try to peel them off you. They seem to be sweating an oily substance which makes them difficult to hold onto. The heavy, green air fogging your lungs makes it very difficult to stay focused and struggling against it; it feels like the energy and will to fight is being kneaded out of you, leaving behind a pleasant emptiness.");
						break;

					case 3:
						output("\n\nFeebly you try to swat away the tentacles blindly reaching for your hands, but you’re swaddled in cockvine at this point and you cannot stop it seizing first one wrist then the other, effectively pinioning you. Your breath comes heavy, drawing in more and more of the relaxing pheromone the plant is exuding. You’ve got to fight free whilst you still have the will and energy to do so!");
						break;

					default:
						throw new Error("Unmatched Cockvine Grip Value in ConstrictAttack: " + target.statusEffectv1("Cockvine Grip"));
						break;

				}
				
				applyDamage(damage, this, target);
			}
			else
			{
				output("\n\nYou struggle and fight the thing like a trapped wolverine, writhing this way and that to stop it getting a better grip on your limbs, beating back the tentacles so that you have a window of opportunity for your next move.");
			}
		}
	}
}
