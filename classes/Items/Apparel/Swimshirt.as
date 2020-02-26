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
	 
	public class Swimshirt extends ItemSlotClass
	{
		
		public function Swimshirt()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "S. Shirt";
			
			//Regular name
			this.longName = "Swimshirt";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a swim shirt";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A loose fitting undertop, woven from hydrophobic chameleon silk. Generally used by swimmers to prevent sunburn, or to conceal their gut.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null"; 
			
			//Information
			this.basePrice = 200;
			this.attack = 0; 
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.resolve = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_SWIMWEAR);
			
			
			this.version = _latestVersion;
		}
	}
}