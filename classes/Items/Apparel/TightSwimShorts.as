package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class TightSwimShorts extends ItemSlotClass
	{
		public function TightSwimShorts()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "TightShorts";
			
			longName = "tight swim shorts";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pair of tight swim shorts";
			
			tooltip = "For the beach-goer with something to show off. Crafted from chameleonsilk so you can look your best, no matter what the fashion season.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 900;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			sexiness = 2;
			this.resolve = 1;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			
			version = _latestVersion;
		}
	}
}
