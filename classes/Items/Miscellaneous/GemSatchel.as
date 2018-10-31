package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class GemSatchel extends ItemSlotClass
	{
		//constructor
		public function GemSatchel()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 2;
			this.type = GLOBAL.GEM;
			
			//Used on inventory buttons
			this.shortName = "GemSack";
			
			//Regular name
			this.longName = "satchel of gems";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a satchel full of gems";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is a satchel full of sparkling green gemstones. You could make a tidy profit selling this to a merchant - they don’t have much practical application, after all.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 10000;
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
