package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class CowPrintedShirt extends ItemSlotClass
	{

		//constructor
		public function CowPrintedShirt()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "CowShirt";
			
			//Regular name
			this.longName = "cow-print shirt";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a cow-print shirt";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This white shirt with a black spot pattern made for New Texans proudly pays homage to their heritage. Its tightness pronounces the exaggerated musculature and mammaries of the average New Texan, while looking loose on almost everybody else. Perfect to show off the full effects of the Treatment.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 2;
			this.resolve = 1;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}