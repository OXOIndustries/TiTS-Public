package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class EmpusaThreads extends ItemSlotClass
	{
		public function EmpusaThreads()
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ARMOR;
			
			shortName = "E.Threads";
			longName = "Empusa threads";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a flashy, protective outfit of Empusa design";
			tooltip = "This outfit consists of a shawl over a flowing shirt and bell bottom pants. Woven from transparent seil silk, this outfit will conceal nothing. The cloth shimmers in the light, covering the wearer in a subtle prismatic glow that draws the eyes.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 11000;
			attack = 6;
			defense = 4;
			shieldDefense = 0;
			shields = 0;
			sexiness = 5;
			critBonus = 0;
			evasion = 9;
			fortification = 0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_TRANSPARENT);
			
			version = _latestVersion;
		}
	}
}