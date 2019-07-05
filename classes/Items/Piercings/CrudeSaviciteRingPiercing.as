	/**
	 * Written by Freed85 and Lkynmbr24
	 * @author DrunkZombie
	 */

package classes.Items.Piercings
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class CrudeSaviciteRingPiercing extends ItemSlotClass
	{
		public function CrudeSaviciteRingPiercing()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "CruSavRing";
			this.longName = "Crude Savicite Ring";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "an obsidian ring piercing, tipped with savicite";
			
			this.tooltip = "A simplistic looking obsidian ring piercing with a small clump of savicite melded into the fitting. While archaic in design, it is tipped with savicite, a highly sought after commodity. The psionic emissions from the raw jewels will likely leave you feeling a bit randy if worn.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 3000;
			
			//addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_RING);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}