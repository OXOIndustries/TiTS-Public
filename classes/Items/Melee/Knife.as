package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class Knife extends ItemSlotClass
	{
		//constructor
		public function Knife()
		{

			//A KNIFE
			//4
			
			//this.indexNumber = 4;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			//Used on inventory buttons
			this.shortName = "knife";
			//Regular name
			this.longName = "knife";
			//Longass shit, not sure what used for yet.
			this.description = "a knife";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A fairly standard knife with a five inch blade. As good for slicing a steak as defending yourself.";
			this.attackVerb = "shoot";
			//Information
			this.basePrice = 150;
			this.attack = 0;
			this.damage = 4;
			this.damageType = GLOBAL.PIERCING;
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