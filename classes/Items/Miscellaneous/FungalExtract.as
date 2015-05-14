package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class FungalExtract extends ItemSlotClass
	{
		//Fungal Extract
	
		//constructor
		public function FungalExtract()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.POTION;
			
			//Used on inventory buttons
			this.shortName = "F.Extract";
			
			//Regular name
			this.longName = "vial of fungal extract";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a vial of fungal extract";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This sludgy cocktail of Myrellion deep funguses, local venoms, and plant matter has a potent smell, and glows a faint red color. Supposedly, this \"potion\" should restore vigor and vitality in battle and in bed.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 600;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = true;
			this.targetsSelf = true;

			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			// Player used an item
			if (target == kGAMECLASS.pc)
			{
				kGAMECLASS.clearOutput();
				playerUsed(target, usingCreature);
			}
			// Enemy used an item on the PC
			else if (target != kGAMECLASS.pc && usingCreature != kGAMECLASS.pc)
			{
				kGAMECLASS.output("\n");
				npcUsed(target, usingCreature);
			}
			else
			{
				throw new Error("Don't know how we got here. Exception for debugging.");
			}
			return false;
		}
		public function playerUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			kGAMECLASS.output("You pull out the sludgy fungal extract from your pack and uncork it, instantly scrunching your nose up at the pungent aroma of it. Still, you force yourself to knock it back, draining the vial down and grunting as it burns your throat. You quickly feel a rush of vigor... and a hint of arousal burning your cheeks.\n");
			targetCreature.lust(20);
			targetCreature.HP(50);
		}
		
		public function npcUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			kGAMECLASS.output(usingCreature.capitalA + usingCreature.short + " drinks down the draft, looking a little hornier and more than a little healthier!");
			targetCreature.lust(20);
			targetCreature.HP(50);
		}
	}
}
