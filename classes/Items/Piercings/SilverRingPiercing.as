package classes.Items.Piercings
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class SilverRingPiercing extends ItemSlotClass
	{
		public function SilverRingPiercing()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "S.Ring";
			this.longName = "silver ring";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a silver ring";
			
			this.tooltip = "This silver ring is a classic, purely ornamental choice. Like all modern piercings, it is self-piercing and guaranteed sanitary for multiple uses. It has no effect beyond enhancing your own personal style.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 500;
			
			//addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_RING);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}