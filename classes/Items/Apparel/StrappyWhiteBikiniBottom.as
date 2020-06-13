package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class StrappyWhiteBikiniBottom extends ItemSlotClass
	{
		public function StrappyWhiteBikiniBottom()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "W.BkniBtm";
			
			longName = "strappy white bikini bottom";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a strappy white bikini bottom";
			
			tooltip = "This white, strappy little number is made from premium ultralastic, allowing to tightly wrap anything from the a petite heiny to a leithan’s bulky hindquarters. Its glossy pigmentation (or lack thereof) is eyecatching without being outright slutty.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 900;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			sexiness = 2;
			this.resolve = 1;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			
			version = _latestVersion;
		}
	}
}
