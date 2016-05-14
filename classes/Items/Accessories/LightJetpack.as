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
	public class LightJetpack extends ItemSlotClass
	{
		
		
		public function LightJetpack() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "Lt.Jetpack";
			
			//Regular name
			this.longName = "light jetpack";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a light jetpack";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A lightweight civilian jetpack designed by Steele Tech for more adventurous spirits. Provides quick, agile movements at the expense of long flight time.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 10000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 10;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}	
	}
}