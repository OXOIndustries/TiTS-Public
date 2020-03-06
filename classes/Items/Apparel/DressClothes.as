package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class DressClothes extends ItemSlotClass
	{
		//Level 1 (Starter). Balance 2.0
		//constructor
		public function DressClothes()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			//Used on inventory buttons
			this.shortName = "DressCloth";
			
			//Regular name
			this.longName = "dress clothes";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a set of dress clothes";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is a fairly standard set of dress clothes, the sort of thing you would wear to a funeral or dinner engagement.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 200;
			this.attack = 2;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			//this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 1;
			this.fortification = 0;

			resistances.psionic.resistanceValue = 35.0;
			
			this.version = _latestVersion;
		}
	}
}
