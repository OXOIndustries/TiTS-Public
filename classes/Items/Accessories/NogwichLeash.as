package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.StringUtil;
	
	public class NogwichLeash extends ItemSlotClass
	{
		
		
		public function NogwichLeash() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ACCESSORY;
			
			shortName = "NW.Leash";
			
			longName = "nog’wich leash";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a nog’wich leash";
			
			tooltip = "This leash leads back to the nog’wich you rented from Maja in Korg’ii Hold. So long as you equip it in your accessory slot, you will ride it, greatly reducing travel time.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "null";
			
			basePrice = 5000;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			version = _latestVersion;
		}
	}
}
