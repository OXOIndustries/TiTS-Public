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
	 * @author Fenoxo
	 */
	public class BlackLight extends ItemSlotClass
	{
		
		public function BlackLight() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "B.Light";
			
			//Regular name
			this.longName = "“Black Light” ultraviolet laser rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a “Black Light” ultraviolet laser rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A newer piece of spinarran thermal weapons technology. This military grade weapon packs an incendiary blast of ultraviolet light that will give someone a whole lot more than a sunburn.";
			this.attackVerb = "shoot";
			attackNoun = "purple-black laser beam";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 27000;
			this.attack = 5;
			
			baseDamage.electric.damageValue = 0;
			baseDamage.burning.damageValue = 25;

			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.LASER);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 3;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
		
	}

}
