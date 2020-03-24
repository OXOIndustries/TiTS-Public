package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class SchoolboyOutfit extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		public function SchoolboyOutfit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "S.Boy O.";
			
			this.longName = "schoolboy outfit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a sexy schoolboy outfit";
			
			this.tooltip = "This is a highly fetishized western school boy outfit. It consists of a tight private school blazer, small cap, and seriously small shorts. There are also high socks and polished shoes, as well as a neat looking tie.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 3400;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 7;
			this.fortification = 0;
			
			resistances.tease.resistanceValue = 20.0;

			this.version = this._latestVersion;
		}
	}
}
