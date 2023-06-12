package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class SchoolgirlOutfit extends ItemSlotClass
	{
		//Not PC accessible?
		public function SchoolgirlOutfit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "S.Girl O.";
			
			this.longName = "schoolgirl outfit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a sexy schoolgirl outfit";
			
			this.tooltip = "This is a highly fetishized western school girl outfit. It consists of an incredibly tight white blouse, short tartan skirt and low hanging tie. Nobody would ever mistake this for a real school outfit!";
			
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
			
			resistances.tease.resistanceValue = 20.0;
			
			this.version = this._latestVersion;
		}
	}
}
