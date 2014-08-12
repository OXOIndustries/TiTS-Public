package classes.GameData 
{
	import adobe.utils.ProductManager;
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.GameData.PerkData;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Perks 
	{		
		private var _perkList:Vector.<PerkData>;
		
		public function Perks() 
		{
			_perkList = new Vector.<PerkData>();
			
			// Configure the class perk data
			ConfigureClassPerks();
		}
		
		private function ConfigureClassPerks():void
		{
			ConfigureMercenaryPerks();
			ConfigureSmugglerPerks();
			ConfigureEngineerPerks();
		}
		
		private function ConfigureMercenaryPerks():void
		{
			// Level 2 Perks
			var criticalBlows:PerkData = new PerkData();
			criticalBlows.classLimit = GLOBAL.CLASS_MERCENARY;
			criticalBlows.levelLimit = 2;
			criticalBlows.autoGained = true;
			criticalBlows.perkName = "Critical Blows";
			criticalBlows.perkDescription = "Your strikes and shots gain a 10% chance of inflicting double damage on normal melee and ranged attacks.";
			insertPerkData(criticalBlows);
			
			var bloodthirsty:PerkData = new PerkData();
			bloodthirsty.classLimit = GLOBAL.CLASS_MERCENARY;
			bloodthirsty.levelLimit = 2;
			bloodthirsty.perkName = "Bloodthirsty";
			bloodthirsty.perkDescription = "Melee attacks restore a few points of energy.";
			insertPerkData(bloodthirsty);
			
			var armorPiercing:PerkData = new PerkData();
			armorPiercing.classLimit = GLOBAL.CLASS_MERCENARY;
			armorPiercing.levelLimit = 2;
			armorPiercing.perkName = "Armor Piercing";
			armorPiercing.perkDescription = "Ranged attacks ignore the first few points of enemy defense.";
			insertPerkData(armorPiercing);
			
			// Level 3 Perks
			var tough:PerkData = new PerkData();
			tough.classLimit = GLOBAL.CLASS_MERCENARY;
			tough.levelLimit = 3;
			tough.autoGained = true;
			tough.perkName = "Tough";
			tough.perkDescription = "Vulnerability to piercing, slashing, and kinetic damage taken reduced by 10%.";
			insertPerkData(tough);
			
			var powerStrike:PerkData = new PerkData();
			powerStrike.classLimit = GLOBAL.CLASS_MERCENARY;
			powerStrike.levelLimit = 3;
			powerStrike.perkName = "Power Strike";
			powerStrike.perkDescription = "Grants the ability to perform a single melee attack for 200% normal damage.";
			insertPerkData(powerStrike);
			
			var rapidFire:PerkData = new PerkData();
			rapidFire.classLimit = GLOBAL.CLASS_MERCENARY;
			rapidFire.levelLimit = 3;
			rapidFire.perkName = "Rapid Fire";
			rapidFire.perkDescription = "Grants the ability to perform a ranged attack with two extra, reduced-accuracy shots.";
			insertPerkData(rapidFire);
			
			// Level 4
			var juggernaut:PerkData = new PerkData();
			juggernaut.classLimit = GLOBAL.CLASS_MERCENARY;
			juggernaut.levelLimit = 4;
			juggernaut.autoGained = true;
			juggernaut.perkName = "Juggernaut";
			juggernaut.perkDescription = "Grants a 25% chance to overcome any paralysis or stun effect every combat round.";
			insertPerkData(juggernaut);
			
			var riposte:PerkData = new PerkData();
			riposte.classLimit = GLOBAL.CLASS_MERCENARY;
			riposte.levelLimit = 4;
			riposte.perkName = "Riposte";
			riposte.perkDescription = "Grants increased evasion after any melee attack made for the remainder of the combat round.";
			insertPerkData(riposte);
			
			var takeCover:PerkData = new PerkData();
			takeCover.classLimit = GLOBAL.CLASS_MERCENARY;
			takeCover.levelLimit = 4;
			takeCover.perkName = "Take Cover";
			takeCover.perkDescription = "Grants the ability to avoid nearly all incoming ranged attacks for 3 combat rounds.";
			insertPerkData(takeCover);
			
			// Level 5
			var secondWind:PerkData = new PerkData();
			secondWind.classLimit = GLOBAL.CLASS_MERCENARY;
			secondWind.levelLimit = 5;
			secondWind.autoGained = true;
			secondWind.perkName = "Second Wind";
			secondWind.perkDescription = "Grants the ability to recover half of your maximum HP and Energy once per combat encounter.";
			insertPerkData(secondWind);
			
			var carpetGrenades:PerkData = new PerkData();
			carpetGrenades.classLimit = GLOBAL.CLASS_MERCENARY;
			carpetGrenades.levelLimit = 5;
			carpetGrenades.perkName = "Carpet Grenades";
			carpetGrenades.perkDescription = "Grants the ability to toss out a handful of micro-grenades, damaging everything in a large area. Hits all enemies.";
			insertPerkData(carpetGrenades);
			
			var detCharge:PerkData = new PerkData();
			detCharge.classLimit = GLOBAL.CLASS_MERCENARY;
			detCharge.levelLimit = 5;
			detCharge.perkName = "Detonation Charge";
			detCharge.perkDescription = "Grants the ability to throw a focused detonation charge at an enemy for very high thermal damage. Focusing the charge restricts the blast radius to a single target.";
			insertPerkData(detCharge);

			//Level 6
			//Passive: Tough 2: Increases Tough's effectiveness to 15%.
			var tough2:PerkData = new PerkData();
			tough2.classLimit = GLOBAL.CLASS_MERCENARY;
			tough2.levelLimit = 6;
			tough2.autoGained = true;
			tough2.perkName = "Tough 2";
			tough2.perkDescription = "Upgrades the \"Tough\" ability from 10 to 15%.";
			insertPerkData(tough2);

			var heavyWeapons:PerkData = new PerkData();
			heavyWeapons.classLimit = GLOBAL.CLASS_MERCENARY;
			heavyWeapons.levelLimit = 6;
			heavyWeapons.perkName = "Heavy Weapons";
			heavyWeapons.perkDescription = "Increases damage from kinetic, slashing, and piercing ranged weapons by 20%.";
			insertPerkData(heavyWeapons);

			var lowTechSolutions:PerkData = new PerkData();
			lowTechSolutions.classLimit = GLOBAL.CLASS_MERCENARY;
			lowTechSolutions.levelLimit = 6;
			lowTechSolutions.perkName = "Low Tech Solutions";
			lowTechSolutions.perkDescription = "Increases damage from kinetic, slashing, and piercing melee weapons by 20%.";
			insertPerkData(lowTechSolutions);

			//Level 7
			//Passive: Iron Will: Your physical fortitude makes up when your mental fortitude fails. Gain a bonus to Willpower saves and checks based on Physique (5:1 ratio). 
			var ironWill:PerkData = new PerkData();
			ironWill.classLimit = GLOBAL.CLASS_MERCENARY;
			ironWill.levelLimit = 7;
			ironWill.autoGained = true;
			ironWill.perkName = "Iron Will";
			ironWill.perkDescription = "Allows your physical fortitude to contribute slightly to your willpower, granting one point of willpower for every five points of physique.";
			insertPerkData(ironWill);

			//1. Cleave: Your melee attacks do bonus damage against groups of enemies. 
			var cleave:PerkData = new PerkData();
			cleave.classLimit = GLOBAL.CLASS_MERCENARY;
			cleave.levelLimit = 7;
			cleave.perkName = "Cleave";
			cleave.perkDescription = "Grants an extra, low-accuracy swing when fighting groups of enemies or \"plural\" type foes.";
			insertPerkData(cleave);

			//2. Concentrate Fire: When you land consecutive ranged attacks, you gain a slight bonus to damage. 
			var concentrateFire:PerkData = new PerkData();
			concentrateFire.classLimit = GLOBAL.CLASS_MERCENARY;
			concentrateFire.levelLimit = 7;
			concentrateFire.perkName = "Concentrate Fire";
			concentrateFire.perkDescription = "Allows consecutive ranged attacks to gain a bonus to damage.";
			insertPerkData(concentrateFire);

			//3. (Replaces #1 if Power Strike Chosen) Wounding Strike: Upgrades power strike to increase damage dealt by 5 and place a status effect on the target. The status effect reduces healing and shield recovery by 50%.
			//Leaving this one for Geddy!

		}
		
		private function ConfigureSmugglerPerks():void
		{
			// Level 2
			var lucky:PerkData = new PerkData();
			lucky.classLimit = GLOBAL.CLASS_SMUGGLER;
			lucky.levelLimit = 2;
			lucky.autoGained = true;
			lucky.perkName = "Lucky Breaks";
			lucky.perkDescription = "Grants you an additional 10% evasion chance.";
			insertPerkData(lucky);
			
			var shootFirst:PerkData = new PerkData();
			shootFirst.classLimit = GLOBAL.CLASS_SMUGGLER;
			shootFirst.levelLimit = 2;
			shootFirst.perkName = "Shoot First";
			shootFirst.perkDescription = "When using a ranged attack during the first round of combat, gain an additional attack.";
			insertPerkData(shootFirst);
			
			var lowBlow:PerkData = new PerkData();
			lowBlow.classLimit = GLOBAL.CLASS_SMUGGLER;
			lowBlow.levelLimit = 2;
			lowBlow.perkName = "Low Blow";
			lowBlow.perkDescription = "Grants the ability to perform a melee strike with a high chance of stunning the target.";
			insertPerkData(lowBlow);
			
			// Level 3
			var escapeArtist:PerkData = new PerkData();
			escapeArtist.classLimit = GLOBAL.CLASS_SMUGGLER;
			escapeArtist.levelLimit = 3;
			escapeArtist.autoGained = true;
			escapeArtist.perkName = "Escape Artist";
			escapeArtist.perkDescription = "Converts the chance to escape from grapples to use your Reflexes stat rather than Physique. Conveys an additional minor chance to escape.";
			insertPerkData(escapeArtist);
			
			var sneakAttack:PerkData = new PerkData();
			sneakAttack.classLimit = GLOBAL.CLASS_SMUGGLER;
			sneakAttack.levelLimit = 3;
			sneakAttack.perkName = "Sneak Attack";
			sneakAttack.perkDescription = "Grants the ability to perform a melee attack with greatly increased damage against stunned or blinded targets. Additional negative status effects may increase the damage further.";
			insertPerkData(sneakAttack);
			
			var aimedShot:PerkData = new PerkData();
			aimedShot.classLimit = GLOBAL.CLASS_SMUGGLER;
			aimedShot.levelLimit = 3;
			aimedShot.perkName = "Aimed Shot";
			aimedShot.perkDescription = "Grants the ability to perform a ranged attack with greatly increased damage against stunned or blinded targets. Additional negative status effects may increase the damage further.";
			insertPerkData(aimedShot);
			
			// Level 4
			var agility:PerkData = new PerkData();
			agility.classLimit = GLOBAL.CLASS_SMUGGLER;
			agility.levelLimit = 4;
			agility.autoGained = true;
			agility.perkName = "Agility";
			agility.perkDescription = "Increases evasion granted via items by 20%, or provides a flat 6% evasion boost, whichever is higher.";
			insertPerkData(agility);
			
			var sfGen:PerkData = new PerkData();
			sfGen.classLimit = GLOBAL.CLASS_SMUGGLER;
			sfGen.levelLimit = 4;
			sfGen.perkName = "Stealth Field Generator";
			sfGen.perkDescription = "Grants the ability to massively increase evasion chance for two combat rounds.";
			insertPerkData(sfGen);
			
			var disarmS:PerkData = new PerkData();
			disarmS.classLimit = GLOBAL.CLASS_SMUGGLER;
			disarmS.levelLimit = 4;
			disarmS.perkName = "Disarming Shot";
			disarmS.perkDescription = "Grants the ability to disarm your target, rendering them unable to wield a weapon for four combat rounds.";
			insertPerkData(disarmS);
			
			// Level 5
			var sharpEyes:PerkData = new PerkData();
			sharpEyes.classLimit = GLOBAL.CLASS_SMUGGLER;
			sharpEyes.levelLimit = 5;
			sharpEyes.autoGained = true;
			sharpEyes.perkName = "Sharp Eyes";
			sharpEyes.perkDescription = "Decreases the time required to recover from blinding effects, reducing their duration by one combat round.";
			insertPerkData(sharpEyes);
			
			var gasGren:PerkData = new PerkData();
			gasGren.classLimit = GLOBAL.CLASS_SMUGGLER;
			gasGren.levelLimit = 5;
			gasGren.perkName = "Gas Grenade";
			gasGren.perkDescription = "Grants the ability to throw a grenade designed to emit a lust-inducing smog. Deals lust damage to all enemies in combat.";
			insertPerkData(gasGren);
			
			var grenade:PerkData = new PerkData();
			grenade.classLimit = GLOBAL.CLASS_SMUGGLER;
			grenade.levelLimit = 5;
			grenade.perkName = "Grenade";
			grenade.perkDescription = "Grants the ability to throw a grenade designed to emit high levels of thermal radiation. Deals Thermal damage to all enemies in combat.";
			insertPerkData(grenade);

			//Level 6
			//Passive: Supply and Demand: You gain a 5% discount on items bought in stores, and make 10% more from items sold.
			var supplyAndDemand:PerkData = new PerkData();
			supplyAndDemand.classLimit = GLOBAL.CLASS_SMUGGLER;
			supplyAndDemand.levelLimit = 6;
			supplyAndDemand.autoGained = true;
			supplyAndDemand.perkName = "Supply And Demand";
			supplyAndDemand.perkDescription = "Reduces shopkeeper markups by 5% and markdowns by 10%.";
			insertPerkData(supplyAndDemand);
			//Double Passive: Improved Agility: Increases base evasion even higher.
			var improvedAgility:PerkData = new PerkData();
			improvedAgility.classLimit = GLOBAL.CLASS_SMUGGLER;
			improvedAgility.levelLimit = 6;
			improvedAgility.autoGained = true;
			improvedAgility.perkName = "Improved Agility";
			improvedAgility.perkDescription = "Increases your evasion by an additional 6%.";
			insertPerkData(improvedAgility);
			
			//1. Quickdraw: Changing weapons does not take your entire turn. 
			var quickDraw:PerkData = new PerkData();
			quickDraw.classLimit = GLOBAL.CLASS_SMUGGLER;
			quickDraw.levelLimit = 6;
			quickDraw.perkName = "Quickdraw";
			quickDraw.perkDescription = "Equipping a new weapon no longer consumes your turn in combat.";
			insertPerkData(quickDraw);
			
			//2. Leap Up: When you are knocked prone, you immediately stand back up at the start of your next turn. 
			var leapUp:PerkData = new PerkData();
			leapUp.classLimit = GLOBAL.CLASS_SMUGGLER;
			leapUp.levelLimit = 6;
			leapUp.perkName = "Leap Up";
			leapUp.perkDescription = "Allows you to easily and freely leap to your feet after being knocked prone.";
			insertPerkData(leapUp);

			//Level 7
			//Passive: Hidden Loot: You gain two additional inventory slots.
			var hiddenLoot:PerkData = new PerkData();
			hiddenLoot.classLimit = GLOBAL.CLASS_SMUGGLER;
			hiddenLoot.levelLimit = 7;
			hiddenLoot.autoGained = true;
			hiddenLoot.perkName = "Hidden Loot";
			hiddenLoot.perkDescription = "Increases inventory size by two slots.";
			insertPerkData(hiddenLoot);
			//Double Passive: +Sneak Attack/Backstab damage (every 6 levels, keeps them as DPS monsters we all know them to be)
			var takeAdvantage:PerkData = new PerkData();
			takeAdvantage.classLimit = GLOBAL.CLASS_SMUGGLER;
			takeAdvantage.levelLimit = 7;
			takeAdvantage.autoGained = true;
			takeAdvantage.perkName = "Take Advantage";
			takeAdvantage.perkDescription = "Increase sneak attack and aimed shot bonuses by 100%.";
			insertPerkData(takeAdvantage);
			
			//1. Smuggled Stimulant: Gain 25 energy per round for 3 rounds, once per combat.
			var smuggledStimulant:PerkData = new PerkData();
			smuggledStimulant.classLimit = GLOBAL.CLASS_SMUGGLER;
			smuggledStimulant.levelLimit = 7;
			smuggledStimulant.perkName = "Smuggled Stimulant";
			smuggledStimulant.perkDescription = "Allows you to gain 25 energy per round for 3 rounds, once per combat.";
			insertPerkData(smuggledStimulant);
			
			//2. Burst of Energy: Gain 60 energy, once per combat.
			var burstOfEnergy:PerkData = new PerkData();
			burstOfEnergy.classLimit = GLOBAL.CLASS_SMUGGLER;
			burstOfEnergy.levelLimit = 7;
			burstOfEnergy.perkName = "Burst of Energy";
			burstOfEnergy.perkDescription = "Allows you to recover 60 energy, once per combat.";
			insertPerkData(burstOfEnergy);

		}
		
		private function ConfigureEngineerPerks():void
		{
			// Level 2
			var shieldTweaks:PerkData = new PerkData();
			shieldTweaks.classLimit = GLOBAL.CLASS_ENGINEER;
			shieldTweaks.levelLimit = 2;
			shieldTweaks.autoGained = true;
			shieldTweaks.perkName = "Shield Tweaks";
			shieldTweaks.perkDescription = "Grants your shield generator an additional 2 points of shield protection per level.";
			insertPerkData(shieldTweaks);
			
			var attackDrone:PerkData = new PerkData();
			attackDrone.classLimit = GLOBAL.CLASS_ENGINEER;
			attackDrone.levelLimit = 2;
			attackDrone.perkName = "Attack Drone";
			attackDrone.perkDescription = "Grants an attack drone that will automatically fire on your enemies every combat round as long as your shields are up. The drone will also supplant your shields with its own, raising your maximum shielding by one point per level.";
			insertPerkData(attackDrone);
			
			var shieldBooster:PerkData = new PerkData();
			shieldBooster.classLimit = GLOBAL.CLASS_ENGINEER;
			shieldBooster.levelLimit = 2;
			shieldBooster.perkName = "Shield Booster";
			shieldBooster.perkDescription = "Grants a further increase to your shield generator, providing an additional four points of protection per level.";
			insertPerkData(shieldBooster);
			
			// Level 3
			var enhancedDampeners:PerkData = new PerkData();
			enhancedDampeners.classLimit = GLOBAL.CLASS_ENGINEER;
			enhancedDampeners.levelLimit = 3;
			enhancedDampeners.autoGained = true;
			enhancedDampeners.perkName = "Enhanced Dampeners";
			enhancedDampeners.perkDescription = "Grants a 50% vulnerability reduction to damage absorbed by your shield generator.";
			insertPerkData(enhancedDampeners);
			
			var overcharge:PerkData = new PerkData();
			overcharge.classLimit = GLOBAL.CLASS_ENGINEER;
			overcharge.levelLimit = 3;
			overcharge.perkName = "Overcharge";
			overcharge.perkDescription = "Grants the ability to perform a single ranged attack for 150% normal damage. If the target's shields have been depleted, the shot may stun the target. Requires an energy weapon.";
			insertPerkData(overcharge);
			
			var volley:PerkData = new PerkData();
			volley.classLimit = GLOBAL.CLASS_ENGINEER;
			volley.levelLimit = 3;
			volley.perkName = "Volley";
			volley.perkDescription = "Grants the ability to perform an extra ranged attack with reduced accuracy, but a chance of causing blindness regardless. Requires an energy weapon.";
			insertPerkData(volley);
			
			// Level 4
			var armorTweaks:PerkData = new PerkData();
			armorTweaks.classLimit = GLOBAL.CLASS_ENGINEER;
			armorTweaks.levelLimit = 4;
			armorTweaks.autoGained = true;
			armorTweaks.perkName = "Armor Tweaks";
			armorTweaks.perkDescription = "Grants a 20% bonus to defense values provided by equipped armor.";
			insertPerkData(armorTweaks);
			
			var powerSurge:PerkData = new PerkData();
			powerSurge.classLimit = GLOBAL.CLASS_ENGINEER;
			powerSurge.levelLimit = 4;
			powerSurge.perkName = "Power Surge";
			powerSurge.perkDescription = "Grants the ability to restore a moderate amount of shielding for 33 energy.";
			insertPerkData(powerSurge);
			
			var deflectorRegen:PerkData = new PerkData();
			deflectorRegen.classLimit = GLOBAL.CLASS_ENGINEER;
			deflectorRegen.levelLimit = 4;
			deflectorRegen.perkName = "Deflector Regeneration";
			deflectorRegen.perkDescription = "Grants the ability to restore a moderate amount of shielding over four combat rounds for 20 energy.";
			insertPerkData(deflectorRegen);
			
			// Level 5
			var staticBurst:PerkData = new PerkData();
			staticBurst.classLimit = GLOBAL.CLASS_ENGINEER;
			staticBurst.levelLimit = 5;
			staticBurst.autoGained = true;
			staticBurst.perkName = "Static Burst";
			staticBurst.perkDescription = "Grants the ability to briefly overload your shield emitter. The burst shocks any enemies in close proximity, freeing you from grapples for a small energy cost.";
			insertPerkData(staticBurst);
			
			var gDisrupt:PerkData = new PerkData();
			gDisrupt.classLimit = GLOBAL.CLASS_ENGINEER;
			gDisrupt.levelLimit = 5;
			gDisrupt.perkName = "Gravidic Disruptor";
			gDisrupt.perkDescription = "Grants the ability to deal Gravidic damage to targetted enemies. There shouldn't be anything out there that's resistant to gravitic damage!";
			insertPerkData(gDisrupt);
			
			var tDisrupt:PerkData = new PerkData();
			tDisrupt.classLimit = GLOBAL.CLASS_ENGINEER;
			tDisrupt.levelLimit = 5;
			tDisrupt.perkName = "Thermal Disruptor";
			tDisrupt.perkDescription = "Grants the ability to deal Thermal damage to your foes. Deals higher base damage than Gravidic Disruptor, but some enemies may be resistant to Thermal damage.";
			insertPerkData(tDisrupt);

			//Level 6
			//Passive: Shield Regen: Once per fight, regenerate 25% of shields the turn after they drop.
			var shieldRegen:PerkData = new PerkData();
			shieldRegen.classLimit = GLOBAL.CLASS_ENGINEER;
			shieldRegen.levelLimit = 6;
			shieldRegen.autoGained = true;
			shieldRegen.perkName = "Shield Regen";
			shieldRegen.perkDescription = "Builds a redundancy into your shields that can reactivate them at 25% capacity once per fight after they drop.";
			insertPerkData(shieldRegen);
			
			//1. Gun Tweaks: Thanks to your after-market modifications, you do more damage with energy guns.
			var gunTweaks:PerkData = new PerkData();
			gunTweaks.classLimit = GLOBAL.CLASS_ENGINEER;
			gunTweaks.levelLimit = 6;
			gunTweaks.perkName = "Gun Tweaks";
			gunTweaks.perkDescription = "Allows you to do 20% additional damage with energy guns thanks to after-market modifications.";
			insertPerkData(gunTweaks);
			
			//2. Weapon Tweaks: Thanks to your after-market modifications, you do more damage with melee energy weapons.
			var weaponTweaks:PerkData = new PerkData();
			weaponTweaks.classLimit = GLOBAL.CLASS_ENGINEER;
			weaponTweaks.levelLimit = 6;
			weaponTweaks.perkName = "Weapon Tweaks";
			weaponTweaks.perkDescription = "Allows you to do 20% additional damage with melee energy weapons thanks to after-market modifications.";
			insertPerkData(weaponTweaks);

			//Level 7
			//Passive: Less Gay Passive: Precise Shot: Gain a bonus to ranged attack damage based off your Intelligence. (5:1 ratio maybe?)
			//Or, Vital Strike: You can pick out weak points when enemies get up close. Intelligence is now used for melee attack accuracy, rather than Physique (though Physique still applies to damage). 
			var fightSmarter:PerkData = new PerkData();
			fightSmarter.classLimit = GLOBAL.CLASS_ENGINEER;
			fightSmarter.levelLimit = 7;
			fightSmarter.autoGained = true;
			fightSmarter.perkName = "Fight Smarter";
			fightSmarter.perkDescription = "Improves melee and ranged accuracy by a small portion of your intelligence.";
			insertPerkData(fightSmarter);
			
			//Weapon Hack: Hack an enemy's energy weapons, locking them! {Inflicts Disarm. Obviously has no effect on kinetic-based foes.}
			var weaponHack:PerkData = new PerkData();
			weaponHack.classLimit = GLOBAL.CLASS_ENGINEER;
			weaponHack.levelLimit = 7;
			weaponHack.perkName = "Weapon Hack";
			weaponHack.perkDescription = "Allows you to spend 15 energy to hack the enemy's energy weapons, preventing their use for four to five rounds";
			insertPerkData(weaponHack);
			
			//Shield Hack: Hack an enemy's shields, weakening them! {Deals heavy damage to shields}
			var shieldHack:PerkData = new PerkData();
			shieldHack.classLimit = GLOBAL.CLASS_ENGINEER;
			shieldHack.levelLimit = 7;
			shieldHack.perkName = "Shield Hack";
			shieldHack.perkDescription = "Allows you to spend 25 energy to hack an enemy's shield, dealing very high shield damage.";
			insertPerkData(shieldHack);
		}
		
		public function getPlayerClassPerksList():Vector.<PerkData>
		{
			return _perkList.filter(classFilter);
		}
		
		public function getPerksList():Vector.<PerkData>
		{
			return _perkList.filter(nonClassFilter);
		}
		
		public function getAvailablePerksList():Vector.<PerkData>
		{
			return _perkList.filter(availablePerksFilter);
		}
		
		private function classFilter(item:PerkData, index:int, vector:Vector.<PerkData>):Boolean
		{
			if (item.isClassLimited == true && item.classLimit == (kGAMECLASS.pc as PlayerCharacter).characterClass) return true;
			return false;
		}
		
		private function nonClassFilter(item:PerkData, index:int, vector:Vector.<PerkData>):Boolean
		{
			if (item.isClassLimited == false) return true;
			return false;
		}
		
		private function availablePerksFilter(item:PerkData, index:int, vector:Vector.<PerkData>):Boolean
		{
			if (item.isLevelLimited == false) return true;
			if (item.isLevelLimited == true && item.levelLimit <= (kGAMECLASS.pc as PlayerCharacter).level) return true;
			return false
		}
		
		private function insertPerkData(perkData:PerkData):void
		{
			_perkList.push(perkData);
		}
		
		public function getPerksForLevel(perkData:Vector.<PerkData>, level:int):Vector.<PerkData>
		{
			return perkData.filter(function(item:PerkData, index:int, vector:Vector.<PerkData>):Boolean {
				if ((item as PerkData).autoGained == true) return false;
				if ((item as PerkData).levelLimit == level) return true;
				return false;
			});
		}
		
		public function getAutoPerkForCreature(creature:Creature):PerkData
		{			
			var filterPerk:Vector.<PerkData> = _perkList.filter(function(item:PerkData, index:int, vector:Vector.<PerkData>):Boolean {
				if ((item as PerkData).autoGained == true
					&& (item as PerkData).levelLimit == creature.level
					&& (item as PerkData).isClassLimited == true
					&& (item as PerkData).classLimit == creature.characterClass) return true;
					return false;
			});
			
			if (filterPerk.length > 1) throw new Error("Found more than one potential autoperk, fuck.");
			
			if (filterPerk.length == 1) 
			{
				return filterPerk[0];
			}
			
			return null;
		}
		
		public function getAutoPerksForCreature(creature:Creature):Vector.<PerkData>
		{
			var filterPerks:Vector.<PerkData> = _perkList.filter(function(item:PerkData, index:int, vector:Vector.<PerkData>):Boolean {
				if ((item as PerkData).autoGained == true
					&& (item as PerkData).levelLimit <= creature.level
					&& (item as PerkData).isClassLimited == true
					&& (item as PerkData).classLimit == creature.characterClass) return true;
					return false;
			});
			
			return filterPerks;
		}
	}

}