package classes.Items.Protection
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class HeatBelt extends ItemSlotClass
	{
		
		//constructor
		public function HeatBelt()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventory buttons
			this.shortName = "HeatBelt";
			
			//Regular name
			this.longName = "basic heat belt";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a basic heat belt";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An Akkadi-brand personal heating device, worn as a belt to generate a field of warmth around the user. While it won't protect from the elements per se, it will allow you to traverse extremely cold environments without too much discomfort.\n\nNote: <b>Heat Belts are worn in the same slot as personal shields.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 250;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.freezing.resistanceValue = 25.0;
			resistances.burning.resistanceValue = 25.0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_HEATBELT);
			
			this.version = _latestVersion;
		}
	}
}