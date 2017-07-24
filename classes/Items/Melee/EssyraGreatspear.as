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
	public class EssyraGreatspear extends ItemSlotClass
	{	
		public function EssyraGreatspear() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "E.GSpear";
			this.longName = "essyra greatspear";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a huge essyra greatspear";
			
			this.tooltip = "A titanic spear, well over six feet in length, tipped with a black point and decorated with several ribbons and fetishes affixed to the haft. The great weight and reach of the spear make it surprisingly strong, despite its primitive appearances.";
			this.attackVerb = "stab";
			attackNoun = "stab";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 10000;
			this.attack = 3;
			this.critBonus = 5;
			baseDamage.kinetic.damageValue = 20.0;
			evasion = 5;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.version = _latestVersion;
		}	
	}
}