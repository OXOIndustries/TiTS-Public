package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;

	public class GabilaniPanties extends ItemSlotClass
	{
		public function GabilaniPanties()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "G.Panties";
			longName = "gabilani panties";
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			//Longass shit, not sure what used for yet.
			description = "a pair of panties made for gabilani women";
			
			//Displayed on tooltips during mouseovers
			tooltip = "These panties are made out of a flexible material, made to stretch over gabilani womens’ voluminous hips and butts. The fabric gets more sheer the more it has to stretch, so on those with the most thunderous thighs or the junkiest trunks, it’ll be practically see-through.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			//Information
			basePrice = 800;
			sexiness = 2;
			
			itemFlags = [GLOBAL.ITEM_FLAG_STRETCHY];
			
			version = _latestVersion;
		}
	}
}