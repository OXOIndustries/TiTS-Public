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
	
	public class LuciniteHoopPiercings extends ItemSlotClass
	{
		public function LuciniteHoopPiercings()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "LucHoops";
			this.longName = "Lucinite Hoop Set";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a double set of lucinite hoop piercings adorned with small pieces of savicite";
			
			this.tooltip = "A beautifully handcrafted double set of hoop piercings made of lucinite and designed by Kiona the korgonne jeweler. The rare teal material, along with the embedded savicite gems, skyrockets its worth as pure fashion accessories, thanks to the unique properties the lucinite metals. Together, the effects of the lucinite's heat absorption and the psionic lust emissions from the savicite are virtually nullified, making this top-quality jewelry. A delicately inscribed 'KK' at the backside of the piercings marks the signature of its expert maker.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 16000;
			
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_HOOP);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}