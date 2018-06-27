package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.StringUtil;
	
	public class MaikesCollar extends ItemSlotClass
	{
		public function MaikesCollar() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ACCESSORY;
			
			shortName = "Sl.Collar";
			
			longName = "primitive slave collar";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a primitive slave collar";
			
			tooltip = "This slave collar is a cheap but effective method of motivating slave workers. Cheap circuitry housed in a durable, remote-locking package allows for easy dispensation of motivation - primarily in the form of electric shock.\n\n<b>So long as you're a disobediant adventurer, you won't be able to regain HP or energy by resting!</b>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "null";
			
			basePrice = 100;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = -10;
			
			addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);

			version = _latestVersion;
		}
	}
}
