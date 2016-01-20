package classes.Items.Protection
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class SalamanderShield extends ItemSlotClass
	{
		
		//constructor
		public function SalamanderShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventory buttons
			this.shortName = "S.Shield";
			
			//Regular name
			this.longName = "Salamander Class Shield Generator";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Salamander Class Shield Generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A product of KihaCorp, Salamander Class Shield Generators are designed to be specifically resistant to thermal energies. They are favored for use against laser weaponry, plasma weaponry, and in climes that would reduce the efficiency of lesser models.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 9999;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 50;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.electric.resistanceValue = -20.0;
			resistances.kinetic.resistanceValue = 20.0;
			resistances.burning.resistanceValue = 40.0;
			
			this.version = _latestVersion;
		}
	}
}