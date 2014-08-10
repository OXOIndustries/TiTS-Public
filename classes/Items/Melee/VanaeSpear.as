package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class VanaeSpear extends ItemSlotClass
	{	
		public function VanaeSpear() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "Vanae Spear";
			this.longName = "vanae spear";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a two-handed combat spear";
			
			this.tooltip = "A two-handed spear crafted by the vanae huntresses of Mhen'ga. It has an ironwood tip with a sharp spike made for piercing and two 'lugs' or 'wings' on the spear socket behind the blade. The wings stop speared prey from working their way up the shaft and attacking the wielder.\n\nThe shaft is made of Varina birch and is light yet sturdy. It makes it easy to wield for those who don't have a lot of muscle.";
			this.attackVerb = "stab";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 250;
			this.attack = 2;
			this.damage = 8;
			this.damageType = GLOBAL.PIERCING;
			
			this.version = _latestVersion;	
		}	
	}
}