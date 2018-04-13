package classes.Items.Guns 
{	
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class NovaRifle extends ItemSlotClass
	{
		//Level 5 (Rare). Balance 2.0
		public function NovaRifle() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Nova Rifle";
			
			//Regular name
			this.longName = "Nova rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a rifle salvaged from the Nova’s deck 13";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Proudly stamped with the Bell-Isle/Grunmann logo, this rifle bears a vague similarity to the modern Reaper rifles which are a common sight on galactic front lines. It lacks any of the safety and accuracy updates today’s laser rifles have, but it packs a heavier punch.";
			this.attackVerb = "shoot";
			attackNoun = "laser beam";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 2600;
			this.attack = 8;
			
			//baseDamage.electric.damageValue = 1;
			baseDamage.burning.damageValue = 18;
			baseDamage.addFlag(DamageFlag.LASER);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
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
