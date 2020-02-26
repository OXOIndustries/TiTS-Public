package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class FemaleDoctorOutfit extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		public function FemaleDoctorOutfit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "F. Doctor";
			
			this.longName = "doctor’s coat and skirt";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a white doctor’s coat, tank top, and skirt";
			
			this.tooltip = "The only part of this outfit that isn’t revealing is the long white doctor’s jacket. Underneath is a tight fitting tank top, short skirt, and stockings. It also comes with a stethoscope and name badge."; 
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 3500;
			this.attack = 5;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 5;
			this.evasion = 12;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
	}
}
