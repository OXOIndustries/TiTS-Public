package classes.Items.Junk
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class SexbotChip extends ItemSlotClass
	{
		public function SexbotChip()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.GADGET;
			
			shortName = "SexbotChip";
			longName = "sexbot VI chip";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a sexbot VI chip";
			tooltip = "This is a chip that was in a sexbot; its AI and thoughts. It can probably be used to fix certain robots, but you don’t know how.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 200;
			
			isUsable = false;
			
			version = _latestVersion;
		}	
	}
}
