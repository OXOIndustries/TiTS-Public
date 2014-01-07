package classes.Items.ZilRation
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class ZilRation extends ItemSlotClass
	{
		//constructor
		public function ZilRation()
		{
			//Nothing
			//6
			
			//this.indexNumber = 6;
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			//Used on inventory buttons
			this.shortName = "ZilRation";
			//Regular name
			this.longName = "tasty-smelling zil ration";
			//Longass shit, not sure what used for yet.
			this.description = "a tasty-smelling zil ration";
			//Displayed on tooltips during mouseovers
			this.tooltip = "These are dried rations appear to be made from local fruits and plant nectars. There's a good chance that something in it would make you sick if you didn't have a microsurgeon-boosted immune system. In your case, you'll probably just undergo a mutation or two.";
			this.attackVerb = "";
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
			//this.useFunction = 
			//The OLD way I set this up I was defining these all globally and could just point to a function. Not sure how to go about things now...
		}
	}
}