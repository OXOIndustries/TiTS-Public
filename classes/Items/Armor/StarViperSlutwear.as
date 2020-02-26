package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class StarViperSlutwear extends ItemSlotClass
	{
		//Level 10 (Rare). Balance 2.0
		//constructor
		public function StarViperSlutwear()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "SVS-Wear";
			
			//Regular name
			this.longName = "Star Viper slutwear";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a set of Star Viper slutwear";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "While it may look like the lovechild of a slutty bikini and tactical combat armor, this set of Star Viper slutwear is surprisingly practical (for anyone wanting to maximize protection while showing off skin). Slyveren Slavebreakers are known to prefer its curve-hugging design while benefiting from the ballistic-treated leather and fashionably bright pink hue. It comes with plenty of straps for mounting equipment as well. A belt-holstered pistol would match it as nicely as a strapped-on dildo.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 75000;
			this.attack = 0;
			this.defense = 5;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 5;
			this.critBonus = -5;
			this.evasion = 17;
			this.fortification = 20;
			
			resistances.drug.resistanceValue = 25.0;
			//resistances.electric.resistanceValue = 15.0;
			//resistances.burning.resistanceValue = 10.0;
			
			this.version = _latestVersion;
		}
	}
}