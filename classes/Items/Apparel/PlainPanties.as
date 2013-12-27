package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class PlainPanties extends ItemSlotClass
	{
		//constructor
		public function PlainPanties()
		{
			//Space Panties
			//8
			// PANTIES..... IN...... SPAAAAAAAAAAAAACCCCCCCCCEEEEEEEEEEEEEEEEEEEE
			
			//this.indexNumber = 8;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			//Used on inventory buttons
			this.shortName = "Panties";
			//Regular name
			this.longName = "plain panties";
			//Longass shit, not sure what used for yet.
			this.description = "a set of plain panties";
			//Displayed on tooltips during mouseovers
			this.tooltip = "These plain white panties are rather unremarkable but functional. They are made from ultralastic (patent pending) materials that allow them to stretch over almost anything.";
			this.attackVerb = "null";
			//Information
			this.basePrice = 40;
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