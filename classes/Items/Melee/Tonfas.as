package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Tonfas extends ItemSlotClass
	{
		public function Tonfas() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "tonfas";
			this.longName = "tonfas";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.attackVerb = "smack";
						
			this.tooltip = "Penny's Tonfas";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 150;
			this.attack = 0;
			
			baseDamage.kinetic.damageValue = 4;
			baseDamage.addFlag(DamageFlag.CRUSHING);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
	}
}