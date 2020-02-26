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
	 
	public class SwimBriefs extends ItemSlotClass
	{
		
		public function SwimBriefs()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "S. Briefs";
			
			//Regular name
			this.longName = "Swim Briefs";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of swim briefs";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Masculine swimwear with a distinctive ‘V’ shape. Popular amongst athletes seeking to minimize drag. Hydrophobic ultralastic weave allows the garment to accommodate even the largest packages.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null"; 
			
			//Information
			this.basePrice = 400;
			this.attack = 0; 
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 2;
			this.resolve = 1;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_SWIMWEAR);
			
			
			this.version = _latestVersion;
		}
	}
}