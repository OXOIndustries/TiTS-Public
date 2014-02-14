package classes.Items.Miscellaneous 
{
	import classes.ItemSlotClass;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class NoItem extends ItemSlotClass
	{
		
		public function NoItem() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "No Item";
			
			this.longName = "nothing";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a specialised placeholder item";
			
			this.tooltip = "This item should never be given to any character or player. It's used to set all of the baseline stats for tooltip comparison purposes, when comparing a slot against null.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 0;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = this._latestVersion;
		}
		
	}

}