package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;

	public class SlepraDownBra extends ItemSlotClass
	{

		//constructor
		public function SlepraDownBra()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "Featherbra";
			
			//Regular name
			this.longName = "slepra down bra";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a slepra down bra";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A brassiere made from the down of the slepra hawks on Griston VI. The plush interior is designed to keep chests of all sizes warm and comfortable during travels. The outside is plentifully bestrewn with full, white feathers, providing a provocative display for use in the bedroom.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 1200;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.freezing.resistanceValue = 5.0;
			
			this.version = _latestVersion;
		}
	}
}