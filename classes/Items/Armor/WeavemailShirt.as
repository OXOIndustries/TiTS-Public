package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class WeavemailShirt extends ItemSlotClass
	{
		//Level 7 (Common). Balance 2.0
		//constructor
		public function WeavemailShirt()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "WM Shirt";
			
			//Regular name
			this.longName = "weavemail shirt";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a weavemail shirt";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A surprisingly light shirt made of interwoven layers of woven spinarran filament mail and ballistic fiber. Almost completely bulletproof and resistant to heat. Mainly used as concealed armor or woven into clothing, it is the most basic of spinarran armor. Under the protective layers is a soft downy fur to help keep you warm.";
			// (moderate defence, moderate kinetic resistance, some thermal resistance)
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 7000;
			this.attack = 5;
			this.defense = 7;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.resolve = 2;
			this.critBonus = 2;
			this.evasion = 0;
			this.fortification = 0;
			
			//resistances.kinetic.resistanceValue = 20.0;
			resistances.freezing.resistanceValue = 16.0;
			//resistances.addFlag(DamageFlag.ABLATIVE);
			
			this.version = _latestVersion;
		}
	}
}