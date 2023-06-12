package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class ThermalBodysuit extends ItemSlotClass
	{
		//Level 8 (Common). Balance 2.0
		public function ThermalBodysuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "T.Bodysuit";
			
			this.longName = "thermal bodysuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a thermal bodysuit";
			
			this.tooltip = "This bodysuit is tight and form-fitting, like a second skin. It contains an insulating layer of aerogel, which will protect you both from the crippling cold and extreme heat. It’s no substitute for armor, however, with only a few reinforcements along vital areas to keep you safe. Heat and cold it can deal with, not gunfire and knives.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 13000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 4;
			this.resolve = 1;
			this.critBonus = 0;
			this.evasion = 7;
			this.fortification = 0;
			resistances.freezing.resistanceValue = 20.0;
			resistances.burning.resistanceValue = 20.0;
			
			this.version = this._latestVersion;
		}
	}
}
