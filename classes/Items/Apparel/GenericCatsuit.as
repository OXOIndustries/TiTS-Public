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
	public class GenericCatsuit extends ItemSlotClass
	{
		//Level 2 (Common). Balance 2.0
		public function GenericCatsuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "Catsuit";
			
			this.longName = "catsuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a form-fitting smartcloth catsuit with an optional skirt";
			
			this.tooltip = "These catsuits are common on the frontier where dealing with multiple articles of clothing can be bothersome. Their sleek design also makes them excellent garments for revealing one’s body, allowing a degree of sensuality depending on how tightly they are configured to be. This one comes complete with an optional skirt.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 220;
			this.attack = 5;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 4;
			this.fortification = 4;
			
			this.version = this._latestVersion;
		}
		
	}

}