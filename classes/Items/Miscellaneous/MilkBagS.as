package classes.Items.Miscellaneous
{
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Items.Miscellaneous.MilkBag;
	
	public class MilkBagS extends MilkBag
	{
		public function MilkBagS()
		{
			_latestVersion = 1;
			hasRandomProperties = true;
			
			quantity = 1;
			stackSize = 30;
			type = GLOBAL.POTION;
			
			fullnessLevel = 1;
			
			shortName = "S.MilkBag";
			longName = "small milk bag";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a small bag of milk";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 2;
			
			version = _latestVersion;
		}
	}
}
