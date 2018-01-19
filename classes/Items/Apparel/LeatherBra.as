package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class LeatherBra extends ItemSlotClass
	{
		public function LeatherBra()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.UPPER_UNDERGARMENT;
			
			shortName = "LthrBra";
			
			longName = "leather bra";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a leather bra";
			
			tooltip = "A skimpy bra made from leather. It’s decorated with primal looking curves and swirls along the leather. While it looks and feels nice, it won’t protect you from the cold better than any other underwears.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 20000;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			sexiness = 3;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			//itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			
			version = _latestVersion;
		}
	}
}
