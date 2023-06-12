package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * @author Gedan
	 */
	public class KhansLabCoat extends ItemSlotClass
	{
		//Level 8 (Rare). Balance 2.0
		public function KhansLabCoat() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "LabCoat";
			
			this.longName = "simple lab coat";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a lab coat once owned by a one doctor Khan";
			
			this.tooltip = "A simple labcoat and little else. Pocket protector not included. Though the material seems to have a hydrophobic quality to it.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 21000;
			this.attack = 0;
			this.defense = 1;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 5;
			this.fortification = 0;
			
			resistances.corrosive.resistanceValue = 20;
			resistances.drug.resistanceValue = 20;
			resistances.poison.resistanceValue = 20;
			
			this.version = this._latestVersion;
		}
	}
}
