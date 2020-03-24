package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class FrillyBikiniTop extends ItemSlotClass
	{
		public function FrillyBikiniTop()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.UPPER_UNDERGARMENT;
			
			shortName = "BikiniTop";
			
			longName = "frilly bikini top";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a small frilly pink bikini top";
			
			tooltip = "This teeny-weeny but very elastic pink waterproof bra has frills along its seams which will bob gaily as you move... probably more so the bigger your boobs are. Scandalous stuff.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 900;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			sexiness = 3;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			
			version = _latestVersion;
		}
	}
}
