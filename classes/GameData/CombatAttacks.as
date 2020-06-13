package classes.GameData 
{
	import classes.Characters.BothriocQuadomme;
	import classes.Characters.Celise;
	import classes.Characters.Cockvine;
	import classes.Characters.CommanderSchora;
	import classes.Characters.CyberPunkSecOp;
	import classes.Characters.GrayGoo;
	import classes.Characters.DrCalnor;
	import classes.Characters.JaneriaCore;
	import classes.Characters.JaneriaSpawn;
	import classes.Characters.Kane;
	import classes.Characters.Kaska;
	import classes.Characters.KQTwinA;
	import classes.Characters.NymFoe;
	import classes.Characters.NaleenHerm;
	import classes.Characters.PlayerCharacter;
	import classes.Characters.RaskvelFemale;
	import classes.Characters.RaskvelMale;
	import classes.Characters.SandWorm;
	import classes.Characters.Shizuya;
	import classes.Characters.StormguardMale;
	import classes.Characters.ZaikaMilkThief;
	import classes.Characters.ZilFemale;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.GameData.Pregnancy.Handlers.CockvinePregnancy;
	import classes.GLOBAL;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Items.Accessories.FlashGoggles;
	import classes.Items.Guns.HardlightBow;
	import classes.Items.Melee.SaurmorianHammer;
	import classes.Items.Miscellaneous.GrayMicrobots;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.*;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.ShittyShip;
	import classes.StringUtil;
	import classes.Util.RandomInCollection;
	
	/**
	 * Static library of combat attack implementations
	 * 
	 * TODO: Move dronetarget updating into the CombatContainer processing code.
	 * @author Gedan
	 */
	public class CombatAttacks 
	{
		public static function GetAttacksFor(target:Creature):Array
		{
			var atks:Array = [];
			
			for (var i:int = 0; i < a.length; i++)
			{
				var atk:SingleCombatAttack = a[i];
				
				if (!atk.IsDisplayable(target))
				{
					continue;
				}
				
				atks.push(atk);
			}
			
			return atks;
		}
		
		// For a given list of creatures, find the "best fit" for an automatically selected target for an attack that otherwise
		// doesn't require a target to be selected.
		// Basically, this is for AoE attacks that don't require an explicit target, but still make reference to an action taking place
		// against one specific enemy to start the chain of events.
		public static function GetBestPotentialTarget(hGroup:Array):Creature
		{
			if (hGroup.length == 1) return hGroup[0];
			
			var possibleCreature:Creature = null;
			
			for (var i:int = 0; i < hGroup.length; i++)
			{
				var currentCreature:Creature = hGroup[i] as Creature;
				
				if (currentCreature.isDefeated()) continue;
				
				if (currentCreature is PlayerCharacter && !(possibleCreature is PlayerCharacter))
				{
					possibleCreature = currentCreature;
				}
				else if (currentCreature.isUniqueInFight && (possibleCreature != null && !possibleCreature.isUniqueInFight))
				{
					possibleCreature = currentCreature;
				}
				else if (possibleCreature == null)
				{
					possibleCreature = currentCreature;
				}
			}
			
			return possibleCreature;
		}
		
		private static var o:CombatAttacks;
		private static var a:Array;
		
		{
			a = new Array();
			o = new CombatAttacks();
		}
		
		public function CombatAttacks()
		{
			// Headbutt
			Headbutt = new SingleCombatAttack();
			Headbutt.ButtonName = "Headbutt";
			Headbutt.EnergyCost = 25;
			Headbutt.RequiresClass = GLOBAL.CLASS_MERCENARY;
			Headbutt.TooltipTitle = "Headbutt";
			Headbutt.TooltipBody = "A physique-based attack that does not benefit from weapon damage but has a chance of stunning your target.";
			Headbutt.SetAttackTypeFlags(SingleCombatAttack.ATF_MELEE, SingleCombatAttack.ATF_SPECIAL);
			Headbutt.Implementor = HeadbuttImpl; // headbutt
			a.push(Headbutt);
			
			// Rapidfire
			RapidFire = new SingleCombatAttack();
			RapidFire.ButtonName = "Rapid Fire";
			RapidFire.EnergyCost = 20;
			RapidFire.RequiresPerk = "Rapid Fire";
			RapidFire.DisabledIfEffectedBy = ["Disarmed"];
			RapidFire.TooltipTitle = "Rapid Fire";
			RapidFire.TooltipBody = "Perform a long range attack with two additional, low accuracy shots following it.";
			RapidFire.IsRangedBased = true;
			RapidFire.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			RapidFire.Implementor = RapidFireImpl; // rapidFire
			a.push(RapidFire);
			
			// Power Strike
			PowerStrike = new SingleCombatAttack();
			PowerStrike.ButtonName = "Power Strike";
			PowerStrike.EnergyCost = 20;
			PowerStrike.RequiresPerk = "Power Strike";
			PowerStrike.DisabledIfEffectedBy = ["Disarmed"];
			PowerStrike.TooltipTitle = "Power Strike";
			PowerStrike.TooltipBody = "Strike once with a melee weapon for 200% of normal damage.";
			PowerStrike.IsMeleeBased = true;
			PowerStrike.SetAttackTypeFlags(SingleCombatAttack.ATF_MELEE, SingleCombatAttack.ATF_SPECIAL);
			PowerStrike.Implementor = PowerStrikeImpl; // powerStrike
			a.push(PowerStrike);
			
			// Take Cover
			TakeCover = new SingleCombatAttack();
			TakeCover.ButtonName = "Take Cover";
			TakeCover.EnergyCost = 20;
			TakeCover.RequiresPerk = "Take Cover";
			TakeCover.TooltipTitle = "Take Cover";
			TakeCover.TooltipBody = "Increased ranged evasion to 90% for three turns.";
			TakeCover.SetAttackTypeFlags(SingleCombatAttack.ATF_SPECIAL);
			TakeCover.Implementor = TakeCoverImpl; // takeCover;
			TakeCover.RequiresTarget = false;
			a.push(TakeCover);
			
			// Carpet Grenades
			CarpetGrenades = new SingleCombatAttack();
			CarpetGrenades.ButtonName = "C. Grenades";
			CarpetGrenades.EnergyCost = 25;
			CarpetGrenades.RequiresPerk = "Carpet Grenades";
			CarpetGrenades.DisabledIfEffectedBy = ["Disarmed"];
			CarpetGrenades.TooltipTitle = "Carpet Grenades";
			CarpetGrenades.TooltipBody = "An attack that is extra effective against multiple foes. Its damage is increased by level and intelligence.";
			CarpetGrenades.SetAttackTypeFlags(SingleCombatAttack.ATF_AOE, SingleCombatAttack.ATF_SPECIAL);
			CarpetGrenades.Implementor = CarpetGrenadesImpl; // carpetGrenades
			CarpetGrenades.RequiresTarget = false;
			a.push(CarpetGrenades);
			
			// Det. Charge
			DetonationCharge = new SingleCombatAttack();
			DetonationCharge.ButtonName = "Det. Charge";
			DetonationCharge.EnergyCost = 25;
			DetonationCharge.RequiresPerk = "Detonation Charge";
			DetonationCharge.DisabledIfEffectedBy = ["Disarmed"];
			DetonationCharge.TooltipTitle = "Detonation Charge";
			DetonationCharge.TooltipBody = "Deals a high amount of level and intelligence-based thermal damage against a single foe.";
			DetonationCharge.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			DetonationCharge.Implementor = DetonationChargeImpl; // detCharge
			a.push(DetonationCharge);
			
			// Second Wind
			SecondWind = new SingleCombatAttack();
			SecondWind.ButtonName = "Second Wind";
			SecondWind.RequiresLevel = 5;
			SecondWind.RequiresPerk = "Second Wind";
			SecondWind.DisabledIfEffectedBy = ["Used Second Wind"];
			SecondWind.TooltipTitle = "Second Wind";
			SecondWind.TooltipBody = "Regenerate 50% of your maximum HP and energy once per battle! An invaluable ability for the mercenary in the field.";
			SecondWind.SetAttackTypeFlags(SingleCombatAttack.ATF_SPECIAL);
			SecondWind.Implementor = SecondWindImpl;
			SecondWind.RequiresTarget = false;
			a.push(SecondWind);
			
			// Paralyzing Shock
			ParalyzingShock = new SingleCombatAttack();
			ParalyzingShock.ButtonName = "P. Shock";
			ParalyzingShock.EnergyCost = 25;
			ParalyzingShock.RequiresClass = GLOBAL.CLASS_ENGINEER;
			ParalyzingShock.TooltipTitle = "Paralyzing Shock";
			ParalyzingShock.TooltipBody = "An ability with an intelligence-based chance to paralyze a single foe. Enemies with higher physique scores will be more likely to resist its effects!";
			ParalyzingShock.IsRangedBased = true;
			ParalyzingShock.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			ParalyzingShock.Implementor = ParalyzingShockImpl;
			a.push(ParalyzingShock);
			
			// Volley
			Volley = new SingleCombatAttack();
			Volley.ButtonName = "Volley";
			Volley.EnergyCost = 20;
			Volley.RequiresPerk = "Volley";
			Volley.DisabledIfEffectedBy = ["Disarmed"];
			Volley.IsRangedBased = true;
			Volley.TooltipTitle = "Volley";
			Volley.TooltipBody = "Perform a ranged attack with an additional, low-accuracy attack added on. Can blind foes based upon aim and the target’s reflexes, but only if done with <b>an energy weapon.</b>";
			Volley.Implementor = VolleyImpl;
			Volley.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(Volley);

			// ChargeWeapon
			ChargeWeapon = new SingleCombatAttack();
			ChargeWeapon.ButtonName = "Charge Weap.";
			ChargeWeapon.EnergyCost = 15;
			ChargeWeapon.RequiresPerk = "Charge Weapon";
			ChargeWeapon.DisabledIfEffectedBy = ["Disarmed","Charged Weapon"];
			ChargeWeapon.IsRangedBased = false;
			ChargeWeapon.TooltipTitle = "Charge Weapon";
			ChargeWeapon.TooltipBody = "Electrify a melee weapon for the duration of the battle and take a single, low-accuracy swipe with the charged weapon.";
			ChargeWeapon.Implementor = chargeWeaponImpl;
			ChargeWeapon.SetAttackTypeFlags(SingleCombatAttack.ATF_MELEE, SingleCombatAttack.ATF_SPECIAL);
			a.push(ChargeWeapon);
			
			// Overcharge
			Overcharge = new SingleCombatAttack();
			Overcharge.ButtonName = "Overcharge";
			Overcharge.EnergyCost = 20;
			Overcharge.RequiresPerk = "Overcharge";
			Overcharge.DisabledIfEffectedBy = ["Disarmed"];
			Overcharge.RequiresDamageFlags = [DamageFlag.ENERGY_WEAPON];
			Overcharge.IsRangedBased = true;
			Overcharge.TooltipTitle = "Overcharge";
			Overcharge.TooltipBody = "A powerful ranged attack, Overcharge deals [altTooltip Overcharge]% damage and has a chance of stunning. Higher intelligence increases the chance of successfully stunning your foe.";
			Overcharge.Implementor = OverchargeImpl;
			Overcharge.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(Overcharge);
			
			// Deflector Regen
			DeflectorRegeneration = new SingleCombatAttack();
			DeflectorRegeneration.ButtonName = "D. Regen";
			DeflectorRegeneration.EnergyCost = 0;
			DeflectorRegeneration.RequiresPerk = "Deflector Regeneration";
			DeflectorRegeneration.DisabledIfEffectedBy = ["Tech Shield CD"];
			DeflectorRegeneration.ExtendedAvailabilityCheck = function():Boolean {
				return kGAMECLASS.pc.hasShields();
			}
			DeflectorRegeneration.TooltipTitle = "Deflector Regeneration";
			DeflectorRegeneration.TooltipBody = "Restores a portion of your shields and energy every turn for four turns. Higher intelligence will increase the amount.\n\n<b>Once per combat.</b>";
			DeflectorRegeneration.RequiresTarget = false;
			DeflectorRegeneration.Implementor = DeflectorRegenerationImpl;
			DeflectorRegeneration.SetAttackTypeFlags(SingleCombatAttack.ATF_SPECIAL);
			a.push(DeflectorRegeneration);
			
			// Power Surge
			PowerSurge = new SingleCombatAttack();
			PowerSurge.ButtonName = "P. Surge";
			PowerSurge.EnergyCost = 0;
			PowerSurge.RequiresPerk = "Power Surge";
			PowerSurge.DisabledIfEffectedBy = ["Tech Shield CD"];
			PowerSurge.ExtendedAvailabilityCheck = function():Boolean {
				return kGAMECLASS.pc.hasShields();
			}
			PowerSurge.TooltipTitle = "Power Surge";
			PowerSurge.TooltipBody = "Restores a moderate amount of shields and energy based on intelligence.\n\n<b>Once per combat.</b>";
			PowerSurge.RequiresTarget = false;
			PowerSurge.Implementor = PowerSurgeImpl;
			PowerSurge.SetAttackTypeFlags(SingleCombatAttack.ATF_SPECIAL);
			a.push(PowerSurge);
			
			// Thermal Disruptor
			ThermalDisruptor = new SingleCombatAttack();
			ThermalDisruptor.ButtonName = "T. Disrupt";
			ThermalDisruptor.EnergyCost = 25;
			ThermalDisruptor.RequiresPerk = "Thermal Disruptor";
			ThermalDisruptor.DisabledIfEffectedBy = ["Disarmed"];
			ThermalDisruptor.TooltipTitle = "Thermal Disruptor";
			ThermalDisruptor.TooltipBody = "Deals a large amount of intelligence-based, thermal damage to a single target before spreading out to nearby foes.";
			ThermalDisruptor.Implementor = ThermalDisruptorImpl;
			ThermalDisruptor.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(ThermalDisruptor);
			
			// Grav Disruptor
			GravidicDisruptor = new SingleCombatAttack();
			GravidicDisruptor.ButtonName = "G. Disrupt";
			GravidicDisruptor.EnergyCost = 25;
			GravidicDisruptor.RequiresPerk = "Gravidic Disruptor";
			GravidicDisruptor.DisabledIfEffectedBy = ["Disarmed"];
			GravidicDisruptor.TooltipTitle = "Gravidic Disruptor";
			GravidicDisruptor.TooltipBody = "Deals a moderate amount of intelligence-based, unresistable damage to a single target before spreading out to nearby foes.";
			GravidicDisruptor.Implementor = GravidicDisruptorImpl;
			GravidicDisruptor.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(GravidicDisruptor);
			
			// Shield Hack
			ShieldHack = new SingleCombatAttack();
			ShieldHack.ButtonName = "S. Hack";
			ShieldHack.EnergyCost = 25;
			ShieldHack.RequiresPerk = "Shield Hack";
			ShieldHack.TooltipTitle = "Shield Hack";
			ShieldHack.TooltipBody = "An attack that deals a high amount of electric-typed damage to a target’s shields. Damage is increased by intelligence.";
			ShieldHack.Implementor = ShieldHackImpl;
			ShieldHack.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(ShieldHack);
			
			// Weapon Hack
			WeaponHack = new SingleCombatAttack();
			WeaponHack.ButtonName = "W. Hack";
			WeaponHack.EnergyCost = 10;
			WeaponHack.RequiresPerk = "Weapon Hack";
			WeaponHack.TooltipTitle = "Weapon Hack";
			WeaponHack.TooltipBody = "Attempt to neutralize a foe’s <b>energy weapon</b> using your intelligence. Smarter foes will resist your attempts.";
			WeaponHack.Implementor = WeaponHackImpl;
			WeaponHack.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(WeaponHack);

			// Charge Shield
			ChargeShield = new SingleCombatAttack();
			ChargeShield.ButtonName = "Charge Sh.";
			ChargeShield.EnergyCost = 15;
			ChargeShield.RequiresPerk = "Charge Shield";
			ChargeShield.RequiresTarget = false;
			ChargeShield.DisabledIfEffectedBy = ["Charged Shield"];
			ChargeShield.TooltipTitle = "Charge Shield";
			ChargeShield.TooltipBody = "Charge your shield so that it can overload when struck, creating flashes bright enough to blind the unwary - or zap those stupid enough to try for a punch.";
			ChargeShield.Implementor = ChargeShieldImpl;
			ChargeShield.SetAttackTypeFlags(SingleCombatAttack.ATF_SPECIAL);
			a.push(ChargeShield);
			
			// PocketSand/Flash Grenade
			PocketSand = new SingleCombatAttack();
			PocketSand.ButtonName = "P. Sand";
			PocketSand.EnergyCost = 10;
			PocketSand.RequiresClass = GLOBAL.CLASS_SMUGGLER;
			PocketSand.RequiresTarget = false;
			PocketSand.TooltipTitle = "Pocket Sand";
			PocketSand.TooltipBody = "Produce some sand from your level and use it to blind your enemies! Better aim will help you land the attack.";
			PocketSand.Implementor = PocketSandImp;
			PocketSand.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL, SingleCombatAttack.ATF_AOE);
			PocketSand.ExtendedDisplayabilityCheck = function(target:Creature):Boolean {
				return kGAMECLASS.silly;
			};
			a.push(PocketSand);
			
			FlashGrenade = new SingleCombatAttack();
			FlashGrenade.ButtonName = "F. Grenade";
			FlashGrenade.EnergyCost = 10;
			FlashGrenade.RequiresClass = GLOBAL.CLASS_SMUGGLER;
			FlashGrenade.RequiresTarget = false;
			FlashGrenade.TooltipTitle = "Flash Grenade";
			FlashGrenade.TooltipBody = "Produce a rechargable flash grenade and use it to blind your enemy. Better aim will increase the chance of success.";
			FlashGrenade.Implementor = FlashGrenadeImpl;
			FlashGrenade.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL, SingleCombatAttack.ATF_AOE);
			FlashGrenade.ExtendedDisplayabilityCheck = function(target:Creature):Boolean {
				return !kGAMECLASS.silly;
			};
			a.push(FlashGrenade);
			
			// Low Blow
			LowBlow = new SingleCombatAttack();
			LowBlow.ButtonName = "Low Blow";
			LowBlow.EnergyCost = 15;
			LowBlow.RequiresPerk = "Low Blow";
			LowBlow.TooltipTitle = "Low Blow";
			LowBlow.TooltipBody = "A melee ability with a physique-based chance of stunning your target. It does low damage, and stronger foes will be more able to resist being stunned.";
			LowBlow.Implementor = LowBlowImpl;
			LowBlow.SetAttackTypeFlags(SingleCombatAttack.ATF_MELEE, SingleCombatAttack.ATF_SPECIAL);
			a.push(LowBlow);
			
			// Disarming Shot
			DisarmingShot = new SingleCombatAttack();
			DisarmingShot.ButtonName = "Disarm Shot";
			DisarmingShot.EnergyCost = 20;
			DisarmingShot.RequiresPerk = "Disarming Shot";
			DisarmingShot.DisabledIfEffectedBy = ["Disarmed"];
			DisarmingShot.Implementor = DisarmingShotImpl;
			DisarmingShot.TooltipTitle = "Disarming Shot";
			DisarmingShot.TooltipBody = "A single shot that will disable your target’s usage of traditional weapons - if it hits. The strike has the same chance of hitting as any other shot. Note that this does not effect creatures or machines with integrated weaponry.";
			DisarmingShot.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(DisarmingShot);
			
			// Stealth
			StealthFieldGenerator = new SingleCombatAttack();
			StealthFieldGenerator.ButtonName = "Stealth Field";
			StealthFieldGenerator.EnergyCost = 20;
			StealthFieldGenerator.RequiresPerk = "Stealth Field Generator";
			StealthFieldGenerator.DisabledIfEffectedBy = ["Stealth Field Generator"];
			StealthFieldGenerator.Implementor = StealthFieldGeneratorImpl;
			StealthFieldGenerator.TooltipTitle = "Stealth Field Generator";
			StealthFieldGenerator.TooltipBody = "Creates a stealth field that greatly increases your evasion by 80% for a few turns.";
			StealthFieldGenerator.RequiresTarget = false;
			StealthFieldGenerator.SetAttackTypeFlags(SingleCombatAttack.ATF_SPECIAL);
			a.push(StealthFieldGenerator);
			
			// Grenade
			Grenade = new SingleCombatAttack();
			Grenade.ButtonName = "Grenade";
			Grenade.EnergyCost = 25;
			Grenade.RequiresPerk = "Grenade";
			Grenade.DisabledIfEffectedBy = ["Disarmed"];
			Grenade.Implementor = GrenadeImpl;
			Grenade.TooltipTitle = "Grenade";
			Grenade.RequiresTarget = false;
			Grenade.SetAttackTypeFlags(SingleCombatAttack.ATF_AOE, SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			Grenade.TooltipBody = "Does a moderate amount of intelligence-based thermal and kinetic damage to your enemies.";
			a.push(Grenade);
			
			// GasGren
			GasGrenade = new SingleCombatAttack();
			GasGrenade.ButtonName = "Gas Grenade";
			GasGrenade.EnergyCost = 25;
			GasGrenade.RequiresPerk = "Gas Grenade";
			GasGrenade.DisabledIfEffectedBy = ["Disarmed"];
			GasGrenade.Implementor = GasGrenadeImpl;
			GasGrenade.TooltipTitle = "Gas Grenade";
			GasGrenade.RequiresTarget = false;
			GasGrenade.TooltipBody = "An unavoidable attack that deals a fair amount of lust damage to your enemies. Increases slightly with level.";
			GasGrenade.SetAttackTypeFlags(SingleCombatAttack.ATF_AOE, SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(GasGrenade);
			
			// Smuggled Stim
			SmuggledStimulant = new SingleCombatAttack();
			SmuggledStimulant.ButtonName = "S. Stimulant";
			SmuggledStimulant.DisabledIfEffectedBy = ["Used Smuggled Stimulant"];
			SmuggledStimulant.RequiresPerk = "Smuggled Stimulant";
			SmuggledStimulant.Implementor = SmuggleStimulatImpl;
			SmuggledStimulant.TooltipTitle = "Smuggled Stimulant";
			SmuggledStimulant.TooltipBody = "Inject yourself with a smuggled stimulant, causing you to recover 25 energy a turn for three turns.";
			SmuggledStimulant.SetAttackTypeFlags(SingleCombatAttack.ATF_SPECIAL);
			SmuggledStimulant.RequiresTarget = false;
			a.push(SmuggledStimulant);
			
			// Burst of Energy
			BurstOfEnergy = new SingleCombatAttack();
			BurstOfEnergy.ButtonName = "Bst. Energy";
			BurstOfEnergy.DisabledIfEffectedBy = ["Used Burst of Energy"];
			BurstOfEnergy.RequiresPerk = "Burst of Energy";
			BurstOfEnergy.Implementor = BurstOfEnergyImpl;
			BurstOfEnergy.TooltipTitle = "Burst of Energy";
			BurstOfEnergy.TooltipBody = "Get a burst of energy, recovering 60 energy.\n\nYou may only do this once per encounter.";
			BurstOfEnergy.RequiresTarget = false;
			BurstOfEnergy.SetAttackTypeFlags(SingleCombatAttack.ATF_SPECIAL);
			a.push(BurstOfEnergy);
			
			// Mag Binders
			MagBinders = new SingleCombatAttack();
			MagBinders.ButtonName = "MagBindrs";
			MagBinders.EnergyCost = 25;
			MagBinders.IsRangedBased = true;
			MagBinders.RequiresPerk = "Mag Binders";
			MagBinders.DisabledIfEffectedBy = ["Disarmed"];
			MagBinders.Implementor = MagBindersImpl;
			MagBinders.TooltipTitle = "Mag Binders";
			MagBinders.RequiresTarget = true;
			MagBinders.TooltipBody = "Throw a set of magnetic restraints at your enemy, dealing light electricity damage and potentially stunning them for up to three turns. Damage and hit chances are based off of reflexes.";
			MagBinders.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(MagBinders);

			// Concussive Shot
			ConcussiveShot = new SingleCombatAttack();
			ConcussiveShot.ButtonName = "C. Shot";
			ConcussiveShot.DisabledIfEffectedBy = ["Disarmed"];
			ConcussiveShot.EnergyCost = 25;
			ConcussiveShot.IsRangedBased = true;
			ConcussiveShot.RequiresItemFlags = [GLOBAL.ITEM_FLAG_BOW_WEAPON];
			ConcussiveShot.RequiresPerk = "Concussive Shot";
			ConcussiveShot.ExtendedDisplayabilityCheck = function():Boolean {
				return kGAMECLASS.pc.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON);
			}
			ConcussiveShot.TooltipTitle = "Concussive Shot";
			ConcussiveShot.TooltipBody = "Fire an explosive arrow at your target, potentially stunning them for 1-2 rounds.";
			ConcussiveShot.Implementor = ConcussiveShotImpl;
			ConcussiveShot.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(ConcussiveShot);
			
			// Multi-Arrow
			/* Fen note: NOPE. I do not want to go down the road of every weapon having their own special attacks. If we were going that route, we shouldnt have had classes.
			MultiArrow = new SingleCombatAttack();
			MultiArrow.ButtonName = "MultiArrow";
			MultiArrow.DisabledIfEffectedBy = ["Disarmed"];
			MultiArrow.EnergyCost = 30;
			MultiArrow.IsRangedBased = true;
			MultiArrow.RequiresTarget = false;
			MultiArrow.RequiresItemFlags = [GLOBAL.ITEM_FLAG_BOW_WEAPON];
			MultiArrow.ExtendedDisplayabilityCheck = function():Boolean {
				return (kGAMECLASS.pc.rangedWeapon is HardlightBow);
			}
			MultiArrow.TooltipTitle = "Multi-Arrow";
			MultiArrow.TooltipBody = "Fire a small volley of arrows from your hardlight bow against multiple enemies.";
			MultiArrow.Implementor = MultiArrowImpl;
			MultiArrow.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(MultiArrow);*/
			
			// Goozooka
			GoozookaAttack = new SingleCombatAttack();
			GoozookaAttack.ButtonName = "Goozooka";
			GoozookaAttack.DisabledIfEffectedBy = ["Disarmed"];
			GoozookaAttack.IsRangedBased = true;
			GoozookaAttack.ExtendedDisplayabilityCheck = function():Boolean {
				return kGAMECLASS.pc.hasKeyItem("Goozooka");
			}
			GoozookaAttack.ExtendedAvailabilityCheck = function():Boolean {
				return kGAMECLASS.pc.hasItemByClass(GrayMicrobots);
			}
			GoozookaAttack.TooltipTitle = "Goozooka";
			GoozookaAttack.TooltipBody = "Fire a Gray Goo at your enemy for the princely sum of a single sample of Gray Microbots.";
			GoozookaAttack.Implementor = GoozookaAttackImpl;
			GoozookaAttack.SetAttackTypeFlags(SingleCombatAttack.ATF_RANGED, SingleCombatAttack.ATF_SPECIAL);
			a.push(GoozookaAttack);
			
			// Resin
			ResinDefense = new SingleCombatAttack();
			ResinDefense.ButtonName = "Resin";
			ResinDefense.EnergyCost = 40;
			ResinDefense.ExtendedDisplayabilityCheck = function():Boolean {
				return (kGAMECLASS.pc.hasPerk("Resin"));
			}
			ResinDefense.ExtendedAvailabilityCheck = function():Boolean {
				return !kGAMECLASS.pc.hasStatusEffect("Resin");
			}
			ResinDefense.TooltipTitle = "Resin";
			ResinDefense.RequiresTarget = false;
			ResinDefense.TooltipBody = "Harden your bark skin with amber to raise your defenses for a few rounds. The sap’s aroma may also affect the enemy’s lust.";
			ResinDefense.Implementor = ResinDefenseImpl;
			ResinDefense.SetAttackTypeFlags(SingleCombatAttack.ATF_SPECIAL);
			a.push(ResinDefense);
			
			// Pollen Veil
			PollenVeil = new SingleCombatAttack();
			PollenVeil.ButtonName = "Pollen Veil";
			PollenVeil.EnergyCost = 40;
			PollenVeil.ExtendedDisplayabilityCheck = function():Boolean {
				return (kGAMECLASS.pc.perkv1("Flower Power") > 0);
			}
			PollenVeil.ExtendedAvailabilityCheck = function():Boolean {
				return !kGAMECLASS.pc.hasStatusEffect("Pollen Veil");
			}
			PollenVeil.TooltipTitle = "Pollen Veil";
			PollenVeil.RequiresTarget = false;
			PollenVeil.TooltipBody = "Use your special pollen spores to gradually raise your enemy’s lust for a few rounds.";
			PollenVeil.Implementor = PollenVeilImpl;
			PollenVeil.SetAttackTypeFlags(SingleCombatAttack.ATF_SPECIAL);
			a.push(PollenVeil);
			
			// Shared NPC Attacks
			// Attacks only intended to be used by NPCs!
			AphrodisiacDarts = new SingleCombatAttack();
			AphrodisiacDarts.IsRangedBased = true;
			AphrodisiacDarts.Implementor = AphrodisiacDartsImpl;
			
			WrenchAttack = new SingleCombatAttack();
			WrenchAttack.IsMeleeBased = true;
			WrenchAttack.Implementor = WrenchAttachImpl;
			
			TripAttack = new SingleCombatAttack();
			TripAttack.IsMeleeBased = true;
			TripAttack.Implementor = TripAttackImpl;

			//ANYBODY ATTACKS
			Evasion = new SingleCombatAttack();
			Evasion.RequiresTarget = false;
			Evasion.TooltipTitle = "Evade!";
			Evasion.TooltipBody = "Focus on evasion rather than firing any weapon systems. Dodge, duck, dip, dive, and aileron roll!\n\n(+50 evasion.)";
			Evasion.Implementor = EvasionImpl;

			Recharge = new SingleCombatAttack();
			Recharge.RequiresTarget = false;
			Recharge.TooltipTitle = "Recharge!";
			Recharge.TooltipBody = "Focus on recharging your ship’s capacitors instead of fighting back. Note that this happens automatically if you select “Battle!” without any weapons enabled.\n\n(Double energy gain.)";
			Recharge.Implementor = RechargeImpl;
		}
		
		/**
		 * This is a SINGLE ranged attack with no "before" or "after" stuff.
		 * It does not call or repeat itself- this is a single application of damage
		 * following basic ranged attack rules.
		 * @param	attacker
		 * @param	target
		 */
		public static function SingleRangedAttackImpl(attacker:Creature, target:Creature, asFlurry:Boolean = false, special:String = "ranged"):Boolean
		{
			if(target is Kane && target.hasStatusEffect("KANE RANGED PREP") && !target.hasStatusEffect("KANE_AI_SKIP") && !target.isImmobilized())
			{
				kGAMECLASS.kaneRangedInterrupt();
				var d:TypeCollection = target.meleeDamage();
				damageRand(d, 15);
				applyDamage(d, target, attacker, "melee");
				target.createStatusEffect("KANE_AI_SKIP");
				return false;
			}
			if(	(target is Kane && target.hasStatusEffect("KANE_AI_SKIP"))
			||	(target is BothriocQuadomme && target.statusEffectv2("Ranged Evade") > 0)
			)
			{
				output("Further action is interrupted!");
				return false;
			}
			if(target is SandWorm && kGAMECLASS.attackSandworm(target, attacker, special))
			{
				return false;
			}
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return false;
			}
			if (rangedCombatMiss(attacker, target))
			{
				if (target.customDodge.length > 0)
				{
					if (attacker is PlayerCharacter) output("You " + attacker.rangedWeapon.attackVerb + " at " + target.getCombatName() + ". " + target.customDodge);
					else output(StringUtil.capitalize(attacker.getCombatName(), false) + " take" + (attacker.isPlural ? "" : "s") + " " + indefiniteArticle(attacker.rangedWeapon.attackNoun) + " at " + target.getCombatName() + ". " + target.customDodge);
				}
				else if (attacker is PlayerCharacter) output("You " + attacker.rangedWeapon.attackVerb + " at " + target.getCombatName() + " with your " + attacker.rangedWeapon.longName + ", but just can’t connect.");
				else if (target is PlayerCharacter) output("You manage to avoid " + possessive(attacker.getCombatName()) + " " + attacker.rangedWeapon.attackNoun + ".");
				else if (!target.isPlural) output(StringUtil.capitalize(target.getCombatName(), false) + " manages to avoid " + possessive(attacker.getCombatName()) + " " + attacker.rangedWeapon.attackNoun + ".");
				else output(StringUtil.capitalize(target.getCombatName(), false) + " manage to avoid " + possessive(attacker.getCombatName()) + " " + attacker.rangedWeapon.attackNoun + ".");
				return false;
			}
			
			if (blindMiss(attacker, target, false))
			{
				if (attacker is PlayerCharacter) output("Your blind-fired shot doesn’t manage to connect.");
				else output(StringUtil.capitalize(possessive(attacker.getCombatName()), false) + " blind " + attacker.rangedWeapon.attackNoun + " fails to connect!");
				return false;
			}
			
			if (asFlurry && rand(100) <= 45 && !target.isImmobilized() && !attacker.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS))
			{
				if (target.customDodge.length > 0)
				{
					if (attacker is PlayerCharacter) output("You take " + indefiniteArticle(attacker.rangedWeapon.attackNoun) + " at " + target.getCombatName() + ". " + target.customDodge);
					else output(StringUtil.capitalize(attacker.getCombatName(), false) + " take" + (attacker.isPlural ? "" : "s") + " " + indefiniteArticle(attacker.rangedWeapon.attackNoun) + " at " + target.getCombatName() + ". " + target.customDodge);
				}
				else if (attacker is PlayerCharacter) output("You " + attacker.rangedWeapon.attackVerb + " at " + target.getCombatName() + " with your " + attacker.rangedWeapon.longName + ", but just can’t connect.");
				else if (target is PlayerCharacter) output("You manage to avoid " + possessive(attacker.getCombatName()) + " " + attacker.rangedWeapon.attackNoun + ".");
				else output(StringUtil.capitalize(target.getCombatName(), false) + " manage" + (target.isPlural ? "" : "s") + " to avoid " + possessive(attacker.getCombatName()) + " " + attacker.rangedWeapon.attackNoun + ".");
				return false;
			}
			if (target is NymFoe && target.hasStatusEffect("Bouncy!"))
			{
				var k:TypeCollection = attacker.rangedDamage();
				if(k.kinetic.damageValue > 0)
				{
					if(rand(100)+1 <= target.statusEffectv1("Bouncy!") * 20)
					{
						kGAMECLASS.bouncyProc(true);
						return false;
					}
				}
			}
			// Dom subsequently evades:
			if(target is BothriocQuadomme && target.hasStatusEffect("Ranged Evade"))
			{
				output("The bothrioc lithely swings to one side, crowing with delight as it easily avoids your shot.");
				target.setStatusValue("Ranged Evade", 1, 0);
				target.setStatusValue("Ranged Evade", 2, 1);
				return false;
			}
			// We made it here, the attack landed
			
			if (attacker is PlayerCharacter) output("You land a hit on " + target.getCombatName() + " with your " + attacker.rangedWeapon.longName + "!");
			else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " connect with their " + plural(attacker.rangedWeapon.longName) + "!");
			else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " hits you with " + attacker.getCombatPronoun("hisher") + " " + attacker.rangedWeapon.longName + "!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " connects with " + attacker.getCombatPronoun("hisher") + " " + attacker.rangedWeapon.longName + "!");
			
			var damage:TypeCollection = attacker.rangedDamage();
			damageRand(damage, 15);
			applyDamage(damage, attacker, target, special);

			if(attacker.hasPerk("Cloak and Dagger"))
			{
				if(!attacker.hasStatusEffect("DaggerCloaked")) attacker.createStatusEffect("DaggerCloaked", 0, 0, 0, 0, true, "", "", true, 0);
			}

			if(target is Kane) 
			{
				kGAMECLASS.kaneRangedReaction();
				target.removeStatusEffect("KANE MELEE PREP");
				target.createStatusEffect("KANE RANGED PREP");
			}
			if(target is BothriocQuadomme && !target.hasStatusEffect("Ranged Evade")) 
			{
				kGAMECLASS.quadommeDoubleTeam(attacker, target, true);
			}
			if (target is KQTwinA && target.hasStatusEffect("Gonna Gangbang")) (target as KQTwinA).interruptGangbang();
			
			return true;
		}
		public static function SingleRangedShipAttackImpl(attacker:Creature, target:Creature, weapon:ItemSlotClass, asFlurry:Boolean = false, special:String = "ranged", npcShooter:String = ""):Boolean
		{
			var PCAttacker:Boolean = attacker.hasPerk("PCs");
			var PCTarget:Boolean = target.hasPerk("PCs");

			//Power stuff
			if(special != "free")
			{
				if(attacker.energy() - weapon.shieldDefense < 0)
				{
					if(PCAttacker) 
					{
						if(npcShooter == "") output("You would like to " + weapon.attackVerb + " your " + weapon.longName + ", but lack the power to do so.");
						else output(StringUtil.capitalize(npcShooter, false) + " lacks the power to " + weapon.attackVerb + " " + weapon.description + ".");
					}
					else output(StringUtil.capitalize(attacker.getCombatName(), false) + " cycles a flicker of power through its " + weapon.longName + ", but not enough to fire.");
					return false; 
				}
				//We can afford the energy, now spend it.
				attacker.energy(-weapon.shieldDefense);
			}

			//Do we miss
			if(rand(100) + 1 + (attacker as ShittyShip).shipAccuracy() < (target as ShittyShip).shipEvasion())
			{
				if (target.customDodge.length > 0 && !PCTarget)
				{
					if (PCAttacker) 
					{
						if(npcShooter == "") output("You " + weapon.attackVerb + " at " + target.getCombatName() + ". " + target.customDodge);
						else output(StringUtil.capitalize(npcShooter, false) + " fires " + weapon.description + ". " + target.customDodge);
					}
					else output(StringUtil.capitalize(attacker.getCombatName(), false) + " " + weapon.attackVerb + (attacker.isPlural ? "" : "s") + " " + indefiniteArticle(weapon.longName) + " at " + target.getCombatName() + ". " + target.customDodge);
				}
				else if (PCAttacker) 
				{
					if(npcShooter == "") output("You " + weapon.attackVerb + " at " + target.getCombatName() + " with your " + weapon.longName + ", but it goes wide.");
					else output(StringUtil.capitalize(attacker.getCombatName(), false) + " misses " + target.getCombatName() + " with " + weapon.description);
				}
				else if (PCTarget) output("You manage to avoid " + possessive(attacker.getCombatName()) + " " + weapon.attackNoun + ".");
				else if (!target.isPlural) output(StringUtil.capitalize(target.getCombatName(), false) + " manages to avoid " + possessive(attacker.getCombatName()) + " " + weapon.attackNoun + ".");
				else output(StringUtil.capitalize(target.getCombatName(), false) + " manage to avoid " + possessive(attacker.getCombatName()) + " " + weapon.attackNoun + ".");
				return false;
			}
			/*
			if (blindMiss(attacker, target, false))
			{
				if (attacker is PlayerCharacter) output("Your blind-fired shot doesn’t manage to connect.");
				else output(StringUtil.capitalize(possessive(attacker.getCombatName()), false) + " blind " + attacker.rangedWeapon.attackNoun + " fails to connect!");
				return false;
			}*/
			
			//Flurry miss!
			if (asFlurry && rand(100) <= 45 && !target.isImmobilized() && !weapon.hasFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS))
			{
				if (target.customDodge.length > 0)
				{
					if (PCAttacker) 
					{
						if(npcShooter == "") output("You " + weapon.attackVerb + " at " + target.getCombatName() + ". " + target.customDodge);
						else output(StringUtil.capitalize(npcShooter, false) + " fires " + weapon.description + ". " + target.customDodge);
					}
					else output(StringUtil.capitalize(attacker.getCombatName(), false) + " " + weapon.attackVerb + (attacker.isPlural ? "" : "s") + " " + indefiniteArticle(weapon.longName) + " at " + target.getCombatName() + ". " + target.customDodge);
				}
				else if (PCAttacker) output("You " + weapon.attackVerb + " at " + target.getCombatName() + " with your " + weapon.longName + ", but just can’t connect.");
				else if (PCTarget) output("You manage to avoid " + possessive(attacker.getCombatName()) + " " + weapon.attackNoun + ".");
				else output(StringUtil.capitalize(target.getCombatName(), false) + " manage" + (target.isPlural ? "" : "s") + " to avoid " + possessive(attacker.getCombatName()) + " " + weapon.attackNoun + ".");
				return false;
			}
			// We made it here, the attack landed
			if (PCAttacker) 
			{
				if(npcShooter == "") output("You " + weapon.attackVerb + " your " + weapon.longName + " and hit " + target.getCombatName() + "!");
				else 
				{
					if(npcShooter == "Mitzi" && rand(3) == 0) 
					{
						var mitziTexts:Array = [];
						if(kGAMECLASS.mitzi.canLactate()) mitziTexts.push("The vibrations from firing " + weapon.description + " into " + target.getCombatName() + " release rivers of milk from Mitzi’s straining nipples.");
						if(kGAMECLASS.flags["MITZI_SOAKED"] != undefined) mitziTexts.push("Mitzi squirts <i>everywhere</i> while firing off " + weapon.description + " at " + target.getCombatName() + ".");;
						mitziTexts.push("Mitzi’s here to shoot " + weapon.description + " at " + target.getCombatName() + " and drink cum... and she’s all out of cum!");
						mitziTexts.push(("Mitzi creams herself from the vibrations caused by unloading " + weapon.description + " into " + target.getCombatName() + "!"));
						output(mitziTexts[rand(mitziTexts.length)]);
					}
					else output(StringUtil.capitalize(npcShooter, false) + " " + weapon.attackVerb + "s" + " " + target.getCombatName() + " with " + weapon.description + "!");
				}
			}
			else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " connect with their " + plural(weapon.longName) + "!");
			else if (PCTarget) output(StringUtil.capitalize(attacker.getCombatName(), false) + " hits you with its " + weapon.longName + "!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " strikes " + target.getCombatName() + " with its " + weapon.longName + "!");
			
			var damage:TypeCollection = (attacker as ShittyShip).shipWeaponDamage(weapon);
			damageRand(damage, 15);
			applyDamage(damage, attacker, target, "minimal");	
			return true;
		}
		
		public static function SingleMeleeAttackImpl(attacker:Creature, target:Creature, asFlurry:Boolean = false, special:String = "melee"):Boolean
		{
			if(target is Kane && target.hasStatusEffect("KANE MELEE PREP") && !target.hasStatusEffect("KANE_AI_SKIP") && !target.isImmobilized())
			{
				kGAMECLASS.kaneMeleeInterrupt();
				var e:TypeCollection = target.meleeDamage();
				damageRand(e, 15);
				applyDamage(e, target, attacker, special);
				target.createStatusEffect("KANE_AI_SKIP");
				return false;
			}
			if(	(target is Kane && target.hasStatusEffect("KANE_AI_SKIP"))
			||	(target is BothriocQuadomme && target.statusEffectv2("Melee Counter") > 0)
			)
			{
				output("Further action is interrupted!");
				return false;
			}
			if(target.hasStatusEffect("Counters Melee") && !target.isImmobilized())
			{
				if(meleeCounterResults(attacker,target)) return false;
			}
			if(target is BothriocQuadomme && !target.hasStatusEffect("Melee Hit")) 
			{
				if(kGAMECLASS.quadommeCounter(attacker, target)) return false;
			}
			if(target is SandWorm && kGAMECLASS.attackSandworm(target, attacker, special))
			{
				return false;
			}
			if(target.hasStatusEffect("Flying") && !target.isImmobilized() && (!attacker.hasPerk("Lunge") && !attacker.canFly()))
			{
				output(StringUtil.capitalize(possessive(attacker.getCombatName()), false) + " can’t reach " + target.getCombatName() + "! " + (!target.isPlural ? (target.mfn("He","She","It") + " is") : "They are") + " too high!");
				return false;
			}
			if (combatMiss(attacker, target))
			{
				if (target.customDodge.length > 0)
				{
					if (attacker is PlayerCharacter) output("You " + attacker.meleeWeapon.attackVerb + " at " + target.getCombatName() + ". " + target.customDodge);
					else output(StringUtil.capitalize(attacker.getCombatName(), false) + " take" + (attacker.isPlural ? "" : "s") + " " + indefiniteArticle(attacker.meleeWeapon.attackNoun) + " at " + target.getCombatName() + ". " + target.customDodge);
				}
				else if (attacker is PlayerCharacter) output("You " + attacker.meleeWeapon.attackVerb + " at " + target.getCombatName() + " with your " + attacker.meleeWeapon.longName + ", but just can’t connect.");
				else if (target is PlayerCharacter) output("You manage to avoid " + possessive(attacker.getCombatName()) + " " + attacker.meleeWeapon.attackNoun + ".");
				else output(StringUtil.capitalize(target.getCombatName(), false) + " manage" + (target.isPlural ? "" : "s") + " to avoid " + possessive(attacker.getCombatName()) + " " + attacker.meleeWeapon.attackNoun + ".");
				return false;
			}
			if (blindMiss(attacker, target, true))
			{
				if (attacker is PlayerCharacter) output("Your blind strike doesn’t manage to connect.");
				else output(" " + possessive(attacker.getCombatName()) + " blind " + attacker.meleeWeapon.attackNoun + " fails to connect!");
				return false;
			}
			
			if (asFlurry && rand(100) <= 45 && !target.isImmobilized() && !attacker.meleeWeapon.hasFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS))
			{
				if (target.customDodge.length > 1)
				{
					if (attacker is PlayerCharacter) output("You " + attacker.meleeWeapon.attackVerb + " at " + target.getCombatName() + ". " + target.customDodge);
					else output(StringUtil.capitalize(attacker.getCombatName(), false) + " take" + (attacker.isPlural ? "" : "s") + " " + indefiniteArticle(attacker.meleeWeapon.attackNoun) + " at " + target.getCombatName() + ". " + target.customDodge);
				}
				else if (attacker is PlayerCharacter) output("You " + attacker.meleeWeapon.attackVerb + " at " + target.getCombatName() + " with your " + attacker.meleeWeapon.longName + ", but just can’t connect.");
				else if (target is PlayerCharacter) output("You manage to avoid " + possessive(attacker.getCombatName()) + " " + attacker.meleeWeapon.attackNoun + ".");
				else output(StringUtil.capitalize(target.getCombatName(), false) + " manage" + (target.isPlural ? "" : "s") + " to avoid " + possessive(attacker.getCombatName()) + " " + attacker.meleeWeapon.attackNoun + ".");
				return false;
			}
			
			if (target is PlayerCharacter && kGAMECLASS.mimbraneFeetBonusEvade(target, attacker))
			{
				output(kGAMECLASS.mimbraneFeetBonusEvadeBonus());
				return false;
			}
			
			if (target is NymFoe && target.hasStatusEffect("Bouncy!"))
			{
				var k:TypeCollection = attacker.meleeDamage();
				if(k.kinetic.damageValue > 0)
				{
					if(rand(100)+1 <= target.statusEffectv1("Bouncy!") * 20)
					{
						kGAMECLASS.bouncyProc(false);
						return false;
					}
				}
			}
			if (target is ZilFemale) kGAMECLASS.flags["HIT_A_ZILGIRL"] = 1;
			
			if (attacker is PlayerCharacter) output("You land a hit on " + target.getCombatName() + " with your " + attacker.meleeWeapon.longName + "!");
			else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " connect with their " + plural(attacker.meleeWeapon.longName) + "!");
			else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " hits you with " + attacker.getCombatPronoun("hisher") + " " + attacker.meleeWeapon.longName + "!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " connects with " + attacker.getCombatPronoun("hisher") + " " + attacker.meleeWeapon.longName + "!");
			
			var d:TypeCollection = attacker.meleeDamage();
			damageRand(d, 15);
			
			// Damage adjustments
			if(attacker.meleeWeapon is SaurmorianHammer && (target.originalRace == "saurmorian" || target.race() == "saurmorian"))
			{
				var saurianScaleBreak:TypeCollection = new TypeCollection();
				saurianScaleBreak.kinetic.damageValue = 10;
				saurianScaleBreak.addFlag(DamageFlag.PENETRATING);
				d.add(saurianScaleBreak);
			}
			
			applyDamage(d, attacker, target, special);
			//Stormguard fly awayyyy
			if(target is StormguardMale)
			{
				if(!target.hasStatusEffect("Flyaway") && !target.hasStatusEffect("Flying")) target.createStatusEffect("Flyaway");
			}
			if(attacker.hasPerk("Lunge") && !target.isStaggered() && !target.isPlanted() && rand(10) == 0 && attacker.physique()/2 + rand(20) + 1 >= target.physique()/2 + 10)
			{
				applyStagger(target, 4 + rand(2));
				if(target is PlayerCharacter) output("\n<b>You are staggered by the lunge!</b>");
				else output("\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (target.isPlural ? "are" : "is") + " staggered by " + (attacker is PlayerCharacter ? "your" : "the") + " lunge!</b>");
			}
			if(attacker.hasPerk("Cloak and Dagger"))
			{
				if(!attacker.hasStatusEffect("DaggerCloaked")) attacker.createStatusEffect("DaggerCloaked", 0, 0, 0, 0, true, "", "", true, 0);
			}
			if(target is Kane) 
			{
				kGAMECLASS.kaneMeleeReaction();
				target.removeStatusEffect("KANE RANGED PREP");
				target.createStatusEffect("KANE MELEE PREP");
			}
			if (target is DrCalnor) (target as DrCalnor).counterHook(attacker, special);
			if (target is KQTwinA && target.hasStatusEffect("Gonna Gangbang")) (target as KQTwinA).interruptGangbang();

			return true;
		}
		
		/**
		 * This is a "regular" ranged attack.
		 * It handles various statuses that can cause a total failure (Disarm, Gunlock)
		 * and handles Multiple Shots by default. It should NOT be called by special attacks-
		 * they should call the SingleRangedAttackImpl themselves _directly_, which makes no
		 * assumptions.
		 * @param	attacker
		 * @param	target
		 */
		public static function RangedAttack(attacker:Creature, target:Creature):void
		{
			// Tutorial hook
			if (target is Celise)
			{
				output("Celise takes the hit, the wound instantly closing in with fresh, green goop. Her surface remains perfectly smooth and unmarred afterwards.");
				return;
			}
			if(target is SandWorm && kGAMECLASS.attackSandworm(target, attacker, "ranged"))
			{
				return;
			}
			
			if (attacker.hasStatusEffect("Disarmed"))
			{
				if (attacker is PlayerCharacter) output("You try to attack until you remember that you’ve been disarmed!");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " scrabble" + (attacker.isPlural ? "" : "s") + " about, trying to find " + attacker.getCombatPronoun("hisher") + " missing weapon.");
				return;
			}
			
			if (attacker.hasStatusEffect("Gunlock"))
			{
				if (attacker is PlayerCharacter) output("Your " + attacker.rangedWeapon.longName + " is currently disabled and unable to be used!");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " fiddle" + (attacker.isPlural ? "" : "s") + " fruitlessly with " + attacker.getCombatPronoun("hisher") + " disabled weapon.");
				return;
			}
			
			var numShots:int = 1;
			if (attacker.hasPerk("Shoot First") && !attacker.hasPerk("Multiple Shots") && CombatManager.getRoundCount() == 1 && attacker.rangedWeapon.attackImplementor == null)
			{
				output("<b>Shot first!</b>\n");
				numShots++;
			}
			
			if (attacker.hasPerk("Multiple Shots")) numShots = attacker.perkv1("Multiple Shots");
			if (attacker.hasStatusEffect("Bonus Shots")) numShots += attacker.statusEffectv1("Bonus Shots");
			
			var numFlurries:int = 0;
			if (attacker.hasPerk("Second Shot")) numFlurries++;
			
			var totalShots:int = numShots + numFlurries;
			for (var n:int = 0; n < totalShots; n++)
			{
				var asFlurry:Boolean = false;
				if (n != 0)
				{
					output("\n");
					if (numFlurries > 0)
					{
						numFlurries--;
						asFlurry = true;
					}
				}
				
				// concentratedFire(true) was buried in calculate damage- moved here
				// as makes way more sense to control it from here.
				concentratedFire(attacker, target, SingleRangedAttackImpl(attacker, target, asFlurry));
			}
			
			kGAMECLASS.playerMimbraneCloudAttack();
		}
		public static function performShipWeaponAttack(attacker:Creature, target:Creature, gun:ItemSlotClass,firingNPC:String = ""):void
		{
			var attacks:Number = 1;
			var PCAttacker:Boolean = attacker.hasPerk("PCs");

			//Multi Attacks!
			if(gun.hasFlag(GLOBAL.ITEM_FLAG_TWINSHOT)) attacks = 2;
			else if(gun.hasFlag(GLOBAL.ITEM_FLAG_BURSTSHOT)) attacks = 3;
			else if(gun.hasFlag(GLOBAL.ITEM_FLAG_QUADSHOT)) attacks = 4;

			//Abort if no power
			if(attacker.energy() - gun.shieldDefense < 0)
			{
				if(PCAttacker) 
				{
					if(firingNPC == "") output("You would like to " + gun.attackVerb + " your " + gun.longName + ", but lack the power to do so.");
					else output(StringUtil.capitalize(firingNPC) + " doesn’t have enough power to fire " + gun.description + ".");
				}
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " cycles a flicker of power through its " + gun.longName + ", but not enough to fire.");
				return;
			}

			//Actually fire all attacks
			for(var i:int = 0; i < attacks; i++)
			{	
				if(i > 0) 
				{
					output("\n");
					CombatAttacks.SingleRangedShipAttackImpl(attacker, target, gun, false, "free", firingNPC);
				}
				else CombatAttacks.SingleRangedShipAttackImpl(attacker, target, gun, false, "ranged", firingNPC);
			}
		}
		public static function pickCrewman(arg:Array):String
		{
			if(arg.length == 0) return "ERROR";
			var i:int = rand(arg.length);
			var crewman:String = arg[i];
			arg.splice(i,1);
			return crewman;
		}
		public static function ShipAttack(attacker:Creature, target:Creature):void
		{
			var item:ItemSlotClass = attacker.rangedWeapon;
			var attacks:Number = 0;

			var crews:Array = kGAMECLASS.getGunnersOnShipNames();
			var crewString:String = "";
			//var freeCrew:Number = crews.length;
			
			for(var i:int = 0; i < (attacker.inventory.length+3); i++)
			{
				if(i == attacker.inventory.length) item = attacker.meleeWeapon;
				else if(i == (attacker.inventory.length+1)) item = attacker.rangedWeapon;
				else if(i == (attacker.inventory.length+2)) item = attacker.accessory;
				else item = attacker.inventory[i];
				if(item.type == GLOBAL.RANGED_WEAPON && !item.hasFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF)) 
				{
					if(item.hasFlag(GLOBAL.ITEM_FLAG_TURRET)) 
					{
						crewString = pickCrewman(crews);
						//Get the crewman's name from the array and mention them shooting it.
						//No crew string? No fire!
						if(crewString == "ERROR") continue;
					}
					else crewString = "";
					if(attacks++ > 0) output("\n");
					//if(crewString != output(crewString + " mans the turret!\n");
					performShipWeaponAttack(attacker,target,item,crewString);
				}
			}
			if(attacks == 0)
			{
				output("Playing it cool, you keep your power load low to allow your reactor to recharge faster...");
				if(!attacker.hasStatusEffect("CHARGING_POWER")) attacker.createStatusEffect("CHARGING_POWER",0,0,0,0,true,"","",true);
			}
		}
		public static function MeleeAttack(attacker:Creature, target:Creature):void
		{
			if (target is Celise)
			{
				output(target.customBlock);
				return;
			}
			if(target is SandWorm && kGAMECLASS.attackSandworm(target, attacker, "melee"))
			{
				return;
			}
			
			if (attacker.hasStatusEffect("Disarmed"))
			{
				if (attacker is PlayerCharacter) output("You try to attack until you remember you got disarmed!");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " scrabble" + (attacker.isPlural ? "" : "s") + " about, trying to find " + attacker.getCombatPronoun("hisher") + " missing weapon.");
				return;
			}
			
			if (attacker.hasPerk("Riposte") && !attacker.hasStatusEffect("Riposting"))
			{
				attacker.createStatusEffect("Riposting", 0, 0, 0, 0, true, "", "", true, 0);
			}
			
			var numSwings:int = 1;
			
			var numFlurries:int = 0;
			if (attacker.hasPerk("Second Attack")) numFlurries++;
			
			var numHits:int = 0;
			if (attacker.hasPerk("Multiple Attacks")) numSwings = attacker.perkv1("Multiple Attacks");
			if (attacker.hasStatusEffect("Bonus Attacks")) numSwings += attacker.statusEffectv1("Bonus Attacks");
			
			var totalSwings:int = numSwings + numFlurries;
			for (var i:int = 0; i < totalSwings; i++)
			{
				var asFlurry:Boolean = false;
				if (i != 0)
				{
					output("\n");
					if (numFlurries > 0)
					{
						numFlurries--;
						asFlurry = true;
					}
				}
				
				if (SingleMeleeAttackImpl(attacker, target, asFlurry)) numHits++;
			}
			
			if (attacker.hasPerk("Cleave"))
			{
				var others:Array = CombatManager.getActorsGroup(target);
				
				for (i = 0; i < others.length; i++)
				{
					if (!others[i].isDefeated() && (others[i] != target || others[i].isPlural))
					{
						//if (numHits > 0 || i != 0) output("\n");
						output("\n");
						if (SingleMeleeAttackImpl(attacker, others[i], false)) numHits++;
					}
				}
			}
			
			if (!(attacker is PlayerCharacter))
			{
				if(attacker.hasPerk("Myr Venom") && target.isLustImmune == false)
				{
					output("\n");
					myrVenomBite(attacker, target, true);
				}
			}
			
			if (numHits > 0)
			{
				if (attacker.hasPerk("Bloodthirsty"))
				{
					attacker.energy(2 + rand(3));
				}
			}
			
			if (attacker is PlayerCharacter)
			{
				kGAMECLASS.mimbraneHandBonusAttack(target);
				kGAMECLASS.playerMimbraneCloudAttack();
			}
		}
		
		public static function myrVenomBite(attacker:Creature, target:Creature, fromMelee:Boolean = false):Boolean
		{
			// Airtight check
			if(attacker.hasAirtightSuit())
			{
				if (attacker is PlayerCharacter) output("You quickly displace your helmet and lick your [pc.lips]... ");
				else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " removes " + (attacker.isPlural ? "their" : attacker.getCombatPronoun("himher")) + " helmet and darts toward you, mouth agape... ");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " removes " + (attacker.isPlural ? "their" : attacker.getCombatPronoun("himher")) + " helmet and darts toward " + target.getCombatName() + ", mouth agape... ");
			}
			if(target.hasStatusEffect("Counters Melee") && !target.isImmobilized())
			{
				if(meleeCounterResults(attacker,target)) return false;
			}
			if (combatMiss(attacker, target))
			{
				if (attacker is PlayerCharacter) output("You can’t manage to sneak in a bite!");
				else if (target is PlayerCharacter) output("You narrowly avoid " + possessive(attacker.getCombatName()) + " lunging bite" + (attacker.isPlural ? "s" : "") + "!");
				else output(StringUtil.capitalize(target.getCombatName(), false) + " narrowly avoids " + possessive(attacker.getCombatName()) + " lunging bite" + (attacker.isPlural ? "s" : "") + "!");
			}
			else
			{
				if (attacker is PlayerCharacter) output("Approaching your opponent, you lean in and deliver a surprise bite, injecting a healthy dose of your red myrmedion venom!");
				else if (target is PlayerCharacter)
				{
					output("A spike of pain lances through your arm as " + attacker.getCombatName() + " clamps " + (attacker.isPlural ? "their" : attacker.getCombatPronoun("himher")) + " jaws around your bicep, venom quickly coursing through your veins!");
					kGAMECLASS.imbibeVenomEffects(true, true);
				}
				else output(StringUtil.capitalize(target.getCombatName(), false) + " " + target.mfn("growls", "squeals", "grunts") + " aloud as " + attacker.getCombatName() + " clamps " + (attacker.isPlural ? "their" : attacker.getCombatPronoun("himher")) + " jaws around a limb!");
				
				if(!(attacker is PlayerCharacter)) applyDamage(new TypeCollection( { drug: 3 + (fromMelee ? 0 : Math.floor(attacker.level / 3)) + rand(3) } ), attacker, target, "minimal");
				else if(fromMelee) applyDamage(new TypeCollection( { drug: 3 + rand(3) } ), attacker, target, "minimal");
				
				return true;
			}
			return false;
		}
		
		//{ region Item Attack Implementors
		public static function DroneAttack(attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("Your");
			else output(StringUtil.capitalize(possessive(attacker.getCombatName()), false));
			output(" drone repeatedly zaps ");
			if (target is PlayerCharacter) output("you");
			else output(target.getCombatName());
			output(".");
			applyDamage(attacker.droneDamage(), attacker, target, "minimal");
		}
		
		public static function TamwolfAttack(attacker:Creature, target:Creature):void
		{
			var ownerName:String = attacker.getCombatName();
			if(attacker is PlayerCharacter) ownerName = attacker.short;
			var missed:Boolean = (target.hasFlightEffects() ? (rand(2) == 0) : false);
			
			if(missed)
			{
				output((attacker is PlayerCharacter ? "Your" : ownerName + "’s") + " Tam-wolf is unable to attack " + (target is PlayerCharacter ? "you" : target.getCombatName()) + ".");
				return;
			}
			
			output("<i>“Enemy detected, " + attacker.mf("master", "mistress") + " " + ownerName + "! I will defend you!”</i> Tam-wolf announces, leaping into the fray. He hits, biting ");
			if (target is PlayerCharacter) output(" you!");
			else output(target.getCombatName() + ".");

			var d:Number = attacker.untypedDroneDamage();
			var dmg:TypeCollection = new TypeCollection( { kinetic: d * 0.9 }, DamageFlag.PENETRATING);

			applyDamage(dmg, attacker, target, "minimal");
			if (attacker is PlayerCharacter) output(" Good boy!");
		}
		
		public static function TamwolfDamagedAttack(attacker:Creature, target:Creature):void
		{
			var ownerName:String = attacker.getCombatName();
			if(attacker is PlayerCharacter) ownerName = attacker.short;
			var missed:Boolean = (target.hasFlightEffects() ? (rand(2) == 0) : false);
			
			if(missed)
			{
				output((attacker is PlayerCharacter ? "Your" : ownerName + "’s") + " Tam-wolf is unable to attack " + (target is PlayerCharacter ? "you" : target.getCombatName()) + ".");
				return;
			}
			
			if (rand(10) <= 2)
			{
				output((attacker is PlayerCharacter ? "Your" : ownerName + "’s") + " Tam-wolf leaps forward at " + target.getCombatName() + "... but his bum leg catches, and he goes tumbling into the ground.");
				if(attacker is PlayerCharacter) output(" Dammit, Tam-wolf!");
			}
			//Attack!
			else
			{
				output("<i>“ENEMY DETECTED, MISTRESS TAM! I WILL DEFEND YOU,”</i> " + (attacker is PlayerCharacter ? "Your" : ownerName + "’s") + " Tam-wolf loudly announces as he lunges at " + target.getCombatName() + ". He hits!");
				var d:Number = attacker.untypedDroneDamage();
				var dmg:TypeCollection = new TypeCollection( { kinetic: d * 0.9 }, DamageFlag.PENETRATING);

				applyDamage(dmg, attacker, target, "minimal");
				if (attacker is PlayerCharacter) output(" Good boy!");
			}
		}
		
		public static function TamwolfIIAttack(attacker:Creature, target:Creature):void
		{
			var ownerName:String = attacker.getCombatName();
			if(attacker is PlayerCharacter) ownerName = attacker.short;
			var missed:Boolean = (target.hasFlightEffects() ? (rand(2) == 0) : false);
			
			if(missed)
			{
				output((attacker is PlayerCharacter ? "Your" : ownerName + "’s") + " Tam-wolf is unable to attack " + (target is PlayerCharacter ? "you" : target.getCombatName()) + ".");
				return;
			}
			
			output("<i>“Enemy detected, " + attacker.mf("master", "mistress") + " " + ownerName + "! I will defend you!”</i> Tam-wolf announces, leaping into the fray. He hits, biting ");
			if (target is PlayerCharacter) output(" you!");
			else output(target.getCombatName() + ".");
			
			var d:Number = attacker.untypedDroneDamage() + 1;
			var dmg:TypeCollection = new TypeCollection( { kinetic: d * 0.8, electric: d * 0.3 }, DamageFlag.PENETRATING);
			
			applyDamage(dmg, attacker, target, "minimal");
			if (attacker is PlayerCharacter) output(" Good boy!");
		}
		
		public static function SiegwulfeAttack(attacker:Creature, target:Creature):void
		{
			var ownerName:String = attacker.getCombatName();
			if(attacker is PlayerCharacter) ownerName = attacker.short;
			
			var d:Number = attacker.untypedDroneDamage() + 1 + rand(2);
			var dmg:TypeCollection;
			var damageResult:DamageResult;
			
			var missed:Boolean = (target.hasFlightEffects() ? (rand(2) == 0) : false);
			
			if(attacker is PlayerCharacter)
			{
				if(kGAMECLASS.siegwulfeIsDom())
				{
					// Bimbo-dom siegwulfe will switch between lust attacks and regular attacks to match which type of damage she thinks you’re trying to deal.
					// More lust than dmg
					if (!target.isLustImmune && (100*((target.HP()+target.shields()) / (target.HPMax()+target.shieldsMax()))) >= (100 - target.lustQ()))
					{
						output(RandomInCollection([
							"[wulfe.name] pushes her chest out, smirking while she runs her hands over her gigantic, jutting breasts and moans. <i>“Look at what you’re missing out on...”</i>",
							"[wulfe.name] turns and lowers her front half, spreading her hindlegs while her holocock snaps into existence, tantalizing the enemy with her impressive assets. She wiggles her massive centaur ass from side to side, smirking with confidence.",
							"[wulfe.name] turns and spreads her hindlegs, presenting her thick, black pussy and letting moisture drool from her tight little slit. <i>“Give up now and maybe I’ll let you put your tongue in it.”</i>"
						]));

						// Scales dmg with PC level.
						//dmg = new TypeCollection( { tease: 12 + attacker.level } );
						dmg = new TypeCollection( { tease: 20 + rand(3) } );
						damageResult = applyDamage(dmg, kGAMECLASS.chars["WULFE"], target, "suppress");
						output("\n");
						output(teaseReactions(damageResult.lustDamage, target));
					}
					//More dmg than lust
					else
					{
						if(missed)
						{
							output(kGAMECLASS.chars["WULFE"].short + " is unable to attack " + (target is PlayerCharacter ? "you" : target.getCombatName()) + ".");
							return;
						}
						output(RandomInCollection([
							"[wulfe.name] jumps into the fray, slashing with her extendable claws!",
							"[wulfe.name] spins around and kicks at the opponent with her powerful hindlegs!",
							"[wulfe.name] rears up and kicks at the opponent with her clawed forelegs!"
						]));

						// Scales dmg with PC level.
						dmg = new TypeCollection( { kinetic: ((d * 0.9) + rand(3)) }, DamageFlag.PENETRATING);
						damageResult = applyDamage(dmg, attacker, target, "suppress");
					}
				}
				else if(kGAMECLASS.chars["WULFE"].isBimbo())
				{
					output("<i>“Don’t you worry your pretty head, " + attacker.mf("master", "mistress") + "!”</i> " + kGAMECLASS.chars["WULFE"].short + " giggles, prancing forward with her massive milk-tanks on display. <i>“I’ll, like, distract ‘em and stuff!”</i> She sure does, bouncing around with jiggling tits and a wiggling ass, putting herself between you and " + target.getCombatName() + ".");
					
					dmg = new TypeCollection( { tease: 20 } );
					damageResult = applyDamage(dmg, kGAMECLASS.chars["WULFE"], target, "suppress");
					output("\n");
					output(teaseReactions(damageResult.lustDamage, target));
				}
				else
				{
					if(missed)
					{
						output(kGAMECLASS.chars["WULFE"].short + " is unable to attack " + (target is PlayerCharacter ? "you" : target.getCombatName()) + ".");
						return;
					}
					output(kGAMECLASS.chars["WULFE"].short + " brandishes her hardlight claws, putting herself between you and " + target.getCombatName() + ". <i>“Don’t worry, " + attacker.mf("master", "mistress") + ", I’ll protect you!”</i> She lunges forward, sweeping her blades across her target.");
					
					dmg = new TypeCollection( { kinetic: d * 0.9 }, DamageFlag.PENETRATING);
					damageResult = applyDamage(dmg, attacker, target, "suppress");
				}
			}
			else
			{
				if(missed)
				{
					output(ownerName + "’s Siegwulfe is unable to attack " + (target is PlayerCharacter ? "you" : target.getCombatName()) + ".");
					return;
				}
				output(ownerName + "’s Siegwulfe brandishes its hardlight claws and lunges forward, sweeping its blades at " + ((target is PlayerCharacter) ? "you!" : (target.getCombatName() + ".")));
				
				dmg = new TypeCollection( { kinetic: d * 0.9 }, DamageFlag.PENETRATING);
				damageResult = applyDamage(dmg, attacker, target, "suppress");
			}

			outputDamage(damageResult);
		}
		
		public static function ACECannonAttack(attacker:Creature, target:Creature):void
		{
			output("The gun on " + possessive(attacker.getCombatName()) + " shoulder tracks towards " + target.getCombatName() + ", charging up with power. As " + (attacker is PlayerCharacter ? (target.getCombatName() + " move" + (target.isPlural ? "" : "s")) : (attacker.getCombatName() + " move" + (attacker.isPlural ? "" : "s"))) + ", it works on its own, targeting and firing at " + target.getCombatName() + ".");
			
			if (target.reflexes() / 2 + rand(20) + 1 >= 35)
			{
				output(" The shot goes wide!");
			}
			else
			{
				output(" The shot hits!");
				
				var dmg:TypeCollection = new TypeCollection( { burning: attacker.untypedDroneDamage() * 1.33 }, DamageFlag.LASER);
				applyDamage(dmg, attacker, target, "minimal");
			}
		}
		//laser version of the basic drone
		public static function SteeletechLaserSentryAttack(attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("Your");
			else output(StringUtil.capitalize(possessive(attacker.getCombatName()), false));
			output(" laser drone repeatedly zaps ");
			if (target is PlayerCharacter) output("you");
			else output(target.getCombatName());
			output(".");
			var dmg:TypeCollection = new TypeCollection( { burning: attacker.untypedDroneDamage() * 1.1 }, DamageFlag.LASER);
			applyDamage(dmg, attacker, target, "minimal");
		}
		public static function TamedVarmintAttack(attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output(kGAMECLASS.varmintPetName("Your pet") + " hoots and hisses at " + target.getCombatName() + ",");
			else output(attacker.getCombatName() + "’s pet varmint hoots and hisses at you,");
			if (attacker.isGrappled()) output(" pacing about defensively near " + (attacker is PlayerCharacter ? "you" : attacker.getCombatPronoun("himher")));
			else output(" standing protectively in front of " + (attacker is PlayerCharacter ? "you" : attacker.getCombatPronoun("himher")));
			output(" and raising its spiky hackles.");
			if (rand(10) <= 2)
			{
				output(" It lunges into battle, but it can’t find purchase on " + (attacker is PlayerCharacter ? "your foe" : "you") + "!");
			}
			else
			{
				if (attacker is PlayerCharacter) output(" It lunges towards " + target.getCombatName() + ", shrieking like a banshee. Its fangs sink into your enemy, rending viciously at " + target.getCombatPronoun("himher") + "!");
				else output(" Shrieking like a banshee, it lunges towards you and its fangs sink in, rending at you viciously!");
				
				var d:Number = (attacker.untypedDroneDamage() - 1);
				var dmg:TypeCollection = new TypeCollection();
				dmg.kinetic.damageValue = Math.round(d * 0.75);
				dmg.corrosive.damageValue = Math.round(d * 0.25);
				dmg.addFlag(DamageFlag.PENETRATING);
				
				applyDamage(dmg, attacker, target, "minimal");
			}
		}
		
		public static function GoovolverAttackImpl(attacker:Creature, target:Creature):void
		{
			if (attacker.hasStatusEffect("Disarmed"))
			{
				if (attacker is PlayerCharacter) output("You try to attack until you remember that you’ve been disarmed!");
				else output(attacker.getCombatName() + " scrabble" + (attacker.isPlural ? "" : "s") + " about, trying to find " + attacker.getCombatPronoun("hisher") + " missing weapon.");
				return;
			}
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			SingleRangedAttackImpl(attacker, target, false, "goovolver");
		}
		
		public static function SlutRayAttackImpl(attacker:Creature, target:Creature):void
		{
			if (attacker.hasStatusEffect("Disarmed"))
			{
				if (attacker is PlayerCharacter) output("You try to attack until you remember that you’ve been disarmed!");
				else output(attacker.getCombatName() + " scrabble" + (attacker.isPlural ? "" : "s") + " about, trying to find " + attacker.getCombatPronoun("hisher") + " missing weapon.");
				return;
			}
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			SingleRangedAttackImpl(attacker, target, false, "slut ray");
		}
		
		public static function FZRAttackImpl(attacker:Creature, target:Creature):void
		{
			if (attacker.hasStatusEffect("Disarmed"))
			{
				if (attacker is PlayerCharacter) output("You try to attack until you remember that you’ve been disarmed!");
				else output(attacker.getCombatName() + " scrabble" + (attacker.isPlural ? "" : "s") + " about, trying to find " + attacker.getCombatPronoun("hisher") + " missing weapon.");
				return;
			}
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			SingleRangedAttackImpl(attacker, target, false, "fzr");
		}
		//} endregion
		
		
		// Apply common combat status effects.
		public static function applyBleed(target:Creature, stacks:int = 1, rounds:int = 3, damage:int = 15, apply:Boolean = false):void
		{
			/* Bleeding
			v1 = stacks
			v2 = remaining rounds
			v3 = base damage
			*/
			target.createStatusEffect("Bleeding", 0, 0, 0, 0, false, "Icon_Crying", "", true, 0);
			// Add a stack and refresh duration
			if(apply) target.setStatusValue("Bleeding", 1, stacks);
			else target.addStatusValue("Bleeding", 1, stacks);
			target.setStatusValue("Bleeding", 2, rounds);
			target.setStatusValue("Bleeding", 3, damage);
			stacks = target.statusEffectv1("Bleeding");
			rounds = target.statusEffectv2("Bleeding");
			damage = target.statusEffectv3("Bleeding");
			target.setStatusTooltip("Bleeding", (target is PlayerCharacter ? "You’re bleeding!" : "Suffering bleeding damage over time.") + "\n" + damage + " bleed strength.\n" + stacks + " stack" + ((stacks == 1) ? "" : "s") + ".\n" + rounds + " round" + ((rounds == 1) ? "" : "s") + " remaining.");
		}
		public static function applyPoison(target:Creature, stacks:int = 1, rounds:int = 3, damage:int = 15, apply:Boolean = false):void
		{
			/* Poison
			v1 = stacks
			v2 = remaining rounds
			v3 = base damage
			*/
			target.createStatusEffect("Poison", 0, 0, 0, 0, false, "Icon_Poison", "", true, 0);
			// Add a stack and refresh duration
			if(apply) target.setStatusValue("Poison", 1, stacks);
			else target.addStatusValue("Poison", 1, stacks);
			target.setStatusValue("Poison", 2, rounds);
			target.setStatusValue("Poison", 3, damage);
			stacks = target.statusEffectv1("Poison");
			rounds = target.statusEffectv2("Poison");
			damage = target.statusEffectv3("Poison");
			target.setStatusTooltip("Poison", (target is PlayerCharacter ? "You’re poisoned!" : "Suffering poison damage over time.") + "\n" + damage + " poison strength.\n" + stacks + " stack" + ((stacks == 1) ? "" : "s") + ".\n" + rounds + " round" + ((rounds == 1) ? "" : "s") + " remaining.");
		}
		public static function applyBlind(target:Creature, turns:int = 3, apply:Boolean = false, tooltip:String = ""):void
		{
			target.createStatusEffect("Blinded", 0, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0, 0xFF0000);
			if(apply) target.setStatusValue("Blinded", 1, turns);
			else target.addStatusValue("Blinded", 1, turns);
			if(tooltip != "") target.setStatusTooltip("Blinded", tooltip);
		}
		public static function applyBurn(target:Creature, turns:int = 2, apply:Boolean = false, tooltip:String = ""):void
		{
			target.createStatusEffect("Burn", 0, 0, 0, 0, false, "Icon_Smelly", "Burning for thermal damage over time.", true, 0);
			if(apply) target.setStatusValue("Burn", 1, turns);
			else target.addStatusValue("Burn", 1, turns);
			if(tooltip != "") target.setStatusTooltip("Burn", tooltip);
		}
		public static function applyBurning(target:Creature, turns:int = 3, threshold:Number = 0, apply:Boolean = false, tooltip:String = ""):void
		{
			target.createStatusEffect("Burning", 2, 0, 0, 0, false, "DefenseDown", "Reduces defense by five points and causes damage over time.", true, 0);
			if(apply) target.setStatusValue("Burning", 1, turns);
			else target.addStatusValue("Burning", 1, turns);
			target.setStatusValue("Burning", 2, threshold);
			if(tooltip != "") target.setStatusTooltip("Burning", tooltip);
		}
		public static function applyBurrow(target:Creature, tooltip:String = ""):void
		{
			target.createStatusEffect("Burrowed",0,0,0,0,false,"Icon_DefUp",StringUtil.capitalize(target.uniqueName) + (target.isPlural ? " have " : " has") + " burrowed beneath the ground. You can see some faint trembling through the dirt, but there’s no other sign of it.",true);
			if(tooltip != "") target.setStatusTooltip("Burrowed", tooltip);
		}
		public static function applyDisarm(target:Creature, turns:int = 4, apply:Boolean = false, tooltip:String = ""):void
		{
			target.createStatusEffect("Disarmed", 4, 0, 0, 0, false, "Blocked", "Cannot use normal melee or ranged attacks!", true, 0, 0xFF0000);
			if(apply) target.setStatusValue("Disarmed", 1, turns);
			else target.addStatusValue("Disarmed", 1, turns);
			if(tooltip != "") target.setStatusTooltip("Disarmed", tooltip);
		}
		public static function applyGassed(target:Creature, tooltip:String = ""):void
		{
			if(!target.hasStatusEffect("Gassed"))
			{
				target.createStatusEffect("Gassed", 0, 0, 0, 0, false, "Icon_Blind", "The gas makes it hard to see and aim. Aim and reflex decreased!", true, 0);
				target.aimMod -= 5;
				target.reflexesMod -= 5;
			}
			if(tooltip != "") target.setStatusTooltip("Gassed", tooltip);
		}
		public static function applyGrapple(target:Creature, chance:int = 30, apply:Boolean = false, tooltip:String = ""):void
		{
			target.createStatusEffect("Grappled", 0, 0, 0, 0, false, "Constrict", (target is PlayerCharacter ? "You’re pinned in a grapple." : "Pinned in a grapple."), true, 0);
			if(apply) target.setStatusValue("Grappled", 2, chance);
			else target.addStatusValue("Grappled", 2, chance);
			if(tooltip != "") target.setStatusTooltip("Grappled", tooltip);
		}
		public static function applyHobble(target:Creature, intensity:int = 1, apply:Boolean = false):void
		{
			target.createStatusEffect("Hobbled",0,0,0,0,true,"","",true);
			if(apply) target.setStatusValue("Hobbled", 1, intensity);
			else target.addStatusValue("Hobbled",1 , intensity);
		}
		public static function applyLustStagger(target:Creature, turns:int = 4, apply:Boolean = false, tooltip:String = ""):void
		{
			target.createStatusEffect("Lust Staggered",0,0,0,0,true,"","",true);
			applyStagger(target, turns, apply, tooltip);
		}
		public static function applyLustStun(target:Creature, turns:int = 2, apply:Boolean = false, tooltip:String = ""):void
		{
			target.createStatusEffect("Lust Stunned", 0, 0, 0, 0, true, "Stun", "Cannot take action!", true, 0, 0xFF0000);
			if(apply) target.setStatusValue("Lust Stunned", 1, turns);
			else target.addStatusValue("Lust Stunned", 1, turns);
			if(tooltip != "") target.setStatusTooltip("Lust Stunned", tooltip);
		}
		public static function applyParalyze(target:Creature, turns:int = 2, apply:Boolean = false, tooltip:String = ""):void
		{
			target.createStatusEffect("Paralyzed", 0, 0, 0, 0, false, "Paralyze", "Cannot act!", true, 0);
			if(apply) target.setStatusValue("Paralyzed", 1, turns);
			else target.addStatusValue("Paralyzed", 1, turns);
			if(tooltip != "") target.setStatusTooltip("Paralyzed", tooltip);
		}
		public static function applyStagger(target:Creature, turns:int = 4, apply:Boolean = false, tooltip:String = ""):void
		{
			target.createStatusEffect("Staggered", 0, 0, 0, 0, false, "Icon_OffDown", (target is PlayerCharacter ? "You are" : (StringUtil.capitalize(target.getCombatName()) + " is")) + " staggered, and " + target.getCombatPronoun("hisher") + " aim and reflexes have been reduced!", true, 0, 0xFF0000);
			if(apply) target.setStatusValue("Staggered", 1, turns);
			else target.addStatusValue("Staggered", 1, turns);
			if(tooltip != "") target.setStatusTooltip("Staggered", tooltip);
		}
		public static function applyStun(target:Creature, turns:int = 2, apply:Boolean = false, tooltip:String = ""):void
		{
			target.createStatusEffect("Stunned", 0, 0, 0, 0, false, "Stun", (target is PlayerCharacter ? "You are stunned and cannot act until you recover!" : "Cannot take action!"), true, 0, 0xFF0000);
			if(apply) target.setStatusValue("Stunned", 1, turns);
			else target.addStatusValue("Stunned", 1, turns);
			if(tooltip != "") target.setStatusTooltip("Stunned", tooltip);
		}
		public static function applySunder(target:Creature, turns:int = 4, apply:Boolean = false, tooltip:String = ""):void
		{
			target.createStatusEffect("Sundered", 0, 0, 0, 0, false, "DefenseDown", "Defense is reduced by 50%!", true, 0, 0xFF0000);
			if(apply) target.setStatusValue("Sundered", 1, turns);
			else target.addStatusValue("Sundered", 1, turns);
			if(tooltip != "") target.setStatusTooltip("Sundered", tooltip);
		}
		public static function applyTrip(target:Creature, tooltip:String = ""):void
		{
			target.createStatusEffect("Tripped", 0, 0, 0, 0, false, "DefenseDown", (target is PlayerCharacter ? "You’ve been tripped, reducing your effective physique and reflexes by 4. You’ll have to spend an action standing up." : "Until able to stand, physique and reflexes have been reduced by 4."), true, 0);
			if(tooltip != "") target.setStatusTooltip("Tripped", tooltip);
		}
		public static function applyWeb(target:Creature, tooltip:String = ""):void
		{
			target.createStatusEffect("Web", 0, 0, 0, 0, false, "Icon_SpiderWeb", (target is PlayerCharacter ? "You’re trapped in a web, keeping you grounded." : "Trapped and grounded in a web."), true, 0);
			if(tooltip != "") target.setStatusTooltip("Web", tooltip);
		}
		public static function removeWeb(target:Creature):void
		{
			target.removeStatusEffect("Web");
		}
		//Does v1 lust damage every turn. V2 is turn counter (negative = infinite)!
		public static function applyAphroGas(target:Creature, damage:int = 5, turns:int = 4, apply:Boolean = false, tooltip:String = ""):void
		{
			if(target.hasStatusEffect("Aphro Gas"))
			{
				//Increase duration!
				if(apply) target.setStatusValue("Aphro Gas",2,turns);
				else target.addStatusValue("Aphro Gas",2,turns);
				//DAMAGE LEVEL UP!
				if(!apply) target.addStatusValue("Aphro Gas",1,1);
			}
			if(tooltip == "")
			{
				if(target is PlayerCharacter) tooltip = "A cloud of aphrodisiac hangs in the air, turning you on as you breathe!";
				else tooltip = "A cloud of aphrodisiac hangs in the air, causing continuous arousal.";
			}
			target.createStatusEffect("Aphro Gas",damage,turns,0,0,false,"Icon_LustUp",tooltip,true,0);
		}
		
		// Special Attacks
		
		public static var Headbutt:SingleCombatAttack;
		public static function HeadbuttImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Melee") && !target.isImmobilized())
			{
				if(meleeCounterResults(attacker,target)) return;
			}
			else if (attacker is PlayerCharacter)
			{
				output("You lean back before whipping your head forward in a sudden headbutt.\n");
			}
			else if(attacker.isPlural)
			{
				output(StringUtil.capitalize(attacker.getCombatName(), false) + " all lean back and whip their heads forward in a sudden sychronized headbutt attack.\n");
			}
			else
			{
				output(StringUtil.capitalize(attacker.getCombatName(), false) + " leans back before whipping " + attacker.getCombatPronoun("hisher") + " head forward in a sudden headbutt.\n");
			}
	
			if (combatMiss(attacker, target))
			{
				if (attacker is PlayerCharacter)
				{
					if(target.customDodge.length == 0) output("You miss!");
					else output(target.customDodge);
				}
				else
				{
					output(StringUtil.capitalize(attacker.getCombatPronoun("heshe"), false) + " misses.");
				}
			}
			//Extra miss for blind
			else if (blindMiss(attacker, target, true))
			{
				if (attacker is PlayerCharacter) output("Your blind strike fails to connect.");
				else output(StringUtil.capitalize(attacker.getCombatPronoun("hisher"), false) + " blind strike fails to connect.");
			}
			//Attack connected!
			else
			{
				if (attacker is PlayerCharacter) output("You connect with your target!");
				else output(StringUtil.capitalize(attacker.getCombatPronoun("hisher"), false) + " connect" + (attacker.isPlural ? "" : "s") + " with you.");
		
				applyDamage(damageRand(new TypeCollection( { kinetic: attacker.physique() / 2 + attacker.level } ), 15), attacker, target, "headbutt");

				if (target is CyberPunkSecOp)
				{
					output(" A resounding ‘CLANG’ fills the air. " + target.mf("He","She’s") + " packing a little extra metal in " + target.mf("his","her") + " noggin. You’ll have to try something else!");
				}
				else if (attacker.physique() / 2 + rand(20) + 1 >= target.physique() / 2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune")) 
				{
					if(target is PlayerCharacter) output("\n<b>You are stunned.</b>");
					else output("\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (!target.isPlural ? "is" : "are") + " stunned.</b>");
					applyStun(target, 2);
				}
				else
				{
					if(attacker is PlayerCharacter) output("\nIt doesn’t look to have stunned your foe!");
					else output("\nIt didn’t manage to stun you.");
				}
			}
		}
		
		public static var RapidFire:SingleCombatAttack;
		private static function RapidFireImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			// Do regular attack (including multi-attack and additional flurry shots)
			RangedAttack(attacker, target);
			
			// Two bonus shots using flurry mechanics
			output("\n");
			SingleRangedAttackImpl(attacker, target, true);
			output("\n");
			SingleRangedAttackImpl(attacker, target, true);
			if (attacker.hasPerk("Rending Attacks") && !target.isStaggered() && !target.isPlanted())
			{
				applyStagger(target, 4 + rand(2));
				if(target is PlayerCharacter) output(" <b>You are staggered by the hail of fire!</b>");
				else output(" <b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (target.isPlural ? "are" : "is") + " staggered by the hail of fire!</b>");
			}
		}
		
		public static var PowerStrike:SingleCombatAttack;
		private static function PowerStrikeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Melee") && !target.isImmobilized())
			{
				if(meleeCounterResults(attacker,target)) return;
			}
			if (combatMiss(attacker, target))
			{
				if (target.customDodge.length > 0) output(target.customDodge);
				else if (attacker is PlayerCharacter) output("You draw back your weapon and " + attacker.meleeWeapon.attackVerb + " at " + target.getCombatName() + ", but just can’t connect.");
				else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " draw" + (attacker.isPlural ? "" : "s") + " back " + attacker.getCombatPronoun("hisher") + " weapon and " + attacker.meleeWeapon.attackVerb + " at you, but just can’t connect.");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " draw" + (attacker.isPlural ? "" : "s") + " back " + attacker.getCombatPronoun("hisher") + " weapon and " + attacker.meleeWeapon.attackVerb + " at " + target.getCombatName() + ", but just can’t connect.");
				return;
			}
			
			if (blindMiss(attacker, target, true))
			{
				output(StringUtil.capitalize(possessive(attacker.getCombatName()), false) + " blind power strike missed.");
				
				return;
			}
			
			if (attacker is PlayerCharacter) output("You draw back your " + attacker.meleeWeapon.longName + " and land a hit on " + target.getCombatName() + "!");
			else if (target is PlayerCharacter) output("" + StringUtil.capitalize(attacker.getCombatName(), false) + " draw" + (attacker.isPlural ? "" : "s") + " back " + attacker.getCombatPronoun("hisher") + " " + attacker.meleeWeapon.longName + " and lands a hit on you!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " draw" + (attacker.isPlural ? "" : "s") + " back " + attacker.getCombatPronoun("hisher") + " " + attacker.meleeWeapon.longName + " and lands a hit on " + target.getCombatName() + "!");
			
			var d:TypeCollection = attacker.meleeDamage();
			var multiplier:Number = 2;
			if(attacker.hasPerk("Second Attack")) multiplier += 0.7;
			d.multiply(multiplier);
			damageRand(d, 15);
			applyDamage(d, attacker, target);
			if(!target.hasStatusEffect("Sundered") && attacker.hasPerk("Rending Attacks"))
			{
				output("\n<b>Sundered</b>!");
				applySunder(target, 4 + rand(2));
			}
		}
		
		public static var TakeCover:SingleCombatAttack;
		private static function TakeCoverImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("You seek cover against ranged attacks.");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " hunker" + (attacker.isPlural ? "" : "s") + " behind cover, defending themselves against ranged attacks!");
			
			attacker.createStatusEffect("Taking Cover", 4, 0, 0, 0, false, "DefenseUp", "Taking cover! Ranged attacks will almost always miss!", true);
		}
		
		public static var CarpetGrenades:SingleCombatAttack;
		private static function CarpetGrenadesImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("You sling an array of microgrenades at everything in the area!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " throw" + (attacker.isPlural ? "" : "s") + " out an array of microgrenades!");
			
			var d:int = 10 + (attacker.level * 2.5) + (attacker.bimboIntelligence() / 1.5);
			var damage:TypeCollection = new TypeCollection( { burning: d } );
			var explosionDodged:int = 0;
			
			if (target is Cockvine)
			{
				kGAMECLASS.adultCockvineGrenadesInEnclosedSpaces(damage, true, false, false);
			}
			
			for (var x:int = 0; x < hGroup.length; x++)
			{
				if (hGroup[x].hasPerk("Get Down!") && !hGroup[x].isDefeated()) ++explosionDodged;
				output("\n" + StringUtil.capitalize(hGroup[x].getCombatName(), false) + " " + (!hGroup[x].isPlural ? "is" : "are") + " caught in the explosion!");
				applyDamage(damageRand(damage, 15), attacker, hGroup[x], "cluster");
			}
			kGAMECLASS.explosionDodgeBlurb(explosionDodged, attacker, target, "cluster");
		}
		
		public static var DetonationCharge:SingleCombatAttack;
		private static function DetonationChargeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("You toss a bundle of explosives in the direction of " + target.getCombatName() + "!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " throw" + (attacker.isPlural ? "" : "s") + " a bundle of explosives in " + possessive(target.getCombatName()) + " direction!");
			
			var d:int = 15 + (attacker.level * 4) + attacker.bimboIntelligence();
			var damage:TypeCollection = damageRand(new TypeCollection( { burning: d } ), 15);
			
			if (target is Cockvine)
			{
				kGAMECLASS.adultCockvineGrenadesInEnclosedSpaces(damage, false, false, false);
			}
			
			applyDamage(damage, attacker, target);
		}
		
		public static var SecondWind:SingleCombatAttack;
		private static function SecondWindImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			attacker.energy(Math.round(attacker.energyMax() / 2));
			attacker.HP(Math.round(attacker.HPMax() / 2));
			attacker.createStatusEffect("Used Second Wind", 0, 0, 0, 0, true, "", "", true, 0);
			
			if (attacker is PlayerCharacter) output("You draw on your innermost reserves of strength, taking a second wind!");
			else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " visibly focus for a moment, finding themselves a second wind!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " visibly focuses for a moment, finding " + attacker.getCombatPronoun("himher") + "self a second wind!");
		}
		
		public static var ParalyzingShock:SingleCombatAttack;
		public static function ParalyzingShockImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			if (target.hasStatusEffect("Paralyzed"))
			{
				if (target is PlayerCharacter) output("You’re already paralyzed!");
				else output(StringUtil.capitalize(target.getCombatName(), false) + " " + (target.isPlural ? "are" : "is") + " already paralyzed!");
				return;
			}
			
			if (attacker is PlayerCharacter) 
			{
				if(attacker.hasPerk("Fuck Sense")) output("You blink innocently while launching a paralyzing shock at " + target.getCombatName() + "!");
				else output("You launch a paralyzing shock at " + target.getCombatName() + "!");
			}
			else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " fire" + (attacker.isPlural ? "" : "s") + " a paralyzing shock at you!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " fire" + (attacker.isPlural ? "" : "s") + " a paralyzing shock at " + target.getCombatName() + "!");
			
			if (target is JaneriaSpawn || target is JaneriaCore)
			{
				output("\nHowever " + target.getCombatName() + " absorbs the electricity and it seems to strengthen it.");
				target.shields(25);
				return;
			}
			if (attacker.bimboIntelligence() / 2 + rand(20) + 1 >= target.physique() / 2 + 10)
			{
				output("\nThe effect is immediate! ");
				if (target is PlayerCharacter) output(" You shudder and stop, temporarily paralyzed!");
				else output(StringUtil.capitalize(target.getCombatName(), false) + " shudder" + (target.isPlural ? "" : "s") + " and stop" + (target.isPlural ? "" : "s") + ", temporarily paralyzed.");
				applyParalyze(target, 2 + rand(2));
			}
			else
			{
				output("\nIt fails to paralyze " + target.getCombatName() + "!");
			}
			if(attacker.hasPerk("Deadly Shock"))
			{
				var targetDamage:int = Math.round(10 + attacker.level * 2 + attacker.bimboIntelligence() / 1.25);
				applyDamage(damageRand(new TypeCollection( { kinetic: targetDamage } ), 15), attacker, target, "minimal");
			}
		}
		
		public static var Volley:SingleCombatAttack;
		public static function VolleyImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			RangedAttack(attacker, target);
			output("\n");
			SingleRangedAttackImpl(attacker, target, true);
			
			if (attacker.aim() / 2 + rand(20) + 1 >= target.reflexes() / 2 + 10 && !target.hasStatusEffect("Blinded") && attacker.hasRangedEnergyWeapon() && !target.hasBlindImmunity())
			{
				if (target is PlayerCharacter) output("\n<b>You are blinded by flashes from " + possessive(attacker.getCombatName()) + " " + attacker.rangedWeapon.longName + ".</b>");
				else if (attacker is PlayerCharacter) output(" <b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (target.isPlural ? "are" : "is") + " blinded by your " + possessive(attacker.rangedWeapon.longName) + " flashes.</b>");
				else output(" <b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (target.isPlural ? "are" : "is") + " blinded by flashes from " + possessive(attacker.getCombatName()) + " " + attacker.rangedWeapon.longName + ".</b>");
				
				applyBlind(target, 3);
			}
		}

		public static var ChargeWeapon:SingleCombatAttack;
		private static function chargeWeaponImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(!(attacker is PlayerCharacter))
			{
				if(attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " toggle wrist-mounted switches to light their weapons up with deadly arcs of electricity before thrusting them out for a quick, inaccurate strike!");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " toggles a wrist-mounted switch to light " + attacker.getCombatPronoun("hisher") + " weapon up with deadly arcs of electricity before thrusting it out for a quick, inaccurate strike!");
			}
			else 
			{
				if (attacker.hasPerk("Fuck Sense")) output("You try to remember how to turn on the lightning-shockey thing you built for your weapon. It’s just like a vibrator, only the electrons move back and forth instead of a wiggly pink fucktoy! Then you remember you painted the button for it bright pink and give it a smack. The sudden ‘<i>kzzzt</i>’ of your weapon electrifying nearly makes you drop it - and in the process take an accidental swing your foe’s way!");
				else output("You flick the switch on a wrist-mounted powercell, pumping arcs of deadly electricity into your " + attacker.meleeWeapon.longName + ", then try for a quick strike with the newly charged weapon!");
			}
			if (attacker is PlayerCharacter) attacker.createStatusEffect("Charged Weapon", Math.ceil(attacker.bimboIntelligence() + rand(attacker.level)), 0, 0, 0, false, "Icon_OffUp", (attacker.hasPerk("Fuck Sense") ? "Your weapon is electrified and will deal bonus damage based upon your current inte... intelli... nahhhh, you’re pretty sure it’ll hit harder based on your libido. Fuck fighting. Literally! Wheeeeee~" : "Your weapon is electrified and will deal bonus damage based upon your current intellectual capacity."), true, 0);
			else attacker.createStatusEffect("Charged Weapon", Math.ceil(attacker.bimboIntelligence() + rand(attacker.level)), 0, 0, 0, false, "Icon_OffUp", "Weapon is electrified and will deal bonus damage based upon current intellectual capacity.", true, 0);
			output("\n");
			SingleMeleeAttackImpl(attacker, target, true);
		}
		
		public static var Overcharge:SingleCombatAttack;
		private static function OverchargeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			if (!(attacker is PlayerCharacter))
			{
				if(attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " smile as high-pitched whines emanate from their " + plural(attacker.rangedWeapon.longName) + "! ");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " smiles as a high-pitched whine emanates from " + attacker.getCombatPronoun("hisher") + " " + attacker.rangedWeapon.longName + "! ");
			}
			
			if (rangedCombatMiss(attacker, target))
			{
				if (target.customDodge.length > 0) output(target.customDodge);
				else if (attacker is PlayerCharacter) output("You overcharge your weapon and " + attacker.rangedWeapon.attackVerb + " at " + target.getCombatName() + ", but just can’t connect.");
				else if (target is PlayerCharacter) output("You manage to avoid the overcharged " + attacker.rangedWeapon.attackNoun + ".");
				else output(StringUtil.capitalize(target.getCombatName(), false) + " manage" + (target.isPlural ? "" : "s") + " to avoid the overcharged " + attacker.rangedWeapon.attackNoun + ".");
				return;
			}
			
			if (blindMiss(attacker, target, false))
			{
				if (attacker is PlayerCharacter) output("Your blind-fired, overcharged shot missed!");
				else if (target is PlayerCharacter) output(possessive(attacker.getCombatName()) + " blind-fired, overcharged shot misses you!");
				else output(possessive(attacker.getCombatName()) + " blind-fired, overcharge shot narrowly avoids hitting anything!");
				return;
			}
			
			if (attacker is PlayerCharacter) 
			{
				if(attacker.hasPerk("Fuck Sense")) output("You crank your " + attacker.rangedWeapon.longName + " up to 11, your fingers massaging the delicate electronics all on their own. Pulling the trigger comes as a surprise, but the super-charged shot connects with " + target.getCombatName() + " all the same!");
				else output("You overcharge your " + attacker.rangedWeapon.longName + " and land a hit on " + target.getCombatName() + "!");
			}
			else if(attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " connect with their overcharged " + plural(attacker.rangedWeapon.attackNoun) + "!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " connects with " + attacker.getCombatPronoun("hisher") + " overcharged " + attacker.rangedWeapon.attackNoun + "!");
			
			var d:TypeCollection = attacker.rangedDamage();
			
			if (attacker is PlayerCharacter)
			{
				if (attacker.hasPerk("Heroic Reserves")) d.multiply(2);
				else d.multiply(1.5);
			}
			else d.multiply(1.75);
			
			damageRand(d, 15);
			applyDamage(d, attacker, target, "minimal");
			
			if (attacker.bimboIntelligence() / 2 + rand(20) + 1 >= target.physique() / 2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune"))
			{
				output("\n");
				if (target is PlayerCharacter) output("<b>You are stunned!</b>");
				else output("<b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (target.isPlural ? "are" : "is") + " stunned!</b>");
				applyStun(target, 1);
			}
		}
		
		public static var DeflectorRegeneration:SingleCombatAttack;
		public static function DeflectorRegenerationImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			attacker.createStatusEffect("Tech Shield CD",0,0,0,0,true,"","",true);
			if (attacker is PlayerCharacter) 
			{
				if (attacker.hasPerk("Fuck Sense")) output("Your fingers tweak the machinery of your shield generator as easily as a cute boy’s nipples, twisting and tugging until the power is trickling back into your shield. The less you think about it, the easier it is to do!");
				else output("You fiddle with your shield, tuning it to regenerate over the next few turns.");
			}
			else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " lean down to fiddle with their shield generators. The fields respond, visibly bolstering as the emitters work harder to replenish the depleted fields.");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " leans down to fiddle with " + attacker.getCombatPronoun("hisher") + " shield generator. The field responds, visibly bolstering as the emitters work harder to replenish the depleted field.");

			var amount:Number = Math.ceil((attacker.bimboIntelligence() * 1.5 + rand(attacker.level) + attacker.shieldsMax() * 0.25) / 3);
			
			attacker.createStatusEffect("Deflector Regeneration", 4, amount, 0, 0, false, "DefenseUp", "Recovering shields every round.", true, 0);
		}
		
		public static var PowerSurge:SingleCombatAttack;
		private static function PowerSurgeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			attacker.createStatusEffect("Tech Shield CD",0,0,0,0,true,"","",true);
			if (attacker is PlayerCharacter) 
			{
				if (attacker.hasPerk("Fuck Sense")) output("Your fingers tweak the machinery of your shield generator as easily as a cute girl’s clitty, twisting and tugging until a jolt of power restores a portion of the shield’s missing energy. The less you think about it, the easier it is to do!");
				else output("You channel a surge of power into your shield generator, instantly restoring a portion of the emitters lost energy.");
			}
			else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " channel a surge of power into their shield generators, instantly restoring a portion of the lost energy.");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " channels a surge of power into " + attacker.getCombatPronoun("hisher") + " shield generator, instantly restoring a portion of the lost energy.");
			
			var amount:Number = Math.ceil((attacker.bimboIntelligence() * 1.5 + rand(attacker.level) + attacker.shieldsMax() * 0.25));
			
			if (amount + attacker.shields() > attacker.shieldsMax()) amount = attacker.shieldsMax() - attacker.shields();
			attacker.energy(33);
			attacker.shields(amount);
			output(" (" + amount + ")");
		}
		
		public static var ThermalDisruptor:SingleCombatAttack;
		private static function ThermalDisruptorImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{			
			if (attacker is PlayerCharacter) 
			{
				output("Raising the disruptor, you unleash a wave of burning fire on " + target.getCombatName() + ".");
				if(attacker.isBimbo()) output(" Gosh, that fire is pretty!");
			}
			else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " spins a long device around from " + attacker.getCombatPronoun("hisher") + " back, levelling it squarely in your direction. In the blink of an eye it unleashes a wave of burning fire directly at you!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " spins a long device around from " + attacker.getCombatPronoun("hisher") + " back, levelling it at " + target.getCombatName() + ", unleashing a wave of burning fire!");
			
			if (CombatManager.multipleEnemies())
			{
				output(" The flames surge, licking at your target’s compatriots!");
			}
			
			var targetDamage:int = Math.round(20 + attacker.level * 4 + attacker.bimboIntelligence());
			if(attacker.hasPerk("Boosted Charges")) targetDamage += attacker.level + attacker.bimboIntelligence();
			var baseDamage:TypeCollection = new TypeCollection( { burning: targetDamage } );
			var pluralDamage:TypeCollection = new TypeCollection( { burning: targetDamage * 2 } );
			var totalDamage:DamageResult;
			
			totalDamage = applyDamage(damageRand((target.isPlural == true ? pluralDamage : baseDamage), 15), attacker, target, "suppress");
			
			baseDamage.multiply(0.33);
			pluralDamage.multiply(0.33);
			
			for (var i:int = 0; i < hGroup.length; i++)
			{
				if (hGroup[i] != target && !hGroup[i].isDefeated())
				{
					totalDamage.addResult(applyDamage(damageRand((hGroup[i].isPlural == true ? pluralDamage : baseDamage), 15), attacker, hGroup[i], "suppress"));
				}
			}
			
			outputDamage(totalDamage);

			if(attacker.hasPerk("Boosted Charges") && !target.hasStatusEffect("Burning") && rand(3) != 0)
			{
				applyBurning(target, 2);
				if (target is PlayerCharacter) output("\n<b>You are on fire!</b>");
				else output("\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (target.isPlural ? "are" : "is") + " on fire!</b>");
			}
		}
		
		public static var GravidicDisruptor:SingleCombatAttack;
		private static function GravidicDisruptorImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{			
			if (attacker is PlayerCharacter) 
			{
				if(!attacker.isBimbo()) output("Raising the disruptor, you unleash a targeted gravitic disruption on " + target.getCombatName() + ".");
				else output("Raising the disruptor, you unleash a pretty purple swirl-ball on " + target.getCombatName() + ". It’s so pretty you can almost forget that you’re manipulating gravity itself! Science is fun!")
			}
			else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " spin" + (attacker.isPlural ? " long devices" : "s a long device") + " around from " + attacker.getCombatPronoun("hisher") + " back, levelling " + (attacker.isPlural ? "them" : "it") + " squarely in your direction. Your limbs suddenly feel heavy, a crushing weight bearing down on you from all sides!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " spin" + (attacker.isPlural ? " long devices" : "s a long device") + " around from " + attacker.getCombatPronoun("hisher") + " back, levelling " + (attacker.isPlural ? "them" : "it") + " at " + target.getCombatName() + ", unleashing a targeted gravitic disruption in " + target.getCombatPronoun("hisher") + " direction!");
			
			if (attacker is PlayerCharacter && CombatManager.multipleEnemies())
			{
				output(" The disruption spreads to encompass a small, localized area neatly surrounding your enemies!");
			}
			
			var targetDamage:int = Math.round(15 + attacker.level * 2.5 + attacker.bimboIntelligence() / 1.5);
			if(attacker.hasPerk("Boosted Charges")) 
			{
				targetDamage += attacker.level + attacker.bimboIntelligence();
				attacker.createStatusEffect("Gravitational Anomaly",4,0,0,0,false,"Icon_DizzyDrunk","All kinetic damage dealt is halved.",true,0);
				output("\n<b>The lingering gravitic field will make kinetic attacks less effective!</b>");
			}
			var baseDamage:TypeCollection = new TypeCollection( { unresistablehp: targetDamage } );
			var pluralDamage:TypeCollection = new TypeCollection( { unresistablehp: targetDamage * 2 } );
			
			var totalDamage:DamageResult;
			
			totalDamage = applyDamage(damageRand((target.isPlural == true ? pluralDamage : baseDamage), 15), attacker, target, "suppress");
			
			baseDamage.multiply(0.33);
			pluralDamage.multiply(0.33);
			
			for (var i:int = 0; i < hGroup.length; i++)
			{
				if (hGroup[i] != target && !hGroup[i].isDefeated())
				{
					totalDamage.addResult(applyDamage(damageRand((hGroup[i].isPlural == true ? pluralDamage : baseDamage), 15), attacker, hGroup[i], "suppress"));
				}
			}
			
			outputDamage(totalDamage);
		}
		
		public static var ShieldHack:SingleCombatAttack;
		private static function ShieldHackImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			
			if (!target.hasShields() || target.shields() <= 0)
			{
				if (attacker is PlayerCharacter) output("You attempt to hack the nonexistent shield" + (target.isPlural ? "s" : "") + " protecting " + target.getCombatName() + "! It doesn’t work - <b>there" + (target.isPlural ? " are no shields" : "’s no shield") + " there.</b>");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " attempt" + (attacker.isPlural ? "" : "s") + " to hack " + possessive(target.getCombatName()) + " shield" + (target.isPlural ? "s" : "") + "! It doesn’t work - <b>there" + (target.isPlural ? " are no shields" : "’s no shield") + " there.</b>");
				return;
			}
			
			if (attacker is PlayerCharacter) output("You attempt to wirelessly hack the shield" + (target.isPlural ? "s" : "") + " protecting " + target.getCombatName() + "!");
			else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " attempts to wirelessly hack your shield!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " attempt" + (attacker.isPlural ? "" : "s") + " to wirelessly hack the shield" + (target.isPlural ? "s" : "") + " protecting " + target.getCombatName() + "!");
			
			if (target is JaneriaSpawn || target is JaneriaCore)
			{
				output("\nHowever " + target.getCombatName() + " absorbs the electrical surge and it seems to strengthen it.");
				target.shields(25);
				return;
			}
			
			var d:TypeCollection = damageRand(new TypeCollection( { electric: Math.round(25 + attacker.level * 2.5 + attacker.bimboIntelligence() / 1.5) } ), 15);
			d.addFlag(DamageFlag.ONLY_SHIELD);
			
			var dr:DamageResult = calculateDamage(d, attacker, target, "suppress");
			
			if (target.shields() > 0)
			{
				if (target.isPlural) output(" " + StringUtil.capitalize(possessive(target.getCombatName()), false) + " shields crackle but hold.");
				else output(" " + StringUtil.capitalize(possessive(target.getCombatName()), false) + " shield crackles but holds.");
			}
			else
			{
				if (target.isPlural) output(" There is a concussive boom and tingling aftershock of energy as " + possessive(target.getCombatName()) + " shields are breached.");
				else output(" There is a concussive boom and a tingling aftershock of energy as " + possessive(target.getCombatName()) + " shield is breached.");
			}
			
			outputDamage(dr);
		}

		public static var ChargeShield:SingleCombatAttack;
		public static function ChargeShieldImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) 
			{
				if (attacker.hasPerk("Fuck Sense")) output("Your fingers fly across your shield generator, adjusting components to build up damaging static charge. You do a happy little wiggle while you work. It’ll make your butt look super great.");
				else output("Your fingers fly across your shield generator, adjusting components to build up damaging static charge. It should be good for two pulses, minimum.");
			}
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " tweak" + (attacker.isPlural ? "" : "s") + " " + attacker.getCombatPronoun("hisher") + " shield generator" + (attacker.isPlural ? "s" : "") + ". The nearly invisible barrier" + (attacker.isPlural ? "s shine" : " shines") + " brighter as a result. Better be careful when attacking!");
			
			var moddedInt:int = attacker.bimboIntelligence();
			var targetDamage:int = Math.round(10 + attacker.level * 3 + moddedInt);
			
			attacker.createStatusEffect("Charged Shield", 2, targetDamage, 0, moddedInt, false, "DefenseUp", "Chance of blinding attackers - and damaging melee attackers for up to " + targetDamage + " electrical damage!", true, 0);
		}
		
		public static var WeaponHack:SingleCombatAttack;
		public static function WeaponHackImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (target.hasStatusEffect("Disarm Immune"))
			{
				if (attacker is PlayerCharacter) output("You try to hack " + possessive(target.getCombatName()) + " weapon" + (target.isPlural ? "s" : "") + " but can’t. <b>It’s physically impossible!</b>");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (attacker.isPlural ? "y" : "ies") + " to hack " + possessive(target.getCombatName()) + " weapon" + (target.isPlural ? "s" : "") + " but can’t. <b>It’s physically impossible!</b>");
				return;
			}
			
			if (target.hasStatusEffect("Disarmed"))
			{
				if (attacker is PlayerCharacter) output("You try to hack " + possessive(target.getCombatName()) + " weapon" + (target.isPlural ? "s" : "") + " but can’t. <b>You’ve already hacked " + (target.isPlural ? "them" : "it") + "!</b>");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (attacker.isPlural ? "y" : "ies") + " to hack " + possessive(target.getCombatName()) + " weapon" + (target.isPlural ? "s" : "") + " but can’t. <b>" + (target.isPlural ? "They’ve" : "It’s") + " already been hacked!</b>");
				return;
			}
			
			if (!target.hasEnergyWeapon())
			{
				if (attacker is PlayerCharacter) output("You try to hack " + possessive(target.getCombatName()) + " weapon" + (target.isPlural ? "s" : "") + " but " + target.getCombatPronoun("heshe") + " ha" + (target.isPlural ? "ve" : "s") + " no energy weapons to shut down!");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (attacker.isPlural ? "y" : "ies") + " to hack " + possessive(target.getCombatName()) + " weapon" + (target.isPlural ? "s" : "") + " but " + target.getCombatPronoun("heshe") + " ha" + (target.isPlural ? "ve" : "s") + " no energy weapons to shut down!");
				return;
			}
			
			var attackIntelligence:Number = attacker.bimboIntelligence();
			var targetIntelligence:Number = target.bimboIntelligence();
			if (rand(20) + 1 + attackIntelligence / 2 < targetIntelligence / 2 + 10)
			{
				if (attacker is PlayerCharacter)
				{
					output("You try to hack " + possessive(target.getCombatName()) + " weapon" + (target.isPlural ? "s" : "") + ", but " + (target.isPlural ? "they’re" : target.getCombatPronoun("heshe") + "’s") + " too smart and too quick!");
					if (attackIntelligence > targetIntelligence - 5) output(".. this time.");
				}
				else if (target is PlayerCharacter)
				{
					output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (attacker.isPlural ? "y" : "ies") + " to hack your weapon, but you’re quick to defend against the remote intrusion.");
					if (attackIntelligence > targetIntelligence - 5) output(".. this time.");
				}
				else
				{
					output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (attacker.isPlural ? "y" : "ies") + " to hack " + possessive(target.getCombatName()) + " weapon" + (target.isPlural ? "s" : "") + ", but " + target.getCombatPronoun("heshe") + " react quickly and defend against the attack!");
				}
				return;
			}
			
			// Successful
			if (attacker is PlayerCharacter) output("You hack " + possessive(target.getCombatName()) + " weapon" + (target.isPlural ? "s" : "") + ", disarming " + target.getCombatPronoun("himher") + ".");
			else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " hacks your weapon, disarming you temporarily!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " hack" + (attacker.isPlural ? "" : "s") + " " + possessive(target.getCombatName()) + " weapon" + (target.isPlural ? "s" : "") + ", disarming " + target.getCombatPronoun("himher") + ".");
			
			applyDisarm(target, 4 + rand(2));
		}
		
		public static var PocketSand:SingleCombatAttack;
		private static function PocketSandImp(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			var aTarget:Creature = GetBestPotentialTarget(hGroup);
			if(aTarget == null)
			{
				output("It seems you have no target to use your pocket sand on.");
				return;
			}
			
			output("With a cry of <i>“Pocket sand!”</i> you produce a handful of sand and throw it at " + aTarget.getCombatName() + ".");
			
			for (var i:int = 0; i < hGroup.length; i++)
			{
				if (hGroup[i].isDefeated()) continue;
				
				var cTarget:Creature = hGroup[i] as Creature;
				
				if (attacker.aim() / 2 + rand(20) + 6 >= cTarget.reflexes() / 2 + 10 && !cTarget.hasStatusEffect("Blinded") && !cTarget.hasBlindImmunity())
				{
					applyBlind(cTarget, 3);
					
					output("\n<b>" + StringUtil.capitalize(cTarget.getCombatName(), false) + " " + (cTarget.isPlural ? "are" : "is") + " blinded by the coarse granules.</b>");
				}
				else
				{
					output("\n" + StringUtil.capitalize(cTarget.getCombatName(), false) + " manage" + (cTarget.isPlural ? "" : "s") + " to keep away from the blinding particles.");
				}
			}
		}
		
		public static var FlashGrenade:SingleCombatAttack;
		private static function FlashGrenadeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			var aTarget:Creature = GetBestPotentialTarget(hGroup);
			if(aTarget == null)
			{
				if (attacker is PlayerCharacter) output("It seems you have no target to use your flash grenade on.");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produce" + (attacker.isPlural ? "" : "s") + " a flash grenade--but with no target to use it on, " + attacker.getCombatPronoun("heshe") + " put" + (attacker.isPlural ? "" : "s") + " it away.");
				return;
			}
			
			if (attacker is PlayerCharacter) output("You produce one of your rechargeable flash grenades and huck it in the direction of " + aTarget.getCombatName() + ".");
			else if (aTarget is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " produce" + (attacker.isPlural ? "" : "s") + " a flash grenade and hucks it in your direction!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produce" + (attacker.isPlural ? "" : "s") + " a flash grenade and huck" + (attacker.isPlural ? "" : "s") + " it in the direction of " + target.getCombatName() + "!");
			
			for (var i:int = 0; i < hGroup.length; i++)
			{	
				if (hGroup[i].isDefeated()) continue;
				
				var cTarget:Creature = hGroup[i];
				
				if (cTarget.accessory is FlashGoggles)
				{
					if (cTarget is PlayerCharacter) output("\nYour goggles cover your eyes from the blinding projectile and you avoid being blinded.");
					else output("\n" + StringUtil.capitalize(cTarget.getCombatName(), false) + "’s goggles are activated by the blinding projectile and " + aTarget.getCombatPronoun("heshe") + " avoid" + (cTarget.isPlural ? "" : "s") + " being blinded.");
				}
				else if (cTarget.hasBlindImmunity())
				{
					if (cTarget is PlayerCharacter) output("\nYour eyes are unaffected by the blinding projectile and you avoid being blinded.");
					else output("\n" + StringUtil.capitalize(cTarget.getCombatName(), false) + " " + (cTarget.isPlural ? "are" : "is") + " unaffected by the blinding projectile and avoid" + (cTarget.isPlural ? "" : "s") + " being blinded.");
				}
				else if (attacker.aim() / 2 + rand(20) + 6 >= cTarget.reflexes() / 2 + 10 && !cTarget.hasStatusEffect("Blinded"))
				{
					applyBlind(cTarget, 3);
					
					if (cTarget is PlayerCharacter) output("\n<b>You’re blinded by the luminous flashes.</b>");
					else output("\n<b>" + StringUtil.capitalize(cTarget.getCombatName(), false) + " " + (cTarget.isPlural ? "are" : "is") + " blinded by the luminous flashes.</b>");
				}
				else
				{
					if (cTarget is PlayerCharacter) output("\nYou manage to avoid the blinding projectile.");
					else output("\n" + StringUtil.capitalize(cTarget.getCombatName(), false) + " manage" + (cTarget.isPlural ? "" : "s") + " to avoid the blinding projectile.");
				}
			}
		}
		
		public static var LowBlow:SingleCombatAttack;
		private static function LowBlowImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Melee") && !target.isImmobilized())
			{
				if(meleeCounterResults(attacker,target)) return;
			}
			
			if (attacker is PlayerCharacter) output("You swing low, aiming for a sensitive spot.");
			else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " swing" + (attacker.isPlural ? "" : "s") + " low at you, aiming for a sensitive spot.");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " swing" + (attacker.isPlural ? "" : "s") + " low at " + target.getCombatName() + ", aiming for a sensitive spot.");
			output("\n");
			
			if (combatMiss(attacker, target))
			{
				if (target.customDodge.length > 0) output(target.customDodge);
				else if (attacker is PlayerCharacter) output("You miss!");
				else output("You narrowly avoid the attack!");
			}
			else if (blindMiss(attacker, target, true))
			{
				if (attacker is PlayerCharacter) output("Your blind strike fails to connect.");
				else output(possessive(attacker.getCombatName()) + " blind strike" + (attacker.isPlural ? "s fail" : " fails") + " to connect.");
			}
			else
			{
				if (attacker is PlayerCharacter) output("You connect with your target" + (!target.isPlural ? "" : "s") + "!");
				else if (target is PlayerCharacter) output(possessive(attacker.getCombatName()) + " strike" + (attacker.isPlural ? "s connect" : " connects") + " with you!");
				else output(possessive(attacker.getCombatName()) + " strike" + (attacker.isPlural ? "s connect" : " connects") + " with " + target.getCombatName() + "!");
				
				var damHolder:Number = attacker.physique()/2;
				if((target.hasCock() || target.balls > 0) && target.isCrotchExposed())
				{
					damHolder += attacker.physique()/2;
				}
				if(target.balls > 0 && target.ballDiameter() >= 7) damHolder += attacker.physique();
				damHolder = Math.ceil(damHolder);

				applyDamage(damageRand(new TypeCollection( { kinetic: damHolder } ), 15), attacker, target, "minimal");
				if(target.isRobot() && !target.hasGenitals())
				{
					if (attacker is PlayerCharacter) output("\nIt had little effect on your automated foe!");
					else output("\nIt had little effect!");
				}
				else if (attacker is PlayerCharacter && (target is Kaska || target is CommanderSchora))
				{
					output("\n" + possessive(target.getCombatName()) + " eyes cross from the overwhelming pain. She sways back and forth like a drunken sailor before hitting the floor with all the grace of a felled tree. A high pitched squeak of pain rolls out of her plump lips. <b>She’s very, very stunned.</b>");
					applyStun(target, 3 + rand(2), false, "Cannot act for a while. You hit her balls pretty hard!");
				}
				else if (attacker.physique() / 2 + rand(20) + 1 >= target.physique() / 2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune"))
				{
					if (target is PlayerCharacter) output("\n<b>You are stunned!</b>");
					else output("\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (target.isPlural ? "are" : "is") + " stunned.</b>");
					applyStun(target, 2 + rand(2), false, "Cannot act for a while.");
				}
				else
				{
					if (attacker is PlayerCharacter)
					{
						output("\nIt doesn’t look like you accomplished much more than hitting your target.");
					}
					// potential outputs for other targets/the player not getting stunned
				}
			}
		}
		
		public static var DisarmingShot:SingleCombatAttack;
		private static function DisarmingShotImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			
			if (target.hasStatusEffect("Disarm Immune"))
			{
				if (attacker is PlayerCharacter) output("You try to disarm " + target.getCombatName() + " but can’t. <b>It’s physically impossible!</b>");
				else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (attacker.isPlural ? "y" : "ies") + " to disarm you but can’t!");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (attacker.isPlural ? "y" : "ies") + " to disarm " + target.getCombatName() + " but can’t. <b>It’s physically impossible!</b>");
				return;
			}
			
			if (target.hasStatusEffect("Disarmed"))
			{
				if (attacker is PlayerCharacter) output("You try to disarm " + target.getCombatName() + " but can’t. <b>" + (attacker.isPlural ? "They’ve" : (StringUtil.capitalize(target.getCombatPronoun("heshe"), false) + "’s")) + " already been disarmed!</b>");
				else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (attacker.isPlural ? "y" : "ies") + " to disarm you but can’t!");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (attacker.isPlural ? "y" : "ies") + " to disarm " + target.getCombatName() + " but can’t. <b>" + (target.isPlural ? "They’ve" : (StringUtil.capitalize(target.getCombatPronoun("heshe"), false) + "’s")) + " already been disarmed!</b>");
				return;
			}
			
			if (rangedCombatMiss(attacker, target))
			{
				if (attacker is PlayerCharacter) output("You try to disarm " + target.getCombatName() + " but miss.");
				else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (attacker.isPlural ? "y" : "ies") + " to disarm you but " + attacker.getCombatPronoun("heshe") + " narrowly miss the opportunity!");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (attacker.isPlural ? "y" : "ies") + " to disarm " + target.getCombatName() + " but " + attacker.getCombatPronoun("heshe") + " miss" + (attacker.isPlural ? "" : "es") + " the shot!");
				return;
			}
			
			if (attacker.isBlind())
			{
				if (attacker is PlayerCharacter) output("Your blind-fired shot had no chance to connect with such a tiny target!");
				else output(possessive(attacker.getCombatName()) + " blind-fired shot had no chance of connecting!");
				return;
			}
			
			// Hits
			if (attacker is PlayerCharacter) output("You land a crack shot on " + possessive(target.getCombatName()) + " weapon" + (target.isPlural ? "s" : "") + ", disarming " + target.getCombatPronoun("himher") + ".");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " shoots " + possessive(target.getCombatName()) + " weapons away with well-placed shots!");
			
			applyDisarm(target, 4);
		}
		
		public static var StealthFieldGenerator:SingleCombatAttack;
		private static function StealthFieldGeneratorImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			var rounds:int = 0;
			
			if (attacker is PlayerCharacter)
			{
				output("You activate your stealth field generator, fading into nigh-invisibility.");
				rounds = 4;
			}
			else
			{
				if(attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " activate their stealth field generators, each fading into nigh-invisibility.");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " activates a stealth field generator, fading into nigh-invisibility.");
				rounds = 4;
			}
			
			attacker.createStatusEffect("Stealth Field Generator", rounds, 0, 0, 0, false, "DefenseUp", "Provides a massive 80% bonus to evasion chances!", true, 0);
		}
		
		public static var Grenade:SingleCombatAttack;
		private static function GrenadeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{			
			var aTarget:Creature = GetBestPotentialTarget(hGroup);
			if(aTarget == null)
			{
				if (attacker is PlayerCharacter) output("It seems you have no target to use your explosive on.");
				else if(attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " produce explosives--but with no target to use it on, they put them away.");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces an explosive--but with no target to use it on, " + attacker.getCombatPronoun("heshe") + " puts it away.");
				return;
			}
			
			if (attacker is PlayerCharacter) 
			{
				output("Tossing an explosive in the general direction of your target, you unleash an explosive blast of force and heat on ");
				if(hGroup.length > 1) output("your enemies!");
				else output(aTarget.getCombatName() + "!");
			}
			else if (target is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " huck" + (attacker.isPlural ? " small devices" : "s a small device") + " in your direction, " + (attacker.isPlural ? "each unleashing explosive blasts just" : "unleashing an explosive blast scant") + " inches from your body!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " huck" + (attacker.isPlural ? " small devices" : "s a small device") + " in " + possessive(aTarget.getCombatName()) + " direction, " + (attacker.isPlural ? "each unleashing explosive blasts just" : "unleashing an explosive blast scant") + " inches from " + aTarget.getCombatPronoun("hisher") + " form!");
				
			var d:int = Math.round(7.5 + attacker.level * 2 + attacker.bimboIntelligence() / 2);
			var totalDamage:DamageResult = new DamageResult();
			var projectileDodged:int = 0;
			
			for (var i:int = 0; i < hGroup.length; i++)
			{
				var cTarget:Creature = hGroup[i];
				if (cTarget.isDefeated()) continue;
				
				var damage:TypeCollection = damageRand(new TypeCollection( { kinetic: d, burning: d } ), 15);
				
				if (cTarget is Cockvine) kGAMECLASS.adultCockvineGrenadesInEnclosedSpaces(damage, false, false, false);
				if (cTarget.hasPerk("Get Down!")) ++projectileDodged;
				
				totalDamage.addResult(applyDamage(damage, attacker, cTarget, "explosion"));
			}
			
			kGAMECLASS.explosionDodgeBlurb(projectileDodged, attacker, cTarget, "explosion");
			outputDamage(totalDamage);
		}
		
		public static var GasGrenade:SingleCombatAttack;
		private static function GasGrenadeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{			
			var aTarget:Creature = GetBestPotentialTarget(hGroup);
			if(aTarget == null)
			{
				if (attacker is PlayerCharacter) output("It seems you have no target to use your gas grenade on.");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produce" + (attacker.isPlural ? " gas grenades" : "s a gas grenade") + "--but with no target to use it on, " + attacker.getCombatPronoun("heshe") + " puts it away.");
				return;
			}
			
			if (attacker is PlayerCharacter) output("Tossing a hissing grenade in the general direction of your target" + (aTarget.isPlural ? "s" : "") + ", you watch the gaseous stuff do its trick.");
			else if (aTarget is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " toss" + (attacker.isPlural ? " small devices" : "es a small device") + " in your direction, great clouds of thick, gaseous vapor pouring from " + (attacker.isPlural ? "each of them" : "within its body") + ".");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " toss" + (attacker.isPlural ? " small devices" : "es a small device") + " in " + possessive(aTarget.getCombatName()) + " direction, " + (attacker.isPlural ? "thick trails of gaseous vapor hang heavily in the air to demark their arcing path" : "a thick trail of gaseous vapor hanging heavily in the air to demark the arcing path taken") + ".");
			
			var d:int = 14 + attacker.level * 2;
			var totalDamage:DamageResult = new DamageResult();
			var gasDodged:int = 0;
			
			for (var i:int = 0; i < hGroup.length; i++)
			{
				var cTarget:Creature = hGroup[i] as Creature;
				
				if (cTarget.isDefeated()) continue;
				
				var damage:TypeCollection = damageRand(new TypeCollection( { drug: d } ), 15);
				
				if (cTarget.hasPerk("Get Down!")) ++gasDodged;
				if (cTarget is Cockvine)
				{
					kGAMECLASS.adultCockvineGrenadesInEnclosedSpaces(damage, false, false, true);
				}
				if(cTarget.hasAirtightSuit())
				{
					output("\nThe attack is ineffective against " + ((hGroup.length == 1 || (cTarget is PlayerCharacter)) ? cTarget.getCombatPronoun("hisher") : (cTarget.getCombatName() + "’s")) + " airtight suit" + (((cTarget is PlayerCharacter) || !cTarget.isPlural) ? "" : "s") + "!");
					continue;
				}
				
				totalDamage.addResult(applyDamage(damage, attacker, cTarget, "suppress"));
			}
			
			kGAMECLASS.explosionDodgeBlurb(gasDodged, attacker, target, "gas");
			outputDamage(totalDamage);
		}
		
		public static var SmuggledStimulant:SingleCombatAttack;
		public static function SmuggleStimulatImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			attacker.createStatusEffect("Used Smuggled Stimulant", 3, 0, 0, 0, true, "", "", true, 0);
			
			if (attacker is PlayerCharacter) output("You inject yourself with a smuggled stimulant.");
			else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " each jam a small injector deep into their thighs, visibly filling with energy!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " jams a small injector deep into " + attacker.getCombatPronoun("hisher") + " thigh, visibly filling with energy!");
		}
		
		public static var BurstOfEnergy:SingleCombatAttack;
		private static function BurstOfEnergyImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			attacker.energy(60);
			attacker.createStatusEffect("Used Burst of Energy", 0, 0, 0, 0, true, "", "", true, 0);
			
			if (attacker is PlayerCharacter) output("You dig deep and find a reserve of energy from within yourself!");
			else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " visibly steel themselves, dig deep and find a reserve of energy from within!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " visibly steels " + attacker.getCombatPronoun("hisher") + "self, reaching deep and finding a reserve of energy!");
		}
		
		public static var MagBinders:SingleCombatAttack;
		public static function MagBindersImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			
			if (attacker is PlayerCharacter)
			{
				output("You produce a set of self-guided restraints and sling them at your target!\n");
			}
			else
			{
				output(StringUtil.capitalize(attacker.getCombatName(), false) + " sling" + (attacker.isPlural ? "" : "s") + " a set of self-guided restraints your way.\n");
			}
	
			if (rangedCombatMiss(attacker, target))
			{
				if (attacker is PlayerCharacter)
				{
					if(target.customDodge.length == 0) output("You miss!");
					else output(target.customDodge);
				}
				else
				{
					output(StringUtil.capitalize(attacker.getCombatPronoun("heshe"), false) + " miss" + (attacker.isPlural ? "" : "es") + ".");
				}
			}
			/* No extra miss for blind. SELF-GUIDED, BITCHES!
			else if (attacker.hasStatusEffect("Blinded") && rand(2) > 0)
			{
				if (attacker is PlayerCharacter) output("Your blind projectile fails to connect.");
				else output(StringUtil.capitalize(attacker.getCombatPronoun("hisher"), false) + " blind projectile fails to connect.");
			}*/
			//Attack connected!
			else
			{
				var bStun:Boolean = false;
				output("They connect with an audible ‘<i>zap</i>’");
				if (attacker.reflexes() / 2 + rand(20) + 1 >= target.reflexes() / 2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune")) 
				{
					if(target is PlayerCharacter) output(" and snap into place, wrapping you up. <b>You are stunned!</b>");
					else
					{
						if (target.isPlural) output(" and wrap up <b>" + target.getCombatName() + ", stunning them.</b>");
						else output(" and snap into place. <b>" + StringUtil.capitalize(target.getCombatName(), false) + " is stunned!</b>");
					}
					bStun = true;
				}
				else
				{
					if(attacker is PlayerCharacter) output(", but " + target.getCombatName() + " struggle" + (target.isPlural ? "" : "s") + " out before they can snap into place.");
					else if(target is PlayerCharacter) output(", but you struggle out before they can restrain you.");
					else output(", but " + target.getCombatName() + " struggle" + (target.isPlural ? "" : "s") + " out before they can snap into place.");
				}
				applyDamage(damageRand(new TypeCollection( { electric: attacker.reflexes() + attacker.level * 2 } ), 15), attacker, target, "minimal");
				if(bStun) applyStun(target, 2 + rand(3));
			}
		}
		
		public static var ConcussiveShot:SingleCombatAttack;
		private static function ConcussiveShotImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			
			if (attacker is PlayerCharacter) output("You nock one of your concussive arrows and draw your bowstring back, taking careful aim at the space just ahead of " + target.getCombatName() + ".");
			else throw new Error("Concussive Shot does not support a non-player attacker!");
			
			if (rangedCombatMiss(attacker, target, 0))
			{
				output(" You let fly, but the arrow sails clean past your intended target" + (target.isPlural ? "s" : "") + ".");
			}
			else if (blindMiss(attacker, target, false))
			{
				output(" Your blind <b>concussion shot</b> missed.");
			}
			else
			{
				var bStun:Boolean = false;
				output(" You let fly, and a moment later, the arrow explodes in a shockwave of force");
				
				if (target.physique()/2 + rand(20) + 1 >= attacker.aim()/2 + 10 || target.hasStatusEffect("Stun Immune"))
				{
					output(" though " + target.getCombatName() + " resist" + (target.isPlural ? "" : "s") + " the blast. Your stun-shot failed!");
				}
				else
				{
					output(", stunning your enemy!");
					bStun = true;
				}
				
				// Add some burning damage for the explosion
				var damage:TypeCollection = attacker.rangedDamage();
				damage.add(new TypeCollection( { burning: 10 } ));
				damage = damageRand(damage,15);
				applyDamage(damage, attacker, target, "ranged");
				if(bStun)
				{
					var rounds:int = 1 + rand(2);
					applyStun(target, rounds, false, "Cannot act for " + rounds + " turn" + (rounds == 1 ? "" : "s") + ".");
				}
			}
		}
		
		public static var MultiArrow:SingleCombatAttack;
		private static function MultiArrowImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			
			if (attacker is PlayerCharacter) output("You nock a number of your smart arrows and draw your hardlight bowstring back, taking careful aim at the space just ahead of your enemy.");
			else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " nock a number of their smart arrows and draw your hardlight bowstrings back, taking careful aim at the space just ahead of you.");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " nocks a number of " + attacker.getCombatPronoun("hisher") + " smart arrows and draws " + attacker.getCombatPronoun("hisher") + " hardlight bowstring back, taking careful aim at the space just ahead of you.");
			
			// Count active targets
			var numFoes:int = 0;
			var i:int = 0;
			for(i = 0; i < hGroup.length; i++)
			{
				if (!hGroup[i].isDefeated()) numFoes++;
			}
			// Number of arrows shot (or one arrow per target)
			var shots:Number = 4;
			if(shots < numFoes) shots = numFoes;
			// Each target gets a hit
			for(i = 0; i < hGroup.length; i++)
			{
				var cTarget:Creature = hGroup[i] as Creature;
				if (cTarget.isDefeated()) continue;
				output("\n");
				if (rangedCombatMiss(attacker, cTarget, 0))
				{
					if (attacker is PlayerCharacter) output("You let loose, but the arrows sail clean past your intended target.");
					else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " let loose, but the arrows sail clean past their intended target.");
					else if (cTarget is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " lets loose, but the arrows sail clean past you.");
					else output(StringUtil.capitalize(attacker.getCombatName(), false) + " lets loose, but the arrows sail clean past " + attacker.getCombatPronoun("hisher") + " intended target.");
				}
				else if (blindMiss(attacker, target, false))
				{
					if (attacker is PlayerCharacter) output("Your blind <b>multi-arrow shot</b> missed " + cTarget.getCombatName() + ".");
					else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " blind <b>multi-arrow shot</b> missed " + cTarget.getCombatName() + ".");
					else if (cTarget is PlayerCharacter) output("Luckily, " + attacker.getCombatName() + "’s blind <b>multi-arrow shot</b> missed you.");
					else output(StringUtil.capitalize(attacker.getCombatName(), false) + "’s blind <b>multi-arrow shot</b> missed " + cTarget.getCombatName() + ".");
				}
				else
				{
					if (attacker is PlayerCharacter) output("You let loose and land a hit on " + cTarget.getCombatName() + " with your <b>multi-arrow shot</b>!");
					else if (attacker.isPlural) output(StringUtil.capitalize(attacker.getCombatName(), false) + " let loose and hit " + cTarget.getCombatName() + " with their <b>multi-arrow shot</b>!");
					else if (cTarget is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " lets loose and hits you with " + attacker.getCombatPronoun("hisher") + " <b>multi-arrow shot</b>!");
					else output(StringUtil.capitalize(attacker.getCombatName(), false) + " lets loose and hits " + cTarget.getCombatName() + " with " + attacker.getCombatPronoun("hisher") + " <b>multi-arrow shot</b>!");
					
					var damage:TypeCollection = attacker.rangedDamage();
					damage.multiply(shots * (1 / numFoes));
					applyDamage(damage, attacker, cTarget, "minimal");
				}
			}
		}
		
		public static var GoozookaAttack:SingleCombatAttack;
		private static function GoozookaAttackImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(target.hasStatusEffect("Counters Ranged") && !target.isImmobilized())
			{
				if(rangedCounterResults(attacker,target)) return;
			}
			
			attacker.destroyItemByClass(GrayMicrobots, 1);
	
			output("You pull the goo launcher from over your shoulder and slam a vial of Gray Goo into the back. You brace yourself, sighting in on your target" + (target.isPlural ? "s" : "") + " and flipping the ON switch. The launcher beeps, and you pull the trigger, sending a great big blob of gray goop hurtling toward your opponent" + (target.isPlural ? "s" : "") + "!");
			
			if (rangedCombatMiss(attacker, target, 0))
			{
				// Missed
				output("\n\nHowever the goo sample goes wide, splattering on the ground a little ways away. A moment later, a miniature gray googirl congeals from the mess, looks around, and starts hauling ass away from the fight. Whoops.");
			}
			else
			{
				var damage:TypeCollection;
				var damageResult:DamageResult
				
				// Hit
				if (target is GrayGoo)
				{
					output("\n\nAlthough you probably should have thought this plan through a little better before actioning it; firing Gray Goo samples <i>at a Gray Goo</i> might not have been the smartest choice. All you seem to have achieved is bolstering the strength of your foe!\n");
					
					var heal:Number = target.HPMax() * 0.2;
					if (target.HP() + heal > target.HPMax()) heal = target.HPMax() - target.HP();
					
					damage = new TypeCollection( { tease: 5 } );
					damageResult = applyDamage(damage, attacker, target, "suppress");
					
					output("The Gray Goo absorbs her smaller twin on contact.");
					output(" (Heals " + heal + ")");
					
					target.HP(heal);
				}
				else
				{
					output("\n\nThe gray goo splatters across " + target.getCombatName() + ", quickly congealing into a miniature googirl who quickly goes to work, attacking your enem" + (target.isPlural ? "ies’" : "y’s") + " most sensitive spots with gusto. ");
				
					damage = new TypeCollection( { tease: 33 } );
					damageResult = applyDamage(damage, attacker, target, "suppress");
					output("\n");
					output(teaseReactions(damageResult.lustDamage, target));
				}
				
				outputDamage(damageResult);
			}
		}
		
		public static var ResinDefense:SingleCombatAttack;
		private static function ResinDefenseImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{if (attacker is PlayerCharacter)
			{
				output("You emit a rumbling, soughing groan as you force the pores of your bark skin open, allowing resin to drool out down your heavy limbs. The liquid amber quickly hardens, forming a sweet-smelling layer of protection across great swathes of your lumbering form.");
			}
			else
			{
				output(StringUtil.capitalize(attacker.getCombatName(), false) + " force" + (attacker.isPlural ? "" : "s") + " liquid amber from " + attacker.getCombatPronoun("hisher") + " body which quickly hardens into a layer of armor.");
			}
			
			var resinDur:int = 4;
			attacker.createStatusEffect("Resin", resinDur, 0, 0, 0, false, "DefenseUp", (((attacker is PlayerCharacter) ? "You are" : StringUtil.capitalize(attacker.getCombatName(), false) + " is") + " covered in a sweet-smelling, hardened amber."), true, 0, 0xFFFFFF);
			
			for (var i:int = 0; i < hGroup.length; i++)
			{
				var cTarget:Creature = hGroup[i] as Creature;
				
				if (cTarget.isDefeated()) continue;
				
				cTarget.createStatusEffect("Resin Aroma", resinDur, 0, 0, 0, false, "Charmed", (((cTarget is PlayerCharacter) ? "You are" : StringUtil.capitalize(cTarget.getCombatName(), false) + " is") + " standing in the path of a sweet smell."), true, 0, 0xB793C4);
			}
		}
		
		public static var PollenVeil:SingleCombatAttack;
		private static function PollenVeilImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			var aTarget:Creature = GetBestPotentialTarget(hGroup);
			if(aTarget == null)
			{
				if (attacker is PlayerCharacter) output("It seems you have no target to use your lust-inducing spores on.");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " attempt" + (attacker.isPlural ? "" : "s") + " to use " + attacker.getCombatPronoun("hisher") + " spores but there is no one to use it on.");
				return;
			}
			
			if (attacker is PlayerCharacter)
			{
				output("You smile winningly at your opponent" + (aTarget.isPlural ? "s" : "") + " as you allow your plant pores to open and think sunny, summery thoughts; of buzzing, busy insects, ripe fruit and sticky fingers... You turn as you do it, opening your arms to waft the seething cloud of tiny yellow spores around you outwards, at the same time as elegantly drawing attention to your [pc.chest], your [pc.ass] and the flourish of your flowers.");
				output("\n\n<i>“Do you feel me?”</i> you ask softly, gazing at " + aTarget.getCombatName() + " with half-lidded eyes. <i>“You will soon.”</i>");
			}
			else
			{
				output(StringUtil.capitalize(attacker.getCombatName(), false) + " emit" + (attacker.isPlural ? "" : "s") + " a cloud of lust-inducing spores from " + attacker.getCombatPronoun("hisher") + " body in " + possessive(aTarget.getCombatName()) + " direction.");
			}
			
			var lustDur:int = 4;
			attacker.createStatusEffect("Pollen Veil", lustDur, 0, 0, 0, false, "Icon_Smelly", (((attacker is PlayerCharacter) ? "You are" : StringUtil.capitalize(attacker.getCombatName(), false) + " is") + " emitting lust-inducing spores."), true, 0, 0xFFFFFF);
			
			for (var i:int = 0; i < hGroup.length; i++)
			{
				var cTarget:Creature = hGroup[i] as Creature;
				
				if (cTarget.isDefeated()) continue;
				
				cTarget.createStatusEffect("Pollen Lust", lustDur, 0, 0, 0, false, "Charmed", (((cTarget is PlayerCharacter) ? "You are" : (StringUtil.capitalize(cTarget.getCombatName(), false) + " " + (cTarget.isPlural ? "are" : "is"))) + " under the effects of lust-inducing spores!"), true, 0, 0xB793C4);
			}
		}
		
		public static var WrenchAttack:SingleCombatAttack;
		private static function WrenchAttachImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			//Charged attack!
			if(!attacker.hasStatusEffect("Wrench Charge"))
			{
				output(StringUtil.capitalize(attacker.getCombatName(), false) + " hefts her wrench up over her head, readying a powerful downward stroke. If you act quickly, you can interrupt her!");
				attacker.createStatusEffect("Wrench Charge", attacker.HP(),0,0,0);
			}
			//Already charged, lets do this!
			else
			{
				//Interrupted
				if(attacker.statusEffectv1("Wrench Charge") > attacker.HP()) output(StringUtil.capitalize(attacker.getCombatName(), false) + " staggers, dropping her heavy weapon down from its striking posture. She looks less than pleased by this development!");
				//Miss
				else if(combatMiss(attacker, target))
				{
					output(StringUtil.capitalize(attacker.getCombatName(), false) + " brings her weapon down in a vicious two-handed strike but fails to connect!");
				}
				//Hit
				else
				{
					var bStun:Boolean = false;
					//[enemy.short][capital]
					output(StringUtil.capitalize(attacker.getCombatName(), false) + " slams down her wrench in a heavy blow. It connects solidly, and your head is ringing from the brutal hit.");
					// Stun chance
					if (!target.hasStatusEffect("Stunned") && target.physique() + rand(20) + 1 < 40)
					{
						output(" <b>The hit was hard enough to stun you!</b>");
						bStun = true;
					}
					var damage:TypeCollection = attacker.meleeDamage();
					damage.multiply(2);
					damageRand(damage, 15);
					applyDamage(damage, attacker, target);
					if(bStun) applyStun(target, 1);
				}
				attacker.removeStatusEffect("Wrench Charge");
			}
		}
		
		public static var TripAttack:SingleCombatAttack;
		private static function TripAttackImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			var aPlural:Boolean = ((attacker is PlayerCharacter) || attacker.isPlural);
			var tPlural:Boolean = ((target is PlayerCharacter) || target.isPlural);
			
			output(StringUtil.capitalize(attacker.getCombatName(), false) + " tr" + (aPlural ? "y" : "ies") + " to trip " + target.getCombatName() + "! ");
			if (target.hasFlightEffects()) output("In your flight, " + target.getCombatPronoun("heshe") + " " + (tPlural ? "are" : "is") + " able to swiftly dart away from the misguided attempt.");
			else if (target.isPlanted()) output("Being firmly planted to the ground makes the attempt to trip " + target.getCombatPronoun("himher") + " essentially useless.");
			else if ((target.reflexes()/2 + rand(20) + 1 >= attacker.physique()/2 + 10)) output(StringUtil.capitalize(target.getCombatPronoun("heshe")) + " neatly hop" + (tPlural ? "s" : "") + " over the misguided attempt.");
			else
			{
				output(StringUtil.capitalize(target.getCombatPronoun("heshe")) + " go" + (tPlural ? "es" : "") + " down to the ground! <b>" + StringUtil.capitalize(target.getCombatPronoun("heshe")) + "’" + (tPlural ? "re" : "s") + " going to have a difficult time fighting from down here!</b>");
				applyTrip(target);
				
				applyDamage(new TypeCollection( { kinetic: 1 } ), attacker, target);
			}
		}
		public static var AphrodisiacDarts:SingleCombatAttack;
		private static function AphrodisiacDartsImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			var damage:int = 0;
			var hit:Boolean = true;
			//Hacky-ass solution for male raskvel. Will need tweaked if a proper mob ever uses the attack
			if(attacker is RaskvelMale) output("<i>“Boo! Raaaaar!”</i> shouts the big raskvel, waving his arms at you. At the same time, one of the others pulls an injector gun from his belt and fires three needles at you near soundlessly.")
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " pulls a gun off her hip, levels it, and pulls the trigger. The only reports are a trio of near-silent hisses as three injectors fly through the air toward you.");
			//Blocked
			if(target.shields() > 0) 
			{
				output("\nThe needles break apart uselessly on contact with your defenses.");
				hit = false;
			}
			//Miss (can't be completely dodged)
			else if(rangedCombatMiss(attacker, target)) 
			{
				output("\nYou manage to avoid most of the projectiles, but one still impacts your arm, stinging you with a pinprick of pain. You yank it out, but its payload is already spent, injected inside you.");
				applyDamage(new TypeCollection( { tease: 3 + rand(3) } ), attacker, target, "minimal");
			}
			//Medium hit
			else if(rangedCombatMiss(attacker, target))
			{
				output("\nTwo needles slam into your body, imparting bursts of searing pain when they penetrate your flesh. You yank them out in irritation, but whatever they contained is inside you now.");
				applyDamage(new TypeCollection( { tease: 7 + rand(3) } ), attacker, target, "minimal");
			}
			//Full Hit
			else
			{
				output("\nAll three needles hit you before you can react.");
				applyDamage(new TypeCollection( { tease: 11 + rand(3) } ), attacker, target, "minimal");
			}
			//Reactions
			if(hit)
			{
				output("\n\n");
				if(target.lust() < 33) output("An unwelcome heat suffuses your body as the chemicals do their work.");
				else if(target.lust() < 45) output("Your heart beats faster as you look at your foe’s body." + attacker.mf("","Her outfit seems a bit more revealing, and her movements seem more sexually enticing than ever before."));
				else if(target.lust() < 55) 
				{
					if(target.hasCock()) 
					{
						output("[pc.EachCock] pulsates as it fills with burgeoning tumescence.");
						if(attacker is RaskvelFemale) output(" You find yourself wondering what it would be like to slip into her puffy, double-clitted box.");
					}
					else if(target.hasVagina()) output("[pc.EachVagina] grows sensitive and moist as you ponder the merits of fucking this fetching little lizard-" + attacker.mf("man","woman") + ".");
					else output("Your [pc.nipples] harden as you idly consider forcing " + attacker.mf("him","her") + " to lick you while suckling on " + attacker.mf("his reptilian tool.","her twin clits."));
				}
				else if(target.lust() < 65) output("You groan out loud as the aphrodisiacs surges through your bloodstream, rousing you into a " + target.rawmf("rut","heat") + " that you have have a hard time suppressing.");
				else if(target.lust() < 75) output(target.mf("Grunting","Whimpering") + " in anticipation of what is to come, you ball your hands into fists as you try to endure the rising need as it spreads through your body. It feels like your brain is oozing down into your crotch, fixating utterly on sex. You want to fuck right now. You NEED to fuck soon.");
				else if(target.lust() < 85) output("You stagger as the lust hits you, stirring your already aroused body to new heights of need. Your [pc.legs] tremble, and the desperate, animal need to copulate thrums through your quivering muscles, filling them with an artificial desire.");
				else if(target.lust() < 95) 
				{
					output("The payload has its way with your aroused body as it rushes through your veins. It acts quickly, like other intravenious drugs, turning you on with each beat of your heart.");
					if(target.hasCock() || target.hasVagina()) output(" Your genitals drip with need as y");
					else output(" Y");
					output("ou idly consider throwing the fight for a quick fuck.");
				}
				else output("You whimper as the drugs pour through your body and melt your resistance into a bubbling puddle of distilled fuck. Your body is hot, feverish even, and you lose the will to resist as the absolute need to tend to your state asserts itself.");
			}
			if(attacker is RaskvelMale && target.lust() < target.lustMax())
			{
				target.createStatusEffect("Attempt Seduction", 0, 0, 0, 0, true, "", "", true, 0);
			}
		}
		//Returns true if the attack is actually interrupted!
		public static function rangedCounterResults(attacker:Creature,target:Creature):Boolean
		{
			if(target is Shizuya)
			{
				if (target.statusEffectv1("Counters Ranged") == 0) kGAMECLASS.shizzyCounterAttack(attacker);
				return true;
			}
			if(target is NaleenHerm)
			{
				if(target.isBlind() || target.isImmobilized())
				{
					target.setStatusValue("Counters Melee",1,0);
					target.setStatusValue("Counters Ranged",1,0);
				}
				else
				{
					target.addStatusValue("Counters Ranged",1,1);
					target.setStatusValue("Counters Melee",1,0);
					if(target.statusEffectv1("Counters Ranged") >= 3)
					{
						(target as NaleenHerm).rangedCounter(attacker);
						return true;
					}
				}
			}
			return false;
		}
		public static function meleeCounterResults(attacker:Creature,target:Creature):Boolean
		{
			if(target is Shizuya)
			{
				if (target.statusEffectv1("Counters Melee") == 0) kGAMECLASS.shizzyCounterAttack(attacker,true);
				return true;
			}
			if(target is NaleenHerm)
			{
				if(target.isBlind() || target.isImmobilized())
				{
					target.setStatusValue("Counters Melee",1,0);
					target.setStatusValue("Counters Ranged",1,0);
				}
				else
				{
					target.addStatusValue("Counters Melee",1,1);
					target.setStatusValue("Counters Ranged",1,0);
					if(target.statusEffectv1("Counters Melee") >= 3)
					{
						(target as NaleenHerm).meleeCounter(attacker);
						return true;
					}
				}
			}
			if(target is ZaikaMilkThief)
			{
				if(!target.hasStatusEffect("MeleeHit")) target.createStatusEffect("MeleeHit");
				return false;
			}
			return false;
		}
		//SHIP SPECIAL ATTACKS!
		public static var Evasion:SingleCombatAttack;
		public static function EvasionImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(attacker.hasPerk("PCs")) output("You close off the weapon relays and put both hands on the stick. Time to fly for your life!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " begins to dodge like crazy, trying its hardest to evade incoming fire!");
			if(!attacker.hasStatusEffect("Evading!")) attacker.createStatusEffect("Evading!",0,0,0,0,false,"Icon_DefUp","+50 evasion for one round.",true);
		}
		public static var Recharge:SingleCombatAttack;
		public static function RechargeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if(attacker.hasPerk("PCs")) 
			{
				clearOutput();
				output("Playing it cool, you keep your power load low to allow your reactor to recharge faster...");
			}
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " minimizes its power load, presumably attempting to recharge its capacitor banks.");
			if(!attacker.hasStatusEffect("CHARGING_POWER")) attacker.createStatusEffect("CHARGING_POWER",0,0,0,0,true,"","",true);
			attacker.energy((attacker as ShittyShip).shipPowerGen());
		}
	}

}
