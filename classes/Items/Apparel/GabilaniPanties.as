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
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			this.shortName = "G.Panties";
			this.longName = "gabilani panties";
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of panties made for gabilani women";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "These panties are made out of a flexible material, made to stretch over gabilani womens' voluminous hips and butts. The fabric gets more sheer the more it has to stretch, so on those with the most thunderous thighs or the junkiest trunks, it'll be practically see-through.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 800;
			this.sexiness = 2;
			
			itemFlags = [GLOBAL.ITEM_FLAG_STRETCHY];
			
			this.version = _latestVersion;
		}
	}
}