package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;

	public class TopNSkirt extends ItemSlotClass
	{
		//Not PC attainable?
		public function TopNSkirt() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "TopNSkirt.";
			
			this.longName = "tank top & mini skirt";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a tight tank top and mini skirt";
			
			this.tooltip = "The signature outfit of a heroine from “Final Fucktacy 7”. It consists of an incredibly tight white top, black miniskirt, and asset pressing suspenders. Wearing this fills you with fighting spirit.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
	}
}
