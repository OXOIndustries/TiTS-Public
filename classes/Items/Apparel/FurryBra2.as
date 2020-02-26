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
	public class FurryBra2 extends ItemSlotClass
	{
		
		public function FurryBra2() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			this.shortName = "F.Bra";
			
			this.longName = "furry bra";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a furry bra";
			
			this.tooltip = "A bra made from fur and leather, it surprisingly looks quite like a sports bra. It’s made to protect your upper body from the harsh, cold air. Unfortunately, thick leather and dense fur doesn’t make for the most attractive garment.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 24500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 1;
			this.resolve = 2;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.freezing.resistanceValue = 10.0;
			resistances.burning.resistanceValue = -5.0;
			
			this.version = this._latestVersion;
		}
	}
}