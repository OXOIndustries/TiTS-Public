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
	public class BothriocRapier extends ItemSlotClass
	{	
		//Level 7 (Common). Balance 2.0
		//Gave some dagger stats
		public function BothriocRapier() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "B.Rapier";
			this.longName = "bothrioc rapier";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a bothrioc rapier";
			
			this.tooltip = "A rapier with a simplistic hilt and a long, fairly straight, blade. The guard has what looks to be a botrioc message written along its surface, barely legible and hard to make out.";
			this.attackVerb = "slash";
			attackNoun = "slash";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 6400;
			
			this.attack = 5;
			this.critBonus = 5;
			this.evasion = 5;

			baseDamage.kinetic.damageValue = 13.0;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.version = _latestVersion;
		}	
	}
}