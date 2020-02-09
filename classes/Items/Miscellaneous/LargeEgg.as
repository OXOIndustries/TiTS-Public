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
	
	public class LargeEgg extends ItemSlotClass
	{
		public function LargeEgg()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 12;
			type = GLOBAL.FOOD;
			
			shortName = "LargeEgg";
			longName = "large, brightly-colored egg";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a large, brightly-colored egg";
			
			tooltip = "As a result of genetic engineering and biological experimentation, these eggs can be produced by almost any species. Deliciously filling and quite nourishing, they’re almost like a full meal in addition to being a refreshing snack.\n\n(Large HP recovery.)";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 35;
			
			combatUsable = true;
			targetsSelf = true;
			
			version = _latestVersion;
		}
		
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

			var healing:int = 30;
			if(target.HP() + healing > target.HPMax())
			{
				healing = target.HPMax() - target.HP();
			}
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				if(!inCombat())
				{
					kGAMECLASS.showBust("");
					if (kGAMECLASS.silly) kGAMECLASS.showName("\nYUM!");
					else kGAMECLASS.showName("SNACK\nBREAK");
				}
				kGAMECLASS.output("You chomp down on the delicious, almost sugary egg.");
				if(healing > 0) 
				{
					kGAMECLASS.output(" You feel better almost immediately!");
					target.changeHP(healing);
				}
				else kGAMECLASS.output(" Nothing changes except for the taste in your mouth.");
			}
			//Not player!
			else
			{
				if(inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				kGAMECLASS.output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " eats a brightly-colored egg");
				if(healing > 0) 
				{
					kGAMECLASS.output(" and instantly regains some health!");
					target.changeHP(healing);
				}
				else kGAMECLASS.output(" to no effect.");
			}
			if (inCombat()) target.createStatusEffect("Healed", 0, 0, 0, 0, true, "", "", true, 0);
			return false;
		}
	}
}

