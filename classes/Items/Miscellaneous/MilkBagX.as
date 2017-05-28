package classes.Items.Miscellaneous
{
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Items.Miscellaneous.MilkBag;
	
	public class MilkBagX extends MilkBag
	{
		public function MilkBagX()
		{
			_latestVersion = 1;
			hasRandomProperties = true;
			
			quantity = 1;
			stackSize = 6;
			type = GLOBAL.POTION;
			
			fullnessLevel = 4;
			
			shortName = "X.MilkBag";
			longName = "full milk bag";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a full bag of milk";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 10;
			
			version = _latestVersion;
		}
	}
}
