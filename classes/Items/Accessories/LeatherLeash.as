package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.StringUtil;
	
	public class LeatherLeash extends ItemSlotClass
	{
		
		
		public function LeatherLeash() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ACCESSORY;
			
			shortName = "Leash";
			
			longName = "leather leash";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a black leather leash";
			
			tooltip = "Of course, your run-of-the-mill leashes these days are wireless. This 20-foot long tether of strong, flexible black leather tipped with an adaptable steel clasp is for traditionalists - or for owners who want to make very clear who the party at the other end belongs to. The leather retracts back into a satisfyingly hefty steel handle and can be frozen at any length at the press of a button, allowing for close control.";
			
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
			fortification = 0;
			
			version = _latestVersion;
		}
	}
}
