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
	
	public class Swimstrap extends ItemSlotClass
	{
		
		public function Swimstrap()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "Swimstrap";
			
			//Regular name
			this.longName = "Swimstrap";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a swimmer’s jockstrap";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A sleek jockstrap woven from hydrophobic ultralastic and chameleon silk. Popular amongst reptilian xenos with tails that make conventional swimwear awkward to use.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null"; 
			
			//Information
			this.basePrice = 600;
			this.attack = 0; 
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_SWIMWEAR);
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
			
			
			this.version = _latestVersion;
		}
	}
}