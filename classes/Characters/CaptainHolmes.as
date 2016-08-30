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
	import classes.StringUtil;
	
	
	public class CaptainHolmes extends Creature
	{
		//constructor
		public function CaptainHolmes()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Captain Holmes";
			originalRace = "human";
			a = "";
			capitalA = "";
			this.long = "[Placeholder]";
			this.customBlock = "[Placeholder]";
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
			meleeWeapon.attack = 3;
			
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
			armor.evasion = -2;
			armor.hasRandomProperties = true;
			
			this.physiqueRaw = 35;
			this.reflexesRaw = 30;
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
			
			btnTargetText = "Holmes";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "HOLMES";
		}
		
		override public function CombatAI(allied:Array, hostiles:Array):void 
		{
			if (CombatManager.getRoundCount() == 2)
			{
				runaway();
			}
			
			if (HP() < HPMax() && energy() > 5)
			{
				healTick();
			}
			
			for (var i:int = 0; i < hostiles.length; i++)
			{
				if (hostiles[i] is PlayerCharacter && hostiles[i].hasStatusEffect("Grappled"))
				{
					handleGrapple(hostiles[i]);
					return;
				}
			}
			
			var target:Creature = selectTarget(hostiles);
			if (target == null) return;
			
			var atks:Array = [];
			
			atks.push( { v: tentacleWhip, w: 40 } );
			atks.push( { v: cumSpray, w: 30 } );
			if (target is PlayerCharacter && !hasStatusEffect("Grapple Cooldown")) atks.push( { v: entangle, w: 15 } );
			atks.push( { v: cumFacial, w: 10 } );
			
			weightedRand(atks)(target, hostiles);
		}
		
		public function tentacleWhip(target:Creature, hostiles:Array):void
		{
			var struct:Object = GetCharacterStructure(hostiles, { pc: PlayerCharacter, neykkar: ChiefNeykkar } );
			
			var bHitPC:Boolean = combatMiss(this, struct.pc);
			var bHitNeykkar:Boolean = combatMiss(this, struct.neykkar);
			
			output("Captain Holmes whips one of his back-tentacles back and swings it in a sweeping arc.");
			if (bHitPC || bHitNeykkar)
			{
				var baseDamage:TypeCollection = meleeDamage();
				
				output(" The tendril slams into");
				if (bHitPC)
				{
					output(" you");
					applyDamage(damageRand(baseDamage, 15), this, struct.pc, "minimal");
				}
				if (bHitPC && bHitNeykkar) output(" and");
				if (bHitNeykkar)
				{
					output(" Chief Neykkar with crushing force");
					applyDamage(damageRand(baseDamage, 15), this, struct.neykkar, "minimal");
				}
				output("!");
			}
			else
			{
				output(" You and the Chief both dodge the tentacle strike -- if only just!");
			}
		}
		
		public function cumSpray(target:Creature, hostiles:Array):void
		{
			output("The captain stumbles back, rearing his tentacle-laden head back and convulsing violently. You blink in surprise as his head snaps forward, and every tentacle he's got goes completely rigid, pointed right at [target.combatName] with all of their tapered tips. They swell, and then erupt in a geyser of pink-hued liquid, spraying it all over [target.combatHimHer].");
			if (combatMiss(this, target))
			{
				output(" [target.CombatHeShe] shake" + (target is PlayerCharacter ? "" : "s") +" it off, drooling pink spunk everywhere.");
			}
			else
			{
				output(" Heat burns through [target.combatName], [target.combatHisHer] body reacting to the intense musk of the mutant jizz. The smell is incredible, intoxicating... alluring...");
				
				applyDamage(damageRand(new TypeCollection( { drug: 15 } ), 15), this, target, "minimal");
			}
		}
		
		public function cumFacial(target:Creature, hostiles:Array):void
		{
			output("One of holmes tentacles snaps forward, flinging a huge gout of pink cum at [target.combatName] " + (target is PlayerCharacter ? "" : "’s") + " face! The mutant spunk splatters on [target.combatHimHer] face, tainting the air with its musk.");
			if (!rangedCombatMiss(this, target))
			{
				output(" Worse, it lands right in [target.combatHisHer] eyes.");
				
				if (!target.hasBlindImmunity())
				{
					output("<b>" + (target is PlayerCharacter ? "You" : "The Chief is") + " blinded!</b>");
					target.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0, 0xFF0000);
				}
				
				applyDamage(damageRand(new TypeCollection( { drug: 15 } ), 15), this, target, "minimal");
			}
		}
		
		public function entangle(target:Creature, hostiles:Array):void
		{
			createStatusEffect("Grapple Cooldown", 4);
			
			output("Holmes lunges at you, flailing his crotch-tentacles at your [pc.legs]!");
			if (!combatMiss(this, target))
			{
				output(" You don't react in time to dodge, and quickly find your lower body wrapped in throbbing, leaking tentacle cocks. More tentacles swing around grab your arms, thrusting towards your mouth");
				if (target.biggestTitSize() >= 2) output(" and tits");
				output(". <b>You're grappled</b>!");
				
				applyDamage(damageRand(new TypeCollection( { kinetic: 4, drug: target.hasAirtightSuit() ? 0 : 4 } ), 15), this, target, "minimal");
				
				target.createStatusEffect("Grappled", 0, 50, 0, 0, false, "Constrict", "You're pinned in a grapple.", true, 0);
			}
			else
			{
				output(" You dodge out of the way of them at the last possible moment!");
			}
		}
		
		public function handleGrapple(target:Creature):void
		{
			if (target.statusEffectv1("Grappled") != 3)
			{
				output("Holmes’ tentacles wrap tightly around your limbs, squeezing the life out of you!");
				applyDamage(damageRand(new TypeCollection( { kinetic: 4, drug: target.hasAirtightSuit() ? 0 : 4 } ), 15), this, target, "minimal");
			}
			else
			{
				output("The deranged mutant roars, hefting you up with his half dozen tentacles. You scream, flailing about as you're hauled off your [pc.feet] by inhuman strength. Holmes lets out a bellow that rocks the bridge, and you're sent flying across the room. You slam head-first into one of the bulkheads, and your vision explodes in shooting stars! <b>The force of the blow leaves you stunned!</b>");

				applyDamage(damageRand(new TypeCollection( { kinetic: 25 }, DamageFlag.CRUSHING), 15), this, target, "minimal");
				target.createStatusEffect("Stunned", 2, 0, 0, 0, false, "Stun", "Cannot act for a turn.", true, 0, 0xFF0000);
				target.removeStatusEffect("Grappled");
			}
		}
		
		public function healTick():void
		{
			energy( -5);
			var healAmt:Number = HPMax() * 0.05;
			if (HP() + healAmt > HPMax()) healAmt = HPMax() - HP();
			HP(healAmt);
			
			output("The captains mutated form rapidly recovers from damage, knitting closed fresh wounds with newly-sprouted tentacles! (<b><span status='good'>+" + healAmt + "</span></b>)\n\n");
			
			if (hasStatusEffect("Bleeding"))
			{
				removeStatusEffect("Bleeding");
			}
		}
		
		public function runaway():void
		{
			output("A panicked scream tears through the bridge, even over the sounds of battle. The woman Captain Holmes had been accosting pushes past you, bolting as fast as she can towards the doors. Shit -- there goes your best chance to figure out what's going on here. All you manage to catch before she escapes is a look at her: a short, skinny woman in a torn-up lab coat and scrubs. A doctor, maybe?");

			output("\n\nYou'll have to find her after this!\n\n");
		}
	}
}
