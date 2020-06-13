package classes.Items.Armor 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class HideVestAndBreeches extends ItemSlotClass
	{
		//Level 8 (Common). Balance 2.0
		public function HideVestAndBreeches() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "Hide V&B";
			
			this.longName = "hide vest & breeches";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a hide set of vest & breeches";
			
			this.tooltip = "A simple but warm and comfortable outfit made of tanned hides, leather, and furs. It won’t do much to protect you from modern weapons, but at least you’ll look good.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 14080;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.sexiness = 2;
			this.resolve = 3;
			this.critBonus = 0;
			this.evasion = 10;
			this.fortification = 0;
			resistances.burning.resistanceValue = 20.0;
			
			this.version = this._latestVersion;
		}
	}
}
