package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class ArmstrongSuitBlue extends ItemSlotClass
	{
		public function ArmstrongSuitBlue()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			
			type = GLOBAL.ARMOR;
			
			shortName = "AZA Suit";
			
			longName = "azure Armstrong space suit";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a blue space suit of a retro, sexy design";
			
			tooltip = "The Azure Armstrong Space Suit is a blue outfit with an apparatus on the top that creates a bubble-like force field. The suit itself leaves little to the imagination, with its skin-tight, ultra-stretchy fabric, designed to both accentuate your form and act as a barrier from the elements. On the back sits a medium pack that creates a breathable environment and houses proprietary defense box technology. The Azure version bolsters existing shields against certain temperature-based phenomena.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 2400;
			attack = 0;
			defense = 3;
			shields = 5;
			sexiness = 3;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			resistances.burning.resistanceValue = 15.0;
			resistances.freezing.resistanceValue = 15.0;
			
			resistances.pheromone.resistanceValue = 100.0;
			
			// Note: Since the suit creates a stable environment any gaseous based damage wouldn't work against it.
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_AIRTIGHT);
			
			version = _latestVersion;
		}
	}
}
