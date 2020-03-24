package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class SpacePirateOutfit extends ItemSlotClass
	{
		//Level 3 (Common). Balance 2.0
		public function SpacePirateOutfit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "S.Pirate O.";
			
			this.longName = "space pirate outfit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a space pirate outfit made mostly of leather";
			
			this.tooltip = "This is a space pirate outfit consisting of a lot of tight black leather. There’s also a lot of tough looking patches with badass insignias. Great for any rebel with or without a cause.  This outfit possesses a defensive layer of nanofibers.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 440;
			this.attack = 0;
			this.defense = 4;
			this.shieldDefense = 0;
			this.sexiness = 3;
			this.resolve = 2;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.burning.resistanceValue = 13.0;
			this.version = this._latestVersion;
		}
	}
}