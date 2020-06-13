package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class StrixThreads extends ItemSlotClass
	{
		//Level 7 Common
		public function StrixThreads()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ARMOR;
			
			shortName = "S.Threads";
			longName = "Strix threads";
			
			TooltipManager.addFullName(shortName,StringUtil.toTitleCase(longName));
			
			description = "a flashy, protective outfit of Strix design";
			tooltip = "This outfit consists of a hoodie, cargo pants and boots. The entire getup is baggy, yet light and easy to move around in. The hood is unusually deep, shrouding your face in darkness when raised. The entire outfit is made of seil silk, providing protection rivaling bulletproof vests.";
			
			TooltipManager.addTooltip(shortName,tooltip);
			
			basePrice = 11000;
			attack = 0;
			defense = 4;
			shieldDefense = 0;
			shields = 0;
			sexiness = 3;
			this.resolve = 2;
			critBonus = 0;
			evasion = 8;
			fortification = 0;
			
			itemFlags = [];
			resistances.addFlag(DamageFlag.ABLATIVE);
			
			version = _latestVersion;
		}
	}
}
