package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.StringUtil;
	
	public class ShieldAugBracers extends ItemSlotClass
	{
		public function ShieldAugBracers() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ACCESSORY;
			
			shortName = "Sh.Bracs";
			
			longName = "shield aug bracers";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pair of shield aug bracers";
			
			tooltip = "These thick metal bracers cover the arm all the way from the wrist to the midpoint of the forearm. Inside is the gleaming housing is a web of dense circuitry, embedded antennas, and multiple, redundant power packs. When turned on they significantly supplement projected shields.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "null";
			
			basePrice = 35000;
			attack = 0;
			defense = 0;
			shieldDefense = 1;
			shields = 50;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);

			version = _latestVersion;
		}
	}
}
