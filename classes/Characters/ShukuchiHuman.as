package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;
	public class ShukuchiHuman extends ShukuchiAgent
	{
		public function ShukuchiHuman()
		{
			this.short = "Host Agent";
			this.originalRace = "human";
			
			this.long = "";
			
			this.customDodge = "The masked agent deftly side-steps your assault, fading in and out of visibility for safe measure" + this.customDodge;
			this.customBlock = "The masked agent" + this.customBlock;
			
			this.shield = new ReaperArmamentsMarkIShield();
			this.shieldsRaw = 120;
			this.lustRaw = 35;
			
			this.hairLength = 2;
			
			this.tallness = 76;
			
			this.earType = GLOBAL.TYPE_HUMAN;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			this.hipRatingRaw = 3;
			this.buttRatingRaw = 2;

			this.cocks[0].cType = GLOBAL.TYPE_HUMAN;
			
			btnTargetText = "Human Agent";
		}

		override protected function punchySpecial(target:Creature):void
		{
			//If no shields, flurry
			if (target.shieldsRaw <= 0)
			{
				punchyFlurry(target);
				return;
			}
			
			//Does 45 base points of greater shield drain damage, no other kind of damage. Alwayshits.
			output("The agent lunges at you with a knuckle device, a field of crackling energy building up around his fingers!");
			output("\n\nYour shield crackles and shudders as it’s hit with violent anti-energy, although you’re unharmed by the assault!");
			
			var bsDamage:TypeCollection = new TypeCollection();
			bsDamage.electric.damageValue = 45;
			bsDamage.addFlag(DamageFlag.GREATER_DRAINING);
			applyDamage(bsDamage, this, target, "minimal");
		}
	}
}