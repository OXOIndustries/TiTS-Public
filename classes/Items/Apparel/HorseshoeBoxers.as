package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class HorseshoeBoxers extends ItemSlotClass
	{
		//constructor
		public function HorseshoeBoxers()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "HorseBxs";
			
			//Regular name
			this.longName = "horseshoe boxers";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of white boxers with horseshoes printed on it";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A pair of white boxers with horseshoes printed around it. The fabric is quite soft and comfortable. In the front of the boxers there is a pouch that emphasizes the wearer’s bulge.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 450;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 1;
			this.resolve = 2;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			
			this.version = _latestVersion;
		}
	}
}