package classes.Items.Piercings
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class GeddaniumRingPiercing extends ItemSlotClass
	{
		public function GeddaniumRingPiercing()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "Ged. Ring";
			this.longName = "geddanium ring";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a geddanium ring";
			
			this.tooltip = "This ring-shaped piercing bears a bright red stone of hyper-concontrated geddanium, a gemstone favored by scaled creatures the galaxy over. While wearing any geddanium piercings, teasing scaly foes will be more effective - but your scaled opponents will deal 30% more tease damage to you.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 4000;
			
			//addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_RING);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}