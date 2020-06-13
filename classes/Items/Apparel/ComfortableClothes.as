package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ComfortableClothes extends ItemSlotClass
	{
		//Level 1 (Ech). Balance 2.0
		public function ComfortableClothes() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			//Used on inventory buttons
			this.shortName = "C.Clothes";
			
			//Regular name
			this.longName = "comfortable clothes";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a fairly generic set of comfortable clothes";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is a fairly generic and indistinguishable set of clothes. They look rather comfortable.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 90;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 2;
			this.fortification = 0;

			resistances.tease.resistanceValue = 20.0;
			
			this.version = _latestVersion;
		}
		
	}

}
