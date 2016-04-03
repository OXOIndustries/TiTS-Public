package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class LeatherStrapHarness extends ItemSlotClass
	{

		//constructor
		public function LeatherStrapHarness()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			//Used on inventory buttons
			this.shortName = "L.Harness";
			
			//Regular name
			this.longName = "leather harness";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a leather strap harness";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A bdsm outfit made entirely from straps and metal rings, starting at a collar and ending at the groin. The straps are connected to make diamond shaped patterns with gaps in the middle. In this outfit the chest or breasts are totally exposed.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_EXPOSE_CHEST];
			
			this.version = _latestVersion;
		}
	}
}
