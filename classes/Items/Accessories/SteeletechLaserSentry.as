package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CombatAttacks;
	
	/**
	 * @author DrunkZombie
	 */
	public class SteeletechLaserSentry extends ItemSlotClass
	{
		public function SteeletechLaserSentry() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "Laser Sentry";
			
			//Regular name
			this.longName = "Steeletech Laser Sentry Mk1";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Steeletech Laser Sentry Mk1";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This expansion pack for your attack drone, put together from salvaged sentry turrets, makes it significantly bulkier and converts it from firing electrical discharges to a more potent laser beam capable of shearing through solid metal. Thanks to using Steele Tech components, the laser is designed to be easily removed when you want to switch your drone back to its original design.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			droneAttack = CombatAttacks.SteeletechLaserSentryAttack;
			
			addFlag(GLOBAL.ITEM_FLAG_COMBAT_DRONE);
			
			this.version = _latestVersion;
		}	
	}
}
