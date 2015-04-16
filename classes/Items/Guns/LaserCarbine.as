package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	
	public class LaserCarbine extends ItemSlotClass
	{
		//constructor
		public function LaserCarbine()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Laser C.";
			
			//Regular name
			this.longName = "laser carbine";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a laser carbine";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The Reaper Mk.5 Laser Carbine is currently the service rifle of the Terran Coalition Expeditionary Force, the main force of Earth's military. Produced with an integrated holographic scope and digital heads-up display, the Reaper Mk.5 is a sturdy, balanced rifle suitable for a variety of combat scenarios.";
			this.attackVerb = "shoot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 3750;
			this.attack = 3;
			
			baseDamage = new TypeCollection();
			baseDamage.electric.damageValue = 3;
			baseDamage.burning.damageValue = 9;
			baseDamage.addFlag(DamageFlag.LASER);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}