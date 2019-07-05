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
	
	public class CrudeSaviciteBarPiercings extends ItemSlotClass
	{
		public function CrudeSaviciteBarPiercings()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "CruSavBars";
			this.longName = "Crude Savicite Bar Set";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a triple set of obsidian bar piercings with savicite tipped ends";
			
			this.tooltip = "A triple set of simple looking obsidian bar piercings with the ends tipped with savicite. While archaic in design, they are tipped with savicite, which is a highly sought after commodity. The psionic emissions from the raw jewels will likely leave you feeling a bit randy if worn.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 3000;
			
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_BAR);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}