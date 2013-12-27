package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class PlainBra extends ItemSlotClass
	{
		//constructor
		public function PlainBra()
		{
			//Bra
			//10
			
			//this.indexNumber = 10;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			//Used on inventory buttons
			this.shortName = "Bra";
			//Regular name
			this.longName = "plain bra";
			//Longass shit, not sure what used for yet.
			this.description = "a plain bra";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This bra, while incredibly elastic, is also incredibly plain. It'll accomodate almost any cup size, but it won't win you any points for style.";
			this.attackVerb = "null";
			//Information
			this.basePrice = 60;
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