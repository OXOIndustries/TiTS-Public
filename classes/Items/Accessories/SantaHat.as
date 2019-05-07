package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Fen
	 */
	public class SantaHat extends ItemSlotClass
	{
		public function SantaHat() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "SantaHat";
			
			//Regular name
			this.longName = "Santa hat";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Santa hat";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This fuzzy red hat looks straight out of Terran Christmas tales of yore. It comes complete with luxurious white fur at the base and an orange sized ball of alabaster fluff at the very apex. The craftsmanship is impeccable. This is no ten credit costume piece. It’s a high-quality piece of haberdashery fit for the big red man himself - or a daring space captain who found a place in his [pc.hisHer] heart to help out a poor lost soul during the holidays. Just looking at it makes you feel warm and fuzzy all over.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 1500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 50;
			
			this.version = _latestVersion;
		}	
	}
}