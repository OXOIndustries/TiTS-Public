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
	public class CString extends ItemSlotClass
	{
		
		public function CString() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			this.shortName = "C.String";
			
			this.longName = "C-String";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a skimpy C-string";
			
			this.tooltip = "This C-string underwear covers almost nothing at all! It is as narrow as a G-string, but without the supporting “string” around the wearer’s hips line. All that is left is a sideways C-shaped piece between the legs. This “underwear” is often worn with pasties or nipple tassels.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			
			this.version = this._latestVersion;
		}
	}
}
