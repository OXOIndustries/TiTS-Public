package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SteeleTechSuit extends ItemSlotClass
	{
		//Level 6 (Rare). Balance 2.0
		public function SteeleTechSuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "ST. Suit";
			
			//Regular name
			this.longName = "Steele Tech suit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Steele Tech suit";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The slick new uniform your Dad issued a while back. Sexy, form-fitting, and utilitarian. Doesn’t provide much protection (or modesty, for that matter), but it’s got a built-in shield emitter to boost your shields. Note that isn’t strong enough to generate a defensive shield on its own.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 5300;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 10;
			this.sexiness = 3;
			this.resolve = 2;
			this.critBonus = 0;
			this.evasion = 5;
			this.fortification = 0;
			
			resistances.electric.resistanceValue = 30.0;
			resistances.burning.resistanceValue = 30.0;
			
			this.version = _latestVersion;
		}
		
	}

}
