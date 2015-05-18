package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ReaperArmamentsMarkIIShield extends ItemSlotClass
	{
		
		//constructor
		public function ReaperArmamentsMarkIIShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventodecentttons
			this.shortName = "Mark IIS";
		
			//Regular name
			this.longName = "Reaper Armaments Mark II shield generator";
		
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Reaper Armaments Mark II shield generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A military grade shield produced by Reaper Armaments, the Mark II boasts improved resilience at the cost of reduced resistance to physical threat and vulnerability to electrical attacks. Luckily, most militaries favor lasers and plasma over electron weapons.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 6000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 100;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.kinetic.resistanceValue = 30.0;
			resistances.electric.resistanceValue = -50.0;
			
			this.version = _latestVersion;
		}
	}
}