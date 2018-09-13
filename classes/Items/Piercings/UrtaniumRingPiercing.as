package classes.Items.Piercings
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class UrtaniumRingPiercing extends ItemSlotClass
	{
		public function UrtaniumRingPiercing()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "UrtaRing";
			this.longName = "urtanium ring";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "an urtanium ring";
			
			this.tooltip = "This ring-shaped piercing is made of highly processed urtanium, a mineral recognizable for its alternating stripes of matte gray and glossy back. Fur-bearing races often prize this stone, leading some to theorize that it produces a kind of latent, psychic radiation. Most scholars have dismissed this supposed effect as mere superstition. Nevertheless, wearing this ring will make teasing enemies with full-body fur more effective - in exchange for taking 30% more damage from their teases.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 4000;
			
			//addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_RING);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}