package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ShibariTop extends ItemSlotClass
	{

		//constructor
		public function ShibariTop()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "Shibari Top";
			
			//Regular name
			this.longName = "shibari top";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a shibari top";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A complicated set of rope-like straps and bands. When worn, the bra clings tight to the wearer’s body like a set of bondage ropes, while still being comfortable and not inhibiting movement.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 950;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			
			this.version = _latestVersion;
		}
	}
}
