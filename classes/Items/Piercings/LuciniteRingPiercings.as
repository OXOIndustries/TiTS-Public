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
	
	public class LuciniteRingPiercings extends ItemSlotClass
	{
		public function LuciniteRingPiercings()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "LucRings";
			this.longName = "Lucinite Ring Set";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a triple set of lucinite ring piercings lined with savicite";
			
			this.tooltip = "A beautifully handcrafted triple set of ring piercings made of lucinite and designed by Kiona the korgonne jeweler. The rare teal material, along with the embedded savicite gems, skyrockets its worth as pure fashion accessories, thanks to the unique properties the lucinite metals. Together, the effects of the lucinite's heat absorption and the psionic lust emissions from the savicite are virtually nullified, making this top-quality jewelry. A delicately inscribed 'KK' on the inside loop of the piercings marks the signature of its expert maker.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 24000;
			
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_RING);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}