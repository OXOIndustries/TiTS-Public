package classes.Items.Protection
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ArcticWarfareBelt extends ItemSlotClass
	{
		
		//constructor
		public function ArcticWarfareBelt()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventory buttons
			this.shortName = "AW Belt";
			
			//Regular name
			this.longName = "arctic warfare belt";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an arctic warfare heat belt";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A Reaper-Akkadi designed belt, meant to protect special forces soldiers in ultra-cold-weather theaters during the last generation. Combines a personal heat generator and a low-grade kinetic shield for maximum protection.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 10000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 25;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.freezing.resistanceValue = 40.0;
			resistances.burning.resistanceValue = 40.0;
			
			this.version = _latestVersion;
		}
	}
}