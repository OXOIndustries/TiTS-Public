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
	
	public class SaviciteHoopPiercing extends ItemSlotClass
	{
		public function SaviciteHoopPiercing()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "SavHoop";
			this.longName = "Savicite Hoop";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "an obsidian hoop piercing adorned with small pieces of savicite";
			
			this.tooltip = "A beautifully handcrafted hoop piercing designed by Kiona the korgonne jeweler. The green gem is meticulously smoothed to the point that the glowing material shines against most light sources. While not as potent as the raw material, the psionic radiation from the green jewels will leave your loins constantly warm to the touch. A delicately inscribed 'KK' on the inside area of the piercing marks the signature of its expert maker.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 5000;
			
			//addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_HOOP);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}