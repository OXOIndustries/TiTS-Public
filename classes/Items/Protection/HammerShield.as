package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class HammerShield extends ItemSlotClass
	{
		//Level 4 (Rare). Balance 2.0
		//constructor
		public function HammerShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventodecentttons
			this.shortName = "H.Shield";
		
			//Regular name
			this.longName = "'Hammer' shield";
		
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a 'Hammer' shield belt";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This shield generator is designed and produced by Reaper Armaments to stand up the guns of the same name. The line was discontinued due to poor sales, owing to its above-average production costs and failure to secure a contract with the Peacekeepers.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1200;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 2;
			this.shields = 70;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.kinetic.resistanceValue = 45.0;
			resistances.electric.resistanceValue = -50.0;
			
			this.version = _latestVersion;
		}
	}
}