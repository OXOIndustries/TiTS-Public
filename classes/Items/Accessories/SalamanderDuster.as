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
	public class SalamanderDuster extends ItemSlotClass
	{
		
		
		public function SalamanderDuster() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "S.Duster";
			
			//Regular name
			this.longName = "Salamander Longcoat";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Salamander Longcoat";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Longcoats have gone in and out of fashion over the years, but there is no denying their effectiveness when it comes to insulating a great portion of a wearer’s body comfortably. KihaCorp engineers have taken this advantage and spun it to its logical conclusion, filling this garment with the same kind of high-grade heat-exchangers that keep their ships running cool and quiet, allowing it to dissipate egregious amounts of thermal energy harmlessly.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 14000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.burning.resistanceValue = 50.0;
			
			this.version = _latestVersion;
		}	
	}
}
