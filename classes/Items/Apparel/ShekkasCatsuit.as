package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * Sold by Shekka after recruitment.
	 * @author Fenoxo, but copied from AnnosCatsuit, authored by Geddy-chan-sempai.
	 */
	public class ShekkasCatsuit extends ItemSlotClass
	{
		//Level 6 (Rare). Balance 2.0
		public function ShekkasCatsuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "ShekkaSuit";
			
			this.longName = "Shekka’s Catsuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a white, hexagon-patterned catsuit";
			
			this.tooltip = "A nearly identical copy of Shekka’s prototypical, form-fitting jumpsuit. Just like her own, this one is stark white and glossy, patterned with a delightful series of interlocking hexagons. Well-made clasps keep it sealed up tight - and most foreign pheromones out. Additionally, the fabric itself provides modest protection from small electrical charges - useful for an engineer like the diminutive raskvel. A near invisible seam allows for the presence (or absence) of a tail, if needed. And of course, this one is sized to fit you. One of these days, you’ll have to ask Shekka where she finds these.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 200;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 12;
			this.fortification = 0;

			resistances.pheromone.resistanceValue = 25.0;
			resistances.electric.resistanceValue = 5.0;
			
			this.version = this._latestVersion;
		}
		
	}

}
