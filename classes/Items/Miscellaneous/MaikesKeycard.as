package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MaikesKeycard extends ItemSlotClass
	{
		/* FEN NOTE: DEPRECIATED. CONVERTED TO KEY ITEM.*/
		
		//constructor
		public function MaikesKeycard()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 20;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "M.Key";
			
			//Regular name
			this.longName = "Maike’s Key Card";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a key card belonging to overseer Maike";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This shining, plasticized card must be used to unlock a door somewhere on Zhèng Shi.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2;
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
