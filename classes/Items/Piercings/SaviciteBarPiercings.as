	/**
	 * Written by Lkynmbr24
	 * @author DrunkZombie
	 */

package classes.Items.Piercings
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class SaviciteBarPiercings extends ItemSlotClass
	{
		public function SaviciteBarPiercings()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "SavBars";
			this.longName = "Savicite Bar Set";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a set of obsidian bar piercings tipped with savicite";
			
			this.tooltip = "A beautifully handcrafted triple bar piercing set designed by Kiona the korgonne jeweler. The glowing is meticulously smoothed to the point that the glowing material shines against most light sources. Several tiny pieces of intricately carved savicite are also set into the ends, giving these trinkets a soft green glow. While not as potent as the raw material, the psionic radiation from the green jewels will leave your loins constantly warm to the touch. A delicately inscribed 'KK' on the inside area of the piercing marks the signature of its expert maker.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 15000;
			
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_BAR);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}