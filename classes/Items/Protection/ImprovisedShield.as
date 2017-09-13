package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ImprovisedShield extends ItemSlotClass
	{
		//Level 2 (Common). Balance 2.0
		//constructor
		public function ImprovisedShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventodecentttons
			this.shortName = "I.Shield";
		
			//Regular name
			this.longName = "improvised shield generator";
		
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an improvised shield generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Cobbled together from a half-dozen other pieces of machinery, this improvised shield generator nonetheless manages to provide a fair amount of protection at the expense of being more vulnerable to heat damage.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 400;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 3;
			this.shields = 40;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.kinetic.resistanceValue = 30.0;
			resistances.electric.resistanceValue = -50.0;
			resistances.burning.resistanceValue = -25.0;
			
			this.version = _latestVersion;
		}
	}
}