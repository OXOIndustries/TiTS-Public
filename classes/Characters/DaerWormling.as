package classes.Characters
{
	import classes.GLOBAL;
	import classes.Creature;
	import classes.Items.Melee.Fists;
	import classes.Items.Protection.BasicShield;
	import classes.Engine.Combat.applyDamage;
	import classes.Engine.Combat.blindMiss;
	import classes.Engine.Combat.combatMiss;
	import classes.Engine.Combat.damageRand;
	import classes.Engine.Combat.outputDamage;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Utility.rand;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;

	public class DaerWormling extends Creature
	{
		private var buryRes:TypeCollection;
		private var auxRes:TypeCollection;
		public function DaerWormling()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "wormling";
			this.originalRace = "worm"; //?
			this.btnTargetText = "Wormling";
			this.a = "the ";
			this.capitalA = "The ";
			this.customDodge = "The wormling scrambles aside, its legs scraping against the stone.";
			this.customBlock = "The alien’s chitin deflects the attack.";
			this.isPlural = false;
			
			this.meleeWeapon = new Fists();
			this.meleeWeapon.attackNoun = "slash";
			this.meleeWeapon.attackVerb = "slash";
			this.meleeWeapon.longName = "claw";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 10;
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "chitinous plating";
			this.armor.hasRandomProperties = true;
			
			this.shieldDisplayName = "ARMOR";
			this.shield = new BasicShield();
			this.shield.shields = 10;
			this.shield.resistances.addFlag(DamageFlag.SYDIANARMOR);
			this.shield.hasRandomProperties = true;
			
			this.physiqueRaw = 15;
			this.reflexesRaw = 10;
			this.aimRaw = 3;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 8;
			this.libidoRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.isLustImmune = true;

			this.buryRes = new TypeCollection();
			this.buryRes.burning.damageValue = 100.0;
			this.buryRes.kinetic.damageValue = 100.0;
			this.buryRes.freezing.damageValue = 100.0;
			this.buryRes.electric.damageValue = 100.0;
			this.buryRes.corrosive.damageValue = 100.0;
			this.buryRes.psionic.damageValue = 100.0;
			
			this.level = 3;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = -15;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			
			this.removeCock(0, this.cocks.length);
			
			this.isUniqueInFight = false;
		}
		
		override public function get bustDisplay():String
		{
			return "WORMLING";
		}

		private var lastBite:int = 0;
		private var lastBurrow:int = 0;
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = hostileCreatures[0];

			var rounds:int = CombatManager.getRoundCount();
			if (rounds-lastBurrow + rand(2) > 3) return burrow(target, rounds);
			if (rounds-lastBite + rand(2) > 2) return bite(target, rounds);
			return claw(target);
		}
		
		private function claw(target:Creature):void
		{
			output("The wormling wrenches its long body sideways, sweeping half a dozen clawed legs at you. ");
			if (!combatMiss(this, target) && !blindMiss(this, target, true))
			{
				var damage:DamageResult = applyDamage(damageRand(new TypeCollection({kinetic: 8}), 20), this, target, "suppress");
				if (target.shields() > 0) output("The claws scrape against your shield, sending sparks flying. ");
				else output("The claws scrape at you" + (target.hasArmor() ? " through your [pc.armor]" : "") + ", leaving long marks across your [pc.skinFurScales]. ");
				outputDamage(damage);
			}
			else output("You quickly step back to avoid the attack.");
		}
		
		private function bite(target:Creature, rounds:int):void
		{
			lastBite = rounds;
			output("The wormling hoists its body up and thrusts its head forward, toothy maw snapping at your [pc.legs]. ");
			if (!combatMiss(this, target) && !blindMiss(this, target, true))
			{
				var damage:DamageResult = applyDamage(damageRand(new TypeCollection({kinetic: 12}), 20), this, target, "suppress");
				if (target.shields() > 0) output("Its head bounces off of your shield, and it rears back, then gives itself a hard shake. ");
				else output("Its jaws snap shut around your [pc.leg], leaving deep wounds. The wormling lets go and pulls back after a second, ready for another attack. ");
				outputDamage(damage);
			}
			else output("You duck to one side, and the wormling's jaws snap shut on empty air.");
		}
		
		private function burrow(target:Creature, rounds:int):void
		{
			if (!hasStatusEffect("Burrowed"))
			{
				output("The wormling scrabbles at the cave floor with its dozens of claws, digging into the ground. After a few seconds, it's dug beneath the ground, leaving behind a pile of dirt. You can't tell where it's gone.");
				auxRes = baseHPResistances;
				baseHPResistances = buryRes;
				CombatAttacks.applyBurrow(this);
			}
			else
			{
				lastBite++;
				lastBurrow = rounds;
				removeStatusEffect("Burrowed");
				
				baseHPResistances = auxRes;
				
				output("The wormling bursts out of the ground in a spray of dirt and gravel, snapping its jaws at your [pc.feet].");
				if (!combatMiss(this, target, this.attack()*1.75) && !blindMiss(this, target, true))
				{
					var damage:DamageResult = applyDamage(damageRand(new TypeCollection({kinetic: 25}), 20), this, target, "suppress");
					if (target.shields() > 0) output("Its jaws snap against your shield, and it tumbles away, then rights itself and faces you again. ");
					else
					{
						output("Its teeth dig deep into your [pc.feet], and you stumble back. The wormling lets go, but the damage is done, and you know <b>it'll be harder to run away now.</b> ");
						CombatAttacks.applyHobble(target);
					}
					outputDamage(damage);
				}
				else output("You leap out of the way, and the wormling's jaws snap at where your [pc.feet] used to be, closing with a clacking sound.");
			}
		
		}
	}
}
    