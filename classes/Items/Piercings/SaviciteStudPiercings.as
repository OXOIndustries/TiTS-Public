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
	
	public class SaviciteStudPiercings extends ItemSlotClass
	{
		public function SaviciteStudPiercings()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "SavStuds";
			this.longName = "Savicite Stud Set";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a triple set of ball stud piercings decorated with tiny pieces of savicite";
			
			this.tooltip = "A beautifully handcrafted triple set of ball stud piercings designed by Kiona the korgonne jeweler. The green gem is meticulously smoothed to the point that the glowing material practically shines against most light sources. While not as potent as the raw material, the psionic radiation from the green jewels will leave your loins constantly warm to the touch. A delicately inscribed 'KK' at the base of each piercing marks the signature of its expert maker.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 15000;
			
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_STUD);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}