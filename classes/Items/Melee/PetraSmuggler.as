package classes.Items.Melee 
{
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class PetraSmuggler extends PetraWhip 
	{
		
		public function PetraSmuggler() 
		{
			this.tooltip += "\nIt seems ripe for modification and as a [pc.startingCareer], you’ve been able to ";
			this.tooltip += "strip down the model for a lighter, much more nimble build.";
			this.shortName = "PhasicWhipS"; 
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
		}
		
	}

}