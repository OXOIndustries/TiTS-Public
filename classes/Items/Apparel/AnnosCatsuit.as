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
	public class AnnosCatsuit extends ItemSlotClass
	{
		
		public function AnnosCatsuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "ST. Catsuit";
			
			this.longName = "Steele Tech catsuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a form-fitting smartcloth catsuit emblazoned with the Steele Industries logo";
			
			this.tooltip = "Something something this is a tooltip something.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 200;
			this.attack = 0;
			this.defense = 1;
			this.shieldDefense = 0;
			this.sexiness = 3;
			this.resolve = 2;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 1;
			
			this.version = this._latestVersion;
		}
		
	}

}
