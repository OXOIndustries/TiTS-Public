package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;

	public class HardlightAGBra extends ItemSlotClass
	{

		//constructor
		public function HardlightAGBra()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "HL Bra";
			
			//Regular name
			this.longName = "hardlight anti-grav bra";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a hardlight, anti-gravity bra";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A sleek metallic necklace fitted with a hard light projector. Upon activation it coats the wearer’s bust in dazzling sapphire light, leaving the breasts in full view as they press against the transparent glow. Guaranteed to fit all sizes, and to help prevent heftier chests from sagging on high gravity planets.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 2000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_TRANSPARENT);
			
			this.version = _latestVersion;
		}
	}
}