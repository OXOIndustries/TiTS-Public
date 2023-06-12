package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ThermalJacket extends ItemSlotClass
	{
		//constructor
		//Level 2 (Common). Balance 2.0
		public function ThermalJacket()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "ThmJacket";
			
			//Regular name
			this.longName = "thermal jacket";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a thermal jacket";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A thick, fur-lined jacket reinforced with the most advanced lightweight elemental protections. It won’t protect you from the worst of extreme colds, but it’ll make you more comfortable in cold weather for sure.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 220;
			this.attack = 0;
			this.defense = 1;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 16;
			
			resistances.burning.resistanceValue = 20.0;
			resistances.freezing.resistanceValue = 40.0;
			resistances.kinetic.resistanceValue = -15.0;
			
			this.version = _latestVersion;
		}
	}
}