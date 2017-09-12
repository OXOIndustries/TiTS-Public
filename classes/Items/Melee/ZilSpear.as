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
		//Level 6 (Rare). Balance 2.0
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
			
			this.tooltip = "A short stabbing spear, with a broad, leaf-shaped tip made of some unclassified, ultra-hard material. A favored weapon in zil hunting parties, the blade usually envenomed.";
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "stab";
			attackNoun = "thrust";
			
			this.basePrice = 4700;
			this.attack = 16;
			baseDamage.kinetic.damageValue = 20.0;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.version = _latestVersion;
		}	
	}
}