package classes.Characters
{
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

	public class DaerWorm extends Creature
	{
		public function DaerWorm()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "daer worm";
			this.originalRace = "worm"; //?
			this.btnTargetText = "Daer Worm";
			this.long = "The daer worm is a monstrous creature easily twenty feet long, with a body covered with brown and black chitin and dozens of spindly, clawed legs. Its head is wedge-shaped, with foot-long spikes running in ridges down the sides, and a wide, toothy underbite maw filled with more teeth than any creature should need. The worm glares down at you with four beady black eyes as its body sways back and forth, jaws snapping."
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
			this.shield.shields = 40;
			this.shield.resistances.addFlag(DamageFlag.SYDIANARMOR);
			this.shield.hasRandomProperties = true;
			
			this.physiqueRaw = 25;
			this.reflexesRaw = 18;
			this.aimRaw = 6;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 15;
			this.libidoRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.isLustImmune = true;
		
			this.level = 5;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			
			this.isUniqueInFight = true;
		}
		
		override public function get bustDisplay():String
		{
			return "DAERWORM";
		}

		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = hostileCreatures[0];
			
			if (CombatManager.getRoundCount()%3 + rand(2) > 1) return bite(target);
			return claw(target);
		}
		
		private function claw(target:Creature):void
		{
			output("The daer worm wrenches its enormous body sideways, sending up a cloud of dust as it sweeps half a dozen clawed legs at you. ");
			if (!combatMiss(this, target) && !blindMiss(this, target, true))
			{
				var damage:DamageResult = applyDamage(damageRand(new TypeCollection({kinetic: 18}), 20), this, target, "suppress");
				if (target.shields() > 0) output("The claws scrape against your shield, sending sparks flying. ");
				else output("The claws scrape at you" + (target.hasArmor() ? " through your [pc.armor]" : "") + ", leaving long marks across your [pc.skinFurScales]. ");
				outputDamage(damage);
			}
			else output("You quickly step back to avoid the attack.");
		}
		
		private function bite(target:Creature):void
		{
			output("The daer worm rears its body up, nearly to the cavern ceiling, and thrusts its head forward, the giant maw snapping at you. ");
			if (!combatMiss(this, target) && !blindMiss(this, target, true))
			{
				var damage:DamageResult = applyDamage(damageRand(new TypeCollection({kinetic: 25}), 20), this, target, "suppress");
				if (target.shields() > 0)
				{
					output("Its head bounces hard off of your shield, and it rears back, baring its dozens of teeth at you. ");
					outputDamage(damage);
				}
				else
				{
					output("Its jaws catch hold of you, but you squirm away, taking a ragged wound but keeping it from getting hold of you. ");
					if (target.hasStatusEffect("Bleeding")) output("<b>You're bleeding more now.</b> ");
					else output("<b>You are now bleeding.</b> ");
					outputDamage(damage);
					output("\n\nThe worm pulls back with a guttural snarl, ready for another attack.");
					CombatAttacks.applyBleed(target, 1, 2+rand(2), 8);
				}
			}
			else output("You duck to one side, and the worm's jaws snap shut on empty air.");
		}
	}
}
    