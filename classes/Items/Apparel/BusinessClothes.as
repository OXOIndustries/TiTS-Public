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
	public class BusinessClothes extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		public function BusinessClothes() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "B.Clothes";
			
			this.longName = "business clothes";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a set of high-powered business clothes";
			
			this.tooltip = "These business clothes are perfect for any high-powered corporate function. They’re also perfect for someone aiming to make their way up the food chain.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 800;
			this.attack = 3;
			this.defense = 3;
			this.shieldDefense = 0;
			this.sexiness = 2;
			this.resolve = 3;
			this.critBonus = 3;
			this.evasion = 8;
			this.fortification = 14;
			
			this.version = this._latestVersion;
		}
	}
}
