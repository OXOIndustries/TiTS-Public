package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class NaleenSpear extends ItemSlotClass
	{	
		//Level 3 (Rare). Balance 2.0
		public function NaleenSpear() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "N.Spear";
			this.longName = "nyrean spear";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a two-handed combat spear";
			
			this.tooltip = "The one-handed spear you stole from the hermaphrodite naleen. It has a smooth stone tip that looks very sharp. There’s a bunch of colorful feathers are tied under the tip, you’re not sure if they serve a purpose or if they are just for decoration.\n\nDue to being made from light wood and having a shorter reach it can be used to attack very quickly.";
			this.attackVerb = "stab";
			attackNoun = "stab";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 600;
			this.attack = 5;
			baseDamage.kinetic.damageValue = 12.0;
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			
			this.version = _latestVersion;
		}	
	}
}