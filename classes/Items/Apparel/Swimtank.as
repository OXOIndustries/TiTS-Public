package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag; 
	
	/**
	 * @author Zavos
	 */
	 
	public class Swimtank extends ItemSlotClass
	{
		
		public function Swimtank()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "S. Tank";
			
			//Regular name
			this.longName = "Swim Tank Top";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a sleeveless swim shirt";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A sleeveless shirt, woven from hydrophobic materials. Though it provides less coverage than normal swim shirts, it offers greater comfort and style.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null"; 
			
			//Information
			this.basePrice = 250;
			this.attack = 0; 
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 1;
			this.resolve = 2;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_SWIMWEAR);
			
			
			this.version = _latestVersion;
		}
	}
}