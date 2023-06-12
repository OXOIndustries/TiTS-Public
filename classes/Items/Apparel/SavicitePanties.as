package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * Swapped in and out of Annos statblock to determine her state/type of dress.
	 * @author Gedan
	 */
	public class SavicitePanties extends ItemSlotClass
	{
		
		public function SavicitePanties() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			this.shortName = "Sav.Panty";
			
			this.longName = "savicite-lace panties";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a pair of savicite-laced panties";
			
			this.tooltip = "Shimmering emerald silks laced with glowing green savicite threads make for a visually striking pair of panties. The cut is narrow and matched by a heart-shaped gap in the crotch to allow for easy access. They look sort of slutty, but with savicite's effects, you'll feel kind of slutty too once you put them on.\n\n(<b>Raises minimum lust to 33.</b>)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 3000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_EXPOSE_GROIN];
			this.version = this._latestVersion;
		}
	}
}
