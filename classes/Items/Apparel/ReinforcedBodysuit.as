package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * Swapped in and out of Annos statblock to determine her state/type of dress.
	 * @author Gedan
	 */
	public class ReinforcedBodysuit extends ItemSlotClass
	{
		
		public function ReinforcedBodysuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "R.Bdysuit";
			
			this.longName = "reinforced bodysuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a shiny, silver and black bodysuit";
			
			this.tooltip = "This snug fitting bodysuit is far more protective than it looks. On first glance it looks like silver and black latex skin tight suit, complete with a small leather jacket. In actual fact it is made from a highly dense siel silk and fracton weave.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 4000;
			this.attack = 0;
			this.defense = 5;
			this.shieldDefense = 0;
			this.sexiness = 2;
			this.critBonus = 0;
			this.evasion = 3;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
	}

}