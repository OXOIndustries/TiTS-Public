package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class SleekParka extends ItemSlotClass
	{
		//Level 8 (Common). Balance 2.0
		//constructor
		public function SleekParka()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "S.Parka";
			
			//Regular name
			this.longName = "sleek parka";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a sleek parka";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This fashionable parka is designed to both keep the wearer warm and safe on rougher ski hills, whether on Uveto or any other icy planet. The blue-silver material is designed to resist tearing and keep body heat containment at a maximum. A malleable design allows larger chests to fit snugly in under the insulating fabric. A pair of snow goggles and a black diamond emblazoned ski mask are included.";
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 14000;
			this.attack = 0;
			this.defense = 3;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 6;
			
			resistances.freezing.resistanceValue = 50.0;
			
			this.version = _latestVersion;
		}
	}
}