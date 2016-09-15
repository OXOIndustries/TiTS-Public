package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class WinterGear extends ItemSlotClass
	{
		
		public function WinterGear() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "Winter G.";
			
			this.longName = "winter gear";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a set of winter clothing";
			
			this.tooltip = "A rather fashionable set of wintery clothing, consisting of a parka, trousers, and boots, all of which are lined with fur and heavily insulated. With the addition of the emergency heating pads, it’s a must-have for exploring frozen planets.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 7000;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.sexiness = 2;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			resistances.freezing.resistanceValue = 40.0;
			resistances.burning.resistanceValue = -10.0;
			resistances.pheromone.resistanceValue = -10.0;

			
			this.version = this._latestVersion;
		}
	}
}
