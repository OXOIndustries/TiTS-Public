package classes.Items.Guns 
{	
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class FlareGun extends ItemSlotClass
	{
		//Level 7 (Common). Balance 2.0
		public function FlareGun() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "FlareGun";
			
			//Regular name
			this.longName = "flare gun";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a flare gun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A simple, old-school flare gun. While not intended to be used as a weapon so much as to either illuminate Myrellion caverns or signal distant allies, you’re bloody-minded enough to find a way. The rate of fire is slow, but the projectile is massive and has a tendency to bury itself in the target and burn. ";
			this.attackVerb = "shoot";
			attackNoun = "flare";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 6600;
			
			baseDamage.burning.damageValue = 13;
			baseDamage.kinetic.damageValue = 4;
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_BURN);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 9;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
		
	}

}