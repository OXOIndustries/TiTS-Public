package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class LeatherPanties extends ItemSlotClass
	{
		public function LeatherPanties()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "LthrPnty";
			
			longName = "leather panties";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a leather panty";
			
			tooltip = "A pair of panties made from fine leather, decorated with tribal line-art. They don’t cover much skin so they won’t protect you from the cold, but at least you’ll look sexy when you’re freezing your ass off.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 20000;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			sexiness = 2;
			this.resolve = 1;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			//itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			
			version = _latestVersion;
		}
	}
}
