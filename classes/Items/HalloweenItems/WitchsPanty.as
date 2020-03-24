package classes.Items.HalloweenItems
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.clearOutput;
	import classes.Characters.PlayerCharacter;
	
	//Level 6 Halloween Funsies.
	public class WitchsPanty extends ItemSlotClass
	{
		public function WitchsPanty()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "W.Panty";
			
			longName = "witch’s panties";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pair of black panties with shimmering markings";
			
			tooltip = "A pair of panties woven from black, silky cloth, decorated by angular runes. Shimmering and suggestive, these markings draw the eye as they dance upon the fabric.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 500;
			attack = 0;
			defense = 0;
			shields = 0;
			sexiness = 3;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			//resistances.burning.resistanceValue = -10.0;
			//resistances.freezing.resistanceValue = 10.0;
			
			// Note: Since the suit creates a stable environment any gaseous based damage wouldn't work against it.
			itemFlags = [];
			//itemFlags.push(GLOBAL.ITEM_FLAG_AIRTIGHT);
			
			version = _latestVersion;
		}
	}
}
