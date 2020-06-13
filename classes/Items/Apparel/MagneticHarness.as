package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MagneticHarness extends ItemSlotClass
	{

		//constructor
		public function MagneticHarness()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "M.Harness";
			
			//Regular name
			this.longName = "magnetic harness";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a black leather harness with a set of magnetic clasps";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A black leather harness that wraps around the wearer’s body and limbs. Each of the loops has a strategically positioned magnetic locking device, allowing the straps to be locked together."
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 3900;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
			//itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_GROIN);
			//itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
			
			this.version = _latestVersion;
		}
	}
}
