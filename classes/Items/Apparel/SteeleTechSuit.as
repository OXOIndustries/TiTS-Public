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
		
		public function SteeleTechSuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "ST. Suit";
			
			//Regular name
			this.longName = "steeletech suit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a steeletech suit";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The slick new uniform your Dad issued a while back. Sexy, form-fitting, and utilitarian. Doesn't provide much protection (or modesty, for that matter), but it's got a built-in shield emitter to keep you from harm.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 3500;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 15;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, .3, .3);
			
			this.version = _latestVersion;
		}
		
	}

}