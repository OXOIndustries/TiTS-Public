package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class UnderbustCorset extends ItemSlotClass
	{

		//constructor
		public function UnderbustCorset()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "Underbust Corset";
			
			//Regular name
			this.longName = "underbust corset";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an underbust corset";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An updated classic, this corset has been brought into the future with chameleon silk, ultralastic and nanosteel fibers. It shows off the wearer’s assets while maintaining a svelte, sleek figure.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 820;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_FULL);
			
			this.version = _latestVersion;
		}
	}
}
