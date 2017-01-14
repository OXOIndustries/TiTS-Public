package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Picardine extends ItemSlotClass
	{
		//constructor
		public function Picardine()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 20;
			this.type = GLOBAL.GEM;
			
			//Used on inventory buttons
			this.shortName = "Picardine";
			
			//Regular name
			this.longName = "picardine crystal";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a picardine crystal";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Few gems are prized for scientific purposes quite as much as picardine. Used for everything from intelligence-boosting supplements to artificial intelligence cores, this plain-looking crystal fetches quite a high price on the open market. When it comes to research, nothing “makes it so” quite like picardine.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 7000;
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
