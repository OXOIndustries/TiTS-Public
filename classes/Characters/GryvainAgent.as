package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.HeavyLaser;
	import classes.Items.Protection.ImprovisedShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.author;
	
	public class GryvainAgent extends Creature
	{
		//constructor
		public function GryvainAgent()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "gryvain agent";
			this.originalRace = "gryvain";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "She’s a tall, plush woman in a dark jacket and silvery armor. A pair of dark horns sprout from her hair, curling over a head of cobalt-blue hair - the same color as the four wings coming from her back, and the scaly tail hanging behind her. The freelancer’s carrying a heavy energy pistol, charged up so hot that the barrel’s glowing with every shot.";
			this.customDodge = "The gryvain agent rolls out of the way.";
			this.customBlock = "Bluh.";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "swipe";
			this.meleeWeapon.attackNoun = "claw";
			this.meleeWeapon.longName = "claws";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 2;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon = new HeavyLaser();
			this.rangedWeapon.baseDamage.burning.damageValue = 4;
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "scales";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;

			this.shield = new ImprovisedShield();
			this.shield.shields = 40;
			this.shield.hasRandomProperties = true;
			
			this.physiqueRaw = 3;
			this.reflexesRaw = 9;
			this.aimRaw = 10;
			this.intelligenceRaw = 7;
			this.willpowerRaw = 7;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.level = 2;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = -15;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 80;
			this.eyeType = GLOBAL.TYPE_GRYVAIN;
			this.eyeColor = "yellow";
			this.tallness = 74;
			this.thickness = 42;
			this.tone = 75;
			this.hairColor = "light blue";
			this.scaleColor = "blue";
			this.furColor = "blue";
			this.hairLength = 9;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pale";
			this.skinFlags = [];
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_GRYVAIN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_GRYVAIN;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_GRYVAIN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_SCALED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_GRYVAIN;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_SCALED,GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
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
			this.hipRatingRaw = 10;
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
			this.buttRatingRaw = 8;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 100;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 30;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 60;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 1002;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 12;
			this.cocks[0].cockColor = "blue";
			this.cocks[0].cType = GLOBAL.TYPE_GRYVAIN;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.30;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 7;
			this.nippleColor = "blue";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity = 1000;

			this.createVagina();
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].type = GLOBAL.TYPE_GRYVAIN;
			this.vaginas[0].vaginaColor = "blue";
			
			//this.createStatusEffect("Disarm Immune");
			createStatusEffect("Force Fem Gender");

			this.inventory.push(new HeavyLaser());
			
			isUniqueInFight = true;
			btnTargetText = "Gryvain";
			sexualPreferences.setRandomPrefs(4,2);
			this._isLoading = false;
			kGAMECLASS.mhengaSSTDChance(this);
		}
		
		override public function get bustDisplay():String
		{
			return "GRYVAIN_AGENT";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(this.hasStatusEffect("Disarmed")) CombatAttacks.MeleeAttack(this, target);
			//Toxic Trickery
			//Only attempts when your shields are down. Deals 1 pt. of Kinetic damage, but greatly reduces AIM and PHYS and inflicts some Lust damage each turn for 2-4 turns.
			else if(target.shields() <= 0 && !target.hasStatusEffect("Toxic Trickery") && rand(3) == 0) toxicShittery(target);
			else if(this.energy() >= 25 && this.shields() <= 0 && target.shields() > 0) vampBoltShooterooni(target);
			else if(!target.hasStatusEffect("Blind") && !target.hasStatusEffect("Blinded") && this.energy() >= 25 && rand(3) == 0) searingBoltAttackamundo(target);
			else gryvainPistolShot(target);
		}
		
		//Pistol Shot
		//Basic Attack
		public function gryvainPistolShot(target:Creature):void
		{
			output("The gryvain levels her pistol at you and snaps off a quick shot. Her pistol’s firing wild, wide beams of white-hot energy that lance through the air, ");
			if(!rangedCombatMiss(this, target))
			{
				output("blasting into you!");
				applyDamage(rangedDamage(), this, target, "minimal");
			}
			else output("narrowly missing you!");
		}
		//Vamp Bolt
		public function vampBoltShooterooni(target:Creature):void
		//Attack only when her Shields are down and yours are up. Costs 25 ENG. On a hit, deals moderate Electrical damage. Half of damage is recovered by her shields.
		{
			output("Your opponent twists her off-hand to the side, revealing a hidden wrist launcher under her sleeve. A pair of bolts hiss out of it, impacting your shields and delivering a massive electrical shock! ");
			var damage:TypeCollection = new TypeCollection({electric: 8});
			applyDamage(damage, this, target, "minimal");
			this.energy(-25);
			//damage.multiply(0.5);
			//output("\nTEST DATA: " + damage.getTotal());
			output("\nHer shields flicker and come back online, soaking up the energy from your own!");
			this.shields(Math.round(damage.getTotal()/2));
		}
		//Searing Bolt
		//125% damage + blind effect. Costs 25 ENG.
		public function searingBoltAttackamundo(target:Creature):void
		{
			output("The gryvain levels her pistol at you and holds down the trigger, building up a massive bolt of energy before shooting it off at you. The shot comes in a searing, blinding ray of light ");
			if(!rangedCombatMiss(this, target))
			{
				output("that hits you like a thunderbolt!");
				var damage:TypeCollection = rangedDamage();
				applyDamage(damage, this, target, "minimal");
			}
			else output("blasts into the debris behind you, a narrow miss!");
			//Reflex Save Failed:
			if(target.hasBlindImmunity()) output(" Your eyes are unaffected by the brilliance of the attack and you avoid being blinded!");
			else if(target.reflexes()/2 + rand(20) + 1 < this.aim()/2 + 10)
			{
				output(" <b>The sheer brilliance of the attack leaves you blinded!</b>");
				CombatAttacks.applyBlind(target);
			}
			this.energy(-25);
		}
		//Toxic Trickery
		//Only attempts when your shields are down. Deals 1 pt. of Kinetic damage, but greatly reduces AIM and PHYS and inflicts some Lust damage each turn for 2-4 turns.
		public function toxicShittery(target:Creature):void
		{
			output("Rather than take a shot, the gryvain spins and hurls a dart at you! ");
			if(target.reflexes()/2 + rand(20) + 1 < this.aim()/2 + 10)
			{
				output("The tiny needle jabs into you, and a rush of burning pain floods up your arm. You already feel more lethargic by the time you’ve pulled the needle out, and you’re starting to feel flushed all over... uh-oh...");
				var damage:TypeCollection = new TypeCollection({kinetic: 1});
				applyDamage(damage, this, target, "minimal");
				target.createStatusEffect("Toxic Trickery",2+rand(3), 0, 0, 0, false, "Icon_Poison", "Greatly reduces your aim and physique while inflicting light lust damage over time.\n\n(-4 physique)\n(-4 aim)\n(2-4 lust damage every round.)", true, 0, 0xFF0000);
				target.physiqueMod -= 4;
				target.aimMod -= 4;
			}
			else output("You manage to duck out of the way!");
		}
	}
}
