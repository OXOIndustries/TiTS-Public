package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class LittleGreenBra extends ItemSlotClass
	{
		public function LittleGreenBra()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.UPPER_UNDERGARMENT;
			
			shortName = "LilG.Bra";
			
			longName = "Little Green bra";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a stylish black bra decorated with the logo of The Little Green Man";
			
			tooltip = "This is a simple bra with a picture of a little green alien face on each cup, right where the nipples would be. The bra is simple, elegant and comfortable. It is also made out of ultralastic - which is great because that makes it a one-size-fits-all; in case something happens to, you know, change.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 400;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			sexiness = 2;
			this.resolve = 1;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			version = _latestVersion;
		}
	}
}
