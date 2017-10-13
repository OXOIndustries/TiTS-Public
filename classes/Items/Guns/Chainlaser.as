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
	 * @author Fenoxofenbuttttt
	 */
	public class Chainlaser extends ItemSlotClass
	{
		//Level 9 (Common). Balance 2.0
		public function Chainlaser() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "ChainLsr";
			
			//Regular name
			this.longName = "chainlaser";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a chainlaser";
			
			//Displayed on tooltips during mouseovers
			tooltip = "One of the chief drawbacks of energy weapons is the high heat generation and the power draw required to feed it. The chainlaser solves both of these in typical thraggen fashion: by making the weapon so big and cumbersome that it provides endless surface area with which to dissipated heat. The weight of the batteries hardly matters when you’re already lugging around six barrels and a servo to spin them (to further facilitate cooling). While it is possible to fire all six at once in “Alpha Strike” pattern, this can sometimes result in catastrophic failure of the weapon. Models sold to non-thraggen typically come with this “feature” disabled.";
			this.attackVerb = "shoot";
			attackNoun = "laser beam"
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 27000;
			this.attack = 15;
			
			baseDamage.burning.damageValue = 32;
			baseDamage.addFlag(DamageFlag.BULLET);
			baseDamage.addFlag(DamageFlag.NO_CRIT);
			baseDamage.addFlag(DamageFlag.LASER);
			addFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR);
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -4;
			this.fortification = 0;

			this.version = _latestVersion;
		}
		
	}

}