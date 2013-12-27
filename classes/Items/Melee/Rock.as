package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class Rock extends ItemSlotClass
	{
		//constructor
		public function Rock()
		{
			//A Rock
			//5
			
			//this.indexNumber = 5;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			//Used on inventory buttons
			this.shortName = "Rock";
			//Regular name
			this.longName = "rock";
			//Longass shit, not sure what used for yet.
			this.description = "a rock";
			//Displayed on tooltips during mouseovers
			this.tooltip = "You can pretty much find a rock anywhere, and they hurt more than fists, sooooo....";
			this.attackVerb = "smack";
			//Information
			this.basePrice = 0;
			this.attack = 0;
			this.damage = 0;
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