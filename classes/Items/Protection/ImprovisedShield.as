package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ImprovisedShield extends ItemSlotClass
	{
		
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
			this.tooltip = "Cobbled together from a half-dozen other pieces of machinery, this improvised shield generator nonetheless manages to provide a fair amount of protection at the expense of being more vulnerable to certain types of damage.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 150;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 30;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);
			this.bonusResistances[GLOBAL.KINETIC] = .4;
			this.bonusResistances[GLOBAL.SLASHING] = .30;
			this.bonusResistances[GLOBAL.PIERCING] = .20;
			this.bonusResistances[GLOBAL.ELECTRIC] = -.1;
			
			this.version = _latestVersion;
		}
	}
}