package classes.Items.Armor.Unique
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class OmnisuitCollar extends ItemSlotClass
	{
		public function OmnisuitCollar()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			
			type = GLOBAL.ARMOR;
			
			shortName = "O.Collar";
			
			longName = "omnisuit's metal storage collar";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "an omnisuit's metal storage collar";
			
			tooltip = "This shining metal collar is the container for a prototype omnisuit - a high tech garment that flows out to cover one's body in a shining black covering - genitalia and all. The resulting suit provides a modest amount of physical protection - and enhanced sensations for the bedroom.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 500;
			attack = 0;
			defense = 1;
			shields = 5;
			sexiness = 0;
			critBonus = 0;
			evasion = 5;
			fortification = 0;
			
			resistances.burning.resistanceValue = 15.0;
			resistances.electric.resistanceValue = 15.0;
			resistances.corrosive.resistanceValue = 15.0;
			resistances.tease.resistanceValue = -25.0;
			
			// Note: Since the suit creates a stable environment any gaseous based damage wouldn't work against it.
			itemFlags = [GLOBAL.ITEM_FLAG_EXPOSE_FULL];
			//itemFlags.push(GLOBAL.ITEM_FLAG_AIRTIGHT);
			
			version = _latestVersion;
		}
	}
}
