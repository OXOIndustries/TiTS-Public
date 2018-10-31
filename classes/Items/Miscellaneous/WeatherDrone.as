package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class WeatherDrone extends ItemSlotClass
	{
		//constructor
		public function WeatherDrone()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "W.Drone";
			
			//Regular name
			this.longName = "damaged weather drone";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a damaged weather drone";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This disc-shaped drone is covered in hundreds of different sensors. A small hoverdrive is positioned on the underside to keep it aloft but has either shut off or malfunctioned. Numerous dents mar the gleaming metal surface. Perhaps it ran afoul of an ice storm - or a hostile native.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 5000;
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
