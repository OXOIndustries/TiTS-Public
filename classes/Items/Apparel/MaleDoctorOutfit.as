package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class MaleDoctorOutfit extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		public function MaleDoctorOutfit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "M.Doctor";
			
			this.longName = "doctor’s coat & pants";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a white doctor’s coat & pants";
			
			this.tooltip = "This outfit could be considered professional, except for the fact it lacks a shirt. It consists of a long white doctor’s jacket, slacks, stethoscope and name badge. It could be buttoned up, but the omitted item seems quite intentional.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 3300;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 8;
			this.fortification = 0;
			resistances.corrosive.resistanceValue = 20.0;
			resistances.burning.resistanceValue = 15.0;

			this.version = this._latestVersion;
		}
	}
}
