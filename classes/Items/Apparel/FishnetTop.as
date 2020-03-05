package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class FishnetTop extends ItemSlotClass
	{

		//constructor
		public function FishnetTop()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "NetTop";
			
			//Regular name
			this.longName = "fishnet top";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a mesh-fishnet top";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A tight fishnet top; commonly used by exhibitionists, composed only of thin black weave. The elastic thin black mesh also comes with a tightening feature, which allows it to shrink to any body type and breast size. Absolutely nothing is hidden when wearing this top.";
			
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
			
			itemFlags = [GLOBAL.ITEM_FLAG_EXPOSE_CHEST];
			
			this.version = _latestVersion;
		}
	}
}