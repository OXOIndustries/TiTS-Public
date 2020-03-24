package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class LittleGreenShirt extends ItemSlotClass
	{
		public function LittleGreenShirt()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.UPPER_UNDERGARMENT;
			
			shortName = "LilG.Tee";
			
			longName = "Little Green t-shirt";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a black T-shirt with the logo of The Little Green Man on the front";
			
			tooltip = "This is a simple promotional tee with a picture of a little green alien face on the front. The shirt is simple, breathable and comfortable. For some reason you feel like it’s the type to be fired out of a T-shirt cannon.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 300;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			sexiness = 0;
			this.resolve = 3;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			version = _latestVersion;
		}
	}
}
