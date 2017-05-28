package classes.Items.Miscellaneous
{
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Items.Miscellaneous.MilkBag;
	
	public class MilkBagL extends MilkBag
	{
		public function MilkBagL()
		{
			_latestVersion = 1;
			hasRandomProperties = true;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.POTION;
			
			fullnessLevel = 3;
			
			shortName = "L.MilkBag";
			longName = "large milk bag";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a large bag of milk";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 6;
			
			version = _latestVersion;
		}
	}
}
