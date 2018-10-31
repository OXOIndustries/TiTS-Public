package classes.Items.Piercings
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class OpalRingPiercing extends ItemSlotClass
	{
		public function OpalRingPiercing()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "Opal Ring";
			this.longName = "opal ring";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "an opal ring";
			
			this.tooltip = "This pearly piercing is supposedly loaded with a payload of subtly-dispensed, orgasm-enhancing microsurgeons. Wearing it on appropriate genitalia should result in more voluminous ejaculations.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 4000;
			
			//addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_RING);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}