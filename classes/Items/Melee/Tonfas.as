package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
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
			
			this.attackVerb = "smack";
						
			this.tooltip = "PLACEHOLDER Penny's Tonfas";
			
			this.basePrice = 150;
			this.attack = 0;
			this.damage = 4;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = this._latestVersion;
		}
	}
}