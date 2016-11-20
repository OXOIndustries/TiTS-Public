package classes.Items.Junk
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class BrokenBrainmeltLamp extends ItemSlotClass
	{
		//constructor
		public function BrokenBrainmeltLamp()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "B.B.Melt";
			
			//Regular name
			this.longName = "broken Brainmelt Lamp";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a broken Brainmelt Lamp";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The deceptively innocuous pink-bulbed Brainmelt Lamp seems to have been damaged in the fight. You might be able to sell it for scrap.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1500;
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
