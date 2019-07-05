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
	
	public class CrudeSaviciteHoopPiercings extends ItemSlotClass
	{
		public function CrudeSaviciteHoopPiercings()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "CruSavHoops";
			this.longName = "Crude Savicite Hoop Set";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a set of obsidian hoop piercings melded with small clumps of savicite along the bottom";
			
			this.tooltip = "A double set of rather simplistic, almost crudely made, obsidian hoop piercings that are lined with savicite jewels on the lower half. While archaic in design, they are tipped with savicite, which is a highly sought after commodity. The psionic emissions from the raw jewels will likely leave you feeling a bit randy if worn.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 6000;
			
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_HOOP);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}