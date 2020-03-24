package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class FishnetBriefs extends ItemSlotClass
	{
		//constructor
		public function FishnetBriefs()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "NetBriefs";
			
			//Regular name
			this.longName = "fishnet briefs";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of mesh-fishnet briefs";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A pair of tight fishnet briefs; commonly used by exhibitionists, composed only of thin black weave. The elastic mesh also comes with a tightening feature, which allows it to shrink or grow to any crotch size. Absolutely nothing is hidden when wearing these briefs.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1100;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_EXPOSE_GROIN, GLOBAL.ITEM_FLAG_EXPOSE_ASS];
			
			this.version = _latestVersion;
		}
	}
}