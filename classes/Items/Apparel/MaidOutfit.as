package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;

	public class MaidOutfit extends ItemSlotClass
	{
		//Level 3 (Common). Balance 2.0
		public function MaidOutfit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "MaidO.";
			
			this.longName = "maid outfit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a frilly french maid outfit";
			
			this.tooltip = "A sexy French maid outfit, the staple diet of cosplay fetishists everywhere. Every inch of this outfit is lined with frills, from the headpiece to the puffed out skirt. Made from the finest siel silk.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 440;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 6;
			this.fortification = 0;

			resistances.electric.resistanceValue = 35.0;
			
			this.version = this._latestVersion;
		}
	}
}
