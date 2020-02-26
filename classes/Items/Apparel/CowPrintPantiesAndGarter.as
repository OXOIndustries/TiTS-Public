package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;

	public class CowPrintPantiesAndGarter extends ItemSlotClass
	{
		//constructor
		public function CowPrintPantiesAndGarter()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "Cow Panties";
			
			//Regular name
			this.longName = "cow-print panties and garter";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of cow-print panties with a garter";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "These cow-print panties tightly hug the hips and only barely cover the crotch, and seem designed to be torn off with ease. They’re coupled with a sexy garter belt and thigh-high stockings, also in dairy cow blacks and whites.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 1200;
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