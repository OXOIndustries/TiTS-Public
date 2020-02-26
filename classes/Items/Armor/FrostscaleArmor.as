package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class FrostscaleArmor extends ItemSlotClass
	{
		//Level ??? (???). Balance 2.0
		//constructor
		public function FrostscaleArmor()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "FS.Hauberk";
			
			//Regular name
			this.longName = "frostscale hauberk ";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a frostscale hauberk";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A hauberk of icy blue scale armor made by your kips. It offers good protection for your body, but might leave your limbs a bit exposed.";

			//A variant of the frostbane chainmail with reduced defense and freezing resistance.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 42000;
			this.attack = 0;
			this.defense = 12;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = -1;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 25;
			
			//resistances.burning.resistanceValue = -13.0;
			resistances.freezing.resistanceValue = 40.0;
			resistances.addFlag(DamageFlag.PLATED);
			resistances.addFlag(DamageFlag.NULLIFYING);
			
			this.version = _latestVersion;
		}
	}
}