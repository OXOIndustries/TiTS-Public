package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class JumperShield extends ItemSlotClass
	{
		//Level 9 (Common). Balance 2.0, 10 budget points left over. Didn't wanna make TOO good.
		//constructor
		public function JumperShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventodecentttons
			this.shortName = "JumpShield";
		
			//Regular name
			this.longName = "‘Jumper’ shield";
		
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a ‘Jumper’ shield";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Designed and used by the ‘Jumper’ pirate gang, this lightweight belt is manufactured to produce a decent amount of protection and additional mobility via an array of microjets around its length.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 25000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 100;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 4;
			this.fortification = 0;
			
			resistances.kinetic.resistanceValue = 35.0;
			//resistances.burning.resistanceValue = 15.0;
			resistances.electric.resistanceValue = -50.0;
			
			this.version = _latestVersion;
		}
	}
}