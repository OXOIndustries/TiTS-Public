package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class LatexBodysuit extends ItemSlotClass
	{
		//Level 3 (Common). Balance 2.0
		public function LatexBodysuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "LtxBdy";
			
			this.longName = "latex bodysuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a shiny, full-body latex bodysuit";
			
			this.tooltip = "This snug fitting full-body latex bodysuit leaves nothing up to the imagination. It is also very shiny. There is a zipper starting at the neck and ending just above the crotch.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 440;
			this.attack = 0;
			this.defense = 1;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 5;
			this.fortification = 0;
			
			resistances.electric.resistanceValue = 25.0;

			this.version = this._latestVersion;
		}
	}
}
