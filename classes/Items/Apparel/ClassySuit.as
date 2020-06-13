package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class ClassySuit extends ItemSlotClass
	{
		//Level 8 (Common). Balance 2.0
		public function ClassySuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "C.Suit";
			
			this.longName = "classy suit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a classy suit";
			
			this.tooltip = "This outfit is a timeless classic from Earth. Consisting of a jacket, button-up shirt, tie, and trousers, it lends an air of authority to businessmen, politicians and lawyers the universe over. Thanks to its ingenious design, its shape will change based on its wearer, always fitting as a bespoke suit should.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 14000;
			this.attack = 0;
			this.defense = 1;
			this.shieldDefense = 0;
			this.sexiness = 2;
			this.resolve = 3;
			this.critBonus = 0;
			this.evasion = 1;
			this.fortification = 0;
			
			resistances.corrosive.resistanceValue = 10.0;
			resistances.electric.resistanceValue = 10.0;
			resistances.poison.resistanceValue = 10.0;
			resistances.drug.resistanceValue = 20.0;
			
			this.version = this._latestVersion;
		}
	}
}
