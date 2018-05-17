package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
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
			
			baseHPResistances.freezing.damageValue = -10.0;
			baseHPResistances.drug.damageValue = -25.0;
			
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
			
			this.cocks[0].cType = GLOBAL.TYPE_CANINE;
			
			isUniqueInFight = true;
		}
		
		override protected function punchySpecial(target:Creature):void
		{
			output("The agent waves his hand over his face, an invisible field covering him from your view!");
			if (hasStatusEffect("Fade-cloak")) setStatusValue("Fade-cloak", 1, 3);
			else createStatusEffect("Fade-cloak", 3, 80, 50, 0, false, "DefenseUp", "Evasion increased +80%, damage increased by 50%", true, 0, UIStyleSettings.gShieldColour);
		}
		
		override public function OnTakeDamage(incomingDamage:TypeCollection):void
		{
			super.OnTakeDamage(incomingDamage);
			for (var i:uint = 0; i < DamageType.NUMTYPES && hasStatusEffect("Fade-cloak") && !hasStatusEffect("Fade-cloak struck"); i++)
				if (incomingDamage.getType(i).isHPDamage && incomingDamage.getType(i).damageValue > 0)
					this.createStatusEffect("Fade-cloak struck", 0, 0, 0, 0, true, "", "", true);
		}
	}
}