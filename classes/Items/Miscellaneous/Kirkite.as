package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Kirkite extends ItemSlotClass
	{
		//constructor
		public function Kirkite()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 20;
			this.type = GLOBAL.GEM;
			
			//Used on inventory buttons
			this.shortName = "Kirkite";
			
			//Regular name
			this.longName = "kirkite crystal";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a kirkite crystal";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An uncommon crystal formation that is rarely found in the galactic core, kirkite deposits seem to increase in size and quantity the farther one gets from Terra. Some scientists have also found a correlation between kirkite density and the color of a planet’s dominant sapient. Planets rich in greenskins always seem to have denser deposits of this curious gem. No suitable explanation for this phenomenon has yet been postulated.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2000;
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
