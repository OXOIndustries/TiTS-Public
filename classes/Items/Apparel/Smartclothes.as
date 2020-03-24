package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Smartclothes extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
		//constructor
		public function Smartclothes()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "S.Clothes";
			
			//Regular name
			this.longName = "smart jacket and pants";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a smart jacket and pants";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "These clothes are stuffed full of more features than insulation, allowing them to do everything from drying themselves to dynamically adjusting their thermal profile to match current temperatures. They don’t provide much in the way of physical defense, but they’re a great insulator for thermal and electrical energies. The internal power supply can provide a slight boost to a defensive shield.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 880;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 12;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.electric.resistanceValue = 30.0;
			resistances.burning.resistanceValue = 24.0;
			
			this.version = _latestVersion;
		}	
	}
}
