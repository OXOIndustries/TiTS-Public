package classes.Items.Piercings
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class SaviciteCockring extends ItemSlotClass
	{
		public function SaviciteCockring()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.COCKWEAR;
			
			this.shortName = "S.C.Ring";
			this.longName = "Savicite Cockring";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a glowing green cockring made entirely out of savicite";
			
			this.tooltip = "A vivid green, faintly glowing cockring, enhanced with the natural lust-making qualities of savicite! It is made with natural rubber-like polymers that allow the ring to be adjusted to a surprisingly large girth if needed. While not as potent as the pure material, the savicite’s properties help boost and promote a healthy blood flow to the penis throughout intercourse, and thereafter. Guaranteed to hold and keep a rock-hard erection for as long as you wear it! Great stimulator for your partner(s) as well! A delicately inscribed signature etched into the ring reads: KK.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 25000;
			
			addFlag(GLOBAL.ITEM_FLAG_COCKRING);
			addFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL);
			
			this.version = _latestVersion;
		}
	}
}