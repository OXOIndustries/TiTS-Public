package classes.Items.Apparel
{
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.ItemSlotClass;
	import classes.StringUtil;
	
	public class InsulatingBriefs extends ItemSlotClass
	{
		public function InsulatingBriefs()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "I.Briefs";
			longName = "insulating briefs";
			
			TooltipManager.addFullName(shortName,StringUtil.toTitleCase(longName));
			
			description = "a pair of insulating briefs";
			tooltip = "Boring and practical, these briefs incorporate JoyCo SmartHeat technology to retain body heat in frigid conditions. A warning on the inner tag states JoyCo is not responsible for sterility and other overheating-related problems experienced while wearing these briefs.";
			
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
