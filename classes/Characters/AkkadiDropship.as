package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.possessive;

	public class AkkadiDropship extends Creature
	{
		//Boss has ultra-heavy shields and LOADS of Health -- like, way more than the PC could ever reasonably chew through at Level 10. She also has high Energy DPS via a pair of Vulcan laser cannons, which make a flurry of low-damage attacks each round. While in the gunship, Schora is immune to Lust (has 0, can't gain it) and cannot be Stunned or Knocked Prone.
		public function AkkadiDropship() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "dropship";
			this.originalRace = "aircraft";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "rhue3z3 353egh334";
			this.isPlural = false;
			isLustImmune = true;
			
//			this.meleeWeapon = new Fists();
			this.rangedWeapon.longName = "laser cannon";
			this.rangedWeapon.attack = 0;
			rangedWeapon.baseDamage.electric.damageValue = 2;
			rangedWeapon.baseDamage.burning.damageValue = 2;
			rangedWeapon.baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			rangedWeapon.addFlag(DamageFlag.LASER);
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "laser beam";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "steel armor";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;

			this.shield = new ReaperArmamentsMarkIIShield();
			this.shield.shields = 500;
			this.shield.hasRandomProperties = true;

			this.physiqueRaw = 50;
			this.reflexesRaw = 20;
			this.aimRaw = 20;
			this.intelligenceRaw = 30;
			this.willpowerRaw = 25;
			this.libidoRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			this.level = 9;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = this.HPMax() * 10;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Stun Immune");
			this.createStatusEffect("Force It Gender");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createStatusEffect("Flying", 0, 0, 0, 0, false, "Icon_Wings", "Flying, cannot be struck by normal melee attacks!", true, 0);

			isUniqueInFight = true;
			btnTargetText = "Dropship";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "DROPSHIP";
		}
		
		override public function isDefeated():Boolean
		{
			//kill the ship if the shields go down
			if (HP() <= 0 || shields() <= 0) return true;
			return false;
		}

		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			var enemyAttacks:Array = [];
			enemyAttacks.push( { v: vulcanCannons, w: 25 } );
			if (!hasStatusEffect("Evasion Cooldown")) enemyAttacks.push( { v: evasiveManeuvers, w: 5 } );
			if (energy() >= 10) enemyAttacks.push( { v: strafingRun, w: 15 } );
			if (energy() >= 15) enemyAttacks.push( { v: concussionLauncher, w: 5 } );

			//if the PC is low on health, just try to finish them with heavy attacks
			if (target.shields() <= 0 && (target.HP() / target.HPMax() <= 0.1 || target.HP() <= 100) && energy() >= 15 && rand(2) == 0) concussionLauncher(target);
			//if the PC is in cover, try to kill it
			else if (target.hasStatusEffect("Taking Cover") && energy() >= 10 && rand(2) == 0) strafingRun(target);
			// if the ship is low on shields or run out of energy, evade
			else if (!hasStatusEffect("Evasion Cooldown") && ((this.shields() / this.shieldsMax() <= 0.5) || (energy() <= 20))) evasiveManeuvers(target);
			//otherwise just use the attacks at random
			else weightedRand(enemyAttacks)(target);
		}
		
		//Used every turn, on top of any other ability. Makes six low-accuracy, low-damage attacks.
		private function vulcanCannons(target:Creature):void
		{
			output("The twin cannons under the dropship cockpit keep spinning, hurling an endless barrage of laser bolts your way!");
			output("\n");

			for (var i:int = 0; i < 6; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}

		//Rare. Increases Evasion by 25% for 3 turns.
		private function evasiveManeuvers(target:Creature):void
		{
			vulcanCannons(target);
			output("\n\nThe dropship starts moving faster, ducking and weaving around the helipad. With its engines roaring at full blast, snow kicks up and whirls around it, making the ship damn hard to see.");
			createStatusEffect("Evasion Cooldown", 5);
			createStatusEffect("Evasion Boost",30,0,0,0,false,"Icon_DefUp","+30% Evasion!",true,3);
			energy(+25);
		}

		//Reduces the PC's evasion, deals moderate energy damage. Chance to blind if the PC fails a Reflex save.
		private function strafingRun(target:Creature):void
		{
			output("The dropship comes in low, running its cannons hot as laser beams kick up all around you, ");
			//kill the cover
			if (statusEffectv1("Taking Cover") >= 1) {
				output("reducing your cover" )
				target.addStatusValue("Taking Cover", 1, -1);
			}
			else output("leaving you nowhere to run");
			if (!target.hasBlindImmunity() && !target.hasStatusEffect("Blinded") && rand(99) >= target.RQ()) {
				CombatAttacks.applyBlind(target, 3);
				output(" and blasting up so much snow and mist that it’s impossible to see");
			}
			output("!\n");
			//lets kick up some dust by faking the default attack and making the last 4 shoots always miss
			for (var i:int = 0; i < 2; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
			for (var o:int = 0; o < 4; o++)
			{
				output("\n");
				output("You manage to avoid " + possessive(this.getCombatName()) + " " + this.rangedWeapon.attackNoun + ".");
			}
			energy(-10);
		}

		//Rare. Does massive Kinetic damage. Physique save for half damage.
		private function concussionLauncher(target:Creature):void
		{
			vulcanCannons(target);
			output("\n\nA pair of cannons under the dropship’s wings glow for a moment before unleashing a shockwave of concussive force, blasting you like a solid wall of bricks and knocking snow-dust up all around you.");
			var damage:int;
			if (rand(50) * 2 >= target.PQ()) damage = 48;
			else damage = 36;
			applyDamage(damageRand(new TypeCollection( { kinetic: damage }, DamageFlag.BYPASS_SHIELD), Math.round(damage / 2)), this, target, "minimal");
			if (rand(2) == 0 && !target.isPlanted()) {
				output("<b> You’ve been staggered!</b>");
				CombatAttacks.applyStagger(target, 3);
			}
			energy(-15);
		}
	}
}