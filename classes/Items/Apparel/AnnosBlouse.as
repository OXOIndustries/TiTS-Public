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
	public class AnnosBlouse extends ItemSlotClass
	{
		
		public function AnnosBlouse() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "Annos Blouse";
			
			this.longName = "blouse and jeans";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a blouse and jean pair worn exclusively by Anno";
			
			this.tooltip = "Something something this is a tooltip something.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 200;
			this.attack = 0;
			this.defense = 1;
			this.sexiness = 2;
			this.resolve = 3;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 1;
			
			this.version = this._latestVersion;
		}
		
	}

}
