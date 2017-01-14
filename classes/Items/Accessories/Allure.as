package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Allure extends ItemSlotClass
	{
		
		
		public function Allure() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "Allure";
			
			//Regular name
			this.longName = "Allure brand pheromonal body spray";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pheromonal body-spray";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A shining can of ‘Allure’ brand body spray. It’s a pheromonal agent, designed from the mating smells of some of the most alluring species in the galaxy. Branded for men, women, and anything inbetween, its slogan reads <i>The Power of Allure</i>. A warning label informs you the wearer is not immune from the intoxicating effects of the pheromones. That probably explains why it sells so well.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";

			resistances.drug.resistanceValue = -20.0;
			resistances.pheromone.resistanceValue = -20.0;
			resistances.tease.resistanceValue = -20.0;
			resistances.psionic.resistanceValue = -20.0;
			
			//Information
			this.basePrice = 750;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}	
	}
}