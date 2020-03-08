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
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class KQ2SecurityDroid extends Creature
	{
		
		public function KQ2SecurityDroid() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "security drone";
			this.originalRace = "automaton";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "Somehow, the drone manages to skirt out of the way of your fire.";
			this.customBlock = "The hardened exterior of the drone absorbs your attack.";
			this.isPlural = false;
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
			armor.resistances.addFlag(DamageFlag.ABLATIVE);
			
			this.physiqueRaw = 5;
			this.reflexesRaw = 25;
			this.aimRaw = 25;
			this.intelligenceRaw = 0;
			this.willpowerRaw = 0;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.resistanceValue = -40.0;
			baseHPResistances.burning.resistanceValue = 40.0;
			baseHPResistances.corrosive.resistanceValue = 40.0;
			baseHPResistances.freezing.resistanceValue = 40.0;
			baseHPResistances.kinetic.resistanceValue = 40.0;
			baseHPResistances.poison.resistanceValue = 40.0;
			
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 75;
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
			btnTargetText = "Drone";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			if(kGAMECLASS.silly) return "HOVER_DRONE_SILLY";
			return "HOVER_DRONE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (HP() / HPMax() > 0.25) droneZap(target);
			else droneKamikaze(hostileCreatures);
		}
		
		private function droneZap(target:Creature):void
		{
			output(StringUtil.upperCase(uniqueName, false) + " fires its zap-gun at " + (target is PlayerCharacter ? "you" : target.a + target.short));
			
			if (!rangedCombatMiss(this, target))
			{
				output(" shocking " + (target is PlayerCharacter ? "you" : target.mfn("him", "her", "it")) + "!");
				applyDamage(rangedDamage(), this, target, "minimal");
			}
			else
			{
				output(" though " + (target is PlayerCharacter ? "you manage" : target.mfn("he", "she", "it") + " manages") + " to duck the attack!");
			}
		}
		
		private function droneKamikaze(hostileCreatures:Array):void
		{
			output(StringUtil.upperCase(uniqueName, false) + " makes a series of rapid beeps, showering the the area with sparks as it shudders forward. The beeping quickens as the dying drone picks up speed, rushing toward you as if it means to crash into you!");
			
			// Cheaty-check- if Khan isn't involved in the fight, then its in the sewers
			if (!CombatManager.hasEnemyOfClass(KQ2Khan))
			{
				output(" Suddenly the sewer is rocked by an explosion, sending razor-like shards of shrapnel everywhere!");
			}
			else
			{
				output(" Suddenly the room is rocked by an explosion, sending razor-like shards of shrapnel everywhere!");
			}
			
			var baseDamage:TypeCollection = new TypeCollection( { kinetic: 10, burning: 15 }, DamageFlag.EXPLOSIVE);
			
			var pc:Creature;
			var kara:Creature;
			
			for (var i:int = 0; i < hostileCreatures.length; i++)
			{
				if (hostileCreatures[i] is PlayerCharacter) pc = hostileCreatures[i];
				if (hostileCreatures[i] is Kara) kara = hostileCreatures[i];
			}
			
			var hitPC:Boolean = combatMiss(this, pc);
			var hitKara:Boolean = kara != null && combatMiss(this, kara);
			
			if (hostileCreatures.length == 1)
			{
				if (!hitPC)
				{
					output(" You manage to avoid the blast!");
				}
				else
				{
					output(" The shrapnel tears into you!");
					applyDamage(damageRand(baseDamage, 15), this, pc, "minimal");
				}
			}
			else
			{
				if (hitPC && !hitKara)
				{
					output(" Kara manages to avoid the blast, but the shrapnel tears into you!");
					applyDamage(damageRand(baseDamage, 15), this, pc, "minimal");
				}
				else if (!hitPC && hitKara)
				{
					output(" You manage to avoid the blast, but the shrapnel tears into Kara!");
					applyDamage(damageRand(baseDamage, 15), this, kara, "minimal");
				}
				else if (hitPC && hitKara)
				{
					output(" Both you and Kara are showered with ragged, razor-sharp pieces of shrapnel!");
					applyDamage(damageRand(baseDamage, 15), this, pc, "minimal");
					applyDamage(damageRand(baseDamage, 15), this, kara, "suppress");
				}
				else
				{
					output(" Both you and Kara manage to avoid the blast!");
				}
			}
			
			// Asploded!
			this.changeHP(-9000);
			this.changeEnergy(-9000);
		}
	}
}