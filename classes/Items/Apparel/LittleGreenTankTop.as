package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class LittleGreenTankTop extends ItemSlotClass
	{
		public function LittleGreenTankTop()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.UPPER_UNDERGARMENT;
			
			shortName = "LilG.Tank";
			
			longName = "Little Green tank top";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a black tank top with the logo of The Little Green Man on the front";
			
			tooltip = "This is a simple promotional tank top with a picture of a little green alien face on the front. The shirt is simple, breathable and comfortable with, of course, no sleeves.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 400;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			sexiness = 1;
			this.resolve = 2;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			version = _latestVersion;
		}
	}
}
