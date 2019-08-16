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
	
	public class CrudeSaviciteHoopPiercing extends ItemSlotClass
	{
		public function CrudeSaviciteHoopPiercing()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "CruSavHoop";
			this.longName = "Crude Savicite Hoop";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "an obsidian hoop piercing melded with small clumps of savicite along the bottom";
			
			this.tooltip = "A simplistic, almost crudely made, obsidian hoop piercing that is lined with savicite jewels on the lower half. While archaic in design, it is tipped with savicite, a highly sought after commodity. The psionic emissions from the raw jewels will likely leave you feeling a bit randy if worn.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 3000;
			
			//addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_HOOP);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}