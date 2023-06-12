package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	//Level 6 (Common). Balance 2.0
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
			
			basePrice = 3500;
			attack = 0;
			defense = 2;
			shields = 15;
			sexiness = 4;
			this.resolve = 1;
			critBonus = 0;
			evasion = 4;
			fortification = 0;
			
			resistances.burning.resistanceValue = 10.0;
			resistances.freezing.resistanceValue = 10.0;
			
			// Note: Since the suit creates a stable environment any gaseous based damage wouldn't work against it.
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_AIRTIGHT);
			
			version = _latestVersion;
		}
	}
}
