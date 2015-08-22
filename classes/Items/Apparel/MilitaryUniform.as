package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class MilitaryUniform extends ItemSlotClass
	{
		
		public function MilitaryUniform() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "M. Doctor";
			
			this.longName = "doctor's coat & pants";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a white doctor's coat & pants";
			
			this.tooltip = "This military outfit is reminiscent of those worn on Earth in the 20th century. It consists of a tank top, bullet chain sling, and baggy camo pants. The top is quite tight and deliberately accentuates any natural assets. A defensive layer of nanofibers has been woven into the entire outfit.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.sexiness = 2;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
	}
}