package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class HoldOutPistol extends ItemSlotClass
	{
		//constructor
		public function HoldOutPistol()
		{

			//Hold-out Pistol:
			//0
			
			//this.indexNumber = 0;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			//Used on inventory buttons
			this.shortName = "Hld.Pistol";
			//Regular name
			this.longName = "hold-out pistol";
			//Longass shit, not sure what used for yet.
			this.description = "a hold-out pistol";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A simple black-powder pistol. It is easy to conceal but does not pack a particularly strong punch, the perfect weapon for a smuggler.";
			this.attackVerb = "shoot";
			//Information
			this.basePrice = 100;
			this.attack = 0;
			this.damage = 5;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);

		}
	}
}