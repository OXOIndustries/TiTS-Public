package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Interfaces.output;
	import classes.UIComponents.UIStyleSettings;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	public class ShukuchiAusar extends ShukuchiAgent
	{
		public function ShukuchiAusar()
		{
			this.short = "Ausar " + (kGAMECLASS.silly ? "ninja kinda Fucker" : "Agent");
			this.originalRace = "ausar";
			
			this.long = "He’s constantly bouncing on the heels and balls of his feet, directing the way in which the two of you face up. As an ausar, he has fluffed arms and legs with a longish, bushy tail holding his balance. He seems to be somewhat of an atypical variant: his fur is a white, black and toffee brown palette. Although wearing tight-looking, black body armour, his arms and hands are exposed to reveal a chiseled gymnast's physique, the skin-covered parts of his arms adorned with tattoos.";
			this.long += "\n\nA blank, black and ovaloid mask conceals his face and a hood covers the rest of his head, adding to the mystery of his identity.";
			this.long += "\n\nIn his hand is a uniquely shaped hardlight dagger, the other repeatedly curling and uncurling from a fist to splayed fingers.";
			
			this.customDodge = "The masked ausar deftly side-steps your assault, putting a little distance between you" + this.customDodge;
			this.customBlock = "The masked ausar" + this.customBlock;
			
			this.shield = new ReaperArmamentsMarkIIShield();
			this.shieldsRaw = 150;
			this.lustRaw = 15;
			
			this.hairColor += " and brown";
			this.hairLength = 3;
			
			this.tallness = 71;
			
			this.eyeColor = "opal";
			
			this.earType = GLOBAL.TYPE_CANINE;
			this.eyeType = GLOBAL.TYPE_FELINE;
			
			this.tongueType = GLOBAL.TYPE_CANINE;
			this.armType = GLOBAL.TYPE_CANINE;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_FURRED];
			
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];

			this.hipRatingRaw = 5;
			this.buttRatingRaw = 3;
			
			btnTargetText = "Ausar Agent";
			sexualPreferences.setRandomPrefs(5 + rand(3));
			
			this.punchySpecial = punchyAusar;
			
			this.cocks[0].cType = GLOBAL.TYPE_CANINE;
			
			isUniqueInFight = true;
		}
		
		private function punchyAusar(target:Creature):void
		{
			output("The agent waves his hand over his face, an invisible field covering him from your view!");
			//THIS JUST SHOWS THE ICON FOR NOW
			createStatusEffect("Fade-cloak", 3, 0, 0, 0, false, "DefenseUp", "Evasion increased +80%, damage increased by 50%", true, 0, UIStyleSettings.gShieldColour);
		}
	}
}