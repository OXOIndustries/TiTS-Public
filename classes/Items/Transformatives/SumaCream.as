package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class SumaCream extends ItemSlotClass
	{
		private var pillColor:String = "none";
		
		public function SumaCream()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 12;
			type = GLOBAL.PILL;
			
			shortName = "Suma";
			longName = "Suma Cream capsule";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a Suma Cream capsule";
			
			tooltip = "[sumaCreamTooltip " + pillColor + "]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 800;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.output("You use the pill to no effect.");
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the pill to no effect.");
			}
			return false;
		}
	}
}

