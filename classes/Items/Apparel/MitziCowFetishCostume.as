package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * Swapped in and out of Annos statblock to determine her state/type of dress.
	 * @author Fenoxo Fenbutte
	 */
	public class MitziCowFetishCostume extends ItemSlotClass
	{
		
		public function MitziCowFetishCostume() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "CowCost.";
			
			this.longName = "cow-girl fetish costume";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a cow-girl fetish costume";
			
			this.tooltip = "Brownish pads designed to resemble hooves guard knees knees while pitch-black socks hide everything behind. Shoulder length white gloves with padded elbows and patchwork black splotches compliment a set of matching panties and a nursing bra.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 200;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			itemFlags = [GLOBAL.ITEM_FLAG_EXPOSE_CHEST];
			//GLOBAL.ITEM_FLAG_EXPOSE_ASS, GLOBAL.ITEM_FLAG_TRANSPARENT];
			
			this.version = this._latestVersion;
		}
		
	}

}
