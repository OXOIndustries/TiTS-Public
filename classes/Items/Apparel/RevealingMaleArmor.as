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
	public class RevealingMaleArmor extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		public function RevealingMaleArmor() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "R.M.Armor";
			
			this.longName = "revealing male armor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a revealing set of masculine plate armor";
			
			this.tooltip = "This set of fantasy style armor seems to leave a lot of areas exposed. While it completely covers one’s arms and legs in fanciful fetish armor, it barely covers anywhere else. You recognize it is the hero’s outfit from the ‘Randy Crusade’ series.\n\nThere’s a set of chains that drape over the chest and connect to a solitary fearsome looking shoulder guard. Other than that there’s no upper body covering or armor.\n\nFurther down the loins are ‘protected’ by an incredibly tight pair of black shiny shorts with a zip in front. Given the ample amount of armor for the limbs, it seems rather pointedly exposed. What an obvious weak spot!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 3600;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 10;
			this.fortification = 0;

			resistances.tease.resistanceValue = 8.0;
			
			this.version = this._latestVersion;
		}
		
	}

}
