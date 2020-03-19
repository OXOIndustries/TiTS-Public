package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class RustedShield extends ItemSlotClass
	{
		//Level 2 (Common). Balance 2.0
		//constructor
		public function RustedShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventodecentttons
			this.shortName = "R.Shield";
		
			//Regular name
			this.longName = "rusted shield generator";
		
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an rusted shield generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This shield generator is covered in rust, but still seems to have some functionality.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1200;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 50;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.kinetic.resistanceValue = 20.0;
			resistances.electric.resistanceValue = -30.0;

			this.version = _latestVersion;
		}
	}
}