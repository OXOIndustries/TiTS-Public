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
	public class FurryLoincloth extends ItemSlotClass
	{
		
		public function FurryLoincloth() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			this.shortName = "F.Loin";
			
			this.longName = "furry loincloth";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a furry loincloth";
			
			this.tooltip = "A loincloth made from fur and leather, designed to keep your genitals warm. It’s not too effective, however, since there is almost nothing blocking the cold air from getting underneath it.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 24500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 2;
			this.resolve = 1;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.freezing.resistanceValue = 10.0;
			resistances.burning.resistanceValue = -5.0;
			
			this.version = this._latestVersion;
		}
	}
}