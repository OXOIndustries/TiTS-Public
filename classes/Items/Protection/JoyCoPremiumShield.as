package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class JoyCoPremiumShield extends ItemSlotClass
	{
		
		//constructor
		public function JoyCoPremiumShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventodecentttons
			this.shortName = "P.Shield";
		
			//Regular name
			this.longName = "premium JoyCo shield generator";
		
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a premium JoyCo shield generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A higher-end shield generator manufactured by JoyCo. Featuring upgraded components and a number of software tweaks should give this generator an edge over more common models.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 2000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 40;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.kinetic.resistanceValue = 30.0;
			
			this.version = _latestVersion;
		}
	}
}