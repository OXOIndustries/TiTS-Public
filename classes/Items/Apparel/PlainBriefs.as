package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class PlainBriefs extends ItemSlotClass
	{
		//constructor
		public function PlainBriefs()
		{
			//Plain Briefs
			//9
			
			//this.indexNumber = 9;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			//Used on inventory buttons
			this.shortName = "Briefs";
			//Regular name
			this.longName = "plain briefs";
			//Longass shit, not sure what used for yet.
			this.description = "a set of plain briefs";
			//Displayed on tooltips during mouseovers
			this.tooltip = "These plain white briefs are made from ultralastic (patent pending), a material that allows them to stretch over almost everything. They are otherwise unremarkable and comfy.";
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