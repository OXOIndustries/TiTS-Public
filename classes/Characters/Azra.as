package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.StorageClass;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Guns.HammerCarbine;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.Items.Accessories.FlashGoggles;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Fenoxo, based on a modified Kiro.as by Gedan
	 */
	public class Azra extends Creature
	{
		public function Azra() 
		{
			this._latestVersion = 2;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Azra";
			this.originalRace = "suula";
			this.a = "";
			this.capitalA = "";
			this.long = "Azra stands by your side, garbed in a suit of heavy armor that makes the otherwise unarmed siren seem even more imposing than her nine foot stature alone. Still, she moves with grace and purpose, and her armored fists could pack quite a wallop.";
			this.customDodge = "Azra avoids the attack.";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "expensive armor";
			this.armor.defense = 8;
			this.armor.hasRandomProperties = true;
			this.shield = new JoyCoPremiumShield();
			
			this.level = 2;
			this.physiqueRaw = 8;
			this.reflexesRaw = 4;
			this.aimRaw = 6;
			this.intelligenceRaw = 8;
			this.willpowerRaw = 9;
			this.libidoRaw = 45;
			this.HPMod = 25;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			this.XPRaw = normalXP();
			
			this.credits = 5000;
			
			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "orange";
			this.tallness = 9*12;
			this.thickness = 50;
			this.tone = 25;
			this.hairColor = "orange";
			this.scaleColor = "gold";
			this.furColor = "gold";
			this.hairLength = 15;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "gold";
			this.skinFlags = [];
			this.faceType = GLOBAL.TYPE_SUULA;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED];
			this.tongueType = 0;
			this.tongueFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_SUULA;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_SUULA;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_SUULA;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SUULA;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG];
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
			this.hipRatingRaw = 15;
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
			this.buttRatingRaw = 10;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1.2;
			this.cocks[0].cLengthRaw = 20.4;
			this.cocks[0].cType = GLOBAL.TYPE_SUULA;
			this.cocks[0].cockFlags = [GLOBAL.FLAG_APHRODISIAC_LACED, GLOBAL.FLAG_STINGER_BASED, GLOBAL.FLAG_STINGER_TIPPED]
			
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_SUULA;
			this.vaginas[0].hymen = false;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].vaginaColor = "black";
			this.vaginas[0].bonusCapacity = 700;
			this.vaginas[0].vagooFlags = [GLOBAL.FLAG_STINGER_BASED];
			

			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 10;
			this.ballFullness = 100;
			
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 200;
			this.minutesSinceCum = 2000;
			this.timesCum = 2155;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 0.5;
			this.clitLength = .25;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 15;
			this.nippleColor = "gold";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 500;
			createPerk("Fixed CumQ",2500,0,0,0);
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.vaginas[0].bonusCapacity = 700;
			dataObject.ass.bonusCapacity = 500;
		}

		/* DESC UPDATE ON COMBAT STUFF: Azra stands by your side, garbed in a suit of heavy armor that makes the otherwise unarmed siren seem even more imposing than her nine foot stature alone. Still, she moves with grace and purpose, and her armored fists could pack quite a wallop.{ She’d be far more imposing if it wasn’t for the fact that her 20" dick and soft-ball sized balls are swinging in the open, doing their best to dribble pre everywhere she goes.}*/
		public function azraCombatCleanup():void
		{
			this.removeStatusEffect("cock out");
			this.long = "Azra stands by your side, garbed in a suit of heavy armor that makes the otherwise unarmed siren seem even more imposing than her nine foot stature alone. Still, she moves with grace and purpose, and her armored fists could pack quite a wallop.";
		}
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			if(this.hasStatusEffect("cock out")) this.long = "Azra stands by your side, garbed in a suit of heavy armor that makes the otherwise unarmed siren seem even more imposing than her nine foot stature alone. Still, she moves with grace and purpose, and her armored fists could pack quite a wallop. She’d be far more imposing if it wasn’t for the fact that her 20\" dick and soft-ball sized balls are swinging in the open, doing their best to dribble pre everywhere she goes.";
			else this.long = "Azra stands by your side, garbed in a suit of heavy armor that makes the otherwise unarmed siren seem even more imposing than her nine foot stature alone. Still, she moves with grace and purpose, and her armored fists could pack quite a wallop.";
			

			var target:Creature;
					
			// More complex target selection to leverage some of Annos abilities
			for (var i:int = 0; i < hostileCreatures.length; i++)
			{
				// skip deadies
				if ((hostileCreatures[i] as Creature).isDefeated()) continue;
				
				if (hostileCreatures[i].hasStatusEffect("Stunned") || hostileCreatures[i].hasStatusEffect("Blinded"))
				{
					target = hostileCreatures[i] as Creature;
				}
				break;
			}
			
			if (target == null) target = selectTarget(hostileCreatures);
			
			var attacks:Array = [];

			// Normally I'd just try and grab this through kGAMECLASS, but I'm doing
			// this as a tester to ensure everything is getting where it needs
			if(target.tallness <= 6*12) attacks.push(azraAxeKick);
			else attacks.push(azraUppercut);
			attacks.push(consecutiveNormalPunches);
			attacks.push(azraNormalPunch);
			if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.INDOOR) && this.level >= 4) attacks.push(collapsingStar);
			if(this.level >= 3) attacks.push(wingkick);
			if(!target.hasStatusEffect("Blind") && !target.hasStatusEffect("Blinded")) attacks.push(dustStormAzra);
			if(!target.hasStatusEffect("Staggered")) attacks.push(tailWhipAttack);
			if(this.lust() >= 60)
			{
				if(!this.hasStatusEffect("cock out"))
				{
					sharkLustAttack(target);
					return;
				}
				attacks = [];
				attacks.push(cockGrapple);
				attacks.push(azraCunnyTeasers);
				attacks.push(azraTurnWaster);
				attacks.push(azraAphroAttack);
			}
			attacks[rand(attacks.length)](target);
		}

		//Axe-kick (used vs foes 6' or below)
		public function azraAxeKick(target:Creature):void
		{
			//+10 kinetic damage + stun chance!
			if(combatMiss(this, target)) output("<i>“Hiya!”</i> Azra cries, trying for an axe-kick but ultimately missing.");
			else
			{
				output("<i>“Hiya!”</i> Azra snaps her leg nearly eight feet into the air and drops it on " + target.getCombatName() + "’s head.”</i>");
				var damage:TypeCollection = meleeDamage();
				damage.add({ kinetic: 10 });
				applyDamage(damageRand(damage, 15), this, target);
				if(physique()/2 + rand(20) + 1 >= target.physique()/2 + rand(10))
				{
					if(!target.hasStatusEffect("Stunned"))
					{
						CombatAttacks.applyStun(target,2);
						output("\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (!target.isPlural ? "is" : "are") + " stunned!</b>");
					}
				}
			}
		}
		//Consecutive normal punches
		public function consecutiveNormalPunches(target:Creature):void
		{
			output("<i>“Stay back!”</i> Azra cries, lashing out with her fists in rapid succession.");
			// 3x flurry paunch
			for (var i:int = 0; i < 3; i++)
			{
				output("\n");
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
			}
		}
		//Uppercut (only on foes 6' or taller)
		public function azraUppercut(target:Creature):void
		{
			output("Azra slides by you, springing up under " + target.getCombatName() + " to bring her fist into " + target.getCombatPronoun("pa") + " chin. ");
			//Normal dodgetext
			if (combatMiss(this, target))
			{
				if (target.customDodge.length > 0) output(target.customDodge);
				else output("\n" + StringUtil.capitalize(target.getCombatName(), false) + " manages to avoid Azra’s uppercut.");
			}
			//Hit for 1.5x damage and applies Sunder :3
			else
			{
				output(" The blow makes an audible crack as it connects!");
				var damage:TypeCollection = meleeDamage();
				damage.multiply(1.5);
				applyDamage(damageRand(damage, 15), this, target);
				if(!target.hasStatusEffect("Sundered")) 
				{
					CombatAttacks.applySunder(target, 4);
					output("\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (!target.isPlural ? "is" : "are") + " sundered!</b>");
				}
			}
		}
		//Normal Punch
		public function azraNormalPunch(target:Creature):void
		{
			output("<i>“I hope that semester learning karate paid off!”</i> Azra hesitantly takes a swing at " + target.getCombatName() + ".");
			var damage:TypeCollection = meleeDamage();
			applyDamage(damageRand(damage, 15), this, target);
		}
		//Collapsing Star - must be in non-indoor room and Azra level 4+
		public function collapsingStar(target:Creature):void
		{
			output("Azra soars into the air on angelic wings. A moment later, you hear the sound of rushing wind as she barrels toward the ground, armored-heels first.");
			//Miss
			if(combatMiss(this,target)) output(" " + StringUtil.capitalize(target.getCombatName(), false) + " slip" + (!target.isPlural ? "s" : "") + " aside, leaving Azra to slam into the ground hard enough to kick up a cloud of dust. She looks pissed.");
			//Hit
			else output(" " + StringUtil.capitalize(target.getCombatName(), false) + " take" + (!target.isPlural ? "s" : "") + " one foot square in the face and the other on the chest as " + target.getCombatPronoun("s") + " " + (!target.isPlural ? "is" : "are") + " crushed beneath Azra’s gravity-accelerated weight. Ouch!");
			//(4x damage)
			var damage:TypeCollection = meleeDamage();
			damage.multiply(4);
			applyDamage(damageRand(damage, 15), this, target);
		}
		//Wingkick - Level 3+ Azra
		public function wingkick(target:Creature):void
		{
			output("Azra hops into the air and flaps her wings hard, setting herself spinning like a top. She lashes out with her heel as she closes on " + target.getCombatName() + "! ");
			if (combatMiss(this, target))
			{
				if (target.customDodge.length > 0) output(target.customDodge);
				else output(StringUtil.capitalize(target.getCombatName(), false) + " manage" + (!target.isPlural ? "s" : "") + " to avoid Azra’s spinning kick!");
			}
			//Normal damage.
			else
			{
				output("She hits!");
				//Trip chance:
				if((physique()/2 + rand(20) + 1 >= target.reflexes()/2 + 10) && !target.isPlanted())
				{
					output(" The impact sends " + target.getCombatPronoun("o") + " sprawling on the ground.");
					CombatAttacks.applyTrip(target);
				}
				var damage:TypeCollection = meleeDamage();
				applyDamage(damageRand(damage, 15), this, target);
			}
		}
		//Dust storm
		public function dustStormAzra(target:Creature):void
		{
			output("Azra beats her wings until a gusting gale-force wind is blowing through the battle, hurling bits of dust and detritus at " + target.getCombatName() + "!");
			if(target.accessory is FlashGoggles) output(" " + StringUtil.capitalize(target.getCombatName(), false) + "’s goggles shield " + target.getCombatPronoun("hisher") + " eyes from the attack and " + target.getCombatPronoun("heshe") + " avoid" + (!target.isPlural ? "s" : "") + " being blinded!");
			else if(target.hasBlindImmunity()) output(" " + StringUtil.capitalize(target.getCombatName(), false) + " " + (!target.isPlural ? "is" : "are") + " unaffected by the attack and avoid" + (target.isPlural ? "" : "s") + " being blinded!");
			else if(target.reflexes()/2 + rand(20) + 1 >= this.physique()/2 + 10) output(" " + StringUtil.capitalize(target.getCombatName(), false) + " close" + (!target.isPlural ? "s" : "") + " " + target.getCombatPronoun("pa") + " eyes in time to avoid being blinded!");
			else
			{
				output(" <b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (!target.isPlural ? "is" : "are") + " blinded!</b>");
				CombatAttacks.applyBlind(target);
			}
		}
		//Tail whip
		public function tailWhipAttack(target:Creature):void
		{
			output("<i>“Back off!”</i> Azra shouts. She spins herself around, tail outstretched. Her posterior protuberance ");
			if (combatMiss(this, target)) output("misses " + target.getCombatName() + " by a mile, unfortunately. The siren wobbles, blushing at her failure. <i>“Sorry!”</i>");
			else
			{
				output("slams into " + target.getCombatName() + "! <i>“Take that!”</i>");
				var damage:TypeCollection = meleeDamage();
				applyDamage(damageRand(damage, 15), this, target);
				//Chance of staggered.
				if((physique()/2 + rand(20) + 1 >= target.physique()/2 + 10) && !target.isPlanted())
				{
					output("\n<b>" + StringUtil.capitalize(target.getCombatPronoun("s")) + " " + (!target.isPlural ? "is" : "are") + " staggered.</b>");
					CombatAttacks.applyStagger(target);
				}
			}
		}
		//Sharklust - At 60+ lust - 1x per combat
		public function sharkLustAttack(target:Creature):void
		{
			output("<i>“Oh... oh snap!”</i> Azra cries, pawing at her crotch plate. Her face curls up in pain for a moment, then her scrabbling fingers release the groin-guard, allowing a tremendously erect siren-cock to spill free of the constricting garment. The air fills with her long-denied musky scent, though she fans most of it toward " + target.getCombatName() + " with her wings. <i>“This is your fault! Is this what you wanted?”</i> The tendrils that wring her member squirm excitedly. <i>“Well how do you like it?!”</i>");
			kGAMECLASS.flags["AZRA_SEX_KNOWN"] = 1;
			createStatusEffect("cock out");
		}
		//Cock grapple
		public function cockGrapple(target:Creature):void
		{
			output("Azra tries to grab " + target.getCombatName() + "!");
			if (combatMiss(this, target)) output(" " + StringUtil.capitalize(target.getCombatPronoun("s")) + " squirm" + (!target.isPlural ? "s" : "") + " out of her impressive reach.");
			else
			{
				output(" " + StringUtil.capitalize(target.getCombatPronoun("s")) + " can’t escape, not even as she presses " + target.getCombatPronoun("pa") + " face against her turgid, alien cock, smearing her potent musk over every inch of " + target.getCombatPronoun("o") + ".");
				var resisted:Boolean = (target.willpower() + rand(20) + 1 >= this.intelligence() + 10);
				var damage:TypeCollection = new TypeCollection({ tease: 13 });
				if(resisted) damage = new TypeCollection({ tease: 5});
				var dr2:DamageResult = applyDamage( damage , this, target, "suppress");
				
				if(target.lust() < target.lustMax())
				{
					output(" [pc.HeShe] stumble" + (!target.isPlural ? "s" : "") + " free, dazed");
					if(!resisted) output(" and aroused");
					else output(" though not very aroused");
					output(".");
				}
				else output(" " + StringUtil.capitalize(target.getCombatPronoun("s")) + " sag" + (!target.isPlural ? "s" : "") + " to the ground, overwhelmed by the weight of " + target.getCombatPronoun("pa") + " own arousal.");
				outputDamage(dr2);
			}
		}
		//Cunny tease
		public function azraCunnyTeasers(target:Creature):void
		{
			output("Azra bends over, presenting her unguarded cunt to " + target.getCombatName() + ". <i>“Like what you see?”</i> She digs her fingers into it and spreads her lips wide, fanning sweet smelling pussy-musk directly at " + target.getCombatPronoun("o") + ". Under her breath she mumbles, <i>“Pervert.”</i>");
			applyDamage(new TypeCollection( { tease: 15 } ), this, target, "minimal");
		}
		//Embarassment
		public function azraTurnWaster(target:Creature):void
		{
			output("<i>“Oh, this is too much!”</i> Azra tries to cover up her dick with her hands, but it does nothing to conceal her balls or the wanton scents pouring off of her. <i>“Captain [pc.name]! Help!”</i>");
		}
		//Aphro!
		public function azraAphroAttack(target:Creature):void
		{
			output("<i>“F-f-fuck you!”</i> Azra pulls a vial out of her collection kit and tosses it at " + target.getCombatName() + ". It shatters into a million pieces, releasing a cloud of pink mist. <i>“Let’s see how you like being too fucking turned on to think!”</i> She jerks her other hand away from your crotch. <i>“Jerk.”</i>");
			//As the PC affecting Aphro Gas attack.
			CombatAttacks.applyAphroGas(target, 5, 4, false);
		}
		override public function get bustDisplay():String
		{
			var sBust:String = "AZRA";
			
			if(breastRows[0].breastRatingRaw > 15 || isPregnant()) sBust += "_BIG";
			
			return sBust;
		}
	}

}
