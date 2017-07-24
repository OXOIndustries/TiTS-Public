package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Fenoxo
	 */
	public class ZilSpear extends ItemSlotClass
	{	
		public function ZilSpear() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "Z.Spear";
			this.longName = "zil champion’s assegai";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a zil champion’s assegai";
			
			this.tooltip = "A short stabbing spear, with a broad, leaf-shaped tip made of flint. A favored weapon in zil hunting parties, the blade usually envenomed.";
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "stab";
			attackNoun = "thrust";
			
			this.basePrice = 1000;
			this.attack = 0;
			baseDamage.kinetic.damageValue = 6.0;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.version = _latestVersion;
		}	
	}
}