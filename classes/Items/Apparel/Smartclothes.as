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
		//constructor
		public function Smartclothes()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "Smartclothes";
			
			//Regular name
			this.longName = "smart jacket and pants";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a smart jacket and pants";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "These clothes are stuffed full of more features than insulation, allowing them to do everything from drying themselves to dynamically adjusting their thermal profile to match current temperatures. They don't provide much in the way of physical defense, but they're a great insulator for thermal and electrical energies. The internal power supply can even produce a weak, defensive shield.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 3350;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 12;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, .3, .3);
			
			this.version = _latestVersion;
		}	
	}
}
