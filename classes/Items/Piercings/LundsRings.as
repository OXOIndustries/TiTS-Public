package classes.Items.Piercings
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class LundsRings extends ItemSlotClass
	{
		public function LundsRings()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "L.Rings";
			this.longName = "Lund’s golden rings";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a set of korgonne-crafted gold rings";
			
			this.tooltip = "You can see inscriptions along the inside of these golden bands written in korgonne script. Lund only smiled when you asked him what they said, but you’re pretty sure you have a good idea. At least no-one else will know unless you tell them.\n\nYou’re fairly confident an ornament like this will attract more male korgonne in the wild.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 4000;
			
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_RING);
			addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}