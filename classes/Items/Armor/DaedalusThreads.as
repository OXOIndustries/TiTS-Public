package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class DaedalusThreads extends ItemSlotClass
	{
		public function DaedalusThreads()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ARMOR;
			
			shortName = "D.Threads";
			longName = "Daedalus threads";
			
			TooltipManager.addFullName(shortName,StringUtil.toTitleCase(longName));
			
			description = "a flashy, protective outfit of Deadalus design";
			tooltip = "This outfit consists of a hooded lab coat, jeans and boots. The lab coat is slate grey, adorned by an intricate circuit board pattern in silver thread. Though durable, the layered silk is soft enough to be worn without an undershirt. The jeans are fitted with a secondary, lighter shield belt, supplying additional power for your shield.";
			
			TooltipManager.addTooltip(shortName,tooltip);
			
			basePrice = 11000;
			attack = 0;
			defense = 4;
			shieldDefense = 0;
			shields = 50;
			sexiness = 5;
			critBonus = 0;
			evasion = 3;
			fortification = 0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
			//itemFlags.push(GLOBAL.ITEM_FLAG_TRANSPARENT);
			
			version = _latestVersion;
		}
	}
}
