package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.GameData.CodexManager;
	import classes.Engine.Map.InShipInterior;
	
	public class SleepFapnea extends ItemSlotClass
	{
		public function SleepFapnea()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.GADGET;
			
			shortName = "SleepFap.";
			longName = "Sleep Fapnea machine";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a small, rectangular device labeled “Sleep Fapnea Machine”";
			tooltip = "This device promises to ensure vivid and highly sexual dreams for 95% of users. Originally developed by JoyCo for the treatment of chronic nightmares, the focus and name of the product was changed when early testing found that it nearly always caused wet dreams. “Dream modules” (sold separately) allow users to experience specific dreams handcrafted by acclaimed erotica writers.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 5000;

			addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.sleepFapneaInstallation();
			}
			//Not player!
			else
			{
				clearOutput();
				output(target.capitalA + target.short + " cannot use the Sleep Fapnea device.");
			}
			return false;
		}
	}
}

