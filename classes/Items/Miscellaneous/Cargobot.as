package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Cargobot extends ItemSlotClass
	{
		//constructor
		public function Cargobot()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "Cargobot";
			
			//Regular name
			this.longName = "hovering cargobot";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a hovering cargobot";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This hovering cargobot is as custom made as they come. It's frame appears to have been \"donated\" from a busted service-droid, the legs replaced miniaturized plasma motor that allows it to hover. Its shoulders have two bins welded to them, and the arms are long gone. It appears that its only purpose is to carry items for you. (+2 inventory slots while equipped in your accessory slot).";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1250;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}	
	}
}
