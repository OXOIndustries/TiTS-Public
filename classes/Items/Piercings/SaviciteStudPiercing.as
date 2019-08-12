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
	
	public class SaviciteStudPiercing extends ItemSlotClass
	{
		public function SaviciteStudPiercing()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "SavStud";
			this.longName = "Savicite Stud";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a ball stud piercing decorated with tiny pieces of savicite";
			
			this.tooltip = "A beautifully handcrafted ball stud piercing designed by Kiona the korgonne jeweler. The green gem is meticulously smoothed to the point that the glowing material practically shines against most light sources. While not as potent as the raw material, the psionic radiation from the savicite will leave your loins constantly warm to the touch. A delicately inscribed 'KK' at the base of the piercing marks the signature of its expert maker.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 5000;
			
			//addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_STUD);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}