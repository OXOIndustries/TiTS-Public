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
	public class SunFire extends ItemSlotClass
	{
		public function SunFire() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "SunFire";
			
			//Regular name
			this.longName = "SunFire rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a spinarran SunFire rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The mainstay of spinarran infantry, the plasma bore, SunFire variant, is a heavy plasma weapon that is designed for short and medium ranged engagements. It fires a withering stream of plasma bolts from three rotary barrels, enough that some foes may be set on fire.";
			this.attackVerb = "shoot";
			attackNoun = "plasma bolt";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 27500;
			this.attack = 5;
			
			baseDamage.burning.damageValue = 21;

			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_BURN);
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
