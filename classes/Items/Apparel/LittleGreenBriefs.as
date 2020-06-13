package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class LittleGreenBriefs extends ItemSlotClass
	{
		public function LittleGreenBriefs()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "LilG.Brief";
			
			longName = "Little Green briefs";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a comfortable set of briefs with the logo of The Little Green Man on the front";
			
			tooltip = "This is a comfy pair of green briefs with white lining that has a white outline of a little green alien face on the front. The briefs are simple, comfortable and very revealing. They are also made out of ultralastic - which is great because that makes them a one-size-fits-all; in case something happens to, you know, change.";
			
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
