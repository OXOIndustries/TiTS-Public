package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;

	public class NurseOutfit extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		public function NurseOutfit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "NurseO.";
			
			this.longName = "nurse outfit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a tight-fitting nurse’s outfit";
			
			this.tooltip = "A sexy white and red nurse outfit. It hugs the body and barely covers the crotch, designed to emphasise any natural assets a wearer may have. It comes complete with a nurse’s cap, stethoscope, and frilly stockings. Made from siel silk.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 3400;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 7;
			this.fortification = 0;

			resistances.drug.resistanceValue = 30.0;
			
			this.version = this._latestVersion;
		}
	}
}
