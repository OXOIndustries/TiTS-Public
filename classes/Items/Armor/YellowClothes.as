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
	 //Fen note: Level 10 Rare Stats.
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

			this.description = "a bright yellow jacket and pants enhanced with microcircuitry";
			this.tooltip = "This tight jacket and pants combo are bright yellow, accented with black stripes down the sleeves, pant legs, sides, and zipper. The design is clearly inspired by old Terran action movies, and allows for very fluid and unobstructed movement. Despite appearing to offer no protection, the outfit is lined with special microcircuitry that amplify shield power and absorbs electricity.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 3000;
			this.shields = 60;
			this.sexiness = 3;
			this.resolve = 2;
			this.critBonus = 0;
			this.evasion = 16;
			
			resistances.electric.resistanceValue = 40.0;
			
			this.version = _latestVersion;
		}
		
	}

}