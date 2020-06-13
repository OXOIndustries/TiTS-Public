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
	public class WitchsRobe extends ItemSlotClass
	{
		public function WitchsRobe()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			
			type = GLOBAL.CLOTHING;
			
			shortName = "Witch.R";
			
			longName = "witch’s robe";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a witch’s robe";
			
			tooltip = "Equal parts fantasy and fetish, this witch costume is equally suited for a mythos convention or a stripper pole. The bulk of the outfit consists of a pointed witch’s hat and a black velvet robe, and comes with an array of burnished leather accessories beneath its lavish exterior. This outfit makes no attempt to cover the chest or groin, allowing for a more sinful appearance if you forgo the companion pieces.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 1000;
			attack = 0;
			defense = 0;
			shields = 0;
			sexiness = 5;
			critBonus = 10;
			evasion = 12;
			fortification = 0;
			
			resistances.burning.resistanceValue = -10.0;
			resistances.tease.resistanceValue = 10.0;
			
			// Note: Since the suit creates a stable environment any gaseous based damage wouldn't work against it.
			itemFlags = [];
			//itemFlags.push(GLOBAL.ITEM_FLAG_AIRTIGHT);
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_GROIN);
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
			
			version = _latestVersion;
		}
	}
}
