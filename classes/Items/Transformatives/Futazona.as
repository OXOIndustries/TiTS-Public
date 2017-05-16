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
	import classes.Items.Transformatives.Amazona;
	
	public class Futazona extends ItemSlotClass
	{
		private var canType:String = "futazona";
		
		public function Futazona()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 12;
			type = GLOBAL.PILL;
			
			shortName = "Futazona";
			longName = "Futazona";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a can of Futazona";
			
			tooltip = "[altTooltip Futazona]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 6000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				Amazona.amazonaEffects(target, canType);
				return true;
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " drinks the thermos to no effect.");
			}
			return false;
		}
	}
}

