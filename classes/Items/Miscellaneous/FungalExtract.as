package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.inCombat;
	
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
			this.tooltip = "This sludgy cocktail of Myrellion deep funguses, local venoms, and plant matter has a potent smell, and glows a faint red color. Supposedly, this “potion” should restore vigor and vitality in battle and in bed.";
			
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
			if (target.hasStatusEffect("Healed"))
			{
				if(!kGAMECLASS.infiniteItems()) quantity++;
				if (target == kGAMECLASS.pc)
				{
					kGAMECLASS.clearOutput();
					kGAMECLASS.output("Using supplements to heal yourself will only work once per fight. No body can handle the metabolic strain of downing multiple regenerative items in such quick succession.");
				}
				else
				{
					if(inCombat()) kGAMECLASS.output("\n\n");
					else kGAMECLASS.clearOutput();
					kGAMECLASS.output(target.capitalA + target.short + " has already healed during this fight! Doing so again would be more than ill-advised!");
				}
				return false;
			}
			// Player used an item
			if (target == kGAMECLASS.pc)
			{
				kGAMECLASS.clearOutput();
				playerUsed(target, usingCreature);
			}
			// Enemy used an item
			else if (target != kGAMECLASS.pc && usingCreature != kGAMECLASS.pc)
			{
				if(inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				npcUsed(target, usingCreature);
			}
			else
			{
				throw new Error("Don’t know how we got here. Exception for debugging.");
			}
			return false;
		}
		public function playerUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			var healing:int = 50;
			if(targetCreature.HP() + healing > targetCreature.HPMax())
			{
				healing = targetCreature.HPMax() - targetCreature.HP();
			}
			kGAMECLASS.output("You pull out the sludgy fungal extract from your pack and uncork it, instantly scrunching your nose up at the pungent aroma of it. Still, you force yourself to knock it back, draining the vial down and grunting as it burns your throat.");
			if (healing > 0) kGAMECLASS.output(" You quickly feel a rush of vigor... and a hint of arousal burning your cheeks.");
			else kGAMECLASS.output(" You are hit by a rush of arousal!");
			targetCreature.changeHP(healing);
			targetCreature.changeLust(20);
			if (inCombat()) targetCreature.createStatusEffect("Healed", 0, 0, 0, 0, true, "", "", true, 0);
		}
		
		public function npcUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			var healing:int = 50;
			if(targetCreature.HP() + healing > targetCreature.HPMax())
			{
				healing = targetCreature.HPMax() - targetCreature.HP();
			}
			kGAMECLASS.output(usingCreature.capitalA + usingCreature.short + " drinks down the draft, looking a little hornier");
			if (healing > 0) kGAMECLASS.output(" and more than a little healthier!");
			else kGAMECLASS.output("!");
			targetCreature.changeHP(healing);
			targetCreature.changeLust(20);
			if (inCombat()) targetCreature.createStatusEffect("Healed", 0, 0, 0, 0, true, "", "", true, 0);
		}
	}
}
