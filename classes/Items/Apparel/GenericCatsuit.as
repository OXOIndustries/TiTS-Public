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
			
			this.tooltip = "These catsuits are common on the frontier where dealing with multiple articles of clothing can be bothersome. Their sleek design also makes them excellent garments for revealing one's body, allowing a degree of sensuality depending on how tightly they are configured to be. This one comes complete with an optional skirt.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 300;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 2;
			this.critBonus = 0;
			this.evasion = 4;
			this.fortification = 1;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = this._latestVersion;
		}
		
	}

}