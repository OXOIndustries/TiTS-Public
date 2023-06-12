package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class BullsJockstrap extends ItemSlotClass
	{
		//constructor
		public function BullsJockstrap()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "BullStrap";
			
			//Regular name
			this.longName = "bull’s jockstrap";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a large leather jockstrap";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This brown leather jockstrap was specially designed to accommodate the above-average packages of the New Texan bull. A large front cup made from comfy leather wicks moisture away while reinforced bands with a quick release mechanism makes this jockstrap both comfortable and convenient.";
			
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
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
			
			this.version = _latestVersion;
		}
	}
}