package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	public class ShukuchiHuman extends ShukuchiAgent
	{
		public function ShukuchiHuman()
		{
			this.short = "Host Agent";
			this.originalRace = "human";
			
			this.long = "Two similarly built, human male agents wearing black body armor with masks and hoods. They’re taking up equal amounts of space, just enough to maneuver in a close-quarters environment. In their hands are a hardlight dagger each and some sort of advanced-looking fake knuckle device in the other. The blue glow of the devices makes you wary. While they’re not advancing on you, you’re sure they’ve no intention of letting you escape...";
			
			this.customDodge = "The masked agent deftly side-steps your assault, fading in and out of visibility for safe measure" + this.customDodge;
			this.customBlock = "The masked agent" + this.customBlock;
			
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
			
			this.punchySpecial = this.punchyHuman;

			this.cocks[0].cType = GLOBAL.TYPE_HUMAN;
			
			btnTargetText = "Human Agent";
		}
		
		//NEED TO ACTUALLY IMPLEMENT THIS
		private function punchyHuman(target:Creature):void
		{
			//Does 45 base points of greater shield drain damage, no other kind of damage. Alwayshits.
			output("The agent lunges at you with a knuckle device, a field of crackling energy building up around his fingers!");
			output("\n\nYour shield crackles and shudders as it’s hit with violent anti-energy, although you’re unharmed by the assault!");
			applyDamage(new TypeCollection(), this, target, "minimal");
		}
	}
}