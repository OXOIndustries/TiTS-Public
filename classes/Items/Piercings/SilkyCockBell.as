package classes.Items.Piercings
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class SilkyCockBell extends ItemSlotClass
	{
		public function SilkyCockBell()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.COCKWEAR;
			
			this.shortName = "S.CockBell";
			this.longName = "silky cock bell";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a bell attached to a silk loop";
			
			this.tooltip = "A round, golden bell attached to a little loop of pink silk. It could be looped around a finger - or around a particularly small penis.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 1000;
			
			addFlag(GLOBAL.ITEM_FLAG_COCKSOCK);
			addFlag(GLOBAL.ITEM_FLAG_SMALL_DICK_ONLY);
			
			this.version = _latestVersion;
		}
	}
}