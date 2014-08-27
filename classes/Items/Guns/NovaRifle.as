package classes.Items.Guns 
{	
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
		
		public function NovaRifle() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Nova Rifle";
			
			//Regular name
			this.longName = "nova rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a rifle salvaged from the Nova's deck 13";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Proudly stamped with the Bell-Isle/Grunmann logo, this rifle bears a vague similarity to the modern Reaper rifles which are a common sight on galactic front lines. It lacks any of the safety and accuracy updates today's laser rifles have, but it packs a heavier punch.";
			this.attackVerb = "shoot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 2000;
			this.attack = 2;
			this.damage = 14;
			this.damageType = GLOBAL.LASER;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);

			this.version = _latestVersion;
		}
		
	}

}