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
	
	public class LuciniteBarPiercing extends ItemSlotClass
	{
		public function LuciniteBarPiercing()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			this.shortName = "LucBar";
			this.longName = "Lucinite Bar";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a lucinite bar piercing tipped with savicite";
			
			this.tooltip = "A beautifully handcrafted bar piercing made of lucinite and designed by Kiona the korgonne jeweler. The rare teal material, along with the embedded savicite gems lining the sides, skyrockets its worth as a pure fashion accessory, thanks to the unique properties the lucinite metals. Together, the effects of the lucinite's heat absorption and the psionic lust emissions from the savicite are virtually nullified, making this top-quality jewelry. A delicately inscribed 'KK' at the middle of the piercing marks the signature of its expert maker.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 8000;
			
			//addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_BAR);
			//addFlag(GLOBAL.ITEM_FLAG_NO_REMOVE);
			
			this.version = _latestVersion;
		}
	}
}