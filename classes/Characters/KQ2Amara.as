package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Accessories.ACECannon;
	import classes.Items.Armor.VoidPlateArmor;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Melee.Fists;
	import classes.Items.Melee.ShockBlade;
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
	
	//Fight is in pitch black. Aim and Reflexes are significantly reduced. 
	public class KQ2Amara extends Creature
	{
		//constructor
		public function KQ2Amara()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Amara";
			this.originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			this.long = "Amara Faell, a Dread Lord of the Black Void. She’s clad in sleek, heavy black power armor that protects her from the neck down. She’s got a crash helmet on, leaving her face guarded only by floating holographic displays and shields. Curly red hair spills out from under her helm, a stark contrast to blue-painted lips and emerald green eyes. She’s packing a massive chaingun in one hand, supported by her powered suit’s superhuman strength. In the other, she wields a flamethrower strapped to the wrist, projecting a constant flicker of flame between bursts. ";
			this.customBlock = "The pirate’s armor deflects your attack with alarming ease.";
			this.isPlural = false;
			isLustImmune = false;
			
			meleeWeapon = new ShockBlade();
			rangedWeapon = new MagnumPistol();
			rangedWeapon.longName = "chaingun";
			rangedWeapon.attackNoun = "burst";
			rangedWeapon.hasRandomProperties = true;
			rangedWeapon.baseDamage.kinetic.damageValue = 25;
			rangedWeapon.attack = 5;
			
			shield = new JoyCoPremiumShield();
			shield.shields = 180;
			shield.hasRandomProperties = true;
			
			armor = new VoidPlateArmor();
			armor.defense = 20;
			armor.resistances.kinetic.resistanceValue = 25.0;
			armor.resistances.freezing.resistanceValue = -25.0;
			armor.resistances.burning.resistanceValue = 15.0;
			armor.hasRandomProperties = true;
			
			accessory = new ACECannon();
			
			this.physiqueRaw = 30;
			this.reflexesRaw = 25;
			this.aimRaw = 30;
			this.intelligenceRaw = 12;
			this.willpowerRaw = 35;
			this.libidoRaw = 20;
			this.shieldsRaw = shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 80 + rand(80);
			this.HPMod = 200;
			this.HPRaw = this.HPMax();
			
			this.femininity = 80;
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
			this.hipRatingRaw = 8;
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
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			createStatusEffect("Disarm Immune");
			createPerk("Attack Drone", 0, 0, 0, 0, "Attack Drone!");
			
			isUniqueInFight = true;
			btnTargetText = "Amara";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "AMARA";
		}
		
		override public function inPowerArmor():Boolean
		{
			return true;
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (CombatManager.getRoundCount() != 1) powerRegen();
			
			// enemy AI
			var enemyAttacks:Array = [];
			enemyAttacks.push( { v: chaingunBarrage, w: 40 } );
			if (!target.hasStatusEffect("Tripped") && energy() >= 25) enemyAttacks.push( { v: shoulderCharge, w: 10 } );
			if (energy() >= 25) enemyAttacks.push( { v: prometheanGun, w: 10 } );
			if (energy() >= 50 && CombatManager.getRoundCount() != 1) enemyAttacks.push( { v: grandSlam, w: 30 } );
			if (energy() >= 25) enemyAttacks.push( { v: clusterGrenades, w: 25 } );

			var attack:Function = weightedRand(enemyAttacks);
			if (attack == chaingunBarrage || attack == clusterGrenades) attack(hostileCreatures);
			else attack(target);
		}
		
		private function powerRegen():void
		{
			output("The reactor powering Amara’s battlesuit hums audibly, providing her equipment with a near limitless supply of energy!\n\n");
			if (energy() < energyMax())
			{
				energy(energyMax() * 0.4);
			}
			else
			{
				shields(shieldsMax() * 0.1);
			}
		}
		
		private function chaingunBarrage(hostiles:Array):void
		{
			var pc:Creature;
			var kara:Creature;
			
			for (var i:int = 0; i < hostiles.length; i++)
			{
				if (hostiles[i] is PlayerCharacter) pc = hostiles[i];
				if (hostiles[i] is Kara && !hostiles[i].isDefeated()) kara = hostiles[i];
			}
			
			output("Amara digs her feet in and brings her chaingun to bear. With a booming warcry, she holds down the trigger and lets a hail of lead fly down range at");
			if (!kara) output(" you");
			else output(" you and Kara");
			output(".");
			
			for (i = 0; i < 2; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, pc, false, "ranged");
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, (kara == null ? pc : kara), false, "ranged");
			}
		}
		
		private function prometheanGun(target:Creature):void
		{
			energy( -25);
			
			//Single target, deals heavy Flame damage. High chance to inflict Burning.
			output("Amara brings her free hand to bear, and with it, the compact little flamethrower mounted there. Laughing maniacally, she lets loose a jet of flame over " + (target is PlayerCharacter ? "you" :"Kara") +",");
			
			if (rangedCombatMiss(this, target))
			{
				output(" scorching the air well over her target.");
			}
			else
			{
				output(" bathing " + (target is PlayerCharacter ? "you":"her") +" in fire!");
				
				applyDamage(damageRand(new TypeCollection( { burning: 25 } ), 15), this, target, "minimal");
				
				if (target.reflexes() / 2 + rand(20) + 1 < 25)
				{
					/*
					if (!target.hasStatusEffect("Burning")) target.createStatusEffect("Burning", 3, 7, 0, 0, false, "DefenseDown", "Reduces your defense by five points and causes damage over time.", true, 0);
					else target.setStatusValue("Burning", 1, 3);
					*/
					CombatAttacks.applyBurning(target, 3, 7, true);
					output(" <b>" + (target is PlayerCharacter ? "You are" : "Kara is") +" burning!</b>");
				}
			}
		}
		
		private function clusterGrenades(hostiles:Array):void
		{
			var pc:Creature;
			var kara:Creature;
			
			for (var i:int = 0; i < hostiles.length; i++)
			{
				if (hostiles[i] is PlayerCharacter) pc = hostiles[i];
				if (hostiles[i] is Kara && !hostiles[i].isDefeated()) kara = hostiles[i];
			}
			
			//Amara throws grenades that target both PC and Kara. Do high damage, chance to stun. Allow a Reflexes save to avoid them. 
			output("The pirate leader hurls a grenade from her belt straight towards you. Rather than exploding, the grenade shoots out dozens of tiny little pellets");
			
			var hitPC:Boolean = combatMiss(this, pc);
			var hitKara:Boolean = kara != null && combatMiss(this, kara);
			
			if ((hitPC) || (kara != null && hitKara))
			{
				output(" that detonate all over");
				if (hitPC && hitKara) output(" you and Kara");
				else if (hitPC && !hitKara) output(" you");
				else output(" Kara");
			}
			
			if (!hitPC || (kara != null && !hitKara))
			{
				output(" that");
				if (!hitPC && (kara == null || hitKara)) output(" you have");
				else if (hitPC && (kara != null && !hitKara)) output(" Kara has");
				else if (kara != null && !hitKara && !hitPC) output(" you both have");
				output(" the quick sense to evade before they detonate");
			}
			
			output(", showering the helipad in shrapnel.");
			
			if (hitPC) applyDamage(damageRand(new TypeCollection( { kinetic: 10, burning: 15 }, DamageFlag.EXPLOSIVE), 15), this, pc, "minimal");
			if (hitKara) applyDamage(damageRand(new TypeCollection( { kinetic: 10, burning: 15 }, DamageFlag.EXPLOSIVE), 15), this, kara, !hitPC ? "minimal" : "suppress");
		}
		
		private function shoulderCharge(target:Creature):void
		{
			energy( -25);
			
			//Light melee hit, knockdown.
			output("With a thunderous roar, Amara charges shoulder-first, throwing herself at " + (target is PlayerCharacter ? "you" : "Kara") +" with super-human force.");
			
			if (combatMiss(this, target, -1, 3))
			{
				output(" " + (target is PlayerCharacter ? "You manage" : "Kara manages") +" to dodge to the side, letting the power-armor clad pirate hurtle past.");
			}
			else
			{
				output(" Amara slams into " + (target is PlayerCharacter ? "you" : "Kara") +", sending " + (target is PlayerCharacter? "you" : "her") +" hurling to the ground with bone-crushing force.");
				
				applyDamage(damageRand(new TypeCollection( { kinetic: 15 } ), 15), this, target, "minimal");
				
				if(!target.hasStatusEffect("Tripped") && !target.isPlanted() && target.reflexes() + rand(20) + 1 < 25)
				{
					CombatAttacks.applyTrip(target);
					output(" <b>" + (target is PlayerCharacter ? "You smash" : "Kara smashes") + " back-first into the floor, HARD.</b>");
				}
			}
		}
		
		private function grandSlam(target:Creature):void
		{
			energy( -50);
			
			//Heavy melee hit (half blunt, half energy), chance to stun
			output("With a ground-shaking roar, booster jets on Amara’s suit’s feet activate and propel her into the air. She lunges up and comes back down foot-first towards " + (target is PlayerCharacter ? "your" : "Kara’s") +" face!");
			
			if (combatMiss(this, target, -1, 2))
			{
				output(" " + (target is PlayerCharacter ? "You manage" : "Kara manages") +" to duck out of the way at the last moment. Amara slams into the ground where "+ (target is PlayerCharacter ? "you were" : "Kara was") +" standing with tremendous force, leaving a crater where she landed.");
			}
			else
			{
				output(" Amara slams into " + (target is PlayerCharacter ? "your" : "Kara’s") +" face, jumpjets first, throwing " + (target is PlayerCharacter ? "you" : "her") +" to the ground with bone-crushing force, driving " + (target is PlayerCharacter ? "you" : "her") +" into a crater.");
				
				applyDamage(damageRand(new TypeCollection( { kinetic: 15, burning: 10 } ), 15), this, target, "minimal");
				
				if (!target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune") && target.physique() / 2 + rand(20) + 1 < 35)
				{
					CombatAttacks.applyStun(target, 3);
					output(" <b>" + (target is PlayerCharacter ? "You are" : "Kara is") +" stunned!</b>");
				}
			}
		}
	}
}
