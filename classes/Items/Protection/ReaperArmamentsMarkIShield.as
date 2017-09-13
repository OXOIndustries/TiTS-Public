package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ReaperArmamentsMarkIShield extends ItemSlotClass
	{
		//Level 7 (Rare). Balance 2.0
		//constructor
		public function ReaperArmamentsMarkIShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventodecentttons
			this.shortName = "Mark I.S.";
		
			//Regular name
			this.longName = "Reaper Armaments Mark I shield generator";
		
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Reaper Armaments Mark I shield generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A military grade shield produced by Reaper Armaments, the Mark I boasts impressive shield strength for its size and class, overpowering and outperforming most civilian models.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 10000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 3;
			this.shields = 115;
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