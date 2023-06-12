package classes.Items.Protection
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class BasicShield extends ItemSlotClass
	{
		//Level 1 (Common). Balance 2.0
		//constructor
		public function BasicShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventory buttons
			this.shortName = "BasicShld";
			
			//Regular name
			this.longName = "cheap JoyCo shield generator";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a cheap JoyCo shield generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A cheap, off-the-shelf shield generator that can be purchased at almost any JoyCo megastore.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 100;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 14;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.kinetic.resistanceValue = 40.0;
			resistances.burning.resistanceValue = 10.0;
			resistances.electric.resistanceValue = -50.0;
			
			this.version = _latestVersion;
		}
	}
}