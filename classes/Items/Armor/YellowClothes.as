package classes.Items.Armor 
{
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	
	/**
	 * ...
	 * @author justadude
	 */
	public class YellowClothes extends ItemSlotClass 
	{
		
		public function YellowClothes() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ARMOR;
			
			shortName = "Y.Clothes";
			
			longName = "modded yellow clothes";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));

			this.description = "a bright yellow jacket and pants enhanced with cybernetics";
			this.tooltip = "This tight jacket and pants combo are bright yellow, accented with black stripes down the sleeves, pant legs, sides, and zipper. The design is clearly inspired by old Terran action movies, and allows for very fluid and unobstructed movement. Despite appearing to offer no protection, the outfit is lined with special cybernetics that amplify shield power and absorb electricity.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 30;
			this.shields = 50;
			this.sexiness = 4;
			this.critBonus = 0;
			this.evasion = 10;
			
			resistances.electric.resistanceValue = 30.0;
			
			this.version = _latestVersion;
		}
		
	}

}