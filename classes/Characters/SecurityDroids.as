package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Protection.BasicShield;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SecurityDroids extends Creature
	{
		
		public function SecurityDroids() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "security droid";
			this.originalRace = "Automaton";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "Somehow, the drones manage to skirt out of the way of your fire.";
			this.customBlock = "The hardened exterior of the drones absorbs your attack.";
			this.isPlural = true;
			isLustImmune = true;
			
			this.meleeWeapon = new Fists();
			this.rangedWeapon.longName = "laser emitter";
			this.rangedWeapon.attack = 0;
			rangedWeapon.baseDamage.electric.damageValue = 1;
			rangedWeapon.baseDamage.burning.damageValue = 1;
			rangedWeapon.addFlag(DamageFlag.LASER);
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "laser beam";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "steel plates";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			this.shield = new BasicShield();
			
			this.physiqueRaw = 8;
			this.reflexesRaw = 4;
			this.aimRaw = 14;
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
			this.HPMod = 0;
			this.shieldsRaw = this.shieldsMax();
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
			btnTargetText = "Droid";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "DROID_SECURITY";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (!target.hasStatusEffect("Blinded") && rand(5) == 0) securityDroidFlashbang(target);
			else if (!hasStatusEffect("Blinded") && !hasStatusEffect("Stunned") && rand(3) == 0) securityDroidChargeShot(target);
			else securityDroidLaserBarrage(target);
		}
		
		private function securityDroidLaserBarrage(target:Creature):void
		{
			//Laser Barrage
			//Lots of moderate laser attacks
			output("Several of the drones lock onto " + ((target is Anno) ? "your ausar friend" : "you") + " and let loose with a hail of laser bolts.");
			
			var attacks:int = 2 + rand(2);

			for (var i:int = 0; i < attacks; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}
		
		private function securityDroidChargeShot(target:Creature):void
		{
			//Charge Shot
			//Two moderate laser shots (as above) + one HEAVY one
			output("Amid several other drones lighting you up, one steps to the forefront, its laser pistol glowing red-hot as it charges up a power shot!");
			
			for (var i:int = 0; i < 2; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);		
			}

			// Heavy attack
			if (rangedCombatMiss(this, target))
			{
				if(target is Anno) output(" Anno quickly dodges to the side, just in time to avoid the energy blast.");
				else
				{
					output(" You tumble to the side, ducking out of the way just in time to avoid a face-melting energy blast");
					if (kGAMECLASS.silly) output(" to the, uh, face");
					output(".");
				}
			}
			else
			{
				if(target is Anno) output(" Anno staggers back as the heavy laser bolt slams into her with a sizzling noise--ouch!");
				else output(" You stagger back as the heavy laser bolt slams into your chest, burning into your defenses and leaving you smoking like a sausage!");

				applyDamage(new TypeCollection( { burning: 20, electric:10 }, DamageFlag.LASER), this, target);
			}
		}
		
		private function securityDroidFlashbang(target:Creature):void
		{
			// Flashbang
			// Blind, possibly Stun attack
			output("One of the drones pulls a small, cylindrical grenade from its slender steel hip and lobs it at the pair of you!");

			if(aim()/2 + rand(20) + 6 > target.reflexes()/2 + 10 && !target.hasStatusEffect("Blinded") && !target.hasBlindImmunity())
			{
				target.createStatusEffect("Blinded",3,0,0,0,false,"Blind","Accuracy is reduced, and ranged attacks are far more likely to miss.",true,0,0xFF0000);
				if(target is Anno) output(" Anno wasn’t able to avoid it in time as the flash grenade goes off with a deafening BANG, leaving her <b>blinded</b>!");
				else output(" You aren’t able to shield yourself in time as the flash grenade goes off with a deafening BANG, leaving you <b>blinded</b>!");
			}
			else
			{
				if(target is Anno) output(" Anno looks away just in time to avoid the flash as the stun grenade goes off with a deafening BANG!");
				else output(" You cover your eyes just in time to avoid the flash as the stun grenade goes off with a deafening BANG!");
			}
		}
	}

}