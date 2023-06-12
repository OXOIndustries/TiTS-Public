package classes.Items.Apparel
{
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.ItemSlotClass;
	import classes.StringUtil;
	
	public class InsulatingUndershirt extends ItemSlotClass
	{
		public function InsulatingUndershirt()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.UPPER_UNDERGARMENT;
			
			shortName = "I.Ushirt";
			longName = "insulating undershirt";
			
			TooltipManager.addFullName(shortName,StringUtil.toTitleCase(longName));
			
			description = "an insulating undershirt";
			tooltip = "Boring and practical, this shirt incorporates JoyCo SmartHeat technology to retain body heat in frigid conditions. A warning on the inner collar states JoyCo is not responsible for heat stroke and other overheating-related problems experienced while wearing this shirt.";
			
			TooltipManager.addTooltip(shortName,tooltip);
			
			basePrice = 200;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			this.resolve = 3;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			resistances.burning.resistanceValue = -10;
			resistances.freezing.resistanceValue = 10;
			
			version = _latestVersion;
		}
	}
}
