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
	public class TravelersCloak extends ItemSlotClass
	{
		public function TravelersCloak() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "T.Cloak";
			
			//Regular name
			this.longName = "traveler’s cloak";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a traveler’s cloak";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A thick and warm cloak made from fur, used for traveling in cold climates. Will keep you warm during a snowstorm. Unfortunately, it’s highly flammable, and the hood tends to get in front of your eyes.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 22000;
			this.attack = -1;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.burning.resistanceValue = -10.0;
			resistances.freezing.resistanceValue = 50.0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_COVER_BODY);
			
			this.version = _latestVersion;
		}	
	}
}
