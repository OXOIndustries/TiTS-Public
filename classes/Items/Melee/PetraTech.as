package classes.Items.Melee 
{
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class PetraTech extends PetraWhip 
	{
		
		public function PetraTech() 
		{
			this.tooltip += "\n\nIt seems ripe for modification and as [pc.aStartingCareer], you’ve been able to ";
			this.tooltip += "overcharge the current for more power.";
			this.shortName = "PhasicWhipT"; 
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			this.baseDamage.electric.damageValue += 10;
		}
		
	}

}