package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/*
	 * @author Fenoxo
	 */
	public class Slavesuit extends ItemSlotClass
	{
		//Level 9 (Common). Balance 2.0
		public function Slavesuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "Slave U.";
			
			this.longName = "slave uniform";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a slave uniform";
			
			this.tooltip = "While it’s true that slavery is rife with suffering and brutality, a discerning company will take the proper precautions for health and safety. This sleeveless, orange and dark blue bodysuit is a generic, unbranded uniform for intense manual labor. It’s light and has three, thin layers: an outer weave for tears and rips, a middle layer for electrical currents/corrosive substances/fire and heat protection with an inner cooling layer that adheres to the skin and provides a comfortable, form fitting support for long work hours.\n\nUnfortunately, this particular suit has rather loose zippers across the chest, pelvis and rear end, adding an incentive for the more ‘hands-on’ slavers.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 7000;
			this.attack = 0;
			this.defense = 4;
			this.shieldDefense = 0;
			this.sexiness = 3;
			this.resolve = 2;
			this.critBonus = 0;
			this.evasion = 10;
			this.fortification = 15;

			resistances.burning.resistanceValue = 20.0;
			resistances.corrosive.resistanceValue = 15.0;
			resistances.electric.resistanceValue = 30.0;
			resistances.freezing.resistanceValue = -30.0;
			resistances.tease.resistanceValue = -10.0;
			
			this.version = this._latestVersion;
		}
		
	}

}
