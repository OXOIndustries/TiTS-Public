package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class CowPrintedShorts extends ItemSlotClass
	{
		//constructor
		public function CowPrintedShorts() {
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "CowShorts";
			
			//Regular name
			this.longName = "cow-print shorts";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of cow-print shorts";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "These cow print shorts are made from a firm fabric that tightly grips the rump. A large bulge pouch emphasizes the wearer’s package for any would-be admirers.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 2;
			this.resolve = 1;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			
			this.version = _latestVersion;
		}
	}
}