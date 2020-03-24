package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class FrillyBikiniBottom extends ItemSlotClass
	{
		public function FrillyBikiniBottom()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "BikiniBtm";
			
			longName = "frilly bikini bottom";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a small frilly pink bikini bottom";
			
			tooltip = "This teeny-weeny but very elastic pair of pink waterproof panties has frills on its string which will bob gaily as you move... probably more so the bigger your butt is. Scandalous stuff.";
			
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
