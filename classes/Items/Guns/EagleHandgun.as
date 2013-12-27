package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class EagleHandgun extends ItemSlotClass
	{
		//constructor
		public function EagleHandgun()
		{
			//Eagle Class Handgun:
			//1
			
			//this.indexNumber = 1;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			//Used on inventory buttons
			this.shortName = "E.Handgun";
			//Regular name
			this.longName = "eagle handgun";
			//Longass shit, not sure what used for yet.
			this.description = "an eagle handgun";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A large barreled fifty caliber handgun. This particular pistol packs a wallop for such a compact weapon. It's the perfect weapon for a mercenary on the go.";
			this.attackVerb = "shoot";
			//Information
			this.basePrice = 120;
			this.attack = 0;
			this.damage = 7;
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