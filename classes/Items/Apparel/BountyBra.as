package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;

	public class BountyBra extends ItemSlotClass
	{

		//constructor
		public function BountyBra()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "Bounty Bra";
			
			//Regular name
			this.longName = "bounty bra";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bounty bra";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A New Texan favorite, this sheer JoyCo maternity bra doesn’t leave much to the imagination, especially when the latexy material gets soaked with milk until it’s all but see-through. Thankfully, it’s almost completely leak-resistant. Several small battery-powered vibrators line the undercarriage, acting as a constant low-intensity breast massage to aid in lactation. According to the label on the back, JoyCo guarantees you’ll never stop lactating as long as you wear the Bounty Bra.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 3500;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}
	}
}