package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Fenbutt
	 */
	public class FrozenSpire extends ItemSlotClass
	{	
		//Level 8 (Rare) Balance 2.0
		public function FrozenSpire() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "F.Spire";
			this.longName = "frozen spire";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a large ice spear";
			
			this.tooltip = "A spear with a tip made from pure ice. The large spike sits on a shaky-looking piece of tech that seems to be made from scavenged heat belt components, their function inverted to keep the tip frozen in all temperatures.";
			this.attackVerb = "stab";
			attackNoun = "stab";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 18000;
			this.attack = 10;
			this.critBonus = 0;
			this.evasion = 0;
			baseDamage.kinetic.damageValue = 16.0;
			baseDamage.freezing.damageValue = 12.0;
			//baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.version = _latestVersion;
		}	
	}
}