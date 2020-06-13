package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class LittleGreenThong extends ItemSlotClass
	{
		public function LittleGreenThong()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "LilG.Thong";
			
			longName = "Little Green thong";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a neon-green thong";
			
			tooltip = "This is a neon green thong. With an item of this color you would think it glows in the dark... and you’d be right.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 500;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			sexiness = 3;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			
			version = _latestVersion;
		}
	}
}
