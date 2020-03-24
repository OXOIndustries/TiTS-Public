package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class NaleenArmor extends ItemSlotClass
	{
		//Level 3 (Common). Balance 2.0
		//constructor
		public function NaleenArmor()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "NaleenScale";
			
			//Regular name
			this.longName = "naleenscale armor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a suit of naleenscale armor";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This crude but effective looking armor is made in the style of ancient armors from days long past. Instead of using pounded metal to fashion the protective plates, the maker of this armor gathered discarded scales from Mhen’ga’s native Naleen species.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 440;
			this.attack = 0;
			this.defense = 4;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.corrosive.resistanceValue = 22.0;

			this.version = _latestVersion;
		}
	}
}