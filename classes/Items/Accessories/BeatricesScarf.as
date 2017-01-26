package classes.Items.Accessories 
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class BeatricesScarf extends ItemSlotClass
	{
		
		
		public function BeatricesScarf() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "Scarf";
			
			//Regular name
			this.longName = "knitted scarf";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a knitted scarf";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Knitted with love and care, this handmade scarf is perfect for protecting your neck from icy winds.\n\n+3 Willpower.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 200;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			resistances = new TypeCollection();
			resistances.freezing.resistanceValue = 15.0;
			
			this.version = _latestVersion;
		}	
	}
}
