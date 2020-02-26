package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class LittleGreenPanties extends ItemSlotClass
	{
		public function LittleGreenPanties()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "LilG.Panty";
			
			longName = "Little Green panties";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a cute set of panties with the logo of The Little Green Man on the front";
			
			tooltip = "This is an adorable pair of black panties with a cute little green alien face on the front. For something so cute they are surprisingly comfortable and very revealing with the way they tightly mold to your frame. They are also made out of ultralastic - which is great because that makes them a one-size-fits-all; in case something happens to, you know, change.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 300;
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
