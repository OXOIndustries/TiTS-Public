package classes.Items.Miscellaneous
{
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Items.Miscellaneous.MilkBag;
	
	public class MilkBagM extends MilkBag
	{
		public function MilkBagM()
		{
			_latestVersion = 1;
			hasRandomProperties = true;
			
			quantity = 1;
			stackSize = 15;
			type = GLOBAL.POTION;
			
			fullnessLevel = 2;
			
			shortName = "M.MilkBag";
			longName = "medium milk bag";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a medium bag of milk";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 4;
			
			version = _latestVersion;
		}
	}
}
