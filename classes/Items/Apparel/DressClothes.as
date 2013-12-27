package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class DressClothes extends ItemSlotClass
	{
		//constructor
		public function DressClothes()
		{

			//Dress Clothes
			//7
			
			//this.indexNumber = 7;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			//Used on inventory buttons
			this.shortName = "DressCloth";
			//Regular name
			this.longName = "dress clothes";
			//Longass shit, not sure what used for yet.
			this.description = "a set of dress clothes";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is a fairly standard set of dress clothes, the sort of thing you would wear to a funeral or dinner engagement.";
			this.attackVerb = "null";
			//Information
			this.basePrice = 200;
			this.attack = 0;
			this.damage = 0;
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