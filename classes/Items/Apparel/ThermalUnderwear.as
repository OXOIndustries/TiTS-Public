package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ThermalUnderwear extends ItemSlotClass
	{
		//constructor
		public function ThermalUnderwear()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "ThmUndies";
			
			//Regular name
			this.longName = "thermal underwear";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a set of thermal undergarments";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "While they’re certainly nothing to look at, these specially-designed underpants are made to regulate temperature, keeping your nethers safe from extremes of cold and heat.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = -1;
			this.resolve = -1;
			this.critBonus = -5;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.burning.resistanceValue = 10.0;
			resistances.freezing.resistanceValue = 10.0;
			
			this.version = _latestVersion;
		}
	}
}