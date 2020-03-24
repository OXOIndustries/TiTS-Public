package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class LeatherArmor extends ItemSlotClass
	{
		//constructor
		public function LeatherArmor()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "LeatherArmor";
			
			//Regular name
			this.longName = "leather armor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a set of leather armor";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This leather armor has been cobbled together from numerous pieces of hide, many of which look to have been harvested from different species. It is likely that many parts of it originated in different systems.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 220;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 1;
			this.resolve = 4;
			this.critBonus = 0;
			this.evasion = 1;
			this.fortification = 0;

			resistances.electric.resistanceValue = 12.0;
			
			this.version = _latestVersion;
		}
	}
}