package classes.Items.Treasures
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class AmberIdol extends ItemSlotClass
	{
		//constructor
		public function AmberIdol()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 20;
			this.type = GLOBAL.GEM;
			
			//Used on inventory buttons
			this.shortName = "AmberIdol";
			
			//Regular name
			this.longName = "amber idol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an amber idol";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This amber idol was looted from some sort of zil shrine on the Mhen'ga's cliffs. It would likely fetch a large price at market.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 14000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.isUsable = false;
			
			this.version = _latestVersion;
		}
	}
}
