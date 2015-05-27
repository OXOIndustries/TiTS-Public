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
	public class HoldoutHP extends ItemSlotClass
	{
		
		public function HoldoutHP() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Holdout H.P.";
			
			//Regular name
			this.longName = "holdout hammer pistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a modified holdout hammer pistol";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Based on an old Earth favorite, this modified holdout pistol was custom-built by Dr. Anno Dorna. Compact, easy to hide, and exceptionally accurate, this gun can really punch a hole for a weapon its size thanks to a proprietary armor-piercing round. It has an integrated suppressor and laser sight. ";
			
			this.attackVerb = "shoot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 3000;
			this.attack = 4;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 10;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 2;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
		
	}

}