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
	public class WitchsCorset extends ItemSlotClass
	{
		public function WitchsCorset()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			
			type = GLOBAL.UPPER_UNDERGARMENT;
			
			shortName = "W.Corset";
			
			longName = "witch’s corset";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a black silk and leather corset";
			
			tooltip = "Woven from black, silky cloth, this corset seems to ripple like water as it flows upon the wearer. Atop this piece is a shiny leather “bra”, fitted with hidden mechanisms that will cause the corset to fasten or unfasten to match the buckle upon the garment’s leather crown.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 1000;
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
