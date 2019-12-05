package classes.Items.Armor 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.StringUtil;
	
	public class SpacesuitIncomplete extends ItemSlotClass
	{
		public function SpacesuitIncomplete() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ARMOR;
			
			shortName = "Spacesuit(I)";
			
			longName = "incomplete spacesuit";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "an incomplete spacesuit";
			
			tooltip = "This is <i>most</i> of a spacesuit. It’s missing a helmet. Somebody’s stenciled in a white skull and crossbones on the shoulders, and a smiley face smoking a cigar on the chest. <b>If you find a helmet, you can use it to complete the suit.</b>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "null";
			
			basePrice = 500;
			attack = 0;
			defense = 2;
			shieldDefense = 0;
			shields = 0;
			sexiness = -3;
			critBonus = 0;
			evasion = 0;
			fortification = 10;
			
			version = _latestVersion;
		}
	}
}
