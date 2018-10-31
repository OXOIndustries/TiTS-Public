package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.StringUtil;
			
	public class GrunchLeash extends ItemSlotClass
	{
		public function GrunchLeash() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ACCESSORY;
			
			shortName = "G.Leash";
			
			longName = "grunch leash";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a grunch leash";
			
			tooltip = "This leash leads back to the mount you rented from Maja. Sadly, it won’t belch acid in combat like its younger kin. It also isn’t quite as fast as a kor’diiak or a nog’wich. However, if you need a brief sprint to carry you out of combat in a hurry, nothing beats a grunch.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "null";
			
			basePrice = 0;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			//droneAttack = grunchAttack;
			
			//addFlag(GLOBAL.ITEM_FLAG_INTERNAL_POWER);
			//addFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE);
			
			version = _latestVersion;
		}
	}
}
