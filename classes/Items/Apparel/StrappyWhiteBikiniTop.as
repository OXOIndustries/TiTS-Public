package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class StrappyWhiteBikiniTop extends ItemSlotClass
	{
		public function StrappyWhiteBikiniTop()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.UPPER_UNDERGARMENT;
			
			shortName = "W.BkniTop";
			
			longName = "strappy white bikini top";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a strappy white bikini top";
			
			tooltip = "All white bikinis are an uncommon fashion choice for terrans but quite popular among the darker-skinned races of the galaxy. This one has a number of fashionable white straps and a glossy finish that screams, “Look over here” while allowing its wearer a modicum of propiety. The ultralastic material is capable of stretching to contain everything from cute little bee-stings to a pair of XXL New Texan milk-tanks.";
			
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
