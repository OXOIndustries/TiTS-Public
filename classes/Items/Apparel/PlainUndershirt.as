package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class PlainUndershirt extends ItemSlotClass
	{
		//constructor
		public function PlainUndershirt()
		{
			//Undershirt
			//11
			
			//this.indexNumber = 11;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			//Used on inventory buttons
			this.shortName = "Undershirt";
			//Regular name
			this.longName = "undershirt";
			//Longass shit, not sure what used for yet.
			this.description = "an undershirt";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A pretty standard undershirt, this garment breathes wonderfully.";
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

			//Shield Generator
			//11
			
			//this.indexNumber = 11;
		}
	}
}