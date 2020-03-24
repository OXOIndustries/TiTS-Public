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
	public class SkullPatternBra extends ItemSlotClass
	{
		
		public function SkullPatternBra() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			this.shortName = "Sk.Bra";
			
			this.longName = "skull-patterned bra";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a skull-patterned bra";
			
			this.tooltip = "These are the perfect bra for when you want to make a statement, but at the same time, you’re not wearing a top. Made of black fabric and littered with white skulls.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			
			this.version = this._latestVersion;
		}
	}
}