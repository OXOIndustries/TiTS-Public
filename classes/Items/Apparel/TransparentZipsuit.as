package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * Swapped in and out of Annos statblock to determine her state/type of dress.
	 * @author Gedan
	 */
	public class TransparentZipsuit extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		public function TransparentZipsuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "T.Zipsuit";
			
			this.longName = "transparent zipsuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a sexy transparent zipsuit";
			
			this.tooltip = "This completely transparent body suit leaves very little to the imagination. From the neck downward it covers the body in a plastic sheen, hiding the nipples and genitals with well-placed zips.\n\nThe main zip starts just above the crotch, runs between the thighs and up the spine to the neckline. Meanwhile two others start at and cover the nipples, unzipping out and under the arms. There are also zips down the sides of the arms and legs.\n\nDespite the fact it is incredibly revealing, it is actually made of a transparent siel silk and fracton weave. It is actually more protective than most stock standard armor. However, its incredibly supple texture rubs the body and makes the wearer more prone to arousal.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 3700;
			this.attack = 0;
			this.defense = 7;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 2;
			this.fortification = 0;
			
			resistances.electric.resistanceValue = 40.0;
			resistances.burning.resistanceValue = 15.0;
			resistances.tease.resistanceValue = -15.0;
			resistances.pheromone.resistanceValue = -10.0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_TRANSPARENT);
			
			this.version = this._latestVersion;
		}
	}
}
