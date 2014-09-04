package classes.Items.Miscellaneous 
{
	import classes.Creature;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class FlashGrenade extends ItemSlotClass
	{
		
		public function FlashGrenade() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.EXPLOSIVECONSUMABLE;
			
			this.shortName = "Flashbang";
			
			this.longName = "flashbang";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a flashbang";
			
			this.tooltip = "These single-use flash grenades are valuable self-defense and escape tools, allowing you to quickly evade an opponent or exploit his blindness and attack with near impunity. ";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 100;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.ELECTRIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.combatUsable = true;
			this.targetsSelf = false;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(targetCreature:Creature, usingCreature:Creature = null):Boolean
		{
			if (!kGAMECLASS.inCombat())
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("Pulling the pin on a grenade without a target to throw it at would be pretty dumb now, wouldn't it?");
				this.quantity++;
				return false;
			}
			else
			{
				// Player used an item
				if (usingCreature == kGAMECLASS.pc)
				{
					kGAMECLASS.clearOutput();
					playerUsed(targetCreature, usingCreature);
				}
				// Enemy used an item on the PC
				else if (targetCreature == kGAMECLASS.pc && usingCreature != kGAMECLASS.pc)
				{
					kGAMECLASS.output("\n");
					npcUsed(targetCreature, usingCreature);
				}
				else
				{
					throw new Error("Don't know how we got here. Exception for debugging.");
				}
				
				return false;
			}
		}
		
		public function playerUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			if (targetCreature.plural) kGAMECLASS.output("You throw a flashbang at one of " + targetCreature.a + targetCreature.short + "!");
			else kGAMECLASS.output("You throw a flashbang at " + targetCreature.a + targetCreature.short + "!");
			
			if (!targetCreature.hasStatusEffect("Blind"))
			{
				if (targetCreature.plural) kGAMECLASS.output("\n<b>" + targetCreature.capitalA + targetCreature.short + " are blinded by");
				else kGAMECLASS.output("\n<b>" + targetCreature.capitalA + targetCreature.short + " is blinded by");
				kGAMECLASS.output(" the luminous flashes.</b>");
				
				targetCreature.createStatusEffect("Blind", 2, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
			}
			else
			{
				kGAMECLASS.output("\nThe flashbang has no effect on " + targetCreature.a + targetCreature.short + ".");
			}
			
			kGAMECLASS.output("\n");
		}
		
		public function npcUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			kGAMECLASS.output(usingCreature + " threw a grenade at");
			if (targetCreature == kGAMECLASS.pc) kGAMECLASS.output(" you!");
			else kGAMECLASS.output(" " + targetCreature.short);
			
			kGAMECLASS.genericDamageApply(this.damage, usingCreature, targetCreature, this.damageType);
			
			if (!targetCreature.hasStatusEffect("Blind"))
			{
				kGAMECLASS.output(" <b>The grenade explodes with a vibrant and overwhelming flash, the sheer magnitude of the effect almost knocking you to your [pc.ass]. You're seeing stars!</b>");
				targetCreature.createStatusEffect("Blind", 2, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
			}
			else
			{
				kGAMECLASS.output(" You manage to turn away just in time to avoid the brunt of the explosions disorienting effects.");
			}
		}
	}

}