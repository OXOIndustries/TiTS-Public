package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;

	public class CowPrintLeotard extends ItemSlotClass
	{

		//constructor
		public function CowPrintLeotard()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "Cow Leotard";
			
			//Regular name
			this.longName = "cow-print leotard";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a cow-print leotard";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This tight, form-hugging leotard leaves the legs and arms completely exposed and works hard to emphasize the bust - not that it takes much effort, given the target audience for this particular bovine fashion statement. The primarily white, catsuit-like material has several black splotches across it, giving the wearer the distinctive appearance of a dairy cow. Handy buttons over the teats allow for easy milking. It may not offer much in the way of protection, but it makes up for that in sex appeal.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 800;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}
	}
}