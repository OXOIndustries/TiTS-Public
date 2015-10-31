package classes.GameData 
{
	import classes.Characters.Celise;
	import classes.Characters.Kaska;
	import classes.Characters.PlayerCharacter;
	import classes.Characters.ZilFemale;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.GLOBAL;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.kGAMECLASS;
	import fl.events.InteractionInputType;
	
	import classes.Engine.Interfaces.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Utility.rand;
	
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
				
				if (!atk.IsDisplayable(target)) continue;
				
				atks.push(atk);
			}
		}
		
		private static var o:CombatAttacks;
		private static var a:Array;
		
		{
			a = new Array();
			o = new CombatAttacks();
		}
		
		private function CombatAttacks()
		{
			// Headbutt
			Headbutt = new SingleCombatAttack();
			Headbutt.ButtonName = "Headbutt";
			Headbutt.EnergyCost = 25;
			Headbutt.RequiresClass = GLOBAL.CLASS_MERCENARY;
			Headbutt.TooltipTitle = "Headbutt";
			Headbutt.TooltipBody = "A physique-based attack that does not benefit from weapon damage but has a chance of stunning your target.";
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
			PowerStrike.Implementor = PowerStrikeImpl; // powerStrike
			a.push(PowerStrike);
			
			// Take Cover
			TakeCover = new SingleCombatAttack();
			TakeCover.ButtonName = "Take Cover";
			TakeCover.EnergyCost = 20;
			TakeCover.RequiresPerk = "Take Cover";
			TakeCover.TooltipTitle = "Take Cover";
			TakeCover.TooltipBody = "Increased ranged evasion to 90% for three turns.";
			TakeCover.Implementor = TakeCoverImpl; // takeCover;
			TakeCover.RequiresTarget = false;
			a.push(TakeCover);
			
			// Carpet Grenades
			CarpetGrenades = new SingleCombatAttack();
			CarpetGrenades.ButtonName = "Carpet Grenades";
			CarpetGrenades.EnergyCost = 25;
			CarpetGrenades.RequiresPerk = "Carpet Grenades";
			CarpetGrenades.DisabledIfEffectedBy = ["Disarmed"];
			CarpetGrenades.TooltipTitle = "Carpet Grenades";
			CarpetGrenades.TooltipBody = "An attack that is extra effective against multiple foes. Its damage is increased by level and intelligence."; 
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
			DetonationCharge.Implementor = DetonationChargeImpl; // detCharge
			a.push(DetonationCharge);
			
			// Second Wind
			SecondWind = new SingleCombatAttack();
			SecondWind.ButtonName = "Second Wind";
			SecondWind.RequiresLevel = 5;
			SecondWind.DisabledIfEffectedBy = ["Used Second Wind"];
			SecondWind.TooltipTitle = "Second Wind";
			SecondWind.TooltipBody = "Regenerate 50% of your maximum HP and energy once per battle! An invaluable ability for the mercenary in the field.";
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
			Volley.IsRangedBased = true;
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
			Volley.TooltipBody = "Perform a ranged attack with an additional, low-accuracy attack added on. Can blind foes based upon aim and the target's reflexes, but only if done with <b>an energy weapon.</b>";
			Volley.Implementor = VolleyImpl;
			a.push(Volley);
			
			// Overcharge
			Overcharge = new SingleCombatAttack();
			Overcharge.ButtonName = "Overcharge";
			Overcharge.EnergyCost = 20;
			Overcharge.RequiresPerk = "Overcharge";
			Overcharge.DisabledIfEffectedBy = ["Disarmed"];
			Overcharge.RequiresDamageFlags = [DamageFlag.ENERGY_WEAPON];
			Overcharge.IsRangedBased = true;
			Overcharge.TooltipTitle = "Overcharge";
			Overcharge.TooltipBody = "A powerful ranged attack, Overcharge deals 150% damage and has a chance of stunning. Higher intelligence increases the chance of successfully stunning your foe.";
			Overcharge.Implementor = OverchargeImpl;
			a.push(Overcharge);
			
			// Deflector Regen
			DeflectorRegeneration = new SingleCombatAttack();
			DeflectorRegeneration.ButtonName = "D. Regen";
			DeflectorRegeneration.EnergyCost = 20;
			DeflectorRegeneration.RequiresPerk = "Deflector Regeneration";
			DeflectorRegeneration.TooltipTitle = "Deflector Regeneration";
			DeflectorRegeneration.TooltipBody = "Restores a portion of your shields every turn for four turns. Higher intelligence will increase the amount.";
			DeflectorRegeneration.RequiresTarget = false;
			DeflectorRegeneration.Implementor = DeflectorRegenerationImpl;
			a.push(DeflectorRegeneration);
			
			// Power Surge
			PowerSurge = new SingleCombatAttack();
			PowerSurge.ButtonName = "P. Surge";
			PowerSurge.EnergyCost = 33;
			PowerSurge.RequiresPerk = "Power Surge";
			PowerSurge.TooltipTitle = "Power Surge";
			PowerSurge.TooltipBody = "Restores a moderate amount of shields based on intelligence.";
			PowerSurge.RequiresTarget = false;
			PowerSurge.Implementor = PowerSurgeImpl;
			a.push(PowerSurge);
			
			// Thermal Disruptor
			ThermalDisruptor = new SingleCombatAttack();
			ThermalDisruptor.ButtonName = "T. Disrupt";
			ThermalDisruptor.EnergyCost = 25;
			ThermalDisruptor.RequiresPerk = "Thermal Disruptor";
			ThermalDisruptor.DisabledIfEffectedBy = ["Disarmed"];
			ThermalDisruptor.TooltipTitle = "Thermal Disruptor";
			ThermalDisruptor.TooltipBody = "Deals a large amount of intelligence-based thermal damage to a single target.";
			ThermalDisruptor.Implementor = ThermalDisruptorImpl;
			a.push(ThermalDisruptor);
			
			// Grav Disruptor
			GravidicDisruptor = new SingleCombatAttack();
			GravidicDisruptor.ButtonName = "G. Disrupt";
			GravidicDisruptor.EnergyCost = 25;
			GravidicDisruptor.RequiresPerk = "Gravidic Disruptor";
			GravidicDisruptor.DisabledIfEffectedBy = ["Disarmed"];
			GravidicDisruptor.TooltipTitle = "Gravidic Disruptor";
			GravidicDisruptor.TooltipBody = "Deals a moderate amount of intelligence-based, Unresistable damage to a single target.";
			GravidicDisruptor.Implementor = GravidicDisruptorImpl;
			a.push(GravidicDisruptor);
			
			// Shield Hack
			ShieldHack = new SingleCombatAttack();
			ShieldHack.ButtonName = "S. Hack";
			ShieldHack.EnergyCost = 25;
			ShieldHack.RequiresPerk = "Shield Hack";
			ShieldHack.TooltipTitle = "Shield Hack";
			ShieldHack.TooltipBody = "An attack that deals a high amount of electric-typed damage to a target's shields. Damage is increased by intelligence.";
			ShieldHack.Implementor = ShieldHackImpl;
			a.push(ShieldHack);
			
			// Weapon Hack
			WeaponHack = new SingleCombatAttack();
			WeaponHack.ButtonName = "W. Hack";
			WeaponHack.EnergyCost = 10;
			WeaponHack.RequiresPerk = "Weapon Hack";
			WeaponHack.TooltipTitle = "Weapon Hack";
			WeaponHack.TooltipBody = "Attempt to neutralize a foe's <b>energy weapon</b> using your intelligence. Smarter foes will resist your attempts.";
			WeaponHack.Implementor = WeaponHackImpl;
			a.push(WeaponHack);
			
			// PocketSand/Flash Grenade
			PocketSand = new SingleCombatAttack();
			PocketSand.ButtonName = "P. Sand";
			PocketSand.EnergyCost = 10;
			PocketSand.RequiresClass = GLOBAL.CLASS_SMUGGLER;
			PocketSand.TooltipTitle = "Pocket Sand";
			PocketSand.TooltipBody = "Produce some sand from your level and use it to blind your enemies! Better aim will help you land the attack.";
			PocketSand.Implementor = PocketSandImp;
			PocketSand.ExtendedDisplayabilityCheck = function(target:Creature):Boolean {
				return kGAMECLASS.silly;
			};
			a.push(PocketSand);
			
			FlashGrenade = new SingleCombatAttack();
			FlashGrenade.ButtonName = "F. Grenade";
			FlashGrenade.EnergyCost = 10;
			FlashGrenade.RequiresClass = GLOBAL.CLASS_SMUGGLER;
			FlashGrenade.TooltipTitle = "Flash Grenade";
			FlashGrenade.TooltipBody = "Produce a rechargable flash grenade and use it to blind your enemy. Better aim will increase the chance of success.";
			FlashGrenade.Implementor = FlashGrenadeImpl;
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
			a.push(LowBlow);
			
			// Disarming Shot
			DisarmingShot = new SingleCombatAttack();
			DisarmingShot.ButtonName = "Disarm Shot";
			DisarmingShot.EnergyCost = 20;
			DisarmingShot.RequiresPerk = "Disarming Shot";
			DisarmingShot.DisabledIfEffectedBy = ["Disarmed"];
			DisarmingShot.Implementor = DisarmingShotImpl;
			DisarmingShot.TooltipTitle = "Disarming Shot";
			DisarmingShot.TooltipBody = "A single shot that will disable your target's usage of traditional weapons - if it hits. The strike has the same chance of hitting as any other shot. Note that this does not effect creatures or machines with integrated weaponry.";
			a.push(DisarmingShot);
			
			// Stealth
			StealthFieldGenerator = new SingleCombatAttack();
			StealthFieldGenerator.ButtonName = "Stealth Field";
			StealthFieldGenerator.EnergyCost = 20;
			StealthFieldGenerator.RequiresPerk = "Stealth Field Generator";
			StealthFieldGenerator.DisabledIfEffectedBy = ["Stealth Field Generator"];
			StealthFieldGenerator.Implementor = StealthFieldGeneratorImpl;
			StealthFieldGenerator.TooltipTitle = "Stealth Field Generator";
			StealthFieldGenerator.TooltipBody = "Creates a stealth field that greatly increases your evasion for a few turns.";
			StealthFieldGenerator.RequiresTarget = false;
			a.push(StealthFieldGenerator);
			
			// Grenade
			Grenade = new SingleCombatAttack();
			Grenade.ButtonName = "Grenade";
			Grenade.EnergyCost = 25;
			Grenade.RequiresPerk = "Grenade";
			Grenade.DisabledIfEffectedBy = ["Disarmed"];
			Grenade.Implementor = GrenadeImpl;
			Grenade.TooltipTitle = "Grenade";
			Grenade.TooltipBody = "Does a moderate amount of intelligence-based thermal and kinetic damage to a single opponent.";
			a.push(Grenade);
			
			// GasGren
			GasGrenade = SingleCombatAttack();
			GasGrenade.ButtonName = "Gas Grenade";
			GasGrenade.EnergyCost = 25;
			GasGrenade.RequiresPerk = "Gas Grenade";
			GasGrenade.DisabledIfEffectedBy = ["Disarmed"];
			GasGrenade.Implementor = GasGrenadeImpl;
			GasGrenade.TooltipTitle = "Gas Grenade";
			GasGrenade.TooltipBody = "An unavoidable attack that deals a fair amount of lust damage. Increases slightly with level.";
			a.push(GasGrenade);
			
			// Smuggled Stim
			SmuggledStimulant = new SingleCombatAttack();
			SmuggledStimulant.ButtonName = "S. Stimulant";
			SmuggledStimulant.DisabledIfEffectedBy = ["Used Smuggled Stimulant"];
			SmuggledStimulant.RequiresPerk = "Smuggled Stimulant";
			SmuggledStimulant.Implementor = SmuggleStimulatImpl;
			SmuggledStimulant.TooltipTitle = "Smuggled Stimulant";
			SmuggledStimulant.TooltipBody = "Inject yourself with a smuggled stimulant, causing you to recover 25 energy a turn for three turns.";
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
			a.push(BurstOfEnergy);
			
			// Concussive Shot
			ConcussiveShot = new SingleCombatAttack();
			ConcussiveShot.ButtonName = "C. Shot";
			ConcussiveShot.DisabledIfEffectedBy = ["Disarmed"];
			ConcussiveShot.EnergyCost = 25;
			ConcussiveShot.IsRangedBased = true;
			ConcussiveShot.RequiresItemFlags = [GLOBAL.ITEM_FLAG_BOW_WEAPON];
			ConcussiveShot.TooltipTitle = "Concussive Shot";
			ConcussiveShot.TooltipBody = "Fire an explosive arrow at your target, potentially stunning them for 1-2 rounds.";
			a.push(ConcussiveShot);
		}
		
		/**
		 * This is a SINGLE ranged attack with no "before" or "after" stuff.
		 * It does not call or repeat itself- this is a single application of damage
		 * following basic ranged attack rules.
		 * @param	attacker
		 * @param	target
		 */
		public static function SingleRangedAttackImpl(attacker:Creature, target:Creature, asFlurry:Boolean = false):Boolean
		{
			if (rangedCombatMiss(attacker, target))
			{
				if (target.customDodge.length > 0) output(target.customDodge);
				else if (attacker is PlayerCharacter) output("You " + attacker.rangedWeapon.attackVerb + " at " + target.a + target.short + " with your " + attacker.rangedWeapon.longName + ", but just can't connect.");
				else if (target is PlayerCharacter) output("You manage to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.rangedWeapon.attackNoun + ".");
				else output(target.capitalA + target.short + " manages to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.rangedWeapon.attackNoun + ".");
				return false;
			}
			
			if ((attacker.hasStatusEffect("Blinded") || attacker.hasStatusEffect("Smoke Grenade")) && rand(4) > 0)
			{
				if (attacker is PlayerCharacter) output("Your blind-fired shot doesn't manage to connect.");
				else output(attacker.capitalA + possessive(attacker.short) + " blind "+ attacker.rangedWeapon.attackNoun +" fails to connect!");
				return false;
			}
			
			if (asFlurry && rand(100) <= 45 && !target.isImmobilized() && !attacker.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS))
			{
				if (target.customDodge.length > 0) output(target.customDodge); 
				else if (attacker is PlayerCharacter) output("You " + attacker.rangedWeapon.attackVerb + " at " + target.a + target.short + " with your " + attacker.rangedWeapon.longName + ", but just can't connect.");
				else if (target is PlayerCharacter) output("You manage to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.rangedWeapon.attackNoun + ".");
				else output(target.capitalA + target.short + " manages to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.rangedWeapon.attackNoun + ".");
				return false;
			}
			
			// We made it here, the attack landed
			
			if (attacker is PlayerCharacter) output("You land a hit on " + target.a + target.short + " with your " + pc.rangedWeapon.longName + "!");
			else if (attacker.plural) output(attacker.capitalA + attacker.short + " connect with their " + plural(attacker.rangedWeapon.longName) + "!");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " hits you with " + attacker.mfn("his", "her", "its") + " " + attacker.rangedWeapon.longName + "!");
			else output(attacker.capitalA + attacker.short + " connects with " + attacker.mfn("his", "her", "its") + " " + attacker.rangedWeapon.longName + "!");
			
			var damage:TypeCollection = attacker.rangedDamage();
			damageRand(damage, 15);
			applyDamage(damage, attacker, target, "ranged");
			return true;
		}
		
		public static function SingleMeleeAttackImpl(attacker:Creature, target:Creature, asFlurry:Boolean = false):Boolean
		{
			if (combatMiss(attacker, target))
			{
				if (target.customDodge.length > 1) output(target.customDodge);
				else if (attacker is PlayerCharacter) output("You " + attacker.meleeWeapon.attackVerb + " at " + target.a + target.short + " with your " + attacker.meleeWeapon.longName + ", but just can't connect.");
				else if (target is PlayerCharacter) output("You manage to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.meleeWeapon.attackNoun + ".");
				else output(target.capitalA + target.short + " manages to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.meleeWeapon.attackNoun + ".");
				return false;
			}
			
			if ((attacker.hasStatusEffect("Blind") || attacker.hasStatusEffect("Smoke Grenade")) && rand(2) > 0)
			{
				if (attacker is PlayerCharacter) output("Your blind strike doesn't manage to connect.");
				else output(attacker.capitalA + possessive(attacker.short) + " blind " + attacker.meleeWeapon.attackNoun + " fails to connect!");
				return false;
			}
			
			if (asFlurry && rand(100) <= 45 && !target.isImmobilized() && !attacker.meleeWeapon.hasFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS))
			{
				if (target.customDodge.length > 0) output(target.customDodge); 
				else if (attacker is PlayerCharacter) output("You " + attacker.meleeWeapon.attackVerb + " at " + target.a + target.short + " with your " + attacker.meleeWeapon.longName + ", but just can't connect.");
				else if (target is PlayerCharacter) output("You manage to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.meleeWeapon.attackNoun + ".");
				else output(target.capitalA + target.short + " manages to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.meleeWeapon.attackNoun + ".");
				return false;
			}
			
			if (target is PlayerCharacter && kGAMECLASS.mimbraneFeetBonusEvade(target))
			{
				output("\nYou’re taken by surprise as your [pc.foot] suddenly acts on its own, right as you’re about be attacked. The action is intense enough to slide you right out of the face of danger. Seems your Mimbrane is even more attentive than you are!\n");
				return false;
			}
			
			if (target is ZilFemale) flags["HIT_A_ZILGIRL"] = 1;
			
			if (attacker is PlayerCharacter) output("You land a hit on " + target.a + target.short + " with your " + attacker.meleeWeapon.longName + "!");
			else if (attacker.plural) output(attacker.capitalA + attacker.short + " connects with their " + plural(attacker.meleeWeapon.longName) + "!");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " hits you with " + attacker.mfn("his", "her", "its") + " " + attacker.meleeWeapon.longName + "!");
			else output(attacker.capitalA + attacker.short + " connects with " + attacker.mfn("his", "her", "its") + " " + attacker.meleeWeapon.longName + "!");
			
			var d:TypeCollection = attacker.meleeDamage();
			damageRand(d, 15);
			applyDamage(d, attacker, target, "melee");
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
			if (attacker.hasCombatDrone())
			{
				attacker.droneTarget = target;
			}
			
			// Tutorial hook
			if (target is Celise)
			{
				output("Celise takes the hit, the wound instantly closing in with fresh, green goop. Her surface remains perfectly smooth and unmarred afterwards.");
				return;
			}
			
			if (attacker.hasStatusEffect("Disarmed"))
			{
				if (attacker is PlayerCharacter) output("You try to attack until you remember that you’ve been disarmed!");
				else output(attacker.capitalA + attacker.short + " scrabbles about, trying to find " + attacker.mfn("his", "her", "its") + " missing weapon.");
				return;
			}
			
			if (attacker.hasStatusEffect("Gunlock"))
			{
				if (attacker is PlayerCharacter) output("Your " + attacker.rangedWeapon.longName + " is currently disabled and unable to be used!");
				else output(attacker.capitalA + attacker.short + " + fiddles fruitlessly with " + attacker.mfn("his", "her", "its") + " disabled weapon.");
			}
			
			if (attacker.hasPerk("Shoot First") && !attacker.hasStatusEffect("Multiple Shots") && CombatManager.getRoundCount() == 0 && attacker.rangedWeapon.attackImplementor == null)
			{
				output("<b>Shot first!</b>\n");
				concentratedFire(attacker, target, SingleRangedAttackImpl(attacker, target));
				return;
			}
			
			var numShots = 1;
			if (attacker.hasPerk("Multiple Shots")) numShots = attacker.perkv1("Multiple Shots");
			
			var numFlurries = 0;
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
		
		public static function MeleeAttack(attacker:Creature, target:Creature):void
		{
			if (attacker.hasCombatDrone())
			{
				attacker.droneTarget = target;
			}
			
			if (target is Celise)
			{
				output(target.customDodge);
				return;
			}
			
			if (attacker.hasStatusEffect("Disarmed"))
			{
				if (attacker is PlayerCharacter) output("You try to attack until you remember you got disarmed!");
				else output(attacker.capitalA + attacker.short + " scrabbles about, trying to find " + attacker.mfn("his", "her", "its") + " missing weapon.");
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
			
			var totalSwings:int = numSwings + numFlurries;
			for (var i:int = 0; i < totalSwings; i++)
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
				
				if (SingleMeleeAttackImpl(attacker, target, asFlurry)) numHits++;
			}
			
			if (attacker.hasPerk("Cleave"))
			{
				var others:Array = CombatManager.getCreaturesGroup(target);
				
				for (var i:int = 0; i < others.length; i++)
				{
					if (!others[i].isDefeated())
					{
						if (SingleMeleeAttackImpl(attacker, others[i], false)) numHits++;
					}
				}
			}
			
			if (attacker.hasPerk("Myr Venom"))
			{
				if (combatMiss(attacker, target))
				{
					if (attacker is PlayerCharacter) output("You can't manage to sneak in a bite!");
					else if (target is PlayerCharacter) output("You narrowly avoid " + attacker.a + possessive(attacker.short) + " lunging bite!");
					else output(target.capitalA + target.short + " narrowly avoids " + attacker.a + possessive(attacker.short) + " lunging bite!");
				}
				else
				{
					if (attacker is PlayerCharacter) output("To finish off your attack, you lean in and deliver a surprise bite, injecting a healthy dose of your red myrmedion venom!");
					else if (target is PlayerCharacter) output("A spike of pain lances through your arm as " + attacker.a + attacker.short + " clamps their jaws around your bicep, venom quickly coursing through your veins!");
					else output(target.capitalA + target.short + " " + target.mfn("growls", "squeals", "grunts") + " aloud as " + attacker.a + attacker.short + " clamps their jaws around a limb!");
					
					applyDamage(new TypeCollection( { tease: 3 + rand(3) } ), attacker, target, "minimal");
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
		
		//{ region Item Attack Implementors
		public static function DroneAttack(attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("Your");
			else output(attacker.capitalA + possessive(attacker.short));
			output(" drone repeatedly zaps " + target.a + target.short + ".");
			applyDamage(attacker.droneDamage(), attacker, target, "minimal");
		}
		
		public static function TamwolfAttack(attacker:Creature, target:Creature):void
		{
			output("<i>\"Enemy detected, " + attacker.mf("master", "mistress") + " " + attacker.short + "! I will defend you!\"</i> Tam-wolf announces, leaping into the fray. He hits, biting ");
			if (target is PlayerCharacter) output(" you!");
			else output(target.a + target.short + ".");
			applyDamage(attacker.DroneDamage(), pc, target, "minimal");
			if (attacker is PlayerCharacter) output(" Good boy!");
		}
		
		public static function TamwolfDamagedAttack(attacker:Creature, target:Creature):void
		{
			if (rand(10) <= 2)
			{
				output("Tam-wolf leaps forward at " + target.a + target.short + "... but his bum leg catches, and he goes tumbling into the ground. Dammit, Tam-wolf!");
			}
			//Attack!
			else
			{
				output("<i>\"ENEMY DETECTED, MISTRESS TAM! I WILL DEFEND YOU,\"</i> Tam-wolf loudly announces as he lunges at " + target.a + target.short + ". He hits!");
				applyDamage(attacker.DroneDamage(), attacker, target, "minimal");
				if (attacker is PlayerCharacter) output(" Good boy!");
			}
		}
		
		public static function GoovolverAttackImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			
		}
		//} endregion
		
		
		public static const Headbutt:SingleCombatAttack;
		private static function HeadbuttImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter)
			{
				output("You lean back before whipping your head forward in a sudden headbutt.\n");
			}
			else
			{
				output(attacker.capitalA + attacker.short + " leans back before whipping " + attacker.mfn("his","her","its") + " head forward in a sudden headbutt.\n");
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
					output(attacker.mfn("He","She","It") + " he misses.");
				}
			}
			//Extra miss for blind
			else if (attacker.hasStatusEffect("Blind") && rand(2) > 0)
			{
				if (attacker is PlayerCharacter) output("Your blind strike fails to connect.");
				else output(attacker.mfn("His","Her","Its") + " blind strike fails to connect.");
			}
			//Attack connected!
			else
			{
				if (attacker is PlayerCharacter) output("You connect with your target!");
				else output(attacker.mfn("He", "She", "It") + " connects with you.");
		
				applyDamage(damageRand(new TypeCollection( { kinetic: attacker.physique() / 2 + attacker.level } ), 15), attacker, target, "headbutt");

				if (attacker.physique() / 2 + rand(20) + 1 >= target.physique() / 2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune")) 
				{
					if(target is PlayerCharacter) output("\n<b>You are stunned.</b>");
					else
					{
						if (target.plural) output("\n<b>" + target.capitalA + target.short + " are stunned.</b>");
						else output("\n<b>" + target.capitalA + target.short + " is stunned.</b>");
					}
					target.createStatusEffect("Stunned", 2, 0, 0, 0, false, "Stun", "Cannot act for a turn.", true, 0);
				}
				else
				{
					if(attacker is PlayerCharacter) output("\nIt doesn't look to have stunned your foe!");
					else output("\nIt didn't manage to stun you.");
				}
			}
		}
		
		public static const RapidFire:SingleCombatAttack;
		private static function RapidFireImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			// Do regular attack (including multi-attack and additional flurry shots)
			RangedAttack(attacker, target);
			
			// Two bonus shots using flurry mechanics
			SingleRangedAttackImpl(attacker, target, true);
			SingleRangedAttackImpl(attacker, target, true);
		}
		
		public static const PowerStrike:SingleCombatAttack;
		private static function PowerStrikeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker.hasCombatDrone())
			{
				attacker.droneTarget = target;
			}
			
			if (combatMiss(attacker, target))
			{
				if (target.customDodge.length > 0) output(target.customDodge);
				else if (attacker is PlayerCharacter) output("You draw back your weapon and " + pc.meleeWeapon.attackVerb + " at " + target.a + target.short + ", but just can't connect.");
				else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " draws back their weapon and " + attacker.meleeWeapon.attackVerb + " at you, but just can't connect.");
				else output(attacker.capitalA + attacker.short + " draws back their weapon and " + attacker.meleeWeapon.attackVerb + " at " + target.a + target.short +", but just can't connect.");
				return;
			}
			
			if (attacker.hasStatusEffect("Blinded") && rand(10) > 0)
			{
				if (attacker is PlayerCharacter) output("Your blind power strike missed.");
				else output(attacker.capitalA + possessive(attacker.short) + " blind power strike missed.");
				
				return;
			}
			
			if (attacker is PlayerCharacter) output("You draw back your " + attacker.meleeWeapon.longName + " and land a hit on " + target.a + target.short + "!");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " draws back " + attacker.mfn("his", "her", "its") + " " + attacker.meleeWeapon.longName + " and lands a hit on you!");
			else output(attacker.capitalA + attacker.short + " draws back " + attacker.mfn("his", "her", "its") + " " + attacker.meleeWeapon.longName + " and lands a hit on " + target.a + target.short + "!");
			
			var d:TypeCollection = new attacker.meleeDamage();
			d.multiply(2);
			damageRand(d, 15);
			applyDamage(d, attacker, target);
		}
		
		public static const TakeCover:SingleCombatAttack;
		private static function TakeCoverImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("You seek cover against ranged attacks.");
			else output(attacker.capitalA + attacker.short + " hunkers behind cover, defending themselves against ranged attacks!");
			
			attacker.createStatusEffect("Taking Cover", 3, 0, 0, 0, false, "DefenseUp", "Taking cover! Ranged attacks will almost always miss!", true);
		}
		
		public static const CarpetGrenades:SingleCombatAttack;
		private static function CarpetGrenadesImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("You sling an array of microgrenades at everything in the area!");
			else output(attacker.capitalA + attacker.short + " throws out an array of microgrenades!");
			
			var d:int = 10 + (attacker.level * 2.5) + (attacker.intelligence() / 1.5);
			var damage:TypeCollection = new TypeCollection( { burning: d } );
			
			// 9999 COCKVINE HOOK => adultCockvineGrenadesInEnclosedSpaces();
			
			for (var x:int = 0; x < hGroup.length; x++)
			{
				output("\n" + hGroup[x].capitalA + hGroup[x].short + " is caught in the explosion!");
				applyDamage(damageRand(damage, 15), attacker, hGroup[x], "minimal");
			}
		}
		
		public static const DetonationCharge:SingleCombatAttack;
		private static function DetonationChargeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("You toss a bundle of explosives in the direction of " + target.a + target.short + "!");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " throws a bundle of explosives in your direction!");
			else output(attacker.capitalA + attacker.short + " throws a bundle of explosives in " + target.a + possessive(target.short) + " direction!");
			
			var d:int = 15 + (attacker.level * 4) + attacker.intelligence();
			var damage:TypeCollection = damageRand(new TypeCollection( { burning: d } ), 15);
			
			// 9999 COCVINE HOOK => adultCockvineGrenadesInEnclosedSpaces();
			
			applyDamage(damage, attacker, target);
		}
		
		public static const SecondWind:SingleCombatAttack;
		private static function SecondWindImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			attacker.energy(Math.round(attacker.energyMax() / 2));
			attacker.HP(Math.round(attacker.HPMax() / 2));
			attacker.createStatusEffect("Used Second Wind", 0, 0, 0, 0, true, "", "", true, 0);
			
			if (attacker is PlayerCharacter) output("You draw on your innermost reserves of strength, taking a second wind!");
			else output(attacker.capitalA + attacker.short + " visibly focuses for a moment, finding themselves a second wind!");
		}
		
		public static const ParalyzingShock:SingleCombatAttack;
		private static function ParalyzingShockImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (target.hasStatusEffect("Paralyzed"))
			{
				if (target is PlayerCharacter) output("You're already paralyzed!");
				else output(target.capitalA + target.short + " is already paralyzed!");
				return;
			}
			
			if (attacker is PlayerCharacter) output("You launch a paralyzing shock at " + target.a + target.short + "!");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " fires a paralyzing shock at you!");
			else output(attacker.capitalA + attacker.short + " fires a paralyzing shock at " + target.a + target.short + "!");
			
			if (attacker.intelligence() / 2 + rand(20) + 1 >= target.physique() / 2 + 10)
			{
				output("\nThe effect is immediate! ");
				if (target is PlayerCharacter) output(" You shudder and stop, temporarily paralyzed!");
				else output(target.capitalA + target.short + " shudders and stops, temporarily paralyzed.");
				target.createStatusEffect("Paralyzed", 2 + rand(2), 0, 0, 0, false, "Paralyze", "Cannot act!", true, 0);
			}
			else
			{
				output("It has no effect!");
			}
		}
		
		public static const Volley:SingleCombatAttack;
		private static function VolleyImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			RangedAttackImpl(attacker, target);
			SingleRangedAttackImpl(attacker, target, true);
			
			if (attacker.aim() / 2 + rand(20) + 1 >= target.reflexes() / 2 + 10 && !target.hasStatusEffect("Blinded") && attacker.hasRangedEnergyWeapon())
			{
				if (target is PlayerCharacter) output("\n<b>You are blinded by flashes from " + attacker.a + possessive(attacker.short) + " " + attacker.rangedWeapon.longName + ".</b>");
				else if (attacker is PlayerCharacter) output("<b>" + target.capitalA + target.short + " is blinded by your " + possessive(pc.rangedWeapon.longName) + " flashes.</b>\n");
				else output("<b>" + target.capitalA + target.short + " is blinded by flashes from " + attacker.a + possessive(attacker.short) + " " + attacker.rangedWeapon.longName + ".</b>");
				
				target.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
			}
		}
		
		public static const Overcharge:SingleCombatAttack;
		private static function OverchargeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (!(attacker is PlayerCharacter))
			{
				output(attacker.capitalA + attacker.short + " smiles as a high-pitched emanates from " + attacker.mfn("his", "her", "its") + " " + attacker.rangedWeapon.longName + "!");
			}
			
			if (rangedCombatMiss(attacker, target))
			{
				if (target.customDodge.length > 0) output(target.customDodge);
				else if (attacker is PlayerCharacter) output("You overcharge your weapon and " + attacker.rangedWeapon.attackVerb + " at " + target.a + target.short + ", but just can't connect.");
				else if (target is PlayerCharacter) output(" You manage to avoid the overcharged " + attacker.rangedWeapon.attackNoun + ".");
				else output(" " + target.capitalA + target.short + " manages to avoid the overcharged " + attacker.rangedWeapon.attackNoun + ".");
				return;
			}
			
			if ((attacker.hasStatusEffect("Blinded") || attacker.hasStatusEffect("Smoke Grenade")) && rand(10) > 0)
			{
				if (attacker is PlayerCharacter) output("Your blind-fired, overcharged shot missed!");
				else if (target is PlayerCharacter) output(attacker.capitalA + possessive(attacker.short) + " blind-fired, overcharged shot misses you!");
				else output(attacker.capitalA + possessive(attacker.short) + " blind-fired, overcharge shot narrowly avoids hitting anything!");
				return;
			}
			
			if (attacker is PlayerCharacter) output("You overcharge your " + attacker.rangedWeapon.longName + " and land a hit on " + target.a + target.short + "!");
			else output(" " + attacker.capitalA + attacker.short + " connects with " + attacker.mfn("his", "her", "its") + " overcharged " + attacker.rangedWeapon.attackNoun + "!");
			
			var d:TypeCollection = attacker.rangedDamage();
			
			if (attacker is PlayerCharacter) d.multiply(1.5);
			else d.multiply(1.75);
			
			damageRand(d, 15);
			applyDamage(d, attacker, target, "minimal");
			
			if (attacker.intelligence() / 2 + rand(20) + 1 >= target.physique() / 2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune"))
			{
				output("\n");
				if (target is PlayerCharacter) output("<b>You are stunned!</b>");
				else output("<b>" + target.capitalA + target.short + " is stunned!</b>");
				target.createStatusEffect("Stunned", 1, 0, 0, 0, false, "Stun", "Cannot act for a turn.", true, 0);
			}
		}
		
		public static const DeflectorRegeneration:SingleCombatAttack;
		private static function DeflectorRegenerationImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("You fiddle with your shield, tuning it to regenerate over the next few turns.");
			else output(attacker.capitalA + attacker.short + " leans down to fiddle with their shield generator. The field responds, visibly bolstering as the emitters work harder to replenish the depleted field.");
			
			attacker.createStatusEffect("Deflector Regeneration", 4, Math.ceil((attacker.intelligence() * 1.5 + rand(attacker.level) + attacker.shieldsMax() * 0.25) / 4), 0, 0, false, "DefenseUp", "Recovering shields every round.", true, 0);
		}
		
		public static const PowerSurge:SingleCombatAttack;
		private static function PowerSurgeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("You channel a surge of power into your shield generator, instantly restoring a portion of the emitters lost energy.");
			else output(attacker.capitalA + attacker.short + " channels a surge of power into " + attacker.mfn("his", "her", "its") + " shield generator, instantly restoring a portion of the lost energy.");
			
			var a:int = Math.ceil(attacker.intelligence() * 1.5 + rand(attacker.level) + attacker.shieldsMax() * 0.25);
			if (a + attacker.shields() > attacker.shieldsMax()) a = attacker.shieldsMax() - attacker.shields();
			
			attacker.shields(a);
			output(" (" + amount + ")");
		}
		
		public static const ThermalDisruptor:SingleCombatAttack;
		private static function ThermalDisruptorImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("Raising the disruptor, you unleash a wave of burning fire on " + target.a + target.short);
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " spins a long device around from their back, levelling it squarely in your direction. In the blink of an eye it unleashes a wave of burning fire directly at you!");
			else output(attacker.capitalA + attacker.short + " spins a long device around from their back, levelling it at " + target.a + target.short + ", unleashing a wave of burning fire!");
			
			var d:int = Math.round(20 + attacker.level * 4 + attacker.intelligence());
			applyDamage(new TypeCollection( { burning: d } ), attacker, target, "minimal");
		}
		
		public static const GravidicDisruptor:SingleCombatAttack;
		private static function GravidicDisruptorImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("Raising the disruptor, you unleash a targeted gravitic disruption on " + target.a + target.short);
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " spins a long device around from their back, levelling it squarely in your direction. Your limbs suddenly feel heavy, a crushing weight bearing down on you from all sides!");
			else output(attacker.capitalA + attacker.short + " spins a long device around from their back, levelling it at " + target.a + target.short + ", unleashing a targeted gravitic disruption in " + target.mfn("his", "her", "its") + " direction!");
			
			var d:int = Math.round(15 + attacker.level * 2.5 + attacker.intelligence() / 1.5);
			applyDamage(new TypeCollection( { unresistablehp: d } ), attacker, target, "minimal");
		}
		
		public static const ShieldHack:SingleCombatAttack;
		private static function ShieldHackImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (target.shields() <= 0)
			{
				if (attacker is PlayerCharacter) output("You attempt to hack the nonexistent shield protecting " + target.a + target.short + "! It doesn't work - <b>there's no shield there.</b>");
				else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " attempts to hack your shield! It doesn't work - <b>there's no shield there.</b>");
				else output(attacker.capitalA + attacker.short + " attempts to hack " + target.capitalA + possessive(target.short) + " shield! It doesn't work - <b>there's no shield there.</b>");
				return;
			}
			
			if (attacker is PlayerCharacter) output("You attempt to wirelessly hack the shield protecting " + target.a + target.short + "!");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " attempts to wirelessly hack your shield!");
			else output(attacker.capitalA + attacker.short + " attempts to wirelessly hack the shield protecting " + target.a + target.short + "!");
			
			var d:TypeCollection = damageRand(new TypeCollection( { electric: Math.round(25 + attacker.level * 2.5 + attacker.intelligence() / 1.5) } ), 15);
			d.addFlag(DamageFlag.ONLY_SHIELD);
			
			var dr:DamageResult = calculateDamage(d, attacker, target, "suppress");
			
			if (target.shields() > 0)
			{
				if (target is PlayerCharacter) output(" Your shield crackles but holds.");
				else output(" " + target.capitalA + target.short + " crackles but holds.");
			}
			else
			{
				if (target is PlayerCharacter) output(" There is a concussive boom and a tingling aftershock of energy as your shield is breached.");
				else output(" There is a concussive boom and a tingling aftershock of energy as " + target.a + possessive(target.short) + " shield is breached.");
			}
			
			outputDamage(dr);
		}
		
		public static const WeaponHack:SingleCombatAttack;
		private static function WeaponHackImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (target.hasStatusEffect("Disarm Immune"))
			{
				if (attacker is PlayerCharacter) output("You try to hack " + target.a + possessive(target.short) + " weapon but can't. <b>It's physically impossible!</b>");
				else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " tries to hack your weapon but can't!");
				else output(attacker.capitalA + attacker.short + " tries to hack " + target.a + possessive(target.short) + " weapon but can't. <b>It's physically impossible!</b>");
				return;
			}
			
			if (target.hasStatusEffect("Disarmed"))
			{
				if (attacker is PlayerCharacter) output("You try to hack " + target.a + possessive(target.short) + " weapon but can't. <b>You've already hacked it!</b>");
				else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " tries to hack your weapon but can't!");
				else output(attacker.capitalA + attacker.short + " tries to hack " + target.a + possessive(target.short) + " weapon but can't. <b>It's already been hacked!</b>");
				return;
			}
			
			if (!target.hasEnergyWeapon())
			{
				if (attacker is PlayerCharacter) output("You try to hack " + target.a + possessive(target.short) + " weapon but " + target.mfn("he", "she", "it") + " has no energy weapons to shut down!");
				else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " tries to hack your weapon but you don't have an energy weapon for them to shut down!");
				else output(attacker.capitalA + attacker.short + " tries to hack " + target.a + possessive(target.short) + " weapon but " + target.mfn("he", "she", "it") + " has no energy weapons to shut down!");
				return;				
			}
			
			if (rand(20) + 1 + attacker.intelligence() / 2 < target.intelligence() / 2 + 10)
			{
				if (attacker is PlayerCharacter)
				{
					output("You try to hack " + target.a + possessive(target.short) + " weapon, but they're too smart and too quick!");
					if (attacker.intelligence() > target.intelligence() - 5) output(".. this time.");
				}
				else if (target is PlayerCharacter)
				{
					output(attacker.capitalA + attacker.short + " tries to hack your weapon, but you're quick to defend against the remote intrusion.");
					if (attacker.intelligence() > target.intelligence() - 5) output(".. this time.");
				}
				else
				{
					output(attacker.capitalA + attacker.short + " tries to hack " + target.a + possessive(target.short) + " weapon, but they react quickly and defend against the attack!");
				}
				return;
			}
			
			// Successful
			
			if (attacker is PlayerCharacter) output("You hack " + target.a + possessive(target.short) " weapon, disarming them.");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " hacks your weapon, disarming you temporarily!");
			else output(attacker.capitalA + attacker.short + " hacks " + target.a + possessive(target.short) + " weapon, disarming " + target.mfn("him", "her", "it") + ".");
			
			target.createStatusEffect("Disarmed", 4 + rand(2), 0, 0, 0, false, "Blocked", "Cannot use normal melee or ranged attacks!", true, 0);
		}
		
		public static const PocketSand:SingleCombatAttack;
		private static function PocketSandImp(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			output("With a cry of <i>“Pocket sand!”</i> you produce a handful of sand and throw it at " + target.a + target.short + ".");
			
			if (attacker.aim() / 2 + rand(20) + 6 >= target.reflexes() / 2 + 10 && !target.hasStatusEffect("Blinded"))
			{
				target.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
				
				output("\n<b>" + target.capitalA + target.short + " is blinded by the coarse granules.</b>");
			}
			else
			{
				output("\n" + target.capitalA + target.short + " manages to keep away from the blinding particles.");
			}
		}
		
		public static const FlashGrenade:SingleCombatAttack;
		private static function FlashGrenadeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("You produce one of your rechargeable flash grenades and huck it in the direction of " + target.a + target.short + ".");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " produces a flash grenade and hucks it in your direction!");
			else output(attacker.capitalA + attacker.short + " produces a flash grenade and hucks it in the direction of " + target.a + target.short + "!");
			
			if (attacker.aim() / 2 + rand(20) + 6 >= target.reflexes() / 2 + 10 && !target.hasStatusEffect("Blinded"))
			{
				target.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
				
				if (target is PlayerCharacter) output("\n<b>You're blinded by the luminous flashes.</b>");
				else output("\n<b>" + target.capitalA + target.short + " is blinded by the luminous flashes.</b>");
			}
			else
			{
				if (target is PlayerCharacter) output("\nYou manage to avoid the blinding projectile.");
				else output("\n" + target.capitalA + target.short + " manages to avoid the blinding projectile.");
			}
		}
		
		public static const LowBlow:SingleCombatAttack;
		private static function LowBlowImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("You swing low, aiming for a sensitive spot.");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " swings low at you, aiming for a sensitive spot.");
			else output(attacker.capitalA + attacker.short + " swings low at " target.a + target.short + ", aiming for a sensitive spot.");
			output("\n");
			
			if (combatMiss(attacker, target))
			{
				if (target.customDodge.length > 0) output(target.customDodge);
				else if (attacker is PlayerCharacter) output("You miss!");
				else output("You narrowly avoid the attack!");
			}
			else if (attacker.hasStatusEffect("Blinded") && rand(2) > 0)
			{
				if (attacker is PlayerCharacter) output("Your blind strike fails to connect.");
				else output(attacker.capitalA + possessive(attacker.short) + " blind strike fails to connect.");
			}
			else
			{
				if (attacker is PlayerCharacter) output("You connect with your target!");
				else if (target is PlayerCharacter) output(attacker.capitalA + attacker.possessive(short) + " strike connects with you!");
				else output(attacker.capitalA + possessive(attacker.short) + " strike connects with " + target.a + target.short + "!");
				
				applyDamage(damageRand(new TypeCollection( { kinetic: attacker.physique() / 2 } ), 15), attacker, target, "minimal");
				
				if ((attacker.physique() / 2 + rand(20) + 1 >= target.physique() / 2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune")) || target is Kaska)
				{
					if (target is Kaska)
					{
						output("\nKaska's eyes cross from the overwhelming pain. She sways back and forth like a drunken sailor before hitting the floor with all the grace of a felled tree. A high pitched squeak of pain rolls out of her plump lips. <b>She's very, very stunned.</b>");
						target.createStatusEffect("Stunned", 3 + rand(2), 0, 0, 0, false, "Stun", "Cannot act for a while. You hit her balls pretty hard!", true, 0);
					}
					else
					{
						if (target is PlayerCharacter)
						{
							output("\n<b>You are stunned!</b>");
						}
						else
						{
							output("\n<b>" + target.capitalA + target.short + " is stunned.</b>");
						}
						
						target.createStatusEffect("Stunned", 2 + rand(2), 0, 0, 0, false, "Stun", "Cannot act for a while.", true, 0);
					}
				}
				else
				{
					if (attacker is PlayerCharacter)
					{
						output("\nIt doesn't look like you accomplished much more than hitting your target.");
					}
					// potential outputs for other targets/the player not getting stunned
				}
			}
		}
		
		public static const DisarmingShot:SingleCombatAttack;
		private static function DisarmingShotImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (target.hasStatusEffect("Disarm Immune"))
			{
				if (attacker is PlayerCharacter) output("You try to disarm " + target.a + target.short + " but can't. <b>It's physically impossible!</b>");
				else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " tries to disarm you but can't!");
				else output(attacker.capitalA + attacker.short + " tries to disarm " + target.a + target.short + " but can't. <b>It's physically impossible!</b>");
				return;
			}
			
			if (target.hasStatusEffect("Disarmed"))
			{
				if (attacker is PlayerCharacter) output("You try to disarm " + target.a + target.short + " but can't. <b>They've already been disarmed!</b>");
				else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " tries to disarm you but can't!");
				else output(attacker.capitalA + attacker.short + " tries to disarm " + target.a + target.short + " but can't. <b>They've already been disarmed!</b>");
				return;
			}
			
			if (rangedCombatMiss(attacker, target))
			{
				if (attacker is PlayerCharacter) output("You try to disarm " + target.a + target.short + " but miss.");
				else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " tries to disarm you but they narrowly miss the opportunity!");
				else output(attacker.capitalA + attacker.short + " tries to disarm " + target.a + target.short + " but they miss the shot!");
				return;
			}
			
			if ((attacker.hasStatusEffect("Blinded") || attacker.hasStatusEffect("Smoke Grenade")) && rand(10) > 0)
			{
				if (attacker is PlayerCharacter) output("Your blind-fired shot fails to connect.");
				else output(attacker.capitalA + possessive(attacker.short) + " blind-fired shot fails to connect.");
				return;
			}
			
			// Hits
			if (attacker is PlayerCharacter) output("You land a crack shot on " + target.a + possessive(target.short) + " weapon, disarming them.");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " shoots your weapons away with well-placed shots!");
			else output(attacker.capitalA + attacker.short + " shoots " + target.a + possessive(attacker.short) + " weapons away with well-placed shots!");
			
			target.createStatusEffect("Disarmed", 4, 0, 0, 0, false, "Blocked", "Cannot use normal melee or ranged attacks!", true, 0);
		}
		
		public static const StealthFieldGenerator:SingleCombatAttack;
		private static function StealthFieldGeneratorImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			var rounds:int = 0;
			
			if (attacker is PlayerCharacter)
			{
				output("You activate your stealth field generator, fading into nigh-invisibility.");
				rounds = 2;
			}
			else
			{
				output(attacker.capitalA + attacker.short + " activates a stealth field generator, fading into nigh-invisibility.");
				rounds = 3;
			}
			
			attacker.createStatusEffect("Stealth Field Generator", rounds, 0, 0, 0, false, "Stealth Field", "Provides a massive bonus to evasion chances!", true, 0);
		}
		
		public static const Grenade:SingleCombatAttack;
		private static function GrenadeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("Tossing an explosive in the general direction of your target, you unleash an explosive blast of heat on " + target.a + target.short + "!");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " hucks a small device in your direction, unleashing an explosive blast scant inches from your body!");
			else output(attacker.capitalA + attacker.shprt + " hucks a small device in " + target.a + possessive(target.short) + " direction, unleashing an explosive blast scant inches from " + target.mfn("his", "her", "its") + " form!");
			
			
			var d:int = Math.round(7.5 + attacker.level * 2 + attacker.intelligence() / 2);
			var damage:TypeCollection = damageRand(new TypeCollection( { kinetic: d, burning: d } ), 15);
			
			// 9999 => adultCockvineGrenadesInEnclosedSpaces()
			
			applyDamage(damage, attacker, target);
		}
		
		public static const GasGrenade:SingleCombatAttack;
		private static function GasGrenadeImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("Tossing a hissing grenade in the general direction of your target, you watch the gaseous stuff do its trick.");
			else if (target is PlayerCharacter) output(attacker.capitalA + attacker.short + " tosses a small device in your direction, great clouds of thick, gaseous vapour pouring from within its body.");
			else output(attacker.capitalA + attacker.short + " tosses a small device in " + target.a + possessive(target.short) + " direction, a thick trail of gasous vapour hanging heavily in the air to demark the arcing path taken.");
			
			var d:int = 14 + attacker.level * 2;
			var damage:TypeCollection = damageRand(new TypeCollection( { drug: d } ), 15);
			
			// 9999 => adultCockvineGrenadesInEnclosedSpaces()
			
			applyDamage(damage, attacker, target, "minimal");
		}
		
		public static const SmuggledStimulant:SingleCombatAttack;
		private static function SmuggleStimulatImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			attacker.createStatusEffect("Used Smuggled Stimulant", 3, 0, 0, 0, true, "", "", true, 0);
			
			if (attacker is PlayerCharacter) output("You inject yourself with a smuggled stimulant.");
			else output(attacker.capitalA + attacker.short + " jams a small injector deep into their thigh, the stature visibly filling with energy!");
		}
		
		public static const BurstOfEnergy:SingleCombatAttack;
		private static function BurstOfEnergyImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			attacker.energy(60);
			attacker.createStatusEffect("Used Burst of Energy", 0, 0, 0, 0, true, "", "", true, 0);
			
			if (attacker is PlayerCharacter) output("You dig deep and find a reserve of energy from deep within yourself!\n");
			else output(attacker.capitalA + attacker.short + " visibly steels " + attacker.mfn("himself", "herself", "itself") + ", reaching deep and finding a reserve of energy!");
		}
		
		public static const ConcussiveShot:SingleCombatAttack;
		private static function ConcussiveShotImpl(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			if (attacker is PlayerCharacter) output("You nock one of your concussive arrows and draw your bowstring back, taking careful aim at the space just ahead of " + target.a + target.short + ".");
			else throw new Error("Concussive Shot does not support a non-player attacker!");
			
			if (rangedCombatMiss(attacker, target, 0))
			{
				if (attacker is PlayerCharacter) output(" You let fly, but the arrow sails clean past your intended target.");
			}
			else if (pc.hasStatusEffect("Blind") && rand(10) > 0)
			{
				if (attacker is PlayerCharacter) output(" Your blind <b>concussion shot</b> missed.");
			}
			else
			{
				if (attacker is PlayerCharacter) output(" You let fly, and a moment later, the arrow explodes in a shockwave of force");
				
				if (target.physique()/2 + rand(20) + 1 >= pc.aim()/2 + 10)
				{
					output(" though " + target.a + target.short + " resists the blast. Your stun-shot failed!");
				}
				else
				{
					output(", stunning your enemy!");
					
					var rounds:int = 1 + rand(2);
					target.createStatusEffect("Stunned",rounds,0,0,0,false,"Stun","Cannot act for "+ rounds +" turns.",true,0);
				}
				
				// Add some burning damage for the explosion
				var damage:TypeCollection = attacker.rangedDamage();
				damage.add(new TypeCollection( { burning: 10 } ));
				damage = damageRand(damage,15);
				applyDamage(damage, attacker, target, "ranged");
			}
		}
	}

}