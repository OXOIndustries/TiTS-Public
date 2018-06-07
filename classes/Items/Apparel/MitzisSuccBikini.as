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
	public class MitzisSuccBikini extends ItemSlotClass
	{
		
		public function MitzisSuccBikini() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "SlutBkni";
			
			this.longName = "slutty crotchless bikini";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a black, crotchless bikini";
			
			this.tooltip = "This black, crotchless bikini with is held up by leather straps. Purple gemstones line the bands, glittering darkly.";
			
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

			itemFlags = [GLOBAL.ITEM_FLAG_EXPOSE_GROIN];
			//GLOBAL.ITEM_FLAG_EXPOSE_ASS, GLOBAL.ITEM_FLAG_TRANSPARENT];
			
			this.version = this._latestVersion;
		}
		
	}

}
