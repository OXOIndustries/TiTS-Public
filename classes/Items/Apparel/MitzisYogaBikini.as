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
	public class MitzisYogaBikini extends ItemSlotClass
	{
		
		public function MitzisYogaBikini() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "YogaBik";
			
			this.longName = "yoga pants and bikini top";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "some sheer yoga pants with a slinky white bikini top";
			
			this.tooltip = "This outfit is designed for women who prize flexibility, fitness, and raw sensuality above practical coreward values.";
			
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
			
			this.version = this._latestVersion;
		}
		
	}

}
