package classes.Items.Armor 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.StringUtil;
	
	public class SpacesuitComplete extends ItemSlotClass
	{
		public function SpacesuitComplete() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ARMOR;
			
			shortName = "Spacesuit";
			
			longName = "pirate spacesuit";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pirate’s spacesuit";
			
			tooltip = "Somebody’s stenciled in a white skull and crossbones on the shoulders, and a smiley face smoking a cigar on the chest. An old style bubble helmet provides high visibility in exchange for less than perfect durability, but it’ll protect you from vacuum.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "null";
			
			basePrice = 1500;
			attack = 0;
			defense = 2;
			shieldDefense = 0;
			shields = 20;
			sexiness = -3;
			this.resolve = 5;
			critBonus = 0;
			evasion = 0;
			fortification = 20;
			itemFlags = [GLOBAL.ITEM_FLAG_AIRTIGHT];
			itemFlags = [GLOBAL.ITEM_FLAG_PRESSURIZED];

			resistances.freezing.resistanceValue = 20.0;
			resistances.burning.resistanceValue = 19.0;
			
			version = _latestVersion;
		}
	}
}
