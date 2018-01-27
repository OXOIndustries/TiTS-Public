package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class SlutSealThong extends ItemSlotClass
	{
		//constructor
		public function SlutSealThong()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "SS-Thong";
			
			//Regular name
			this.longName = "Slut-Seal Thong";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a TamaniCorp Slut-Seal Thong";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "TamaniCorp took the classic, simple-but-erotic thong and said, <i>“We can do better.”</i> Not only did they make the fabric thinner and more transparent, but they also impregnated the seams with custom-programmed nanite-scale machinery. When the Slut-Seal Thong detects the presence of a suitable feminine orifice, the embedded microbes will harvest imperceptible amounts of sexual secretions to convert into an epidermis-friendly bonding agent. Slippage isn’t a problem with the Slut-Seal Thong, and more importantly, the fruits of your sexual labors will stay tightly bottled inside you, where they belong.\n\nLike Tamani says, <i>“Happiness is a full womb!”</i>\n\nA warning on the tag states, <i>“Slut seal not guaranteed for fluid quantities over 250L.”</i>";
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 3500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR,GLOBAL.ITEM_FLAG_VAGINALLY_SEALED,GLOBAL.ITEM_FLAG_TRANSPARENT];
			
			this.version = _latestVersion;
		}
	}
}
