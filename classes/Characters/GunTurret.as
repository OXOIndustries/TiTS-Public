package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	
	//**************************************************
	//Listed as chars["AUTOTURRETS"] in code elsewhere!
	//**************************************************
	public class GunTurret extends Creature
	{
		//constructor
		public function GunTurret()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "auto-turrets";
			this.originalRace = "automaton";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "A single, deployable gun turret has been set up here, armed with a basic machine gun.";
			this.customDodge = "Somehow, the turret swivels out of the way.";
			this.customBlock = "The armor plates soak up your attack.";
			this.isPlural = false;
			isLustImmune = true;
			this.meleeWeapon = new Fists();
			this.rangedWeapon.longName = "gun";
			this.rangedWeapon.attack = -2;
			rangedWeapon.baseDamage.kinetic.damageValue = 2;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "shot";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "steel plates";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 14;
			this.reflexesRaw = 4;
			this.aimRaw = 19;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 20;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.damageValue = -40.0;
			
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 75;
			this.HPRaw = this.HPMax();
			
			
			this.femininity = 50;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "black";
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
			this.skinTone = "steel gray";
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
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailCount = 1;
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
			this.hipRatingRaw = 2;
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
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = true;
			btnTargetText = "Turrets";
			
			this._isLoading = false;

		}
		
		override public function get bustDisplay():String
		{
			return "TAMTURRETS";
		}	
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(rand(3) == 0) turretVolleyAttackMotherFucker(target);
			else CombatAttacks.RangedAttack(this, target);
		}
		private function turretVolleyAttackMotherFucker(target:Creature):void
		{
			output("You find yourself under a hail of gunfire, the turret bearing down on you and firing full-auto, sacrificing accuracy for sheer volume of firepower. And it’s working: duck and weave as you might, there’s a stream of bullets crashing behind you, tearing into the walls with deafening force.\n");
			
			var asFlurry:Boolean = !hasStatusEffect("Turret Aimhacks");
			
			for (var i:int = 0; i < 4; i++)
			{
				CombatAttacks.SingleRangedAttackImpl(this, target, asFlurry);
				output("\n");
			}
			
			if (hasStatusEffect("Turret Aimhacks")) removeStatusEffect("Turret Aimhacks");
		}
		/*
		private function laserSightShot(target:Creature):void
		{
			output("Ducking and weaving through the storm of bullets headed your way, you see the cat-girl standing stock still, a holographic scope appearing over the barrel of her laser pistol. <i>“Heads up!”</i> she grins, leveling the gun right at you.");
			//Miss:
			if(rangedCombatMiss(this, target))
			{
				output("\n\nShe squeezes the trigger, but just a second too late. You tumble to the side, the bolt crashing through the space you occupied a second before. A near miss -- very near.");
			}
			//Hit:
			else
			{
				output("\n\nShe squeezes the trigger, and a bright bolt of laser fire slams right into you, nearly knocking you off your [pc.feet]! Damn, she’s a deadeye!");
				var damage:TypeCollection = damage(false);
				damage.add(aim() / 2);
				damage.multiply(2.2);
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
		}*/
	}
}