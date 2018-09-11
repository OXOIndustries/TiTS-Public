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
	 * @author Fenoxo Fenballs :3 <3
	 */
	public class SaurmorianRifle extends ItemSlotClass
	{
		//Level 9 (Rare). Balance 2.0
		public function SaurmorianRifle() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "S.Rail";
			
			//Regular name
			this.longName = "saurmorian railgun";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a custom saurmorian railgun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This matte-black cannon, with its long and heavy barrel and dual drum-magazine, is a beloved weapon of freelancing saurmorians. Unable to be efficiently used by the military (to their utter chagrin) and never found whole, these manually constructed weapons almost always have some sentimental value to their wielders. Though properly using one of these cumbersome things is difficult, even for a saurmorian, you nonetheless may find yourself capable of using it as an effective weapon.";
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 41000;
			
			baseDamage.kinetic.damageValue = 41;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			baseDamage.addFlag(DamageFlag.BULLET);
			addFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR);
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			baseDamage.addFlag(DamageFlag.NO_CRIT);

			this.attack = 7;
			this.critBonus = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.evasion = -3;
			this.fortification = 0;
			
			//addFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR);

			this.version = _latestVersion;
		}	
	}
}
