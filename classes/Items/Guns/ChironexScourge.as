package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class ChironexScourge extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
		//constructor
		public function ChironexScourge()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Chiro";
			
			//Regular name
			this.longName = "Chironex scourge"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Chironex scourge";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Scourges are a family of living weapons. Rifle-like in appearance, they fire large organic spikes filled with powerful toxins. The Chironex is the standardized strain of the scourge family and sees extensive use by the Ashei military.";
			//this.tooltip += " Like ";
			this.attackVerb = "shoot";
			attackNoun = "venomous spike";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1300;
			this.attack = 4;
			
			baseDamage = new TypeCollection();
			baseDamage.poison.damageValue = 15;
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			//addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			this.addFlag(GLOBAL.ITEM_FLAG_RIFLE_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = -8;

			this.version = _latestVersion;
		}
	}
}
