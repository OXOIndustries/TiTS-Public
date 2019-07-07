package classes.Items.Protection
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;	
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * @author Zavos
	 */
	
	public class ScrapShield extends ItemSlotClass
	{
		//Level 9 (common). Balance 2.0
		public function ScrapShield()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used on inventory buttons
			this.shortName = "Scrp Shield";
			
			//Regular name
			this.longName = "Scrap Shield";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a ramshackle shield generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Cobbled together from countless parts, this shield belt’s patchwork appearance belies it’s surprisingly efficient design.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null"; 
			
			//Information
			this.basePrice = 1200;
			this.attack = 0; 
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 50;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			
			resistances = new TypeCollection();
			resistances.kinetic.resistanceValue = 20.0;
			resistances.electric.resistanceValue = -30.0;
			
			
			this.version = _latestVersion;
		}
	}
}